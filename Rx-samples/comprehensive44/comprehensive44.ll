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


%Agent = type { i32, i32, i32, i32, i32, i32, i32 }

define void @init_world([64 x [64 x i32]]* %0, [32 x %Agent]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%15, %_5.while.exit.1]                           ; inst 2
  %3 = icmp slt i32 %2, 64                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%14, %_4.while.body.1]                      ; inst 6
  %5 = icmp slt i32 %4, 64                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %6 = sext i32 %2 to i64                                                          ; inst 9
  %7 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %0, i32 0, i64 %6       ; inst 10
  %8 = sext i32 %4 to i64                                                          ; inst 11
  %9 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %8                     ; inst 12
  %10 = mul i32 %2, %4                                                             ; inst 13
  %11 = add i32 %10, %2                                                            ; inst 14
  %12 = add i32 %11, %4                                                            ; inst 15
  %13 = srem i32 %12, 100                                                          ; inst 16
  store i32 %13, i32* %9                                                           ; inst 17
  %14 = add i32 %4, 1                                                              ; inst 18
  br label %_3.while.cond.1                                                        ; inst 19
_5.while.exit.1:
  %15 = add i32 %2, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  br label %_7.while.cond.2                                                        ; inst 22
_7.while.cond.2:
  %16 = phi i32 [0, %_6.while.exit.0], [%37, %_8.while.body.2]                     ; inst 23
  %17 = icmp slt i32 %16, 32                                                       ; inst 24
  br i1 %17, label %_8.while.body.2, label %_9.while.exit.2                        ; inst 25
_8.while.body.2:
  %18 = sext i32 %16 to i64                                                        ; inst 26
  %19 = getelementptr [32 x %Agent], [32 x %Agent]* %1, i32 0, i64 %18             ; inst 27
  %20 = getelementptr %Agent, %Agent* %19, i32 0, i32 0                            ; inst 28
  store i32 %16, i32* %20                                                          ; inst 29
  %21 = sext i32 %16 to i64                                                        ; inst 30
  %22 = getelementptr [32 x %Agent], [32 x %Agent]* %1, i32 0, i64 %21             ; inst 31
  %23 = getelementptr %Agent, %Agent* %22, i32 0, i32 1                            ; inst 32
  %24 = mul i32 %16, 13                                                            ; inst 33
  %25 = srem i32 %24, 64                                                           ; inst 34
  store i32 %25, i32* %23                                                          ; inst 35
  %26 = sext i32 %16 to i64                                                        ; inst 36
  %27 = getelementptr [32 x %Agent], [32 x %Agent]* %1, i32 0, i64 %26             ; inst 37
  %28 = getelementptr %Agent, %Agent* %27, i32 0, i32 2                            ; inst 38
  %29 = mul i32 %16, 31                                                            ; inst 39
  %30 = srem i32 %29, 64                                                           ; inst 40
  store i32 %30, i32* %28                                                          ; inst 41
  %31 = sext i32 %16 to i64                                                        ; inst 42
  %32 = getelementptr [32 x %Agent], [32 x %Agent]* %1, i32 0, i64 %31             ; inst 43
  %33 = getelementptr %Agent, %Agent* %32, i32 0, i32 3                            ; inst 44
  store i32 100, i32* %33                                                          ; inst 45
  %34 = sext i32 %16 to i64                                                        ; inst 46
  %35 = getelementptr [32 x %Agent], [32 x %Agent]* %1, i32 0, i64 %34             ; inst 47
  %36 = getelementptr %Agent, %Agent* %35, i32 0, i32 6                            ; inst 48
  store i32 0, i32* %36                                                            ; inst 49
  %37 = add i32 %16, 1                                                             ; inst 50
  br label %_7.while.cond.2                                                        ; inst 51
_9.while.exit.2:
  ret void                                                                         ; inst 52
}

