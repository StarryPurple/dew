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
  call void @printlnInt(i32 1600)                                                  ; inst 1
  call void @performLinkedListOperations()                                         ; inst 2
  call void @testAdvancedListOperations()                                          ; inst 3
  call void @performListPerformanceTest()                                          ; inst 4
  call void @testEdgeCases()                                                       ; inst 5
  call void @printlnInt(i32 1699)                                                  ; inst 6
  call void @exit(i32 0)                                                           ; inst 7
  ret void                                                                         ; inst 8
}

define void @performLinkedListOperations() {
_0.entry.0:
  call void @printlnInt(i32 1601)                                                  ; inst 1
  %0 = alloca [2000 x i32]                                                         ; inst 2
  %1 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 2000                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeFreeList([2000 x i32]* %0, i32 1)                           ; inst 12
  call void @printlnInt(i32 1602)                                                  ; inst 13
  br label %_4.while.cond.0                                                        ; inst 14
_4.while.cond.0:
  %6 = phi i32 [1, %_3.array.exit.0], [%25, %_8.if.exit.0]                         ; inst 15
  %7 = phi i32 [0, %_3.array.exit.0], [%26, %_8.if.exit.0]                         ; inst 16
  %8 = phi i32 [0, %_3.array.exit.0], [%27, %_8.if.exit.0]                         ; inst 17
  %9 = phi i32 [1, %_3.array.exit.0], [%28, %_8.if.exit.0]                         ; inst 18
  %10 = icmp sle i32 %9, 100                                                       ; inst 19
  br i1 %10, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 20
_5.while.body.0:
  %11 = call i32 @allocateNode([2000 x i32]* %0, i32 %6)                           ; inst 21
  %12 = icmp ne i32 %11, 0                                                         ; inst 22
  br i1 %12, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  %13 = sext i32 %11 to i64                                                        ; inst 24
  %14 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %13               ; inst 25
  %15 = mul i32 %9, 7                                                              ; inst 26
  %16 = add i32 %15, 13                                                            ; inst 27
  store i32 %16, i32* %14                                                          ; inst 28
  %17 = sext i32 %11 to i64                                                        ; inst 29
  %18 = add i64 %17, 1                                                             ; inst 30
  %19 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %18               ; inst 31
  store i32 %7, i32* %19                                                           ; inst 32
  %20 = add i32 %8, 1                                                              ; inst 33
  %21 = sext i32 %6 to i64                                                         ; inst 34
  %22 = add i64 %21, 1                                                             ; inst 35
  %23 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %22               ; inst 36
  %24 = load i32, i32* %23                                                         ; inst 37
  br label %_8.if.exit.0                                                           ; inst 38
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 39
_8.if.exit.0:
  %25 = phi i32 [%24, %_6.if.then.0], [%6, %_7.if.else.0]                          ; inst 40
  %26 = phi i32 [%11, %_6.if.then.0], [%7, %_7.if.else.0]                          ; inst 41
  %27 = phi i32 [%20, %_6.if.then.0], [%8, %_7.if.else.0]                          ; inst 42
  %28 = add i32 %9, 1                                                              ; inst 43
  br label %_4.while.cond.0                                                        ; inst 44
_9.while.exit.0:
  call void @printlnInt(i32 1603)                                                  ; inst 45
  %29 = call i32 @calculateListSum([2000 x i32]* %0, i32 %7)                       ; inst 46
  call void @printlnInt(i32 %29)                                                   ; inst 47
  call void @printlnInt(i32 1604)                                                  ; inst 48
  %30 = call i32 @reverseList([2000 x i32]* %0, i32 %7)                            ; inst 49
  %31 = call i32 @calculateListSum([2000 x i32]* %0, i32 %30)                      ; inst 50
  call void @printlnInt(i32 %31)                                                   ; inst 51
  call void @printlnInt(i32 1605)                                                  ; inst 52
  %32 = call i32 @complexListSearch([2000 x i32]* %0, i32 %30)                     ; inst 53
  call void @printlnInt(i32 %32)                                                   ; inst 54
  call void @printlnInt(i32 1606)                                                  ; inst 55
  %33 = call i32 @mergeSort([2000 x i32]* %0, i32 %30, i32 %8)                     ; inst 56
  %34 = call i32 @verifySorted([2000 x i32]* %0, i32 %33)                          ; inst 57
  call void @printlnInt(i32 %34)                                                   ; inst 58
  ret void                                                                         ; inst 59
}

define void @initializeFreeList([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [%1, %_0.entry.0], [%10, %_2.while.body.0]                          ; inst 2
  %3 = icmp slt i32 %2, 1998                                                       ; inst 3
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %4                 ; inst 6
  store i32 0, i32* %5                                                             ; inst 7
  %6 = sext i32 %2 to i64                                                          ; inst 8
  %7 = add i64 %6, 1                                                               ; inst 9
  %8 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %7                 ; inst 10
  %9 = add i32 %2, 2                                                               ; inst 11
  store i32 %9, i32* %8                                                            ; inst 12
  %10 = add i32 %2, 2                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  %11 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 1998              ; inst 15
  store i32 0, i32* %11                                                            ; inst 16
  %12 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 1999              ; inst 17
  store i32 0, i32* %12                                                            ; inst 18
  ret void                                                                         ; inst 19
}

define i32 @allocateNode([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %3 = icmp sge i32 %1, 1998                                                       ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %4 = phi i1 [1, %_1.lazy.then.0], [%3, %_2.lazy.else.0]                          ; inst 6
  br i1 %4, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i32 0                                                                        ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %5 = sext i32 %1 to i64                                                          ; inst 10
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %5                 ; inst 11
  store i32 0, i32* %6                                                             ; inst 12
  %7 = sext i32 %1 to i64                                                          ; inst 13
  %8 = add i64 %7, 1                                                               ; inst 14
  %9 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %8                 ; inst 15
  store i32 0, i32* %9                                                             ; inst 16
  ret i32 %1                                                                       ; inst 17
}

define i32 @calculateListSum([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%16, %_5.while.body.0]                           ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%15, %_5.while.body.0]                          ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%11, %_5.while.body.0]                           ; inst 4
  %5 = icmp ne i32 %3, 0                                                           ; inst 5
  br i1 %5, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %6 = icmp slt i32 %2, 1000                                                       ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %7 = phi i1 [%6, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 10
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 11
_5.while.body.0:
  %8 = sext i32 %3 to i64                                                          ; inst 12
  %9 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %8                 ; inst 13
  %10 = load i32, i32* %9                                                          ; inst 14
  %11 = add i32 %4, %10                                                            ; inst 15
  %12 = sext i32 %3 to i64                                                         ; inst 16
  %13 = add i64 %12, 1                                                             ; inst 17
  %14 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %13               ; inst 18
  %15 = load i32, i32* %14                                                         ; inst 19
  %16 = add i32 %2, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  ret i32 %4                                                                       ; inst 22
}

define i32 @reverseList([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%15, %_5.while.body.0]                           ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%11, %_5.while.body.0]                          ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%3, %_5.while.body.0]                            ; inst 4
  %5 = icmp ne i32 %3, 0                                                           ; inst 5
  br i1 %5, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %6 = icmp slt i32 %2, 1000                                                       ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %7 = phi i1 [%6, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 10
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 11
_5.while.body.0:
  %8 = sext i32 %3 to i64                                                          ; inst 12
  %9 = add i64 %8, 1                                                               ; inst 13
  %10 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %9                ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = sext i32 %3 to i64                                                         ; inst 16
  %13 = add i64 %12, 1                                                             ; inst 17
  %14 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %13               ; inst 18
  store i32 %4, i32* %14                                                           ; inst 19
  %15 = add i32 %2, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  ret i32 %4                                                                       ; inst 22
}

define i32 @complexListSearch([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%23, %_20.if.exit.3]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%30, %_20.if.exit.3]                             ; inst 3
  %4 = phi i32 [-999999, %_0.entry.0], [%16, %_20.if.exit.3]                       ; inst 4
  %5 = phi i32 [999999, %_0.entry.0], [%18, %_20.if.exit.3]                        ; inst 5
  %6 = phi i32 [0, %_0.entry.0], [%24, %_20.if.exit.3]                             ; inst 6
  %7 = phi i32 [0, %_0.entry.0], [%35, %_20.if.exit.3]                             ; inst 7
  %8 = phi i32 [%1, %_0.entry.0], [%34, %_20.if.exit.3]                            ; inst 8
  %9 = icmp ne i32 %8, 0                                                           ; inst 9
  br i1 %9, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 10
