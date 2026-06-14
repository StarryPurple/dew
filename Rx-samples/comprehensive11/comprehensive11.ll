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

define void @main() {
_0.entry.0:
  call void @printlnInt(i32 1100)                                                  ; inst 1
  call void @testBooleanExpressionOptimization()                                   ; inst 2
  call void @testBooleanArrayOperations()                                          ; inst 3
  call void @testLogicalAlgorithms()                                               ; inst 4
  call void @testBooleanSearchAndFilter()                                          ; inst 5
  call void @testBooleanStateMachine()                                             ; inst 6
  call void @printlnInt(i32 1199)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @testBooleanExpressionOptimization() {
_0.entry.0:
  call void @printlnInt(i32 1101)                                                  ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%33, %_41.if.exit.1]                             ; inst 3
  %1 = phi i32 [0, %_0.entry.0], [%32, %_41.if.exit.1]                             ; inst 4
  %2 = icmp slt i32 %0, 10000                                                      ; inst 5
  br i1 %2, label %_2.while.body.0, label %_42.while.exit.0                        ; inst 6
_2.while.body.0:
  %3 = srem i32 %0, 2                                                              ; inst 7
  %4 = icmp eq i32 %3, 0                                                           ; inst 8
  %5 = srem i32 %0, 3                                                              ; inst 9
  %6 = icmp eq i32 %5, 0                                                           ; inst 10
  %7 = srem i32 %0, 5                                                              ; inst 11
  %8 = icmp eq i32 %7, 0                                                           ; inst 12
  %9 = srem i32 %0, 7                                                              ; inst 13
  %10 = icmp eq i32 %9, 0                                                          ; inst 14
  br i1 %4, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 15
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %11 = phi i1 [%6, %_3.lazy.then.0], [0, %_4.lazy.else.0]                         ; inst 18
  br i1 %11, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 19
_6.lazy.then.1:
  br label %_11.lazy.exit.1                                                        ; inst 20
_7.lazy.else.1:
  br i1 %8, label %_8.lazy.then.2, label %_9.lazy.else.2                           ; inst 21
_8.lazy.then.2:
  %12 = icmp eq i1 %10, 0                                                          ; inst 22
  br label %_10.lazy.exit.2                                                        ; inst 23
_9.lazy.else.2:
  br label %_10.lazy.exit.2                                                        ; inst 24
_10.lazy.exit.2:
  %13 = phi i1 [%12, %_8.lazy.then.2], [0, %_9.lazy.else.2]                        ; inst 25
  br label %_11.lazy.exit.1                                                        ; inst 26
_11.lazy.exit.1:
  %14 = phi i1 [1, %_6.lazy.then.1], [%13, %_10.lazy.exit.2]                       ; inst 27
  br i1 %14, label %_12.lazy.then.3, label %_13.lazy.else.3                        ; inst 28
_12.lazy.then.3:
  br label %_20.lazy.exit.3                                                        ; inst 29
_13.lazy.else.3:
  %15 = icmp eq i1 %4, 0                                                           ; inst 30
  br i1 %15, label %_14.lazy.then.4, label %_15.lazy.else.4                        ; inst 31
_14.lazy.then.4:
  br label %_16.lazy.exit.4                                                        ; inst 32
_15.lazy.else.4:
  br label %_16.lazy.exit.4                                                        ; inst 33
_16.lazy.exit.4:
  %16 = phi i1 [%6, %_14.lazy.then.4], [0, %_15.lazy.else.4]                       ; inst 34
  br i1 %16, label %_17.lazy.then.5, label %_18.lazy.else.5                        ; inst 35
_17.lazy.then.5:
  br label %_19.lazy.exit.5                                                        ; inst 36
_18.lazy.else.5:
  br label %_19.lazy.exit.5                                                        ; inst 37
_19.lazy.exit.5:
  %17 = phi i1 [%8, %_17.lazy.then.5], [0, %_18.lazy.else.5]                       ; inst 38
  br label %_20.lazy.exit.3                                                        ; inst 39
_20.lazy.exit.3:
  %18 = phi i1 [1, %_12.lazy.then.3], [%17, %_19.lazy.exit.5]                      ; inst 40
  br i1 %18, label %_21.lazy.then.6, label %_22.lazy.else.6                        ; inst 41
_21.lazy.then.6:
  br label %_32.lazy.exit.6                                                        ; inst 42
_22.lazy.else.6:
  br i1 %4, label %_23.lazy.then.7, label %_24.lazy.else.7                         ; inst 43
_23.lazy.then.7:
  %19 = icmp eq i1 %6, 0                                                           ; inst 44
  br label %_25.lazy.exit.7                                                        ; inst 45
_24.lazy.else.7:
  br label %_25.lazy.exit.7                                                        ; inst 46
_25.lazy.exit.7:
  %20 = phi i1 [%19, %_23.lazy.then.7], [0, %_24.lazy.else.7]                      ; inst 47
  br i1 %20, label %_26.lazy.then.8, label %_27.lazy.else.8                        ; inst 48
_26.lazy.then.8:
  %21 = icmp eq i1 %8, 0                                                           ; inst 49
  br label %_28.lazy.exit.8                                                        ; inst 50
_27.lazy.else.8:
  br label %_28.lazy.exit.8                                                        ; inst 51
_28.lazy.exit.8:
  %22 = phi i1 [%21, %_26.lazy.then.8], [0, %_27.lazy.else.8]                      ; inst 52
  br i1 %22, label %_29.lazy.then.9, label %_30.lazy.else.9                        ; inst 53
_29.lazy.then.9:
  br label %_31.lazy.exit.9                                                        ; inst 54
_30.lazy.else.9:
  br label %_31.lazy.exit.9                                                        ; inst 55
_31.lazy.exit.9:
  %23 = phi i1 [%10, %_29.lazy.then.9], [0, %_30.lazy.else.9]                      ; inst 56
  br label %_32.lazy.exit.6                                                        ; inst 57
_32.lazy.exit.6:
  %24 = phi i1 [1, %_21.lazy.then.6], [%23, %_31.lazy.exit.9]                      ; inst 58
  br i1 %24, label %_33.if.then.0, label %_34.if.else.0                            ; inst 59
_33.if.then.0:
  %25 = add i32 %1, 1                                                              ; inst 60
  br label %_35.if.exit.0                                                          ; inst 61
_34.if.else.0:
  br label %_35.if.exit.0                                                          ; inst 62
_35.if.exit.0:
  %26 = phi i32 [%25, %_33.if.then.0], [%1, %_34.if.else.0]                        ; inst 63
  %27 = call i1 @evaluateComplexCondition(i32 %0)                                  ; inst 64
  br i1 %27, label %_36.lazy.then.10, label %_37.lazy.else.10                      ; inst 65
_36.lazy.then.10:
  %28 = srem i32 %0, 100                                                           ; inst 66
  %29 = icmp eq i32 %28, 0                                                         ; inst 67
  br label %_38.lazy.exit.10                                                       ; inst 68
_37.lazy.else.10:
  br label %_38.lazy.exit.10                                                       ; inst 69
_38.lazy.exit.10:
  %30 = phi i1 [%29, %_36.lazy.then.10], [0, %_37.lazy.else.10]                    ; inst 70
  br i1 %30, label %_39.if.then.1, label %_40.if.else.1                            ; inst 71
_39.if.then.1:
  %31 = add i32 %26, 2                                                             ; inst 72
  br label %_41.if.exit.1                                                          ; inst 73
_40.if.else.1:
  br label %_41.if.exit.1                                                          ; inst 74
_41.if.exit.1:
  %32 = phi i32 [%31, %_39.if.then.1], [%26, %_40.if.else.1]                       ; inst 75
  %33 = add i32 %0, 1                                                              ; inst 76
  br label %_1.while.cond.0                                                        ; inst 77
_42.while.exit.0:
  call void @printlnInt(i32 %1)                                                    ; inst 78
  call void @printlnInt(i32 1102)                                                  ; inst 79
  ret void                                                                         ; inst 80
}