define i32 @find_new_target(%Agent* %0, [64 x [64 x i32]]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [-5, %_0.entry.0], [%37, %_8.while.exit.1]                          ; inst 2
  %3 = phi i32 [-1, %_0.entry.0], [%8, %_8.while.exit.1]                           ; inst 3
  %4 = phi i32 [-1, %_0.entry.0], [%9, %_8.while.exit.1]                           ; inst 4
  %5 = phi i32 [-1, %_0.entry.0], [%10, %_8.while.exit.1]                          ; inst 5
  %6 = icmp sle i32 %2, 5                                                          ; inst 6
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %7 = phi i32 [-5, %_2.while.body.0], [%36, %_7.if.exit.0]                        ; inst 9
  %8 = phi i32 [%3, %_2.while.body.0], [%33, %_7.if.exit.0]                        ; inst 10
  %9 = phi i32 [%4, %_2.while.body.0], [%34, %_7.if.exit.0]                        ; inst 11
  %10 = phi i32 [%5, %_2.while.body.0], [%35, %_7.if.exit.0]                       ; inst 12
  %11 = icmp sle i32 %7, 5                                                         ; inst 13
  br i1 %11, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 14
_4.while.body.1:
  %12 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 15
  %13 = load i32, i32* %12                                                         ; inst 16
  %14 = add i32 %13, %2                                                            ; inst 17
  %15 = add i32 %14, 64                                                            ; inst 18
  %16 = srem i32 %15, 64                                                           ; inst 19
  %17 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 20
  %18 = load i32, i32* %17                                                         ; inst 21
  %19 = add i32 %18, %7                                                            ; inst 22
  %20 = add i32 %19, 64                                                            ; inst 23
  %21 = srem i32 %20, 64                                                           ; inst 24
  %22 = sext i32 %16 to i64                                                        ; inst 25
  %23 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %1, i32 0, i64 %22     ; inst 26
  %24 = sext i32 %21 to i64                                                        ; inst 27
  %25 = getelementptr [64 x i32], [64 x i32]* %23, i32 0, i64 %24                  ; inst 28
  %26 = load i32, i32* %25                                                         ; inst 29
  %27 = icmp sgt i32 %26, %8                                                       ; inst 30
  br i1 %27, label %_5.if.then.0, label %_6.if.else.0                              ; inst 31
_5.if.then.0:
  %28 = sext i32 %16 to i64                                                        ; inst 32
  %29 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %1, i32 0, i64 %28     ; inst 33
  %30 = sext i32 %21 to i64                                                        ; inst 34
  %31 = getelementptr [64 x i32], [64 x i32]* %29, i32 0, i64 %30                  ; inst 35
  %32 = load i32, i32* %31                                                         ; inst 36
  br label %_7.if.exit.0                                                           ; inst 37
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 38
_7.if.exit.0:
  %33 = phi i32 [%32, %_5.if.then.0], [%8, %_6.if.else.0]                          ; inst 39
  %34 = phi i32 [%21, %_5.if.then.0], [%9, %_6.if.else.0]                          ; inst 40
  %35 = phi i32 [%16, %_5.if.then.0], [%10, %_6.if.else.0]                         ; inst 41
  %36 = add i32 %7, 1                                                              ; inst 42
  br label %_3.while.cond.1                                                        ; inst 43
_8.while.exit.1:
  %37 = add i32 %2, 1                                                              ; inst 44
  br label %_1.while.cond.0                                                        ; inst 45
_9.while.exit.0:
  %38 = mul i32 %5, 1000                                                           ; inst 46
  %39 = add i32 %38, %4                                                            ; inst 47
  ret i32 %39                                                                      ; inst 48
}