_2.lazy.then.0:
  %10 = icmp slt i32 %7, 1000                                                      ; inst 11
  br label %_4.lazy.exit.0                                                         ; inst 12
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 13
_4.lazy.exit.0:
  %11 = phi i1 [%10, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 14
  br i1 %11, label %_5.while.body.0, label %_21.while.exit.0                       ; inst 15
_5.while.body.0:
  %12 = sext i32 %8 to i64                                                         ; inst 16
  %13 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %12               ; inst 17
  %14 = load i32, i32* %13                                                         ; inst 18
  %15 = icmp sgt i32 %14, %4                                                       ; inst 19
  br i1 %15, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  br label %_8.if.exit.0                                                           ; inst 21
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 22
_8.if.exit.0:
  %16 = phi i32 [%14, %_6.if.then.0], [%4, %_7.if.else.0]                          ; inst 23
  %17 = icmp slt i32 %14, %5                                                       ; inst 24
  br i1 %17, label %_9.if.then.1, label %_10.if.else.1                             ; inst 25
_9.if.then.1:
  br label %_11.if.exit.1                                                          ; inst 26
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 27
_11.if.exit.1:
  %18 = phi i32 [%14, %_9.if.then.1], [%5, %_10.if.else.1]                         ; inst 28
  %19 = srem i32 %14, 2                                                            ; inst 29
  %20 = icmp eq i32 %19, 0                                                         ; inst 30
  br i1 %20, label %_12.if.then.2, label %_13.if.else.2                            ; inst 31
_12.if.then.2:
  %21 = add i32 %6, 1                                                              ; inst 32
  br label %_14.if.exit.2                                                          ; inst 33
_13.if.else.2:
  %22 = add i32 %2, 1                                                              ; inst 34
  br label %_14.if.exit.2                                                          ; inst 35
_14.if.exit.2:
  %23 = phi i32 [%2, %_12.if.then.2], [%22, %_13.if.else.2]                        ; inst 36
  %24 = phi i32 [%21, %_12.if.then.2], [%6, %_13.if.else.2]                        ; inst 37
  %25 = srem i32 %14, 7                                                            ; inst 38
  %26 = icmp eq i32 %25, 0                                                         ; inst 39
  br i1 %26, label %_15.lazy.then.1, label %_16.lazy.else.1                        ; inst 40
_15.lazy.then.1:
  %27 = icmp sgt i32 %14, 50                                                       ; inst 41
  br label %_17.lazy.exit.1                                                        ; inst 42
_16.lazy.else.1:
  br label %_17.lazy.exit.1                                                        ; inst 43
_17.lazy.exit.1:
  %28 = phi i1 [%27, %_15.lazy.then.1], [0, %_16.lazy.else.1]                      ; inst 44
  br i1 %28, label %_18.if.then.3, label %_19.if.else.3                            ; inst 45
_18.if.then.3:
  %29 = add i32 %3, 1                                                              ; inst 46
  br label %_20.if.exit.3                                                          ; inst 47
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 48
_20.if.exit.3:
  %30 = phi i32 [%29, %_18.if.then.3], [%3, %_19.if.else.3]                        ; inst 49
  %31 = sext i32 %8 to i64                                                         ; inst 50
  %32 = add i64 %31, 1                                                             ; inst 51
  %33 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %32               ; inst 52
  %34 = load i32, i32* %33                                                         ; inst 53
  %35 = add i32 %7, 1                                                              ; inst 54
  br label %_1.while.cond.0                                                        ; inst 55
_21.while.exit.0:
  %36 = mul i32 %3, 1000                                                           ; inst 56
  %37 = mul i32 %6, 10                                                             ; inst 57
  %38 = add i32 %36, %37                                                           ; inst 58
  %39 = add i32 %38, %2                                                            ; inst 59
  ret i32 %39                                                                      ; inst 60
}

