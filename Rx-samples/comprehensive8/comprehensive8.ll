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
  call void @printlnInt(i32 1800)                                                  ; inst 1
  call void @testClassicDynamicProgramming()                                       ; inst 2
  call void @testSequenceAlignmentDP()                                             ; inst 3
  call void @testOptimizationProblems()                                            ; inst 4
  call void @testGameTheoryDP()                                                    ; inst 5
  call void @testAdvancedDPPatterns()                                              ; inst 6
  call void @printlnInt(i32 1899)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @testClassicDynamicProgramming() {
_0.entry.0:
  %0 = alloca [100 x i32]                                                          ; inst 1
  %1 = alloca [100 x i32]                                                          ; inst 2
  %2 = alloca [150 x i32]                                                          ; inst 3
  %3 = alloca [150 x i32]                                                          ; inst 4
  %4 = alloca [150 x i32]                                                          ; inst 5
  call void @printlnInt(i32 1801)                                                  ; inst 6
  %5 = call i32 @fibonacciDP(i32 45)                                               ; inst 7
  call void @printlnInt(i32 %5)                                                    ; inst 8
  %6 = alloca [100 x i32]                                                          ; inst 9
  %7 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i32 0                    ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 12
  %9 = icmp slt i32 %8, 100                                                        ; inst 13
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 14
_2.array.body.0:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 15
  store i32 0, i32* %10                                                            ; inst 16
  %11 = add i32 %8, 1                                                              ; inst 17
  br label %_1.array.cond.0                                                        ; inst 18
_3.array.exit.0:
  call void @memcpy([100 x i32]* %0, [100 x i32]* %6, i64 400)                     ; inst 19
  call void @initializeSequence([100 x i32]* %0, i32 100)                          ; inst 20
  call void @memcpy([100 x i32]* %1, [100 x i32]* %6, i64 400)                     ; inst 21
  %12 = call i32 @longestIncreasingSubsequence([100 x i32]* %1, i32 100)           ; inst 22
  call void @printlnInt(i32 %12)                                                   ; inst 23
  %13 = call i32 @coinChangeDP(i32 247)                                            ; inst 24
  call void @printlnInt(i32 %13)                                                   ; inst 25
  %14 = alloca [150 x i32]                                                         ; inst 26
  %15 = getelementptr [150 x i32], [150 x i32]* %14, i32 0, i32 0                  ; inst 27
  br label %_4.array.cond.1                                                        ; inst 28
_4.array.cond.1:
  %16 = phi i32 [0, %_3.array.exit.0], [%19, %_5.array.body.1]                     ; inst 29
  %17 = icmp slt i32 %16, 150                                                      ; inst 30
  br i1 %17, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 31
_5.array.body.1:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 32
  store i32 0, i32* %18                                                            ; inst 33
  %19 = add i32 %16, 1                                                             ; inst 34
  br label %_4.array.cond.1                                                        ; inst 35
_6.array.exit.1:
  call void @memcpy([150 x i32]* %2, [150 x i32]* %14, i64 600)                    ; inst 36
  call void @initializeArray([150 x i32]* %2, i32 150)                             ; inst 37
  call void @memcpy([150 x i32]* %3, [150 x i32]* %14, i64 600)                    ; inst 38
  %20 = call i32 @maximumSubarraySum([150 x i32]* %3, i32 150)                     ; inst 39
  call void @printlnInt(i32 %20)                                                   ; inst 40
  call void @memcpy([150 x i32]* %4, [150 x i32]* %14, i64 600)                    ; inst 41
  %21 = call i32 @houseRobberDP([150 x i32]* %4, i32 150)                          ; inst 42
  call void @printlnInt(i32 %21)                                                   ; inst 43
  call void @printlnInt(i32 1802)                                                  ; inst 44
  ret void                                                                         ; inst 45
}

define i32 @fibonacciDP(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %0                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = alloca [46 x i32]                                                           ; inst 5
  %3 = getelementptr [46 x i32], [46 x i32]* %2, i32 0, i32 0                      ; inst 6
  br label %_4.array.cond.0                                                        ; inst 7
_4.array.cond.0:
  %4 = phi i32 [0, %_3.if.exit.0], [%7, %_5.array.body.0]                          ; inst 8
  %5 = icmp slt i32 %4, 46                                                         ; inst 9
  br i1 %5, label %_5.array.body.0, label %_6.array.exit.0                         ; inst 10
_5.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 11
  store i32 0, i32* %6                                                             ; inst 12
  %7 = add i32 %4, 1                                                               ; inst 13
  br label %_4.array.cond.0                                                        ; inst 14
_6.array.exit.0:
  %8 = getelementptr [46 x i32], [46 x i32]* %2, i32 0, i64 0                      ; inst 15
  store i32 0, i32* %8                                                             ; inst 16
  %9 = getelementptr [46 x i32], [46 x i32]* %2, i32 0, i64 1                      ; inst 17
  store i32 1, i32* %9                                                             ; inst 18
  br label %_7.while.cond.0                                                        ; inst 19
_7.while.cond.0:
  %10 = phi i32 [2, %_6.array.exit.0], [%23, %_8.while.body.0]                     ; inst 20
  %11 = icmp sle i32 %10, %0                                                       ; inst 21
  br i1 %11, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 22
_8.while.body.0:
  %12 = sext i32 %10 to i64                                                        ; inst 23
  %13 = getelementptr [46 x i32], [46 x i32]* %2, i32 0, i64 %12                   ; inst 24
  %14 = sub i32 %10, 1                                                             ; inst 25
  %15 = sext i32 %14 to i64                                                        ; inst 26
  %16 = getelementptr [46 x i32], [46 x i32]* %2, i32 0, i64 %15                   ; inst 27
  %17 = load i32, i32* %16                                                         ; inst 28
  %18 = sub i32 %10, 2                                                             ; inst 29
  %19 = sext i32 %18 to i64                                                        ; inst 30
  %20 = getelementptr [46 x i32], [46 x i32]* %2, i32 0, i64 %19                   ; inst 31
  %21 = load i32, i32* %20                                                         ; inst 32
  %22 = add i32 %17, %21                                                           ; inst 33
  store i32 %22, i32* %13                                                          ; inst 34
  %23 = add i32 %10, 1                                                             ; inst 35
  br label %_7.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  %24 = sext i32 %0 to i64                                                         ; inst 37
  %25 = getelementptr [46 x i32], [46 x i32]* %2, i32 0, i64 %24                   ; inst 38
  %26 = load i32, i32* %25                                                         ; inst 39
  ret i32 %26                                                                      ; inst 40
}