define i1 @evaluateComplexCondition(i32 %0) {
_0.entry.0:
  %1 = call i1 @isPrime(i32 %0)                                                    ; inst 1
  %2 = srem i32 %0, 4                                                              ; inst 2
  %3 = icmp eq i32 %2, 0                                                           ; inst 3
  %4 = icmp sgt i32 %0, 100                                                        ; inst 4
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 5
_1.lazy.then.0:
  %5 = icmp slt i32 %0, 9900                                                       ; inst 6
  br label %_3.lazy.exit.0                                                         ; inst 7
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 8
_3.lazy.exit.0:
  %6 = phi i1 [%5, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 9
  br i1 %1, label %_4.lazy.then.1, label %_5.lazy.else.1                           ; inst 10
_4.lazy.then.1:
  br label %_6.lazy.exit.1                                                         ; inst 11
_5.lazy.else.1:
  br label %_6.lazy.exit.1                                                         ; inst 12
_6.lazy.exit.1:
  %7 = phi i1 [1, %_4.lazy.then.1], [%3, %_5.lazy.else.1]                          ; inst 13
  br i1 %7, label %_7.lazy.then.2, label %_8.lazy.else.2                           ; inst 14
_7.lazy.then.2:
  br label %_9.lazy.exit.2                                                         ; inst 15
_8.lazy.else.2:
  br label %_9.lazy.exit.2                                                         ; inst 16
_9.lazy.exit.2:
  %8 = phi i1 [%6, %_7.lazy.then.2], [0, %_8.lazy.else.2]                          ; inst 17
  ret i1 %8                                                                        ; inst 18
}

define void @testBooleanArrayOperations() {
_0.entry.0:
  %0 = alloca [10000 x i1]                                                         ; inst 1
  %1 = alloca [10000 x i1]                                                         ; inst 2
  call void @printlnInt(i32 1103)                                                  ; inst 3
  %2 = alloca [10000 x i1]                                                         ; inst 4
  %3 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i32 0                  ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 7
  %5 = icmp slt i32 %4, 10000                                                      ; inst 8
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 9
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 10
  store i1 0, i1* %6                                                               ; inst 11
  %7 = add i32 %4, 1                                                               ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  %8 = alloca i32                                                                  ; inst 14
  store i32 0, i32* %8                                                             ; inst 15
  br label %_4.while.cond.0                                                        ; inst 16
_4.while.cond.0:
  %9 = phi i32 [0, %_3.array.exit.0], [%24, %_11.while.exit.1]                     ; inst 17
  %10 = icmp slt i32 %9, 100                                                       ; inst 18
  br i1 %10, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 19
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 20
_6.while.cond.1:
  %11 = phi i32 [0, %_5.while.body.0], [%23, %_10.lazy.exit.0]                     ; inst 21
  %12 = icmp slt i32 %11, 100                                                      ; inst 22
  br i1 %12, label %_7.while.body.1, label %_11.while.exit.1                       ; inst 23
_7.while.body.1:
  %13 = mul i32 %9, 100                                                            ; inst 24
  %14 = add i32 %13, %11                                                           ; inst 25
  %15 = sext i32 %14 to i64                                                        ; inst 26
  %16 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i64 %15               ; inst 27
  %17 = add i32 %9, %11                                                            ; inst 28
  %18 = srem i32 %17, 2                                                            ; inst 29
  %19 = icmp eq i32 %18, 0                                                         ; inst 30
  br i1 %19, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 31
_8.lazy.then.0:
  %20 = srem i32 %9, 3                                                             ; inst 32
  %21 = icmp ne i32 %20, 0                                                         ; inst 33
  br label %_10.lazy.exit.0                                                        ; inst 34
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 35
_10.lazy.exit.0:
  %22 = phi i1 [%21, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 36
  store i1 %22, i1* %16                                                            ; inst 37
  %23 = add i32 %11, 1                                                             ; inst 38
  br label %_6.while.cond.1                                                        ; inst 39
_11.while.exit.1:
  %24 = add i32 %9, 1                                                              ; inst 40
  br label %_4.while.cond.0                                                        ; inst 41
_12.while.exit.0:
  call void @memcpy([10000 x i1]* %0, [10000 x i1]* %2, i64 10000)                 ; inst 42
  call void @performBooleanGridOperations([10000 x i1]* %0, i32* %8)               ; inst 43
  %25 = load i32, i32* %8                                                          ; inst 44
  call void @memcpy([10000 x i1]* %1, [10000 x i1]* %2, i64 10000)                 ; inst 45
  %26 = call i32 @countBooleanPatterns([10000 x i1]* %1)                           ; inst 46
  %27 = add i32 %25, %26                                                           ; inst 47
  store i32 %27, i32* %8                                                           ; inst 48
  %28 = load i32, i32* %8                                                          ; inst 49
  call void @printlnInt(i32 %28)                                                   ; inst 50
  call void @printlnInt(i32 1104)                                                  ; inst 51
  ret void                                                                         ; inst 52
}

define void @performBooleanGridOperations([10000 x i1]* %0, i32* %1) {
_0.entry.0:
  %2 = alloca [10000 x i1]                                                         ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_20.while.exit.1]                           ; inst 3
  %4 = phi i32 [1, %_0.entry.0], [%34, %_20.while.exit.1]                          ; inst 4
  %5 = icmp slt i32 %4, 99                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %6 = phi i32 [%3, %_2.while.body.0], [%32, %_19.if.exit.0]                       ; inst 8
  %7 = phi i32 [1, %_2.while.body.0], [%33, %_19.if.exit.0]                        ; inst 9
  %8 = icmp slt i32 %7, 99                                                         ; inst 10
  br i1 %8, label %_4.while.body.1, label %_20.while.exit.1                        ; inst 11
_4.while.body.1:
  %9 = mul i32 %4, 100                                                             ; inst 12
  %10 = add i32 %9, %7                                                             ; inst 13
  call void @memcpy([10000 x i1]* %2, [10000 x i1]* %0, i64 10000)                 ; inst 14
  %11 = call i32 @countBooleanNeighbors([10000 x i1]* %2, i32 %4, i32 %7)          ; inst 15
  %12 = sext i32 %10 to i64                                                        ; inst 16
  %13 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %12               ; inst 17
  %14 = load i1, i1* %13                                                           ; inst 18
  br i1 %14, label %_5.lazy.then.0, label %_9.lazy.else.0                          ; inst 19
_5.lazy.then.0:
  %15 = icmp slt i32 %11, 2                                                        ; inst 20
  br i1 %15, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 21
_6.lazy.then.1:
  br label %_8.lazy.exit.1                                                         ; inst 22
_7.lazy.else.1:
  %16 = icmp sgt i32 %11, 3                                                        ; inst 23
  br label %_8.lazy.exit.1                                                         ; inst 24
_8.lazy.exit.1:
  %17 = phi i1 [1, %_6.lazy.then.1], [%16, %_7.lazy.else.1]                        ; inst 25
  br label %_10.lazy.exit.0                                                        ; inst 26
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 27
_10.lazy.exit.0:
  %18 = phi i1 [%17, %_8.lazy.exit.1], [0, %_9.lazy.else.0]                        ; inst 28
  br i1 %18, label %_11.if.then.0, label %_12.if.else.0                            ; inst 29
_11.if.then.0:
  %19 = sext i32 %10 to i64                                                        ; inst 30
  %20 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %19               ; inst 31
  store i1 0, i1* %20                                                              ; inst 32
  %21 = add i32 %6, 1                                                              ; inst 33
  br label %_19.if.exit.0                                                          ; inst 34
_12.if.else.0:
  %22 = sext i32 %10 to i64                                                        ; inst 35
  %23 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %22               ; inst 36
  %24 = load i1, i1* %23                                                           ; inst 37
  %25 = icmp eq i1 %24, 0                                                          ; inst 38
  br i1 %25, label %_13.lazy.then.2, label %_14.lazy.else.2                        ; inst 39
_13.lazy.then.2:
  %26 = icmp eq i32 %11, 3                                                         ; inst 40
  br label %_15.lazy.exit.2                                                        ; inst 41
_14.lazy.else.2:
  br label %_15.lazy.exit.2                                                        ; inst 42
_15.lazy.exit.2:
  %27 = phi i1 [%26, %_13.lazy.then.2], [0, %_14.lazy.else.2]                      ; inst 43
  br i1 %27, label %_16.if.then.1, label %_17.if.else.1                            ; inst 44
_16.if.then.1:
  %28 = sext i32 %10 to i64                                                        ; inst 45
  %29 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %28               ; inst 46
  store i1 1, i1* %29                                                              ; inst 47
  %30 = add i32 %6, 1                                                              ; inst 48
  br label %_18.if.exit.1                                                          ; inst 49
_17.if.else.1:
  br label %_18.if.exit.1                                                          ; inst 50
_18.if.exit.1:
  %31 = phi i32 [%30, %_16.if.then.1], [%6, %_17.if.else.1]                        ; inst 51
  br label %_19.if.exit.0                                                          ; inst 52
_19.if.exit.0:
  %32 = phi i32 [%21, %_11.if.then.0], [%31, %_18.if.exit.1]                       ; inst 53
  %33 = add i32 %7, 1                                                              ; inst 54
  br label %_3.while.cond.1                                                        ; inst 55
_20.while.exit.1:
  %34 = add i32 %4, 1                                                              ; inst 56
  br label %_1.while.cond.0                                                        ; inst 57
_21.while.exit.0:
  %35 = load i32, i32* %1                                                          ; inst 58
  %36 = add i32 %35, %3                                                            ; inst 59
  store i32 %36, i32* %1                                                           ; inst 60
  ret void                                                                         ; inst 61
}

define i32 @countBooleanNeighbors([10000 x i1]* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [-1, %_0.entry.0], [%31, %_26.while.exit.1]                         ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%7, %_26.while.exit.1]                           ; inst 3
  %5 = icmp sle i32 %3, 1                                                          ; inst 4
  br i1 %5, label %_2.while.body.0, label %_27.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %6 = phi i32 [-1, %_2.while.body.0], [%30, %_25.if.exit.0]                       ; inst 7
  %7 = phi i32 [%4, %_2.while.body.0], [%29, %_25.if.exit.0]                       ; inst 8
  %8 = icmp sle i32 %6, 1                                                          ; inst 9
  br i1 %8, label %_4.while.body.1, label %_26.while.exit.1                        ; inst 10
_4.while.body.1:
  %9 = icmp ne i32 %3, 0                                                           ; inst 11
  br i1 %9, label %_5.lazy.then.0, label %_6.lazy.else.0                           ; inst 12
_5.lazy.then.0:
  br label %_7.lazy.exit.0                                                         ; inst 13
_6.lazy.else.0:
  %10 = icmp ne i32 %6, 0                                                          ; inst 14
  br label %_7.lazy.exit.0                                                         ; inst 15
_7.lazy.exit.0:
  %11 = phi i1 [1, %_5.lazy.then.0], [%10, %_6.lazy.else.0]                        ; inst 16
  br i1 %11, label %_8.if.then.0, label %_24.if.else.0                             ; inst 17
_8.if.then.0:
  %12 = add i32 %1, %3                                                             ; inst 18
  %13 = add i32 %2, %6                                                             ; inst 19
  %14 = icmp sge i32 %12, 0                                                        ; inst 20
  br i1 %14, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 21
_9.lazy.then.1:
  %15 = icmp slt i32 %12, 100                                                      ; inst 22
  br label %_11.lazy.exit.1                                                        ; inst 23
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 24
_11.lazy.exit.1:
  %16 = phi i1 [%15, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 25
  br i1 %16, label %_12.lazy.then.2, label %_13.lazy.else.2                        ; inst 26
_12.lazy.then.2:
  %17 = icmp sge i32 %13, 0                                                        ; inst 27
  br label %_14.lazy.exit.2                                                        ; inst 28
_13.lazy.else.2:
  br label %_14.lazy.exit.2                                                        ; inst 29
_14.lazy.exit.2:
  %18 = phi i1 [%17, %_12.lazy.then.2], [0, %_13.lazy.else.2]                      ; inst 30
  br i1 %18, label %_15.lazy.then.3, label %_16.lazy.else.3                        ; inst 31
_15.lazy.then.3:
  %19 = icmp slt i32 %13, 100                                                      ; inst 32
  br label %_17.lazy.exit.3                                                        ; inst 33
_16.lazy.else.3:
  br label %_17.lazy.exit.3                                                        ; inst 34
_17.lazy.exit.3:
  %20 = phi i1 [%19, %_15.lazy.then.3], [0, %_16.lazy.else.3]                      ; inst 35
  br i1 %20, label %_18.if.then.1, label %_22.if.else.1                            ; inst 36
_18.if.then.1:
  %21 = mul i32 %12, 100                                                           ; inst 37
  %22 = add i32 %21, %13                                                           ; inst 38
  %23 = sext i32 %22 to i64                                                        ; inst 39
  %24 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %23               ; inst 40
  %25 = load i1, i1* %24                                                           ; inst 41
  br i1 %25, label %_19.if.then.2, label %_20.if.else.2                            ; inst 42
_19.if.then.2:
  %26 = add i32 %7, 1                                                              ; inst 43
  br label %_21.if.exit.2                                                          ; inst 44
_20.if.else.2:
  br label %_21.if.exit.2                                                          ; inst 45
_21.if.exit.2:
  %27 = phi i32 [%26, %_19.if.then.2], [%7, %_20.if.else.2]                        ; inst 46
  br label %_23.if.exit.1                                                          ; inst 47
_22.if.else.1:
  br label %_23.if.exit.1                                                          ; inst 48
_23.if.exit.1:
  %28 = phi i32 [%27, %_21.if.exit.2], [%7, %_22.if.else.1]                        ; inst 49
  br label %_25.if.exit.0                                                          ; inst 50
_24.if.else.0:
  br label %_25.if.exit.0                                                          ; inst 51
_25.if.exit.0:
  %29 = phi i32 [%28, %_23.if.exit.1], [%7, %_24.if.else.0]                        ; inst 52
  %30 = add i32 %6, 1                                                              ; inst 53
  br label %_3.while.cond.1                                                        ; inst 54
_26.while.exit.1:
  %31 = add i32 %3, 1                                                              ; inst 55
  br label %_1.while.cond.0                                                        ; inst 56
_27.while.exit.0:
  ret i32 %4                                                                       ; inst 57
}

define i32 @countBooleanPatterns([10000 x i1]* %0) {
_0.entry.0:
  %1 = alloca [10000 x i1]                                                         ; inst 1
  %2 = alloca [10000 x i1]                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%16, %_11.while.exit.1]                          ; inst 4
  %4 = phi i32 [0, %_0.entry.0], [%7, %_11.while.exit.1]                           ; inst 5
  %5 = icmp slt i32 %3, 98                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%15, %_10.if.exit.1]                        ; inst 9
  %7 = phi i32 [%4, %_2.while.body.0], [%14, %_10.if.exit.1]                       ; inst 10
  %8 = icmp slt i32 %6, 98                                                         ; inst 11
  br i1 %8, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 12
_4.while.body.1:
  call void @memcpy([10000 x i1]* %1, [10000 x i1]* %0, i64 10000)                 ; inst 13
  %9 = call i1 @checkBooleanPattern2x2([10000 x i1]* %1, i32 %3, i32 %6)           ; inst 14
  br i1 %9, label %_5.if.then.0, label %_6.if.else.0                               ; inst 15
_5.if.then.0:
  %10 = add i32 %7, 1                                                              ; inst 16
  br label %_7.if.exit.0                                                           ; inst 17
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 18
_7.if.exit.0:
  %11 = phi i32 [%10, %_5.if.then.0], [%7, %_6.if.else.0]                          ; inst 19
  call void @memcpy([10000 x i1]* %2, [10000 x i1]* %0, i64 10000)                 ; inst 20
  %12 = call i1 @checkBooleanPattern3x3([10000 x i1]* %2, i32 %3, i32 %6)          ; inst 21
  br i1 %12, label %_8.if.then.1, label %_9.if.else.1                              ; inst 22
_8.if.then.1:
  %13 = add i32 %11, 2                                                             ; inst 23
  br label %_10.if.exit.1                                                          ; inst 24
_9.if.else.1:
  br label %_10.if.exit.1                                                          ; inst 25
_10.if.exit.1:
  %14 = phi i32 [%13, %_8.if.then.1], [%11, %_9.if.else.1]                         ; inst 26
  %15 = add i32 %6, 1                                                              ; inst 27
  br label %_3.while.cond.1                                                        ; inst 28
_11.while.exit.1:
  %16 = add i32 %3, 1                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_12.while.exit.0:
  ret i32 %4                                                                       ; inst 31
}