define i32 @mergeSort([2000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %4 = sext i32 %1 to i64                                                          ; inst 4
  %5 = add i64 %4, 1                                                               ; inst 5
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %5                 ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = icmp eq i32 %7, 0                                                           ; inst 8
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %9 = phi i1 [1, %_1.lazy.then.0], [%8, %_2.lazy.else.0]                          ; inst 10
  br i1 %9, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  ret i32 %1                                                                       ; inst 12
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 13
_6.if.exit.0:
  %10 = sdiv i32 %2, 2                                                             ; inst 14
  %11 = call i32 @splitList([2000 x i32]* %0, i32 %1, i32 %10)                     ; inst 15
  %12 = call i32 @mergeSort([2000 x i32]* %0, i32 %1, i32 %10)                     ; inst 16
  %13 = sub i32 %2, %10                                                            ; inst 17
  %14 = call i32 @mergeSort([2000 x i32]* %0, i32 %11, i32 %13)                    ; inst 18
  %15 = call i32 @mergeLists([2000 x i32]* %0, i32 %12, i32 %14)                   ; inst 19
  ret i32 %15                                                                      ; inst 20
}

define i32 @splitList([2000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sle i32 %2, 1                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %4 = phi i32 [1, %_3.if.exit.0], [%14, %_8.while.body.0]                         ; inst 6
  %5 = phi i32 [%1, %_3.if.exit.0], [%13, %_8.while.body.0]                        ; inst 7
  %6 = sub i32 %2, 1                                                               ; inst 8
  %7 = icmp slt i32 %4, %6                                                         ; inst 9
  br i1 %7, label %_5.lazy.then.0, label %_6.lazy.else.0                           ; inst 10
_5.lazy.then.0:
  %8 = icmp ne i32 %5, 0                                                           ; inst 11
  br label %_7.lazy.exit.0                                                         ; inst 12
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 13
_7.lazy.exit.0:
  %9 = phi i1 [%8, %_5.lazy.then.0], [0, %_6.lazy.else.0]                          ; inst 14
  br i1 %9, label %_8.while.body.0, label %_9.while.exit.0                         ; inst 15
_8.while.body.0:
  %10 = sext i32 %5 to i64                                                         ; inst 16
  %11 = add i64 %10, 1                                                             ; inst 17
  %12 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %11               ; inst 18
  %13 = load i32, i32* %12                                                         ; inst 19
  %14 = add i32 %4, 1                                                              ; inst 20
  br label %_4.while.cond.0                                                        ; inst 21
_9.while.exit.0:
  %15 = icmp eq i32 %5, 0                                                          ; inst 22
  br i1 %15, label %_10.if.then.1, label %_11.if.else.1                            ; inst 23
_10.if.then.1:
  ret i32 0                                                                        ; inst 24
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 25
_12.if.exit.1:
  %16 = sext i32 %5 to i64                                                         ; inst 26
  %17 = add i64 %16, 1                                                             ; inst 27
  %18 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %17               ; inst 28
  %19 = load i32, i32* %18                                                         ; inst 29
  %20 = sext i32 %5 to i64                                                         ; inst 30
  %21 = add i64 %20, 1                                                             ; inst 31
  %22 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %21               ; inst 32
  store i32 0, i32* %22                                                            ; inst 33
  ret i32 %19                                                                      ; inst 34
}

define i32 @mergeLists([2000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %2                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = icmp eq i32 %2, 0                                                           ; inst 5
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 %1                                                                       ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  %5 = sext i32 %1 to i64                                                          ; inst 9
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %5                 ; inst 10
  %7 = load i32, i32* %6                                                           ; inst 11
  %8 = sext i32 %2 to i64                                                          ; inst 12
  %9 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %8                 ; inst 13
  %10 = load i32, i32* %9                                                          ; inst 14
  %11 = icmp sle i32 %7, %10                                                       ; inst 15
  br i1 %11, label %_7.if.then.2, label %_8.if.else.2                              ; inst 16
_7.if.then.2:
  %12 = sext i32 %1 to i64                                                         ; inst 17
  %13 = add i64 %12, 1                                                             ; inst 18
  %14 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %13               ; inst 19
  %15 = load i32, i32* %14                                                         ; inst 20
  br label %_9.if.exit.2                                                           ; inst 21
_8.if.else.2:
  %16 = sext i32 %2 to i64                                                         ; inst 22
  %17 = add i64 %16, 1                                                             ; inst 23
  %18 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %17               ; inst 24
  %19 = load i32, i32* %18                                                         ; inst 25
  br label %_9.if.exit.2                                                           ; inst 26
_9.if.exit.2:
  %20 = phi i32 [%1, %_7.if.then.2], [%2, %_8.if.else.2]                           ; inst 27
  %21 = phi i32 [%2, %_7.if.then.2], [%19, %_8.if.else.2]                          ; inst 28
  %22 = phi i32 [%1, %_7.if.then.2], [%2, %_8.if.else.2]                           ; inst 29
  %23 = phi i32 [%15, %_7.if.then.2], [%1, %_8.if.else.2]                          ; inst 30
  br label %_10.while.cond.0                                                       ; inst 31
_10.while.cond.0:
  %24 = phi i32 [0, %_9.if.exit.2], [%57, %_20.if.exit.3]                          ; inst 32
  %25 = phi i32 [%21, %_9.if.exit.2], [%54, %_20.if.exit.3]                        ; inst 33
  %26 = phi i32 [%22, %_9.if.exit.2], [%55, %_20.if.exit.3]                        ; inst 34
  %27 = phi i32 [%23, %_9.if.exit.2], [%56, %_20.if.exit.3]                        ; inst 35
  %28 = icmp ne i32 %27, 0                                                         ; inst 36
  br i1 %28, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 37
_11.lazy.then.0:
  %29 = icmp ne i32 %25, 0                                                         ; inst 38
  br label %_13.lazy.exit.0                                                        ; inst 39
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 40
_13.lazy.exit.0:
  %30 = phi i1 [%29, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 41
  br i1 %30, label %_14.lazy.then.1, label %_15.lazy.else.1                        ; inst 42
_14.lazy.then.1:
  %31 = icmp slt i32 %24, 500                                                      ; inst 43
  br label %_16.lazy.exit.1                                                        ; inst 44
_15.lazy.else.1:
  br label %_16.lazy.exit.1                                                        ; inst 45
_16.lazy.exit.1:
  %32 = phi i1 [%31, %_14.lazy.then.1], [0, %_15.lazy.else.1]                      ; inst 46
  br i1 %32, label %_17.while.body.0, label %_21.while.exit.0                      ; inst 47
_17.while.body.0:
  %33 = sext i32 %27 to i64                                                        ; inst 48
  %34 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %33               ; inst 49
  %35 = load i32, i32* %34                                                         ; inst 50
  %36 = sext i32 %25 to i64                                                        ; inst 51
  %37 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %36               ; inst 52
  %38 = load i32, i32* %37                                                         ; inst 53
  %39 = icmp sle i32 %35, %38                                                      ; inst 54
  br i1 %39, label %_18.if.then.3, label %_19.if.else.3                            ; inst 55
_18.if.then.3:
  %40 = sext i32 %26 to i64                                                        ; inst 56
  %41 = add i64 %40, 1                                                             ; inst 57
  %42 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %41               ; inst 58
  store i32 %27, i32* %42                                                          ; inst 59
  %43 = sext i32 %27 to i64                                                        ; inst 60
  %44 = add i64 %43, 1                                                             ; inst 61
  %45 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %44               ; inst 62
  %46 = load i32, i32* %45                                                         ; inst 63
  br label %_20.if.exit.3                                                          ; inst 64
_19.if.else.3:
  %47 = sext i32 %26 to i64                                                        ; inst 65
  %48 = add i64 %47, 1                                                             ; inst 66
  %49 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %48               ; inst 67
  store i32 %25, i32* %49                                                          ; inst 68
  %50 = sext i32 %25 to i64                                                        ; inst 69
  %51 = add i64 %50, 1                                                             ; inst 70
  %52 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %51               ; inst 71
  %53 = load i32, i32* %52                                                         ; inst 72
  br label %_20.if.exit.3                                                          ; inst 73
_20.if.exit.3:
  %54 = phi i32 [%25, %_18.if.then.3], [%53, %_19.if.else.3]                       ; inst 74
  %55 = phi i32 [%27, %_18.if.then.3], [%25, %_19.if.else.3]                       ; inst 75
  %56 = phi i32 [%46, %_18.if.then.3], [%27, %_19.if.else.3]                       ; inst 76
  %57 = add i32 %24, 1                                                             ; inst 77
  br label %_10.while.cond.0                                                       ; inst 78
_21.while.exit.0:
  %58 = icmp ne i32 %27, 0                                                         ; inst 79
  br i1 %58, label %_22.if.then.4, label %_23.if.else.4                            ; inst 80
_22.if.then.4:
  %59 = sext i32 %26 to i64                                                        ; inst 81
  %60 = add i64 %59, 1                                                             ; inst 82
  %61 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %60               ; inst 83
  store i32 %27, i32* %61                                                          ; inst 84
  br label %_24.if.exit.4                                                          ; inst 85
_23.if.else.4:
  %62 = sext i32 %26 to i64                                                        ; inst 86
  %63 = add i64 %62, 1                                                             ; inst 87
  %64 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %63               ; inst 88
  store i32 %25, i32* %64                                                          ; inst 89
  br label %_24.if.exit.4                                                          ; inst 90
_24.if.exit.4:
  ret i32 %20                                                                      ; inst 91
}

define i32 @verifySorted([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%28, %_11.if.exit.0]                             ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%27, %_11.if.exit.0]                            ; inst 3
  %4 = icmp ne i32 %3, 0                                                           ; inst 4
  br i1 %4, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 5
_2.lazy.then.0:
  %5 = sext i32 %3 to i64                                                          ; inst 6
  %6 = add i64 %5, 1                                                               ; inst 7
  %7 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %6                 ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp ne i32 %8, 0                                                           ; inst 10
  br label %_4.lazy.exit.0                                                         ; inst 11
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 12
_4.lazy.exit.0:
  %10 = phi i1 [%9, %_2.lazy.then.0], [0, %_3.lazy.else.0]                         ; inst 13
  br i1 %10, label %_5.lazy.then.1, label %_6.lazy.else.1                          ; inst 14
_5.lazy.then.1:
  %11 = icmp slt i32 %2, 999                                                       ; inst 15
  br label %_7.lazy.exit.1                                                         ; inst 16
_6.lazy.else.1:
  br label %_7.lazy.exit.1                                                         ; inst 17
_7.lazy.exit.1:
  %12 = phi i1 [%11, %_5.lazy.then.1], [0, %_6.lazy.else.1]                        ; inst 18
  br i1 %12, label %_8.while.body.0, label %_13.critical_edge.0                    ; inst 19
_8.while.body.0:
  %13 = sext i32 %3 to i64                                                         ; inst 20
  %14 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %13               ; inst 21
  %15 = load i32, i32* %14                                                         ; inst 22
  %16 = sext i32 %3 to i64                                                         ; inst 23
  %17 = add i64 %16, 1                                                             ; inst 24
  %18 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %17               ; inst 25
  %19 = load i32, i32* %18                                                         ; inst 26
  %20 = sext i32 %19 to i64                                                        ; inst 27
  %21 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %20               ; inst 28
  %22 = load i32, i32* %21                                                         ; inst 29
  %23 = icmp sgt i32 %15, %22                                                      ; inst 30
  br i1 %23, label %_9.if.then.0, label %_10.if.else.0                             ; inst 31
_9.if.then.0:
  br label %_12.while.exit.0                                                       ; inst 32
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 33
_11.if.exit.0:
  %24 = sext i32 %3 to i64                                                         ; inst 34
  %25 = add i64 %24, 1                                                             ; inst 35
  %26 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %25               ; inst 36
  %27 = load i32, i32* %26                                                         ; inst 37
  %28 = add i32 %2, 1                                                              ; inst 38
  br label %_1.while.cond.0                                                        ; inst 39
_12.while.exit.0:
  %29 = phi i32 [1, %_13.critical_edge.0], [0, %_9.if.then.0]                      ; inst 40
  ret i32 %29                                                                      ; inst 41
_13.critical_edge.0:
  br label %_12.while.exit.0                                                       ; inst 42
}

define void @testAdvancedListOperations() {
_0.entry.0:
  %0 = alloca [10 x i32]                                                           ; inst 1
  %1 = alloca [10 x i32]                                                           ; inst 2
  %2 = alloca [10 x i32]                                                           ; inst 3
  %3 = alloca [10 x i32]                                                           ; inst 4
  call void @printlnInt(i32 1610)                                                  ; inst 5
  %4 = alloca [1000 x i32]                                                         ; inst 6
  %5 = getelementptr [1000 x i32], [1000 x i32]* %4, i32 0, i32 0                  ; inst 7
  br label %_1.array.cond.0                                                        ; inst 8
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 9
  %7 = icmp slt i32 %6, 1000                                                       ; inst 10
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 11
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 12
  store i32 0, i32* %8                                                             ; inst 13
  %9 = add i32 %6, 1                                                               ; inst 14
  br label %_1.array.cond.0                                                        ; inst 15
_3.array.exit.0:
  %10 = alloca [10 x i32]                                                          ; inst 16
  %11 = getelementptr [10 x i32], [10 x i32]* %10, i32 0, i32 0                    ; inst 17
  br label %_4.array.cond.1                                                        ; inst 18
_4.array.cond.1:
  %12 = phi i32 [0, %_3.array.exit.0], [%15, %_5.array.body.1]                     ; inst 19
  %13 = icmp slt i32 %12, 10                                                       ; inst 20
  br i1 %13, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 21
_5.array.body.1:
  %14 = getelementptr i32, i32* %11, i32 %12                                       ; inst 22
  store i32 0, i32* %14                                                            ; inst 23
  %15 = add i32 %12, 1                                                             ; inst 24
  br label %_4.array.cond.1                                                        ; inst 25
_6.array.exit.1:
  call void @initializeAdvancedMemory([1000 x i32]* %4)                            ; inst 26
  call void @memcpy([10 x i32]* %0, [10 x i32]* %10, i64 40)                       ; inst 27
  call void @createMultipleLists([1000 x i32]* %4, [10 x i32]* %0, i32 1)          ; inst 28
  call void @memcpy([10 x i32]* %1, [10 x i32]* %10, i64 40)                       ; inst 29
  %16 = call i32 @findListIntersections([1000 x i32]* %4, [10 x i32]* %1)          ; inst 30
  call void @printlnInt(i32 %16)                                                   ; inst 31
  call void @memcpy([10 x i32]* %2, [10 x i32]* %10, i64 40)                       ; inst 32
  %17 = call i32 @performListUnions([1000 x i32]* %4, [10 x i32]* %2)              ; inst 33
  call void @printlnInt(i32 %17)                                                   ; inst 34
  call void @memcpy([10 x i32]* %3, [10 x i32]* %10, i64 40)                       ; inst 35
  %18 = call i32 @complexListManipulations([1000 x i32]* %4, [10 x i32]* %3)       ; inst 36
  call void @printlnInt(i32 %18)                                                   ; inst 37
  ret void                                                                         ; inst 38
}

define void @initializeAdvancedMemory([1000 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 998                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = sext i32 %1 to i64                                                          ; inst 5
  %4 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %3                 ; inst 6
  store i32 0, i32* %4                                                             ; inst 7
  %5 = sext i32 %1 to i64                                                          ; inst 8
  %6 = add i64 %5, 1                                                               ; inst 9
  %7 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %6                 ; inst 10
  %8 = add i32 %1, 2                                                               ; inst 11
  store i32 %8, i32* %7                                                            ; inst 12
  %9 = add i32 %1, 2                                                               ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 998               ; inst 15
  store i32 0, i32* %10                                                            ; inst 16
  %11 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 999               ; inst 17
  store i32 0, i32* %11                                                            ; inst 18
  ret void                                                                         ; inst 19
}

define void @createMultipleLists([1000 x i32]* %0, [10 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%34, %_11.while.exit.1]                          ; inst 2
  %4 = phi i32 [%2, %_0.entry.0], [%9, %_11.while.exit.1]                          ; inst 3
  %5 = icmp slt i32 %3, 10                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %6 = add i32 %3, 1                                                               ; inst 6
  %7 = mul i32 %6, 5                                                               ; inst 7
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %8 = phi i32 [0, %_2.while.body.0], [%33, %_10.while.body.1]                     ; inst 9
  %9 = phi i32 [%4, %_2.while.body.0], [%18, %_10.while.body.1]                    ; inst 10
  %10 = icmp slt i32 %8, %7                                                        ; inst 11
  br i1 %10, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 12
_4.lazy.then.0:
  %11 = icmp ne i32 %9, 0                                                          ; inst 13
  br label %_6.lazy.exit.0                                                         ; inst 14
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 15
_6.lazy.exit.0:
  %12 = phi i1 [%11, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 16
  br i1 %12, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 17
_7.lazy.then.1:
  %13 = icmp slt i32 %9, 998                                                       ; inst 18
  br label %_9.lazy.exit.1                                                         ; inst 19
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 20
_9.lazy.exit.1:
  %14 = phi i1 [%13, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 21
  br i1 %14, label %_10.while.body.1, label %_11.while.exit.1                      ; inst 22
_10.while.body.1:
  %15 = sext i32 %9 to i64                                                         ; inst 23
  %16 = add i64 %15, 1                                                             ; inst 24
  %17 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %16               ; inst 25
  %18 = load i32, i32* %17                                                         ; inst 26
  %19 = mul i32 %3, 100                                                            ; inst 27
  %20 = add i32 %3, 1                                                              ; inst 28
  %21 = mul i32 %8, %20                                                            ; inst 29
  %22 = add i32 %19, %21                                                           ; inst 30
  %23 = sext i32 %9 to i64                                                         ; inst 31
  %24 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %23               ; inst 32
  store i32 %22, i32* %24                                                          ; inst 33
  %25 = sext i32 %9 to i64                                                         ; inst 34
  %26 = add i64 %25, 1                                                             ; inst 35
  %27 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %26               ; inst 36
  %28 = sext i32 %3 to i64                                                         ; inst 37
  %29 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %28                   ; inst 38
  %30 = load i32, i32* %29                                                         ; inst 39
  store i32 %30, i32* %27                                                          ; inst 40
  %31 = sext i32 %3 to i64                                                         ; inst 41
  %32 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %31                   ; inst 42
  store i32 %9, i32* %32                                                           ; inst 43
  %33 = add i32 %8, 1                                                              ; inst 44
  br label %_3.while.cond.1                                                        ; inst 45
_11.while.exit.1:
  %34 = add i32 %3, 1                                                              ; inst 46
  br label %_1.while.cond.0                                                        ; inst 47
_12.while.exit.0:
  ret void                                                                         ; inst 48
}

define i32 @findListIntersections([1000 x i32]* %0, [10 x i32]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%18, %_5.while.exit.1]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%7, %_5.while.exit.1]                            ; inst 3
  %4 = icmp slt i32 %2, 9                                                          ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = add i32 %2, 1                                                               ; inst 6
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %6 = phi i32 [%5, %_2.while.body.0], [%17, %_4.while.body.1]                     ; inst 8
  %7 = phi i32 [%3, %_2.while.body.0], [%16, %_4.while.body.1]                     ; inst 9
  %8 = icmp slt i32 %6, 10                                                         ; inst 10
  br i1 %8, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 11
_4.while.body.1:
  %9 = sext i32 %2 to i64                                                          ; inst 12
  %10 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %9                    ; inst 13
  %11 = load i32, i32* %10                                                         ; inst 14
  %12 = sext i32 %6 to i64                                                         ; inst 15
  %13 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %12                   ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = call i32 @countCommonValues([1000 x i32]* %0, i32 %11, i32 %14)            ; inst 18
  %16 = add i32 %7, %15                                                            ; inst 19
  %17 = add i32 %6, 1                                                              ; inst 20
  br label %_3.while.cond.1                                                        ; inst 21
_5.while.exit.1:
  %18 = add i32 %2, 1                                                              ; inst 22
  br label %_1.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 24
}

define i32 @countCommonValues([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%32, %_14.while.exit.1]                          ; inst 2
  %4 = phi i32 [%1, %_0.entry.0], [%31, %_14.while.exit.1]                         ; inst 3
  %5 = phi i32 [0, %_0.entry.0], [%27, %_14.while.exit.1]                          ; inst 4
  %6 = icmp ne i32 %4, 0                                                           ; inst 5
  br i1 %6, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %7 = icmp slt i32 %3, 100                                                        ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %8 = phi i1 [%7, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 10
  br i1 %8, label %_5.while.body.0, label %_15.while.exit.0                        ; inst 11
_5.while.body.0:
  %9 = sext i32 %4 to i64                                                          ; inst 12
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 13
  %11 = load i32, i32* %10                                                         ; inst 14
  br label %_6.while.cond.1                                                        ; inst 15
_6.while.cond.1:
  %12 = phi i32 [0, %_5.while.body.0], [%26, %_13.if.exit.0]                       ; inst 16
  %13 = phi i32 [%2, %_5.while.body.0], [%25, %_13.if.exit.0]                      ; inst 17
  %14 = icmp ne i32 %13, 0                                                         ; inst 18
  br i1 %14, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 19
_7.lazy.then.1:
  %15 = icmp slt i32 %12, 100                                                      ; inst 20
  br label %_9.lazy.exit.1                                                         ; inst 21
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 22
_9.lazy.exit.1:
  %16 = phi i1 [%15, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 23
  br i1 %16, label %_10.while.body.1, label %_16.critical_edge.0                   ; inst 24
_10.while.body.1:
  %17 = sext i32 %13 to i64                                                        ; inst 25
  %18 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %17               ; inst 26
  %19 = load i32, i32* %18                                                         ; inst 27
  %20 = icmp eq i32 %19, %11                                                       ; inst 28
  br i1 %20, label %_11.if.then.0, label %_12.if.else.0                            ; inst 29
_11.if.then.0:
  %21 = add i32 %5, 1                                                              ; inst 30
  br label %_14.while.exit.1                                                       ; inst 31
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 32
_13.if.exit.0:
  %22 = sext i32 %13 to i64                                                        ; inst 33
  %23 = add i64 %22, 1                                                             ; inst 34
  %24 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %23               ; inst 35
  %25 = load i32, i32* %24                                                         ; inst 36
  %26 = add i32 %12, 1                                                             ; inst 37
  br label %_6.while.cond.1                                                        ; inst 38
_14.while.exit.1:
  %27 = phi i32 [%5, %_16.critical_edge.0], [%21, %_11.if.then.0]                  ; inst 39
  %28 = sext i32 %4 to i64                                                         ; inst 40
  %29 = add i64 %28, 1                                                             ; inst 41
  %30 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %29               ; inst 42
  %31 = load i32, i32* %30                                                         ; inst 43
  %32 = add i32 %3, 1                                                              ; inst 44
  br label %_1.while.cond.0                                                        ; inst 45
_15.while.exit.0:
  ret i32 %5                                                                       ; inst 46
_16.critical_edge.0:
  br label %_14.while.exit.1                                                       ; inst 47
}

define i32 @performListUnions([1000 x i32]* %0, [10 x i32]* %1) {
_0.entry.0:
  %2 = alloca [500 x i32]                                                          ; inst 1
  %3 = getelementptr [500 x i32], [500 x i32]* %2, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 500                                                        ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%14, %_23.while.exit.1]                     ; inst 12
  %9 = phi i32 [0, %_3.array.exit.0], [%43, %_23.while.exit.1]                     ; inst 13
  %10 = icmp slt i32 %9, 10                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_24.while.exit.0                       ; inst 15
_5.while.body.0:
  %11 = sext i32 %9 to i64                                                         ; inst 16
  %12 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %11                   ; inst 17
  %13 = load i32, i32* %12                                                         ; inst 18
  br label %_6.while.cond.1                                                        ; inst 19
_6.while.cond.1:
  %14 = phi i32 [%8, %_5.while.body.0], [%37, %_22.if.exit.1]                      ; inst 20
  %15 = phi i32 [%13, %_5.while.body.0], [%41, %_22.if.exit.1]                     ; inst 21
  %16 = phi i32 [0, %_5.while.body.0], [%42, %_22.if.exit.1]                       ; inst 22
  %17 = icmp ne i32 %15, 0                                                         ; inst 23
  br i1 %17, label %_7.lazy.then.0, label %_8.lazy.else.0                          ; inst 24
_7.lazy.then.0:
  %18 = icmp slt i32 %16, 50                                                       ; inst 25
  br label %_9.lazy.exit.0                                                         ; inst 26
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 27
_9.lazy.exit.0:
  %19 = phi i1 [%18, %_7.lazy.then.0], [0, %_8.lazy.else.0]                        ; inst 28
  br i1 %19, label %_10.while.body.1, label %_23.while.exit.1                      ; inst 29
_10.while.body.1:
  %20 = sext i32 %15 to i64                                                        ; inst 30
  %21 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %20               ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  br label %_11.while.cond.2                                                       ; inst 33
_11.while.cond.2:
  %23 = phi i32 [0, %_10.while.body.1], [%29, %_15.if.exit.0]                      ; inst 34
  %24 = icmp slt i32 %23, %14                                                      ; inst 35
  br i1 %24, label %_12.while.body.2, label %_25.critical_edge.0                   ; inst 36
_12.while.body.2:
  %25 = sext i32 %23 to i64                                                        ; inst 37
  %26 = getelementptr [500 x i32], [500 x i32]* %2, i32 0, i64 %25                 ; inst 38
  %27 = load i32, i32* %26                                                         ; inst 39
  %28 = icmp eq i32 %27, %22                                                       ; inst 40
  br i1 %28, label %_13.if.then.0, label %_14.if.else.0                            ; inst 41
_13.if.then.0:
  br label %_16.while.exit.2                                                       ; inst 42
_14.if.else.0:
  br label %_15.if.exit.0                                                          ; inst 43
_15.if.exit.0:
  %29 = add i32 %23, 1                                                             ; inst 44
  br label %_11.while.cond.2                                                       ; inst 45
_16.while.exit.2:
  %30 = phi i32 [0, %_25.critical_edge.0], [1, %_13.if.then.0]                     ; inst 46
  %31 = icmp eq i32 %30, 0                                                         ; inst 47
  br i1 %31, label %_17.lazy.then.1, label %_18.lazy.else.1                        ; inst 48
_17.lazy.then.1:
  %32 = icmp slt i32 %14, 500                                                      ; inst 49
  br label %_19.lazy.exit.1                                                        ; inst 50
_18.lazy.else.1:
  br label %_19.lazy.exit.1                                                        ; inst 51
_19.lazy.exit.1:
  %33 = phi i1 [%32, %_17.lazy.then.1], [0, %_18.lazy.else.1]                      ; inst 52
  br i1 %33, label %_20.if.then.1, label %_21.if.else.1                            ; inst 53
_20.if.then.1:
  %34 = sext i32 %14 to i64                                                        ; inst 54
  %35 = getelementptr [500 x i32], [500 x i32]* %2, i32 0, i64 %34                 ; inst 55
  store i32 %22, i32* %35                                                          ; inst 56
  %36 = add i32 %14, 1                                                             ; inst 57
  br label %_22.if.exit.1                                                          ; inst 58
_21.if.else.1:
  br label %_22.if.exit.1                                                          ; inst 59
_22.if.exit.1:
  %37 = phi i32 [%36, %_20.if.then.1], [%14, %_21.if.else.1]                       ; inst 60
  %38 = sext i32 %15 to i64                                                        ; inst 61
  %39 = add i64 %38, 1                                                             ; inst 62
  %40 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %39               ; inst 63
  %41 = load i32, i32* %40                                                         ; inst 64
  %42 = add i32 %16, 1                                                             ; inst 65
  br label %_6.while.cond.1                                                        ; inst 66
_23.while.exit.1:
  %43 = add i32 %9, 1                                                              ; inst 67
  br label %_4.while.cond.0                                                        ; inst 68
_24.while.exit.0:
  ret i32 %8                                                                       ; inst 69
_25.critical_edge.0:
  br label %_16.while.exit.2                                                       ; inst 70
}

define i32 @complexListManipulations([1000 x i32]* %0, [10 x i32]* %1) {
_0.entry.0:
  %2 = alloca [10 x i32]                                                           ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 3
  %4 = icmp slt i32 %3, 10                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = add i32 %3, 1                                                               ; inst 6
  %6 = sext i32 %3 to i64                                                          ; inst 7
  %7 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %6                     ; inst 8
  %8 = sext i32 %3 to i64                                                          ; inst 9
  %9 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %8                     ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  %11 = call i32 @rotateList([1000 x i32]* %0, i32 %10, i32 %5)                    ; inst 12
  store i32 %11, i32* %7                                                           ; inst 13
  %12 = add i32 %3, 1                                                              ; inst 14
  br label %_1.while.cond.0                                                        ; inst 15
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 16
_4.while.cond.1:
  %13 = phi i32 [10, %_3.while.exit.0], [%20, %_5.while.body.1]                    ; inst 17
  %14 = phi i32 [0, %_3.while.exit.0], [%21, %_5.while.body.1]                     ; inst 18
  %15 = icmp slt i32 %14, 10                                                       ; inst 19
  br i1 %15, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 20
_5.while.body.1:
  %16 = sext i32 %14 to i64                                                        ; inst 21
  %17 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %16                   ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = call i32 @removeDuplicates([1000 x i32]* %0, i32 %18)                      ; inst 24
  %20 = add i32 %13, %19                                                           ; inst 25
  %21 = add i32 %14, 1                                                             ; inst 26
  br label %_4.while.cond.1                                                        ; inst 27
_6.while.exit.1:
  call void @memcpy([10 x i32]* %2, [10 x i32]* %1, i64 40)                        ; inst 28
  %22 = call i32 @interleaveLists([1000 x i32]* %0, [10 x i32]* %2)                ; inst 29
  %23 = add i32 %13, %22                                                           ; inst 30
  ret i32 %23                                                                      ; inst 31
}

define i32 @rotateList([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %4 = icmp sle i32 %2, 0                                                          ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %5 = phi i1 [1, %_1.lazy.then.0], [%4, %_2.lazy.else.0]                          ; inst 6
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i32 %1                                                                       ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  br label %_7.while.cond.0                                                        ; inst 10
_7.while.cond.0:
  %6 = phi i32 [1, %_6.if.exit.0], [%19, %_11.while.body.0]                        ; inst 11
  %7 = phi i32 [%1, %_6.if.exit.0], [%18, %_11.while.body.0]                       ; inst 12
  %8 = sext i32 %7 to i64                                                          ; inst 13
  %9 = add i64 %8, 1                                                               ; inst 14
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 15
  %11 = load i32, i32* %10                                                         ; inst 16
  %12 = icmp ne i32 %11, 0                                                         ; inst 17
  br i1 %12, label %_8.lazy.then.1, label %_9.lazy.else.1                          ; inst 18
_8.lazy.then.1:
  %13 = icmp slt i32 %6, 100                                                       ; inst 19
  br label %_10.lazy.exit.1                                                        ; inst 20
_9.lazy.else.1:
  br label %_10.lazy.exit.1                                                        ; inst 21
_10.lazy.exit.1:
  %14 = phi i1 [%13, %_8.lazy.then.1], [0, %_9.lazy.else.1]                        ; inst 22
  br i1 %14, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 23
_11.while.body.0:
  %15 = sext i32 %7 to i64                                                         ; inst 24
  %16 = add i64 %15, 1                                                             ; inst 25
  %17 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %16               ; inst 26
  %18 = load i32, i32* %17                                                         ; inst 27
  %19 = add i32 %6, 1                                                              ; inst 28
  br label %_7.while.cond.0                                                        ; inst 29
_12.while.exit.0:
  %20 = srem i32 %2, %6                                                            ; inst 30
  %21 = icmp eq i32 %20, 0                                                         ; inst 31
  br i1 %21, label %_13.if.then.1, label %_14.if.else.1                            ; inst 32
_13.if.then.1:
  ret i32 %1                                                                       ; inst 33
_14.if.else.1:
  br label %_15.if.exit.1                                                          ; inst 34
_15.if.exit.1:
  br label %_16.while.cond.1                                                       ; inst 35
_16.while.cond.1:
  %22 = phi i32 [0, %_15.if.exit.1], [%37, %_20.while.body.1]                      ; inst 36
  %23 = phi i32 [%1, %_15.if.exit.1], [%36, %_20.while.body.1]                     ; inst 37
  %24 = sub i32 %6, %20                                                            ; inst 38
  %25 = sub i32 %24, 1                                                             ; inst 39
  %26 = icmp slt i32 %22, %25                                                      ; inst 40
  br i1 %26, label %_17.lazy.then.2, label %_18.lazy.else.2                        ; inst 41
_17.lazy.then.2:
  %27 = sext i32 %23 to i64                                                        ; inst 42
  %28 = add i64 %27, 1                                                             ; inst 43
  %29 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %28               ; inst 44
  %30 = load i32, i32* %29                                                         ; inst 45
  %31 = icmp ne i32 %30, 0                                                         ; inst 46
  br label %_19.lazy.exit.2                                                        ; inst 47
_18.lazy.else.2:
  br label %_19.lazy.exit.2                                                        ; inst 48
_19.lazy.exit.2:
  %32 = phi i1 [%31, %_17.lazy.then.2], [0, %_18.lazy.else.2]                      ; inst 49
  br i1 %32, label %_20.while.body.1, label %_21.while.exit.1                      ; inst 50
_20.while.body.1:
  %33 = sext i32 %23 to i64                                                        ; inst 51
  %34 = add i64 %33, 1                                                             ; inst 52
  %35 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %34               ; inst 53
  %36 = load i32, i32* %35                                                         ; inst 54
  %37 = add i32 %22, 1                                                             ; inst 55
  br label %_16.while.cond.1                                                       ; inst 56
_21.while.exit.1:
  %38 = sext i32 %23 to i64                                                        ; inst 57
  %39 = add i64 %38, 1                                                             ; inst 58
  %40 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %39               ; inst 59
  %41 = load i32, i32* %40                                                         ; inst 60
  %42 = sext i32 %23 to i64                                                        ; inst 61
  %43 = add i64 %42, 1                                                             ; inst 62
  %44 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %43               ; inst 63
  store i32 0, i32* %44                                                            ; inst 64
  %45 = sext i32 %7 to i64                                                         ; inst 65
  %46 = add i64 %45, 1                                                             ; inst 66
  %47 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %46               ; inst 67
  store i32 %1, i32* %47                                                           ; inst 68
  ret i32 %41                                                                      ; inst 69
}

define i32 @removeDuplicates([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%39, %_11.if.exit.0]                             ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%37, %_11.if.exit.0]                            ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%38, %_11.if.exit.0]                             ; inst 4
  %5 = icmp ne i32 %3, 0                                                           ; inst 5
  br i1 %5, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %6 = sext i32 %3 to i64                                                          ; inst 7
  %7 = add i64 %6, 1                                                               ; inst 8
  %8 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %7                 ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = icmp ne i32 %9, 0                                                          ; inst 11
  br label %_4.lazy.exit.0                                                         ; inst 12
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 13
_4.lazy.exit.0:
  %11 = phi i1 [%10, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 14
  br i1 %11, label %_5.lazy.then.1, label %_6.lazy.else.1                          ; inst 15
_5.lazy.then.1:
  %12 = icmp slt i32 %2, 100                                                       ; inst 16
  br label %_7.lazy.exit.1                                                         ; inst 17
_6.lazy.else.1:
  br label %_7.lazy.exit.1                                                         ; inst 18
_7.lazy.exit.1:
  %13 = phi i1 [%12, %_5.lazy.then.1], [0, %_6.lazy.else.1]                        ; inst 19
  br i1 %13, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 20
_8.while.body.0:
  %14 = sext i32 %3 to i64                                                         ; inst 21
  %15 = add i64 %14, 1                                                             ; inst 22
  %16 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %15               ; inst 23
  %17 = load i32, i32* %16                                                         ; inst 24
  %18 = sext i32 %3 to i64                                                         ; inst 25
  %19 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %18               ; inst 26
  %20 = load i32, i32* %19                                                         ; inst 27
  %21 = sext i32 %17 to i64                                                        ; inst 28
  %22 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %21               ; inst 29
  %23 = load i32, i32* %22                                                         ; inst 30
  %24 = icmp eq i32 %20, %23                                                       ; inst 31
  br i1 %24, label %_9.if.then.0, label %_10.if.else.0                             ; inst 32
_9.if.then.0:
  %25 = sext i32 %3 to i64                                                         ; inst 33
  %26 = add i64 %25, 1                                                             ; inst 34
  %27 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %26               ; inst 35
  %28 = sext i32 %17 to i64                                                        ; inst 36
  %29 = add i64 %28, 1                                                             ; inst 37
  %30 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %29               ; inst 38
  %31 = load i32, i32* %30                                                         ; inst 39
  store i32 %31, i32* %27                                                          ; inst 40
  %32 = add i32 %4, 1                                                              ; inst 41
  br label %_11.if.exit.0                                                          ; inst 42
_10.if.else.0:
  %33 = sext i32 %3 to i64                                                         ; inst 43
  %34 = add i64 %33, 1                                                             ; inst 44
  %35 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %34               ; inst 45
  %36 = load i32, i32* %35                                                         ; inst 46
  br label %_11.if.exit.0                                                          ; inst 47
_11.if.exit.0:
  %37 = phi i32 [%3, %_9.if.then.0], [%36, %_10.if.else.0]                         ; inst 48
  %38 = phi i32 [%32, %_9.if.then.0], [%4, %_10.if.else.0]                         ; inst 49
  %39 = add i32 %2, 1                                                              ; inst 50
  br label %_1.while.cond.0                                                        ; inst 51
_12.while.exit.0:
  ret i32 %4                                                                       ; inst 52
}

define i32 @interleaveLists([1000 x i32]* %0, [10 x i32]* %1) {
_0.entry.0:
  %2 = alloca [10 x i32]                                                           ; inst 1
  %3 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 10                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%21, %_8.if.exit.0]                         ; inst 12
  %9 = phi i32 [0, %_3.array.exit.0], [%22, %_8.if.exit.0]                         ; inst 13
  %10 = icmp slt i32 %9, 10                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 15
_5.while.body.0:
  %11 = sext i32 %9 to i64                                                         ; inst 16
  %12 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %11                   ; inst 17
  %13 = load i32, i32* %12                                                         ; inst 18
  %14 = icmp ne i32 %13, 0                                                         ; inst 19
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %15 = sext i32 %8 to i64                                                         ; inst 21
  %16 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %15                   ; inst 22
  %17 = sext i32 %9 to i64                                                         ; inst 23
  %18 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %17                   ; inst 24
  %19 = load i32, i32* %18                                                         ; inst 25
  store i32 %19, i32* %16                                                          ; inst 26
  %20 = add i32 %8, 1                                                              ; inst 27
  br label %_8.if.exit.0                                                           ; inst 28
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 29
_8.if.exit.0:
  %21 = phi i32 [%20, %_6.if.then.0], [%8, %_7.if.else.0]                          ; inst 30
  %22 = add i32 %9, 1                                                              ; inst 31
  br label %_4.while.cond.0                                                        ; inst 32
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 33
_10.while.cond.1:
  %23 = phi i32 [%8, %_9.while.exit.0], [%30, %_23.while.exit.2]                   ; inst 34
  %24 = phi i32 [0, %_9.while.exit.0], [%28, %_23.while.exit.2]                    ; inst 35
  %25 = icmp sgt i32 %23, 0                                                        ; inst 36
  br i1 %25, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 37
_11.lazy.then.0:
  %26 = icmp slt i32 %24, 200                                                      ; inst 38
  br label %_13.lazy.exit.0                                                        ; inst 39
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 40
_13.lazy.exit.0:
  %27 = phi i1 [%26, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 41
  br i1 %27, label %_14.while.body.1, label %_24.while.exit.1                      ; inst 42
_14.while.body.1:
  br label %_15.while.cond.2                                                       ; inst 43
_15.while.cond.2:
  %28 = phi i32 [%24, %_14.while.body.1], [%57, %_22.if.exit.1]                    ; inst 44
  %29 = phi i32 [0, %_14.while.body.1], [%59, %_22.if.exit.1]                      ; inst 45
  %30 = phi i32 [0, %_14.while.body.1], [%58, %_22.if.exit.1]                      ; inst 46
  %31 = icmp slt i32 %29, %23                                                      ; inst 47
  br i1 %31, label %_16.while.body.2, label %_23.while.exit.2                      ; inst 48
_16.while.body.2:
  %32 = sext i32 %29 to i64                                                        ; inst 49
  %33 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %32                   ; inst 50
  %34 = load i32, i32* %33                                                         ; inst 51
  %35 = icmp ne i32 %34, 0                                                         ; inst 52
  br i1 %35, label %_17.if.then.1, label %_21.if.else.1                            ; inst 53
_17.if.then.1:
  %36 = add i32 %28, 1                                                             ; inst 54
  %37 = sext i32 %29 to i64                                                        ; inst 55
  %38 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %37                   ; inst 56
  %39 = sext i32 %29 to i64                                                        ; inst 57
  %40 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %39                   ; inst 58
  %41 = load i32, i32* %40                                                         ; inst 59
  %42 = add i32 %41, 1                                                             ; inst 60
  %43 = sext i32 %42 to i64                                                        ; inst 61
  %44 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %43               ; inst 62
  %45 = load i32, i32* %44                                                         ; inst 63
  store i32 %45, i32* %38                                                          ; inst 64
  %46 = sext i32 %29 to i64                                                        ; inst 65
  %47 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %46                   ; inst 66
  %48 = load i32, i32* %47                                                         ; inst 67
  %49 = icmp ne i32 %48, 0                                                         ; inst 68
  br i1 %49, label %_18.if.then.2, label %_19.if.else.2                            ; inst 69
_18.if.then.2:
  %50 = sext i32 %30 to i64                                                        ; inst 70
  %51 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %50                   ; inst 71
  %52 = sext i32 %29 to i64                                                        ; inst 72
  %53 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %52                   ; inst 73
  %54 = load i32, i32* %53                                                         ; inst 74
  store i32 %54, i32* %51                                                          ; inst 75
  %55 = add i32 %30, 1                                                             ; inst 76
  br label %_20.if.exit.2                                                          ; inst 77
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 78
_20.if.exit.2:
  %56 = phi i32 [%55, %_18.if.then.2], [%30, %_19.if.else.2]                       ; inst 79
  br label %_22.if.exit.1                                                          ; inst 80
_21.if.else.1:
  br label %_22.if.exit.1                                                          ; inst 81
_22.if.exit.1:
  %57 = phi i32 [%36, %_20.if.exit.2], [%28, %_21.if.else.1]                       ; inst 82
  %58 = phi i32 [%56, %_20.if.exit.2], [%30, %_21.if.else.1]                       ; inst 83
  %59 = add i32 %29, 1                                                             ; inst 84
  br label %_15.while.cond.2                                                       ; inst 85
_23.while.exit.2:
  br label %_10.while.cond.1                                                       ; inst 86
_24.while.exit.1:
  ret i32 %24                                                                      ; inst 87
}

define void @performListPerformanceTest() {
_0.entry.0:
  call void @printlnInt(i32 1620)                                                  ; inst 1
  %0 = alloca [1800 x i32]                                                         ; inst 2
  %1 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 1800                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%12, %_8.while.body.0]                      ; inst 13
  %7 = phi i32 [1, %_3.array.exit.0], [%20, %_8.while.body.0]                      ; inst 14
  %8 = icmp sle i32 %7, 800                                                        ; inst 15
  br i1 %8, label %_5.lazy.then.0, label %_6.lazy.else.0                           ; inst 16
_5.lazy.then.0:
  %9 = mul i32 %7, 2                                                               ; inst 17
  %10 = icmp slt i32 %9, 1800                                                      ; inst 18
  br label %_7.lazy.exit.0                                                         ; inst 19
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 20
_7.lazy.exit.0:
  %11 = phi i1 [%10, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 21
  br i1 %11, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 22
_8.while.body.0:
  %12 = mul i32 %7, 2                                                              ; inst 23
  %13 = sext i32 %12 to i64                                                        ; inst 24
  %14 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %13               ; inst 25
  %15 = mul i32 %7, %7                                                             ; inst 26
  %16 = srem i32 %15, 10000                                                        ; inst 27
  store i32 %16, i32* %14                                                          ; inst 28
  %17 = sext i32 %12 to i64                                                        ; inst 29
  %18 = add i64 %17, 1                                                             ; inst 30
  %19 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %18               ; inst 31
  store i32 %6, i32* %19                                                           ; inst 32
  %20 = add i32 %7, 1                                                              ; inst 33
  br label %_4.while.cond.0                                                        ; inst 34
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 35
_10.while.cond.1:
  %21 = phi i32 [0, %_9.while.exit.0], [%26, %_11.while.body.1]                    ; inst 36
  %22 = phi i32 [0, %_9.while.exit.0], [%25, %_11.while.body.1]                    ; inst 37
  %23 = icmp slt i32 %21, 5                                                        ; inst 38
  br i1 %23, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 39
_11.while.body.1:
  %24 = call i32 @stressTraversal([1800 x i32]* %0, i32 %6, i32 %21)               ; inst 40
  %25 = add i32 %22, %24                                                           ; inst 41
  %26 = add i32 %21, 1                                                             ; inst 42
  br label %_10.while.cond.1                                                       ; inst 43
_12.while.exit.1:
  call void @printlnInt(i32 %22)                                                   ; inst 44
  %27 = call i32 @stressModifications([1800 x i32]* %0, i32 %6)                    ; inst 45
  call void @printlnInt(i32 %27)                                                   ; inst 46
  %28 = call i32 @stressPatternSearch([1800 x i32]* %0, i32 %6)                    ; inst 47
  call void @printlnInt(i32 %28)                                                   ; inst 48
  ret void                                                                         ; inst 49
}

define i32 @stressTraversal([1800 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = add i32 %2, 1                                                               ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.0]                              ; inst 3
  %5 = phi i32 [%1, %_0.entry.0], [%20, %_8.if.exit.0]                             ; inst 4
  %6 = phi i32 [0, %_0.entry.0], [%16, %_8.if.exit.0]                              ; inst 5
  %7 = icmp ne i32 %5, 0                                                           ; inst 6
  br i1 %7, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 7
_2.lazy.then.0:
  %8 = icmp slt i32 %4, 800                                                        ; inst 8
  br label %_4.lazy.exit.0                                                         ; inst 9
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 10
_4.lazy.exit.0:
  %9 = phi i1 [%8, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 11
  br i1 %9, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 12
_5.while.body.0:
  %10 = srem i32 %4, %3                                                            ; inst 13
  %11 = icmp eq i32 %10, 0                                                         ; inst 14
  br i1 %11, label %_6.if.then.0, label %_7.if.else.0                              ; inst 15
_6.if.then.0:
  %12 = sext i32 %5 to i64                                                         ; inst 16
  %13 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %12               ; inst 17
  %14 = load i32, i32* %13                                                         ; inst 18
  %15 = add i32 %6, %14                                                            ; inst 19
  br label %_8.if.exit.0                                                           ; inst 20
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 21
_8.if.exit.0:
  %16 = phi i32 [%15, %_6.if.then.0], [%6, %_7.if.else.0]                          ; inst 22
  %17 = sext i32 %5 to i64                                                         ; inst 23
  %18 = add i64 %17, 1                                                             ; inst 24
  %19 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %18               ; inst 25
  %20 = load i32, i32* %19                                                         ; inst 26
  %21 = add i32 %4, 1                                                              ; inst 27
  br label %_1.while.cond.0                                                        ; inst 28
_9.while.exit.0:
  %22 = srem i32 %6, 100000                                                        ; inst 29
  ret i32 %22                                                                      ; inst 30
}

define i32 @stressModifications([1800 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%24, %_8.if.exit.0]                              ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%23, %_8.if.exit.0]                             ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%19, %_8.if.exit.0]                              ; inst 4
  %5 = icmp ne i32 %3, 0                                                           ; inst 5
  br i1 %5, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %6 = icmp slt i32 %2, 400                                                        ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %7 = phi i1 [%6, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 10
  br i1 %7, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 11
_5.while.body.0:
  %8 = sext i32 %3 to i64                                                          ; inst 12
  %9 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %8                 ; inst 13
  %10 = load i32, i32* %9                                                          ; inst 14
  %11 = mul i32 %10, 3                                                             ; inst 15
  %12 = mul i32 %2, 7                                                              ; inst 16
  %13 = add i32 %11, %12                                                           ; inst 17
  %14 = srem i32 %13, 1000                                                         ; inst 18
  %15 = sext i32 %3 to i64                                                         ; inst 19
  %16 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %15               ; inst 20
  store i32 %14, i32* %16                                                          ; inst 21
  %17 = icmp sgt i32 %14, %10                                                      ; inst 22
  br i1 %17, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  %18 = add i32 %4, 1                                                              ; inst 24
  br label %_8.if.exit.0                                                           ; inst 25
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 26
_8.if.exit.0:
  %19 = phi i32 [%18, %_6.if.then.0], [%4, %_7.if.else.0]                          ; inst 27
  %20 = sext i32 %3 to i64                                                         ; inst 28
  %21 = add i64 %20, 1                                                             ; inst 29
  %22 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %21               ; inst 30
  %23 = load i32, i32* %22                                                         ; inst 31
  %24 = add i32 %2, 1                                                              ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_9.while.exit.0:
  ret i32 %4                                                                       ; inst 34
}

define i32 @stressPatternSearch([1800 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%29, %_17.if.exit.2]                             ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%28, %_17.if.exit.2]                            ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%24, %_17.if.exit.2]                             ; inst 4
  %5 = icmp ne i32 %3, 0                                                           ; inst 5
  br i1 %5, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %6 = icmp slt i32 %2, 600                                                        ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %7 = phi i1 [%6, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 10
  br i1 %7, label %_5.while.body.0, label %_18.while.exit.0                        ; inst 11
_5.while.body.0:
  %8 = sext i32 %3 to i64                                                          ; inst 12
  %9 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %8                 ; inst 13
  %10 = load i32, i32* %9                                                          ; inst 14
  %11 = srem i32 %10, 7                                                            ; inst 15
  %12 = icmp eq i32 %11, 3                                                         ; inst 16
  br i1 %12, label %_6.if.then.0, label %_7.if.else.0                              ; inst 17
_6.if.then.0:
  %13 = add i32 %4, 1                                                              ; inst 18
  br label %_8.if.exit.0                                                           ; inst 19
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 20
_8.if.exit.0:
  %14 = phi i32 [%13, %_6.if.then.0], [%4, %_7.if.else.0]                          ; inst 21
  %15 = icmp sgt i32 %10, 100                                                      ; inst 22
  br i1 %15, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 23
_9.lazy.then.1:
  %16 = icmp slt i32 %10, 500                                                      ; inst 24
  br label %_11.lazy.exit.1                                                        ; inst 25
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 26
_11.lazy.exit.1:
  %17 = phi i1 [%16, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 27
  br i1 %17, label %_12.if.then.1, label %_13.if.else.1                            ; inst 28
_12.if.then.1:
  %18 = add i32 %14, 2                                                             ; inst 29
  br label %_14.if.exit.1                                                          ; inst 30
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 31
_14.if.exit.1:
  %19 = phi i32 [%18, %_12.if.then.1], [%14, %_13.if.else.1]                       ; inst 32
  %20 = srem i32 %2, 10                                                            ; inst 33
  %21 = srem i32 %10, 10                                                           ; inst 34
  %22 = icmp eq i32 %20, %21                                                       ; inst 35
  br i1 %22, label %_15.if.then.2, label %_16.if.else.2                            ; inst 36
_15.if.then.2:
  %23 = add i32 %19, 3                                                             ; inst 37
  br label %_17.if.exit.2                                                          ; inst 38
_16.if.else.2:
  br label %_17.if.exit.2                                                          ; inst 39
_17.if.exit.2:
  %24 = phi i32 [%23, %_15.if.then.2], [%19, %_16.if.else.2]                       ; inst 40
  %25 = sext i32 %3 to i64                                                         ; inst 41
  %26 = add i64 %25, 1                                                             ; inst 42
  %27 = getelementptr [1800 x i32], [1800 x i32]* %0, i32 0, i64 %26               ; inst 43
  %28 = load i32, i32* %27                                                         ; inst 44
  %29 = add i32 %2, 1                                                              ; inst 45
  br label %_1.while.cond.0                                                        ; inst 46
_18.while.exit.0:
  ret i32 %4                                                                       ; inst 47
}

define void @testEdgeCases() {
_0.entry.0:
  call void @printlnInt(i32 1630)                                                  ; inst 1
  call void @testEmptyListOperations()                                             ; inst 2
  call void @testSingleNodeOperations()                                            ; inst 3
  call void @testMemoryBoundaries()                                                ; inst 4
  call void @testCircularListDetection()                                           ; inst 5
  call void @printlnInt(i32 1639)                                                  ; inst 6
  ret void                                                                         ; inst 7
}

define void @testEmptyListOperations() {
_0.entry.0:
  %0 = alloca [2000 x i32]                                                         ; inst 1
  %1 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 2000                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = call i32 @calculateListSum([2000 x i32]* %0, i32 0)                         ; inst 11
  call void @printlnInt(i32 %6)                                                    ; inst 12
  %7 = call i32 @reverseList([2000 x i32]* %0, i32 0)                              ; inst 13
  call void @printlnInt(i32 %7)                                                    ; inst 14
  %8 = call i32 @complexListSearch([2000 x i32]* %0, i32 0)                        ; inst 15
  call void @printlnInt(i32 %8)                                                    ; inst 16
  ret void                                                                         ; inst 17
}

define void @testSingleNodeOperations() {
_0.entry.0:
  %0 = alloca [2000 x i32]                                                         ; inst 1
  %1 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 2000                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 1                  ; inst 11
  store i32 42, i32* %6                                                            ; inst 12
  %7 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 2                  ; inst 13
  store i32 0, i32* %7                                                             ; inst 14
  %8 = call i32 @calculateListSum([2000 x i32]* %0, i32 1)                         ; inst 15
  call void @printlnInt(i32 %8)                                                    ; inst 16
  %9 = call i32 @reverseList([2000 x i32]* %0, i32 1)                              ; inst 17
  call void @printlnInt(i32 %9)                                                    ; inst 18
  %10 = call i32 @verifySorted([2000 x i32]* %0, i32 1)                            ; inst 19
  call void @printlnInt(i32 %10)                                                   ; inst 20
  ret void                                                                         ; inst 21
}

define void @testMemoryBoundaries() {
_0.entry.0:
  %0 = alloca [2000 x i32]                                                         ; inst 1
  %1 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 2000                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 1                  ; inst 11
  store i32 100, i32* %6                                                           ; inst 12
  %7 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 2                  ; inst 13
  store i32 3, i32* %7                                                             ; inst 14
  %8 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 3                  ; inst 15
  store i32 200, i32* %8                                                           ; inst 16
  %9 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 4                  ; inst 17
  store i32 5, i32* %9                                                             ; inst 18
  %10 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 5                 ; inst 19
  store i32 300, i32* %10                                                          ; inst 20
  %11 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 6                 ; inst 21
  store i32 7, i32* %11                                                            ; inst 22
  %12 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 7                 ; inst 23
  store i32 400, i32* %12                                                          ; inst 24
  %13 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 8                 ; inst 25
  store i32 0, i32* %13                                                            ; inst 26
  %14 = call i32 @calculateListSum([2000 x i32]* %0, i32 1)                        ; inst 27
  call void @printlnInt(i32 %14)                                                   ; inst 28
  %15 = call i32 @allocateNode([2000 x i32]* %0, i32 9)                            ; inst 29
  call void @printlnInt(i32 %15)                                                   ; inst 30
  ret void                                                                         ; inst 31
}

define void @testCircularListDetection() {
_0.entry.0:
  %0 = alloca [20 x i32]                                                           ; inst 1
  %1 = alloca [20 x i32]                                                           ; inst 2
  %2 = alloca [20 x i32]                                                           ; inst 3
  %3 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i32 0                      ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 20                                                         ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 1                      ; inst 13
  store i32 111, i32* %8                                                           ; inst 14
  %9 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 2                      ; inst 15
  store i32 3, i32* %9                                                             ; inst 16
  %10 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 3                     ; inst 17
  store i32 222, i32* %10                                                          ; inst 18
  %11 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 4                     ; inst 19
  store i32 5, i32* %11                                                            ; inst 20
  %12 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 5                     ; inst 21
  store i32 333, i32* %12                                                          ; inst 22
  %13 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 6                     ; inst 23
  store i32 1, i32* %13                                                            ; inst 24
  call void @memcpy([20 x i32]* %0, [20 x i32]* %2, i64 80)                        ; inst 25
  %14 = call i32 @safeTraverseWithLimit([20 x i32]* %0, i32 1, i32 10)             ; inst 26
  call void @printlnInt(i32 %14)                                                   ; inst 27
  call void @memcpy([20 x i32]* %1, [20 x i32]* %2, i64 80)                        ; inst 28
  %15 = call i32 @detectCycle([20 x i32]* %1, i32 1)                               ; inst 29
  call void @printlnInt(i32 %15)                                                   ; inst 30
  ret void                                                                         ; inst 31
}

define i32 @safeTraverseWithLimit([20 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%17, %_5.while.body.0]                           ; inst 2
  %4 = phi i32 [%1, %_0.entry.0], [%16, %_5.while.body.0]                          ; inst 3
  %5 = phi i32 [0, %_0.entry.0], [%12, %_5.while.body.0]                           ; inst 4
  %6 = icmp ne i32 %4, 0                                                           ; inst 5
  br i1 %6, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %7 = icmp slt i32 %3, %2                                                         ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %8 = phi i1 [%7, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 10
  br i1 %8, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 11
_5.while.body.0:
  %9 = sext i32 %4 to i64                                                          ; inst 12
  %10 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %9                    ; inst 13
  %11 = load i32, i32* %10                                                         ; inst 14
  %12 = add i32 %5, %11                                                            ; inst 15
  %13 = sext i32 %4 to i64                                                         ; inst 16
  %14 = add i64 %13, 1                                                             ; inst 17
  %15 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %14                   ; inst 18
  %16 = load i32, i32* %15                                                         ; inst 19
  %17 = add i32 %3, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  ret i32 %5                                                                       ; inst 22
}

define i32 @detectCycle([20 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %3 = phi i32 [0, %_3.if.exit.0], [%31, %_26.if.exit.5]                           ; inst 6
  %4 = phi i32 [%1, %_3.if.exit.0], [%24, %_26.if.exit.5]                          ; inst 7
  %5 = phi i32 [%1, %_3.if.exit.0], [%12, %_26.if.exit.5]                          ; inst 8
  %6 = icmp slt i32 %3, 15                                                         ; inst 9
  br i1 %6, label %_5.while.body.0, label %_27.while.exit.0                        ; inst 10
_5.while.body.0:
  %7 = icmp ne i32 %5, 0                                                           ; inst 11
  br i1 %7, label %_6.if.then.1, label %_7.if.else.1                               ; inst 12
_6.if.then.1:
  %8 = sext i32 %5 to i64                                                          ; inst 13
  %9 = add i64 %8, 1                                                               ; inst 14
  %10 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %9                    ; inst 15
  %11 = load i32, i32* %10                                                         ; inst 16
  br label %_8.if.exit.1                                                           ; inst 17
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 18
_8.if.exit.1:
  %12 = phi i32 [%11, %_6.if.then.1], [%5, %_7.if.else.1]                          ; inst 19
  %13 = icmp ne i32 %4, 0                                                          ; inst 20
  br i1 %13, label %_9.if.then.2, label %_13.if.else.2                             ; inst 21
_9.if.then.2:
  %14 = sext i32 %4 to i64                                                         ; inst 22
  %15 = add i64 %14, 1                                                             ; inst 23
  %16 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %15                   ; inst 24
  %17 = load i32, i32* %16                                                         ; inst 25
  %18 = icmp ne i32 %17, 0                                                         ; inst 26
  br i1 %18, label %_10.if.then.3, label %_11.if.else.3                            ; inst 27
_10.if.then.3:
  %19 = sext i32 %17 to i64                                                        ; inst 28
  %20 = add i64 %19, 1                                                             ; inst 29
  %21 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %20                   ; inst 30
  %22 = load i32, i32* %21                                                         ; inst 31
  br label %_12.if.exit.3                                                          ; inst 32
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 33
_12.if.exit.3:
  %23 = phi i32 [%22, %_10.if.then.3], [%17, %_11.if.else.3]                       ; inst 34
  br label %_14.if.exit.2                                                          ; inst 35
_13.if.else.2:
  br label %_14.if.exit.2                                                          ; inst 36
_14.if.exit.2:
  %24 = phi i32 [%23, %_12.if.exit.3], [%4, %_13.if.else.2]                        ; inst 37
  %25 = icmp ne i32 %12, 0                                                         ; inst 38
  br i1 %25, label %_15.lazy.then.0, label %_16.lazy.else.0                        ; inst 39
_15.lazy.then.0:
  %26 = icmp ne i32 %24, 0                                                         ; inst 40
  br label %_17.lazy.exit.0                                                        ; inst 41
_16.lazy.else.0:
  br label %_17.lazy.exit.0                                                        ; inst 42
_17.lazy.exit.0:
  %27 = phi i1 [%26, %_15.lazy.then.0], [0, %_16.lazy.else.0]                      ; inst 43
  br i1 %27, label %_18.lazy.then.1, label %_19.lazy.else.1                        ; inst 44
_18.lazy.then.1:
  %28 = icmp eq i32 %12, %24                                                       ; inst 45
  br label %_20.lazy.exit.1                                                        ; inst 46
_19.lazy.else.1:
  br label %_20.lazy.exit.1                                                        ; inst 47
_20.lazy.exit.1:
  %29 = phi i1 [%28, %_18.lazy.then.1], [0, %_19.lazy.else.1]                      ; inst 48
  br i1 %29, label %_21.if.then.4, label %_22.if.else.4                            ; inst 49
_21.if.then.4:
  ret i32 1                                                                        ; inst 50
_22.if.else.4:
  br label %_23.if.exit.4                                                          ; inst 51
_23.if.exit.4:
  %30 = icmp eq i32 %24, 0                                                         ; inst 52
  br i1 %30, label %_24.if.then.5, label %_25.if.else.5                            ; inst 53
_24.if.then.5:
  ret i32 0                                                                        ; inst 54
_25.if.else.5:
  br label %_26.if.exit.5                                                          ; inst 55
_26.if.exit.5:
  %31 = add i32 %3, 1                                                              ; inst 56
  br label %_4.while.cond.0                                                        ; inst 57
_27.while.exit.0:
  ret i32 0                                                                        ; inst 58
}

