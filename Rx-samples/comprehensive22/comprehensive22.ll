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
  call void @printlnInt(i32 1000)                                                  ; inst 1
  call void @performSortingBenchmark()                                             ; inst 2
  call void @performMatrixOperations()                                             ; inst 3
  call void @performRecursiveOperations()                                          ; inst 4
  call void @performMathematicalOperations()                                       ; inst 5
  call void @performMemoryAccessPatterns()                                         ; inst 6
  call void @printlnInt(i32 9999)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @performSortingBenchmark() {
_0.entry.0:
  call void @printlnInt(i32 1001)                                                  ; inst 1
  %0 = alloca [1000 x i32]                                                         ; inst 2
  %1 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 1000                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeReverseArray([1000 x i32]* %0, i32 1000)                    ; inst 12
  %6 = alloca [1000 x i32]                                                         ; inst 13
  %7 = getelementptr [1000 x i32], [1000 x i32]* %6, i32 0, i32 0                  ; inst 14
  br label %_4.array.cond.1                                                        ; inst 15
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 16
  %9 = icmp slt i32 %8, 1000                                                       ; inst 17
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 18
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 19
  store i32 0, i32* %10                                                            ; inst 20
  %11 = add i32 %8, 1                                                              ; inst 21
  br label %_4.array.cond.1                                                        ; inst 22
_6.array.exit.1:
  call void @copyArray([1000 x i32]* %0, [1000 x i32]* %6, i32 1000)               ; inst 23
  call void @quickSort([1000 x i32]* %6, i32 0, i32 999)                           ; inst 24
  call void @validateSortedArray([1000 x i32]* %6, i32 1000)                       ; inst 25
  %12 = alloca [1000 x i32]                                                        ; inst 26
  %13 = getelementptr [1000 x i32], [1000 x i32]* %12, i32 0, i32 0                ; inst 27
  br label %_7.array.cond.2                                                        ; inst 28
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 29
  %15 = icmp slt i32 %14, 1000                                                     ; inst 30
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 31
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 32
  store i32 0, i32* %16                                                            ; inst 33
  %17 = add i32 %14, 1                                                             ; inst 34
  br label %_7.array.cond.2                                                        ; inst 35
_9.array.exit.2:
  call void @copyArray([1000 x i32]* %0, [1000 x i32]* %12, i32 1000)              ; inst 36
  call void @heapSort([1000 x i32]* %12, i32 1000)                                 ; inst 37
  call void @validateSortedArray([1000 x i32]* %12, i32 1000)                      ; inst 38
  %18 = alloca [1000 x i32]                                                        ; inst 39
  %19 = getelementptr [1000 x i32], [1000 x i32]* %18, i32 0, i32 0                ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_10.array.cond.3:
  %20 = phi i32 [0, %_9.array.exit.2], [%23, %_11.array.body.3]                    ; inst 42
  %21 = icmp slt i32 %20, 1000                                                     ; inst 43
  br i1 %21, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 44
_11.array.body.3:
  %22 = getelementptr i32, i32* %19, i32 %20                                       ; inst 45
  store i32 0, i32* %22                                                            ; inst 46
  %23 = add i32 %20, 1                                                             ; inst 47
  br label %_10.array.cond.3                                                       ; inst 48
_12.array.exit.3:
  call void @copyArray([1000 x i32]* %0, [1000 x i32]* %18, i32 1000)              ; inst 49
  call void @mergeSort([1000 x i32]* %18, i32 0, i32 999)                          ; inst 50
  call void @validateSortedArray([1000 x i32]* %18, i32 1000)                      ; inst 51
  %24 = alloca [1000 x i32]                                                        ; inst 52
  %25 = getelementptr [1000 x i32], [1000 x i32]* %24, i32 0, i32 0                ; inst 53
  br label %_13.array.cond.4                                                       ; inst 54
_13.array.cond.4:
  %26 = phi i32 [0, %_12.array.exit.3], [%29, %_14.array.body.4]                   ; inst 55
  %27 = icmp slt i32 %26, 1000                                                     ; inst 56
  br i1 %27, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 57
_14.array.body.4:
  %28 = getelementptr i32, i32* %25, i32 %26                                       ; inst 58
  store i32 0, i32* %28                                                            ; inst 59
  %29 = add i32 %26, 1                                                             ; inst 60
  br label %_13.array.cond.4                                                       ; inst 61
_15.array.exit.4:
  call void @copyArray([1000 x i32]* %0, [1000 x i32]* %24, i32 1000)              ; inst 62
  call void @selectionSort([1000 x i32]* %24, i32 1000)                            ; inst 63
  call void @validateSortedArray([1000 x i32]* %24, i32 1000)                      ; inst 64
  call void @printlnInt(i32 1002)                                                  ; inst 65
  ret void                                                                         ; inst 66
}