define i1 @checkBooleanPattern2x2([10000 x i1]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = mul i32 %1, 100                                                             ; inst 1
  %4 = add i32 %3, %2                                                              ; inst 2
  %5 = sext i32 %4 to i64                                                          ; inst 3
  %6 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %5                 ; inst 4
  %7 = load i1, i1* %6                                                             ; inst 5
  %8 = mul i32 %1, 100                                                             ; inst 6
  %9 = add i32 %8, %2                                                              ; inst 7
  %10 = add i32 %9, 1                                                              ; inst 8
  %11 = sext i32 %10 to i64                                                        ; inst 9
  %12 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %11               ; inst 10
  %13 = load i1, i1* %12                                                           ; inst 11
  %14 = add i32 %1, 1                                                              ; inst 12
  %15 = mul i32 %14, 100                                                           ; inst 13
  %16 = add i32 %15, %2                                                            ; inst 14
  %17 = sext i32 %16 to i64                                                        ; inst 15
  %18 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %17               ; inst 16
  %19 = load i1, i1* %18                                                           ; inst 17
  %20 = add i32 %1, 1                                                              ; inst 18
  %21 = mul i32 %20, 100                                                           ; inst 19
  %22 = add i32 %21, %2                                                            ; inst 20
  %23 = add i32 %22, 1                                                             ; inst 21
  %24 = sext i32 %23 to i64                                                        ; inst 22
  %25 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %24               ; inst 23
  %26 = load i1, i1* %25                                                           ; inst 24
  br i1 %7, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 25
_1.lazy.then.0:
  %27 = icmp eq i1 %13, 0                                                          ; inst 26
  br label %_3.lazy.exit.0                                                         ; inst 27
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 28
_3.lazy.exit.0:
  %28 = phi i1 [%27, %_1.lazy.then.0], [0, %_2.lazy.else.0]                        ; inst 29
  br i1 %28, label %_4.lazy.then.1, label %_5.lazy.else.1                          ; inst 30
_4.lazy.then.1:
  %29 = icmp eq i1 %19, 0                                                          ; inst 31
  br label %_6.lazy.exit.1                                                         ; inst 32
_5.lazy.else.1:
  br label %_6.lazy.exit.1                                                         ; inst 33
_6.lazy.exit.1:
  %30 = phi i1 [%29, %_4.lazy.then.1], [0, %_5.lazy.else.1]                        ; inst 34
  br i1 %30, label %_7.lazy.then.2, label %_8.lazy.else.2                          ; inst 35
_7.lazy.then.2:
  br label %_9.lazy.exit.2                                                         ; inst 36
_8.lazy.else.2:
  br label %_9.lazy.exit.2                                                         ; inst 37
_9.lazy.exit.2:
  %31 = phi i1 [%26, %_7.lazy.then.2], [0, %_8.lazy.else.2]                        ; inst 38
  br i1 %31, label %_10.lazy.then.3, label %_11.lazy.else.3                        ; inst 39
_10.lazy.then.3:
  br label %_21.lazy.exit.3                                                        ; inst 40
_11.lazy.else.3:
  %32 = icmp eq i1 %7, 0                                                           ; inst 41
  br i1 %32, label %_12.lazy.then.4, label %_13.lazy.else.4                        ; inst 42
_12.lazy.then.4:
  br label %_14.lazy.exit.4                                                        ; inst 43
_13.lazy.else.4:
  br label %_14.lazy.exit.4                                                        ; inst 44
_14.lazy.exit.4:
  %33 = phi i1 [%13, %_12.lazy.then.4], [0, %_13.lazy.else.4]                      ; inst 45
  br i1 %33, label %_15.lazy.then.5, label %_16.lazy.else.5                        ; inst 46
_15.lazy.then.5:
  br label %_17.lazy.exit.5                                                        ; inst 47
_16.lazy.else.5:
  br label %_17.lazy.exit.5                                                        ; inst 48
_17.lazy.exit.5:
  %34 = phi i1 [%19, %_15.lazy.then.5], [0, %_16.lazy.else.5]                      ; inst 49
  br i1 %34, label %_18.lazy.then.6, label %_19.lazy.else.6                        ; inst 50
_18.lazy.then.6:
  %35 = icmp eq i1 %26, 0                                                          ; inst 51
  br label %_20.lazy.exit.6                                                        ; inst 52
_19.lazy.else.6:
  br label %_20.lazy.exit.6                                                        ; inst 53
_20.lazy.exit.6:
  %36 = phi i1 [%35, %_18.lazy.then.6], [0, %_19.lazy.else.6]                      ; inst 54
  br label %_21.lazy.exit.3                                                        ; inst 55
_21.lazy.exit.3:
  %37 = phi i1 [1, %_10.lazy.then.3], [%36, %_20.lazy.exit.6]                      ; inst 56
  ret i1 %37                                                                       ; inst 57
}

define i1 @checkBooleanPattern3x3([10000 x i1]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = add i32 %1, 2                                                               ; inst 1
  %4 = icmp sge i32 %3, 100                                                        ; inst 2
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 3
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 4
_2.lazy.else.0:
  %5 = add i32 %2, 2                                                               ; inst 5
  %6 = icmp sge i32 %5, 100                                                        ; inst 6
  br label %_3.lazy.exit.0                                                         ; inst 7
_3.lazy.exit.0:
  %7 = phi i1 [1, %_1.lazy.then.0], [%6, %_2.lazy.else.0]                          ; inst 8
  br i1 %7, label %_4.if.then.0, label %_5.if.else.0                               ; inst 9
_4.if.then.0:
  ret i1 0                                                                         ; inst 10
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 11
_6.if.exit.0:
  br label %_7.while.cond.0                                                        ; inst 12
_7.while.cond.0:
  %8 = phi i32 [0, %_6.if.exit.0], [%12, %_14.while.exit.1]                        ; inst 13
  %9 = phi i32 [0, %_6.if.exit.0], [%24, %_14.while.exit.1]                        ; inst 14
  %10 = icmp slt i32 %9, 3                                                         ; inst 15
  br i1 %10, label %_8.while.body.0, label %_15.while.exit.0                       ; inst 16
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 17
_9.while.cond.1:
  %11 = phi i32 [0, %_8.while.body.0], [%23, %_13.if.exit.1]                       ; inst 18
  %12 = phi i32 [%8, %_8.while.body.0], [%22, %_13.if.exit.1]                      ; inst 19
  %13 = icmp slt i32 %11, 3                                                        ; inst 20
  br i1 %13, label %_10.while.body.1, label %_14.while.exit.1                      ; inst 21
_10.while.body.1:
  %14 = add i32 %1, %9                                                             ; inst 22
  %15 = mul i32 %14, 100                                                           ; inst 23
  %16 = add i32 %2, %11                                                            ; inst 24
  %17 = add i32 %15, %16                                                           ; inst 25
  %18 = sext i32 %17 to i64                                                        ; inst 26
  %19 = getelementptr [10000 x i1], [10000 x i1]* %0, i32 0, i64 %18               ; inst 27
  %20 = load i1, i1* %19                                                           ; inst 28
  br i1 %20, label %_11.if.then.1, label %_12.if.else.1                            ; inst 29
_11.if.then.1:
  %21 = add i32 %12, 1                                                             ; inst 30
  br label %_13.if.exit.1                                                          ; inst 31
_12.if.else.1:
  br label %_13.if.exit.1                                                          ; inst 32
_13.if.exit.1:
  %22 = phi i32 [%21, %_11.if.then.1], [%12, %_12.if.else.1]                       ; inst 33
  %23 = add i32 %11, 1                                                             ; inst 34
  br label %_9.while.cond.1                                                        ; inst 35
_14.while.exit.1:
  %24 = add i32 %9, 1                                                              ; inst 36
  br label %_7.while.cond.0                                                        ; inst 37
_15.while.exit.0:
  %25 = icmp eq i32 %8, 5                                                          ; inst 38
  ret i1 %25                                                                       ; inst 39
}

define void @testLogicalAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1105)                                                  ; inst 1
  %0 = call i32 @testBooleanSATSolver()                                            ; inst 2
  %1 = call i32 @testBooleanFunctionEvaluation()                                   ; inst 3
  %2 = add i32 %0, %1                                                              ; inst 4
  %3 = call i32 @solveBooleanPuzzles()                                             ; inst 5
  %4 = add i32 %2, %3                                                              ; inst 6
  call void @printlnInt(i32 %4)                                                    ; inst 7
  call void @printlnInt(i32 1106)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @testBooleanSATSolver() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%6, %_5.if.exit.0]                               ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%5, %_5.if.exit.0]                               ; inst 3
  %2 = icmp slt i32 %0, 1024                                                       ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %3 = call i1 @evaluateBooleanFormula(i32 %0)                                     ; inst 6
  br i1 %3, label %_3.if.then.0, label %_4.if.else.0                               ; inst 7
_3.if.then.0:
  %4 = add i32 %1, 1                                                               ; inst 8
  br label %_5.if.exit.0                                                           ; inst 9
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 10
_5.if.exit.0:
  %5 = phi i32 [%4, %_3.if.then.0], [%1, %_4.if.else.0]                            ; inst 11
  %6 = add i32 %0, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_6.while.exit.0:
  ret i32 %1                                                                       ; inst 14
}