define void @update_agent(%Agent* %0, [64 x [64 x i32]]* %1) {
_0.entry.0:
  %2 = getelementptr %Agent, %Agent* %0, i32 0, i32 3                              ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = icmp sle i32 %3, 0                                                          ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret void                                                                         ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = getelementptr %Agent, %Agent* %0, i32 0, i32 3                              ; inst 7
  %6 = getelementptr %Agent, %Agent* %0, i32 0, i32 3                              ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = sub i32 %7, 1                                                               ; inst 10
  store i32 %8, i32* %5                                                            ; inst 11
  %9 = getelementptr %Agent, %Agent* %0, i32 0, i32 6                              ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  %11 = icmp eq i32 %10, 0                                                         ; inst 14
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 15
_4.if.then.1:
  %12 = call i32 @find_new_target(%Agent* %0, [64 x [64 x i32]]* %1)               ; inst 16
  %13 = getelementptr %Agent, %Agent* %0, i32 0, i32 4                             ; inst 17
  %14 = sdiv i32 %12, 1000                                                         ; inst 18
  store i32 %14, i32* %13                                                          ; inst 19
  %15 = getelementptr %Agent, %Agent* %0, i32 0, i32 5                             ; inst 20
  %16 = srem i32 %12, 1000                                                         ; inst 21
  store i32 %16, i32* %15                                                          ; inst 22
  %17 = getelementptr %Agent, %Agent* %0, i32 0, i32 6                             ; inst 23
  store i32 1, i32* %17                                                            ; inst 24
  br label %_36.if.exit.1                                                          ; inst 25
_5.if.else.1:
  %18 = getelementptr %Agent, %Agent* %0, i32 0, i32 6                             ; inst 26
  %19 = load i32, i32* %18                                                         ; inst 27
  %20 = icmp eq i32 %19, 1                                                         ; inst 28
  br i1 %20, label %_6.if.then.2, label %_25.if.else.2                             ; inst 29
_6.if.then.2:
  %21 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 30
  %22 = load i32, i32* %21                                                         ; inst 31
  %23 = getelementptr %Agent, %Agent* %0, i32 0, i32 4                             ; inst 32
  %24 = load i32, i32* %23                                                         ; inst 33
  %25 = icmp eq i32 %22, %24                                                       ; inst 34
  br i1 %25, label %_7.lazy.then.0, label %_8.lazy.else.0                          ; inst 35
_7.lazy.then.0:
  %26 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 36
  %27 = load i32, i32* %26                                                         ; inst 37
  %28 = getelementptr %Agent, %Agent* %0, i32 0, i32 5                             ; inst 38
  %29 = load i32, i32* %28                                                         ; inst 39
  %30 = icmp eq i32 %27, %29                                                       ; inst 40
  br label %_9.lazy.exit.0                                                         ; inst 41
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 42
_9.lazy.exit.0:
  %31 = phi i1 [%30, %_7.lazy.then.0], [0, %_8.lazy.else.0]                        ; inst 43
  br i1 %31, label %_10.if.then.3, label %_11.if.else.3                            ; inst 44
_10.if.then.3:
  %32 = getelementptr %Agent, %Agent* %0, i32 0, i32 6                             ; inst 45
  store i32 2, i32* %32                                                            ; inst 46
  br label %_24.if.exit.3                                                          ; inst 47
_11.if.else.3:
  %33 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 48
  %34 = load i32, i32* %33                                                         ; inst 49
  %35 = getelementptr %Agent, %Agent* %0, i32 0, i32 4                             ; inst 50
  %36 = load i32, i32* %35                                                         ; inst 51
  %37 = icmp slt i32 %34, %36                                                      ; inst 52
  br i1 %37, label %_12.if.then.4, label %_13.if.else.4                            ; inst 53
_12.if.then.4:
  %38 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 54
  %39 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 55
  %40 = load i32, i32* %39                                                         ; inst 56
  %41 = add i32 %40, 1                                                             ; inst 57
  store i32 %41, i32* %38                                                          ; inst 58
  br label %_17.if.exit.4                                                          ; inst 59
_13.if.else.4:
  %42 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 60
  %43 = load i32, i32* %42                                                         ; inst 61
  %44 = getelementptr %Agent, %Agent* %0, i32 0, i32 4                             ; inst 62
  %45 = load i32, i32* %44                                                         ; inst 63
  %46 = icmp sgt i32 %43, %45                                                      ; inst 64
  br i1 %46, label %_14.if.then.5, label %_15.if.else.5                            ; inst 65
_14.if.then.5:
  %47 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 66
  %48 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 67
  %49 = load i32, i32* %48                                                         ; inst 68
  %50 = sub i32 %49, 1                                                             ; inst 69
  store i32 %50, i32* %47                                                          ; inst 70
  br label %_16.if.exit.5                                                          ; inst 71
_15.if.else.5:
  br label %_16.if.exit.5                                                          ; inst 72
_16.if.exit.5:
  br label %_17.if.exit.4                                                          ; inst 73
_17.if.exit.4:
  %51 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 74
  %52 = load i32, i32* %51                                                         ; inst 75
  %53 = getelementptr %Agent, %Agent* %0, i32 0, i32 5                             ; inst 76
  %54 = load i32, i32* %53                                                         ; inst 77
  %55 = icmp slt i32 %52, %54                                                      ; inst 78
  br i1 %55, label %_18.if.then.6, label %_19.if.else.6                            ; inst 79
_18.if.then.6:
  %56 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 80
  %57 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 81
  %58 = load i32, i32* %57                                                         ; inst 82
  %59 = add i32 %58, 1                                                             ; inst 83
  store i32 %59, i32* %56                                                          ; inst 84
  br label %_23.if.exit.6                                                          ; inst 85
_19.if.else.6:
  %60 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 86
  %61 = load i32, i32* %60                                                         ; inst 87
  %62 = getelementptr %Agent, %Agent* %0, i32 0, i32 5                             ; inst 88
  %63 = load i32, i32* %62                                                         ; inst 89
  %64 = icmp sgt i32 %61, %63                                                      ; inst 90
  br i1 %64, label %_20.if.then.7, label %_21.if.else.7                            ; inst 91
_20.if.then.7:
  %65 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 92
  %66 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 93
  %67 = load i32, i32* %66                                                         ; inst 94
  %68 = sub i32 %67, 1                                                             ; inst 95
  store i32 %68, i32* %65                                                          ; inst 96
  br label %_22.if.exit.7                                                          ; inst 97
_21.if.else.7:
  br label %_22.if.exit.7                                                          ; inst 98
_22.if.exit.7:
  br label %_23.if.exit.6                                                          ; inst 99
_23.if.exit.6:
  br label %_24.if.exit.3                                                          ; inst 100
_24.if.exit.3:
  br label %_35.if.exit.2                                                          ; inst 101
_25.if.else.2:
  %69 = getelementptr %Agent, %Agent* %0, i32 0, i32 6                             ; inst 102
  %70 = load i32, i32* %69                                                         ; inst 103
  %71 = icmp eq i32 %70, 2                                                         ; inst 104
  br i1 %71, label %_26.if.then.8, label %_33.if.else.8                            ; inst 105
_26.if.then.8:
  %72 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 106
  %73 = load i32, i32* %72                                                         ; inst 107
  %74 = sext i32 %73 to i64                                                        ; inst 108
  %75 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %1, i32 0, i64 %74     ; inst 109
  %76 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 110
  %77 = load i32, i32* %76                                                         ; inst 111
  %78 = sext i32 %77 to i64                                                        ; inst 112
  %79 = getelementptr [64 x i32], [64 x i32]* %75, i32 0, i64 %78                  ; inst 113
  %80 = load i32, i32* %79                                                         ; inst 114
  %81 = icmp sgt i32 %80, 0                                                        ; inst 115
  br i1 %81, label %_27.if.then.9, label %_31.if.else.9                            ; inst 116
_27.if.then.9:
  %82 = getelementptr %Agent, %Agent* %0, i32 0, i32 3                             ; inst 117
  %83 = getelementptr %Agent, %Agent* %0, i32 0, i32 3                             ; inst 118
  %84 = load i32, i32* %83                                                         ; inst 119
  %85 = sdiv i32 %80, 5                                                            ; inst 120
  %86 = add i32 %84, %85                                                           ; inst 121
  store i32 %86, i32* %82                                                          ; inst 122
  %87 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 123
  %88 = load i32, i32* %87                                                         ; inst 124
  %89 = sext i32 %88 to i64                                                        ; inst 125
  %90 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %1, i32 0, i64 %89     ; inst 126
  %91 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 127
  %92 = load i32, i32* %91                                                         ; inst 128
  %93 = sext i32 %92 to i64                                                        ; inst 129
  %94 = getelementptr [64 x i32], [64 x i32]* %90, i32 0, i64 %93                  ; inst 130
  %95 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                             ; inst 131
  %96 = load i32, i32* %95                                                         ; inst 132
  %97 = sext i32 %96 to i64                                                        ; inst 133
  %98 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %1, i32 0, i64 %97     ; inst 134
  %99 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                             ; inst 135
  %100 = load i32, i32* %99                                                        ; inst 136
  %101 = sext i32 %100 to i64                                                      ; inst 137
  %102 = getelementptr [64 x i32], [64 x i32]* %98, i32 0, i64 %101                ; inst 138
  %103 = load i32, i32* %102                                                       ; inst 139
  %104 = sdiv i32 %80, 10                                                          ; inst 140
  %105 = sub i32 %103, %104                                                        ; inst 141
  %106 = sub i32 %105, 1                                                           ; inst 142
  store i32 %106, i32* %94                                                         ; inst 143
  %107 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                            ; inst 144
  %108 = load i32, i32* %107                                                       ; inst 145
  %109 = sext i32 %108 to i64                                                      ; inst 146
  %110 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %1, i32 0, i64 %109   ; inst 147
  %111 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                            ; inst 148
  %112 = load i32, i32* %111                                                       ; inst 149
  %113 = sext i32 %112 to i64                                                      ; inst 150
  %114 = getelementptr [64 x i32], [64 x i32]* %110, i32 0, i64 %113               ; inst 151
  %115 = load i32, i32* %114                                                       ; inst 152
  %116 = icmp slt i32 %115, 0                                                      ; inst 153
  br i1 %116, label %_28.if.then.10, label %_29.if.else.10                         ; inst 154
_28.if.then.10:
  %117 = getelementptr %Agent, %Agent* %0, i32 0, i32 1                            ; inst 155
  %118 = load i32, i32* %117                                                       ; inst 156
  %119 = sext i32 %118 to i64                                                      ; inst 157
  %120 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %1, i32 0, i64 %119   ; inst 158
  %121 = getelementptr %Agent, %Agent* %0, i32 0, i32 2                            ; inst 159
  %122 = load i32, i32* %121                                                       ; inst 160
  %123 = sext i32 %122 to i64                                                      ; inst 161
  %124 = getelementptr [64 x i32], [64 x i32]* %120, i32 0, i64 %123               ; inst 162
  store i32 0, i32* %124                                                           ; inst 163
  br label %_30.if.exit.10                                                         ; inst 164
_29.if.else.10:
  br label %_30.if.exit.10                                                         ; inst 165
_30.if.exit.10:
  br label %_32.if.exit.9                                                          ; inst 166
_31.if.else.9:
  br label %_32.if.exit.9                                                          ; inst 167
_32.if.exit.9:
  %125 = getelementptr %Agent, %Agent* %0, i32 0, i32 6                            ; inst 168
  store i32 0, i32* %125                                                           ; inst 169
  br label %_34.if.exit.8                                                          ; inst 170
_33.if.else.8:
  br label %_34.if.exit.8                                                          ; inst 171
_34.if.exit.8:
  br label %_35.if.exit.2                                                          ; inst 172
_35.if.exit.2:
  br label %_36.if.exit.1                                                          ; inst 173
_36.if.exit.1:
  ret void                                                                         ; inst 174
}