define void @initializeReverseArray([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %3 = icmp slt i32 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %4                 ; inst 6
  %6 = sub i32 %1, %2                                                              ; inst 7
  store i32 %6, i32* %5                                                            ; inst 8
  %7 = add i32 %2, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  ret void                                                                         ; inst 11
}

define void @copyArray([1000 x i32]* %0, [1000 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %4 = icmp slt i32 %3, %2                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 5
  %6 = getelementptr [1000 x i32], [1000 x i32]* %1, i32 0, i64 %5                 ; inst 6
  %7 = sext i32 %3 to i64                                                          ; inst 7
  %8 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %7                 ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  store i32 %9, i32* %6                                                            ; inst 10
  %10 = add i32 %3, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  ret void                                                                         ; inst 13
}

define void @quickSort([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %1, %2                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = call i32 @partition([1000 x i32]* %0, i32 %1, i32 %2)                       ; inst 3
  %5 = sub i32 %4, 1                                                               ; inst 4
  call void @quickSort([1000 x i32]* %0, i32 %1, i32 %5)                           ; inst 5
  %6 = add i32 %4, 1                                                               ; inst 6
  call void @quickSort([1000 x i32]* %0, i32 %6, i32 %2)                           ; inst 7
  br label %_3.if.exit.0                                                           ; inst 8
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 9
_3.if.exit.0:
  ret void                                                                         ; inst 10
}

define i32 @partition([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = sext i32 %2 to i64                                                          ; inst 1
  %4 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %3                 ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = sub i32 %1, 1                                                               ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %7 = phi i32 [%1, %_0.entry.0], [%16, %_5.if.exit.0]                             ; inst 6
  %8 = phi i32 [%6, %_0.entry.0], [%15, %_5.if.exit.0]                             ; inst 7
  %9 = icmp slt i32 %7, %2                                                         ; inst 8
  br i1 %9, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 9
_2.while.body.0:
  %10 = sext i32 %7 to i64                                                         ; inst 10
  %11 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %10               ; inst 11
  %12 = load i32, i32* %11                                                         ; inst 12
  %13 = icmp sle i32 %12, %5                                                       ; inst 13
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 14
_3.if.then.0:
  %14 = add i32 %8, 1                                                              ; inst 15
  call void @swapElements([1000 x i32]* %0, i32 %14, i32 %7)                       ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %15 = phi i32 [%14, %_3.if.then.0], [%8, %_4.if.else.0]                          ; inst 19
  %16 = add i32 %7, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  %17 = add i32 %8, 1                                                              ; inst 22
  call void @swapElements([1000 x i32]* %0, i32 %17, i32 %2)                       ; inst 23
  %18 = add i32 %8, 1                                                              ; inst 24
  ret i32 %18                                                                      ; inst 25
}

define void @swapElements([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = sext i32 %1 to i64                                                          ; inst 1
  %4 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %3                 ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = sext i32 %1 to i64                                                          ; inst 4
  %7 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %6                 ; inst 5
  %8 = sext i32 %2 to i64                                                          ; inst 6
  %9 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %8                 ; inst 7
  %10 = load i32, i32* %9                                                          ; inst 8
  store i32 %10, i32* %7                                                           ; inst 9
  %11 = sext i32 %2 to i64                                                         ; inst 10
  %12 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %11               ; inst 11
  store i32 %5, i32* %12                                                           ; inst 12
  ret void                                                                         ; inst 13
}

define void @heapSort([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = sdiv i32 %1, 2                                                              ; inst 1
  %3 = sub i32 %2, 1                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [%3, %_0.entry.0], [%6, %_2.while.body.0]                           ; inst 4
  %5 = icmp sge i32 %4, 0                                                          ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @heapify([1000 x i32]* %0, i32 %1, i32 %4)                             ; inst 7
  %6 = sub i32 %4, 1                                                               ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  %7 = sub i32 %1, 1                                                               ; inst 10
  br label %_4.while.cond.1                                                        ; inst 11
_4.while.cond.1:
  %8 = phi i32 [%7, %_3.while.exit.0], [%10, %_5.while.body.1]                     ; inst 12
  %9 = icmp sgt i32 %8, 0                                                          ; inst 13
  br i1 %9, label %_5.while.body.1, label %_6.while.exit.1                         ; inst 14
_5.while.body.1:
  call void @swapElements([1000 x i32]* %0, i32 0, i32 %8)                         ; inst 15
  call void @heapify([1000 x i32]* %0, i32 %8, i32 0)                              ; inst 16
  %10 = sub i32 %8, 1                                                              ; inst 17
  br label %_4.while.cond.1                                                        ; inst 18
_6.while.exit.1:
  ret void                                                                         ; inst 19
}

define void @heapify([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = mul i32 2, %2                                                               ; inst 1
  %4 = add i32 %3, 1                                                               ; inst 2
  %5 = mul i32 2, %2                                                               ; inst 3
  %6 = add i32 %5, 2                                                               ; inst 4
  %7 = icmp slt i32 %4, %1                                                         ; inst 5
  br i1 %7, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 6
_1.lazy.then.0:
  %8 = sext i32 %4 to i64                                                          ; inst 7
  %9 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %8                 ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = sext i32 %2 to i64                                                         ; inst 10
  %12 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %11               ; inst 11
  %13 = load i32, i32* %12                                                         ; inst 12
  %14 = icmp sgt i32 %10, %13                                                      ; inst 13
  br label %_3.lazy.exit.0                                                         ; inst 14
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 15
_3.lazy.exit.0:
  %15 = phi i1 [%14, %_1.lazy.then.0], [0, %_2.lazy.else.0]                        ; inst 16
  br i1 %15, label %_4.if.then.0, label %_5.if.else.0                              ; inst 17
_4.if.then.0:
  br label %_6.if.exit.0                                                           ; inst 18
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 19
_6.if.exit.0:
  %16 = phi i32 [%4, %_4.if.then.0], [%2, %_5.if.else.0]                           ; inst 20
  %17 = icmp slt i32 %6, %1                                                        ; inst 21
  br i1 %17, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 22
_7.lazy.then.1:
  %18 = sext i32 %6 to i64                                                         ; inst 23
  %19 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %18               ; inst 24
  %20 = load i32, i32* %19                                                         ; inst 25
  %21 = sext i32 %16 to i64                                                        ; inst 26
  %22 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %21               ; inst 27
  %23 = load i32, i32* %22                                                         ; inst 28
  %24 = icmp sgt i32 %20, %23                                                      ; inst 29
  br label %_9.lazy.exit.1                                                         ; inst 30
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 31
_9.lazy.exit.1:
  %25 = phi i1 [%24, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 32
  br i1 %25, label %_10.if.then.1, label %_11.if.else.1                            ; inst 33
_10.if.then.1:
  br label %_12.if.exit.1                                                          ; inst 34
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 35
_12.if.exit.1:
  %26 = phi i32 [%6, %_10.if.then.1], [%16, %_11.if.else.1]                        ; inst 36
  %27 = icmp ne i32 %26, %2                                                        ; inst 37
  br i1 %27, label %_13.if.then.2, label %_14.if.else.2                            ; inst 38
_13.if.then.2:
  call void @swapElements([1000 x i32]* %0, i32 %2, i32 %26)                       ; inst 39
  call void @heapify([1000 x i32]* %0, i32 %1, i32 %26)                            ; inst 40
  br label %_15.if.exit.2                                                          ; inst 41
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 42
_15.if.exit.2:
  ret void                                                                         ; inst 43
}

define void @mergeSort([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %1, %2                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = sub i32 %2, %1                                                              ; inst 3
  %5 = sdiv i32 %4, 2                                                              ; inst 4
  %6 = add i32 %1, %5                                                              ; inst 5
  call void @mergeSort([1000 x i32]* %0, i32 %1, i32 %6)                           ; inst 6
  %7 = add i32 %6, 1                                                               ; inst 7
  call void @mergeSort([1000 x i32]* %0, i32 %7, i32 %2)                           ; inst 8
  call void @merge([1000 x i32]* %0, i32 %1, i32 %6, i32 %2)                       ; inst 9
  br label %_3.if.exit.0                                                           ; inst 10
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 11
_3.if.exit.0:
  ret void                                                                         ; inst 12
}

define void @merge([1000 x i32]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = sub i32 %2, %1                                                              ; inst 1
  %5 = add i32 %4, 1                                                               ; inst 2
  %6 = sub i32 %3, %2                                                              ; inst 3
  %7 = alloca [500 x i32]                                                          ; inst 4
  %8 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i32 0                    ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%12, %_2.array.body.0]                           ; inst 7
  %10 = icmp slt i32 %9, 500                                                       ; inst 8
  br i1 %10, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 9
_2.array.body.0:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 10
  store i32 0, i32* %11                                                            ; inst 11
  %12 = add i32 %9, 1                                                              ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  %13 = alloca [500 x i32]                                                         ; inst 14
  %14 = getelementptr [500 x i32], [500 x i32]* %13, i32 0, i32 0                  ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %15 = phi i32 [0, %_3.array.exit.0], [%18, %_5.array.body.1]                     ; inst 17
  %16 = icmp slt i32 %15, 500                                                      ; inst 18
  br i1 %16, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 20
  store i32 0, i32* %17                                                            ; inst 21
  %18 = add i32 %15, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %19 = phi i32 [0, %_6.array.exit.1], [%27, %_8.while.body.0]                     ; inst 25
  %20 = icmp slt i32 %19, %5                                                       ; inst 26
  br i1 %20, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 27
_8.while.body.0:
  %21 = sext i32 %19 to i64                                                        ; inst 28
  %22 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %21                 ; inst 29
  %23 = add i32 %1, %19                                                            ; inst 30
  %24 = sext i32 %23 to i64                                                        ; inst 31
  %25 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %24               ; inst 32
  %26 = load i32, i32* %25                                                         ; inst 33
  store i32 %26, i32* %22                                                          ; inst 34
  %27 = add i32 %19, 1                                                             ; inst 35
  br label %_7.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 37
_10.while.cond.1:
  %28 = phi i32 [0, %_9.while.exit.0], [%37, %_11.while.body.1]                    ; inst 38
  %29 = icmp slt i32 %28, %6                                                       ; inst 39
  br i1 %29, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 40
_11.while.body.1:
  %30 = sext i32 %28 to i64                                                        ; inst 41
  %31 = getelementptr [500 x i32], [500 x i32]* %13, i32 0, i64 %30                ; inst 42
  %32 = add i32 %2, 1                                                              ; inst 43
  %33 = add i32 %32, %28                                                           ; inst 44
  %34 = sext i32 %33 to i64                                                        ; inst 45
  %35 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %34               ; inst 46
  %36 = load i32, i32* %35                                                         ; inst 47
  store i32 %36, i32* %31                                                          ; inst 48
  %37 = add i32 %28, 1                                                             ; inst 49
  br label %_10.while.cond.1                                                       ; inst 50
_12.while.exit.1:
  br label %_13.while.cond.2                                                       ; inst 51
_13.while.cond.2:
  %38 = phi i32 [%1, %_12.while.exit.1], [%65, %_20.if.exit.0]                     ; inst 52
  %39 = phi i32 [0, %_12.while.exit.1], [%63, %_20.if.exit.0]                      ; inst 53
  %40 = phi i32 [0, %_12.while.exit.1], [%64, %_20.if.exit.0]                      ; inst 54
  %41 = icmp slt i32 %40, %5                                                       ; inst 55
  br i1 %41, label %_14.lazy.then.0, label %_15.lazy.else.0                        ; inst 56
_14.lazy.then.0:
  %42 = icmp slt i32 %39, %6                                                       ; inst 57
  br label %_16.lazy.exit.0                                                        ; inst 58
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 59
_16.lazy.exit.0:
  %43 = phi i1 [%42, %_14.lazy.then.0], [0, %_15.lazy.else.0]                      ; inst 60
  br i1 %43, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 61
_17.while.body.2:
  %44 = sext i32 %40 to i64                                                        ; inst 62
  %45 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %44                 ; inst 63
  %46 = load i32, i32* %45                                                         ; inst 64
  %47 = sext i32 %39 to i64                                                        ; inst 65
  %48 = getelementptr [500 x i32], [500 x i32]* %13, i32 0, i64 %47                ; inst 66
  %49 = load i32, i32* %48                                                         ; inst 67
  %50 = icmp sle i32 %46, %49                                                      ; inst 68
  br i1 %50, label %_18.if.then.0, label %_19.if.else.0                            ; inst 69
_18.if.then.0:
  %51 = sext i32 %38 to i64                                                        ; inst 70
  %52 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %51               ; inst 71
  %53 = sext i32 %40 to i64                                                        ; inst 72
  %54 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %53                 ; inst 73
  %55 = load i32, i32* %54                                                         ; inst 74
  store i32 %55, i32* %52                                                          ; inst 75
  %56 = add i32 %40, 1                                                             ; inst 76
  br label %_20.if.exit.0                                                          ; inst 77
_19.if.else.0:
  %57 = sext i32 %38 to i64                                                        ; inst 78
  %58 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %57               ; inst 79
  %59 = sext i32 %39 to i64                                                        ; inst 80
  %60 = getelementptr [500 x i32], [500 x i32]* %13, i32 0, i64 %59                ; inst 81
  %61 = load i32, i32* %60                                                         ; inst 82
  store i32 %61, i32* %58                                                          ; inst 83
  %62 = add i32 %39, 1                                                             ; inst 84
  br label %_20.if.exit.0                                                          ; inst 85
_20.if.exit.0:
  %63 = phi i32 [%39, %_18.if.then.0], [%62, %_19.if.else.0]                       ; inst 86
  %64 = phi i32 [%56, %_18.if.then.0], [%40, %_19.if.else.0]                       ; inst 87
  %65 = add i32 %38, 1                                                             ; inst 88
  br label %_13.while.cond.2                                                       ; inst 89
_21.while.exit.2:
  br label %_22.while.cond.3                                                       ; inst 90
_22.while.cond.3:
  %66 = phi i32 [%38, %_21.while.exit.2], [%75, %_23.while.body.3]                 ; inst 91
  %67 = phi i32 [%40, %_21.while.exit.2], [%74, %_23.while.body.3]                 ; inst 92
  %68 = icmp slt i32 %67, %5                                                       ; inst 93
  br i1 %68, label %_23.while.body.3, label %_24.while.exit.3                      ; inst 94
_23.while.body.3:
  %69 = sext i32 %66 to i64                                                        ; inst 95
  %70 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %69               ; inst 96
  %71 = sext i32 %67 to i64                                                        ; inst 97
  %72 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %71                 ; inst 98
  %73 = load i32, i32* %72                                                         ; inst 99
  store i32 %73, i32* %70                                                          ; inst 100
  %74 = add i32 %67, 1                                                             ; inst 101
  %75 = add i32 %66, 1                                                             ; inst 102
  br label %_22.while.cond.3                                                       ; inst 103
_24.while.exit.3:
  br label %_25.while.cond.4                                                       ; inst 104
_25.while.cond.4:
  %76 = phi i32 [%66, %_24.while.exit.3], [%85, %_26.while.body.4]                 ; inst 105
  %77 = phi i32 [%39, %_24.while.exit.3], [%84, %_26.while.body.4]                 ; inst 106
  %78 = icmp slt i32 %77, %6                                                       ; inst 107
  br i1 %78, label %_26.while.body.4, label %_27.while.exit.4                      ; inst 108
_26.while.body.4:
  %79 = sext i32 %76 to i64                                                        ; inst 109
  %80 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %79               ; inst 110
  %81 = sext i32 %77 to i64                                                        ; inst 111
  %82 = getelementptr [500 x i32], [500 x i32]* %13, i32 0, i64 %81                ; inst 112
  %83 = load i32, i32* %82                                                         ; inst 113
  store i32 %83, i32* %80                                                          ; inst 114
  %84 = add i32 %77, 1                                                             ; inst 115
  %85 = add i32 %76, 1                                                             ; inst 116
  br label %_25.while.cond.4                                                       ; inst 117
_27.while.exit.4:
  ret void                                                                         ; inst 118
}

define void @selectionSort([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%19, %_11.if.exit.1]                             ; inst 2
  %3 = sub i32 %1, 1                                                               ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %5 = add i32 %2, 1                                                               ; inst 6
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %6 = phi i32 [%5, %_2.while.body.0], [%17, %_7.if.exit.0]                        ; inst 8
  %7 = phi i32 [%2, %_2.while.body.0], [%16, %_7.if.exit.0]                        ; inst 9
  %8 = icmp slt i32 %6, %1                                                         ; inst 10
  br i1 %8, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 11
_4.while.body.1:
  %9 = sext i32 %6 to i64                                                          ; inst 12
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 13
  %11 = load i32, i32* %10                                                         ; inst 14
  %12 = sext i32 %7 to i64                                                         ; inst 15
  %13 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %12               ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = icmp slt i32 %11, %14                                                      ; inst 18
  br i1 %15, label %_5.if.then.0, label %_6.if.else.0                              ; inst 19
_5.if.then.0:
  br label %_7.if.exit.0                                                           ; inst 20
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 21
_7.if.exit.0:
  %16 = phi i32 [%6, %_5.if.then.0], [%7, %_6.if.else.0]                           ; inst 22
  %17 = add i32 %6, 1                                                              ; inst 23
  br label %_3.while.cond.1                                                        ; inst 24
_8.while.exit.1:
  %18 = icmp ne i32 %7, %2                                                         ; inst 25
  br i1 %18, label %_9.if.then.1, label %_10.if.else.1                             ; inst 26
_9.if.then.1:
  call void @swapElements([1000 x i32]* %0, i32 %2, i32 %7)                        ; inst 27
  br label %_11.if.exit.1                                                          ; inst 28
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 29
_11.if.exit.1:
  %19 = add i32 %2, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_12.while.exit.0:
  ret void                                                                         ; inst 32
}

define void @validateSortedArray([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 2
  %3 = sub i32 %1, 1                                                               ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_10.critical_edge.0                     ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = add i32 %2, 1                                                               ; inst 9
  %9 = sext i32 %8 to i64                                                          ; inst 10
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = icmp sgt i32 %7, %11                                                       ; inst 13
  br i1 %12, label %_3.if.then.0, label %_4.if.else.0                              ; inst 14
_3.if.then.0:
  br label %_6.while.exit.0                                                        ; inst 15
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 16
_5.if.exit.0:
  %13 = add i32 %2, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  %14 = phi i32 [1, %_10.critical_edge.0], [0, %_3.if.then.0]                      ; inst 19
  %15 = icmp eq i32 %14, 1                                                         ; inst 20
  br i1 %15, label %_7.if.then.1, label %_8.if.else.1                              ; inst 21
_7.if.then.1:
  call void @printlnInt(i32 2000)                                                  ; inst 22
  br label %_9.if.exit.1                                                           ; inst 23
_8.if.else.1:
  call void @printlnInt(i32 2001)                                                  ; inst 24
  br label %_9.if.exit.1                                                           ; inst 25
_9.if.exit.1:
  ret void                                                                         ; inst 26
_10.critical_edge.0:
  br label %_6.while.exit.0                                                        ; inst 27
}

define void @performMatrixOperations() {
_0.entry.0:
  call void @printlnInt(i32 2002)                                                  ; inst 1
  %0 = alloca [400 x i32]                                                          ; inst 2
  %1 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 400                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %6 = alloca [400 x i32]                                                          ; inst 12
  %7 = getelementptr [400 x i32], [400 x i32]* %6, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 400                                                        ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %12 = alloca [400 x i32]                                                         ; inst 22
  %13 = getelementptr [400 x i32], [400 x i32]* %12, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 25
  %15 = icmp slt i32 %14, 400                                                      ; inst 26
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 28
  store i32 0, i32* %16                                                            ; inst 29
  %17 = add i32 %14, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  call void @initializeMatrix([400 x i32]* %0, i32 20)                             ; inst 32
  call void @initializeMatrix([400 x i32]* %6, i32 20)                             ; inst 33
  call void @matrixMultiply([400 x i32]* %0, [400 x i32]* %6, [400 x i32]* %12, i32 20) ; inst 34
  %18 = alloca [400 x i32]                                                         ; inst 35
  %19 = getelementptr [400 x i32], [400 x i32]* %18, i32 0, i32 0                  ; inst 36
  br label %_10.array.cond.3                                                       ; inst 37
_10.array.cond.3:
  %20 = phi i32 [0, %_9.array.exit.2], [%23, %_11.array.body.3]                    ; inst 38
  %21 = icmp slt i32 %20, 400                                                      ; inst 39
  br i1 %21, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 40
_11.array.body.3:
  %22 = getelementptr i32, i32* %19, i32 %20                                       ; inst 41
  store i32 0, i32* %22                                                            ; inst 42
  %23 = add i32 %20, 1                                                             ; inst 43
  br label %_10.array.cond.3                                                       ; inst 44
_12.array.exit.3:
  call void @matrixTranspose([400 x i32]* %12, [400 x i32]* %18, i32 20)           ; inst 45
  %24 = call i32 @calculateDeterminant([400 x i32]* %12, i32 10)                   ; inst 46
  call void @printlnInt(i32 %24)                                                   ; inst 47
  call void @printlnInt(i32 2003)                                                  ; inst 48
  ret void                                                                         ; inst 49
}

define void @initializeMatrix([400 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%15, %_5.while.exit.1]                           ; inst 2
  %3 = icmp slt i32 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%14, %_4.while.body.1]                      ; inst 6
  %5 = icmp slt i32 %4, %1                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %6 = mul i32 %2, %1                                                              ; inst 9
  %7 = add i32 %6, %4                                                              ; inst 10
  %8 = sext i32 %7 to i64                                                          ; inst 11
  %9 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %8                   ; inst 12
  %10 = add i32 %2, 1                                                              ; inst 13
  %11 = add i32 %4, 1                                                              ; inst 14
  %12 = mul i32 %10, %11                                                           ; inst 15
  %13 = srem i32 %12, 50                                                           ; inst 16
  store i32 %13, i32* %9                                                           ; inst 17
  %14 = add i32 %4, 1                                                              ; inst 18
  br label %_3.while.cond.1                                                        ; inst 19
_5.while.exit.1:
  %15 = add i32 %2, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  ret void                                                                         ; inst 22
}

define void @matrixMultiply([400 x i32]* %0, [400 x i32]* %1, [400 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%33, %_8.while.exit.1]                           ; inst 2
  %5 = icmp slt i32 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%32, %_7.while.exit.2]                      ; inst 6
  %7 = icmp slt i32 %6, %3                                                         ; inst 7
  br i1 %7, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 8
_4.while.body.1:
  %8 = mul i32 %4, %3                                                              ; inst 9
  %9 = add i32 %8, %6                                                              ; inst 10
  %10 = sext i32 %9 to i64                                                         ; inst 11
  %11 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i64 %10                 ; inst 12
  store i32 0, i32* %11                                                            ; inst 13
  br label %_5.while.cond.2                                                        ; inst 14
_5.while.cond.2:
  %12 = phi i32 [0, %_4.while.body.1], [%31, %_6.while.body.2]                     ; inst 15
  %13 = icmp slt i32 %12, %3                                                       ; inst 16
  br i1 %13, label %_6.while.body.2, label %_7.while.exit.2                        ; inst 17
_6.while.body.2:
  %14 = mul i32 %4, %3                                                             ; inst 18
  %15 = add i32 %14, %6                                                            ; inst 19
  %16 = sext i32 %15 to i64                                                        ; inst 20
  %17 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i64 %16                 ; inst 21
  %18 = load i32, i32* %17                                                         ; inst 22
  %19 = mul i32 %4, %3                                                             ; inst 23
  %20 = add i32 %19, %12                                                           ; inst 24
  %21 = sext i32 %20 to i64                                                        ; inst 25
  %22 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %21                 ; inst 26
  %23 = load i32, i32* %22                                                         ; inst 27
  %24 = mul i32 %12, %3                                                            ; inst 28
  %25 = add i32 %24, %6                                                            ; inst 29
  %26 = sext i32 %25 to i64                                                        ; inst 30
  %27 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %26                 ; inst 31
  %28 = load i32, i32* %27                                                         ; inst 32
  %29 = mul i32 %23, %28                                                           ; inst 33
  %30 = add i32 %18, %29                                                           ; inst 34
  store i32 %30, i32* %17                                                          ; inst 35
  %31 = add i32 %12, 1                                                             ; inst 36
  br label %_5.while.cond.2                                                        ; inst 37
_7.while.exit.2:
  %32 = add i32 %6, 1                                                              ; inst 38
  br label %_3.while.cond.1                                                        ; inst 39
_8.while.exit.1:
  %33 = add i32 %4, 1                                                              ; inst 40
  br label %_1.while.cond.0                                                        ; inst 41
_9.while.exit.0:
  ret void                                                                         ; inst 42
}

define void @matrixTranspose([400 x i32]* %0, [400 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%17, %_5.while.exit.1]                           ; inst 2
  %4 = icmp slt i32 %3, %2                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%16, %_4.while.body.1]                      ; inst 6
  %6 = icmp slt i32 %5, %2                                                         ; inst 7
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %7 = mul i32 %5, %2                                                              ; inst 9
  %8 = add i32 %7, %3                                                              ; inst 10
  %9 = sext i32 %8 to i64                                                          ; inst 11
  %10 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %9                  ; inst 12
  %11 = mul i32 %3, %2                                                             ; inst 13
  %12 = add i32 %11, %5                                                            ; inst 14
  %13 = sext i32 %12 to i64                                                        ; inst 15
  %14 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %13                 ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  store i32 %15, i32* %10                                                          ; inst 18
  %16 = add i32 %5, 1                                                              ; inst 19
  br label %_3.while.cond.1                                                        ; inst 20
_5.while.exit.1:
  %17 = add i32 %3, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  ret void                                                                         ; inst 23
}

define i32 @calculateDeterminant([400 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 1                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 0                    ; inst 3
  %4 = load i32, i32* %3                                                           ; inst 4
  ret i32 %4                                                                       ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = icmp eq i32 %1, 2                                                           ; inst 7
  br i1 %5, label %_4.if.then.1, label %_5.if.else.1                               ; inst 8
_4.if.then.1:
  %6 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 0                    ; inst 9
  %7 = load i32, i32* %6                                                           ; inst 10
  %8 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 3                    ; inst 11
  %9 = load i32, i32* %8                                                           ; inst 12
  %10 = mul i32 %7, %9                                                             ; inst 13
  %11 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 1                   ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 2                   ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = mul i32 %12, %14                                                           ; inst 18
  %16 = sub i32 %10, %15                                                           ; inst 19
  ret i32 %16                                                                      ; inst 20
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 21
_6.if.exit.1:
  br label %_7.while.cond.0                                                        ; inst 22
_7.while.cond.0:
  %17 = phi i32 [0, %_6.if.exit.1], [%36, %_11.array.exit.0]                       ; inst 23
  %18 = phi i32 [1, %_6.if.exit.1], [%35, %_11.array.exit.0]                       ; inst 24
  %19 = phi i32 [0, %_6.if.exit.1], [%34, %_11.array.exit.0]                       ; inst 25
  %20 = icmp slt i32 %17, %1                                                       ; inst 26
  br i1 %20, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 27
_8.while.body.0:
  %21 = alloca [81 x i32]                                                          ; inst 28
  %22 = getelementptr [81 x i32], [81 x i32]* %21, i32 0, i32 0                    ; inst 29
  br label %_9.array.cond.0                                                        ; inst 30
_9.array.cond.0:
  %23 = phi i32 [0, %_8.while.body.0], [%26, %_10.array.body.0]                    ; inst 31
  %24 = icmp slt i32 %23, 81                                                       ; inst 32
  br i1 %24, label %_10.array.body.0, label %_11.array.exit.0                      ; inst 33
_10.array.body.0:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 34
  store i32 0, i32* %25                                                            ; inst 35
  %26 = add i32 %23, 1                                                             ; inst 36
  br label %_9.array.cond.0                                                        ; inst 37
_11.array.exit.0:
  call void @createMinorMatrix([400 x i32]* %0, [81 x i32]* %21, i32 %1, i32 0, i32 %17) ; inst 38
  %27 = sext i32 %17 to i64                                                        ; inst 39
  %28 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %27                 ; inst 40
  %29 = load i32, i32* %28                                                         ; inst 41
  %30 = mul i32 %18, %29                                                           ; inst 42
  %31 = sub i32 %1, 1                                                              ; inst 43
  %32 = call i32 @calculateDeterminantSmall([81 x i32]* %21, i32 %31)              ; inst 44
  %33 = mul i32 %30, %32                                                           ; inst 45
  %34 = add i32 %19, %33                                                           ; inst 46
  %35 = sub i32 0, %18                                                             ; inst 47
  %36 = add i32 %17, 1                                                             ; inst 48
  br label %_7.while.cond.0                                                        ; inst 49
_12.while.exit.0:
  ret i32 %19                                                                      ; inst 50
}

define void @createMinorMatrix([400 x i32]* %0, [81 x i32]* %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%28, %_11.if.exit.0]                             ; inst 2
  %6 = phi i32 [0, %_0.entry.0], [%27, %_11.if.exit.0]                             ; inst 3
  %7 = icmp slt i32 %5, %2                                                         ; inst 4
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %8 = icmp ne i32 %5, %3                                                          ; inst 6
  br i1 %8, label %_3.if.then.0, label %_10.if.else.0                              ; inst 7
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 8
_4.while.cond.1:
  %9 = phi i32 [0, %_3.if.then.0], [%25, %_8.if.exit.1]                            ; inst 9
  %10 = phi i32 [0, %_3.if.then.0], [%24, %_8.if.exit.1]                           ; inst 10
  %11 = icmp slt i32 %9, %2                                                        ; inst 11
  br i1 %11, label %_5.while.body.1, label %_9.while.exit.1                        ; inst 12
_5.while.body.1:
  %12 = icmp ne i32 %9, %4                                                         ; inst 13
  br i1 %12, label %_6.if.then.1, label %_7.if.else.1                              ; inst 14
_6.if.then.1:
  %13 = sub i32 %2, 1                                                              ; inst 15
  %14 = mul i32 %6, %13                                                            ; inst 16
  %15 = add i32 %14, %10                                                           ; inst 17
  %16 = sext i32 %15 to i64                                                        ; inst 18
  %17 = getelementptr [81 x i32], [81 x i32]* %1, i32 0, i64 %16                   ; inst 19
  %18 = mul i32 %5, %2                                                             ; inst 20
  %19 = add i32 %18, %9                                                            ; inst 21
  %20 = sext i32 %19 to i64                                                        ; inst 22
  %21 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %20                 ; inst 23
  %22 = load i32, i32* %21                                                         ; inst 24
  store i32 %22, i32* %17                                                          ; inst 25
  %23 = add i32 %10, 1                                                             ; inst 26
  br label %_8.if.exit.1                                                           ; inst 27
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 28
_8.if.exit.1:
  %24 = phi i32 [%23, %_6.if.then.1], [%10, %_7.if.else.1]                         ; inst 29
  %25 = add i32 %9, 1                                                              ; inst 30
  br label %_4.while.cond.1                                                        ; inst 31
_9.while.exit.1:
  %26 = add i32 %6, 1                                                              ; inst 32
  br label %_11.if.exit.0                                                          ; inst 33
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 34
_11.if.exit.0:
  %27 = phi i32 [%26, %_9.while.exit.1], [%6, %_10.if.else.0]                      ; inst 35
  %28 = add i32 %5, 1                                                              ; inst 36
  br label %_1.while.cond.0                                                        ; inst 37
_12.while.exit.0:
  ret void                                                                         ; inst 38
}

define i32 @calculateDeterminantSmall([81 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 1                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = getelementptr [81 x i32], [81 x i32]* %0, i32 0, i64 0                      ; inst 3
  %4 = load i32, i32* %3                                                           ; inst 4
  ret i32 %4                                                                       ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = icmp eq i32 %1, 2                                                           ; inst 7
  br i1 %5, label %_4.if.then.1, label %_5.if.else.1                               ; inst 8
_4.if.then.1:
  %6 = getelementptr [81 x i32], [81 x i32]* %0, i32 0, i64 0                      ; inst 9
  %7 = load i32, i32* %6                                                           ; inst 10
  %8 = getelementptr [81 x i32], [81 x i32]* %0, i32 0, i64 3                      ; inst 11
  %9 = load i32, i32* %8                                                           ; inst 12
  %10 = mul i32 %7, %9                                                             ; inst 13
  %11 = getelementptr [81 x i32], [81 x i32]* %0, i32 0, i64 1                     ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = getelementptr [81 x i32], [81 x i32]* %0, i32 0, i64 2                     ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = mul i32 %12, %14                                                           ; inst 18
  %16 = sub i32 %10, %15                                                           ; inst 19
  ret i32 %16                                                                      ; inst 20
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 21
_6.if.exit.1:
  br label %_7.while.cond.0                                                        ; inst 22
_7.while.cond.0:
  %17 = phi i32 [0, %_6.if.exit.1], [%26, %_8.while.body.0]                        ; inst 23
  %18 = phi i32 [0, %_6.if.exit.1], [%25, %_8.while.body.0]                        ; inst 24
  %19 = icmp slt i32 %17, %1                                                       ; inst 25
  br i1 %19, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 26
_8.while.body.0:
  %20 = mul i32 %17, %1                                                            ; inst 27
  %21 = add i32 %20, %17                                                           ; inst 28
  %22 = sext i32 %21 to i64                                                        ; inst 29
  %23 = getelementptr [81 x i32], [81 x i32]* %0, i32 0, i64 %22                   ; inst 30
  %24 = load i32, i32* %23                                                         ; inst 31
  %25 = add i32 %18, %24                                                           ; inst 32
  %26 = add i32 %17, 1                                                             ; inst 33
  br label %_7.while.cond.0                                                        ; inst 34
_9.while.exit.0:
  ret i32 %18                                                                      ; inst 35
}

define void @performRecursiveOperations() {
_0.entry.0:
  call void @printlnInt(i32 3001)                                                  ; inst 1
  %0 = call i32 @fibonacciIterative(i32 30)                                        ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @factorialIterative(i32 10)                                        ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @ackermannLimited(i32 3, i32 5)                                    ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @simulateTreeTraversal(i32 10)                                     ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 3002)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @fibonacciIterative(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %0                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %2 = phi i32 [2, %_3.if.exit.0], [%7, %_5.while.body.0]                          ; inst 6
  %3 = phi i32 [1, %_3.if.exit.0], [%6, %_5.while.body.0]                          ; inst 7
  %4 = phi i32 [0, %_3.if.exit.0], [%3, %_5.while.body.0]                          ; inst 8
  %5 = icmp sle i32 %2, %0                                                         ; inst 9
  br i1 %5, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 10
_5.while.body.0:
  %6 = add i32 %4, %3                                                              ; inst 11
  %7 = add i32 %2, 1                                                               ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 14
}

define i32 @factorialIterative(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [2, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [1, %_0.entry.0], [%4, %_2.while.body.0]                            ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = mul i32 %2, %1                                                              ; inst 6
  %5 = add i32 %1, 1                                                               ; inst 7
  br label %_1.while.cond.0                                                        ; inst 8
_3.while.exit.0:
  ret i32 %2                                                                       ; inst 9
}

define i32 @ackermannLimited(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = add i32 %1, 1                                                               ; inst 3
  ret i32 %3                                                                       ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %4 = icmp eq i32 %0, 1                                                           ; inst 6
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  %5 = add i32 %1, 2                                                               ; inst 8
  ret i32 %5                                                                       ; inst 9
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 10
_6.if.exit.1:
  %6 = icmp eq i32 %0, 2                                                           ; inst 11
  br i1 %6, label %_7.if.then.2, label %_8.if.else.2                               ; inst 12
_7.if.then.2:
  %7 = mul i32 2, %1                                                               ; inst 13
  %8 = add i32 %7, 3                                                               ; inst 14
  ret i32 %8                                                                       ; inst 15
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 16
_9.if.exit.2:
  %9 = icmp eq i32 %0, 3                                                           ; inst 17
  br i1 %9, label %_10.if.then.3, label %_11.if.else.3                             ; inst 18
_10.if.then.3:
  %10 = add i32 %1, 1                                                              ; inst 19
  %11 = mul i32 8, %10                                                             ; inst 20
  %12 = sub i32 %11, 3                                                             ; inst 21
  ret i32 %12                                                                      ; inst 22
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 23
_12.if.exit.3:
  %13 = mul i32 %0, %1                                                             ; inst 24
  %14 = add i32 %13, 42                                                            ; inst 25
  ret i32 %14                                                                      ; inst 26
}

define i32 @simulateTreeTraversal(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = sub i32 %0, 1                                                               ; inst 5
  %3 = call i32 @simulateTreeTraversal(i32 %2)                                     ; inst 6
  %4 = sub i32 %0, 1                                                               ; inst 7
  %5 = call i32 @simulateTreeTraversal(i32 %4)                                     ; inst 8
  %6 = add i32 %3, %5                                                              ; inst 9
  %7 = add i32 %6, %0                                                              ; inst 10
  ret i32 %7                                                                       ; inst 11
}

define void @performMathematicalOperations() {
_0.entry.0:
  call void @printlnInt(i32 4001)                                                  ; inst 1
  %0 = call i32 @countPrimesUpTo(i32 1000)                                         ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @performGcdOperations()                                            ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @performPowerOperations()                                          ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @performSquareRootOperations()                                     ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 4002)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @countPrimesUpTo(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [2, %_0.entry.0], [%8, %_5.if.exit.0]                               ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_5.if.exit.0]                               ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = call i32 @isPrimeOptimized(i32 %1)                                          ; inst 6
  %5 = icmp eq i32 %4, 1                                                           ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = add i32 %2, 1                                                               ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %7 = phi i32 [%6, %_3.if.then.0], [%2, %_4.if.else.0]                            ; inst 12
  %8 = add i32 %1, 1                                                               ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  ret i32 %2                                                                       ; inst 15
}

define i32 @isPrimeOptimized(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = icmp sle i32 %0, 3                                                          ; inst 5
  br i1 %2, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 1                                                                        ; inst 7
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
  ret i32 0                                                                        ; inst 18
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
  ret i32 0                                                                        ; inst 35
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 36
_20.if.exit.3:
  %17 = add i32 %8, 6                                                              ; inst 37
  br label %_13.while.cond.0                                                       ; inst 38
_21.while.exit.0:
  ret i32 1                                                                        ; inst 39
}

define i32 @performGcdOperations() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [1, %_0.entry.0], [%11, %_5.while.exit.1]                           ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%4, %_5.while.exit.1]                            ; inst 3
  %2 = icmp sle i32 %0, 100                                                        ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %3 = phi i32 [1, %_2.while.body.0], [%10, %_4.while.body.1]                      ; inst 7
  %4 = phi i32 [%1, %_2.while.body.0], [%9, %_4.while.body.1]                      ; inst 8
  %5 = icmp sle i32 %3, 100                                                        ; inst 9
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %6 = mul i32 %0, 17                                                              ; inst 11
  %7 = mul i32 %3, 23                                                              ; inst 12
  %8 = call i32 @gcdEuclidean(i32 %6, i32 %7)                                      ; inst 13
  %9 = add i32 %4, %8                                                              ; inst 14
  %10 = add i32 %3, 10                                                             ; inst 15
  br label %_3.while.cond.1                                                        ; inst 16
_5.while.exit.1:
  %11 = add i32 %0, 10                                                             ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  %12 = srem i32 %1, 10000                                                         ; inst 19
  ret i32 %12                                                                      ; inst 20
}

define i32 @gcdEuclidean(i32 %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [%1, %_0.entry.0], [%5, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [%0, %_0.entry.0], [%2, %_2.while.body.0]                           ; inst 3
  %4 = icmp ne i32 %2, 0                                                           ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = srem i32 %3, %2                                                             ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 8
}

define i32 @performPowerOperations() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [2, %_0.entry.0], [%9, %_5.while.exit.1]                            ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%4, %_5.while.exit.1]                            ; inst 3
  %2 = icmp sle i32 %0, 10                                                         ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %3 = phi i32 [1, %_2.while.body.0], [%8, %_4.while.body.1]                       ; inst 7
  %4 = phi i32 [%1, %_2.while.body.0], [%7, %_4.while.body.1]                      ; inst 8
  %5 = icmp sle i32 %3, 10                                                         ; inst 9
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %6 = call i32 @fastPower(i32 %0, i32 %3, i32 1000)                               ; inst 11
  %7 = add i32 %4, %6                                                              ; inst 12
  %8 = add i32 %3, 1                                                               ; inst 13
  br label %_3.while.cond.1                                                        ; inst 14
_5.while.exit.1:
  %9 = add i32 %0, 1                                                               ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  %10 = srem i32 %1, 10000                                                         ; inst 17
  ret i32 %10                                                                      ; inst 18
}

define i32 @fastPower(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %4 = phi i32 [%1, %_3.if.exit.0], [%15, %_8.if.exit.1]                           ; inst 6
  %5 = phi i32 [%0, %_3.if.exit.0], [%14, %_8.if.exit.1]                           ; inst 7
  %6 = phi i32 [1, %_3.if.exit.0], [%12, %_8.if.exit.1]                            ; inst 8
  %7 = icmp sgt i32 %4, 0                                                          ; inst 9
  br i1 %7, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 10
_5.while.body.0:
  %8 = srem i32 %4, 2                                                              ; inst 11
  %9 = icmp eq i32 %8, 1                                                           ; inst 12
  br i1 %9, label %_6.if.then.1, label %_7.if.else.1                               ; inst 13
_6.if.then.1:
  %10 = mul i32 %6, %5                                                             ; inst 14
  %11 = srem i32 %10, %2                                                           ; inst 15
  br label %_8.if.exit.1                                                           ; inst 16
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 17
_8.if.exit.1:
  %12 = phi i32 [%11, %_6.if.then.1], [%6, %_7.if.else.1]                          ; inst 18
  %13 = mul i32 %5, %5                                                             ; inst 19
  %14 = srem i32 %13, %2                                                           ; inst 20
  %15 = sdiv i32 %4, 2                                                             ; inst 21
  br label %_4.while.cond.0                                                        ; inst 22
_9.while.exit.0:
  ret i32 %6                                                                       ; inst 23
}

define i32 @performSquareRootOperations() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [1, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%4, %_2.while.body.0]                            ; inst 3
  %2 = icmp sle i32 %0, 100                                                        ; inst 4
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %3 = call i32 @integerSquareRoot(i32 %0)                                         ; inst 6
  %4 = add i32 %1, %3                                                              ; inst 7
  %5 = add i32 %0, 1                                                               ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  ret i32 %1                                                                       ; inst 10
}

define i32 @integerSquareRoot(i32 %0) {
_0.entry.0:
  %1 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %2 = phi i32 [0, %_3.if.exit.0], [%13, %_8.if.exit.1]                            ; inst 6
  %3 = phi i32 [%0, %_3.if.exit.0], [%14, %_8.if.exit.1]                           ; inst 7
  %4 = phi i32 [1, %_3.if.exit.0], [%15, %_8.if.exit.1]                            ; inst 8
  %5 = icmp sle i32 %4, %3                                                         ; inst 9
  br i1 %5, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 10
_5.while.body.0:
  %6 = sub i32 %3, %4                                                              ; inst 11
  %7 = sdiv i32 %6, 2                                                              ; inst 12
  %8 = add i32 %4, %7                                                              ; inst 13
  %9 = sdiv i32 %0, %8                                                             ; inst 14
  %10 = icmp sle i32 %8, %9                                                        ; inst 15
  br i1 %10, label %_6.if.then.1, label %_7.if.else.1                              ; inst 16
_6.if.then.1:
  %11 = add i32 %8, 1                                                              ; inst 17
  br label %_8.if.exit.1                                                           ; inst 18
_7.if.else.1:
  %12 = sub i32 %8, 1                                                              ; inst 19
  br label %_8.if.exit.1                                                           ; inst 20
_8.if.exit.1:
  %13 = phi i32 [%8, %_6.if.then.1], [%2, %_7.if.else.1]                           ; inst 21
  %14 = phi i32 [%3, %_6.if.then.1], [%12, %_7.if.else.1]                          ; inst 22
  %15 = phi i32 [%11, %_6.if.then.1], [%4, %_7.if.else.1]                          ; inst 23
  br label %_4.while.cond.0                                                        ; inst 24
_9.while.exit.0:
  ret i32 %2                                                                       ; inst 25
}

define void @performMemoryAccessPatterns() {
_0.entry.0:
  call void @printlnInt(i32 5001)                                                  ; inst 1
  %0 = call i32 @testSequentialAccess()                                            ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @testStridedAccess()                                               ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @testRandomAccess()                                                ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @testBlockedAccess()                                               ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 5002)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @testSequentialAccess() {
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
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%11, %_5.while.body.0]                      ; inst 12
  %7 = icmp slt i32 %6, 2000                                                       ; inst 13
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 14
_5.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 15
  %9 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %8                 ; inst 16
  %10 = srem i32 %6, 100                                                           ; inst 17
  store i32 %10, i32* %9                                                           ; inst 18
  %11 = add i32 %6, 1                                                              ; inst 19
  br label %_4.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 21
_7.while.cond.1:
  %12 = phi i32 [0, %_6.while.exit.0], [%19, %_8.while.body.1]                     ; inst 22
  %13 = phi i32 [0, %_6.while.exit.0], [%18, %_8.while.body.1]                     ; inst 23
  %14 = icmp slt i32 %12, 2000                                                     ; inst 24
  br i1 %14, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 25
_8.while.body.1:
  %15 = sext i32 %12 to i64                                                        ; inst 26
  %16 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %15               ; inst 27
  %17 = load i32, i32* %16                                                         ; inst 28
  %18 = add i32 %13, %17                                                           ; inst 29
  %19 = add i32 %12, 1                                                             ; inst 30
  br label %_7.while.cond.1                                                        ; inst 31
_9.while.exit.1:
  %20 = srem i32 %13, 10000                                                        ; inst 32
  ret i32 %20                                                                      ; inst 33
}

define i32 @testStridedAccess() {
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
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%11, %_5.while.body.0]                      ; inst 12
  %7 = icmp slt i32 %6, 2000                                                       ; inst 13
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 14
_5.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 15
  %9 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %8                 ; inst 16
  %10 = srem i32 %6, 100                                                           ; inst 17
  store i32 %10, i32* %9                                                           ; inst 18
  %11 = add i32 %6, 1                                                              ; inst 19
  br label %_4.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 21
_7.while.cond.1:
  %12 = phi i32 [0, %_6.while.exit.0], [%19, %_8.while.body.1]                     ; inst 22
  %13 = phi i32 [0, %_6.while.exit.0], [%18, %_8.while.body.1]                     ; inst 23
  %14 = icmp slt i32 %12, 2000                                                     ; inst 24
  br i1 %14, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 25
_8.while.body.1:
  %15 = sext i32 %12 to i64                                                        ; inst 26
  %16 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %15               ; inst 27
  %17 = load i32, i32* %16                                                         ; inst 28
  %18 = add i32 %13, %17                                                           ; inst 29
  %19 = add i32 %12, 7                                                             ; inst 30
  br label %_7.while.cond.1                                                        ; inst 31
_9.while.exit.1:
  %20 = srem i32 %13, 10000                                                        ; inst 32
  ret i32 %20                                                                      ; inst 33
}

define i32 @testRandomAccess() {
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
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%11, %_5.while.body.0]                      ; inst 12
  %7 = icmp slt i32 %6, 2000                                                       ; inst 13
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 14
_5.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 15
  %9 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %8                 ; inst 16
  %10 = srem i32 %6, 100                                                           ; inst 17
  store i32 %10, i32* %9                                                           ; inst 18
  %11 = add i32 %6, 1                                                              ; inst 19
  br label %_4.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 21
_7.while.cond.1:
  %12 = phi i32 [0, %_6.while.exit.0], [%26, %_11.if.exit.0]                       ; inst 22
  %13 = phi i32 [0, %_6.while.exit.0], [%25, %_11.if.exit.0]                       ; inst 23
  %14 = phi i32 [1, %_6.while.exit.0], [%21, %_11.if.exit.0]                       ; inst 24
  %15 = icmp slt i32 %12, 1000                                                     ; inst 25
  br i1 %15, label %_8.while.body.1, label %_12.while.exit.1                       ; inst 26
_8.while.body.1:
  %16 = mul i32 %14, 6527                                                          ; inst 27
  %17 = add i32 %16, 13904223                                                      ; inst 28
  %18 = srem i32 %17, 2000                                                         ; inst 29
  %19 = icmp slt i32 %18, 0                                                        ; inst 30
  br i1 %19, label %_9.if.then.0, label %_10.if.else.0                             ; inst 31
_9.if.then.0:
  %20 = sub i32 0, %18                                                             ; inst 32
  br label %_11.if.exit.0                                                          ; inst 33
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 34
_11.if.exit.0:
  %21 = phi i32 [%20, %_9.if.then.0], [%18, %_10.if.else.0]                        ; inst 35
  %22 = sext i32 %21 to i64                                                        ; inst 36
  %23 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %22               ; inst 37
  %24 = load i32, i32* %23                                                         ; inst 38
  %25 = add i32 %13, %24                                                           ; inst 39
  %26 = add i32 %12, 1                                                             ; inst 40
  br label %_7.while.cond.1                                                        ; inst 41
_12.while.exit.1:
  %27 = srem i32 %13, 10000                                                        ; inst 42
  ret i32 %27                                                                      ; inst 43
}