define i1 @evaluateBooleanFormula(i32 %0) {
_0.entry.0:
  %1 = and i32 %0, 1                                                               ; inst 1
  %2 = icmp ne i32 %1, 0                                                           ; inst 2
  %3 = and i32 %0, 2                                                               ; inst 3
  %4 = icmp ne i32 %3, 0                                                           ; inst 4
  %5 = and i32 %0, 4                                                               ; inst 5
  %6 = icmp ne i32 %5, 0                                                           ; inst 6
  %7 = and i32 %0, 8                                                               ; inst 7
  %8 = icmp ne i32 %7, 0                                                           ; inst 8
  %9 = and i32 %0, 16                                                              ; inst 9
  %10 = icmp ne i32 %9, 0                                                          ; inst 10
  %11 = and i32 %0, 32                                                             ; inst 11
  %12 = icmp ne i32 %11, 0                                                         ; inst 12
  %13 = and i32 %0, 64                                                             ; inst 13
  %14 = icmp ne i32 %13, 0                                                         ; inst 14
  %15 = and i32 %0, 128                                                            ; inst 15
  %16 = icmp ne i32 %15, 0                                                         ; inst 16
  %17 = and i32 %0, 256                                                            ; inst 17
  %18 = icmp ne i32 %17, 0                                                         ; inst 18
  %19 = and i32 %0, 512                                                            ; inst 19
  %20 = icmp ne i32 %19, 0                                                         ; inst 20
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 21
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 22
_2.lazy.else.0:
  %21 = icmp eq i1 %4, 0                                                           ; inst 23
  br label %_3.lazy.exit.0                                                         ; inst 24
_3.lazy.exit.0:
  %22 = phi i1 [1, %_1.lazy.then.0], [%21, %_2.lazy.else.0]                        ; inst 25
  br i1 %22, label %_4.lazy.then.1, label %_5.lazy.else.1                          ; inst 26
_4.lazy.then.1:
  br label %_6.lazy.exit.1                                                         ; inst 27
_5.lazy.else.1:
  br label %_6.lazy.exit.1                                                         ; inst 28
_6.lazy.exit.1:
  %23 = phi i1 [1, %_4.lazy.then.1], [%6, %_5.lazy.else.1]                         ; inst 29
  %24 = icmp eq i1 %2, 0                                                           ; inst 30
  br i1 %24, label %_7.lazy.then.2, label %_8.lazy.else.2                          ; inst 31
_7.lazy.then.2:
  br label %_9.lazy.exit.2                                                         ; inst 32
_8.lazy.else.2:
  br label %_9.lazy.exit.2                                                         ; inst 33
_9.lazy.exit.2:
  %25 = phi i1 [1, %_7.lazy.then.2], [%8, %_8.lazy.else.2]                         ; inst 34
  br i1 %25, label %_10.lazy.then.3, label %_11.lazy.else.3                        ; inst 35
_10.lazy.then.3:
  br label %_12.lazy.exit.3                                                        ; inst 36
_11.lazy.else.3:
  %26 = icmp eq i1 %10, 0                                                          ; inst 37
  br label %_12.lazy.exit.3                                                        ; inst 38
_12.lazy.exit.3:
  %27 = phi i1 [1, %_10.lazy.then.3], [%26, %_11.lazy.else.3]                      ; inst 39
  br i1 %4, label %_13.lazy.then.4, label %_14.lazy.else.4                         ; inst 40
_13.lazy.then.4:
  br label %_15.lazy.exit.4                                                        ; inst 41
_14.lazy.else.4:
  %28 = icmp eq i1 %6, 0                                                           ; inst 42
  br label %_15.lazy.exit.4                                                        ; inst 43
_15.lazy.exit.4:
  %29 = phi i1 [1, %_13.lazy.then.4], [%28, %_14.lazy.else.4]                      ; inst 44
  br i1 %29, label %_16.lazy.then.5, label %_17.lazy.else.5                        ; inst 45
_16.lazy.then.5:
  br label %_18.lazy.exit.5                                                        ; inst 46
_17.lazy.else.5:
  br label %_18.lazy.exit.5                                                        ; inst 47
_18.lazy.exit.5:
  %30 = phi i1 [1, %_16.lazy.then.5], [%12, %_17.lazy.else.5]                      ; inst 48
  %31 = icmp eq i1 %8, 0                                                           ; inst 49
  br i1 %31, label %_19.lazy.then.6, label %_20.lazy.else.6                        ; inst 50
_19.lazy.then.6:
  br label %_21.lazy.exit.6                                                        ; inst 51
_20.lazy.else.6:
  br label %_21.lazy.exit.6                                                        ; inst 52
_21.lazy.exit.6:
  %32 = phi i1 [1, %_19.lazy.then.6], [%10, %_20.lazy.else.6]                      ; inst 53
  br i1 %32, label %_22.lazy.then.7, label %_23.lazy.else.7                        ; inst 54
_22.lazy.then.7:
  br label %_24.lazy.exit.7                                                        ; inst 55
_23.lazy.else.7:
  %33 = icmp eq i1 %14, 0                                                          ; inst 56
  br label %_24.lazy.exit.7                                                        ; inst 57
_24.lazy.exit.7:
  %34 = phi i1 [1, %_22.lazy.then.7], [%33, %_23.lazy.else.7]                      ; inst 58
  br i1 %6, label %_25.lazy.then.8, label %_26.lazy.else.8                         ; inst 59
_25.lazy.then.8:
  br label %_27.lazy.exit.8                                                        ; inst 60
_26.lazy.else.8:
  br label %_27.lazy.exit.8                                                        ; inst 61
_27.lazy.exit.8:
  %35 = phi i1 [1, %_25.lazy.then.8], [%16, %_26.lazy.else.8]                      ; inst 62
  br i1 %35, label %_28.lazy.then.9, label %_29.lazy.else.9                        ; inst 63
_28.lazy.then.9:
  br label %_30.lazy.exit.9                                                        ; inst 64
_29.lazy.else.9:
  %36 = icmp eq i1 %18, 0                                                          ; inst 65
  br label %_30.lazy.exit.9                                                        ; inst 66
_30.lazy.exit.9:
  %37 = phi i1 [1, %_28.lazy.then.9], [%36, %_29.lazy.else.9]                      ; inst 67
  %38 = icmp eq i1 %12, 0                                                          ; inst 68
  br i1 %38, label %_31.lazy.then.10, label %_32.lazy.else.10                      ; inst 69
_31.lazy.then.10:
  br label %_33.lazy.exit.10                                                       ; inst 70
_32.lazy.else.10:
  %39 = icmp eq i1 %16, 0                                                          ; inst 71
  br label %_33.lazy.exit.10                                                       ; inst 72
_33.lazy.exit.10:
  %40 = phi i1 [1, %_31.lazy.then.10], [%39, %_32.lazy.else.10]                    ; inst 73
  br i1 %40, label %_34.lazy.then.11, label %_35.lazy.else.11                      ; inst 74
_34.lazy.then.11:
  br label %_36.lazy.exit.11                                                       ; inst 75
_35.lazy.else.11:
  br label %_36.lazy.exit.11                                                       ; inst 76
_36.lazy.exit.11:
  %41 = phi i1 [1, %_34.lazy.then.11], [%20, %_35.lazy.else.11]                    ; inst 77
  br i1 %14, label %_37.lazy.then.12, label %_38.lazy.else.12                      ; inst 78
_37.lazy.then.12:
  br label %_39.lazy.exit.12                                                       ; inst 79
_38.lazy.else.12:
  br label %_39.lazy.exit.12                                                       ; inst 80
_39.lazy.exit.12:
  %42 = phi i1 [1, %_37.lazy.then.12], [%18, %_38.lazy.else.12]                    ; inst 81
  br i1 %42, label %_40.lazy.then.13, label %_41.lazy.else.13                      ; inst 82
_40.lazy.then.13:
  br label %_42.lazy.exit.13                                                       ; inst 83
_41.lazy.else.13:
  %43 = icmp eq i1 %20, 0                                                          ; inst 84
  br label %_42.lazy.exit.13                                                       ; inst 85
_42.lazy.exit.13:
  %44 = phi i1 [1, %_40.lazy.then.13], [%43, %_41.lazy.else.13]                    ; inst 86
  %45 = icmp eq i1 %2, 0                                                           ; inst 87
  br i1 %45, label %_43.lazy.then.14, label %_44.lazy.else.14                      ; inst 88
_43.lazy.then.14:
  br label %_45.lazy.exit.14                                                       ; inst 89
_44.lazy.else.14:
  %46 = icmp eq i1 %4, 0                                                           ; inst 90
  br label %_45.lazy.exit.14                                                       ; inst 91
_45.lazy.exit.14:
  %47 = phi i1 [1, %_43.lazy.then.14], [%46, %_44.lazy.else.14]                    ; inst 92
  br i1 %47, label %_46.lazy.then.15, label %_47.lazy.else.15                      ; inst 93
_46.lazy.then.15:
  br label %_48.lazy.exit.15                                                       ; inst 94
_47.lazy.else.15:
  %48 = icmp eq i1 %6, 0                                                           ; inst 95
  br label %_48.lazy.exit.15                                                       ; inst 96
_48.lazy.exit.15:
  %49 = phi i1 [1, %_46.lazy.then.15], [%48, %_47.lazy.else.15]                    ; inst 97
  br i1 %23, label %_49.lazy.then.16, label %_50.lazy.else.16                      ; inst 98
_49.lazy.then.16:
  br label %_51.lazy.exit.16                                                       ; inst 99
_50.lazy.else.16:
  br label %_51.lazy.exit.16                                                       ; inst 100
_51.lazy.exit.16:
  %50 = phi i1 [%27, %_49.lazy.then.16], [0, %_50.lazy.else.16]                    ; inst 101
  br i1 %50, label %_52.lazy.then.17, label %_53.lazy.else.17                      ; inst 102
_52.lazy.then.17:
  br label %_54.lazy.exit.17                                                       ; inst 103
_53.lazy.else.17:
  br label %_54.lazy.exit.17                                                       ; inst 104
_54.lazy.exit.17:
  %51 = phi i1 [%30, %_52.lazy.then.17], [0, %_53.lazy.else.17]                    ; inst 105
  br i1 %51, label %_55.lazy.then.18, label %_56.lazy.else.18                      ; inst 106
_55.lazy.then.18:
  br label %_57.lazy.exit.18                                                       ; inst 107
_56.lazy.else.18:
  br label %_57.lazy.exit.18                                                       ; inst 108
_57.lazy.exit.18:
  %52 = phi i1 [%34, %_55.lazy.then.18], [0, %_56.lazy.else.18]                    ; inst 109
  br i1 %52, label %_58.lazy.then.19, label %_59.lazy.else.19                      ; inst 110
_58.lazy.then.19:
  br label %_60.lazy.exit.19                                                       ; inst 111
_59.lazy.else.19:
  br label %_60.lazy.exit.19                                                       ; inst 112
_60.lazy.exit.19:
  %53 = phi i1 [%37, %_58.lazy.then.19], [0, %_59.lazy.else.19]                    ; inst 113
  br i1 %53, label %_61.lazy.then.20, label %_62.lazy.else.20                      ; inst 114
_61.lazy.then.20:
  br label %_63.lazy.exit.20                                                       ; inst 115
_62.lazy.else.20:
  br label %_63.lazy.exit.20                                                       ; inst 116
_63.lazy.exit.20:
  %54 = phi i1 [%41, %_61.lazy.then.20], [0, %_62.lazy.else.20]                    ; inst 117
  br i1 %54, label %_64.lazy.then.21, label %_65.lazy.else.21                      ; inst 118
_64.lazy.then.21:
  br label %_66.lazy.exit.21                                                       ; inst 119
_65.lazy.else.21:
  br label %_66.lazy.exit.21                                                       ; inst 120
_66.lazy.exit.21:
  %55 = phi i1 [%44, %_64.lazy.then.21], [0, %_65.lazy.else.21]                    ; inst 121
  br i1 %55, label %_67.lazy.then.22, label %_68.lazy.else.22                      ; inst 122
_67.lazy.then.22:
  br label %_69.lazy.exit.22                                                       ; inst 123
_68.lazy.else.22:
  br label %_69.lazy.exit.22                                                       ; inst 124
_69.lazy.exit.22:
  %56 = phi i1 [%49, %_67.lazy.then.22], [0, %_68.lazy.else.22]                    ; inst 125
  ret i1 %56                                                                       ; inst 126
}

define i32 @testBooleanFunctionEvaluation() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%12, %_11.if.exit.2]                             ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%11, %_11.if.exit.2]                             ; inst 3
  %2 = icmp slt i32 %0, 256                                                        ; inst 4
  br i1 %2, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %3 = call i1 @evaluateParityFunction(i32 %0)                                     ; inst 6
  br i1 %3, label %_3.if.then.0, label %_4.if.else.0                               ; inst 7
_3.if.then.0:
  %4 = add i32 %1, 1                                                               ; inst 8
  br label %_5.if.exit.0                                                           ; inst 9
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 10
_5.if.exit.0:
  %5 = phi i32 [%4, %_3.if.then.0], [%1, %_4.if.else.0]                            ; inst 11
  %6 = call i1 @evaluateMajorityFunction(i32 %0)                                   ; inst 12
  br i1 %6, label %_6.if.then.1, label %_7.if.else.1                               ; inst 13
_6.if.then.1:
  %7 = add i32 %5, 2                                                               ; inst 14
  br label %_8.if.exit.1                                                           ; inst 15
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 16
_8.if.exit.1:
  %8 = phi i32 [%7, %_6.if.then.1], [%5, %_7.if.else.1]                            ; inst 17
  %9 = call i1 @evaluateThresholdFunction(i32 %0)                                  ; inst 18
  br i1 %9, label %_9.if.then.2, label %_10.if.else.2                              ; inst 19
_9.if.then.2:
  %10 = add i32 %8, 3                                                              ; inst 20
  br label %_11.if.exit.2                                                          ; inst 21
_10.if.else.2:
  br label %_11.if.exit.2                                                          ; inst 22
_11.if.exit.2:
  %11 = phi i32 [%10, %_9.if.then.2], [%8, %_10.if.else.2]                         ; inst 23
  %12 = add i32 %0, 1                                                              ; inst 24
  br label %_1.while.cond.0                                                        ; inst 25
_12.while.exit.0:
  ret i32 %1                                                                       ; inst 26
}

define i1 @evaluateParityFunction(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [%0, %_0.entry.0], [%8, %_5.if.exit.0]                              ; inst 2
  %2 = phi i1 [0, %_0.entry.0], [%7, %_5.if.exit.0]                                ; inst 3
  %3 = icmp sgt i32 %1, 0                                                          ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = and i32 %1, 1                                                               ; inst 6
  %5 = icmp ne i32 %4, 0                                                           ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = icmp eq i1 %2, 0                                                            ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %7 = phi i1 [%6, %_3.if.then.0], [%2, %_4.if.else.0]                             ; inst 12
  %8 = sdiv i32 %1, 2                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  ret i1 %2                                                                        ; inst 15
}

define i1 @evaluateMajorityFunction(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [%0, %_0.entry.0], [%8, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_5.if.exit.0]                               ; inst 3
  %3 = icmp sgt i32 %1, 0                                                          ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = and i32 %1, 1                                                               ; inst 6
  %5 = icmp ne i32 %4, 0                                                           ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = add i32 %2, 1                                                               ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %7 = phi i32 [%6, %_3.if.then.0], [%2, %_4.if.else.0]                            ; inst 12
  %8 = sdiv i32 %1, 2                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  %9 = icmp sgt i32 %2, 4                                                          ; inst 15
  ret i1 %9                                                                        ; inst 16
}

define i1 @evaluateThresholdFunction(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [%0, %_0.entry.0], [%8, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_5.if.exit.0]                               ; inst 3
  %3 = icmp sgt i32 %1, 0                                                          ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = and i32 %1, 1                                                               ; inst 6
  %5 = icmp ne i32 %4, 0                                                           ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = add i32 %2, 1                                                               ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %7 = phi i32 [%6, %_3.if.then.0], [%2, %_4.if.else.0]                            ; inst 12
  %8 = sdiv i32 %1, 2                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  %9 = icmp sge i32 %2, 3                                                          ; inst 15
  ret i1 %9                                                                        ; inst 16
}

define i32 @solveBooleanPuzzles() {
_0.entry.0:
  %0 = call i32 @solveNQueensBooleanVersion(i32 8)                                 ; inst 1
  %1 = call i32 @solveBooleanConstraints()                                         ; inst 2
  %2 = add i32 %0, %1                                                              ; inst 3
  ret i32 %2                                                                       ; inst 4
}

define i32 @solveNQueensBooleanVersion(i32 %0) {
_0.entry.0:
  %1 = alloca [64 x i1]                                                            ; inst 1
  %2 = alloca [64 x i1]                                                            ; inst 2
  %3 = getelementptr [64 x i1], [64 x i1]* %2, i32 0, i32 0                        ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 64                                                         ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 8
  store i1 0, i1* %6                                                               ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @memcpy([64 x i1]* %1, [64 x i1]* %2, i64 64)                          ; inst 12
  %8 = call i32 @nQueensBacktrack([64 x i1]* %1, i32 0, i32 %0)                    ; inst 13
  ret i32 %8                                                                       ; inst 14
}

define i32 @nQueensBacktrack([64 x i1]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [64 x i1]                                                            ; inst 1
  %4 = alloca [64 x i1]                                                            ; inst 2
  %5 = icmp eq i32 %1, %2                                                          ; inst 3
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 1                                                                        ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 7
_4.while.cond.0:
  %6 = phi i32 [0, %_3.if.exit.0], [%22, %_8.if.exit.1]                            ; inst 8
  %7 = phi i32 [0, %_3.if.exit.0], [%21, %_8.if.exit.1]                            ; inst 9
  %8 = icmp slt i32 %6, %2                                                         ; inst 10
  br i1 %8, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 11
_5.while.body.0:
  call void @memcpy([64 x i1]* %3, [64 x i1]* %0, i64 64)                          ; inst 12
  %9 = call i1 @isSafePosition([64 x i1]* %3, i32 %1, i32 %6, i32 %2)              ; inst 13
  br i1 %9, label %_6.if.then.1, label %_7.if.else.1                               ; inst 14
_6.if.then.1:
  %10 = mul i32 %1, %2                                                             ; inst 15
  %11 = add i32 %10, %6                                                            ; inst 16
  %12 = sext i32 %11 to i64                                                        ; inst 17
  %13 = getelementptr [64 x i1], [64 x i1]* %0, i32 0, i64 %12                     ; inst 18
  store i1 1, i1* %13                                                              ; inst 19
  %14 = add i32 %1, 1                                                              ; inst 20
  call void @memcpy([64 x i1]* %4, [64 x i1]* %0, i64 64)                          ; inst 21
  %15 = call i32 @nQueensBacktrack([64 x i1]* %4, i32 %14, i32 %2)                 ; inst 22
  %16 = add i32 %7, %15                                                            ; inst 23
  %17 = mul i32 %1, %2                                                             ; inst 24
  %18 = add i32 %17, %6                                                            ; inst 25
  %19 = sext i32 %18 to i64                                                        ; inst 26
  %20 = getelementptr [64 x i1], [64 x i1]* %0, i32 0, i64 %19                     ; inst 27
  store i1 0, i1* %20                                                              ; inst 28
  br label %_8.if.exit.1                                                           ; inst 29
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 30
_8.if.exit.1:
  %21 = phi i32 [%16, %_6.if.then.1], [%7, %_7.if.else.1]                          ; inst 31
  %22 = add i32 %6, 1                                                              ; inst 32
  br label %_4.while.cond.0                                                        ; inst 33
_9.while.exit.0:
  ret i32 %7                                                                       ; inst 34
}