define void @initializeSequence([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%14, %_5.if.exit.0]                              ; inst 2
  %3 = phi i32 [145, %_0.entry.0], [%10, %_5.if.exit.0]                            ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = mul i32 %3, 1664                                                            ; inst 6
  %6 = add i32 %5, 101223                                                          ; inst 7
  %7 = srem i32 %6, 214647                                                         ; inst 8
  %8 = icmp slt i32 %7, 0                                                          ; inst 9
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %9 = sub i32 0, %7                                                               ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %10 = phi i32 [%9, %_3.if.then.0], [%7, %_4.if.else.0]                           ; inst 14
  %11 = sext i32 %2 to i64                                                         ; inst 15
  %12 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %11                 ; inst 16
  %13 = srem i32 %10, 1000                                                         ; inst 17
  store i32 %13, i32* %12                                                          ; inst 18
  %14 = add i32 %2, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define i32 @longestIncreasingSubsequence([100 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [100 x i32]                                                          ; inst 1
  %3 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 100                                                        ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 1, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [1, %_3.array.exit.0], [%43, %_17.if.exit.1]                        ; inst 12
  %9 = phi i32 [1, %_3.array.exit.0], [%44, %_17.if.exit.1]                        ; inst 13
  %10 = icmp slt i32 %9, %1                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_18.while.exit.0                       ; inst 15
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 16
_6.while.cond.1:
  %11 = phi i32 [0, %_5.while.body.0], [%35, %_13.if.exit.0]                       ; inst 17
  %12 = icmp slt i32 %11, %9                                                       ; inst 18
  br i1 %12, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 19
_7.while.body.1:
  %13 = sext i32 %11 to i64                                                        ; inst 20
  %14 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %13                 ; inst 21
  %15 = load i32, i32* %14                                                         ; inst 22
  %16 = sext i32 %9 to i64                                                         ; inst 23
  %17 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %16                 ; inst 24
  %18 = load i32, i32* %17                                                         ; inst 25
  %19 = icmp slt i32 %15, %18                                                      ; inst 26
  br i1 %19, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 27
_8.lazy.then.0:
  %20 = sext i32 %11 to i64                                                        ; inst 28
  %21 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %20                 ; inst 29
  %22 = load i32, i32* %21                                                         ; inst 30
  %23 = add i32 %22, 1                                                             ; inst 31
  %24 = sext i32 %9 to i64                                                         ; inst 32
  %25 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %24                 ; inst 33
  %26 = load i32, i32* %25                                                         ; inst 34
  %27 = icmp sgt i32 %23, %26                                                      ; inst 35
  br label %_10.lazy.exit.0                                                        ; inst 36
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 37
_10.lazy.exit.0:
  %28 = phi i1 [%27, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 38
  br i1 %28, label %_11.if.then.0, label %_12.if.else.0                            ; inst 39
_11.if.then.0:
  %29 = sext i32 %9 to i64                                                         ; inst 40
  %30 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %29                 ; inst 41
  %31 = sext i32 %11 to i64                                                        ; inst 42
  %32 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %31                 ; inst 43
  %33 = load i32, i32* %32                                                         ; inst 44
  %34 = add i32 %33, 1                                                             ; inst 45
  store i32 %34, i32* %30                                                          ; inst 46
  br label %_13.if.exit.0                                                          ; inst 47
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 48
_13.if.exit.0:
  %35 = add i32 %11, 1                                                             ; inst 49
  br label %_6.while.cond.1                                                        ; inst 50
_14.while.exit.1:
  %36 = sext i32 %9 to i64                                                         ; inst 51
  %37 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %36                 ; inst 52
  %38 = load i32, i32* %37                                                         ; inst 53
  %39 = icmp sgt i32 %38, %8                                                       ; inst 54
  br i1 %39, label %_15.if.then.1, label %_16.if.else.1                            ; inst 55
_15.if.then.1:
  %40 = sext i32 %9 to i64                                                         ; inst 56
  %41 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %40                 ; inst 57
  %42 = load i32, i32* %41                                                         ; inst 58
  br label %_17.if.exit.1                                                          ; inst 59
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 60
_17.if.exit.1:
  %43 = phi i32 [%42, %_15.if.then.1], [%8, %_16.if.else.1]                        ; inst 61
  %44 = add i32 %9, 1                                                              ; inst 62
  br label %_4.while.cond.0                                                        ; inst 63
_18.while.exit.0:
  ret i32 %8                                                                       ; inst 64
}

define i32 @coinChangeDP(i32 %0) {
_0.entry.0:
  %1 = alloca [5 x i32]                                                            ; inst 1
  %2 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i32 0                        ; inst 2
  store i32 1, i32* %2                                                             ; inst 3
  %3 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i32 1                        ; inst 4
  store i32 5, i32* %3                                                             ; inst 5
  %4 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i32 2                        ; inst 6
  store i32 10, i32* %4                                                            ; inst 7
  %5 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i32 3                        ; inst 8
  store i32 25, i32* %5                                                            ; inst 9
  %6 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i32 4                        ; inst 10
  store i32 50, i32* %6                                                            ; inst 11
  %7 = alloca [248 x i32]                                                          ; inst 12
  %8 = getelementptr [248 x i32], [248 x i32]* %7, i32 0, i32 0                    ; inst 13
  br label %_1.array.cond.0                                                        ; inst 14
_1.array.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%12, %_2.array.body.0]                           ; inst 15
  %10 = icmp slt i32 %9, 248                                                       ; inst 16
  br i1 %10, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 17
_2.array.body.0:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 18
  store i32 9999, i32* %11                                                         ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_1.array.cond.0                                                        ; inst 21
_3.array.exit.0:
  %13 = getelementptr [248 x i32], [248 x i32]* %7, i32 0, i64 0                   ; inst 22
  store i32 0, i32* %13                                                            ; inst 23
  br label %_4.while.cond.0                                                        ; inst 24
_4.while.cond.0:
  %14 = phi i32 [1, %_3.array.exit.0], [%40, %_14.while.exit.1]                    ; inst 25
  %15 = icmp sle i32 %14, %0                                                       ; inst 26
  br i1 %15, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 27
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 28
_6.while.cond.1:
  %16 = phi i32 [0, %_5.while.body.0], [%39, %_13.if.exit.0]                       ; inst 29
  %17 = icmp slt i32 %16, 5                                                        ; inst 30
  br i1 %17, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 31
_7.while.body.1:
  %18 = sext i32 %16 to i64                                                        ; inst 32
  %19 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %18                     ; inst 33
  %20 = load i32, i32* %19                                                         ; inst 34
  %21 = icmp sle i32 %20, %14                                                      ; inst 35
  br i1 %21, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 36
_8.lazy.then.0:
  %22 = sub i32 %14, %20                                                           ; inst 37
  %23 = sext i32 %22 to i64                                                        ; inst 38
  %24 = getelementptr [248 x i32], [248 x i32]* %7, i32 0, i64 %23                 ; inst 39
  %25 = load i32, i32* %24                                                         ; inst 40
  %26 = add i32 %25, 1                                                             ; inst 41
  %27 = sext i32 %14 to i64                                                        ; inst 42
  %28 = getelementptr [248 x i32], [248 x i32]* %7, i32 0, i64 %27                 ; inst 43
  %29 = load i32, i32* %28                                                         ; inst 44
  %30 = icmp slt i32 %26, %29                                                      ; inst 45
  br label %_10.lazy.exit.0                                                        ; inst 46
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 47
_10.lazy.exit.0:
  %31 = phi i1 [%30, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 48
  br i1 %31, label %_11.if.then.0, label %_12.if.else.0                            ; inst 49
_11.if.then.0:
  %32 = sext i32 %14 to i64                                                        ; inst 50
  %33 = getelementptr [248 x i32], [248 x i32]* %7, i32 0, i64 %32                 ; inst 51
  %34 = sub i32 %14, %20                                                           ; inst 52
  %35 = sext i32 %34 to i64                                                        ; inst 53
  %36 = getelementptr [248 x i32], [248 x i32]* %7, i32 0, i64 %35                 ; inst 54
  %37 = load i32, i32* %36                                                         ; inst 55
  %38 = add i32 %37, 1                                                             ; inst 56
  store i32 %38, i32* %33                                                          ; inst 57
  br label %_13.if.exit.0                                                          ; inst 58
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 59
_13.if.exit.0:
  %39 = add i32 %16, 1                                                             ; inst 60
  br label %_6.while.cond.1                                                        ; inst 61
_14.while.exit.1:
  %40 = add i32 %14, 1                                                             ; inst 62
  br label %_4.while.cond.0                                                        ; inst 63
_15.while.exit.0:
  %41 = sext i32 %0 to i64                                                         ; inst 64
  %42 = getelementptr [248 x i32], [248 x i32]* %7, i32 0, i64 %41                 ; inst 65
  %43 = load i32, i32* %42                                                         ; inst 66
  ret i32 %43                                                                      ; inst 67
}

define void @initializeArray([150 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%20, %_8.if.exit.1]                              ; inst 2
  %3 = phi i32 [321, %_0.entry.0], [%10, %_8.if.exit.1]                            ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = mul i32 %3, 1665                                                            ; inst 6
  %6 = add i32 %5, 904223                                                          ; inst 7
  %7 = srem i32 %6, 143647                                                         ; inst 8
  %8 = icmp slt i32 %7, 0                                                          ; inst 9
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %9 = sub i32 0, %7                                                               ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %10 = phi i32 [%9, %_3.if.then.0], [%7, %_4.if.else.0]                           ; inst 14
  %11 = srem i32 %10, 3                                                            ; inst 15
  %12 = icmp eq i32 %11, 0                                                         ; inst 16
  br i1 %12, label %_6.if.then.1, label %_7.if.else.1                              ; inst 17
_6.if.then.1:
  %13 = sext i32 %2 to i64                                                         ; inst 18
  %14 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 %13                 ; inst 19
  %15 = srem i32 %10, 100                                                          ; inst 20
  %16 = sub i32 0, %15                                                             ; inst 21
  store i32 %16, i32* %14                                                          ; inst 22
  br label %_8.if.exit.1                                                           ; inst 23
_7.if.else.1:
  %17 = sext i32 %2 to i64                                                         ; inst 24
  %18 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 %17                 ; inst 25
  %19 = srem i32 %10, 100                                                          ; inst 26
  store i32 %19, i32* %18                                                          ; inst 27
  br label %_8.if.exit.1                                                           ; inst 28
_8.if.exit.1:
  %20 = add i32 %2, 1                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_9.while.exit.0:
  ret void                                                                         ; inst 31
}

define i32 @maximumSubarraySum([150 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 0                    ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 0                    ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %6 = phi i32 [1, %_0.entry.0], [%28, %_8.if.exit.1]                              ; inst 6
  %7 = phi i32 [%5, %_0.entry.0], [%25, %_8.if.exit.1]                             ; inst 7
  %8 = phi i32 [%3, %_0.entry.0], [%27, %_8.if.exit.1]                             ; inst 8
  %9 = icmp slt i32 %6, %1                                                         ; inst 9
  br i1 %9, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 10
_2.while.body.0:
  %10 = sext i32 %6 to i64                                                         ; inst 11
  %11 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 %10                 ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  %13 = add i32 %7, %12                                                            ; inst 14
  %14 = sext i32 %6 to i64                                                         ; inst 15
  %15 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 %14                 ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = icmp sgt i32 %13, %16                                                      ; inst 18
  br i1 %17, label %_3.if.then.0, label %_4.if.else.0                              ; inst 19
_3.if.then.0:
  %18 = sext i32 %6 to i64                                                         ; inst 20
  %19 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 %18                 ; inst 21
  %20 = load i32, i32* %19                                                         ; inst 22
  %21 = add i32 %7, %20                                                            ; inst 23
  br label %_5.if.exit.0                                                           ; inst 24
_4.if.else.0:
  %22 = sext i32 %6 to i64                                                         ; inst 25
  %23 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 %22                 ; inst 26
  %24 = load i32, i32* %23                                                         ; inst 27
  br label %_5.if.exit.0                                                           ; inst 28
_5.if.exit.0:
  %25 = phi i32 [%21, %_3.if.then.0], [%24, %_4.if.else.0]                         ; inst 29
  %26 = icmp sgt i32 %25, %8                                                       ; inst 30
  br i1 %26, label %_6.if.then.1, label %_7.if.else.1                              ; inst 31
_6.if.then.1:
  br label %_8.if.exit.1                                                           ; inst 32
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 33
_8.if.exit.1:
  %27 = phi i32 [%25, %_6.if.then.1], [%8, %_7.if.else.1]                          ; inst 34
  %28 = add i32 %6, 1                                                              ; inst 35
  br label %_1.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  ret i32 %8                                                                       ; inst 37
}

define i32 @houseRobberDP([150 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = icmp eq i32 %1, 1                                                           ; inst 5
  br i1 %3, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  %4 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 0                    ; inst 7
  %5 = load i32, i32* %4                                                           ; inst 8
  ret i32 %5                                                                       ; inst 9
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 10
_6.if.exit.1:
  %6 = alloca [150 x i32]                                                          ; inst 11
  %7 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i32 0                    ; inst 12
  br label %_7.array.cond.0                                                        ; inst 13
_7.array.cond.0:
  %8 = phi i32 [0, %_6.if.exit.1], [%11, %_8.array.body.0]                         ; inst 14
  %9 = icmp slt i32 %8, 150                                                        ; inst 15
  br i1 %9, label %_8.array.body.0, label %_9.array.exit.0                         ; inst 16
_8.array.body.0:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_7.array.cond.0                                                        ; inst 20
_9.array.exit.0:
  %12 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 0                   ; inst 21
  %13 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 0                   ; inst 22
  %14 = load i32, i32* %13                                                         ; inst 23
  store i32 %14, i32* %12                                                          ; inst 24
  %15 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 1                   ; inst 25
  %16 = load i32, i32* %15                                                         ; inst 26
  %17 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 0                   ; inst 27
  %18 = load i32, i32* %17                                                         ; inst 28
  %19 = icmp sgt i32 %16, %18                                                      ; inst 29
  br i1 %19, label %_10.if.then.2, label %_11.if.else.2                            ; inst 30
_10.if.then.2:
  %20 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 1                   ; inst 31
  %21 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 1                   ; inst 32
  %22 = load i32, i32* %21                                                         ; inst 33
  store i32 %22, i32* %20                                                          ; inst 34
  br label %_12.if.exit.2                                                          ; inst 35
_11.if.else.2:
  %23 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 1                   ; inst 36
  %24 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 0                   ; inst 37
  %25 = load i32, i32* %24                                                         ; inst 38
  store i32 %25, i32* %23                                                          ; inst 39
  br label %_12.if.exit.2                                                          ; inst 40
_12.if.exit.2:
  br label %_13.while.cond.0                                                       ; inst 41
_13.while.cond.0:
  %26 = phi i32 [2, %_12.if.exit.2], [%45, %_17.if.exit.3]                         ; inst 42
  %27 = icmp slt i32 %26, %1                                                       ; inst 43
  br i1 %27, label %_14.while.body.0, label %_18.while.exit.0                      ; inst 44
_14.while.body.0:
  %28 = sub i32 %26, 2                                                             ; inst 45
  %29 = sext i32 %28 to i64                                                        ; inst 46
  %30 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 %29                 ; inst 47
  %31 = load i32, i32* %30                                                         ; inst 48
  %32 = sext i32 %26 to i64                                                        ; inst 49
  %33 = getelementptr [150 x i32], [150 x i32]* %0, i32 0, i64 %32                 ; inst 50
  %34 = load i32, i32* %33                                                         ; inst 51
  %35 = add i32 %31, %34                                                           ; inst 52
  %36 = sub i32 %26, 1                                                             ; inst 53
  %37 = sext i32 %36 to i64                                                        ; inst 54
  %38 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 %37                 ; inst 55
  %39 = load i32, i32* %38                                                         ; inst 56
  %40 = icmp sgt i32 %35, %39                                                      ; inst 57
  br i1 %40, label %_15.if.then.3, label %_16.if.else.3                            ; inst 58
_15.if.then.3:
  %41 = sext i32 %26 to i64                                                        ; inst 59
  %42 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 %41                 ; inst 60
  store i32 %35, i32* %42                                                          ; inst 61
  br label %_17.if.exit.3                                                          ; inst 62
_16.if.else.3:
  %43 = sext i32 %26 to i64                                                        ; inst 63
  %44 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 %43                 ; inst 64
  store i32 %39, i32* %44                                                          ; inst 65
  br label %_17.if.exit.3                                                          ; inst 66
_17.if.exit.3:
  %45 = add i32 %26, 1                                                             ; inst 67
  br label %_13.while.cond.0                                                       ; inst 68
_18.while.exit.0:
  %46 = sub i32 %1, 1                                                              ; inst 69
  %47 = sext i32 %46 to i64                                                        ; inst 70
  %48 = getelementptr [150 x i32], [150 x i32]* %6, i32 0, i64 %47                 ; inst 71
  %49 = load i32, i32* %48                                                         ; inst 72
  ret i32 %49                                                                      ; inst 73
}

define void @testSequenceAlignmentDP() {
_0.entry.0:
  %0 = alloca [50 x i32]                                                           ; inst 1
  %1 = alloca [50 x i32]                                                           ; inst 2
  %2 = alloca [50 x i32]                                                           ; inst 3
  %3 = alloca [50 x i32]                                                           ; inst 4
  %4 = alloca [50 x i32]                                                           ; inst 5
  %5 = alloca [50 x i32]                                                           ; inst 6
  %6 = alloca [50 x i32]                                                           ; inst 7
  %7 = alloca [50 x i32]                                                           ; inst 8
  call void @printlnInt(i32 1803)                                                  ; inst 9
  %8 = alloca [50 x i32]                                                           ; inst 10
  %9 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i32 0                      ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_1.array.cond.0:
  %10 = phi i32 [0, %_0.entry.0], [%13, %_2.array.body.0]                          ; inst 13
  %11 = icmp slt i32 %10, 50                                                       ; inst 14
  br i1 %11, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 15
_2.array.body.0:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 16
  store i32 0, i32* %12                                                            ; inst 17
  %13 = add i32 %10, 1                                                             ; inst 18
  br label %_1.array.cond.0                                                        ; inst 19
_3.array.exit.0:
  %14 = alloca [50 x i32]                                                          ; inst 20
  %15 = getelementptr [50 x i32], [50 x i32]* %14, i32 0, i32 0                    ; inst 21
  br label %_4.array.cond.1                                                        ; inst 22
_4.array.cond.1:
  %16 = phi i32 [0, %_3.array.exit.0], [%19, %_5.array.body.1]                     ; inst 23
  %17 = icmp slt i32 %16, 50                                                       ; inst 24
  br i1 %17, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 25
_5.array.body.1:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 26
  store i32 0, i32* %18                                                            ; inst 27
  %19 = add i32 %16, 1                                                             ; inst 28
  br label %_4.array.cond.1                                                        ; inst 29
_6.array.exit.1:
  call void @memcpy([50 x i32]* %0, [50 x i32]* %8, i64 200)                       ; inst 30
  call void @memcpy([50 x i32]* %1, [50 x i32]* %14, i64 200)                      ; inst 31
  call void @initializeStrings([50 x i32]* %0, [50 x i32]* %1, i32 30, i32 35)     ; inst 32
  call void @memcpy([50 x i32]* %2, [50 x i32]* %8, i64 200)                       ; inst 33
  call void @memcpy([50 x i32]* %3, [50 x i32]* %14, i64 200)                      ; inst 34
  %20 = call i32 @editDistanceDP([50 x i32]* %2, [50 x i32]* %3, i32 30, i32 35)   ; inst 35
  call void @printlnInt(i32 %20)                                                   ; inst 36
  call void @memcpy([50 x i32]* %4, [50 x i32]* %8, i64 200)                       ; inst 37
  call void @memcpy([50 x i32]* %5, [50 x i32]* %14, i64 200)                      ; inst 38
  %21 = call i32 @longestCommonSubsequenceDP([50 x i32]* %4, [50 x i32]* %5, i32 30, i32 35) ; inst 39
  call void @printlnInt(i32 %21)                                                   ; inst 40
  call void @memcpy([50 x i32]* %6, [50 x i32]* %8, i64 200)                       ; inst 41
  %22 = call i32 @palindromePartitioningDP([50 x i32]* %6, i32 30)                 ; inst 42
  call void @printlnInt(i32 %22)                                                   ; inst 43
  call void @memcpy([50 x i32]* %7, [50 x i32]* %8, i64 200)                       ; inst 44
  %23 = call i32 @stringReconstructionDP([50 x i32]* %7, i32 30)                   ; inst 45
  call void @printlnInt(i32 %23)                                                   ; inst 46
  call void @printlnInt(i32 1804)                                                  ; inst 47
  ret void                                                                         ; inst 48
}

define void @initializeStrings([50 x i32]* %0, [50 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%17, %_5.if.exit.0]                              ; inst 2
  %5 = phi i32 [98, %_0.entry.0], [%12, %_5.if.exit.0]                             ; inst 3
  %6 = icmp slt i32 %4, %2                                                         ; inst 4
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %7 = mul i32 %5, 166                                                             ; inst 6
  %8 = add i32 %7, 101390                                                          ; inst 7
  %9 = srem i32 %8, 274847                                                         ; inst 8
  %10 = icmp slt i32 %9, 0                                                         ; inst 9
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 10
_3.if.then.0:
  %11 = sub i32 0, %9                                                              ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %12 = phi i32 [%11, %_3.if.then.0], [%9, %_4.if.else.0]                          ; inst 14
  %13 = sext i32 %4 to i64                                                         ; inst 15
  %14 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %13                   ; inst 16
  %15 = srem i32 %12, 26                                                           ; inst 17
  %16 = add i32 65, %15                                                            ; inst 18
  store i32 %16, i32* %14                                                          ; inst 19
  %17 = add i32 %4, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 22
_7.while.cond.1:
  %18 = phi i32 [0, %_6.while.exit.0], [%40, %_17.if.exit.2]                       ; inst 23
  %19 = phi i32 [%5, %_6.while.exit.0], [%26, %_17.if.exit.2]                      ; inst 24
  %20 = icmp slt i32 %18, %3                                                       ; inst 25
  br i1 %20, label %_8.while.body.1, label %_18.while.exit.1                       ; inst 26
_8.while.body.1:
  %21 = mul i32 %19, 166                                                           ; inst 27
  %22 = add i32 %21, 101390                                                        ; inst 28
  %23 = srem i32 %22, 274847                                                       ; inst 29
  %24 = icmp slt i32 %23, 0                                                        ; inst 30
  br i1 %24, label %_9.if.then.1, label %_10.if.else.1                             ; inst 31
_9.if.then.1:
  %25 = sub i32 0, %23                                                             ; inst 32
  br label %_11.if.exit.1                                                          ; inst 33
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 34
_11.if.exit.1:
  %26 = phi i32 [%25, %_9.if.then.1], [%23, %_10.if.else.1]                        ; inst 35
  %27 = icmp slt i32 %18, %2                                                       ; inst 36
  br i1 %27, label %_12.lazy.then.0, label %_13.lazy.else.0                        ; inst 37
_12.lazy.then.0:
  %28 = srem i32 %26, 3                                                            ; inst 38
  %29 = icmp eq i32 %28, 0                                                         ; inst 39
  br label %_14.lazy.exit.0                                                        ; inst 40
_13.lazy.else.0:
  br label %_14.lazy.exit.0                                                        ; inst 41
_14.lazy.exit.0:
  %30 = phi i1 [%29, %_12.lazy.then.0], [0, %_13.lazy.else.0]                      ; inst 42
  br i1 %30, label %_15.if.then.2, label %_16.if.else.2                            ; inst 43
_15.if.then.2:
  %31 = sext i32 %18 to i64                                                        ; inst 44
  %32 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %31                   ; inst 45
  %33 = sext i32 %18 to i64                                                        ; inst 46
  %34 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %33                   ; inst 47
  %35 = load i32, i32* %34                                                         ; inst 48
  store i32 %35, i32* %32                                                          ; inst 49
  br label %_17.if.exit.2                                                          ; inst 50
_16.if.else.2:
  %36 = sext i32 %18 to i64                                                        ; inst 51
  %37 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %36                   ; inst 52
  %38 = srem i32 %26, 26                                                           ; inst 53
  %39 = add i32 65, %38                                                            ; inst 54
  store i32 %39, i32* %37                                                          ; inst 55
  br label %_17.if.exit.2                                                          ; inst 56
_17.if.exit.2:
  %40 = add i32 %18, 1                                                             ; inst 57
  br label %_7.while.cond.1                                                        ; inst 58
_18.while.exit.1:
  ret void                                                                         ; inst 59
}

define i32 @editDistanceDP([50 x i32]* %0, [50 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca [1800 x i32]                                                         ; inst 1
  %5 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 1800                                                       ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 7
  store i32 0, i32* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %10 = phi i32 [0, %_3.array.exit.0], [%16, %_5.while.body.0]                     ; inst 12
  %11 = icmp sle i32 %10, %2                                                       ; inst 13
  br i1 %11, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 14
_5.while.body.0:
  %12 = add i32 %3, 1                                                              ; inst 15
  %13 = mul i32 %10, %12                                                           ; inst 16
  %14 = sext i32 %13 to i64                                                        ; inst 17
  %15 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %14               ; inst 18
  store i32 %10, i32* %15                                                          ; inst 19
  %16 = add i32 %10, 1                                                             ; inst 20
  br label %_4.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 22
_7.while.cond.1:
  %17 = phi i32 [0, %_6.while.exit.0], [%22, %_8.while.body.1]                     ; inst 23
  %18 = icmp sle i32 %17, %3                                                       ; inst 24
  br i1 %18, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 25
_8.while.body.1:
  %19 = add i32 %3, 1                                                              ; inst 26
  %20 = sext i32 %17 to i64                                                        ; inst 27
  %21 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %20               ; inst 28
  store i32 %17, i32* %21                                                          ; inst 29
  %22 = add i32 %17, 1                                                             ; inst 30
  br label %_7.while.cond.1                                                        ; inst 31
_9.while.exit.1:
  br label %_10.while.cond.2                                                       ; inst 32
_10.while.cond.2:
  %23 = phi i32 [1, %_9.while.exit.1], [%88, %_23.while.exit.3]                    ; inst 33
  %24 = icmp sle i32 %23, %2                                                       ; inst 34
  br i1 %24, label %_11.while.body.2, label %_24.while.exit.2                      ; inst 35
_11.while.body.2:
  br label %_12.while.cond.3                                                       ; inst 36
_12.while.cond.3:
  %25 = phi i32 [1, %_11.while.body.2], [%87, %_22.if.exit.0]                      ; inst 37
  %26 = icmp sle i32 %25, %3                                                       ; inst 38
  br i1 %26, label %_13.while.body.3, label %_23.while.exit.3                      ; inst 39
_13.while.body.3:
  %27 = sub i32 %23, 1                                                             ; inst 40
  %28 = sext i32 %27 to i64                                                        ; inst 41
  %29 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %28                   ; inst 42
  %30 = load i32, i32* %29                                                         ; inst 43
  %31 = sub i32 %25, 1                                                             ; inst 44
  %32 = sext i32 %31 to i64                                                        ; inst 45
  %33 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %32                   ; inst 46
  %34 = load i32, i32* %33                                                         ; inst 47
  %35 = icmp eq i32 %30, %34                                                       ; inst 48
  br i1 %35, label %_14.if.then.0, label %_15.if.else.0                            ; inst 49
_14.if.then.0:
  %36 = add i32 %3, 1                                                              ; inst 50
  %37 = mul i32 %23, %36                                                           ; inst 51
  %38 = add i32 %37, %25                                                           ; inst 52
  %39 = sext i32 %38 to i64                                                        ; inst 53
  %40 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %39               ; inst 54
  %41 = sub i32 %23, 1                                                             ; inst 55
  %42 = add i32 %3, 1                                                              ; inst 56
  %43 = mul i32 %41, %42                                                           ; inst 57
  %44 = sub i32 %25, 1                                                             ; inst 58
  %45 = add i32 %43, %44                                                           ; inst 59
  %46 = sext i32 %45 to i64                                                        ; inst 60
  %47 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %46               ; inst 61
  %48 = load i32, i32* %47                                                         ; inst 62
  store i32 %48, i32* %40                                                          ; inst 63
  br label %_22.if.exit.0                                                          ; inst 64
_15.if.else.0:
  %49 = add i32 %3, 1                                                              ; inst 65
  %50 = mul i32 %23, %49                                                           ; inst 66
  %51 = sub i32 %25, 1                                                             ; inst 67
  %52 = add i32 %50, %51                                                           ; inst 68
  %53 = sext i32 %52 to i64                                                        ; inst 69
  %54 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %53               ; inst 70
  %55 = load i32, i32* %54                                                         ; inst 71
  %56 = add i32 %55, 1                                                             ; inst 72
  %57 = sub i32 %23, 1                                                             ; inst 73
  %58 = add i32 %3, 1                                                              ; inst 74
  %59 = mul i32 %57, %58                                                           ; inst 75
  %60 = add i32 %59, %25                                                           ; inst 76
  %61 = sext i32 %60 to i64                                                        ; inst 77
  %62 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %61               ; inst 78
  %63 = load i32, i32* %62                                                         ; inst 79
  %64 = add i32 %63, 1                                                             ; inst 80
  %65 = sub i32 %23, 1                                                             ; inst 81
  %66 = add i32 %3, 1                                                              ; inst 82
  %67 = mul i32 %65, %66                                                           ; inst 83
  %68 = sub i32 %25, 1                                                             ; inst 84
  %69 = add i32 %67, %68                                                           ; inst 85
  %70 = sext i32 %69 to i64                                                        ; inst 86
  %71 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %70               ; inst 87
  %72 = load i32, i32* %71                                                         ; inst 88
  %73 = add i32 %72, 1                                                             ; inst 89
  %74 = icmp slt i32 %56, %64                                                      ; inst 90
  br i1 %74, label %_16.if.then.1, label %_17.if.else.1                            ; inst 91
_16.if.then.1:
  br label %_18.if.exit.1                                                          ; inst 92
_17.if.else.1:
  br label %_18.if.exit.1                                                          ; inst 93
_18.if.exit.1:
  %75 = phi i32 [%56, %_16.if.then.1], [%64, %_17.if.else.1]                       ; inst 94
  %76 = icmp slt i32 %73, %75                                                      ; inst 95
  br i1 %76, label %_19.if.then.2, label %_20.if.else.2                            ; inst 96
_19.if.then.2:
  %77 = add i32 %3, 1                                                              ; inst 97
  %78 = mul i32 %23, %77                                                           ; inst 98
  %79 = add i32 %78, %25                                                           ; inst 99
  %80 = sext i32 %79 to i64                                                        ; inst 100
  %81 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %80               ; inst 101
  store i32 %73, i32* %81                                                          ; inst 102
  br label %_21.if.exit.2                                                          ; inst 103
_20.if.else.2:
  %82 = add i32 %3, 1                                                              ; inst 104
  %83 = mul i32 %23, %82                                                           ; inst 105
  %84 = add i32 %83, %25                                                           ; inst 106
  %85 = sext i32 %84 to i64                                                        ; inst 107
  %86 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %85               ; inst 108
  store i32 %75, i32* %86                                                          ; inst 109
  br label %_21.if.exit.2                                                          ; inst 110
_21.if.exit.2:
  br label %_22.if.exit.0                                                          ; inst 111
_22.if.exit.0:
  %87 = add i32 %25, 1                                                             ; inst 112
  br label %_12.while.cond.3                                                       ; inst 113
_23.while.exit.3:
  %88 = add i32 %23, 1                                                             ; inst 114
  br label %_10.while.cond.2                                                       ; inst 115
_24.while.exit.2:
  %89 = add i32 %3, 1                                                              ; inst 116
  %90 = mul i32 %2, %89                                                            ; inst 117
  %91 = add i32 %90, %3                                                            ; inst 118
  %92 = sext i32 %91 to i64                                                        ; inst 119
  %93 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %92               ; inst 120
  %94 = load i32, i32* %93                                                         ; inst 121
  ret i32 %94                                                                      ; inst 122
}

define i32 @longestCommonSubsequenceDP([50 x i32]* %0, [50 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca [1800 x i32]                                                         ; inst 1
  %5 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 1800                                                       ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 7
  store i32 0, i32* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %10 = phi i32 [1, %_3.array.exit.0], [%63, %_14.while.exit.1]                    ; inst 12
  %11 = icmp sle i32 %10, %2                                                       ; inst 13
  br i1 %11, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 14
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 15
_6.while.cond.1:
  %12 = phi i32 [1, %_5.while.body.0], [%62, %_13.if.exit.0]                       ; inst 16
  %13 = icmp sle i32 %12, %3                                                       ; inst 17
  br i1 %13, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 18
_7.while.body.1:
  %14 = sub i32 %10, 1                                                             ; inst 19
  %15 = sext i32 %14 to i64                                                        ; inst 20
  %16 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %15                   ; inst 21
  %17 = load i32, i32* %16                                                         ; inst 22
  %18 = sub i32 %12, 1                                                             ; inst 23
  %19 = sext i32 %18 to i64                                                        ; inst 24
  %20 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %19                   ; inst 25
  %21 = load i32, i32* %20                                                         ; inst 26
  %22 = icmp eq i32 %17, %21                                                       ; inst 27
  br i1 %22, label %_8.if.then.0, label %_9.if.else.0                              ; inst 28
_8.if.then.0:
  %23 = add i32 %3, 1                                                              ; inst 29
  %24 = mul i32 %10, %23                                                           ; inst 30
  %25 = add i32 %24, %12                                                           ; inst 31
  %26 = sext i32 %25 to i64                                                        ; inst 32
  %27 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %26               ; inst 33
  %28 = sub i32 %10, 1                                                             ; inst 34
  %29 = add i32 %3, 1                                                              ; inst 35
  %30 = mul i32 %28, %29                                                           ; inst 36
  %31 = sub i32 %12, 1                                                             ; inst 37
  %32 = add i32 %30, %31                                                           ; inst 38
  %33 = sext i32 %32 to i64                                                        ; inst 39
  %34 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %33               ; inst 40
  %35 = load i32, i32* %34                                                         ; inst 41
  %36 = add i32 %35, 1                                                             ; inst 42
  store i32 %36, i32* %27                                                          ; inst 43
  br label %_13.if.exit.0                                                          ; inst 44
_9.if.else.0:
  %37 = add i32 %3, 1                                                              ; inst 45
  %38 = mul i32 %10, %37                                                           ; inst 46
  %39 = sub i32 %12, 1                                                             ; inst 47
  %40 = add i32 %38, %39                                                           ; inst 48
  %41 = sext i32 %40 to i64                                                        ; inst 49
  %42 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %41               ; inst 50
  %43 = load i32, i32* %42                                                         ; inst 51
  %44 = sub i32 %10, 1                                                             ; inst 52
  %45 = add i32 %3, 1                                                              ; inst 53
  %46 = mul i32 %44, %45                                                           ; inst 54
  %47 = add i32 %46, %12                                                           ; inst 55
  %48 = sext i32 %47 to i64                                                        ; inst 56
  %49 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %48               ; inst 57
  %50 = load i32, i32* %49                                                         ; inst 58
  %51 = icmp sgt i32 %43, %50                                                      ; inst 59
  br i1 %51, label %_10.if.then.1, label %_11.if.else.1                            ; inst 60
_10.if.then.1:
  %52 = add i32 %3, 1                                                              ; inst 61
  %53 = mul i32 %10, %52                                                           ; inst 62
  %54 = add i32 %53, %12                                                           ; inst 63
  %55 = sext i32 %54 to i64                                                        ; inst 64
  %56 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %55               ; inst 65
  store i32 %43, i32* %56                                                          ; inst 66
  br label %_12.if.exit.1                                                          ; inst 67
_11.if.else.1:
  %57 = add i32 %3, 1                                                              ; inst 68
  %58 = mul i32 %10, %57                                                           ; inst 69
  %59 = add i32 %58, %12                                                           ; inst 70
  %60 = sext i32 %59 to i64                                                        ; inst 71
  %61 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %60               ; inst 72
  store i32 %50, i32* %61                                                          ; inst 73
  br label %_12.if.exit.1                                                          ; inst 74
_12.if.exit.1:
  br label %_13.if.exit.0                                                          ; inst 75
_13.if.exit.0:
  %62 = add i32 %12, 1                                                             ; inst 76
  br label %_6.while.cond.1                                                        ; inst 77
_14.while.exit.1:
  %63 = add i32 %10, 1                                                             ; inst 78
  br label %_4.while.cond.0                                                        ; inst 79
_15.while.exit.0:
  %64 = add i32 %3, 1                                                              ; inst 80
  %65 = mul i32 %2, %64                                                            ; inst 81
  %66 = add i32 %65, %3                                                            ; inst 82
  %67 = sext i32 %66 to i64                                                        ; inst 83
  %68 = getelementptr [1800 x i32], [1800 x i32]* %4, i32 0, i64 %67               ; inst 84
  %69 = load i32, i32* %68                                                         ; inst 85
  ret i32 %69                                                                      ; inst 86
}

define i32 @palindromePartitioningDP([50 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [50 x i32]                                                           ; inst 1
  %3 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 50                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = alloca [2500 x i1]                                                          ; inst 11
  %9 = getelementptr [2500 x i1], [2500 x i1]* %8, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 2500                                                     ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr i1, i1* %9, i32 %10                                          ; inst 17
  store i1 0, i1* %12                                                              ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %14 = phi i32 [0, %_6.array.exit.1], [%57, %_23.while.exit.1]                    ; inst 22
  %15 = icmp slt i32 %14, %1                                                       ; inst 23
  br i1 %15, label %_8.while.body.0, label %_24.while.exit.0                       ; inst 24
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 25
_9.while.cond.1:
  %16 = phi i32 [0, %_8.while.body.0], [%56, %_22.if.exit.0]                       ; inst 26
  %17 = icmp slt i32 %16, %1                                                       ; inst 27
  br i1 %17, label %_10.while.body.1, label %_23.while.exit.1                      ; inst 28
_10.while.body.1:
  %18 = icmp eq i32 %14, %16                                                       ; inst 29
  br i1 %18, label %_11.if.then.0, label %_12.if.else.0                            ; inst 30
_11.if.then.0:
  %19 = mul i32 %14, %1                                                            ; inst 31
  %20 = add i32 %19, %16                                                           ; inst 32
  %21 = sext i32 %20 to i64                                                        ; inst 33
  %22 = getelementptr [2500 x i1], [2500 x i1]* %8, i32 0, i64 %21                 ; inst 34
  store i1 1, i1* %22                                                              ; inst 35
  br label %_22.if.exit.0                                                          ; inst 36
_12.if.else.0:
  %23 = add i32 %14, 1                                                             ; inst 37
  %24 = icmp eq i32 %23, %16                                                       ; inst 38
  br i1 %24, label %_13.if.then.1, label %_14.if.else.1                            ; inst 39
_13.if.then.1:
  %25 = mul i32 %14, %1                                                            ; inst 40
  %26 = add i32 %25, %16                                                           ; inst 41
  %27 = sext i32 %26 to i64                                                        ; inst 42
  %28 = getelementptr [2500 x i1], [2500 x i1]* %8, i32 0, i64 %27                 ; inst 43
  %29 = sext i32 %14 to i64                                                        ; inst 44
  %30 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %29                   ; inst 45
  %31 = load i32, i32* %30                                                         ; inst 46
  %32 = sext i32 %16 to i64                                                        ; inst 47
  %33 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %32                   ; inst 48
  %34 = load i32, i32* %33                                                         ; inst 49
  %35 = icmp eq i32 %31, %34                                                       ; inst 50
  store i1 %35, i1* %28                                                            ; inst 51
  br label %_21.if.exit.1                                                          ; inst 52
_14.if.else.1:
  %36 = icmp slt i32 %14, %16                                                      ; inst 53
  br i1 %36, label %_15.if.then.2, label %_19.if.else.2                            ; inst 54
_15.if.then.2:
  %37 = mul i32 %14, %1                                                            ; inst 55
  %38 = add i32 %37, %16                                                           ; inst 56
  %39 = sext i32 %38 to i64                                                        ; inst 57
  %40 = getelementptr [2500 x i1], [2500 x i1]* %8, i32 0, i64 %39                 ; inst 58
  %41 = sext i32 %14 to i64                                                        ; inst 59
  %42 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %41                   ; inst 60
  %43 = load i32, i32* %42                                                         ; inst 61
  %44 = sext i32 %16 to i64                                                        ; inst 62
  %45 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %44                   ; inst 63
  %46 = load i32, i32* %45                                                         ; inst 64
  %47 = icmp eq i32 %43, %46                                                       ; inst 65
  br i1 %47, label %_16.lazy.then.0, label %_17.lazy.else.0                        ; inst 66
_16.lazy.then.0:
  %48 = add i32 %14, 1                                                             ; inst 67
  %49 = mul i32 %48, %1                                                            ; inst 68
  %50 = sub i32 %16, 1                                                             ; inst 69
  %51 = add i32 %49, %50                                                           ; inst 70
  %52 = sext i32 %51 to i64                                                        ; inst 71
  %53 = getelementptr [2500 x i1], [2500 x i1]* %8, i32 0, i64 %52                 ; inst 72
  %54 = load i1, i1* %53                                                           ; inst 73
  br label %_18.lazy.exit.0                                                        ; inst 74
_17.lazy.else.0:
  br label %_18.lazy.exit.0                                                        ; inst 75
_18.lazy.exit.0:
  %55 = phi i1 [%54, %_16.lazy.then.0], [0, %_17.lazy.else.0]                      ; inst 76
  store i1 %55, i1* %40                                                            ; inst 77
  br label %_20.if.exit.2                                                          ; inst 78
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 79
_20.if.exit.2:
  br label %_21.if.exit.1                                                          ; inst 80
_21.if.exit.1:
  br label %_22.if.exit.0                                                          ; inst 81
_22.if.exit.0:
  %56 = add i32 %16, 1                                                             ; inst 82
  br label %_9.while.cond.1                                                        ; inst 83
_23.while.exit.1:
  %57 = add i32 %14, 1                                                             ; inst 84
  br label %_7.while.cond.0                                                        ; inst 85
_24.while.exit.0:
  br label %_25.while.cond.2                                                       ; inst 86
_25.while.cond.2:
  %58 = phi i32 [0, %_24.while.exit.0], [%89, %_38.while.exit.3]                   ; inst 87
  %59 = icmp slt i32 %58, %1                                                       ; inst 88
  br i1 %59, label %_26.while.body.2, label %_39.while.exit.2                      ; inst 89
_26.while.body.2:
  %60 = sext i32 %58 to i64                                                        ; inst 90
  %61 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %60                   ; inst 91
  store i32 %58, i32* %61                                                          ; inst 92
  br label %_27.while.cond.3                                                       ; inst 93
_27.while.cond.3:
  %62 = phi i32 [0, %_26.while.body.2], [%88, %_37.if.exit.3]                      ; inst 94
  %63 = icmp sle i32 %62, %58                                                      ; inst 95
  br i1 %63, label %_28.while.body.3, label %_38.while.exit.3                      ; inst 96
_28.while.body.3:
  %64 = mul i32 %62, %1                                                            ; inst 97
  %65 = add i32 %64, %58                                                           ; inst 98
  %66 = sext i32 %65 to i64                                                        ; inst 99
  %67 = getelementptr [2500 x i1], [2500 x i1]* %8, i32 0, i64 %66                 ; inst 100
  %68 = load i1, i1* %67                                                           ; inst 101
  br i1 %68, label %_29.if.then.3, label %_36.if.else.3                            ; inst 102
_29.if.then.3:
  %69 = icmp eq i32 %62, 0                                                         ; inst 103
  br i1 %69, label %_30.if.then.4, label %_31.if.else.4                            ; inst 104
_30.if.then.4:
  %70 = sext i32 %58 to i64                                                        ; inst 105
  %71 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %70                   ; inst 106
  store i32 0, i32* %71                                                            ; inst 107
  br label %_35.if.exit.4                                                          ; inst 108
_31.if.else.4:
  %72 = sub i32 %62, 1                                                             ; inst 109
  %73 = sext i32 %72 to i64                                                        ; inst 110
  %74 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %73                   ; inst 111
  %75 = load i32, i32* %74                                                         ; inst 112
  %76 = add i32 %75, 1                                                             ; inst 113
  %77 = sext i32 %58 to i64                                                        ; inst 114
  %78 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %77                   ; inst 115
  %79 = load i32, i32* %78                                                         ; inst 116
  %80 = icmp slt i32 %76, %79                                                      ; inst 117
  br i1 %80, label %_32.if.then.5, label %_33.if.else.5                            ; inst 118
_32.if.then.5:
  %81 = sext i32 %58 to i64                                                        ; inst 119
  %82 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %81                   ; inst 120
  %83 = sub i32 %62, 1                                                             ; inst 121
  %84 = sext i32 %83 to i64                                                        ; inst 122
  %85 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %84                   ; inst 123
  %86 = load i32, i32* %85                                                         ; inst 124
  %87 = add i32 %86, 1                                                             ; inst 125
  store i32 %87, i32* %82                                                          ; inst 126
  br label %_34.if.exit.5                                                          ; inst 127
_33.if.else.5:
  br label %_34.if.exit.5                                                          ; inst 128
_34.if.exit.5:
  br label %_35.if.exit.4                                                          ; inst 129
_35.if.exit.4:
  br label %_37.if.exit.3                                                          ; inst 130
_36.if.else.3:
  br label %_37.if.exit.3                                                          ; inst 131
_37.if.exit.3:
  %88 = add i32 %62, 1                                                             ; inst 132
  br label %_27.while.cond.3                                                       ; inst 133
_38.while.exit.3:
  %89 = add i32 %58, 1                                                             ; inst 134
  br label %_25.while.cond.2                                                       ; inst 135
_39.while.exit.2:
  %90 = sub i32 %1, 1                                                              ; inst 136
  %91 = sext i32 %90 to i64                                                        ; inst 137
  %92 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %91                   ; inst 138
  %93 = load i32, i32* %92                                                         ; inst 139
  ret i32 %93                                                                      ; inst 140
}

define i32 @stringReconstructionDP([50 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [50 x i32]                                                           ; inst 1
  %3 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 50                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 0                      ; inst 11
  store i32 1, i32* %8                                                             ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %9 = phi i32 [1, %_3.array.exit.0], [%117, %_50.if.exit.2]                       ; inst 14
  %10 = icmp sle i32 %9, %1                                                        ; inst 15
  br i1 %10, label %_5.while.body.0, label %_51.while.exit.0                       ; inst 16
_5.while.body.0:
  %11 = icmp sge i32 %9, 1                                                         ; inst 17
  br i1 %11, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 18
_6.lazy.then.0:
  %12 = sub i32 %9, 1                                                              ; inst 19
  %13 = sext i32 %12 to i64                                                        ; inst 20
  %14 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %13                   ; inst 21
  %15 = load i32, i32* %14                                                         ; inst 22
  %16 = icmp sge i32 %15, 65                                                       ; inst 23
  br label %_8.lazy.exit.0                                                         ; inst 24
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 25
_8.lazy.exit.0:
  %17 = phi i1 [%16, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 26
  br i1 %17, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 27
_9.lazy.then.1:
  %18 = sub i32 %9, 1                                                              ; inst 28
  %19 = sext i32 %18 to i64                                                        ; inst 29
  %20 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %19                   ; inst 30
  %21 = load i32, i32* %20                                                         ; inst 31
  %22 = icmp sle i32 %21, 90                                                       ; inst 32
  br label %_11.lazy.exit.1                                                        ; inst 33
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 34
_11.lazy.exit.1:
  %23 = phi i1 [%22, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 35
  br i1 %23, label %_12.if.then.0, label %_13.if.else.0                            ; inst 36
_12.if.then.0:
  %24 = sext i32 %9 to i64                                                         ; inst 37
  %25 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %24                   ; inst 38
  %26 = sext i32 %9 to i64                                                         ; inst 39
  %27 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %26                   ; inst 40
  %28 = load i32, i32* %27                                                         ; inst 41
  %29 = sub i32 %9, 1                                                              ; inst 42
  %30 = sext i32 %29 to i64                                                        ; inst 43
  %31 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %30                   ; inst 44
  %32 = load i32, i32* %31                                                         ; inst 45
  %33 = add i32 %28, %32                                                           ; inst 46
  store i32 %33, i32* %25                                                          ; inst 47
  br label %_14.if.exit.0                                                          ; inst 48
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 49
_14.if.exit.0:
  %34 = icmp sge i32 %9, 2                                                         ; inst 50
  br i1 %34, label %_15.lazy.then.2, label %_16.lazy.else.2                        ; inst 51
_15.lazy.then.2:
  %35 = sub i32 %9, 2                                                              ; inst 52
  %36 = sext i32 %35 to i64                                                        ; inst 53
  %37 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %36                   ; inst 54
  %38 = load i32, i32* %37                                                         ; inst 55
  %39 = icmp sge i32 %38, 65                                                       ; inst 56
  br label %_17.lazy.exit.2                                                        ; inst 57
_16.lazy.else.2:
  br label %_17.lazy.exit.2                                                        ; inst 58
_17.lazy.exit.2:
  %40 = phi i1 [%39, %_15.lazy.then.2], [0, %_16.lazy.else.2]                      ; inst 59
  br i1 %40, label %_18.lazy.then.3, label %_19.lazy.else.3                        ; inst 60
_18.lazy.then.3:
  %41 = sub i32 %9, 2                                                              ; inst 61
  %42 = sext i32 %41 to i64                                                        ; inst 62
  %43 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %42                   ; inst 63
  %44 = load i32, i32* %43                                                         ; inst 64
  %45 = icmp sle i32 %44, 90                                                       ; inst 65
  br label %_20.lazy.exit.3                                                        ; inst 66
_19.lazy.else.3:
  br label %_20.lazy.exit.3                                                        ; inst 67
_20.lazy.exit.3:
  %46 = phi i1 [%45, %_18.lazy.then.3], [0, %_19.lazy.else.3]                      ; inst 68
  br i1 %46, label %_21.lazy.then.4, label %_22.lazy.else.4                        ; inst 69
_21.lazy.then.4:
  %47 = sub i32 %9, 1                                                              ; inst 70
  %48 = sext i32 %47 to i64                                                        ; inst 71
  %49 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %48                   ; inst 72
  %50 = load i32, i32* %49                                                         ; inst 73
  %51 = icmp sge i32 %50, 65                                                       ; inst 74
  br label %_23.lazy.exit.4                                                        ; inst 75
_22.lazy.else.4:
  br label %_23.lazy.exit.4                                                        ; inst 76
_23.lazy.exit.4:
  %52 = phi i1 [%51, %_21.lazy.then.4], [0, %_22.lazy.else.4]                      ; inst 77
  br i1 %52, label %_24.lazy.then.5, label %_25.lazy.else.5                        ; inst 78
_24.lazy.then.5:
  %53 = sub i32 %9, 1                                                              ; inst 79
  %54 = sext i32 %53 to i64                                                        ; inst 80
  %55 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %54                   ; inst 81
  %56 = load i32, i32* %55                                                         ; inst 82
  %57 = icmp sle i32 %56, 90                                                       ; inst 83
  br label %_26.lazy.exit.5                                                        ; inst 84
_25.lazy.else.5:
  br label %_26.lazy.exit.5                                                        ; inst 85
_26.lazy.exit.5:
  %58 = phi i1 [%57, %_24.lazy.then.5], [0, %_25.lazy.else.5]                      ; inst 86
  br i1 %58, label %_27.if.then.1, label %_28.if.else.1                            ; inst 87
_27.if.then.1:
  %59 = sext i32 %9 to i64                                                         ; inst 88
  %60 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %59                   ; inst 89
  %61 = sext i32 %9 to i64                                                         ; inst 90
  %62 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %61                   ; inst 91
  %63 = load i32, i32* %62                                                         ; inst 92
  %64 = sub i32 %9, 2                                                              ; inst 93
  %65 = sext i32 %64 to i64                                                        ; inst 94
  %66 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %65                   ; inst 95
  %67 = load i32, i32* %66                                                         ; inst 96
  %68 = add i32 %63, %67                                                           ; inst 97
  store i32 %68, i32* %60                                                          ; inst 98
  br label %_29.if.exit.1                                                          ; inst 99
_28.if.else.1:
  br label %_29.if.exit.1                                                          ; inst 100
_29.if.exit.1:
  %69 = icmp sge i32 %9, 3                                                         ; inst 101
  br i1 %69, label %_30.lazy.then.6, label %_31.lazy.else.6                        ; inst 102
_30.lazy.then.6:
  %70 = sub i32 %9, 3                                                              ; inst 103
  %71 = sext i32 %70 to i64                                                        ; inst 104
  %72 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %71                   ; inst 105
  %73 = load i32, i32* %72                                                         ; inst 106
  %74 = icmp sge i32 %73, 65                                                       ; inst 107
  br label %_32.lazy.exit.6                                                        ; inst 108
_31.lazy.else.6:
  br label %_32.lazy.exit.6                                                        ; inst 109
_32.lazy.exit.6:
  %75 = phi i1 [%74, %_30.lazy.then.6], [0, %_31.lazy.else.6]                      ; inst 110
  br i1 %75, label %_33.lazy.then.7, label %_34.lazy.else.7                        ; inst 111
_33.lazy.then.7:
  %76 = sub i32 %9, 3                                                              ; inst 112
  %77 = sext i32 %76 to i64                                                        ; inst 113
  %78 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %77                   ; inst 114
  %79 = load i32, i32* %78                                                         ; inst 115
  %80 = icmp sle i32 %79, 90                                                       ; inst 116
  br label %_35.lazy.exit.7                                                        ; inst 117
_34.lazy.else.7:
  br label %_35.lazy.exit.7                                                        ; inst 118
_35.lazy.exit.7:
  %81 = phi i1 [%80, %_33.lazy.then.7], [0, %_34.lazy.else.7]                      ; inst 119
  br i1 %81, label %_36.lazy.then.8, label %_37.lazy.else.8                        ; inst 120
_36.lazy.then.8:
  %82 = sub i32 %9, 2                                                              ; inst 121
  %83 = sext i32 %82 to i64                                                        ; inst 122
  %84 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %83                   ; inst 123
  %85 = load i32, i32* %84                                                         ; inst 124
  %86 = icmp sge i32 %85, 65                                                       ; inst 125
  br label %_38.lazy.exit.8                                                        ; inst 126
_37.lazy.else.8:
  br label %_38.lazy.exit.8                                                        ; inst 127
_38.lazy.exit.8:
  %87 = phi i1 [%86, %_36.lazy.then.8], [0, %_37.lazy.else.8]                      ; inst 128
  br i1 %87, label %_39.lazy.then.9, label %_40.lazy.else.9                        ; inst 129
_39.lazy.then.9:
  %88 = sub i32 %9, 2                                                              ; inst 130
  %89 = sext i32 %88 to i64                                                        ; inst 131
  %90 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %89                   ; inst 132
  %91 = load i32, i32* %90                                                         ; inst 133
  %92 = icmp sle i32 %91, 90                                                       ; inst 134
  br label %_41.lazy.exit.9                                                        ; inst 135
_40.lazy.else.9:
  br label %_41.lazy.exit.9                                                        ; inst 136
_41.lazy.exit.9:
  %93 = phi i1 [%92, %_39.lazy.then.9], [0, %_40.lazy.else.9]                      ; inst 137
  br i1 %93, label %_42.lazy.then.10, label %_43.lazy.else.10                      ; inst 138
_42.lazy.then.10:
  %94 = sub i32 %9, 1                                                              ; inst 139
  %95 = sext i32 %94 to i64                                                        ; inst 140
  %96 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %95                   ; inst 141
  %97 = load i32, i32* %96                                                         ; inst 142
  %98 = icmp sge i32 %97, 65                                                       ; inst 143
  br label %_44.lazy.exit.10                                                       ; inst 144
_43.lazy.else.10:
  br label %_44.lazy.exit.10                                                       ; inst 145
_44.lazy.exit.10:
  %99 = phi i1 [%98, %_42.lazy.then.10], [0, %_43.lazy.else.10]                    ; inst 146
  br i1 %99, label %_45.lazy.then.11, label %_46.lazy.else.11                      ; inst 147
_45.lazy.then.11:
  %100 = sub i32 %9, 1                                                             ; inst 148
  %101 = sext i32 %100 to i64                                                      ; inst 149
  %102 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %101                 ; inst 150
  %103 = load i32, i32* %102                                                       ; inst 151
  %104 = icmp sle i32 %103, 90                                                     ; inst 152
  br label %_47.lazy.exit.11                                                       ; inst 153
_46.lazy.else.11:
  br label %_47.lazy.exit.11                                                       ; inst 154
_47.lazy.exit.11:
  %105 = phi i1 [%104, %_45.lazy.then.11], [0, %_46.lazy.else.11]                  ; inst 155
  br i1 %105, label %_48.if.then.2, label %_49.if.else.2                           ; inst 156
_48.if.then.2:
  %106 = sext i32 %9 to i64                                                        ; inst 157
  %107 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %106                 ; inst 158
  %108 = sext i32 %9 to i64                                                        ; inst 159
  %109 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %108                 ; inst 160
  %110 = load i32, i32* %109                                                       ; inst 161
  %111 = sub i32 %9, 3                                                             ; inst 162
  %112 = sext i32 %111 to i64                                                      ; inst 163
  %113 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %112                 ; inst 164
  %114 = load i32, i32* %113                                                       ; inst 165
  %115 = sdiv i32 %114, 2                                                          ; inst 166
  %116 = add i32 %110, %115                                                        ; inst 167
  store i32 %116, i32* %107                                                        ; inst 168
  br label %_50.if.exit.2                                                          ; inst 169
_49.if.else.2:
  br label %_50.if.exit.2                                                          ; inst 170
_50.if.exit.2:
  %117 = add i32 %9, 1                                                             ; inst 171
  br label %_4.while.cond.0                                                        ; inst 172
_51.while.exit.0:
  %118 = sext i32 %1 to i64                                                        ; inst 173
  %119 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %118                 ; inst 174
  %120 = load i32, i32* %119                                                       ; inst 175
  ret i32 %120                                                                     ; inst 176
}

define void @testOptimizationProblems() {
_0.entry.0:
  call void @printlnInt(i32 1805)                                                  ; inst 1
  %0 = call i32 @knapsackDP(i32 50, i32 100)                                       ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @unboundedKnapsackDP(i32 50, i32 100)                              ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @jobSchedulingDP(i32 30)                                           ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @partitionProblemDP(i32 40)                                        ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  %4 = call i32 @matrixChainMultiplicationDP(i32 20)                               ; inst 10
  call void @printlnInt(i32 %4)                                                    ; inst 11
  call void @printlnInt(i32 1806)                                                  ; inst 12
  ret void                                                                         ; inst 13
}

define i32 @knapsackDP(i32 %0, i32 %1) {
_0.entry.0:
  %2 = alloca [50 x i32]                                                           ; inst 1
  %3 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 50                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = alloca [50 x i32]                                                           ; inst 11
  %9 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 50                                                       ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 17
  store i32 0, i32* %12                                                            ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %14 = phi i32 [0, %_6.array.exit.1], [%31, %_11.if.exit.0]                       ; inst 22
  %15 = phi i32 [111, %_6.array.exit.1], [%22, %_11.if.exit.0]                     ; inst 23
  %16 = icmp slt i32 %14, %0                                                       ; inst 24
  br i1 %16, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 25
_8.while.body.0:
  %17 = mul i32 %15, 525                                                           ; inst 26
  %18 = add i32 %17, 390422                                                        ; inst 27
  %19 = srem i32 %18, 483647                                                       ; inst 28
  %20 = icmp slt i32 %19, 0                                                        ; inst 29
  br i1 %20, label %_9.if.then.0, label %_10.if.else.0                             ; inst 30
_9.if.then.0:
  %21 = sub i32 0, %19                                                             ; inst 31
  br label %_11.if.exit.0                                                          ; inst 32
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 33
_11.if.exit.0:
  %22 = phi i32 [%21, %_9.if.then.0], [%19, %_10.if.else.0]                        ; inst 34
  %23 = sext i32 %14 to i64                                                        ; inst 35
  %24 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %23                   ; inst 36
  %25 = srem i32 %22, 20                                                           ; inst 37
  %26 = add i32 1, %25                                                             ; inst 38
  store i32 %26, i32* %24                                                          ; inst 39
  %27 = sext i32 %14 to i64                                                        ; inst 40
  %28 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i64 %27                   ; inst 41
  %29 = srem i32 %22, 50                                                           ; inst 42
  %30 = add i32 10, %29                                                            ; inst 43
  store i32 %30, i32* %28                                                          ; inst 44
  %31 = add i32 %14, 1                                                             ; inst 45
  br label %_7.while.cond.0                                                        ; inst 46
_12.while.exit.0:
  %32 = alloca [5151 x i32]                                                        ; inst 47
  %33 = getelementptr [5151 x i32], [5151 x i32]* %32, i32 0, i32 0                ; inst 48
  br label %_13.array.cond.2                                                       ; inst 49
_13.array.cond.2:
  %34 = phi i32 [0, %_12.while.exit.0], [%37, %_14.array.body.2]                   ; inst 50
  %35 = icmp slt i32 %34, 5151                                                     ; inst 51
  br i1 %35, label %_14.array.body.2, label %_15.array.exit.2                      ; inst 52
_14.array.body.2:
  %36 = getelementptr i32, i32* %33, i32 %34                                       ; inst 53
  store i32 0, i32* %36                                                            ; inst 54
  %37 = add i32 %34, 1                                                             ; inst 55
  br label %_13.array.cond.2                                                       ; inst 56
_15.array.exit.2:
  br label %_16.while.cond.1                                                       ; inst 57
_16.while.cond.1:
  %38 = phi i32 [1, %_15.array.exit.2], [%89, %_26.while.exit.2]                   ; inst 58
  %39 = icmp sle i32 %38, %0                                                       ; inst 59
  br i1 %39, label %_17.while.body.1, label %_27.while.exit.1                      ; inst 60
_17.while.body.1:
  br label %_18.while.cond.2                                                       ; inst 61
_18.while.cond.2:
  %40 = phi i32 [1, %_17.while.body.1], [%88, %_25.if.exit.1]                      ; inst 62
  %41 = icmp sle i32 %40, %1                                                       ; inst 63
  br i1 %41, label %_19.while.body.2, label %_26.while.exit.2                      ; inst 64
_19.while.body.2:
  %42 = add i32 %1, 1                                                              ; inst 65
  %43 = mul i32 %38, %42                                                           ; inst 66
  %44 = add i32 %43, %40                                                           ; inst 67
  %45 = sext i32 %44 to i64                                                        ; inst 68
  %46 = getelementptr [5151 x i32], [5151 x i32]* %32, i32 0, i64 %45              ; inst 69
  %47 = sub i32 %38, 1                                                             ; inst 70
  %48 = add i32 %1, 1                                                              ; inst 71
  %49 = mul i32 %47, %48                                                           ; inst 72
  %50 = add i32 %49, %40                                                           ; inst 73
  %51 = sext i32 %50 to i64                                                        ; inst 74
  %52 = getelementptr [5151 x i32], [5151 x i32]* %32, i32 0, i64 %51              ; inst 75
  %53 = load i32, i32* %52                                                         ; inst 76
  store i32 %53, i32* %46                                                          ; inst 77
  %54 = sub i32 %38, 1                                                             ; inst 78
  %55 = sext i32 %54 to i64                                                        ; inst 79
  %56 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %55                   ; inst 80
  %57 = load i32, i32* %56                                                         ; inst 81
  %58 = icmp sle i32 %57, %40                                                      ; inst 82
  br i1 %58, label %_20.if.then.1, label %_24.if.else.1                            ; inst 83
_20.if.then.1:
  %59 = sub i32 %38, 1                                                             ; inst 84
  %60 = sext i32 %59 to i64                                                        ; inst 85
  %61 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i64 %60                   ; inst 86
  %62 = load i32, i32* %61                                                         ; inst 87
  %63 = sub i32 %38, 1                                                             ; inst 88
  %64 = add i32 %1, 1                                                              ; inst 89
  %65 = mul i32 %63, %64                                                           ; inst 90
  %66 = sub i32 %38, 1                                                             ; inst 91
  %67 = sext i32 %66 to i64                                                        ; inst 92
  %68 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %67                   ; inst 93
  %69 = load i32, i32* %68                                                         ; inst 94
  %70 = sub i32 %40, %69                                                           ; inst 95
  %71 = add i32 %65, %70                                                           ; inst 96
  %72 = sext i32 %71 to i64                                                        ; inst 97
  %73 = getelementptr [5151 x i32], [5151 x i32]* %32, i32 0, i64 %72              ; inst 98
  %74 = load i32, i32* %73                                                         ; inst 99
  %75 = add i32 %62, %74                                                           ; inst 100
  %76 = add i32 %1, 1                                                              ; inst 101
  %77 = mul i32 %38, %76                                                           ; inst 102
  %78 = add i32 %77, %40                                                           ; inst 103
  %79 = sext i32 %78 to i64                                                        ; inst 104
  %80 = getelementptr [5151 x i32], [5151 x i32]* %32, i32 0, i64 %79              ; inst 105
  %81 = load i32, i32* %80                                                         ; inst 106
  %82 = icmp sgt i32 %75, %81                                                      ; inst 107
  br i1 %82, label %_21.if.then.2, label %_22.if.else.2                            ; inst 108
_21.if.then.2:
  %83 = add i32 %1, 1                                                              ; inst 109
  %84 = mul i32 %38, %83                                                           ; inst 110
  %85 = add i32 %84, %40                                                           ; inst 111
  %86 = sext i32 %85 to i64                                                        ; inst 112
  %87 = getelementptr [5151 x i32], [5151 x i32]* %32, i32 0, i64 %86              ; inst 113
  store i32 %75, i32* %87                                                          ; inst 114
  br label %_23.if.exit.2                                                          ; inst 115
_22.if.else.2:
  br label %_23.if.exit.2                                                          ; inst 116
_23.if.exit.2:
  br label %_25.if.exit.1                                                          ; inst 117
_24.if.else.1:
  br label %_25.if.exit.1                                                          ; inst 118
_25.if.exit.1:
  %88 = add i32 %40, 1                                                             ; inst 119
  br label %_18.while.cond.2                                                       ; inst 120
_26.while.exit.2:
  %89 = add i32 %38, 1                                                             ; inst 121
  br label %_16.while.cond.1                                                       ; inst 122
_27.while.exit.1:
  %90 = add i32 %1, 1                                                              ; inst 123
  %91 = mul i32 %0, %90                                                            ; inst 124
  %92 = add i32 %91, %1                                                            ; inst 125
  %93 = sext i32 %92 to i64                                                        ; inst 126
  %94 = getelementptr [5151 x i32], [5151 x i32]* %32, i32 0, i64 %93              ; inst 127
  %95 = load i32, i32* %94                                                         ; inst 128
  ret i32 %95                                                                      ; inst 129
}

define i32 @unboundedKnapsackDP(i32 %0, i32 %1) {
_0.entry.0:
  %2 = alloca [50 x i32]                                                           ; inst 1
  %3 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 50                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = alloca [50 x i32]                                                           ; inst 11
  %9 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 50                                                       ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 17
  store i32 0, i32* %12                                                            ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %14 = phi i32 [0, %_6.array.exit.1], [%31, %_11.if.exit.0]                       ; inst 22
  %15 = phi i32 [222, %_6.array.exit.1], [%22, %_11.if.exit.0]                     ; inst 23
  %16 = icmp slt i32 %14, %0                                                       ; inst 24
  br i1 %16, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 25
_8.while.body.0:
  %17 = mul i32 %15, 1664                                                          ; inst 26
  %18 = add i32 %17, 904223                                                        ; inst 27
  %19 = srem i32 %18, 83647                                                        ; inst 28
  %20 = icmp slt i32 %19, 0                                                        ; inst 29
  br i1 %20, label %_9.if.then.0, label %_10.if.else.0                             ; inst 30
_9.if.then.0:
  %21 = sub i32 0, %19                                                             ; inst 31
  br label %_11.if.exit.0                                                          ; inst 32
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 33
_11.if.exit.0:
  %22 = phi i32 [%21, %_9.if.then.0], [%19, %_10.if.else.0]                        ; inst 34
  %23 = sext i32 %14 to i64                                                        ; inst 35
  %24 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %23                   ; inst 36
  %25 = srem i32 %22, 15                                                           ; inst 37
  %26 = add i32 1, %25                                                             ; inst 38
  store i32 %26, i32* %24                                                          ; inst 39
  %27 = sext i32 %14 to i64                                                        ; inst 40
  %28 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i64 %27                   ; inst 41
  %29 = srem i32 %22, 40                                                           ; inst 42
  %30 = add i32 5, %29                                                             ; inst 43
  store i32 %30, i32* %28                                                          ; inst 44
  %31 = add i32 %14, 1                                                             ; inst 45
  br label %_7.while.cond.0                                                        ; inst 46
_12.while.exit.0:
  %32 = alloca [101 x i32]                                                         ; inst 47
  %33 = getelementptr [101 x i32], [101 x i32]* %32, i32 0, i32 0                  ; inst 48
  br label %_13.array.cond.2                                                       ; inst 49
_13.array.cond.2:
  %34 = phi i32 [0, %_12.while.exit.0], [%37, %_14.array.body.2]                   ; inst 50
  %35 = icmp slt i32 %34, 101                                                      ; inst 51
  br i1 %35, label %_14.array.body.2, label %_15.array.exit.2                      ; inst 52
_14.array.body.2:
  %36 = getelementptr i32, i32* %33, i32 %34                                       ; inst 53
  store i32 0, i32* %36                                                            ; inst 54
  %37 = add i32 %34, 1                                                             ; inst 55
  br label %_13.array.cond.2                                                       ; inst 56
_15.array.exit.2:
  br label %_16.while.cond.1                                                       ; inst 57
_16.while.cond.1:
  %38 = phi i32 [1, %_15.array.exit.2], [%64, %_26.while.exit.2]                   ; inst 58
  %39 = icmp sle i32 %38, %1                                                       ; inst 59
  br i1 %39, label %_17.while.body.1, label %_27.while.exit.1                      ; inst 60
_17.while.body.1:
  br label %_18.while.cond.2                                                       ; inst 61
_18.while.cond.2:
  %40 = phi i32 [0, %_17.while.body.1], [%63, %_25.if.exit.1]                      ; inst 62
  %41 = icmp slt i32 %40, %0                                                       ; inst 63
  br i1 %41, label %_19.while.body.2, label %_26.while.exit.2                      ; inst 64
_19.while.body.2:
  %42 = sext i32 %40 to i64                                                        ; inst 65
  %43 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %42                   ; inst 66
  %44 = load i32, i32* %43                                                         ; inst 67
  %45 = icmp sle i32 %44, %38                                                      ; inst 68
  br i1 %45, label %_20.if.then.1, label %_24.if.else.1                            ; inst 69
_20.if.then.1:
  %46 = sext i32 %40 to i64                                                        ; inst 70
  %47 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i64 %46                   ; inst 71
  %48 = load i32, i32* %47                                                         ; inst 72
  %49 = sext i32 %40 to i64                                                        ; inst 73
  %50 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %49                   ; inst 74
  %51 = load i32, i32* %50                                                         ; inst 75
  %52 = sub i32 %38, %51                                                           ; inst 76
  %53 = sext i32 %52 to i64                                                        ; inst 77
  %54 = getelementptr [101 x i32], [101 x i32]* %32, i32 0, i64 %53                ; inst 78
  %55 = load i32, i32* %54                                                         ; inst 79
  %56 = add i32 %48, %55                                                           ; inst 80
  %57 = sext i32 %38 to i64                                                        ; inst 81
  %58 = getelementptr [101 x i32], [101 x i32]* %32, i32 0, i64 %57                ; inst 82
  %59 = load i32, i32* %58                                                         ; inst 83
  %60 = icmp sgt i32 %56, %59                                                      ; inst 84
  br i1 %60, label %_21.if.then.2, label %_22.if.else.2                            ; inst 85
_21.if.then.2:
  %61 = sext i32 %38 to i64                                                        ; inst 86
  %62 = getelementptr [101 x i32], [101 x i32]* %32, i32 0, i64 %61                ; inst 87
  store i32 %56, i32* %62                                                          ; inst 88
  br label %_23.if.exit.2                                                          ; inst 89
_22.if.else.2:
  br label %_23.if.exit.2                                                          ; inst 90
_23.if.exit.2:
  br label %_25.if.exit.1                                                          ; inst 91
_24.if.else.1:
  br label %_25.if.exit.1                                                          ; inst 92
_25.if.exit.1:
  %63 = add i32 %40, 1                                                             ; inst 93
  br label %_18.while.cond.2                                                       ; inst 94
_26.while.exit.2:
  %64 = add i32 %38, 1                                                             ; inst 95
  br label %_16.while.cond.1                                                       ; inst 96
_27.while.exit.1:
  %65 = sext i32 %1 to i64                                                         ; inst 97
  %66 = getelementptr [101 x i32], [101 x i32]* %32, i32 0, i64 %65                ; inst 98
  %67 = load i32, i32* %66                                                         ; inst 99
  ret i32 %67                                                                      ; inst 100
}

define i32 @jobSchedulingDP(i32 %0) {
_0.entry.0:
  %1 = alloca [30 x i32]                                                           ; inst 1
  %2 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 30                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = alloca [30 x i32]                                                           ; inst 11
  %8 = getelementptr [30 x i32], [30 x i32]* %7, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 14
  %10 = icmp slt i32 %9, 30                                                        ; inst 15
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 17
  store i32 0, i32* %11                                                            ; inst 18
  %12 = add i32 %9, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %13 = phi i32 [33, %_6.array.exit.1], [%21, %_11.if.exit.0]                      ; inst 22
  %14 = phi i32 [0, %_6.array.exit.1], [%30, %_11.if.exit.0]                       ; inst 23
  %15 = icmp slt i32 %14, %0                                                       ; inst 24
  br i1 %15, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 25
_8.while.body.0:
  %16 = mul i32 %13, 1664                                                          ; inst 26
  %17 = add i32 %16, 904223                                                        ; inst 27
  %18 = srem i32 %17, 83647                                                        ; inst 28
  %19 = icmp slt i32 %18, 0                                                        ; inst 29
  br i1 %19, label %_9.if.then.0, label %_10.if.else.0                             ; inst 30
_9.if.then.0:
  %20 = sub i32 0, %18                                                             ; inst 31
  br label %_11.if.exit.0                                                          ; inst 32
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 33
_11.if.exit.0:
  %21 = phi i32 [%20, %_9.if.then.0], [%18, %_10.if.else.0]                        ; inst 34
  %22 = sext i32 %14 to i64                                                        ; inst 35
  %23 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %22                   ; inst 36
  %24 = srem i32 %21, 100                                                          ; inst 37
  %25 = add i32 10, %24                                                            ; inst 38
  store i32 %25, i32* %23                                                          ; inst 39
  %26 = sext i32 %14 to i64                                                        ; inst 40
  %27 = getelementptr [30 x i32], [30 x i32]* %7, i32 0, i64 %26                   ; inst 41
  %28 = srem i32 %21, 20                                                           ; inst 42
  %29 = add i32 1, %28                                                             ; inst 43
  store i32 %29, i32* %27                                                          ; inst 44
  %30 = add i32 %14, 1                                                             ; inst 45
  br label %_7.while.cond.0                                                        ; inst 46
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 47
_13.while.cond.1:
  %31 = phi i32 [0, %_12.while.exit.0], [%71, %_20.while.exit.2]                   ; inst 48
  %32 = sub i32 %0, 1                                                              ; inst 49
  %33 = icmp slt i32 %31, %32                                                      ; inst 50
  br i1 %33, label %_14.while.body.1, label %_21.while.exit.1                      ; inst 51
_14.while.body.1:
  br label %_15.while.cond.2                                                       ; inst 52
_15.while.cond.2:
  %34 = phi i32 [0, %_14.while.body.1], [%70, %_19.if.exit.1]                      ; inst 53
  %35 = sub i32 %0, %31                                                            ; inst 54
  %36 = sub i32 %35, 1                                                             ; inst 55
  %37 = icmp slt i32 %34, %36                                                      ; inst 56
  br i1 %37, label %_16.while.body.2, label %_20.while.exit.2                      ; inst 57
_16.while.body.2:
  %38 = sext i32 %34 to i64                                                        ; inst 58
  %39 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %38                   ; inst 59
  %40 = load i32, i32* %39                                                         ; inst 60
  %41 = add i32 %34, 1                                                             ; inst 61
  %42 = sext i32 %41 to i64                                                        ; inst 62
  %43 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %42                   ; inst 63
  %44 = load i32, i32* %43                                                         ; inst 64
  %45 = icmp slt i32 %40, %44                                                      ; inst 65
  br i1 %45, label %_17.if.then.1, label %_18.if.else.1                            ; inst 66
_17.if.then.1:
  %46 = sext i32 %34 to i64                                                        ; inst 67
  %47 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %46                   ; inst 68
  %48 = load i32, i32* %47                                                         ; inst 69
  %49 = sext i32 %34 to i64                                                        ; inst 70
  %50 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %49                   ; inst 71
  %51 = add i32 %34, 1                                                             ; inst 72
  %52 = sext i32 %51 to i64                                                        ; inst 73
  %53 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %52                   ; inst 74
  %54 = load i32, i32* %53                                                         ; inst 75
  store i32 %54, i32* %50                                                          ; inst 76
  %55 = add i32 %34, 1                                                             ; inst 77
  %56 = sext i32 %55 to i64                                                        ; inst 78
  %57 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %56                   ; inst 79
  store i32 %48, i32* %57                                                          ; inst 80
  %58 = sext i32 %34 to i64                                                        ; inst 81
  %59 = getelementptr [30 x i32], [30 x i32]* %7, i32 0, i64 %58                   ; inst 82
  %60 = load i32, i32* %59                                                         ; inst 83
  %61 = sext i32 %34 to i64                                                        ; inst 84
  %62 = getelementptr [30 x i32], [30 x i32]* %7, i32 0, i64 %61                   ; inst 85
  %63 = add i32 %34, 1                                                             ; inst 86
  %64 = sext i32 %63 to i64                                                        ; inst 87
  %65 = getelementptr [30 x i32], [30 x i32]* %7, i32 0, i64 %64                   ; inst 88
  %66 = load i32, i32* %65                                                         ; inst 89
  store i32 %66, i32* %62                                                          ; inst 90
  %67 = add i32 %34, 1                                                             ; inst 91
  %68 = sext i32 %67 to i64                                                        ; inst 92
  %69 = getelementptr [30 x i32], [30 x i32]* %7, i32 0, i64 %68                   ; inst 93
  store i32 %60, i32* %69                                                          ; inst 94
  br label %_19.if.exit.1                                                          ; inst 95
_18.if.else.1:
  br label %_19.if.exit.1                                                          ; inst 96
_19.if.exit.1:
  %70 = add i32 %34, 1                                                             ; inst 97
  br label %_15.while.cond.2                                                       ; inst 98
_20.while.exit.2:
  %71 = add i32 %31, 1                                                             ; inst 99
  br label %_13.while.cond.1                                                       ; inst 100
_21.while.exit.1:
  %72 = alloca [20 x i1]                                                           ; inst 101
  %73 = getelementptr [20 x i1], [20 x i1]* %72, i32 0, i32 0                      ; inst 102
  br label %_22.array.cond.2                                                       ; inst 103
_22.array.cond.2:
  %74 = phi i32 [0, %_21.while.exit.1], [%77, %_23.array.body.2]                   ; inst 104
  %75 = icmp slt i32 %74, 20                                                       ; inst 105
  br i1 %75, label %_23.array.body.2, label %_24.array.exit.2                      ; inst 106
_23.array.body.2:
  %76 = getelementptr i1, i1* %73, i32 %74                                         ; inst 107
  store i1 0, i1* %76                                                              ; inst 108
  %77 = add i32 %74, 1                                                             ; inst 109
  br label %_22.array.cond.2                                                       ; inst 110
_24.array.exit.2:
  br label %_25.while.cond.3                                                       ; inst 111
_25.while.cond.3:
  %78 = phi i32 [0, %_24.array.exit.2], [%101, %_35.while.exit.4]                  ; inst 112
  %79 = phi i32 [0, %_24.array.exit.2], [%100, %_35.while.exit.4]                  ; inst 113
  %80 = icmp slt i32 %78, %0                                                       ; inst 114
  br i1 %80, label %_26.while.body.3, label %_36.while.exit.3                      ; inst 115
_26.while.body.3:
  %81 = sext i32 %78 to i64                                                        ; inst 116
  %82 = getelementptr [30 x i32], [30 x i32]* %7, i32 0, i64 %81                   ; inst 117
  %83 = load i32, i32* %82                                                         ; inst 118
  %84 = sub i32 %83, 1                                                             ; inst 119
  br label %_27.while.cond.4                                                       ; inst 120
_27.while.cond.4:
  %85 = phi i32 [%84, %_26.while.body.3], [%99, %_34.if.exit.2]                    ; inst 121
  %86 = icmp sge i32 %85, 0                                                        ; inst 122
  br i1 %86, label %_28.while.body.4, label %_37.critical_edge.0                   ; inst 123
_28.while.body.4:
  %87 = icmp slt i32 %85, 20                                                       ; inst 124
  br i1 %87, label %_29.lazy.then.0, label %_30.lazy.else.0                        ; inst 125
_29.lazy.then.0:
  %88 = sext i32 %85 to i64                                                        ; inst 126
  %89 = getelementptr [20 x i1], [20 x i1]* %72, i32 0, i64 %88                    ; inst 127
  %90 = load i1, i1* %89                                                           ; inst 128
  %91 = icmp eq i1 %90, 0                                                          ; inst 129
  br label %_31.lazy.exit.0                                                        ; inst 130
_30.lazy.else.0:
  br label %_31.lazy.exit.0                                                        ; inst 131
_31.lazy.exit.0:
  %92 = phi i1 [%91, %_29.lazy.then.0], [0, %_30.lazy.else.0]                      ; inst 132
  br i1 %92, label %_32.if.then.2, label %_33.if.else.2                            ; inst 133
_32.if.then.2:
  %93 = sext i32 %85 to i64                                                        ; inst 134
  %94 = getelementptr [20 x i1], [20 x i1]* %72, i32 0, i64 %93                    ; inst 135
  store i1 1, i1* %94                                                              ; inst 136
  %95 = sext i32 %78 to i64                                                        ; inst 137
  %96 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %95                   ; inst 138
  %97 = load i32, i32* %96                                                         ; inst 139
  %98 = add i32 %79, %97                                                           ; inst 140
  br label %_35.while.exit.4                                                       ; inst 141
_33.if.else.2:
  br label %_34.if.exit.2                                                          ; inst 142
_34.if.exit.2:
  %99 = sub i32 %85, 1                                                             ; inst 143
  br label %_27.while.cond.4                                                       ; inst 144
_35.while.exit.4:
  %100 = phi i32 [%79, %_37.critical_edge.0], [%98, %_32.if.then.2]                ; inst 145
  %101 = add i32 %78, 1                                                            ; inst 146
  br label %_25.while.cond.3                                                       ; inst 147
_36.while.exit.3:
  ret i32 %79                                                                      ; inst 148
_37.critical_edge.0:
  br label %_35.while.exit.4                                                       ; inst 149
}

define i32 @partitionProblemDP(i32 %0) {
_0.entry.0:
  %1 = alloca [40 x i32]                                                           ; inst 1
  %2 = getelementptr [40 x i32], [40 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 40                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i32 [0, %_3.array.exit.0], [%25, %_8.if.exit.0]                         ; inst 12
  %8 = phi i32 [0, %_3.array.exit.0], [%24, %_8.if.exit.0]                         ; inst 13
  %9 = phi i32 [44, %_3.array.exit.0], [%16, %_8.if.exit.0]                        ; inst 14
  %10 = icmp slt i32 %7, %0                                                        ; inst 15
  br i1 %10, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 16
_5.while.body.0:
  %11 = mul i32 %9, 1664                                                           ; inst 17
  %12 = add i32 %11, 904223                                                        ; inst 18
  %13 = srem i32 %12, 83647                                                        ; inst 19
  %14 = icmp slt i32 %13, 0                                                        ; inst 20
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 21
_6.if.then.0:
  %15 = sub i32 0, %13                                                             ; inst 22
  br label %_8.if.exit.0                                                           ; inst 23
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 24
_8.if.exit.0:
  %16 = phi i32 [%15, %_6.if.then.0], [%13, %_7.if.else.0]                         ; inst 25
  %17 = sext i32 %7 to i64                                                         ; inst 26
  %18 = getelementptr [40 x i32], [40 x i32]* %1, i32 0, i64 %17                   ; inst 27
  %19 = srem i32 %16, 50                                                           ; inst 28
  %20 = add i32 1, %19                                                             ; inst 29
  store i32 %20, i32* %18                                                          ; inst 30
  %21 = sext i32 %7 to i64                                                         ; inst 31
  %22 = getelementptr [40 x i32], [40 x i32]* %1, i32 0, i64 %21                   ; inst 32
  %23 = load i32, i32* %22                                                         ; inst 33
  %24 = add i32 %8, %23                                                            ; inst 34
  %25 = add i32 %7, 1                                                              ; inst 35
  br label %_4.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  %26 = srem i32 %8, 2                                                             ; inst 37
  %27 = icmp ne i32 %26, 0                                                         ; inst 38
  br i1 %27, label %_10.if.then.1, label %_11.if.else.1                            ; inst 39
_10.if.then.1:
  ret i32 0                                                                        ; inst 40
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 41
_12.if.exit.1:
  %28 = sdiv i32 %8, 2                                                             ; inst 42
  %29 = alloca [1001 x i1]                                                         ; inst 43
  %30 = getelementptr [1001 x i1], [1001 x i1]* %29, i32 0, i32 0                  ; inst 44
  br label %_13.array.cond.1                                                       ; inst 45
_13.array.cond.1:
  %31 = phi i32 [0, %_12.if.exit.1], [%34, %_14.array.body.1]                      ; inst 46
  %32 = icmp slt i32 %31, 1001                                                     ; inst 47
  br i1 %32, label %_14.array.body.1, label %_15.array.exit.1                      ; inst 48
_14.array.body.1:
  %33 = getelementptr i1, i1* %30, i32 %31                                         ; inst 49
  store i1 0, i1* %33                                                              ; inst 50
  %34 = add i32 %31, 1                                                             ; inst 51
  br label %_13.array.cond.1                                                       ; inst 52
_15.array.exit.1:
  %35 = getelementptr [1001 x i1], [1001 x i1]* %29, i32 0, i64 0                  ; inst 53
  store i1 1, i1* %35                                                              ; inst 54
  br label %_16.while.cond.1                                                       ; inst 55
_16.while.cond.1:
  %36 = phi i32 [0, %_15.array.exit.1], [%57, %_23.while.exit.2]                   ; inst 56
  %37 = icmp slt i32 %36, %0                                                       ; inst 57
  br i1 %37, label %_17.while.body.1, label %_24.while.exit.1                      ; inst 58
_17.while.body.1:
  br label %_18.while.cond.2                                                       ; inst 59
_18.while.cond.2:
  %38 = phi i32 [%28, %_17.while.body.1], [%56, %_22.lazy.exit.0]                  ; inst 60
  %39 = sext i32 %36 to i64                                                        ; inst 61
  %40 = getelementptr [40 x i32], [40 x i32]* %1, i32 0, i64 %39                   ; inst 62
  %41 = load i32, i32* %40                                                         ; inst 63
  %42 = icmp sge i32 %38, %41                                                      ; inst 64
  br i1 %42, label %_19.while.body.2, label %_23.while.exit.2                      ; inst 65
_19.while.body.2:
  %43 = sext i32 %38 to i64                                                        ; inst 66
  %44 = getelementptr [1001 x i1], [1001 x i1]* %29, i32 0, i64 %43                ; inst 67
  %45 = sext i32 %38 to i64                                                        ; inst 68
  %46 = getelementptr [1001 x i1], [1001 x i1]* %29, i32 0, i64 %45                ; inst 69
  %47 = load i1, i1* %46                                                           ; inst 70
  br i1 %47, label %_20.lazy.then.0, label %_21.lazy.else.0                        ; inst 71
_20.lazy.then.0:
  br label %_22.lazy.exit.0                                                        ; inst 72
_21.lazy.else.0:
  %48 = sext i32 %36 to i64                                                        ; inst 73
  %49 = getelementptr [40 x i32], [40 x i32]* %1, i32 0, i64 %48                   ; inst 74
  %50 = load i32, i32* %49                                                         ; inst 75
  %51 = sub i32 %38, %50                                                           ; inst 76
  %52 = sext i32 %51 to i64                                                        ; inst 77
  %53 = getelementptr [1001 x i1], [1001 x i1]* %29, i32 0, i64 %52                ; inst 78
  %54 = load i1, i1* %53                                                           ; inst 79
  br label %_22.lazy.exit.0                                                        ; inst 80
_22.lazy.exit.0:
  %55 = phi i1 [1, %_20.lazy.then.0], [%54, %_21.lazy.else.0]                      ; inst 81
  store i1 %55, i1* %44                                                            ; inst 82
  %56 = sub i32 %38, 1                                                             ; inst 83
  br label %_18.while.cond.2                                                       ; inst 84
_23.while.exit.2:
  %57 = add i32 %36, 1                                                             ; inst 85
  br label %_16.while.cond.1                                                       ; inst 86
_24.while.exit.1:
  %58 = sext i32 %28 to i64                                                        ; inst 87
  %59 = getelementptr [1001 x i1], [1001 x i1]* %29, i32 0, i64 %58                ; inst 88
  %60 = load i1, i1* %59                                                           ; inst 89
  br i1 %60, label %_25.if.then.2, label %_26.if.else.2                            ; inst 90
_25.if.then.2:
  ret i32 1                                                                        ; inst 91
_26.if.else.2:
  ret i32 0                                                                        ; inst 92
_27.if.exit.2:
  unreachable                                                                      ; inst 93
}

define i32 @matrixChainMultiplicationDP(i32 %0) {
_0.entry.0:
  %1 = alloca [21 x i32]                                                           ; inst 1
  %2 = getelementptr [21 x i32], [21 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 21                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i32 [0, %_3.array.exit.0], [%20, %_8.if.exit.0]                         ; inst 12
  %8 = phi i32 [55, %_3.array.exit.0], [%15, %_8.if.exit.0]                        ; inst 13
  %9 = icmp sle i32 %7, %0                                                         ; inst 14
  br i1 %9, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 15
_5.while.body.0:
  %10 = mul i32 %8, 1664                                                           ; inst 16
  %11 = add i32 %10, 904223                                                        ; inst 17
  %12 = srem i32 %11, 83647                                                        ; inst 18
  %13 = icmp slt i32 %12, 0                                                        ; inst 19
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %14 = sub i32 0, %12                                                             ; inst 21
  br label %_8.if.exit.0                                                           ; inst 22
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 23
_8.if.exit.0:
  %15 = phi i32 [%14, %_6.if.then.0], [%12, %_7.if.else.0]                         ; inst 24
  %16 = sext i32 %7 to i64                                                         ; inst 25
  %17 = getelementptr [21 x i32], [21 x i32]* %1, i32 0, i64 %16                   ; inst 26
  %18 = srem i32 %15, 50                                                           ; inst 27
  %19 = add i32 10, %18                                                            ; inst 28
  store i32 %19, i32* %17                                                          ; inst 29
  %20 = add i32 %7, 1                                                              ; inst 30
  br label %_4.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  %21 = alloca [400 x i32]                                                         ; inst 32
  %22 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i32 0                  ; inst 33
  br label %_10.array.cond.1                                                       ; inst 34
_10.array.cond.1:
  %23 = phi i32 [0, %_9.while.exit.0], [%26, %_11.array.body.1]                    ; inst 35
  %24 = icmp slt i32 %23, 400                                                      ; inst 36
  br i1 %24, label %_11.array.body.1, label %_12.array.exit.1                      ; inst 37
_11.array.body.1:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 38
  store i32 0, i32* %25                                                            ; inst 39
  %26 = add i32 %23, 1                                                             ; inst 40
  br label %_10.array.cond.1                                                       ; inst 41
_12.array.exit.1:
  br label %_13.while.cond.1                                                       ; inst 42
_13.while.cond.1:
  %27 = phi i32 [2, %_12.array.exit.1], [%86, %_23.while.exit.2]                   ; inst 43
  %28 = icmp sle i32 %27, %0                                                       ; inst 44
  br i1 %28, label %_14.while.body.1, label %_24.while.exit.1                      ; inst 45
_14.while.body.1:
  br label %_15.while.cond.2                                                       ; inst 46
_15.while.cond.2:
  %29 = phi i32 [1, %_14.while.body.1], [%85, %_22.while.exit.3]                   ; inst 47
  %30 = sub i32 %0, %27                                                            ; inst 48
  %31 = add i32 %30, 1                                                             ; inst 49
  %32 = icmp sle i32 %29, %31                                                      ; inst 50
  br i1 %32, label %_16.while.body.2, label %_23.while.exit.2                      ; inst 51
_16.while.body.2:
  %33 = add i32 %29, %27                                                           ; inst 52
  %34 = sub i32 %33, 1                                                             ; inst 53
  %35 = sub i32 %29, 1                                                             ; inst 54
  %36 = mul i32 %35, 20                                                            ; inst 55
  %37 = sub i32 %34, 1                                                             ; inst 56
  %38 = add i32 %36, %37                                                           ; inst 57
  %39 = sext i32 %38 to i64                                                        ; inst 58
  %40 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %39                ; inst 59
  store i32 999999, i32* %40                                                       ; inst 60
  br label %_17.while.cond.3                                                       ; inst 61
_17.while.cond.3:
  %41 = phi i32 [%29, %_16.while.body.2], [%84, %_21.if.exit.1]                    ; inst 62
  %42 = icmp slt i32 %41, %34                                                      ; inst 63
  br i1 %42, label %_18.while.body.3, label %_22.while.exit.3                      ; inst 64
_18.while.body.3:
  %43 = sub i32 %29, 1                                                             ; inst 65
  %44 = mul i32 %43, 20                                                            ; inst 66
  %45 = sub i32 %41, 1                                                             ; inst 67
  %46 = add i32 %44, %45                                                           ; inst 68
  %47 = sext i32 %46 to i64                                                        ; inst 69
  %48 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %47                ; inst 70
  %49 = load i32, i32* %48                                                         ; inst 71
  %50 = mul i32 %41, 20                                                            ; inst 72
  %51 = sub i32 %34, 1                                                             ; inst 73
  %52 = add i32 %50, %51                                                           ; inst 74
  %53 = sext i32 %52 to i64                                                        ; inst 75
  %54 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %53                ; inst 76
  %55 = load i32, i32* %54                                                         ; inst 77
  %56 = add i32 %49, %55                                                           ; inst 78
  %57 = sub i32 %29, 1                                                             ; inst 79
  %58 = sext i32 %57 to i64                                                        ; inst 80
  %59 = getelementptr [21 x i32], [21 x i32]* %1, i32 0, i64 %58                   ; inst 81
  %60 = load i32, i32* %59                                                         ; inst 82
  %61 = sext i32 %41 to i64                                                        ; inst 83
  %62 = getelementptr [21 x i32], [21 x i32]* %1, i32 0, i64 %61                   ; inst 84
  %63 = load i32, i32* %62                                                         ; inst 85
  %64 = mul i32 %60, %63                                                           ; inst 86
  %65 = sext i32 %34 to i64                                                        ; inst 87
  %66 = getelementptr [21 x i32], [21 x i32]* %1, i32 0, i64 %65                   ; inst 88
  %67 = load i32, i32* %66                                                         ; inst 89
  %68 = mul i32 %64, %67                                                           ; inst 90
  %69 = add i32 %56, %68                                                           ; inst 91
  %70 = sub i32 %29, 1                                                             ; inst 92
  %71 = mul i32 %70, 20                                                            ; inst 93
  %72 = sub i32 %34, 1                                                             ; inst 94
  %73 = add i32 %71, %72                                                           ; inst 95
  %74 = sext i32 %73 to i64                                                        ; inst 96
  %75 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %74                ; inst 97
  %76 = load i32, i32* %75                                                         ; inst 98
  %77 = icmp slt i32 %69, %76                                                      ; inst 99
  br i1 %77, label %_19.if.then.1, label %_20.if.else.1                            ; inst 100
_19.if.then.1:
  %78 = sub i32 %29, 1                                                             ; inst 101
  %79 = mul i32 %78, 20                                                            ; inst 102
  %80 = sub i32 %34, 1                                                             ; inst 103
  %81 = add i32 %79, %80                                                           ; inst 104
  %82 = sext i32 %81 to i64                                                        ; inst 105
  %83 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %82                ; inst 106
  store i32 %69, i32* %83                                                          ; inst 107
  br label %_21.if.exit.1                                                          ; inst 108
_20.if.else.1:
  br label %_21.if.exit.1                                                          ; inst 109
_21.if.exit.1:
  %84 = add i32 %41, 1                                                             ; inst 110
  br label %_17.while.cond.3                                                       ; inst 111
_22.while.exit.3:
  %85 = add i32 %29, 1                                                             ; inst 112
  br label %_15.while.cond.2                                                       ; inst 113
_23.while.exit.2:
  %86 = add i32 %27, 1                                                             ; inst 114
  br label %_13.while.cond.1                                                       ; inst 115
_24.while.exit.1:
  %87 = sub i32 %0, 1                                                              ; inst 116
  %88 = sext i32 %87 to i64                                                        ; inst 117
  %89 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %88                ; inst 118
  %90 = load i32, i32* %89                                                         ; inst 119
  ret i32 %90                                                                      ; inst 120
}

define void @testGameTheoryDP() {
_0.entry.0:
  call void @printlnInt(i32 1807)                                                  ; inst 1
  %0 = call i32 @optimalGameStrategyDP(i32 20)                                     ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @coinGameDP(i32 30)                                                ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @nimGameDP(i32 25)                                                 ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  call void @printlnInt(i32 1808)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @optimalGameStrategyDP(i32 %0) {
_0.entry.0:
  %1 = alloca [20 x i32]                                                           ; inst 1
  %2 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 20                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i32 [66, %_3.array.exit.0], [%15, %_8.if.exit.0]                        ; inst 12
  %8 = phi i32 [0, %_3.array.exit.0], [%20, %_8.if.exit.0]                         ; inst 13
  %9 = icmp slt i32 %8, %0                                                         ; inst 14
  br i1 %9, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 15
_5.while.body.0:
  %10 = mul i32 %7, 1664                                                           ; inst 16
  %11 = add i32 %10, 904223                                                        ; inst 17
  %12 = srem i32 %11, 83647                                                        ; inst 18
  %13 = icmp slt i32 %12, 0                                                        ; inst 19
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %14 = sub i32 0, %12                                                             ; inst 21
  br label %_8.if.exit.0                                                           ; inst 22
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 23
_8.if.exit.0:
  %15 = phi i32 [%14, %_6.if.then.0], [%12, %_7.if.else.0]                         ; inst 24
  %16 = sext i32 %8 to i64                                                         ; inst 25
  %17 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i64 %16                   ; inst 26
  %18 = srem i32 %15, 100                                                          ; inst 27
  %19 = add i32 1, %18                                                             ; inst 28
  store i32 %19, i32* %17                                                          ; inst 29
  %20 = add i32 %8, 1                                                              ; inst 30
  br label %_4.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  %21 = alloca [400 x i32]                                                         ; inst 32
  %22 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i32 0                  ; inst 33
  br label %_10.array.cond.1                                                       ; inst 34
_10.array.cond.1:
  %23 = phi i32 [0, %_9.while.exit.0], [%26, %_11.array.body.1]                    ; inst 35
  %24 = icmp slt i32 %23, 400                                                      ; inst 36
  br i1 %24, label %_11.array.body.1, label %_12.array.exit.1                      ; inst 37
_11.array.body.1:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 38
  store i32 0, i32* %25                                                            ; inst 39
  %26 = add i32 %23, 1                                                             ; inst 40
  br label %_10.array.cond.1                                                       ; inst 41
_12.array.exit.1:
  br label %_13.while.cond.1                                                       ; inst 42
_13.while.cond.1:
  %27 = phi i32 [0, %_12.array.exit.1], [%36, %_14.while.body.1]                   ; inst 43
  %28 = icmp slt i32 %27, %0                                                       ; inst 44
  br i1 %28, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 45
_14.while.body.1:
  %29 = mul i32 %27, 20                                                            ; inst 46
  %30 = add i32 %29, %27                                                           ; inst 47
  %31 = sext i32 %30 to i64                                                        ; inst 48
  %32 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %31                ; inst 49
  %33 = sext i32 %27 to i64                                                        ; inst 50
  %34 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i64 %33                   ; inst 51
  %35 = load i32, i32* %34                                                         ; inst 52
  store i32 %35, i32* %32                                                          ; inst 53
  %36 = add i32 %27, 1                                                             ; inst 54
  br label %_13.while.cond.1                                                       ; inst 55
_15.while.exit.1:
  br label %_16.while.cond.2                                                       ; inst 56
_16.while.cond.2:
  %37 = phi i32 [2, %_15.while.exit.1], [%74, %_23.while.exit.3]                   ; inst 57
  %38 = icmp sle i32 %37, %0                                                       ; inst 58
  br i1 %38, label %_17.while.body.2, label %_24.while.exit.2                      ; inst 59
_17.while.body.2:
  br label %_18.while.cond.3                                                       ; inst 60
_18.while.cond.3:
  %39 = phi i32 [0, %_17.while.body.2], [%73, %_22.if.exit.1]                      ; inst 61
  %40 = sub i32 %0, %37                                                            ; inst 62
  %41 = icmp sle i32 %39, %40                                                      ; inst 63
  br i1 %41, label %_19.while.body.3, label %_23.while.exit.3                      ; inst 64
_19.while.body.3:
  %42 = add i32 %39, %37                                                           ; inst 65
  %43 = sub i32 %42, 1                                                             ; inst 66
  %44 = sext i32 %39 to i64                                                        ; inst 67
  %45 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i64 %44                   ; inst 68
  %46 = load i32, i32* %45                                                         ; inst 69
  %47 = add i32 %39, 1                                                             ; inst 70
  %48 = mul i32 %47, 20                                                            ; inst 71
  %49 = add i32 %48, %43                                                           ; inst 72
  %50 = sext i32 %49 to i64                                                        ; inst 73
  %51 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %50                ; inst 74
  %52 = load i32, i32* %51                                                         ; inst 75
  %53 = sub i32 %46, %52                                                           ; inst 76
  %54 = sext i32 %43 to i64                                                        ; inst 77
  %55 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i64 %54                   ; inst 78
  %56 = load i32, i32* %55                                                         ; inst 79
  %57 = mul i32 %39, 20                                                            ; inst 80
  %58 = sub i32 %43, 1                                                             ; inst 81
  %59 = add i32 %57, %58                                                           ; inst 82
  %60 = sext i32 %59 to i64                                                        ; inst 83
  %61 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %60                ; inst 84
  %62 = load i32, i32* %61                                                         ; inst 85
  %63 = sub i32 %56, %62                                                           ; inst 86
  %64 = icmp sgt i32 %53, %63                                                      ; inst 87
  br i1 %64, label %_20.if.then.1, label %_21.if.else.1                            ; inst 88
_20.if.then.1:
  %65 = mul i32 %39, 20                                                            ; inst 89
  %66 = add i32 %65, %43                                                           ; inst 90
  %67 = sext i32 %66 to i64                                                        ; inst 91
  %68 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %67                ; inst 92
  store i32 %53, i32* %68                                                          ; inst 93
  br label %_22.if.exit.1                                                          ; inst 94
_21.if.else.1:
  %69 = mul i32 %39, 20                                                            ; inst 95
  %70 = add i32 %69, %43                                                           ; inst 96
  %71 = sext i32 %70 to i64                                                        ; inst 97
  %72 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %71                ; inst 98
  store i32 %63, i32* %72                                                          ; inst 99
  br label %_22.if.exit.1                                                          ; inst 100
_22.if.exit.1:
  %73 = add i32 %39, 1                                                             ; inst 101
  br label %_18.while.cond.3                                                       ; inst 102
_23.while.exit.3:
  %74 = add i32 %37, 1                                                             ; inst 103
  br label %_16.while.cond.2                                                       ; inst 104
_24.while.exit.2:
  %75 = sub i32 %0, 1                                                              ; inst 105
  %76 = sext i32 %75 to i64                                                        ; inst 106
  %77 = getelementptr [400 x i32], [400 x i32]* %21, i32 0, i64 %76                ; inst 107
  %78 = load i32, i32* %77                                                         ; inst 108
  ret i32 %78                                                                      ; inst 109
}

define i32 @coinGameDP(i32 %0) {
_0.entry.0:
  %1 = alloca [30 x i32]                                                           ; inst 1
  %2 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 30                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i32 [77, %_3.array.exit.0], [%15, %_8.if.exit.0]                        ; inst 12
  %8 = phi i32 [0, %_3.array.exit.0], [%20, %_8.if.exit.0]                         ; inst 13
  %9 = icmp slt i32 %8, %0                                                         ; inst 14
  br i1 %9, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 15
_5.while.body.0:
  %10 = mul i32 %7, 1664                                                           ; inst 16
  %11 = add i32 %10, 904223                                                        ; inst 17
  %12 = srem i32 %11, 83647                                                        ; inst 18
  %13 = icmp slt i32 %12, 0                                                        ; inst 19
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %14 = sub i32 0, %12                                                             ; inst 21
  br label %_8.if.exit.0                                                           ; inst 22
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 23
_8.if.exit.0:
  %15 = phi i32 [%14, %_6.if.then.0], [%12, %_7.if.else.0]                         ; inst 24
  %16 = sext i32 %8 to i64                                                         ; inst 25
  %17 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %16                   ; inst 26
  %18 = srem i32 %15, 50                                                           ; inst 27
  %19 = add i32 1, %18                                                             ; inst 28
  store i32 %19, i32* %17                                                          ; inst 29
  %20 = add i32 %8, 1                                                              ; inst 30
  br label %_4.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  %21 = alloca [900 x i32]                                                         ; inst 32
  %22 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i32 0                  ; inst 33
  br label %_10.array.cond.1                                                       ; inst 34
_10.array.cond.1:
  %23 = phi i32 [0, %_9.while.exit.0], [%26, %_11.array.body.1]                    ; inst 35
  %24 = icmp slt i32 %23, 900                                                      ; inst 36
  br i1 %24, label %_11.array.body.1, label %_12.array.exit.1                      ; inst 37
_11.array.body.1:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 38
  store i32 0, i32* %25                                                            ; inst 39
  %26 = add i32 %23, 1                                                             ; inst 40
  br label %_10.array.cond.1                                                       ; inst 41
_12.array.exit.1:
  br label %_13.while.cond.1                                                       ; inst 42
_13.while.cond.1:
  %27 = phi i32 [0, %_12.array.exit.1], [%63, %_20.if.exit.1]                      ; inst 43
  %28 = icmp slt i32 %27, %0                                                       ; inst 44
  br i1 %28, label %_14.while.body.1, label %_21.while.exit.1                      ; inst 45
_14.while.body.1:
  %29 = mul i32 %27, 30                                                            ; inst 46
  %30 = add i32 %29, %27                                                           ; inst 47
  %31 = sext i32 %30 to i64                                                        ; inst 48
  %32 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %31                ; inst 49
  %33 = sext i32 %27 to i64                                                        ; inst 50
  %34 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %33                   ; inst 51
  %35 = load i32, i32* %34                                                         ; inst 52
  store i32 %35, i32* %32                                                          ; inst 53
  %36 = add i32 %27, 1                                                             ; inst 54
  %37 = icmp slt i32 %36, %0                                                       ; inst 55
  br i1 %37, label %_15.if.then.1, label %_19.if.else.1                            ; inst 56
_15.if.then.1:
  %38 = sext i32 %27 to i64                                                        ; inst 57
  %39 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %38                   ; inst 58
  %40 = load i32, i32* %39                                                         ; inst 59
  %41 = add i32 %27, 1                                                             ; inst 60
  %42 = sext i32 %41 to i64                                                        ; inst 61
  %43 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %42                   ; inst 62
  %44 = load i32, i32* %43                                                         ; inst 63
  %45 = icmp sgt i32 %40, %44                                                      ; inst 64
  br i1 %45, label %_16.if.then.2, label %_17.if.else.2                            ; inst 65
_16.if.then.2:
  %46 = mul i32 %27, 30                                                            ; inst 66
  %47 = add i32 %27, 1                                                             ; inst 67
  %48 = add i32 %46, %47                                                           ; inst 68
  %49 = sext i32 %48 to i64                                                        ; inst 69
  %50 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %49                ; inst 70
  %51 = sext i32 %27 to i64                                                        ; inst 71
  %52 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %51                   ; inst 72
  %53 = load i32, i32* %52                                                         ; inst 73
  store i32 %53, i32* %50                                                          ; inst 74
  br label %_18.if.exit.2                                                          ; inst 75
_17.if.else.2:
  %54 = mul i32 %27, 30                                                            ; inst 76
  %55 = add i32 %27, 1                                                             ; inst 77
  %56 = add i32 %54, %55                                                           ; inst 78
  %57 = sext i32 %56 to i64                                                        ; inst 79
  %58 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %57                ; inst 80
  %59 = add i32 %27, 1                                                             ; inst 81
  %60 = sext i32 %59 to i64                                                        ; inst 82
  %61 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %60                   ; inst 83
  %62 = load i32, i32* %61                                                         ; inst 84
  store i32 %62, i32* %58                                                          ; inst 85
  br label %_18.if.exit.2                                                          ; inst 86
_18.if.exit.2:
  br label %_20.if.exit.1                                                          ; inst 87
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 88
_20.if.exit.1:
  %63 = add i32 %27, 1                                                             ; inst 89
  br label %_13.while.cond.1                                                       ; inst 90
_21.while.exit.1:
  br label %_22.while.cond.2                                                       ; inst 91
_22.while.cond.2:
  %64 = phi i32 [3, %_21.while.exit.1], [%145, %_35.while.exit.3]                  ; inst 92
  %65 = icmp sle i32 %64, %0                                                       ; inst 93
  br i1 %65, label %_23.while.body.2, label %_36.while.exit.2                      ; inst 94
_23.while.body.2:
  br label %_24.while.cond.3                                                       ; inst 95
_24.while.cond.3:
  %66 = phi i32 [0, %_23.while.body.2], [%144, %_34.if.exit.5]                     ; inst 96
  %67 = sub i32 %0, %64                                                            ; inst 97
  %68 = icmp sle i32 %66, %67                                                      ; inst 98
  br i1 %68, label %_25.while.body.3, label %_35.while.exit.3                      ; inst 99
_25.while.body.3:
  %69 = add i32 %66, %64                                                           ; inst 100
  %70 = sub i32 %69, 1                                                             ; inst 101
  %71 = sext i32 %66 to i64                                                        ; inst 102
  %72 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %71                   ; inst 103
  %73 = load i32, i32* %72                                                         ; inst 104
  %74 = add i32 %66, 2                                                             ; inst 105
  %75 = mul i32 %74, 30                                                            ; inst 106
  %76 = add i32 %75, %70                                                           ; inst 107
  %77 = sext i32 %76 to i64                                                        ; inst 108
  %78 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %77                ; inst 109
  %79 = load i32, i32* %78                                                         ; inst 110
  %80 = add i32 %66, 1                                                             ; inst 111
  %81 = mul i32 %80, 30                                                            ; inst 112
  %82 = sub i32 %70, 1                                                             ; inst 113
  %83 = add i32 %81, %82                                                           ; inst 114
  %84 = sext i32 %83 to i64                                                        ; inst 115
  %85 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %84                ; inst 116
  %86 = load i32, i32* %85                                                         ; inst 117
  %87 = icmp slt i32 %79, %86                                                      ; inst 118
  br i1 %87, label %_26.if.then.3, label %_27.if.else.3                            ; inst 119
_26.if.then.3:
  %88 = add i32 %66, 2                                                             ; inst 120
  %89 = mul i32 %88, 30                                                            ; inst 121
  %90 = add i32 %89, %70                                                           ; inst 122
  %91 = sext i32 %90 to i64                                                        ; inst 123
  %92 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %91                ; inst 124
  %93 = load i32, i32* %92                                                         ; inst 125
  br label %_28.if.exit.3                                                          ; inst 126
_27.if.else.3:
  %94 = add i32 %66, 1                                                             ; inst 127
  %95 = mul i32 %94, 30                                                            ; inst 128
  %96 = sub i32 %70, 1                                                             ; inst 129
  %97 = add i32 %95, %96                                                           ; inst 130
  %98 = sext i32 %97 to i64                                                        ; inst 131
  %99 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %98                ; inst 132
  %100 = load i32, i32* %99                                                        ; inst 133
  br label %_28.if.exit.3                                                          ; inst 134
_28.if.exit.3:
  %101 = phi i32 [%93, %_26.if.then.3], [%100, %_27.if.else.3]                     ; inst 135
  %102 = add i32 %73, %101                                                         ; inst 136
  %103 = sext i32 %70 to i64                                                       ; inst 137
  %104 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i64 %103                 ; inst 138
  %105 = load i32, i32* %104                                                       ; inst 139
  %106 = mul i32 %66, 30                                                           ; inst 140
  %107 = sub i32 %70, 2                                                            ; inst 141
  %108 = add i32 %106, %107                                                        ; inst 142
  %109 = sext i32 %108 to i64                                                      ; inst 143
  %110 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %109              ; inst 144
  %111 = load i32, i32* %110                                                       ; inst 145
  %112 = add i32 %66, 1                                                            ; inst 146
  %113 = mul i32 %112, 30                                                          ; inst 147
  %114 = sub i32 %70, 1                                                            ; inst 148
  %115 = add i32 %113, %114                                                        ; inst 149
  %116 = sext i32 %115 to i64                                                      ; inst 150
  %117 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %116              ; inst 151
  %118 = load i32, i32* %117                                                       ; inst 152
  %119 = icmp slt i32 %111, %118                                                   ; inst 153
  br i1 %119, label %_29.if.then.4, label %_30.if.else.4                           ; inst 154
_29.if.then.4:
  %120 = mul i32 %66, 30                                                           ; inst 155
  %121 = sub i32 %70, 2                                                            ; inst 156
  %122 = add i32 %120, %121                                                        ; inst 157
  %123 = sext i32 %122 to i64                                                      ; inst 158
  %124 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %123              ; inst 159
  %125 = load i32, i32* %124                                                       ; inst 160
  br label %_31.if.exit.4                                                          ; inst 161
_30.if.else.4:
  %126 = add i32 %66, 1                                                            ; inst 162
  %127 = mul i32 %126, 30                                                          ; inst 163
  %128 = sub i32 %70, 1                                                            ; inst 164
  %129 = add i32 %127, %128                                                        ; inst 165
  %130 = sext i32 %129 to i64                                                      ; inst 166
  %131 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %130              ; inst 167
  %132 = load i32, i32* %131                                                       ; inst 168
  br label %_31.if.exit.4                                                          ; inst 169
_31.if.exit.4:
  %133 = phi i32 [%125, %_29.if.then.4], [%132, %_30.if.else.4]                    ; inst 170
  %134 = add i32 %105, %133                                                        ; inst 171
  %135 = icmp sgt i32 %102, %134                                                   ; inst 172
  br i1 %135, label %_32.if.then.5, label %_33.if.else.5                           ; inst 173
_32.if.then.5:
  %136 = mul i32 %66, 30                                                           ; inst 174
  %137 = add i32 %136, %70                                                         ; inst 175
  %138 = sext i32 %137 to i64                                                      ; inst 176
  %139 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %138              ; inst 177
  store i32 %102, i32* %139                                                        ; inst 178
  br label %_34.if.exit.5                                                          ; inst 179
_33.if.else.5:
  %140 = mul i32 %66, 30                                                           ; inst 180
  %141 = add i32 %140, %70                                                         ; inst 181
  %142 = sext i32 %141 to i64                                                      ; inst 182
  %143 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %142              ; inst 183
  store i32 %134, i32* %143                                                        ; inst 184
  br label %_34.if.exit.5                                                          ; inst 185
_34.if.exit.5:
  %144 = add i32 %66, 1                                                            ; inst 186
  br label %_24.while.cond.3                                                       ; inst 187
_35.while.exit.3:
  %145 = add i32 %64, 1                                                            ; inst 188
  br label %_22.while.cond.2                                                       ; inst 189
_36.while.exit.2:
  %146 = sub i32 %0, 1                                                             ; inst 190
  %147 = sext i32 %146 to i64                                                      ; inst 191
  %148 = getelementptr [900 x i32], [900 x i32]* %21, i32 0, i64 %147              ; inst 192
  %149 = load i32, i32* %148                                                       ; inst 193
  ret i32 %149                                                                     ; inst 194
}

define i32 @nimGameDP(i32 %0) {
_0.entry.0:
  %1 = alloca [25 x i32]                                                           ; inst 1
  %2 = getelementptr [25 x i32], [25 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 25                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i32 [88, %_3.array.exit.0], [%15, %_8.if.exit.0]                        ; inst 12
  %8 = phi i32 [0, %_3.array.exit.0], [%20, %_8.if.exit.0]                         ; inst 13
  %9 = icmp slt i32 %8, %0                                                         ; inst 14
  br i1 %9, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 15
_5.while.body.0:
  %10 = mul i32 %7, 1664                                                           ; inst 16
  %11 = add i32 %10, 904223                                                        ; inst 17
  %12 = srem i32 %11, 83647                                                        ; inst 18
  %13 = icmp slt i32 %12, 0                                                        ; inst 19
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %14 = sub i32 0, %12                                                             ; inst 21
  br label %_8.if.exit.0                                                           ; inst 22
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 23
_8.if.exit.0:
  %15 = phi i32 [%14, %_6.if.then.0], [%12, %_7.if.else.0]                         ; inst 24
  %16 = sext i32 %8 to i64                                                         ; inst 25
  %17 = getelementptr [25 x i32], [25 x i32]* %1, i32 0, i64 %16                   ; inst 26
  %18 = srem i32 %15, 20                                                           ; inst 27
  %19 = add i32 1, %18                                                             ; inst 28
  store i32 %19, i32* %17                                                          ; inst 29
  %20 = add i32 %8, 1                                                              ; inst 30
  br label %_4.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 32
_10.while.cond.1:
  %21 = phi i32 [0, %_9.while.exit.0], [%28, %_11.while.body.1]                    ; inst 33
  %22 = phi i32 [0, %_9.while.exit.0], [%27, %_11.while.body.1]                    ; inst 34
  %23 = icmp slt i32 %21, %0                                                       ; inst 35
  br i1 %23, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 36
_11.while.body.1:
  %24 = sext i32 %21 to i64                                                        ; inst 37
  %25 = getelementptr [25 x i32], [25 x i32]* %1, i32 0, i64 %24                   ; inst 38
  %26 = load i32, i32* %25                                                         ; inst 39
  %27 = xor i32 %22, %26                                                           ; inst 40
  %28 = add i32 %21, 1                                                             ; inst 41
  br label %_10.while.cond.1                                                       ; inst 42
_12.while.exit.1:
  br label %_13.while.cond.2                                                       ; inst 43
_13.while.cond.2:
  %29 = phi i32 [0, %_12.while.exit.1], [%45, %_17.if.exit.1]                      ; inst 44
  %30 = phi i32 [0, %_12.while.exit.1], [%46, %_17.if.exit.1]                      ; inst 45
  %31 = icmp slt i32 %30, %0                                                       ; inst 46
  br i1 %31, label %_14.while.body.2, label %_18.while.exit.2                      ; inst 47
_14.while.body.2:
  %32 = sext i32 %30 to i64                                                        ; inst 48
  %33 = getelementptr [25 x i32], [25 x i32]* %1, i32 0, i64 %32                   ; inst 49
  %34 = load i32, i32* %33                                                         ; inst 50
  %35 = xor i32 %22, %34                                                           ; inst 51
  %36 = sext i32 %30 to i64                                                        ; inst 52
  %37 = getelementptr [25 x i32], [25 x i32]* %1, i32 0, i64 %36                   ; inst 53
  %38 = load i32, i32* %37                                                         ; inst 54
  %39 = icmp slt i32 %35, %38                                                      ; inst 55
  br i1 %39, label %_15.if.then.1, label %_16.if.else.1                            ; inst 56
_15.if.then.1:
  %40 = sext i32 %30 to i64                                                        ; inst 57
  %41 = getelementptr [25 x i32], [25 x i32]* %1, i32 0, i64 %40                   ; inst 58
  %42 = load i32, i32* %41                                                         ; inst 59
  %43 = sub i32 %42, %35                                                           ; inst 60
  %44 = add i32 %29, %43                                                           ; inst 61
  br label %_17.if.exit.1                                                          ; inst 62
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 63
_17.if.exit.1:
  %45 = phi i32 [%44, %_15.if.then.1], [%29, %_16.if.else.1]                       ; inst 64
  %46 = add i32 %30, 1                                                             ; inst 65
  br label %_13.while.cond.2                                                       ; inst 66
_18.while.exit.2:
  ret i32 %29                                                                      ; inst 67
}

define void @testAdvancedDPPatterns() {
_0.entry.0:
  call void @printlnInt(i32 1809)                                                  ; inst 1
  %0 = call i32 @digitDP(i32 12345)                                                ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @bitmaskDP(i32 15)                                                 ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @treeDP(i32 20)                                                    ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  call void @printlnInt(i32 1810)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @digitDP(i32 %0) {
_0.entry.0:
  %1 = alloca [10 x i32]                                                           ; inst 1
  %2 = alloca [100 x i32]                                                          ; inst 2
  %3 = alloca [10 x i32]                                                           ; inst 3
  %4 = getelementptr [10 x i32], [10 x i32]* %3, i32 0, i32 0                      ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 6
  %6 = icmp slt i32 %5, 10                                                         ; inst 7
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 9
  store i32 0, i32* %7                                                             ; inst 10
  %8 = add i32 %5, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %9 = phi i32 [%0, %_3.array.exit.0], [%15, %_5.while.body.0]                     ; inst 14
  %10 = phi i32 [0, %_3.array.exit.0], [%16, %_5.while.body.0]                     ; inst 15
  %11 = icmp sgt i32 %9, 0                                                         ; inst 16
  br i1 %11, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 17
_5.while.body.0:
  %12 = sext i32 %10 to i64                                                        ; inst 18
  %13 = getelementptr [10 x i32], [10 x i32]* %3, i32 0, i64 %12                   ; inst 19
  %14 = srem i32 %9, 10                                                            ; inst 20
  store i32 %14, i32* %13                                                          ; inst 21
  %15 = sdiv i32 %9, 10                                                            ; inst 22
  %16 = add i32 %10, 1                                                             ; inst 23
  br label %_4.while.cond.0                                                        ; inst 24
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 25
_7.while.cond.1:
  %17 = phi i32 [0, %_6.while.exit.0], [%34, %_8.while.body.1]                     ; inst 26
  %18 = sdiv i32 %10, 2                                                            ; inst 27
  %19 = icmp slt i32 %17, %18                                                      ; inst 28
  br i1 %19, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 29
_8.while.body.1:
  %20 = sext i32 %17 to i64                                                        ; inst 30
  %21 = getelementptr [10 x i32], [10 x i32]* %3, i32 0, i64 %20                   ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  %23 = sext i32 %17 to i64                                                        ; inst 33
  %24 = getelementptr [10 x i32], [10 x i32]* %3, i32 0, i64 %23                   ; inst 34
  %25 = sub i32 %10, 1                                                             ; inst 35
  %26 = sub i32 %25, %17                                                           ; inst 36
  %27 = sext i32 %26 to i64                                                        ; inst 37
  %28 = getelementptr [10 x i32], [10 x i32]* %3, i32 0, i64 %27                   ; inst 38
  %29 = load i32, i32* %28                                                         ; inst 39
  store i32 %29, i32* %24                                                          ; inst 40
  %30 = sub i32 %10, 1                                                             ; inst 41
  %31 = sub i32 %30, %17                                                           ; inst 42
  %32 = sext i32 %31 to i64                                                        ; inst 43
  %33 = getelementptr [10 x i32], [10 x i32]* %3, i32 0, i64 %32                   ; inst 44
  store i32 %22, i32* %33                                                          ; inst 45
  %34 = add i32 %17, 1                                                             ; inst 46
  br label %_7.while.cond.1                                                        ; inst 47
_9.while.exit.1:
  %35 = alloca [100 x i32]                                                         ; inst 48
  %36 = getelementptr [100 x i32], [100 x i32]* %35, i32 0, i32 0                  ; inst 49
  br label %_10.array.cond.1                                                       ; inst 50
_10.array.cond.1:
  %37 = phi i32 [0, %_9.while.exit.1], [%40, %_11.array.body.1]                    ; inst 51
  %38 = icmp slt i32 %37, 100                                                      ; inst 52
  br i1 %38, label %_11.array.body.1, label %_12.array.exit.1                      ; inst 53
_11.array.body.1:
  %39 = getelementptr i32, i32* %36, i32 %37                                       ; inst 54
  store i32 0, i32* %39                                                            ; inst 55
  %40 = add i32 %37, 1                                                             ; inst 56
  br label %_10.array.cond.1                                                       ; inst 57
_12.array.exit.1:
  call void @memcpy([10 x i32]* %1, [10 x i32]* %3, i64 40)                        ; inst 58
  call void @memcpy([100 x i32]* %2, [100 x i32]* %35, i64 400)                    ; inst 59
  %41 = call i32 @digitDPRecursive([10 x i32]* %1, i32 %10, i32 0, i32 0, i1 1, [100 x i32]* %2) ; inst 60
  ret i32 %41                                                                      ; inst 61
}

define i32 @digitDPRecursive([10 x i32]* %0, i32 %1, i32 %2, i32 %3, i1 %4, [100 x i32]* %5) {
_0.entry.0:
  %6 = alloca [10 x i32]                                                           ; inst 1
  %7 = alloca [100 x i32]                                                          ; inst 2
  %8 = icmp eq i32 %2, %1                                                          ; inst 3
  br i1 %8, label %_1.if.then.0, label %_5.if.else.0                               ; inst 4
_1.if.then.0:
  %9 = icmp eq i32 %3, 0                                                           ; inst 5
  br i1 %9, label %_2.if.then.1, label %_3.if.else.1                               ; inst 6
_2.if.then.1:
  ret i32 1                                                                        ; inst 7
_3.if.else.1:
  ret i32 0                                                                        ; inst 8
_4.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 9
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 10
_6.if.exit.0:
  %10 = phi i32 [%1, %_4.if.exit.1], [%1, %_5.if.else.0]                           ; inst 11
  %11 = phi i32 [%2, %_4.if.exit.1], [%2, %_5.if.else.0]                           ; inst 12
  %12 = phi i32 [%3, %_4.if.exit.1], [%3, %_5.if.else.0]                           ; inst 13
  %13 = phi i1 [%4, %_4.if.exit.1], [%4, %_5.if.else.0]                            ; inst 14
  %14 = mul i32 %11, 10                                                            ; inst 15
  %15 = mul i32 %12, 2                                                             ; inst 16
  %16 = add i32 %14, %15                                                           ; inst 17
  br i1 %13, label %_7.if.then.2, label %_8.if.else.2                              ; inst 18
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 19
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 20
_9.if.exit.2:
  %17 = phi i32 [1, %_7.if.then.2], [0, %_8.if.else.2]                             ; inst 21
  %18 = add i32 %16, %17                                                           ; inst 22
  %19 = icmp slt i32 %18, 100                                                      ; inst 23
  br i1 %19, label %_10.lazy.then.0, label %_11.lazy.else.0                        ; inst 24
_10.lazy.then.0:
  %20 = sext i32 %18 to i64                                                        ; inst 25
  %21 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %20                 ; inst 26
  %22 = load i32, i32* %21                                                         ; inst 27
  %23 = icmp ne i32 %22, 0                                                         ; inst 28
  br label %_12.lazy.exit.0                                                        ; inst 29
_11.lazy.else.0:
  br label %_12.lazy.exit.0                                                        ; inst 30
_12.lazy.exit.0:
  %24 = phi i1 [%23, %_10.lazy.then.0], [0, %_11.lazy.else.0]                      ; inst 31
  br i1 %24, label %_13.if.then.3, label %_14.if.else.3                            ; inst 32
_13.if.then.3:
  %25 = sext i32 %18 to i64                                                        ; inst 33
  %26 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %25                 ; inst 34
  %27 = load i32, i32* %26                                                         ; inst 35
  ret i32 %27                                                                      ; inst 36
_14.if.else.3:
  br label %_15.if.exit.3                                                          ; inst 37
_15.if.exit.3:
  br i1 %13, label %_16.if.then.4, label %_17.if.else.4                            ; inst 38
_16.if.then.4:
  %28 = sext i32 %11 to i64                                                        ; inst 39
  %29 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 %28                   ; inst 40
  %30 = load i32, i32* %29                                                         ; inst 41
  br label %_18.if.exit.4                                                          ; inst 42
_17.if.else.4:
  br label %_18.if.exit.4                                                          ; inst 43
_18.if.exit.4:
  %31 = phi i32 [%30, %_16.if.then.4], [9, %_17.if.else.4]                         ; inst 44
  br label %_19.while.cond.0                                                       ; inst 45
_19.while.cond.0:
  %32 = phi i32 [0, %_18.if.exit.4], [%41, %_23.lazy.exit.1]                       ; inst 46
  %33 = phi i32 [0, %_18.if.exit.4], [%42, %_23.lazy.exit.1]                       ; inst 47
  %34 = icmp sle i32 %33, %31                                                      ; inst 48
  br i1 %34, label %_20.while.body.0, label %_24.while.exit.0                      ; inst 49
_20.while.body.0:
  %35 = add i32 %12, %33                                                           ; inst 50
  %36 = srem i32 %35, 3                                                            ; inst 51
  br i1 %13, label %_21.lazy.then.1, label %_22.lazy.else.1                        ; inst 52
_21.lazy.then.1:
  %37 = icmp eq i32 %33, %31                                                       ; inst 53
  br label %_23.lazy.exit.1                                                        ; inst 54
_22.lazy.else.1:
  br label %_23.lazy.exit.1                                                        ; inst 55
_23.lazy.exit.1:
  %38 = phi i1 [%37, %_21.lazy.then.1], [0, %_22.lazy.else.1]                      ; inst 56
  %39 = add i32 %11, 1                                                             ; inst 57
  call void @memcpy([10 x i32]* %6, [10 x i32]* %0, i64 40)                        ; inst 58
  call void @memcpy([100 x i32]* %7, [100 x i32]* %5, i64 400)                     ; inst 59
  %40 = call i32 @digitDPRecursive([10 x i32]* %6, i32 %10, i32 %39, i32 %36, i1 %38, [100 x i32]* %7) ; inst 60
  %41 = add i32 %32, %40                                                           ; inst 61
  %42 = add i32 %33, 1                                                             ; inst 62
  br label %_19.while.cond.0                                                       ; inst 63
_24.while.exit.0:
  %43 = icmp slt i32 %18, 100                                                      ; inst 64
  br i1 %43, label %_25.if.then.5, label %_26.if.else.5                            ; inst 65
_25.if.then.5:
  %44 = sext i32 %18 to i64                                                        ; inst 66
  %45 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %44                 ; inst 67
  store i32 %32, i32* %45                                                          ; inst 68
  br label %_27.if.exit.5                                                          ; inst 69
_26.if.else.5:
  br label %_27.if.exit.5                                                          ; inst 70
_27.if.exit.5:
  ret i32 %32                                                                      ; inst 71
}

define i32 @bitmaskDP(i32 %0) {
_0.entry.0:
  %1 = alloca [225 x i32]                                                          ; inst 1
  %2 = alloca [225 x i32]                                                          ; inst 2
  %3 = getelementptr [225 x i32], [225 x i32]* %2, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 225                                                        ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 8
  store i32 0, i32* %6                                                             ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %8 = phi i32 [99, %_3.array.exit.0], [%11, %_14.while.exit.1]                    ; inst 13
  %9 = phi i32 [0, %_3.array.exit.0], [%33, %_14.while.exit.1]                     ; inst 14
  %10 = icmp slt i32 %9, %0                                                        ; inst 15
  br i1 %10, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 16
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 17
_6.while.cond.1:
  %11 = phi i32 [%8, %_5.while.body.0], [%31, %_13.if.exit.0]                      ; inst 18
  %12 = phi i32 [0, %_5.while.body.0], [%32, %_13.if.exit.0]                       ; inst 19
  %13 = icmp slt i32 %12, %0                                                       ; inst 20
  br i1 %13, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 21
_7.while.body.1:
  %14 = icmp eq i32 %9, %12                                                        ; inst 22
  br i1 %14, label %_8.if.then.0, label %_9.if.else.0                              ; inst 23
_8.if.then.0:
  %15 = mul i32 %9, %0                                                             ; inst 24
  %16 = add i32 %15, %12                                                           ; inst 25
  %17 = sext i32 %16 to i64                                                        ; inst 26
  %18 = getelementptr [225 x i32], [225 x i32]* %2, i32 0, i64 %17                 ; inst 27
  store i32 0, i32* %18                                                            ; inst 28
  br label %_13.if.exit.0                                                          ; inst 29
_9.if.else.0:
  %19 = mul i32 %11, 1664                                                          ; inst 30
  %20 = add i32 %19, 904223                                                        ; inst 31
  %21 = srem i32 %20, 83647                                                        ; inst 32
  %22 = icmp slt i32 %21, 0                                                        ; inst 33
  br i1 %22, label %_10.if.then.1, label %_11.if.else.1                            ; inst 34
_10.if.then.1:
  %23 = sub i32 0, %21                                                             ; inst 35
  br label %_12.if.exit.1                                                          ; inst 36
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 37
_12.if.exit.1:
  %24 = phi i32 [%23, %_10.if.then.1], [%21, %_11.if.else.1]                       ; inst 38
  %25 = mul i32 %9, %0                                                             ; inst 39
  %26 = add i32 %25, %12                                                           ; inst 40
  %27 = sext i32 %26 to i64                                                        ; inst 41
  %28 = getelementptr [225 x i32], [225 x i32]* %2, i32 0, i64 %27                 ; inst 42
  %29 = srem i32 %24, 100                                                          ; inst 43
  %30 = add i32 1, %29                                                             ; inst 44
  store i32 %30, i32* %28                                                          ; inst 45
  br label %_13.if.exit.0                                                          ; inst 46
_13.if.exit.0:
  %31 = phi i32 [%11, %_8.if.then.0], [%24, %_12.if.exit.1]                        ; inst 47
  %32 = add i32 %12, 1                                                             ; inst 48
  br label %_6.while.cond.1                                                        ; inst 49
_14.while.exit.1:
  %33 = add i32 %9, 1                                                              ; inst 50
  br label %_4.while.cond.0                                                        ; inst 51
_15.while.exit.0:
  br label %_16.while.cond.2                                                       ; inst 52
_16.while.cond.2:
  %34 = phi i32 [0, %_15.while.exit.0], [%36, %_17.while.body.2]                   ; inst 53
  %35 = icmp slt i32 %34, %0                                                       ; inst 54
  br i1 %35, label %_17.while.body.2, label %_18.while.exit.2                      ; inst 55
_17.while.body.2:
  %36 = add i32 %34, 1                                                             ; inst 56
  br label %_16.while.cond.2                                                       ; inst 57
_18.while.exit.2:
  br label %_19.while.cond.3                                                       ; inst 58
_19.while.cond.3:
  %37 = phi i32 [1, %_18.while.exit.2], [%51, %_32.if.exit.2]                      ; inst 59
  %38 = phi i32 [999999, %_18.while.exit.2], [%50, %_32.if.exit.2]                 ; inst 60
  %39 = icmp slt i32 %37, 32768                                                    ; inst 61
  br i1 %39, label %_20.lazy.then.0, label %_21.lazy.else.0                        ; inst 62
_20.lazy.then.0:
  %40 = icmp slt i32 %37, 1                                                        ; inst 63
  br label %_22.lazy.exit.0                                                        ; inst 64
_21.lazy.else.0:
  br label %_22.lazy.exit.0                                                        ; inst 65
_22.lazy.exit.0:
  %41 = phi i1 [%40, %_20.lazy.then.0], [0, %_21.lazy.else.0]                      ; inst 66
  br i1 %41, label %_23.while.body.3, label %_33.while.exit.3                      ; inst 67
_23.while.body.3:
  %42 = call i32 @countSetBits(i32 %37)                                            ; inst 68
  %43 = icmp eq i32 %42, %0                                                        ; inst 69
  br i1 %43, label %_24.lazy.then.1, label %_25.lazy.else.1                        ; inst 70
_24.lazy.then.1:
  %44 = and i32 %37, 1                                                             ; inst 71
  %45 = icmp ne i32 %44, 0                                                         ; inst 72
  br label %_26.lazy.exit.1                                                        ; inst 73
_25.lazy.else.1:
  br label %_26.lazy.exit.1                                                        ; inst 74
_26.lazy.exit.1:
  %46 = phi i1 [%45, %_24.lazy.then.1], [0, %_25.lazy.else.1]                      ; inst 75
  br i1 %46, label %_27.if.then.2, label %_31.if.else.2                            ; inst 76
_27.if.then.2:
  call void @memcpy([225 x i32]* %1, [225 x i32]* %2, i64 900)                     ; inst 77
  %47 = call i32 @calculateTourCost(i32 %37, [225 x i32]* %1, i32 %0)              ; inst 78
  %48 = icmp slt i32 %47, %38                                                      ; inst 79
  br i1 %48, label %_28.if.then.3, label %_29.if.else.3                            ; inst 80
_28.if.then.3:
  br label %_30.if.exit.3                                                          ; inst 81
_29.if.else.3:
  br label %_30.if.exit.3                                                          ; inst 82
_30.if.exit.3:
  %49 = phi i32 [%47, %_28.if.then.3], [%38, %_29.if.else.3]                       ; inst 83
  br label %_32.if.exit.2                                                          ; inst 84
_31.if.else.2:
  br label %_32.if.exit.2                                                          ; inst 85
_32.if.exit.2:
  %50 = phi i32 [%49, %_30.if.exit.3], [%38, %_31.if.else.2]                       ; inst 86
  %51 = add i32 %37, 1                                                             ; inst 87
  br label %_19.while.cond.3                                                       ; inst 88
_33.while.exit.3:
  ret i32 %38                                                                      ; inst 89
}

define i32 @countSetBits(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [%0, %_0.entry.0], [%6, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 3
  %3 = icmp sgt i32 %1, 0                                                          ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = and i32 %1, 1                                                               ; inst 6
  %5 = add i32 %2, %4                                                              ; inst 7
  %6 = sdiv i32 %1, 2                                                              ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  ret i32 %2                                                                       ; inst 10
}

define i32 @calculateTourCost(i32 %0, [225 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [1, %_0.entry.0], [%18, %_5.if.exit.0]                              ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%16, %_5.if.exit.0]                              ; inst 3
  %5 = phi i32 [0, %_0.entry.0], [%17, %_5.if.exit.0]                              ; inst 4
  %6 = icmp slt i32 %3, %2                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %7 = shl i32 1, %3                                                               ; inst 7
  %8 = and i32 %0, %7                                                              ; inst 8
  %9 = icmp ne i32 %8, 0                                                           ; inst 9
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %10 = mul i32 %4, %2                                                             ; inst 11
  %11 = add i32 %10, %3                                                            ; inst 12
  %12 = sext i32 %11 to i64                                                        ; inst 13
  %13 = getelementptr [225 x i32], [225 x i32]* %1, i32 0, i64 %12                 ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = add i32 %5, %14                                                            ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %16 = phi i32 [%3, %_3.if.then.0], [%4, %_4.if.else.0]                           ; inst 19
  %17 = phi i32 [%15, %_3.if.then.0], [%5, %_4.if.else.0]                          ; inst 20
  %18 = add i32 %3, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  %19 = mul i32 %4, %2                                                             ; inst 23
  %20 = sext i32 %19 to i64                                                        ; inst 24
  %21 = getelementptr [225 x i32], [225 x i32]* %1, i32 0, i64 %20                 ; inst 25
  %22 = load i32, i32* %21                                                         ; inst 26
  %23 = add i32 %5, %22                                                            ; inst 27
  ret i32 %23                                                                      ; inst 28
}

define i32 @treeDP(i32 %0) {
_0.entry.0:
  %1 = alloca [400 x i32]                                                          ; inst 1
  %2 = alloca [20 x i32]                                                           ; inst 2
  %3 = alloca [20 x i32]                                                           ; inst 3
  %4 = alloca [20 x i32]                                                           ; inst 4
  %5 = alloca [400 x i32]                                                          ; inst 5
  %6 = getelementptr [400 x i32], [400 x i32]* %5, i32 0, i32 0                    ; inst 6
  br label %_1.array.cond.0                                                        ; inst 7
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 8
  %8 = icmp slt i32 %7, 400                                                        ; inst 9
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 10
_2.array.body.0:
  %9 = getelementptr i32, i32* %6, i32 %7                                          ; inst 11
  store i32 -1, i32* %9                                                            ; inst 12
  %10 = add i32 %7, 1                                                              ; inst 13
  br label %_1.array.cond.0                                                        ; inst 14
_3.array.exit.0:
  %11 = alloca [20 x i32]                                                          ; inst 15
  %12 = getelementptr [20 x i32], [20 x i32]* %11, i32 0, i32 0                    ; inst 16
  br label %_4.array.cond.1                                                        ; inst 17
_4.array.cond.1:
  %13 = phi i32 [0, %_3.array.exit.0], [%16, %_5.array.body.1]                     ; inst 18
  %14 = icmp slt i32 %13, 20                                                       ; inst 19
  br i1 %14, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 20
_5.array.body.1:
  %15 = getelementptr i32, i32* %12, i32 %13                                       ; inst 21
  store i32 0, i32* %15                                                            ; inst 22
  %16 = add i32 %13, 1                                                             ; inst 23
  br label %_4.array.cond.1                                                        ; inst 24
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 25
_7.while.cond.0:
  %17 = phi i32 [111, %_6.array.exit.1], [%25, %_11.if.exit.0]                     ; inst 26
  %18 = phi i32 [0, %_6.array.exit.1], [%30, %_11.if.exit.0]                       ; inst 27
  %19 = icmp slt i32 %18, %0                                                       ; inst 28
  br i1 %19, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 29
_8.while.body.0:
  %20 = mul i32 %17, 1664                                                          ; inst 30
  %21 = add i32 %20, 904223                                                        ; inst 31
  %22 = srem i32 %21, 83647                                                        ; inst 32
  %23 = icmp slt i32 %22, 0                                                        ; inst 33
  br i1 %23, label %_9.if.then.0, label %_10.if.else.0                             ; inst 34
_9.if.then.0:
  %24 = sub i32 0, %22                                                             ; inst 35
  br label %_11.if.exit.0                                                          ; inst 36
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 37
_11.if.exit.0:
  %25 = phi i32 [%24, %_9.if.then.0], [%22, %_10.if.else.0]                        ; inst 38
  %26 = sext i32 %18 to i64                                                        ; inst 39
  %27 = getelementptr [20 x i32], [20 x i32]* %11, i32 0, i64 %26                  ; inst 40
  %28 = srem i32 %25, 50                                                           ; inst 41
  %29 = add i32 1, %28                                                             ; inst 42
  store i32 %29, i32* %27                                                          ; inst 43
  %30 = add i32 %18, 1                                                             ; inst 44
  br label %_7.while.cond.0                                                        ; inst 45
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 46
_13.while.cond.1:
  %31 = phi i32 [1, %_12.while.exit.0], [%43, %_14.while.body.1]                   ; inst 47
  %32 = icmp slt i32 %31, %0                                                       ; inst 48
  br i1 %32, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 49
_14.while.body.1:
  %33 = sub i32 %31, 1                                                             ; inst 50
  %34 = sdiv i32 %33, 2                                                            ; inst 51
  %35 = mul i32 %34, %0                                                            ; inst 52
  %36 = add i32 %35, %31                                                           ; inst 53
  %37 = sext i32 %36 to i64                                                        ; inst 54
  %38 = getelementptr [400 x i32], [400 x i32]* %5, i32 0, i64 %37                 ; inst 55
  store i32 1, i32* %38                                                            ; inst 56
  %39 = mul i32 %31, %0                                                            ; inst 57
  %40 = add i32 %39, %34                                                           ; inst 58
  %41 = sext i32 %40 to i64                                                        ; inst 59
  %42 = getelementptr [400 x i32], [400 x i32]* %5, i32 0, i64 %41                 ; inst 60
  store i32 1, i32* %42                                                            ; inst 61
  %43 = add i32 %31, 1                                                             ; inst 62
  br label %_13.while.cond.1                                                       ; inst 63
_15.while.exit.1:
  %44 = alloca [20 x i32]                                                          ; inst 64
  %45 = getelementptr [20 x i32], [20 x i32]* %44, i32 0, i32 0                    ; inst 65
  br label %_16.array.cond.2                                                       ; inst 66
_16.array.cond.2:
  %46 = phi i32 [0, %_15.while.exit.1], [%49, %_17.array.body.2]                   ; inst 67
  %47 = icmp slt i32 %46, 20                                                       ; inst 68
  br i1 %47, label %_17.array.body.2, label %_18.array.exit.2                      ; inst 69
_17.array.body.2:
  %48 = getelementptr i32, i32* %45, i32 %46                                       ; inst 70
  store i32 0, i32* %48                                                            ; inst 71
  %49 = add i32 %46, 1                                                             ; inst 72
  br label %_16.array.cond.2                                                       ; inst 73
_18.array.exit.2:
  %50 = alloca [20 x i32]                                                          ; inst 74
  %51 = getelementptr [20 x i32], [20 x i32]* %50, i32 0, i32 0                    ; inst 75
  br label %_19.array.cond.3                                                       ; inst 76
_19.array.cond.3:
  %52 = phi i32 [0, %_18.array.exit.2], [%55, %_20.array.body.3]                   ; inst 77
  %53 = icmp slt i32 %52, 20                                                       ; inst 78
  br i1 %53, label %_20.array.body.3, label %_21.array.exit.3                      ; inst 79
_20.array.body.3:
  %54 = getelementptr i32, i32* %51, i32 %52                                       ; inst 80
  store i32 0, i32* %54                                                            ; inst 81
  %55 = add i32 %52, 1                                                             ; inst 82
  br label %_19.array.cond.3                                                       ; inst 83
_21.array.exit.3:
  call void @memcpy([400 x i32]* %1, [400 x i32]* %5, i64 1600)                    ; inst 84
  call void @memcpy([20 x i32]* %2, [20 x i32]* %11, i64 80)                       ; inst 85
  call void @memcpy([20 x i32]* %3, [20 x i32]* %44, i64 80)                       ; inst 86
  call void @memcpy([20 x i32]* %4, [20 x i32]* %50, i64 80)                       ; inst 87
  %56 = call i32 @treeDPRecursive([400 x i32]* %1, [20 x i32]* %2, i32 %0, i32 0, i32 -1, [20 x i32]* %3, [20 x i32]* %4) ; inst 88
  ret i32 %56                                                                      ; inst 89
}

define i32 @treeDPRecursive([400 x i32]* %0, [20 x i32]* %1, i32 %2, i32 %3, i32 %4, [20 x i32]* %5, [20 x i32]* %6) {
_0.entry.0:
  %7 = alloca [400 x i32]                                                          ; inst 1
  %8 = alloca [20 x i32]                                                           ; inst 2
  %9 = alloca [20 x i32]                                                           ; inst 3
  %10 = alloca [20 x i32]                                                          ; inst 4
  %11 = sext i32 %3 to i64                                                         ; inst 5
  %12 = getelementptr [20 x i32], [20 x i32]* %5, i32 0, i64 %11                   ; inst 6
  %13 = sext i32 %3 to i64                                                         ; inst 7
  %14 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i64 %13                   ; inst 8
  %15 = load i32, i32* %14                                                         ; inst 9
  store i32 %15, i32* %12                                                          ; inst 10
  %16 = sext i32 %3 to i64                                                         ; inst 11
  %17 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %16                   ; inst 12
  store i32 0, i32* %17                                                            ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_1.while.cond.0:
  %18 = phi i32 [0, %_0.entry.0], [%58, %_11.if.exit.0]                            ; inst 15
  %19 = icmp slt i32 %18, %2                                                       ; inst 16
  br i1 %19, label %_2.while.body.0, label %_12.while.exit.0                       ; inst 17
_2.while.body.0:
  %20 = mul i32 %3, %2                                                             ; inst 18
  %21 = add i32 %20, %18                                                           ; inst 19
  %22 = sext i32 %21 to i64                                                        ; inst 20
  %23 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %22                 ; inst 21
  %24 = load i32, i32* %23                                                         ; inst 22
  %25 = icmp eq i32 %24, 1                                                         ; inst 23
  br i1 %25, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 24
_3.lazy.then.0:
  %26 = icmp ne i32 %18, %4                                                        ; inst 25
  br label %_5.lazy.exit.0                                                         ; inst 26
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 27
_5.lazy.exit.0:
  %27 = phi i1 [%26, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 28
  br i1 %27, label %_6.if.then.0, label %_10.if.else.0                             ; inst 29
_6.if.then.0:
  call void @memcpy([400 x i32]* %7, [400 x i32]* %0, i64 1600)                    ; inst 30
  call void @memcpy([20 x i32]* %8, [20 x i32]* %1, i64 80)                        ; inst 31
  call void @memcpy([20 x i32]* %9, [20 x i32]* %5, i64 80)                        ; inst 32
  call void @memcpy([20 x i32]* %10, [20 x i32]* %6, i64 80)                       ; inst 33
  %28 = call i32 @treeDPRecursive([400 x i32]* %7, [20 x i32]* %8, i32 %2, i32 %18, i32 %3, [20 x i32]* %9, [20 x i32]* %10) ; inst 34
  %29 = sext i32 %3 to i64                                                         ; inst 35
  %30 = getelementptr [20 x i32], [20 x i32]* %5, i32 0, i64 %29                   ; inst 36
  %31 = sext i32 %3 to i64                                                         ; inst 37
  %32 = getelementptr [20 x i32], [20 x i32]* %5, i32 0, i64 %31                   ; inst 38
  %33 = load i32, i32* %32                                                         ; inst 39
  %34 = sext i32 %18 to i64                                                        ; inst 40
  %35 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %34                   ; inst 41
  %36 = load i32, i32* %35                                                         ; inst 42
  %37 = add i32 %33, %36                                                           ; inst 43
  store i32 %37, i32* %30                                                          ; inst 44
  %38 = sext i32 %3 to i64                                                         ; inst 45
  %39 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %38                   ; inst 46
  %40 = sext i32 %3 to i64                                                         ; inst 47
  %41 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %40                   ; inst 48
  %42 = load i32, i32* %41                                                         ; inst 49
  %43 = sext i32 %18 to i64                                                        ; inst 50
  %44 = getelementptr [20 x i32], [20 x i32]* %5, i32 0, i64 %43                   ; inst 51
  %45 = load i32, i32* %44                                                         ; inst 52
  %46 = sext i32 %18 to i64                                                        ; inst 53
  %47 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %46                   ; inst 54
  %48 = load i32, i32* %47                                                         ; inst 55
  %49 = icmp sgt i32 %45, %48                                                      ; inst 56
  br i1 %49, label %_7.if.then.1, label %_8.if.else.1                              ; inst 57
_7.if.then.1:
  %50 = sext i32 %18 to i64                                                        ; inst 58
  %51 = getelementptr [20 x i32], [20 x i32]* %5, i32 0, i64 %50                   ; inst 59
  %52 = load i32, i32* %51                                                         ; inst 60
  br label %_9.if.exit.1                                                           ; inst 61
_8.if.else.1:
  %53 = sext i32 %18 to i64                                                        ; inst 62
  %54 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %53                   ; inst 63
  %55 = load i32, i32* %54                                                         ; inst 64
  br label %_9.if.exit.1                                                           ; inst 65
_9.if.exit.1:
  %56 = phi i32 [%52, %_7.if.then.1], [%55, %_8.if.else.1]                         ; inst 66
  %57 = add i32 %42, %56                                                           ; inst 67
  store i32 %57, i32* %39                                                          ; inst 68
  br label %_11.if.exit.0                                                          ; inst 69
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 70
_11.if.exit.0:
  %58 = add i32 %18, 1                                                             ; inst 71
  br label %_1.while.cond.0                                                        ; inst 72
_12.while.exit.0:
  %59 = sext i32 %3 to i64                                                         ; inst 73
  %60 = getelementptr [20 x i32], [20 x i32]* %5, i32 0, i64 %59                   ; inst 74
  %61 = load i32, i32* %60                                                         ; inst 75
  %62 = sext i32 %3 to i64                                                         ; inst 76
  %63 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %62                   ; inst 77
  %64 = load i32, i32* %63                                                         ; inst 78
  %65 = icmp sgt i32 %61, %64                                                      ; inst 79
  br i1 %65, label %_13.if.then.2, label %_14.if.else.2                            ; inst 80
_13.if.then.2:
  %66 = sext i32 %3 to i64                                                         ; inst 81
  %67 = getelementptr [20 x i32], [20 x i32]* %5, i32 0, i64 %66                   ; inst 82
  %68 = load i32, i32* %67                                                         ; inst 83
  ret i32 %68                                                                      ; inst 84
_14.if.else.2:
  %69 = sext i32 %3 to i64                                                         ; inst 85
  %70 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %69                   ; inst 86
  %71 = load i32, i32* %70                                                         ; inst 87
  ret i32 %71                                                                      ; inst 88
_15.if.exit.2:
  unreachable                                                                      ; inst 89
}