define void @main() {
_0.entry.0:
  %0 = alloca [64 x [64 x i32]]                                                    ; inst 1
  %1 = alloca [64 x i32]                                                           ; inst 2
  %2 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 64                                                         ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %0, i32 0, i32 0        ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 64                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr [64 x i32], [64 x i32]* %7, i32 %8                           ; inst 17
  call void @memcpy([64 x i32]* %10, [64 x i32]* %1, i64 256)                      ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [32 x %Agent]                                                       ; inst 21
  %13 = alloca %Agent                                                              ; inst 22
  %14 = getelementptr %Agent, %Agent* %13, i32 0, i32 0                            ; inst 23
  store i32 0, i32* %14                                                            ; inst 24
  %15 = getelementptr %Agent, %Agent* %13, i32 0, i32 1                            ; inst 25
  store i32 0, i32* %15                                                            ; inst 26
  %16 = getelementptr %Agent, %Agent* %13, i32 0, i32 2                            ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = getelementptr %Agent, %Agent* %13, i32 0, i32 3                            ; inst 29
  store i32 0, i32* %17                                                            ; inst 30
  %18 = getelementptr %Agent, %Agent* %13, i32 0, i32 4                            ; inst 31
  store i32 0, i32* %18                                                            ; inst 32
  %19 = getelementptr %Agent, %Agent* %13, i32 0, i32 5                            ; inst 33
  store i32 0, i32* %19                                                            ; inst 34
  %20 = getelementptr %Agent, %Agent* %13, i32 0, i32 6                            ; inst 35
  store i32 0, i32* %20                                                            ; inst 36
  %21 = getelementptr [32 x %Agent], [32 x %Agent]* %12, i32 0, i32 0              ; inst 37
  br label %_7.array.cond.2                                                        ; inst 38
_7.array.cond.2:
  %22 = phi i32 [0, %_6.array.exit.1], [%25, %_8.array.body.2]                     ; inst 39
  %23 = icmp slt i32 %22, 32                                                       ; inst 40
  br i1 %23, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 41
_8.array.body.2:
  %24 = getelementptr %Agent, %Agent* %21, i32 %22                                 ; inst 42
  call void @memcpy(%Agent* %24, %Agent* %13, i64 28)                              ; inst 43
  %25 = add i32 %22, 1                                                             ; inst 44
  br label %_7.array.cond.2                                                        ; inst 45
_9.array.exit.2:
  call void @init_world([64 x [64 x i32]]* %0, [32 x %Agent]* %12)                 ; inst 46
  br label %_10.while.cond.0                                                       ; inst 47
_10.while.cond.0:
  %26 = phi i32 [0, %_9.array.exit.2], [%44, %_20.if.exit.0]                       ; inst 48
  %27 = icmp slt i32 %26, 200                                                      ; inst 49
  br i1 %27, label %_11.while.body.0, label %_21.while.exit.0                      ; inst 50
_11.while.body.0:
  br label %_12.while.cond.1                                                       ; inst 51
_12.while.cond.1:
  %28 = phi i32 [0, %_11.while.body.0], [%32, %_13.while.body.1]                   ; inst 52
  %29 = icmp slt i32 %28, 32                                                       ; inst 53
  br i1 %29, label %_13.while.body.1, label %_14.while.exit.1                      ; inst 54
_13.while.body.1:
  %30 = sext i32 %28 to i64                                                        ; inst 55
  %31 = getelementptr [32 x %Agent], [32 x %Agent]* %12, i32 0, i64 %30            ; inst 56
  call void @update_agent(%Agent* %31, [64 x [64 x i32]]* %0)                      ; inst 57
  %32 = add i32 %28, 1                                                             ; inst 58
  br label %_12.while.cond.1                                                       ; inst 59
_14.while.exit.1:
  %33 = srem i32 %26, 20                                                           ; inst 60
  %34 = icmp eq i32 %33, 0                                                         ; inst 61
  br i1 %34, label %_15.if.then.0, label %_19.if.else.0                            ; inst 62
_15.if.then.0:
  br label %_16.while.cond.2                                                       ; inst 63
_16.while.cond.2:
  %35 = phi i32 [0, %_15.if.then.0], [%43, %_17.while.body.2]                      ; inst 64
  %36 = phi i32 [0, %_15.if.then.0], [%42, %_17.while.body.2]                      ; inst 65
  %37 = icmp slt i32 %35, 32                                                       ; inst 66
  br i1 %37, label %_17.while.body.2, label %_18.while.exit.2                      ; inst 67
_17.while.body.2:
  %38 = sext i32 %35 to i64                                                        ; inst 68
  %39 = getelementptr [32 x %Agent], [32 x %Agent]* %12, i32 0, i64 %38            ; inst 69
  %40 = getelementptr %Agent, %Agent* %39, i32 0, i32 3                            ; inst 70
  %41 = load i32, i32* %40                                                         ; inst 71
  %42 = add i32 %36, %41                                                           ; inst 72
  %43 = add i32 %35, 1                                                             ; inst 73
  br label %_16.while.cond.2                                                       ; inst 74
_18.while.exit.2:
  call void @printlnInt(i32 %36)                                                   ; inst 75
  br label %_20.if.exit.0                                                          ; inst 76
_19.if.else.0:
  br label %_20.if.exit.0                                                          ; inst 77
_20.if.exit.0:
  %44 = add i32 %26, 1                                                             ; inst 78
  br label %_10.while.cond.0                                                       ; inst 79
_21.while.exit.0:
  br label %_22.while.cond.3                                                       ; inst 80
_22.while.cond.3:
  %45 = phi i32 [0, %_21.while.exit.0], [%58, %_26.while.exit.4]                   ; inst 81
  %46 = phi i32 [0, %_21.while.exit.0], [%49, %_26.while.exit.4]                   ; inst 82
  %47 = icmp slt i32 %45, 64                                                       ; inst 83
  br i1 %47, label %_23.while.body.3, label %_27.while.exit.3                      ; inst 84
_23.while.body.3:
  br label %_24.while.cond.4                                                       ; inst 85
_24.while.cond.4:
  %48 = phi i32 [0, %_23.while.body.3], [%57, %_25.while.body.4]                   ; inst 86
  %49 = phi i32 [%46, %_23.while.body.3], [%56, %_25.while.body.4]                 ; inst 87
  %50 = icmp slt i32 %48, 64                                                       ; inst 88
  br i1 %50, label %_25.while.body.4, label %_26.while.exit.4                      ; inst 89
_25.while.body.4:
  %51 = sext i32 %45 to i64                                                        ; inst 90
  %52 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %0, i32 0, i64 %51     ; inst 91
  %53 = sext i32 %48 to i64                                                        ; inst 92
  %54 = getelementptr [64 x i32], [64 x i32]* %52, i32 0, i64 %53                  ; inst 93
  %55 = load i32, i32* %54                                                         ; inst 94
  %56 = add i32 %49, %55                                                           ; inst 95
  %57 = add i32 %48, 1                                                             ; inst 96
  br label %_24.while.cond.4                                                       ; inst 97
_26.while.exit.4:
  %58 = add i32 %45, 1                                                             ; inst 98
  br label %_22.while.cond.3                                                       ; inst 99
_27.while.exit.3:
  call void @printlnInt(i32 %46)                                                   ; inst 100
  call void @exit(i32 0)                                                           ; inst 101
  ret void                                                                         ; inst 102
}