define i1 @isSafePosition([64 x i1]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%11, %_5.if.exit.0]                              ; inst 2
  %5 = icmp slt i32 %4, %1                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %6 = mul i32 %4, %3                                                              ; inst 5
  %7 = add i32 %6, %2                                                              ; inst 6
  %8 = sext i32 %7 to i64                                                          ; inst 7
  %9 = getelementptr [64 x i1], [64 x i1]* %0, i32 0, i64 %8                       ; inst 8
  %10 = load i1, i1* %9                                                            ; inst 9
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 10
_3.if.then.0:
  ret i1 0                                                                         ; inst 11
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 12
_5.if.exit.0:
  %11 = add i32 %4, 1                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  %12 = sub i32 %1, 1                                                              ; inst 15
  %13 = sub i32 %2, 1                                                              ; inst 16
  br label %_7.while.cond.1                                                        ; inst 17
_7.while.cond.1:
  %14 = phi i32 [%13, %_6.while.exit.0], [%25, %_14.if.exit.1]                     ; inst 18
  %15 = phi i32 [%12, %_6.while.exit.0], [%24, %_14.if.exit.1]                     ; inst 19
  %16 = icmp sge i32 %15, 0                                                        ; inst 20
  br i1 %16, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 21
_8.lazy.then.0:
  %17 = icmp sge i32 %14, 0                                                        ; inst 22
  br label %_10.lazy.exit.0                                                        ; inst 23
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 24
_10.lazy.exit.0:
  %18 = phi i1 [%17, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 25
  br i1 %18, label %_11.while.body.1, label %_15.while.exit.1                      ; inst 26
_11.while.body.1:
  %19 = mul i32 %15, %3                                                            ; inst 27
  %20 = add i32 %19, %14                                                           ; inst 28
  %21 = sext i32 %20 to i64                                                        ; inst 29
  %22 = getelementptr [64 x i1], [64 x i1]* %0, i32 0, i64 %21                     ; inst 30
  %23 = load i1, i1* %22                                                           ; inst 31
  br i1 %23, label %_12.if.then.1, label %_13.if.else.1                            ; inst 32
_12.if.then.1:
  ret i1 0                                                                         ; inst 33
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 34
_14.if.exit.1:
  %24 = sub i32 %15, 1                                                             ; inst 35
  %25 = sub i32 %14, 1                                                             ; inst 36
  br label %_7.while.cond.1                                                        ; inst 37
_15.while.exit.1:
  %26 = sub i32 %1, 1                                                              ; inst 38
  %27 = add i32 %2, 1                                                              ; inst 39
  br label %_16.while.cond.2                                                       ; inst 40
_16.while.cond.2:
  %28 = phi i32 [%27, %_15.while.exit.1], [%39, %_23.if.exit.2]                    ; inst 41
  %29 = phi i32 [%26, %_15.while.exit.1], [%38, %_23.if.exit.2]                    ; inst 42
  %30 = icmp sge i32 %29, 0                                                        ; inst 43
  br i1 %30, label %_17.lazy.then.1, label %_18.lazy.else.1                        ; inst 44
_17.lazy.then.1:
  %31 = icmp slt i32 %28, %3                                                       ; inst 45
  br label %_19.lazy.exit.1                                                        ; inst 46
_18.lazy.else.1:
  br label %_19.lazy.exit.1                                                        ; inst 47
_19.lazy.exit.1:
  %32 = phi i1 [%31, %_17.lazy.then.1], [0, %_18.lazy.else.1]                      ; inst 48
  br i1 %32, label %_20.while.body.2, label %_24.while.exit.2                      ; inst 49
_20.while.body.2:
  %33 = mul i32 %29, %3                                                            ; inst 50
  %34 = add i32 %33, %28                                                           ; inst 51
  %35 = sext i32 %34 to i64                                                        ; inst 52
  %36 = getelementptr [64 x i1], [64 x i1]* %0, i32 0, i64 %35                     ; inst 53
  %37 = load i1, i1* %36                                                           ; inst 54
  br i1 %37, label %_21.if.then.2, label %_22.if.else.2                            ; inst 55
_21.if.then.2:
  ret i1 0                                                                         ; inst 56
_22.if.else.2:
  br label %_23.if.exit.2                                                          ; inst 57
_23.if.exit.2:
  %38 = sub i32 %29, 1                                                             ; inst 58
  %39 = add i32 %28, 1                                                             ; inst 59
  br label %_16.while.cond.2                                                       ; inst 60
_24.while.exit.2:
  ret i1 1                                                                         ; inst 61
}

define i32 @solveBooleanConstraints() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%6, %_5.if.exit.0]                               ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%5, %_5.if.exit.0]                               ; inst 3
  %2 = icmp slt i32 %0, 65536                                                      ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %3 = call i1 @satisfiesAllBooleanConstraints(i32 %0)                             ; inst 6
  br i1 %3, label %_3.if.then.0, label %_4.if.else.0                               ; inst 7
_3.if.then.0:
  %4 = add i32 %1, 1                                                               ; inst 8
  br label %_5.if.exit.0                                                           ; inst 9
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 10
_5.if.exit.0:
  %5 = phi i32 [%4, %_3.if.then.0], [%1, %_4.if.else.0]                            ; inst 11
  %6 = add i32 %0, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_6.while.exit.0:
  ret i32 %1                                                                       ; inst 14
}

define i1 @satisfiesAllBooleanConstraints(i32 %0) {
_0.entry.0:
  %1 = alloca [16 x i1]                                                            ; inst 1
  call void @extractBooleanVariables([16 x i1]* %1, i32 %0)                        ; inst 2
  %2 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 0                        ; inst 3
  %3 = load i1, i1* %2                                                             ; inst 4
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 5
_1.lazy.then.0:
  br label %_6.lazy.exit.0                                                         ; inst 6
_2.lazy.else.0:
  %4 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 1                        ; inst 7
  %5 = load i1, i1* %4                                                             ; inst 8
  %6 = icmp eq i1 %5, 0                                                            ; inst 9
  br i1 %6, label %_3.lazy.then.1, label %_4.lazy.else.1                           ; inst 10
_3.lazy.then.1:
  %7 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 2                        ; inst 11
  %8 = load i1, i1* %7                                                             ; inst 12
  br label %_5.lazy.exit.1                                                         ; inst 13
_4.lazy.else.1:
  br label %_5.lazy.exit.1                                                         ; inst 14
_5.lazy.exit.1:
  %9 = phi i1 [%8, %_3.lazy.then.1], [0, %_4.lazy.else.1]                          ; inst 15
  br label %_6.lazy.exit.0                                                         ; inst 16
_6.lazy.exit.0:
  %10 = phi i1 [1, %_1.lazy.then.0], [%9, %_5.lazy.exit.1]                         ; inst 17
  %11 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 3                       ; inst 18
  %12 = load i1, i1* %11                                                           ; inst 19
  %13 = icmp eq i1 %12, 0                                                          ; inst 20
  br i1 %13, label %_7.lazy.then.2, label %_8.lazy.else.2                          ; inst 21
_7.lazy.then.2:
  br label %_12.lazy.exit.2                                                        ; inst 22
_8.lazy.else.2:
  %14 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 4                       ; inst 23
  %15 = load i1, i1* %14                                                           ; inst 24
  br i1 %15, label %_9.lazy.then.3, label %_10.lazy.else.3                         ; inst 25
_9.lazy.then.3:
  %16 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 5                       ; inst 26
  %17 = load i1, i1* %16                                                           ; inst 27
  %18 = icmp eq i1 %17, 0                                                          ; inst 28
  br label %_11.lazy.exit.3                                                        ; inst 29
_10.lazy.else.3:
  br label %_11.lazy.exit.3                                                        ; inst 30
_11.lazy.exit.3:
  %19 = phi i1 [%18, %_9.lazy.then.3], [0, %_10.lazy.else.3]                       ; inst 31
  br label %_12.lazy.exit.2                                                        ; inst 32
_12.lazy.exit.2:
  %20 = phi i1 [1, %_7.lazy.then.2], [%19, %_11.lazy.exit.3]                       ; inst 33
  %21 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 6                       ; inst 34
  %22 = load i1, i1* %21                                                           ; inst 35
  br i1 %22, label %_13.lazy.then.4, label %_14.lazy.else.4                        ; inst 36
_13.lazy.then.4:
  br label %_15.lazy.exit.4                                                        ; inst 37
_14.lazy.else.4:
  %23 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 7                       ; inst 38
  %24 = load i1, i1* %23                                                           ; inst 39
  br label %_15.lazy.exit.4                                                        ; inst 40
_15.lazy.exit.4:
  %25 = phi i1 [1, %_13.lazy.then.4], [%24, %_14.lazy.else.4]                      ; inst 41
  br i1 %25, label %_16.lazy.then.5, label %_20.lazy.else.5                        ; inst 42
_16.lazy.then.5:
  %26 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 8                       ; inst 43
  %27 = load i1, i1* %26                                                           ; inst 44
  %28 = icmp eq i1 %27, 0                                                          ; inst 45
  br i1 %28, label %_17.lazy.then.6, label %_18.lazy.else.6                        ; inst 46
_17.lazy.then.6:
  br label %_19.lazy.exit.6                                                        ; inst 47
_18.lazy.else.6:
  %29 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 9                       ; inst 48
  %30 = load i1, i1* %29                                                           ; inst 49
  br label %_19.lazy.exit.6                                                        ; inst 50
_19.lazy.exit.6:
  %31 = phi i1 [1, %_17.lazy.then.6], [%30, %_18.lazy.else.6]                      ; inst 51
  br label %_21.lazy.exit.5                                                        ; inst 52
_20.lazy.else.5:
  br label %_21.lazy.exit.5                                                        ; inst 53
_21.lazy.exit.5:
  %32 = phi i1 [%31, %_19.lazy.exit.6], [0, %_20.lazy.else.5]                      ; inst 54
  %33 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 10                      ; inst 55
  %34 = load i1, i1* %33                                                           ; inst 56
  %35 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 11                      ; inst 57
  %36 = load i1, i1* %35                                                           ; inst 58
  br i1 %36, label %_22.lazy.then.7, label %_23.lazy.else.7                        ; inst 59
_22.lazy.then.7:
  %37 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 12                      ; inst 60
  %38 = load i1, i1* %37                                                           ; inst 61
  br label %_24.lazy.exit.7                                                        ; inst 62
_23.lazy.else.7:
  br label %_24.lazy.exit.7                                                        ; inst 63
_24.lazy.exit.7:
  %39 = phi i1 [%38, %_22.lazy.then.7], [0, %_23.lazy.else.7]                      ; inst 64
  %40 = icmp eq i1 %34, %39                                                        ; inst 65
  %41 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 13                      ; inst 66
  %42 = load i1, i1* %41                                                           ; inst 67
  br i1 %42, label %_25.lazy.then.8, label %_26.lazy.else.8                        ; inst 68
_25.lazy.then.8:
  br label %_27.lazy.exit.8                                                        ; inst 69
_26.lazy.else.8:
  %43 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 14                      ; inst 70
  %44 = load i1, i1* %43                                                           ; inst 71
  br label %_27.lazy.exit.8                                                        ; inst 72
_27.lazy.exit.8:
  %45 = phi i1 [1, %_25.lazy.then.8], [%44, %_26.lazy.else.8]                      ; inst 73
  %46 = getelementptr [16 x i1], [16 x i1]* %1, i32 0, i64 15                      ; inst 74
  %47 = load i1, i1* %46                                                           ; inst 75
  %48 = icmp ne i1 %45, %47                                                        ; inst 76
  br i1 %10, label %_28.lazy.then.9, label %_29.lazy.else.9                        ; inst 77
_28.lazy.then.9:
  br label %_30.lazy.exit.9                                                        ; inst 78
_29.lazy.else.9:
  br label %_30.lazy.exit.9                                                        ; inst 79
_30.lazy.exit.9:
  %49 = phi i1 [%20, %_28.lazy.then.9], [0, %_29.lazy.else.9]                      ; inst 80
  br i1 %49, label %_31.lazy.then.10, label %_32.lazy.else.10                      ; inst 81
_31.lazy.then.10:
  br label %_33.lazy.exit.10                                                       ; inst 82
_32.lazy.else.10:
  br label %_33.lazy.exit.10                                                       ; inst 83
_33.lazy.exit.10:
  %50 = phi i1 [%32, %_31.lazy.then.10], [0, %_32.lazy.else.10]                    ; inst 84
  br i1 %50, label %_34.lazy.then.11, label %_35.lazy.else.11                      ; inst 85
_34.lazy.then.11:
  br label %_36.lazy.exit.11                                                       ; inst 86
_35.lazy.else.11:
  br label %_36.lazy.exit.11                                                       ; inst 87
_36.lazy.exit.11:
  %51 = phi i1 [%40, %_34.lazy.then.11], [0, %_35.lazy.else.11]                    ; inst 88
  br i1 %51, label %_37.lazy.then.12, label %_38.lazy.else.12                      ; inst 89
_37.lazy.then.12:
  br label %_39.lazy.exit.12                                                       ; inst 90
_38.lazy.else.12:
  br label %_39.lazy.exit.12                                                       ; inst 91
_39.lazy.exit.12:
  %52 = phi i1 [%48, %_37.lazy.then.12], [0, %_38.lazy.else.12]                    ; inst 92
  ret i1 %52                                                                       ; inst 93
}