define i32 @testBlockedAccess() {
_0.entry.0:
  %0 = alloca [1600 x i32]                                                         ; inst 1
  %1 = getelementptr [1600 x i32], [1600 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 1600                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%17, %_8.while.exit.1]                      ; inst 12
  %7 = icmp slt i32 %6, 40                                                         ; inst 13
  br i1 %7, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 14
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 15
_6.while.cond.1:
  %8 = phi i32 [0, %_5.while.body.0], [%16, %_7.while.body.1]                      ; inst 16
  %9 = icmp slt i32 %8, 40                                                         ; inst 17
  br i1 %9, label %_7.while.body.1, label %_8.while.exit.1                         ; inst 18
_7.while.body.1:
  %10 = mul i32 %6, 40                                                             ; inst 19
  %11 = add i32 %10, %8                                                            ; inst 20
  %12 = sext i32 %11 to i64                                                        ; inst 21
  %13 = getelementptr [1600 x i32], [1600 x i32]* %0, i32 0, i64 %12               ; inst 22
  %14 = add i32 %6, %8                                                             ; inst 23
  %15 = srem i32 %14, 100                                                          ; inst 24
  store i32 %15, i32* %13                                                          ; inst 25
  %16 = add i32 %8, 1                                                              ; inst 26
  br label %_6.while.cond.1                                                        ; inst 27
_8.while.exit.1:
  %17 = add i32 %6, 1                                                              ; inst 28
  br label %_4.while.cond.0                                                        ; inst 29
_9.while.exit.0:
  br label %_10.while.cond.2                                                       ; inst 30
_10.while.cond.2:
  %18 = phi i32 [0, %_9.while.exit.0], [%22, %_26.while.exit.3]                    ; inst 31
  %19 = phi i32 [0, %_9.while.exit.0], [%45, %_26.while.exit.3]                    ; inst 32
  %20 = icmp slt i32 %19, 40                                                       ; inst 33
  br i1 %20, label %_11.while.body.2, label %_27.while.exit.2                      ; inst 34
_11.while.body.2:
  br label %_12.while.cond.3                                                       ; inst 35
_12.while.cond.3:
  %21 = phi i32 [0, %_11.while.body.2], [%44, %_25.while.exit.4]                   ; inst 36
  %22 = phi i32 [%18, %_11.while.body.2], [%27, %_25.while.exit.4]                 ; inst 37
  %23 = icmp slt i32 %21, 40                                                       ; inst 38
  br i1 %23, label %_13.while.body.3, label %_26.while.exit.3                      ; inst 39
_13.while.body.3:
  %24 = add i32 %19, 8                                                             ; inst 40
  %25 = icmp sgt i32 %24, 40                                                       ; inst 41
  br i1 %25, label %_14.if.then.0, label %_15.if.else.0                            ; inst 42
_14.if.then.0:
  br label %_16.if.exit.0                                                          ; inst 43
_15.if.else.0:
  br label %_16.if.exit.0                                                          ; inst 44
_16.if.exit.0:
  %26 = phi i32 [40, %_14.if.then.0], [%24, %_15.if.else.0]                        ; inst 45
  br label %_17.while.cond.4                                                       ; inst 46
_17.while.cond.4:
  %27 = phi i32 [%22, %_16.if.exit.0], [%33, %_24.while.exit.5]                    ; inst 47
  %28 = phi i32 [%19, %_16.if.exit.0], [%43, %_24.while.exit.5]                    ; inst 48
  %29 = icmp slt i32 %28, %26                                                      ; inst 49
  br i1 %29, label %_18.while.body.4, label %_25.while.exit.4                      ; inst 50
_18.while.body.4:
  %30 = add i32 %21, 8                                                             ; inst 51
  %31 = icmp sgt i32 %30, 40                                                       ; inst 52
  br i1 %31, label %_19.if.then.1, label %_20.if.else.1                            ; inst 53
_19.if.then.1:
  br label %_21.if.exit.1                                                          ; inst 54
_20.if.else.1:
  br label %_21.if.exit.1                                                          ; inst 55
_21.if.exit.1:
  %32 = phi i32 [40, %_19.if.then.1], [%30, %_20.if.else.1]                        ; inst 56
  br label %_22.while.cond.5                                                       ; inst 57
_22.while.cond.5:
  %33 = phi i32 [%27, %_21.if.exit.1], [%41, %_23.while.body.5]                    ; inst 58
  %34 = phi i32 [%21, %_21.if.exit.1], [%42, %_23.while.body.5]                    ; inst 59
  %35 = icmp slt i32 %34, %32                                                      ; inst 60
  br i1 %35, label %_23.while.body.5, label %_24.while.exit.5                      ; inst 61
_23.while.body.5:
  %36 = mul i32 %28, 40                                                            ; inst 62
  %37 = add i32 %36, %34                                                           ; inst 63
  %38 = sext i32 %37 to i64                                                        ; inst 64
  %39 = getelementptr [1600 x i32], [1600 x i32]* %0, i32 0, i64 %38               ; inst 65
  %40 = load i32, i32* %39                                                         ; inst 66
  %41 = add i32 %33, %40                                                           ; inst 67
  %42 = add i32 %34, 1                                                             ; inst 68
  br label %_22.while.cond.5                                                       ; inst 69
_24.while.exit.5:
  %43 = add i32 %28, 1                                                             ; inst 70
  br label %_17.while.cond.4                                                       ; inst 71
_25.while.exit.4:
  %44 = add i32 %21, 8                                                             ; inst 72
  br label %_12.while.cond.3                                                       ; inst 73
_26.while.exit.3:
  %45 = add i32 %19, 8                                                             ; inst 74
  br label %_10.while.cond.2                                                       ; inst 75
_27.while.exit.2:
  %46 = srem i32 %18, 10000                                                        ; inst 76
  ret i32 %46                                                                      ; inst 77
}