define void @extractBooleanVariables([16 x i1]* sret([16 x i1]) %0, i32 %1) {
_0.entry.0:
  %2 = alloca [16 x i1]                                                            ; inst 1
  %3 = getelementptr [16 x i1], [16 x i1]* %2, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 16                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 7
  store i1 0, i1* %6                                                               ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%16, %_5.while.body.0]                      ; inst 12
  %9 = phi i32 [%1, %_3.array.exit.0], [%15, %_5.while.body.0]                     ; inst 13
  %10 = icmp slt i32 %8, 16                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 15
_5.while.body.0:
  %11 = sext i32 %8 to i64                                                         ; inst 16
  %12 = getelementptr [16 x i1], [16 x i1]* %2, i32 0, i64 %11                     ; inst 17
  %13 = and i32 %9, 1                                                              ; inst 18
  %14 = icmp ne i32 %13, 0                                                         ; inst 19
  store i1 %14, i1* %12                                                            ; inst 20
  %15 = sdiv i32 %9, 2                                                             ; inst 21
  %16 = add i32 %8, 1                                                              ; inst 22
  br label %_4.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  call void @memcpy([16 x i1]* %0, [16 x i1]* %2, i64 16)                          ; inst 24
  ret void                                                                         ; inst 25
}

define void @testBooleanSearchAndFilter() {
_0.entry.0:
  %0 = alloca [5000 x i32]                                                         ; inst 1
  %1 = alloca [5000 x i32]                                                         ; inst 2
  %2 = alloca [5000 x i32]                                                         ; inst 3
  %3 = alloca [5000 x i32]                                                         ; inst 4
  call void @printlnInt(i32 1107)                                                  ; inst 5
  %4 = alloca [5000 x i32]                                                         ; inst 6
  %5 = getelementptr [5000 x i32], [5000 x i32]* %4, i32 0, i32 0                  ; inst 7
  br label %_1.array.cond.0                                                        ; inst 8
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 9
  %7 = icmp slt i32 %6, 5000                                                       ; inst 10
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 11
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 12
  store i32 0, i32* %8                                                             ; inst 13
  %9 = add i32 %6, 1                                                               ; inst 14
  br label %_1.array.cond.0                                                        ; inst 15
_3.array.exit.0:
  call void @memcpy([5000 x i32]* %0, [5000 x i32]* %4, i64 20000)                 ; inst 16
  call void @initializeSearchData([5000 x i32]* %0)                                ; inst 17
  call void @memcpy([5000 x i32]* %1, [5000 x i32]* %4, i64 20000)                 ; inst 18
  %10 = call i32 @performBooleanFilter([5000 x i32]* %1)                           ; inst 19
  call void @memcpy([5000 x i32]* %2, [5000 x i32]* %4, i64 20000)                 ; inst 20
  %11 = call i32 @performMultiCriteriaSearch([5000 x i32]* %2)                     ; inst 21
  %12 = add i32 %10, %11                                                           ; inst 22
  call void @memcpy([5000 x i32]* %3, [5000 x i32]* %4, i64 20000)                 ; inst 23
  %13 = call i32 @performBooleanRangeSearch([5000 x i32]* %3)                      ; inst 24
  %14 = add i32 %12, %13                                                           ; inst 25
  call void @printlnInt(i32 %14)                                                   ; inst 26
  call void @printlnInt(i32 1108)                                                  ; inst 27
  ret void                                                                         ; inst 28
}

define void @initializeSearchData([5000 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [54321, %_0.entry.0], [%7, %_5.if.exit.0]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%11, %_5.if.exit.0]                              ; inst 3
  %3 = icmp slt i32 %2, 5000                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = call i32 @pm_rand_update(i32 %1)                                            ; inst 6
  %5 = icmp slt i32 %4, 0                                                          ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = sub i32 0, %4                                                               ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %7 = phi i32 [%6, %_3.if.then.0], [%4, %_4.if.else.0]                            ; inst 12
  %8 = sext i32 %2 to i64                                                          ; inst 13
  %9 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %8                 ; inst 14
  %10 = srem i32 %7, 10000                                                         ; inst 15
  store i32 %10, i32* %9                                                           ; inst 16
  %11 = add i32 %2, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  ret void                                                                         ; inst 19
}

define i32 @performBooleanFilter([5000 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%27, %_14.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%26, %_14.if.exit.0]                             ; inst 3
  %3 = icmp slt i32 %1, 5000                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %4                 ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = icmp sgt i32 %6, 1000                                                       ; inst 9
  %8 = sext i32 %1 to i64                                                          ; inst 10
  %9 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %8                 ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  %11 = srem i32 %10, 2                                                            ; inst 13
  %12 = icmp eq i32 %11, 0                                                         ; inst 14
  %13 = sext i32 %1 to i64                                                         ; inst 15
  %14 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %13               ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  %16 = icmp slt i32 %15, 8000                                                     ; inst 18
  %17 = sext i32 %1 to i64                                                         ; inst 19
  %18 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %17               ; inst 20
  %19 = load i32, i32* %18                                                         ; inst 21
  %20 = srem i32 %19, 100                                                          ; inst 22
  %21 = call i1 @isPrime(i32 %20)                                                  ; inst 23
  br i1 %7, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 24
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 25
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 26
_5.lazy.exit.0:
  %22 = phi i1 [%12, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 27
  br i1 %22, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 28
_6.lazy.then.1:
  br label %_11.lazy.exit.1                                                        ; inst 29
_7.lazy.else.1:
  br i1 %16, label %_8.lazy.then.2, label %_9.lazy.else.2                          ; inst 30
_8.lazy.then.2:
  br label %_10.lazy.exit.2                                                        ; inst 31
_9.lazy.else.2:
  br label %_10.lazy.exit.2                                                        ; inst 32
_10.lazy.exit.2:
  %23 = phi i1 [%21, %_8.lazy.then.2], [0, %_9.lazy.else.2]                        ; inst 33
  br label %_11.lazy.exit.1                                                        ; inst 34
_11.lazy.exit.1:
  %24 = phi i1 [1, %_6.lazy.then.1], [%23, %_10.lazy.exit.2]                       ; inst 35
  br i1 %24, label %_12.if.then.0, label %_13.if.else.0                            ; inst 36
_12.if.then.0:
  %25 = add i32 %2, 1                                                              ; inst 37
  br label %_14.if.exit.0                                                          ; inst 38
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 39
_14.if.exit.0:
  %26 = phi i32 [%25, %_12.if.then.0], [%2, %_13.if.else.0]                        ; inst 40
  %27 = add i32 %1, 1                                                              ; inst 41
  br label %_1.while.cond.0                                                        ; inst 42
_15.while.exit.0:
  ret i32 %2                                                                       ; inst 43
}

define i32 @performMultiCriteriaSearch([5000 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%11, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%10, %_5.if.exit.0]                              ; inst 3
  %3 = icmp slt i32 %1, 5000                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %4                 ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = call i32 @countCriteriaMet(i32 %6)                                          ; inst 9
  %8 = icmp sge i32 %7, 3                                                          ; inst 10
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 11
_3.if.then.0:
  %9 = add i32 %2, 1                                                               ; inst 12
  br label %_5.if.exit.0                                                           ; inst 13
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 14
_5.if.exit.0:
  %10 = phi i32 [%9, %_3.if.then.0], [%2, %_4.if.else.0]                           ; inst 15
  %11 = add i32 %1, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_6.while.exit.0:
  ret i32 %2                                                                       ; inst 18
}

define i32 @countCriteriaMet(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 3                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %3 = phi i32 [1, %_1.if.then.0], [0, %_2.if.else.0]                              ; inst 6
  %4 = icmp sgt i32 %0, 5000                                                       ; inst 7
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 8
_4.if.then.1:
  %5 = add i32 %3, 1                                                               ; inst 9
  br label %_6.if.exit.1                                                           ; inst 10
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 11
_6.if.exit.1:
  %6 = phi i32 [%5, %_4.if.then.1], [%3, %_5.if.else.1]                            ; inst 12
  %7 = srem i32 %0, 7                                                              ; inst 13
  %8 = icmp eq i32 %7, 0                                                           ; inst 14
  br i1 %8, label %_7.if.then.2, label %_8.if.else.2                               ; inst 15
_7.if.then.2:
  %9 = add i32 %6, 1                                                               ; inst 16
  br label %_9.if.exit.2                                                           ; inst 17
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 18
_9.if.exit.2:
  %10 = phi i32 [%9, %_7.if.then.2], [%6, %_8.if.else.2]                           ; inst 19
  %11 = icmp slt i32 %0, 2000                                                      ; inst 20
  br i1 %11, label %_10.if.then.3, label %_11.if.else.3                            ; inst 21
_10.if.then.3:
  %12 = add i32 %10, 1                                                             ; inst 22
  br label %_12.if.exit.3                                                          ; inst 23
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 24
_12.if.exit.3:
  %13 = phi i32 [%12, %_10.if.then.3], [%10, %_11.if.else.3]                       ; inst 25
  %14 = srem i32 %0, 100                                                           ; inst 26
  %15 = icmp sgt i32 %14, 50                                                       ; inst 27
  br i1 %15, label %_13.if.then.4, label %_14.if.else.4                            ; inst 28
_13.if.then.4:
  %16 = add i32 %13, 1                                                             ; inst 29
  br label %_15.if.exit.4                                                          ; inst 30
_14.if.else.4:
  br label %_15.if.exit.4                                                          ; inst 31
_15.if.exit.4:
  %17 = phi i32 [%16, %_13.if.then.4], [%13, %_14.if.else.4]                       ; inst 32
  ret i32 %17                                                                      ; inst 33
}

define i32 @performBooleanRangeSearch([5000 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%41, %_23.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%40, %_23.if.exit.0]                             ; inst 3
  %3 = icmp slt i32 %1, 5000                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_24.while.exit.0                        ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %4                 ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = icmp sge i32 %6, 1000                                                       ; inst 9
  br i1 %7, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 10
_3.lazy.then.0:
  %8 = sext i32 %1 to i64                                                          ; inst 11
  %9 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %8                 ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  %11 = icmp sle i32 %10, 3000                                                     ; inst 14
  br label %_5.lazy.exit.0                                                         ; inst 15
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 16
_5.lazy.exit.0:
  %12 = phi i1 [%11, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 17
  %13 = sext i32 %1 to i64                                                         ; inst 18
  %14 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %13               ; inst 19
  %15 = load i32, i32* %14                                                         ; inst 20
  %16 = icmp sge i32 %15, 6000                                                     ; inst 21
  br i1 %16, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 22
_6.lazy.then.1:
  %17 = sext i32 %1 to i64                                                         ; inst 23
  %18 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %17               ; inst 24
  %19 = load i32, i32* %18                                                         ; inst 25
  %20 = icmp sle i32 %19, 8000                                                     ; inst 26
  br label %_8.lazy.exit.1                                                         ; inst 27
_7.lazy.else.1:
  br label %_8.lazy.exit.1                                                         ; inst 28
_8.lazy.exit.1:
  %21 = phi i1 [%20, %_6.lazy.then.1], [0, %_7.lazy.else.1]                        ; inst 29
  %22 = sext i32 %1 to i64                                                         ; inst 30
  %23 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %22               ; inst 31
  %24 = load i32, i32* %23                                                         ; inst 32
  %25 = icmp sge i32 %24, 500                                                      ; inst 33
  br i1 %25, label %_9.lazy.then.2, label %_10.lazy.else.2                         ; inst 34
_9.lazy.then.2:
  %26 = sext i32 %1 to i64                                                         ; inst 35
  %27 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %26               ; inst 36
  %28 = load i32, i32* %27                                                         ; inst 37
  %29 = icmp sle i32 %28, 1500                                                     ; inst 38
  br label %_11.lazy.exit.2                                                        ; inst 39
_10.lazy.else.2:
  br label %_11.lazy.exit.2                                                        ; inst 40
_11.lazy.exit.2:
  %30 = phi i1 [%29, %_9.lazy.then.2], [0, %_10.lazy.else.2]                       ; inst 41
  br i1 %12, label %_12.lazy.then.3, label %_13.lazy.else.3                        ; inst 42
_12.lazy.then.3:
  br label %_14.lazy.exit.3                                                        ; inst 43
_13.lazy.else.3:
  br label %_14.lazy.exit.3                                                        ; inst 44
_14.lazy.exit.3:
  %31 = phi i1 [1, %_12.lazy.then.3], [%21, %_13.lazy.else.3]                      ; inst 45
  br i1 %31, label %_15.lazy.then.4, label %_16.lazy.else.4                        ; inst 46
_15.lazy.then.4:
  br label %_20.lazy.exit.4                                                        ; inst 47
_16.lazy.else.4:
  br i1 %30, label %_17.lazy.then.5, label %_18.lazy.else.5                        ; inst 48
_17.lazy.then.5:
  %32 = sext i32 %1 to i64                                                         ; inst 49
  %33 = getelementptr [5000 x i32], [5000 x i32]* %0, i32 0, i64 %32               ; inst 50
  %34 = load i32, i32* %33                                                         ; inst 51
  %35 = srem i32 %34, 2                                                            ; inst 52
  %36 = icmp eq i32 %35, 0                                                         ; inst 53
  br label %_19.lazy.exit.5                                                        ; inst 54
_18.lazy.else.5:
  br label %_19.lazy.exit.5                                                        ; inst 55
_19.lazy.exit.5:
  %37 = phi i1 [%36, %_17.lazy.then.5], [0, %_18.lazy.else.5]                      ; inst 56
  br label %_20.lazy.exit.4                                                        ; inst 57
_20.lazy.exit.4:
  %38 = phi i1 [1, %_15.lazy.then.4], [%37, %_19.lazy.exit.5]                      ; inst 58
  br i1 %38, label %_21.if.then.0, label %_22.if.else.0                            ; inst 59
_21.if.then.0:
  %39 = add i32 %2, 1                                                              ; inst 60
  br label %_23.if.exit.0                                                          ; inst 61
_22.if.else.0:
  br label %_23.if.exit.0                                                          ; inst 62
_23.if.exit.0:
  %40 = phi i32 [%39, %_21.if.then.0], [%2, %_22.if.else.0]                        ; inst 63
  %41 = add i32 %1, 1                                                              ; inst 64
  br label %_1.while.cond.0                                                        ; inst 65
_24.while.exit.0:
  ret i32 %2                                                                       ; inst 66
}

define void @testBooleanStateMachine() {
_0.entry.0:
  call void @printlnInt(i32 1109)                                                  ; inst 1
  %0 = call i32 @simulateTrafficLightController()                                  ; inst 2
  %1 = call i32 @simulateDigitalCircuit()                                          ; inst 3
  %2 = add i32 %0, %1                                                              ; inst 4
  %3 = call i32 @simulateBooleanAutomaton()                                        ; inst 5
  %4 = add i32 %2, %3                                                              ; inst 6
  call void @printlnInt(i32 %4)                                                    ; inst 7
  call void @printlnInt(i32 1110)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @simulateTrafficLightController() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%14, %_5.if.exit.0]                              ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 3
  %2 = phi i32 [0, %_0.entry.0], [%10, %_5.if.exit.0]                              ; inst 4
  %3 = icmp slt i32 %0, 10000                                                      ; inst 5
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %4 = srem i32 %0, 100                                                            ; inst 7
  %5 = icmp slt i32 %4, 10                                                         ; inst 8
  %6 = srem i32 %0, 500                                                            ; inst 9
  %7 = icmp slt i32 %6, 5                                                          ; inst 10
  %8 = srem i32 %0, 50                                                             ; inst 11
  %9 = icmp slt i32 %8, 25                                                         ; inst 12
  %10 = call i32 @getNextTrafficState(i32 %2, i1 %5, i1 %7, i1 %9, i32 %0)         ; inst 13
  %11 = icmp ne i32 %10, %2                                                        ; inst 14
  br i1 %11, label %_3.if.then.0, label %_4.if.else.0                              ; inst 15
_3.if.then.0:
  %12 = add i32 %1, 1                                                              ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %13 = phi i32 [%12, %_3.if.then.0], [%1, %_4.if.else.0]                          ; inst 19
  %14 = add i32 %0, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  ret i32 %1                                                                       ; inst 22
}

define i32 @getNextTrafficState(i32 %0, i1 %1, i1 %2, i1 %3, i32 %4) {
_0.entry.0:
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 1
_1.if.then.0:
  ret i32 1                                                                        ; inst 2
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 3
_3.if.exit.0:
  %5 = icmp eq i32 %0, 0                                                           ; inst 4
  br i1 %5, label %_4.if.then.1, label %_14.if.else.1                              ; inst 5
_4.if.then.1:
  %6 = srem i32 %4, 60                                                             ; inst 6
  %7 = icmp sgt i32 %6, 30                                                         ; inst 7
  br i1 %7, label %_5.lazy.then.0, label %_6.lazy.else.0                           ; inst 8
_5.lazy.then.0:
  br label %_10.lazy.exit.0                                                        ; inst 9
_6.lazy.else.0:
  br i1 %1, label %_7.lazy.then.1, label %_8.lazy.else.1                           ; inst 10
_7.lazy.then.1:
  %8 = icmp eq i1 %3, 0                                                            ; inst 11
  br label %_9.lazy.exit.1                                                         ; inst 12
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 13
_9.lazy.exit.1:
  %9 = phi i1 [%8, %_7.lazy.then.1], [0, %_8.lazy.else.1]                          ; inst 14
  br label %_10.lazy.exit.0                                                        ; inst 15
_10.lazy.exit.0:
  %10 = phi i1 [1, %_5.lazy.then.0], [%9, %_9.lazy.exit.1]                         ; inst 16
  br i1 %10, label %_11.if.then.2, label %_12.if.else.2                            ; inst 17
_11.if.then.2:
  ret i32 1                                                                        ; inst 18
_12.if.else.2:
  br label %_13.if.exit.2                                                          ; inst 19
_13.if.exit.2:
  br label %_33.if.exit.1                                                          ; inst 20
_14.if.else.1:
  %11 = icmp eq i32 %0, 1                                                          ; inst 21
  br i1 %11, label %_15.if.then.3, label %_25.if.else.3                            ; inst 22
_15.if.then.3:
  %12 = srem i32 %4, 60                                                            ; inst 23
  %13 = icmp sgt i32 %12, 50                                                       ; inst 24
  br i1 %13, label %_16.lazy.then.2, label %_17.lazy.else.2                        ; inst 25
_16.lazy.then.2:
  br label %_21.lazy.exit.2                                                        ; inst 26
_17.lazy.else.2:
  br i1 %1, label %_18.lazy.then.3, label %_19.lazy.else.3                         ; inst 27
_18.lazy.then.3:
  %14 = srem i32 %4, 120                                                           ; inst 28
  %15 = icmp sgt i32 %14, 60                                                       ; inst 29
  br label %_20.lazy.exit.3                                                        ; inst 30
_19.lazy.else.3:
  br label %_20.lazy.exit.3                                                        ; inst 31
_20.lazy.exit.3:
  %16 = phi i1 [%15, %_18.lazy.then.3], [0, %_19.lazy.else.3]                      ; inst 32
  br label %_21.lazy.exit.2                                                        ; inst 33
_21.lazy.exit.2:
  %17 = phi i1 [1, %_16.lazy.then.2], [%16, %_20.lazy.exit.3]                      ; inst 34
  br i1 %17, label %_22.if.then.4, label %_23.if.else.4                            ; inst 35
_22.if.then.4:
  ret i32 2                                                                        ; inst 36
_23.if.else.4:
  br label %_24.if.exit.4                                                          ; inst 37
_24.if.exit.4:
  br label %_32.if.exit.3                                                          ; inst 38
_25.if.else.3:
  %18 = icmp eq i32 %0, 2                                                          ; inst 39
  br i1 %18, label %_26.if.then.5, label %_30.if.else.5                            ; inst 40
_26.if.then.5:
  %19 = srem i32 %4, 60                                                            ; inst 41
  %20 = icmp sgt i32 %19, 55                                                       ; inst 42
  br i1 %20, label %_27.if.then.6, label %_28.if.else.6                            ; inst 43
_27.if.then.6:
  ret i32 0                                                                        ; inst 44
_28.if.else.6:
  br label %_29.if.exit.6                                                          ; inst 45
_29.if.exit.6:
  br label %_31.if.exit.5                                                          ; inst 46
_30.if.else.5:
  br label %_31.if.exit.5                                                          ; inst 47
_31.if.exit.5:
  br label %_32.if.exit.3                                                          ; inst 48
_32.if.exit.3:
  br label %_33.if.exit.1                                                          ; inst 49
_33.if.exit.1:
  ret i32 %0                                                                       ; inst 50
}

define i32 @simulateDigitalCircuit() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%30, %_26.if.exit.3]                             ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%31, %_26.if.exit.3]                             ; inst 3
  %2 = phi i1 [0, %_0.entry.0], [%13, %_26.if.exit.3]                              ; inst 4
  %3 = phi i1 [0, %_0.entry.0], [%14, %_26.if.exit.3]                              ; inst 5
  %4 = phi i1 [0, %_0.entry.0], [%15, %_26.if.exit.3]                              ; inst 6
  %5 = phi i1 [0, %_0.entry.0], [%18, %_26.if.exit.3]                              ; inst 7
  %6 = icmp slt i32 %1, 1000                                                       ; inst 8
  br i1 %6, label %_2.while.body.0, label %_27.while.exit.0                        ; inst 9
_2.while.body.0:
  %7 = srem i32 %1, 4                                                              ; inst 10
  %8 = icmp slt i32 %7, 2                                                          ; inst 11
  %9 = srem i32 %1, 8                                                              ; inst 12
  %10 = icmp slt i32 %9, 4                                                         ; inst 13
  %11 = srem i32 %1, 16                                                            ; inst 14
  %12 = icmp slt i32 %11, 8                                                        ; inst 15
  br i1 %8, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 16
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 18
_5.lazy.exit.0:
  %13 = phi i1 [%10, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 19
  br i1 %10, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 20
_6.lazy.then.1:
  br label %_8.lazy.exit.1                                                         ; inst 21
_7.lazy.else.1:
  br label %_8.lazy.exit.1                                                         ; inst 22
_8.lazy.exit.1:
  %14 = phi i1 [1, %_6.lazy.then.1], [%12, %_7.lazy.else.1]                        ; inst 23
  %15 = icmp ne i1 %13, %14                                                        ; inst 24
  br i1 %13, label %_9.lazy.then.2, label %_10.lazy.else.2                         ; inst 25
_9.lazy.then.2:
  br label %_11.lazy.exit.2                                                        ; inst 26
_10.lazy.else.2:
  br label %_11.lazy.exit.2                                                        ; inst 27
_11.lazy.exit.2:
  %16 = phi i1 [%14, %_9.lazy.then.2], [0, %_10.lazy.else.2]                       ; inst 28
  br i1 %16, label %_12.lazy.then.3, label %_13.lazy.else.3                        ; inst 29
_12.lazy.then.3:
  br label %_14.lazy.exit.3                                                        ; inst 30
_13.lazy.else.3:
  br label %_14.lazy.exit.3                                                        ; inst 31
_14.lazy.exit.3:
  %17 = phi i1 [%15, %_12.lazy.then.3], [0, %_13.lazy.else.3]                      ; inst 32
  %18 = icmp eq i1 %17, 0                                                          ; inst 33
  %19 = icmp ne i1 %2, %13                                                         ; inst 34
  br i1 %19, label %_15.if.then.0, label %_16.if.else.0                            ; inst 35
_15.if.then.0:
  %20 = add i32 %0, 1                                                              ; inst 36
  br label %_17.if.exit.0                                                          ; inst 37
_16.if.else.0:
  br label %_17.if.exit.0                                                          ; inst 38
_17.if.exit.0:
  %21 = phi i32 [%20, %_15.if.then.0], [%0, %_16.if.else.0]                        ; inst 39
  %22 = icmp ne i1 %3, %14                                                         ; inst 40
  br i1 %22, label %_18.if.then.1, label %_19.if.else.1                            ; inst 41
_18.if.then.1:
  %23 = add i32 %21, 1                                                             ; inst 42
  br label %_20.if.exit.1                                                          ; inst 43
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 44
_20.if.exit.1:
  %24 = phi i32 [%23, %_18.if.then.1], [%21, %_19.if.else.1]                       ; inst 45
  %25 = icmp ne i1 %4, %15                                                         ; inst 46
  br i1 %25, label %_21.if.then.2, label %_22.if.else.2                            ; inst 47
_21.if.then.2:
  %26 = add i32 %24, 1                                                             ; inst 48
  br label %_23.if.exit.2                                                          ; inst 49
_22.if.else.2:
  br label %_23.if.exit.2                                                          ; inst 50
_23.if.exit.2:
  %27 = phi i32 [%26, %_21.if.then.2], [%24, %_22.if.else.2]                       ; inst 51
  %28 = icmp ne i1 %5, %18                                                         ; inst 52
  br i1 %28, label %_24.if.then.3, label %_25.if.else.3                            ; inst 53
_24.if.then.3:
  %29 = add i32 %27, 1                                                             ; inst 54
  br label %_26.if.exit.3                                                          ; inst 55
_25.if.else.3:
  br label %_26.if.exit.3                                                          ; inst 56
_26.if.exit.3:
  %30 = phi i32 [%29, %_24.if.then.3], [%27, %_25.if.else.3]                       ; inst 57
  %31 = add i32 %1, 1                                                              ; inst 58
  br label %_1.while.cond.0                                                        ; inst 59
_27.while.exit.0:
  ret i32 %0                                                                       ; inst 60
}

define i32 @simulateBooleanAutomaton() {
_0.entry.0:
  %0 = alloca [100 x i1]                                                           ; inst 1
  %1 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 100                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i1, i1* %1, i32 %2                                            ; inst 7
  store i1 0, i1* %4                                                               ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 49                     ; inst 11
  store i1 1, i1* %6                                                               ; inst 12
  %7 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 50                     ; inst 13
  store i1 1, i1* %7                                                               ; inst 14
  %8 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 51                     ; inst 15
  store i1 1, i1* %8                                                               ; inst 16
  br label %_4.while.cond.0                                                        ; inst 17
_4.while.cond.0:
  %9 = phi i32 [0, %_3.array.exit.0], [%71, %_50.while.exit.2]                     ; inst 18
  %10 = phi i32 [0, %_3.array.exit.0], [%70, %_50.while.exit.2]                    ; inst 19
  %11 = icmp slt i32 %9, 500                                                       ; inst 20
  br i1 %11, label %_5.while.body.0, label %_51.while.exit.0                       ; inst 21
_5.while.body.0:
  %12 = alloca [100 x i1]                                                          ; inst 22
  %13 = getelementptr [100 x i1], [100 x i1]* %12, i32 0, i32 0                    ; inst 23
  br label %_6.array.cond.1                                                        ; inst 24
_6.array.cond.1:
  %14 = phi i32 [0, %_5.while.body.0], [%17, %_7.array.body.1]                     ; inst 25
  %15 = icmp slt i32 %14, 100                                                      ; inst 26
  br i1 %15, label %_7.array.body.1, label %_8.array.exit.1                        ; inst 27
_7.array.body.1:
  %16 = getelementptr i1, i1* %13, i32 %14                                         ; inst 28
  store i1 0, i1* %16                                                              ; inst 29
  %17 = add i32 %14, 1                                                             ; inst 30
  br label %_6.array.cond.1                                                        ; inst 31
_8.array.exit.1:
  br label %_9.while.cond.1                                                        ; inst 32
_9.while.cond.1:
  %18 = phi i32 [0, %_8.array.exit.1], [%60, %_46.if.exit.0]                       ; inst 33
  %19 = phi i32 [1, %_8.array.exit.1], [%61, %_46.if.exit.0]                       ; inst 34
  %20 = icmp slt i32 %19, 99                                                       ; inst 35
  br i1 %20, label %_10.while.body.1, label %_47.while.exit.1                      ; inst 36
_10.while.body.1:
  %21 = sext i32 %19 to i64                                                        ; inst 37
  %22 = sub i64 %21, 1                                                             ; inst 38
  %23 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %22                   ; inst 39
  %24 = load i1, i1* %23                                                           ; inst 40
  %25 = sext i32 %19 to i64                                                        ; inst 41
  %26 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %25                   ; inst 42
  %27 = load i1, i1* %26                                                           ; inst 43
  %28 = sext i32 %19 to i64                                                        ; inst 44
  %29 = add i64 %28, 1                                                             ; inst 45
  %30 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %29                   ; inst 46
  %31 = load i1, i1* %30                                                           ; inst 47
  %32 = sext i32 %19 to i64                                                        ; inst 48
  %33 = getelementptr [100 x i1], [100 x i1]* %12, i32 0, i64 %32                  ; inst 49
  br i1 %24, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 50
_11.lazy.then.0:
  %34 = icmp eq i1 %27, 0                                                          ; inst 51
  br label %_13.lazy.exit.0                                                        ; inst 52
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 53
_13.lazy.exit.0:
  %35 = phi i1 [%34, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 54
  br i1 %35, label %_14.lazy.then.1, label %_15.lazy.else.1                        ; inst 55
_14.lazy.then.1:
  %36 = icmp eq i1 %31, 0                                                          ; inst 56
  br label %_16.lazy.exit.1                                                        ; inst 57
_15.lazy.else.1:
  br label %_16.lazy.exit.1                                                        ; inst 58
_16.lazy.exit.1:
  %37 = phi i1 [%36, %_14.lazy.then.1], [0, %_15.lazy.else.1]                      ; inst 59
  br i1 %37, label %_17.lazy.then.2, label %_18.lazy.else.2                        ; inst 60
_17.lazy.then.2:
  br label %_25.lazy.exit.2                                                        ; inst 61
_18.lazy.else.2:
  %38 = icmp eq i1 %24, 0                                                          ; inst 62
  br i1 %38, label %_19.lazy.then.3, label %_20.lazy.else.3                        ; inst 63
_19.lazy.then.3:
  br label %_21.lazy.exit.3                                                        ; inst 64
_20.lazy.else.3:
  br label %_21.lazy.exit.3                                                        ; inst 65
_21.lazy.exit.3:
  %39 = phi i1 [%27, %_19.lazy.then.3], [0, %_20.lazy.else.3]                      ; inst 66
  br i1 %39, label %_22.lazy.then.4, label %_23.lazy.else.4                        ; inst 67
_22.lazy.then.4:
  %40 = icmp eq i1 %31, 0                                                          ; inst 68
  br label %_24.lazy.exit.4                                                        ; inst 69
_23.lazy.else.4:
  br label %_24.lazy.exit.4                                                        ; inst 70
_24.lazy.exit.4:
  %41 = phi i1 [%40, %_22.lazy.then.4], [0, %_23.lazy.else.4]                      ; inst 71
  br label %_25.lazy.exit.2                                                        ; inst 72
_25.lazy.exit.2:
  %42 = phi i1 [1, %_17.lazy.then.2], [%41, %_24.lazy.exit.4]                      ; inst 73
  br i1 %42, label %_26.lazy.then.5, label %_27.lazy.else.5                        ; inst 74
_26.lazy.then.5:
  br label %_34.lazy.exit.5                                                        ; inst 75
_27.lazy.else.5:
  %43 = icmp eq i1 %24, 0                                                          ; inst 76
  br i1 %43, label %_28.lazy.then.6, label %_29.lazy.else.6                        ; inst 77
_28.lazy.then.6:
  %44 = icmp eq i1 %27, 0                                                          ; inst 78
  br label %_30.lazy.exit.6                                                        ; inst 79
_29.lazy.else.6:
  br label %_30.lazy.exit.6                                                        ; inst 80
_30.lazy.exit.6:
  %45 = phi i1 [%44, %_28.lazy.then.6], [0, %_29.lazy.else.6]                      ; inst 81
  br i1 %45, label %_31.lazy.then.7, label %_32.lazy.else.7                        ; inst 82
_31.lazy.then.7:
  br label %_33.lazy.exit.7                                                        ; inst 83
_32.lazy.else.7:
  br label %_33.lazy.exit.7                                                        ; inst 84
_33.lazy.exit.7:
  %46 = phi i1 [%31, %_31.lazy.then.7], [0, %_32.lazy.else.7]                      ; inst 85
  br label %_34.lazy.exit.5                                                        ; inst 86
_34.lazy.exit.5:
  %47 = phi i1 [1, %_26.lazy.then.5], [%46, %_33.lazy.exit.7]                      ; inst 87
  br i1 %47, label %_35.lazy.then.8, label %_36.lazy.else.8                        ; inst 88
_35.lazy.then.8:
  br label %_43.lazy.exit.8                                                        ; inst 89
_36.lazy.else.8:
  %48 = icmp eq i1 %24, 0                                                          ; inst 90
  br i1 %48, label %_37.lazy.then.9, label %_38.lazy.else.9                        ; inst 91
_37.lazy.then.9:
  br label %_39.lazy.exit.9                                                        ; inst 92
_38.lazy.else.9:
  br label %_39.lazy.exit.9                                                        ; inst 93
_39.lazy.exit.9:
  %49 = phi i1 [%27, %_37.lazy.then.9], [0, %_38.lazy.else.9]                      ; inst 94
  br i1 %49, label %_40.lazy.then.10, label %_41.lazy.else.10                      ; inst 95
_40.lazy.then.10:
  br label %_42.lazy.exit.10                                                       ; inst 96
_41.lazy.else.10:
  br label %_42.lazy.exit.10                                                       ; inst 97
_42.lazy.exit.10:
  %50 = phi i1 [%31, %_40.lazy.then.10], [0, %_41.lazy.else.10]                    ; inst 98
  br label %_43.lazy.exit.8                                                        ; inst 99
_43.lazy.exit.8:
  %51 = phi i1 [1, %_35.lazy.then.8], [%50, %_42.lazy.exit.10]                     ; inst 100
  store i1 %51, i1* %33                                                            ; inst 101
  %52 = sext i32 %19 to i64                                                        ; inst 102
  %53 = getelementptr [100 x i1], [100 x i1]* %12, i32 0, i64 %52                  ; inst 103
  %54 = load i1, i1* %53                                                           ; inst 104
  %55 = sext i32 %19 to i64                                                        ; inst 105
  %56 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %55                   ; inst 106
  %57 = load i1, i1* %56                                                           ; inst 107
  %58 = icmp ne i1 %54, %57                                                        ; inst 108
  br i1 %58, label %_44.if.then.0, label %_45.if.else.0                            ; inst 109
_44.if.then.0:
  %59 = add i32 %18, 1                                                             ; inst 110
  br label %_46.if.exit.0                                                          ; inst 111
_45.if.else.0:
  br label %_46.if.exit.0                                                          ; inst 112
_46.if.exit.0:
  %60 = phi i32 [%59, %_44.if.then.0], [%18, %_45.if.else.0]                       ; inst 113
  %61 = add i32 %19, 1                                                             ; inst 114
  br label %_9.while.cond.1                                                        ; inst 115
_47.while.exit.1:
  br label %_48.while.cond.2                                                       ; inst 116
_48.while.cond.2:
  %62 = phi i32 [0, %_47.while.exit.1], [%69, %_49.while.body.2]                   ; inst 117
  %63 = icmp slt i32 %62, 100                                                      ; inst 118
  br i1 %63, label %_49.while.body.2, label %_50.while.exit.2                      ; inst 119
_49.while.body.2:
  %64 = sext i32 %62 to i64                                                        ; inst 120
  %65 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %64                   ; inst 121
  %66 = sext i32 %62 to i64                                                        ; inst 122
  %67 = getelementptr [100 x i1], [100 x i1]* %12, i32 0, i64 %66                  ; inst 123
  %68 = load i1, i1* %67                                                           ; inst 124
  store i1 %68, i1* %65                                                            ; inst 125
  %69 = add i32 %62, 1                                                             ; inst 126
  br label %_48.while.cond.2                                                       ; inst 127
_50.while.exit.2:
  %70 = add i32 %10, %18                                                           ; inst 128
  %71 = add i32 %9, 1                                                              ; inst 129
  br label %_4.while.cond.0                                                        ; inst 130
_51.while.exit.0:
  ret i32 %10                                                                      ; inst 131
}

define i1 @isPrime(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i1 0                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = icmp sle i32 %0, 3                                                          ; inst 5
  br i1 %2, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i1 1                                                                         ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  %3 = srem i32 %0, 2                                                              ; inst 9
  %4 = icmp eq i32 %3, 0                                                           ; inst 10
  br i1 %4, label %_7.lazy.then.0, label %_8.lazy.else.0                           ; inst 11
_7.lazy.then.0:
  br label %_9.lazy.exit.0                                                         ; inst 12
_8.lazy.else.0:
  %5 = srem i32 %0, 3                                                              ; inst 13
  %6 = icmp eq i32 %5, 0                                                           ; inst 14
  br label %_9.lazy.exit.0                                                         ; inst 15
_9.lazy.exit.0:
  %7 = phi i1 [1, %_7.lazy.then.0], [%6, %_8.lazy.else.0]                          ; inst 16
  br i1 %7, label %_10.if.then.2, label %_11.if.else.2                             ; inst 17
_10.if.then.2:
  ret i1 0                                                                         ; inst 18
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 19
_12.if.exit.2:
  br label %_13.while.cond.0                                                       ; inst 20
_13.while.cond.0:
  %8 = phi i32 [5, %_12.if.exit.2], [%17, %_20.if.exit.3]                          ; inst 21
  %9 = mul i32 %8, %8                                                              ; inst 22
  %10 = icmp sle i32 %9, %0                                                        ; inst 23
  br i1 %10, label %_14.while.body.0, label %_21.while.exit.0                      ; inst 24
_14.while.body.0:
  %11 = srem i32 %0, %8                                                            ; inst 25
  %12 = icmp eq i32 %11, 0                                                         ; inst 26
  br i1 %12, label %_15.lazy.then.1, label %_16.lazy.else.1                        ; inst 27
_15.lazy.then.1:
  br label %_17.lazy.exit.1                                                        ; inst 28
_16.lazy.else.1:
  %13 = add i32 %8, 2                                                              ; inst 29
  %14 = srem i32 %0, %13                                                           ; inst 30
  %15 = icmp eq i32 %14, 0                                                         ; inst 31
  br label %_17.lazy.exit.1                                                        ; inst 32
_17.lazy.exit.1:
  %16 = phi i1 [1, %_15.lazy.then.1], [%15, %_16.lazy.else.1]                      ; inst 33
  br i1 %16, label %_18.if.then.3, label %_19.if.else.3                            ; inst 34
_18.if.then.3:
  ret i1 0                                                                         ; inst 35
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 36
_20.if.exit.3:
  %17 = add i32 %8, 6                                                              ; inst 37
  br label %_13.while.cond.0                                                       ; inst 38
_21.while.exit.0:
  ret i1 1                                                                         ; inst 39
}

