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
  call void @printlnInt(i32 1700)                                                  ; inst 1
  call void @performBasicMatrixOperations()                                        ; inst 2
  call void @performAdvancedMatrixAlgorithms()                                     ; inst 3
  call void @performSparseMatrixOperations()                                       ; inst 4
  call void @performMatrixPerformanceBenchmarks()                                  ; inst 5
  call void @testMatrixEdgeCases()                                                 ; inst 6
  call void @printlnInt(i32 1799)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @performBasicMatrixOperations() {
_0.entry.0:
  %0 = alloca [16 x i32]                                                           ; inst 1
  %1 = alloca [16 x i32]                                                           ; inst 2
  call void @printlnInt(i32 1701)                                                  ; inst 3
  %2 = alloca [400 x i32]                                                          ; inst 4
  %3 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i32 0                    ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 7
  %5 = icmp slt i32 %4, 400                                                        ; inst 8
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 9
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 10
  store i32 0, i32* %6                                                             ; inst 11
  %7 = add i32 %4, 1                                                               ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  %8 = alloca [400 x i32]                                                          ; inst 14
  %9 = getelementptr [400 x i32], [400 x i32]* %8, i32 0, i32 0                    ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 17
  %11 = icmp slt i32 %10, 400                                                      ; inst 18
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 20
  store i32 0, i32* %12                                                            ; inst 21
  %13 = add i32 %10, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  %14 = alloca [400 x i32]                                                         ; inst 24
  %15 = getelementptr [400 x i32], [400 x i32]* %14, i32 0, i32 0                  ; inst 25
  br label %_7.array.cond.2                                                        ; inst 26
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 27
  %17 = icmp slt i32 %16, 400                                                      ; inst 28
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 29
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 30
  store i32 0, i32* %18                                                            ; inst 31
  %19 = add i32 %16, 1                                                             ; inst 32
  br label %_7.array.cond.2                                                        ; inst 33
_9.array.exit.2:
  call void @initializeMatrices([400 x i32]* %2, [400 x i32]* %8, i32 20)          ; inst 34
  call void @printlnInt(i32 1702)                                                  ; inst 35
  call void @matrixAddition([400 x i32]* %2, [400 x i32]* %8, [400 x i32]* %14, i32 20) ; inst 36
  %20 = call i32 @calculateMatrixSum([400 x i32]* %14, i32 20)                     ; inst 37
  call void @printlnInt(i32 %20)                                                   ; inst 38
  call void @printlnInt(i32 1703)                                                  ; inst 39
  call void @matrixSubtraction([400 x i32]* %2, [400 x i32]* %8, [400 x i32]* %14, i32 20) ; inst 40
  %21 = call i32 @calculateMatrixSum([400 x i32]* %14, i32 20)                     ; inst 41
  call void @printlnInt(i32 %21)                                                   ; inst 42
  call void @printlnInt(i32 1704)                                                  ; inst 43
  call void @matrixMultiplication([400 x i32]* %2, [400 x i32]* %8, [400 x i32]* %14, i32 20) ; inst 44
  %22 = call i32 @calculateMatrixSum([400 x i32]* %14, i32 20)                     ; inst 45
  call void @printlnInt(i32 %22)                                                   ; inst 46
  call void @printlnInt(i32 1705)                                                  ; inst 47
  call void @matrixTranspose([400 x i32]* %2, [400 x i32]* %14, i32 20)            ; inst 48
  %23 = call i32 @calculateMatrixSum([400 x i32]* %14, i32 20)                     ; inst 49
  call void @printlnInt(i32 %23)                                                   ; inst 50
  call void @printlnInt(i32 1706)                                                  ; inst 51
  %24 = alloca [16 x i32]                                                          ; inst 52
  %25 = getelementptr [16 x i32], [16 x i32]* %24, i32 0, i32 0                    ; inst 53
  br label %_10.array.cond.3                                                       ; inst 54
_10.array.cond.3:
  %26 = phi i32 [0, %_9.array.exit.2], [%29, %_11.array.body.3]                    ; inst 55
  %27 = icmp slt i32 %26, 16                                                       ; inst 56
  br i1 %27, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 57
_11.array.body.3:
  %28 = getelementptr i32, i32* %25, i32 %26                                       ; inst 58
  store i32 0, i32* %28                                                            ; inst 59
  %29 = add i32 %26, 1                                                             ; inst 60
  br label %_10.array.cond.3                                                       ; inst 61
_12.array.exit.3:
  call void @memcpy([16 x i32]* %0, [16 x i32]* %24, i64 64)                       ; inst 62
  call void @initializeSmallMatrix([16 x i32]* %0)                                 ; inst 63
  call void @memcpy([16 x i32]* %1, [16 x i32]* %24, i64 64)                       ; inst 64
  %30 = call i32 @calculateDeterminant4x4([16 x i32]* %1)                          ; inst 65
  call void @printlnInt(i32 %30)                                                   ; inst 66
  ret void                                                                         ; inst 67
}

define void @initializeMatrices([400 x i32]* %0, [400 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%32, %_11.while.exit.1]                          ; inst 2
  %4 = icmp slt i32 %3, %2                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%31, %_10.if.exit.1]                        ; inst 6
  %6 = icmp slt i32 %5, %2                                                         ; inst 7
  br i1 %6, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 8
_4.while.body.1:
  %7 = mul i32 %3, %2                                                              ; inst 9
  %8 = add i32 %7, %5                                                              ; inst 10
  %9 = icmp eq i32 %3, %5                                                          ; inst 11
  br i1 %9, label %_5.if.then.0, label %_6.if.else.0                               ; inst 12
_5.if.then.0:
  %10 = sext i32 %8 to i64                                                         ; inst 13
  %11 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %10                 ; inst 14
  %12 = add i32 %3, %5                                                             ; inst 15
  %13 = add i32 %12, 10                                                            ; inst 16
  store i32 %13, i32* %11                                                          ; inst 17
  br label %_7.if.exit.0                                                           ; inst 18
_6.if.else.0:
  %14 = sext i32 %8 to i64                                                         ; inst 19
  %15 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %14                 ; inst 20
  %16 = mul i32 %3, 2                                                              ; inst 21
  %17 = mul i32 %5, 3                                                              ; inst 22
  %18 = add i32 %16, %17                                                           ; inst 23
  %19 = srem i32 %18, 7                                                            ; inst 24
  store i32 %19, i32* %15                                                          ; inst 25
  br label %_7.if.exit.0                                                           ; inst 26
_7.if.exit.0:
  %20 = icmp sle i32 %3, %5                                                        ; inst 27
  br i1 %20, label %_8.if.then.1, label %_9.if.else.1                              ; inst 28
_8.if.then.1:
  %21 = sext i32 %8 to i64                                                         ; inst 29
  %22 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %21                 ; inst 30
  %23 = mul i32 %3, %5                                                             ; inst 31
  %24 = add i32 %23, 5                                                             ; inst 32
  store i32 %24, i32* %22                                                          ; inst 33
  %25 = mul i32 %5, %2                                                             ; inst 34
  %26 = add i32 %25, %3                                                            ; inst 35
  %27 = sext i32 %26 to i64                                                        ; inst 36
  %28 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %27                 ; inst 37
  %29 = mul i32 %3, %5                                                             ; inst 38
  %30 = add i32 %29, 5                                                             ; inst 39
  store i32 %30, i32* %28                                                          ; inst 40
  br label %_10.if.exit.1                                                          ; inst 41
_9.if.else.1:
  br label %_10.if.exit.1                                                          ; inst 42
_10.if.exit.1:
  %31 = add i32 %5, 1                                                              ; inst 43
  br label %_3.while.cond.1                                                        ; inst 44
_11.while.exit.1:
  %32 = add i32 %3, 1                                                              ; inst 45
  br label %_1.while.cond.0                                                        ; inst 46
_12.while.exit.0:
  ret void                                                                         ; inst 47
}

define void @matrixAddition([400 x i32]* %0, [400 x i32]* %1, [400 x i32]* %2, i32 %3) {
_0.entry.0:
  %4 = mul i32 %3, %3                                                              ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%16, %_2.while.body.0]                           ; inst 3
  %6 = icmp slt i32 %5, %4                                                         ; inst 4
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 6
  %8 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i64 %7                   ; inst 7
  %9 = sext i32 %5 to i64                                                          ; inst 8
  %10 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %9                  ; inst 9
  %11 = load i32, i32* %10                                                         ; inst 10
  %12 = sext i32 %5 to i64                                                         ; inst 11
  %13 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %12                 ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = add i32 %11, %14                                                           ; inst 14
  store i32 %15, i32* %8                                                           ; inst 15
  %16 = add i32 %5, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret void                                                                         ; inst 18
}

define void @matrixSubtraction([400 x i32]* %0, [400 x i32]* %1, [400 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%20, %_5.while.exit.1]                           ; inst 2
  %5 = icmp slt i32 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%19, %_4.while.body.1]                      ; inst 6
  %7 = icmp slt i32 %6, %3                                                         ; inst 7
  br i1 %7, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %8 = mul i32 %4, %3                                                              ; inst 9
  %9 = add i32 %8, %6                                                              ; inst 10
  %10 = sext i32 %9 to i64                                                         ; inst 11
  %11 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i64 %10                 ; inst 12
  %12 = sext i32 %9 to i64                                                         ; inst 13
  %13 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %12                 ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = sext i32 %9 to i64                                                         ; inst 16
  %16 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %15                 ; inst 17
  %17 = load i32, i32* %16                                                         ; inst 18
  %18 = sub i32 %14, %17                                                           ; inst 19
  store i32 %18, i32* %11                                                          ; inst 20
  %19 = add i32 %6, 1                                                              ; inst 21
  br label %_3.while.cond.1                                                        ; inst 22
_5.while.exit.1:
  %20 = add i32 %4, 1                                                              ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_6.while.exit.0:
  ret void                                                                         ; inst 25
}

define void @matrixMultiplication([400 x i32]* %0, [400 x i32]* %1, [400 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %5 = mul i32 %3, %3                                                              ; inst 3
  %6 = icmp slt i32 %4, %5                                                         ; inst 4
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %7 = sext i32 %4 to i64                                                          ; inst 6
  %8 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i64 %7                   ; inst 7
  store i32 0, i32* %8                                                             ; inst 8
  %9 = add i32 %4, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 11
_4.while.cond.1:
  %10 = phi i32 [0, %_3.while.exit.0], [%18, %_11.while.exit.2]                    ; inst 12
  %11 = icmp slt i32 %10, %3                                                       ; inst 13
  br i1 %11, label %_5.while.body.1, label %_12.while.exit.1                       ; inst 14
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 15
_6.while.cond.2:
  %12 = phi i32 [0, %_5.while.body.1], [%17, %_10.while.exit.3]                    ; inst 16
  %13 = icmp slt i32 %12, %3                                                       ; inst 17
  br i1 %13, label %_7.while.body.2, label %_11.while.exit.2                       ; inst 18
_7.while.body.2:
  br label %_8.while.cond.3                                                        ; inst 19
_8.while.cond.3:
  %14 = phi i32 [0, %_7.while.body.2], [%16, %_9.while.body.3]                     ; inst 20
  %15 = icmp slt i32 %14, %3                                                       ; inst 21
  br i1 %15, label %_9.while.body.3, label %_10.while.exit.3                       ; inst 22
_9.while.body.3:
  call void @processMatrixBlock([400 x i32]* %0, [400 x i32]* %1, [400 x i32]* %2, i32 %3, i32 %10, i32 %12, i32 %14, i32 4) ; inst 23
  %16 = add i32 %14, 4                                                             ; inst 24
  br label %_8.while.cond.3                                                        ; inst 25
_10.while.exit.3:
  %17 = add i32 %12, 4                                                             ; inst 26
  br label %_6.while.cond.2                                                        ; inst 27
_11.while.exit.2:
  %18 = add i32 %10, 4                                                             ; inst 28
  br label %_4.while.cond.1                                                        ; inst 29
_12.while.exit.1:
  ret void                                                                         ; inst 30
}

define void @processMatrixBlock([400 x i32]* %0, [400 x i32]* %1, [400 x i32]* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = add i32 %4, %7                                                              ; inst 1
  %9 = call i32 @minValue(i32 %8, i32 %3)                                          ; inst 2
  %10 = add i32 %5, %7                                                             ; inst 3
  %11 = call i32 @minValue(i32 %10, i32 %3)                                        ; inst 4
  %12 = add i32 %6, %7                                                             ; inst 5
  %13 = call i32 @minValue(i32 %12, i32 %3)                                        ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_1.while.cond.0:
  %14 = phi i32 [%4, %_0.entry.0], [%41, %_8.while.exit.1]                         ; inst 8
  %15 = icmp slt i32 %14, %9                                                       ; inst 9
  br i1 %15, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 10
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 11
_3.while.cond.1:
  %16 = phi i32 [%5, %_2.while.body.0], [%40, %_7.while.exit.2]                    ; inst 12
  %17 = icmp slt i32 %16, %11                                                      ; inst 13
  br i1 %17, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 14
_4.while.body.1:
  br label %_5.while.cond.2                                                        ; inst 15
_5.while.cond.2:
  %18 = phi i32 [%6, %_4.while.body.1], [%39, %_6.while.body.2]                    ; inst 16
  %19 = icmp slt i32 %18, %13                                                      ; inst 17
  br i1 %19, label %_6.while.body.2, label %_7.while.exit.2                        ; inst 18
_6.while.body.2:
  %20 = mul i32 %14, %3                                                            ; inst 19
  %21 = add i32 %20, %16                                                           ; inst 20
  %22 = mul i32 %14, %3                                                            ; inst 21
  %23 = add i32 %22, %18                                                           ; inst 22
  %24 = mul i32 %18, %3                                                            ; inst 23
  %25 = add i32 %24, %16                                                           ; inst 24
  %26 = sext i32 %21 to i64                                                        ; inst 25
  %27 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i64 %26                 ; inst 26
  %28 = sext i32 %21 to i64                                                        ; inst 27
  %29 = getelementptr [400 x i32], [400 x i32]* %2, i32 0, i64 %28                 ; inst 28
  %30 = load i32, i32* %29                                                         ; inst 29
  %31 = sext i32 %23 to i64                                                        ; inst 30
  %32 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %31                 ; inst 31
  %33 = load i32, i32* %32                                                         ; inst 32
  %34 = sext i32 %25 to i64                                                        ; inst 33
  %35 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %34                 ; inst 34
  %36 = load i32, i32* %35                                                         ; inst 35
  %37 = mul i32 %33, %36                                                           ; inst 36
  %38 = add i32 %30, %37                                                           ; inst 37
  store i32 %38, i32* %27                                                          ; inst 38
  %39 = add i32 %18, 1                                                             ; inst 39
  br label %_5.while.cond.2                                                        ; inst 40
_7.while.exit.2:
  %40 = add i32 %16, 1                                                             ; inst 41
  br label %_3.while.cond.1                                                        ; inst 42
_8.while.exit.1:
  %41 = add i32 %14, 1                                                             ; inst 43
  br label %_1.while.cond.0                                                        ; inst 44
_9.while.exit.0:
  ret void                                                                         ; inst 45
}

define i32 @minValue(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp slt i32 %0, %1                                                         ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %0                                                                       ; inst 3
_2.if.else.0:
  ret i32 %1                                                                       ; inst 4
_3.if.exit.0:
  unreachable                                                                      ; inst 5
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
  %7 = mul i32 %3, %2                                                              ; inst 9
  %8 = add i32 %7, %5                                                              ; inst 10
  %9 = mul i32 %5, %2                                                              ; inst 11
  %10 = add i32 %9, %3                                                             ; inst 12
  %11 = sext i32 %10 to i64                                                        ; inst 13
  %12 = getelementptr [400 x i32], [400 x i32]* %1, i32 0, i64 %11                 ; inst 14
  %13 = sext i32 %8 to i64                                                         ; inst 15
  %14 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %13                 ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  store i32 %15, i32* %12                                                          ; inst 18
  %16 = add i32 %5, 1                                                              ; inst 19
  br label %_3.while.cond.1                                                        ; inst 20
_5.while.exit.1:
  %17 = add i32 %3, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  ret void                                                                         ; inst 23
}

define i32 @calculateMatrixSum([400 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = mul i32 %1, %1                                                              ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 4
  %5 = icmp slt i32 %3, %2                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 7
  %7 = getelementptr [400 x i32], [400 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = add i32 %4, %8                                                              ; inst 10
  %10 = add i32 %3, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %11 = srem i32 %4, 1000000                                                       ; inst 13
  ret i32 %11                                                                      ; inst 14
}

define void @initializeSmallMatrix([16 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 0                      ; inst 1
  store i32 4, i32* %1                                                             ; inst 2
  %2 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 1                      ; inst 3
  store i32 3, i32* %2                                                             ; inst 4
  %3 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 2                      ; inst 5
  store i32 2, i32* %3                                                             ; inst 6
  %4 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 3                      ; inst 7
  store i32 1, i32* %4                                                             ; inst 8
  %5 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 4                      ; inst 9
  store i32 3, i32* %5                                                             ; inst 10
  %6 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 5                      ; inst 11
  store i32 4, i32* %6                                                             ; inst 12
  %7 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 6                      ; inst 13
  store i32 1, i32* %7                                                             ; inst 14
  %8 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 7                      ; inst 15
  store i32 2, i32* %8                                                             ; inst 16
  %9 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 8                      ; inst 17
  store i32 2, i32* %9                                                             ; inst 18
  %10 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 9                     ; inst 19
  store i32 1, i32* %10                                                            ; inst 20
  %11 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 10                    ; inst 21
  store i32 4, i32* %11                                                            ; inst 22
  %12 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 11                    ; inst 23
  store i32 3, i32* %12                                                            ; inst 24
  %13 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 12                    ; inst 25
  store i32 1, i32* %13                                                            ; inst 26
  %14 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 13                    ; inst 27
  store i32 2, i32* %14                                                            ; inst 28
  %15 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 14                    ; inst 29
  store i32 3, i32* %15                                                            ; inst 30
  %16 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 15                    ; inst 31
  store i32 4, i32* %16                                                            ; inst 32
  ret void                                                                         ; inst 33
}

define i32 @calculateDeterminant4x4([16 x i32]* %0) {
_0.entry.0:
  %1 = alloca [16 x i32]                                                           ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%19, %_5.if.exit.0]                              ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%18, %_5.if.exit.0]                              ; inst 4
  %4 = icmp slt i32 %2, 4                                                          ; inst 5
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @memcpy([16 x i32]* %1, [16 x i32]* %0, i64 64)                        ; inst 7
  %5 = call i32 @calculateCofactor4x4([16 x i32]* %1, i32 0, i32 %2)               ; inst 8
  %6 = srem i32 %2, 2                                                              ; inst 9
  %7 = icmp eq i32 %6, 0                                                           ; inst 10
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 11
_3.if.then.0:
  %8 = sext i32 %2 to i64                                                          ; inst 12
  %9 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %8                     ; inst 13
  %10 = load i32, i32* %9                                                          ; inst 14
  %11 = mul i32 %10, %5                                                            ; inst 15
  %12 = add i32 %3, %11                                                            ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  %13 = sext i32 %2 to i64                                                         ; inst 18
  %14 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %13                   ; inst 19
  %15 = load i32, i32* %14                                                         ; inst 20
  %16 = mul i32 %15, %5                                                            ; inst 21
  %17 = sub i32 %3, %16                                                            ; inst 22
  br label %_5.if.exit.0                                                           ; inst 23
_5.if.exit.0:
  %18 = phi i32 [%12, %_3.if.then.0], [%17, %_4.if.else.0]                         ; inst 24
  %19 = add i32 %2, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 27
}

define i32 @calculateCofactor4x4([16 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [9 x i32]                                                            ; inst 1
  %4 = alloca [9 x i32]                                                            ; inst 2
  %5 = getelementptr [9 x i32], [9 x i32]* %4, i32 0, i32 0                        ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 5
  %7 = icmp slt i32 %6, 9                                                          ; inst 6
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 8
  store i32 0, i32* %8                                                             ; inst 9
  %9 = add i32 %6, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %10 = phi i32 [0, %_3.array.exit.0], [%28, %_14.if.exit.0]                       ; inst 13
  %11 = phi i32 [0, %_3.array.exit.0], [%29, %_14.if.exit.0]                       ; inst 14
  %12 = icmp slt i32 %11, 4                                                        ; inst 15
  br i1 %12, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 16
_5.while.body.0:
  %13 = icmp ne i32 %11, %1                                                        ; inst 17
  br i1 %13, label %_6.if.then.0, label %_13.if.else.0                             ; inst 18
_6.if.then.0:
  br label %_7.while.cond.1                                                        ; inst 19
_7.while.cond.1:
  %14 = phi i32 [0, %_6.if.then.0], [%27, %_11.if.exit.1]                          ; inst 20
  %15 = phi i32 [%10, %_6.if.then.0], [%26, %_11.if.exit.1]                        ; inst 21
  %16 = icmp slt i32 %14, 4                                                        ; inst 22
  br i1 %16, label %_8.while.body.1, label %_12.while.exit.1                       ; inst 23
_8.while.body.1:
  %17 = icmp ne i32 %14, %2                                                        ; inst 24
  br i1 %17, label %_9.if.then.1, label %_10.if.else.1                             ; inst 25
_9.if.then.1:
  %18 = sext i32 %15 to i64                                                        ; inst 26
  %19 = getelementptr [9 x i32], [9 x i32]* %4, i32 0, i64 %18                     ; inst 27
  %20 = mul i32 %11, 4                                                             ; inst 28
  %21 = add i32 %20, %14                                                           ; inst 29
  %22 = sext i32 %21 to i64                                                        ; inst 30
  %23 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %22                   ; inst 31
  %24 = load i32, i32* %23                                                         ; inst 32
  store i32 %24, i32* %19                                                          ; inst 33
  %25 = add i32 %15, 1                                                             ; inst 34
  br label %_11.if.exit.1                                                          ; inst 35
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 36
_11.if.exit.1:
  %26 = phi i32 [%25, %_9.if.then.1], [%15, %_10.if.else.1]                        ; inst 37
  %27 = add i32 %14, 1                                                             ; inst 38
  br label %_7.while.cond.1                                                        ; inst 39
_12.while.exit.1:
  br label %_14.if.exit.0                                                          ; inst 40
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 41
_14.if.exit.0:
  %28 = phi i32 [%15, %_12.while.exit.1], [%10, %_13.if.else.0]                    ; inst 42
  %29 = add i32 %11, 1                                                             ; inst 43
  br label %_4.while.cond.0                                                        ; inst 44
_15.while.exit.0:
  call void @memcpy([9 x i32]* %3, [9 x i32]* %4, i64 36)                          ; inst 45
  %30 = call i32 @calculateDeterminant3x3([9 x i32]* %3)                           ; inst 46
  ret i32 %30                                                                      ; inst 47
}

define i32 @calculateDeterminant3x3([9 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 0                        ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 4                        ; inst 3
  %4 = load i32, i32* %3                                                           ; inst 4
  %5 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 8                        ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = mul i32 %4, %6                                                              ; inst 7
  %8 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 5                        ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 7                       ; inst 10
  %11 = load i32, i32* %10                                                         ; inst 11
  %12 = mul i32 %9, %11                                                            ; inst 12
  %13 = sub i32 %7, %12                                                            ; inst 13
  %14 = mul i32 %2, %13                                                            ; inst 14
  %15 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 1                       ; inst 15
  %16 = load i32, i32* %15                                                         ; inst 16
  %17 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 3                       ; inst 17
  %18 = load i32, i32* %17                                                         ; inst 18
  %19 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 8                       ; inst 19
  %20 = load i32, i32* %19                                                         ; inst 20
  %21 = mul i32 %18, %20                                                           ; inst 21
  %22 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 5                       ; inst 22
  %23 = load i32, i32* %22                                                         ; inst 23
  %24 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 6                       ; inst 24
  %25 = load i32, i32* %24                                                         ; inst 25
  %26 = mul i32 %23, %25                                                           ; inst 26
  %27 = sub i32 %21, %26                                                           ; inst 27
  %28 = mul i32 %16, %27                                                           ; inst 28
  %29 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 2                       ; inst 29
  %30 = load i32, i32* %29                                                         ; inst 30
  %31 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 3                       ; inst 31
  %32 = load i32, i32* %31                                                         ; inst 32
  %33 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 7                       ; inst 33
  %34 = load i32, i32* %33                                                         ; inst 34
  %35 = mul i32 %32, %34                                                           ; inst 35
  %36 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 4                       ; inst 36
  %37 = load i32, i32* %36                                                         ; inst 37
  %38 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 6                       ; inst 38
  %39 = load i32, i32* %38                                                         ; inst 39
  %40 = mul i32 %37, %39                                                           ; inst 40
  %41 = sub i32 %35, %40                                                           ; inst 41
  %42 = mul i32 %30, %41                                                           ; inst 42
  %43 = sub i32 %14, %28                                                           ; inst 43
  %44 = add i32 %43, %42                                                           ; inst 44
  ret i32 %44                                                                      ; inst 45
}

define void @performAdvancedMatrixAlgorithms() {
_0.entry.0:
  %0 = alloca [64 x i32]                                                           ; inst 1
  call void @printlnInt(i32 1710)                                                  ; inst 2
  call void @printlnInt(i32 1711)                                                  ; inst 3
  %1 = alloca [100 x i32]                                                          ; inst 4
  %2 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i32 0                    ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 7
  %4 = icmp slt i32 %3, 100                                                        ; inst 8
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 9
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 10
  store i32 0, i32* %5                                                             ; inst 11
  %6 = add i32 %3, 1                                                               ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  call void @initializeMatrixForPower([100 x i32]* %1, i32 10)                     ; inst 14
  %7 = alloca [100 x i32]                                                          ; inst 15
  %8 = getelementptr [100 x i32], [100 x i32]* %7, i32 0, i32 0                    ; inst 16
  br label %_4.array.cond.1                                                        ; inst 17
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 18
  %10 = icmp slt i32 %9, 100                                                       ; inst 19
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 20
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 21
  store i32 0, i32* %11                                                            ; inst 22
  %12 = add i32 %9, 1                                                              ; inst 23
  br label %_4.array.cond.1                                                        ; inst 24
_6.array.exit.1:
  call void @matrixPower([100 x i32]* %1, [100 x i32]* %7, i32 10, i32 3)          ; inst 25
  %13 = call i32 @calculateMatrixSum100([100 x i32]* %7, i32 10)                   ; inst 26
  call void @printlnInt(i32 %13)                                                   ; inst 27
  call void @printlnInt(i32 1712)                                                  ; inst 28
  %14 = alloca [64 x i32]                                                          ; inst 29
  %15 = getelementptr [64 x i32], [64 x i32]* %14, i32 0, i32 0                    ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 32
  %17 = icmp slt i32 %16, 64                                                       ; inst 33
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 34
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 35
  store i32 0, i32* %18                                                            ; inst 36
  %19 = add i32 %16, 1                                                             ; inst 37
  br label %_7.array.cond.2                                                        ; inst 38
_9.array.exit.2:
  call void @initializeRotationMatrix([64 x i32]* %14)                             ; inst 39
  call void @rotateMatrix90Degrees([64 x i32]* %14, i32 8)                         ; inst 40
  call void @memcpy([64 x i32]* %0, [64 x i32]* %14, i64 256)                      ; inst 41
  %20 = call i32 @calculateMatrixSum64([64 x i32]* %0)                             ; inst 42
  call void @printlnInt(i32 %20)                                                   ; inst 43
  call void @printlnInt(i32 1713)                                                  ; inst 44
  %21 = call i32 @calculateDiagonalSums([100 x i32]* %1, i32 10)                   ; inst 45
  call void @printlnInt(i32 %21)                                                   ; inst 46
  call void @printlnInt(i32 1714)                                                  ; inst 47
  %22 = call i32 @calculateMatrixTrace([100 x i32]* %1, i32 10)                    ; inst 48
  %23 = call i32 @calculateMatrixNorm([100 x i32]* %1, i32 10)                     ; inst 49
  %24 = add i32 %22, %23                                                           ; inst 50
  call void @printlnInt(i32 %24)                                                   ; inst 51
  ret void                                                                         ; inst 52
}

define void @initializeMatrixForPower([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%19, %_11.while.exit.1]                          ; inst 2
  %3 = icmp slt i32 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%18, %_10.if.exit.0]                        ; inst 6
  %5 = icmp slt i32 %4, %1                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 8
_4.while.body.1:
  %6 = mul i32 %2, %1                                                              ; inst 9
  %7 = add i32 %6, %4                                                              ; inst 10
  %8 = icmp eq i32 %2, %4                                                          ; inst 11
  br i1 %8, label %_5.if.then.0, label %_6.if.else.0                               ; inst 12
_5.if.then.0:
  %9 = sext i32 %7 to i64                                                          ; inst 13
  %10 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %9                  ; inst 14
  store i32 2, i32* %10                                                            ; inst 15
  br label %_10.if.exit.0                                                          ; inst 16
_6.if.else.0:
  %11 = sub i32 %2, %4                                                             ; inst 17
  %12 = call i32 @absValue(i32 %11)                                                ; inst 18
  %13 = icmp eq i32 %12, 1                                                         ; inst 19
  br i1 %13, label %_7.if.then.1, label %_8.if.else.1                              ; inst 20
_7.if.then.1:
  %14 = sext i32 %7 to i64                                                         ; inst 21
  %15 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %14                 ; inst 22
  store i32 1, i32* %15                                                            ; inst 23
  br label %_9.if.exit.1                                                           ; inst 24
_8.if.else.1:
  %16 = sext i32 %7 to i64                                                         ; inst 25
  %17 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %16                 ; inst 26
  store i32 0, i32* %17                                                            ; inst 27
  br label %_9.if.exit.1                                                           ; inst 28
_9.if.exit.1:
  br label %_10.if.exit.0                                                          ; inst 29
_10.if.exit.0:
  %18 = add i32 %4, 1                                                              ; inst 30
  br label %_3.while.cond.1                                                        ; inst 31
_11.while.exit.1:
  %19 = add i32 %2, 1                                                              ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_12.while.exit.0:
  ret void                                                                         ; inst 34
}

define void @matrixPower([100 x i32]* %0, [100 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  call void @initializeIdentityMatrix([100 x i32]* %1, i32 %2)                     ; inst 1
  %4 = alloca [100 x i32]                                                          ; inst 2
  %5 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 5
  %7 = icmp slt i32 %6, 100                                                        ; inst 6
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 8
  store i32 0, i32* %8                                                             ; inst 9
  %9 = add i32 %6, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %10 = phi i32 [0, %_3.array.exit.0], [%12, %_5.while.body.0]                     ; inst 13
  %11 = icmp slt i32 %10, %3                                                       ; inst 14
  br i1 %11, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 15
_5.while.body.0:
  call void @matrixMultiplication100([100 x i32]* %1, [100 x i32]* %0, [100 x i32]* %4, i32 %2) ; inst 16
  call void @copyMatrix100([100 x i32]* %4, [100 x i32]* %1, i32 %2)               ; inst 17
  %12 = add i32 %10, 1                                                             ; inst 18
  br label %_4.while.cond.0                                                        ; inst 19
_6.while.exit.0:
  ret void                                                                         ; inst 20
}

define void @initializeIdentityMatrix([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %3 = mul i32 %1, %1                                                              ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %5                   ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %2, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 11
_4.while.cond.1:
  %8 = phi i32 [0, %_3.while.exit.0], [%14, %_5.while.body.1]                      ; inst 12
  %9 = icmp slt i32 %8, %1                                                         ; inst 13
  br i1 %9, label %_5.while.body.1, label %_6.while.exit.1                         ; inst 14
_5.while.body.1:
  %10 = mul i32 %8, %1                                                             ; inst 15
  %11 = add i32 %10, %8                                                            ; inst 16
  %12 = sext i32 %11 to i64                                                        ; inst 17
  %13 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %12                 ; inst 18
  store i32 1, i32* %13                                                            ; inst 19
  %14 = add i32 %8, 1                                                              ; inst 20
  br label %_4.while.cond.1                                                        ; inst 21
_6.while.exit.1:
  ret void                                                                         ; inst 22
}

define void @matrixMultiplication100([100 x i32]* %0, [100 x i32]* %1, [100 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%37, %_8.while.exit.1]                           ; inst 2
  %5 = icmp slt i32 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%36, %_7.while.exit.2]                      ; inst 6
  %7 = icmp slt i32 %6, %3                                                         ; inst 7
  br i1 %7, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 8
_4.while.body.1:
  %8 = mul i32 %4, %3                                                              ; inst 9
  %9 = add i32 %8, %6                                                              ; inst 10
  %10 = sext i32 %9 to i64                                                         ; inst 11
  %11 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %10                 ; inst 12
  store i32 0, i32* %11                                                            ; inst 13
  br label %_5.while.cond.2                                                        ; inst 14
_5.while.cond.2:
  %12 = phi i32 [0, %_4.while.body.1], [%35, %_6.while.body.2]                     ; inst 15
  %13 = icmp slt i32 %12, %3                                                       ; inst 16
  br i1 %13, label %_6.while.body.2, label %_7.while.exit.2                        ; inst 17
_6.while.body.2:
  %14 = mul i32 %4, %3                                                             ; inst 18
  %15 = add i32 %14, %6                                                            ; inst 19
  %16 = sext i32 %15 to i64                                                        ; inst 20
  %17 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %16                 ; inst 21
  %18 = mul i32 %4, %3                                                             ; inst 22
  %19 = add i32 %18, %6                                                            ; inst 23
  %20 = sext i32 %19 to i64                                                        ; inst 24
  %21 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %20                 ; inst 25
  %22 = load i32, i32* %21                                                         ; inst 26
  %23 = mul i32 %4, %3                                                             ; inst 27
  %24 = add i32 %23, %12                                                           ; inst 28
  %25 = sext i32 %24 to i64                                                        ; inst 29
  %26 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %25                 ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = mul i32 %12, %3                                                            ; inst 32
  %29 = add i32 %28, %6                                                            ; inst 33
  %30 = sext i32 %29 to i64                                                        ; inst 34
  %31 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %30                 ; inst 35
  %32 = load i32, i32* %31                                                         ; inst 36
  %33 = mul i32 %27, %32                                                           ; inst 37
  %34 = add i32 %22, %33                                                           ; inst 38
  store i32 %34, i32* %17                                                          ; inst 39
  %35 = add i32 %12, 1                                                             ; inst 40
  br label %_5.while.cond.2                                                        ; inst 41
_7.while.exit.2:
  %36 = add i32 %6, 1                                                              ; inst 42
  br label %_3.while.cond.1                                                        ; inst 43
_8.while.exit.1:
  %37 = add i32 %4, 1                                                              ; inst 44
  br label %_1.while.cond.0                                                        ; inst 45
_9.while.exit.0:
  ret void                                                                         ; inst 46
}

define void @copyMatrix100([100 x i32]* %0, [100 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %4 = mul i32 %2, %2                                                              ; inst 3
  %5 = icmp slt i32 %3, %4                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 6
  %7 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %6                   ; inst 7
  %8 = sext i32 %3 to i64                                                          ; inst 8
  %9 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %8                   ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  store i32 %10, i32* %7                                                           ; inst 11
  %11 = add i32 %3, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define i32 @calculateMatrixSum100([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 3
  %4 = mul i32 %1, %1                                                              ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = add i32 %3, %8                                                              ; inst 10
  %10 = add i32 %2, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %11 = srem i32 %3, 100000                                                        ; inst 13
  ret i32 %11                                                                      ; inst 14
}

define void @initializeRotationMatrix([64 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%13, %_5.while.exit.1]                           ; inst 2
  %2 = icmp slt i32 %1, 8                                                          ; inst 3
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %3 = phi i32 [0, %_2.while.body.0], [%12, %_4.while.body.1]                      ; inst 6
  %4 = icmp slt i32 %3, 8                                                          ; inst 7
  br i1 %4, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %5 = mul i32 %1, 8                                                               ; inst 9
  %6 = add i32 %5, %3                                                              ; inst 10
  %7 = sext i32 %6 to i64                                                          ; inst 11
  %8 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %7                     ; inst 12
  %9 = mul i32 %1, 10                                                              ; inst 13
  %10 = add i32 %9, %3                                                             ; inst 14
  %11 = add i32 %10, 1                                                             ; inst 15
  store i32 %11, i32* %8                                                           ; inst 16
  %12 = add i32 %3, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %13 = add i32 %1, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define void @rotateMatrix90Degrees([64 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [64 x i32]                                                           ; inst 1
  %3 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 64                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%16, %_5.while.body.0]                      ; inst 12
  %9 = mul i32 %1, %1                                                              ; inst 13
  %10 = icmp slt i32 %8, %9                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 15
_5.while.body.0:
  %11 = sext i32 %8 to i64                                                         ; inst 16
  %12 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %11                   ; inst 17
  %13 = sext i32 %8 to i64                                                         ; inst 18
  %14 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %13                   ; inst 19
  %15 = load i32, i32* %14                                                         ; inst 20
  store i32 %15, i32* %12                                                          ; inst 21
  %16 = add i32 %8, 1                                                              ; inst 22
  br label %_4.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 24
_7.while.cond.1:
  %17 = phi i32 [0, %_6.while.exit.0], [%33, %_11.while.exit.2]                    ; inst 25
  %18 = icmp slt i32 %17, %1                                                       ; inst 26
  br i1 %18, label %_8.while.body.1, label %_12.while.exit.1                       ; inst 27
_8.while.body.1:
  br label %_9.while.cond.2                                                        ; inst 28
_9.while.cond.2:
  %19 = phi i32 [0, %_8.while.body.1], [%32, %_10.while.body.2]                    ; inst 29
  %20 = icmp slt i32 %19, %1                                                       ; inst 30
  br i1 %20, label %_10.while.body.2, label %_11.while.exit.2                      ; inst 31
_10.while.body.2:
  %21 = mul i32 %17, %1                                                            ; inst 32
  %22 = add i32 %21, %19                                                           ; inst 33
  %23 = mul i32 %19, %1                                                            ; inst 34
  %24 = sub i32 %1, 1                                                              ; inst 35
  %25 = sub i32 %24, %17                                                           ; inst 36
  %26 = add i32 %23, %25                                                           ; inst 37
  %27 = sext i32 %26 to i64                                                        ; inst 38
  %28 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %27                   ; inst 39
  %29 = sext i32 %22 to i64                                                        ; inst 40
  %30 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %29                   ; inst 41
  %31 = load i32, i32* %30                                                         ; inst 42
  store i32 %31, i32* %28                                                          ; inst 43
  %32 = add i32 %19, 1                                                             ; inst 44
  br label %_9.while.cond.2                                                        ; inst 45
_11.while.exit.2:
  %33 = add i32 %17, 1                                                             ; inst 46
  br label %_7.while.cond.1                                                        ; inst 47
_12.while.exit.1:
  ret void                                                                         ; inst 48
}

define i32 @calculateMatrixSum64([64 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 3
  %3 = icmp slt i32 %1, 64                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %4                     ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = add i32 %2, %6                                                              ; inst 9
  %8 = add i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  %9 = srem i32 %2, 100000                                                         ; inst 12
  ret i32 %9                                                                       ; inst 13
}

define i32 @calculateDiagonalSums([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%20, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%19, %_2.while.body.0]                           ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 4
  %5 = icmp slt i32 %2, %1                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = mul i32 %2, %1                                                              ; inst 7
  %7 = add i32 %6, %2                                                              ; inst 8
  %8 = sext i32 %7 to i64                                                          ; inst 9
  %9 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %8                   ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  %11 = add i32 %4, %10                                                            ; inst 12
  %12 = mul i32 %2, %1                                                             ; inst 13
  %13 = sub i32 %1, 1                                                              ; inst 14
  %14 = sub i32 %13, %2                                                            ; inst 15
  %15 = add i32 %12, %14                                                           ; inst 16
  %16 = sext i32 %15 to i64                                                        ; inst 17
  %17 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %16                 ; inst 18
  %18 = load i32, i32* %17                                                         ; inst 19
  %19 = add i32 %3, %18                                                            ; inst 20
  %20 = add i32 %2, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_3.while.exit.0:
  %21 = add i32 %4, %3                                                             ; inst 23
  ret i32 %21                                                                      ; inst 24
}

define i32 @calculateMatrixTrace([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = mul i32 %2, %1                                                              ; inst 6
  %6 = add i32 %5, %2                                                              ; inst 7
  %7 = sext i32 %6 to i64                                                          ; inst 8
  %8 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %7                   ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = add i32 %3, %9                                                             ; inst 11
  %11 = add i32 %2, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 14
}

define i32 @calculateMatrixNorm([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%13, %_2.while.body.0]                           ; inst 3
  %4 = mul i32 %1, %1                                                              ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %9                  ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = mul i32 %8, %11                                                            ; inst 13
  %13 = add i32 %3, %12                                                            ; inst 14
  %14 = add i32 %2, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_3.while.exit.0:
  %15 = call i32 @approximateSquareRoot(i32 %3)                                    ; inst 17
  ret i32 %15                                                                      ; inst 18
}

define i32 @approximateSquareRoot(i32 %0) {
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
  %2 = phi i32 [1, %_3.if.exit.0], [%13, %_8.if.exit.1]                            ; inst 6
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

define i32 @absValue(i32 %0) {
_0.entry.0:
  %1 = icmp slt i32 %0, 0                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %2 = sub i32 0, %0                                                               ; inst 3
  ret i32 %2                                                                       ; inst 4
_2.if.else.0:
  ret i32 %0                                                                       ; inst 5
_3.if.exit.0:
  unreachable                                                                      ; inst 6
}

define void @performSparseMatrixOperations() {
_0.entry.0:
  call void @printlnInt(i32 1720)                                                  ; inst 1
  %0 = alloca [200 x i32]                                                          ; inst 2
  %1 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 200                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %6 = alloca [200 x i32]                                                          ; inst 12
  %7 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 200                                                        ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %12 = alloca [200 x i32]                                                         ; inst 22
  %13 = getelementptr [200 x i32], [200 x i32]* %12, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 25
  %15 = icmp slt i32 %14, 200                                                      ; inst 26
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 28
  store i32 0, i32* %16                                                            ; inst 29
  %17 = add i32 %14, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %18 = call i32 @createSparseMatrix([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12) ; inst 32
  call void @printlnInt(i32 %18)                                                   ; inst 33
  call void @printlnInt(i32 1721)                                                  ; inst 34
  %19 = alloca [200 x i32]                                                         ; inst 35
  %20 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i32 0                  ; inst 36
  br label %_10.array.cond.3                                                       ; inst 37
_10.array.cond.3:
  %21 = phi i32 [0, %_9.array.exit.2], [%24, %_11.array.body.3]                    ; inst 38
  %22 = icmp slt i32 %21, 200                                                      ; inst 39
  br i1 %22, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 40
_11.array.body.3:
  %23 = getelementptr i32, i32* %20, i32 %21                                       ; inst 41
  store i32 0, i32* %23                                                            ; inst 42
  %24 = add i32 %21, 1                                                             ; inst 43
  br label %_10.array.cond.3                                                       ; inst 44
_12.array.exit.3:
  %25 = alloca [200 x i32]                                                         ; inst 45
  %26 = getelementptr [200 x i32], [200 x i32]* %25, i32 0, i32 0                  ; inst 46
  br label %_13.array.cond.4                                                       ; inst 47
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 48
  %28 = icmp slt i32 %27, 200                                                      ; inst 49
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 50
_14.array.body.4:
  %29 = getelementptr i32, i32* %26, i32 %27                                       ; inst 51
  store i32 0, i32* %29                                                            ; inst 52
  %30 = add i32 %27, 1                                                             ; inst 53
  br label %_13.array.cond.4                                                       ; inst 54
_15.array.exit.4:
  %31 = alloca [200 x i32]                                                         ; inst 55
  %32 = getelementptr [200 x i32], [200 x i32]* %31, i32 0, i32 0                  ; inst 56
  br label %_16.array.cond.5                                                       ; inst 57
_16.array.cond.5:
  %33 = phi i32 [0, %_15.array.exit.4], [%36, %_17.array.body.5]                   ; inst 58
  %34 = icmp slt i32 %33, 200                                                      ; inst 59
  br i1 %34, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 60
_17.array.body.5:
  %35 = getelementptr i32, i32* %32, i32 %33                                       ; inst 61
  store i32 0, i32* %35                                                            ; inst 62
  %36 = add i32 %33, 1                                                             ; inst 63
  br label %_16.array.cond.5                                                       ; inst 64
_18.array.exit.5:
  %37 = call i32 @createSparseMatrix2([200 x i32]* %19, [200 x i32]* %25, [200 x i32]* %31) ; inst 65
  %38 = alloca [400 x i32]                                                         ; inst 66
  %39 = getelementptr [400 x i32], [400 x i32]* %38, i32 0, i32 0                  ; inst 67
  br label %_19.array.cond.6                                                       ; inst 68
_19.array.cond.6:
  %40 = phi i32 [0, %_18.array.exit.5], [%43, %_20.array.body.6]                   ; inst 69
  %41 = icmp slt i32 %40, 400                                                      ; inst 70
  br i1 %41, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 71
_20.array.body.6:
  %42 = getelementptr i32, i32* %39, i32 %40                                       ; inst 72
  store i32 0, i32* %42                                                            ; inst 73
  %43 = add i32 %40, 1                                                             ; inst 74
  br label %_19.array.cond.6                                                       ; inst 75
_21.array.exit.6:
  %44 = alloca [400 x i32]                                                         ; inst 76
  %45 = getelementptr [400 x i32], [400 x i32]* %44, i32 0, i32 0                  ; inst 77
  br label %_22.array.cond.7                                                       ; inst 78
_22.array.cond.7:
  %46 = phi i32 [0, %_21.array.exit.6], [%49, %_23.array.body.7]                   ; inst 79
  %47 = icmp slt i32 %46, 400                                                      ; inst 80
  br i1 %47, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 81
_23.array.body.7:
  %48 = getelementptr i32, i32* %45, i32 %46                                       ; inst 82
  store i32 0, i32* %48                                                            ; inst 83
  %49 = add i32 %46, 1                                                             ; inst 84
  br label %_22.array.cond.7                                                       ; inst 85
_24.array.exit.7:
  %50 = alloca [400 x i32]                                                         ; inst 86
  %51 = getelementptr [400 x i32], [400 x i32]* %50, i32 0, i32 0                  ; inst 87
  br label %_25.array.cond.8                                                       ; inst 88
_25.array.cond.8:
  %52 = phi i32 [0, %_24.array.exit.7], [%55, %_26.array.body.8]                   ; inst 89
  %53 = icmp slt i32 %52, 400                                                      ; inst 90
  br i1 %53, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 91
_26.array.body.8:
  %54 = getelementptr i32, i32* %51, i32 %52                                       ; inst 92
  store i32 0, i32* %54                                                            ; inst 93
  %55 = add i32 %52, 1                                                             ; inst 94
  br label %_25.array.cond.8                                                       ; inst 95
_27.array.exit.8:
  %56 = call i32 @sparseMatrixAddition([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, i32 %18, [200 x i32]* %19, [200 x i32]* %25, [200 x i32]* %31, i32 %37, [400 x i32]* %38, [400 x i32]* %44, [400 x i32]* %50) ; inst 96
  call void @printlnInt(i32 %56)                                                   ; inst 97
  call void @printlnInt(i32 1722)                                                  ; inst 98
  %57 = alloca [200 x i32]                                                         ; inst 99
  %58 = getelementptr [200 x i32], [200 x i32]* %57, i32 0, i32 0                  ; inst 100
  br label %_28.array.cond.9                                                       ; inst 101
_28.array.cond.9:
  %59 = phi i32 [0, %_27.array.exit.8], [%62, %_29.array.body.9]                   ; inst 102
  %60 = icmp slt i32 %59, 200                                                      ; inst 103
  br i1 %60, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 104
_29.array.body.9:
  %61 = getelementptr i32, i32* %58, i32 %59                                       ; inst 105
  store i32 0, i32* %61                                                            ; inst 106
  %62 = add i32 %59, 1                                                             ; inst 107
  br label %_28.array.cond.9                                                       ; inst 108
_30.array.exit.9:
  %63 = alloca [200 x i32]                                                         ; inst 109
  %64 = getelementptr [200 x i32], [200 x i32]* %63, i32 0, i32 0                  ; inst 110
  br label %_31.array.cond.10                                                      ; inst 111
_31.array.cond.10:
  %65 = phi i32 [0, %_30.array.exit.9], [%68, %_32.array.body.10]                  ; inst 112
  %66 = icmp slt i32 %65, 200                                                      ; inst 113
  br i1 %66, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 114
_32.array.body.10:
  %67 = getelementptr i32, i32* %64, i32 %65                                       ; inst 115
  store i32 0, i32* %67                                                            ; inst 116
  %68 = add i32 %65, 1                                                             ; inst 117
  br label %_31.array.cond.10                                                      ; inst 118
_33.array.exit.10:
  %69 = alloca [200 x i32]                                                         ; inst 119
  %70 = getelementptr [200 x i32], [200 x i32]* %69, i32 0, i32 0                  ; inst 120
  br label %_34.array.cond.11                                                      ; inst 121
_34.array.cond.11:
  %71 = phi i32 [0, %_33.array.exit.10], [%74, %_35.array.body.11]                 ; inst 122
  %72 = icmp slt i32 %71, 200                                                      ; inst 123
  br i1 %72, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 124
_35.array.body.11:
  %73 = getelementptr i32, i32* %70, i32 %71                                       ; inst 125
  store i32 0, i32* %73                                                            ; inst 126
  %74 = add i32 %71, 1                                                             ; inst 127
  br label %_34.array.cond.11                                                      ; inst 128
_36.array.exit.11:
  call void @sparseMatrixTranspose([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, i32 %18, [200 x i32]* %57, [200 x i32]* %63, [200 x i32]* %69) ; inst 129
  %75 = call i32 @calculateSparseSum([200 x i32]* %69, i32 %18)                    ; inst 130
  call void @printlnInt(i32 %75)                                                   ; inst 131
  call void @printlnInt(i32 1723)                                                  ; inst 132
  %76 = call i32 @sparseMatrixMultiplication([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, i32 %18, [200 x i32]* %57, [200 x i32]* %63, [200 x i32]* %69, i32 %18) ; inst 133
  call void @printlnInt(i32 %76)                                                   ; inst 134
  ret void                                                                         ; inst 135
}

define i32 @createSparseMatrix([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%46, %_20.if.exit.1]                             ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%47, %_20.if.exit.1]                             ; inst 3
  %5 = icmp slt i32 %4, 30                                                         ; inst 4
  br i1 %5, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 5
_2.lazy.then.0:
  %6 = icmp slt i32 %3, 200                                                        ; inst 6
  br label %_4.lazy.exit.0                                                         ; inst 7
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 8
_4.lazy.exit.0:
  %7 = phi i1 [%6, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 9
  br i1 %7, label %_5.while.body.0, label %_21.while.exit.0                        ; inst 10
_5.while.body.0:
  %8 = sext i32 %3 to i64                                                          ; inst 11
  %9 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %8                   ; inst 12
  store i32 %4, i32* %9                                                            ; inst 13
  %10 = sext i32 %3 to i64                                                         ; inst 14
  %11 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %10                 ; inst 15
  store i32 %4, i32* %11                                                           ; inst 16
  %12 = sext i32 %3 to i64                                                         ; inst 17
  %13 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %12                 ; inst 18
  %14 = add i32 %4, 10                                                             ; inst 19
  store i32 %14, i32* %13                                                          ; inst 20
  %15 = add i32 %3, 1                                                              ; inst 21
  %16 = add i32 %4, 1                                                              ; inst 22
  %17 = icmp slt i32 %16, 30                                                       ; inst 23
  br i1 %17, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 24
_6.lazy.then.1:
  %18 = icmp slt i32 %15, 200                                                      ; inst 25
  br label %_8.lazy.exit.1                                                         ; inst 26
_7.lazy.else.1:
  br label %_8.lazy.exit.1                                                         ; inst 27
_8.lazy.exit.1:
  %19 = phi i1 [%18, %_6.lazy.then.1], [0, %_7.lazy.else.1]                        ; inst 28
  br i1 %19, label %_9.if.then.0, label %_10.if.else.0                             ; inst 29
_9.if.then.0:
  %20 = sext i32 %15 to i64                                                        ; inst 30
  %21 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %20                 ; inst 31
  store i32 %4, i32* %21                                                           ; inst 32
  %22 = sext i32 %15 to i64                                                        ; inst 33
  %23 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %22                 ; inst 34
  %24 = add i32 %4, 1                                                              ; inst 35
  store i32 %24, i32* %23                                                          ; inst 36
  %25 = sext i32 %15 to i64                                                        ; inst 37
  %26 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %25                 ; inst 38
  %27 = add i32 %4, 5                                                              ; inst 39
  store i32 %27, i32* %26                                                          ; inst 40
  %28 = add i32 %15, 1                                                             ; inst 41
  br label %_11.if.exit.0                                                          ; inst 42
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 43
_11.if.exit.0:
  %29 = phi i32 [%28, %_9.if.then.0], [%15, %_10.if.else.0]                        ; inst 44
  %30 = srem i32 %4, 3                                                             ; inst 45
  %31 = icmp eq i32 %30, 0                                                         ; inst 46
  br i1 %31, label %_12.lazy.then.2, label %_13.lazy.else.2                        ; inst 47
_12.lazy.then.2:
  %32 = add i32 %4, 5                                                              ; inst 48
  %33 = icmp slt i32 %32, 30                                                       ; inst 49
  br label %_14.lazy.exit.2                                                        ; inst 50
_13.lazy.else.2:
  br label %_14.lazy.exit.2                                                        ; inst 51
_14.lazy.exit.2:
  %34 = phi i1 [%33, %_12.lazy.then.2], [0, %_13.lazy.else.2]                      ; inst 52
  br i1 %34, label %_15.lazy.then.3, label %_16.lazy.else.3                        ; inst 53
_15.lazy.then.3:
  %35 = icmp slt i32 %29, 200                                                      ; inst 54
  br label %_17.lazy.exit.3                                                        ; inst 55
_16.lazy.else.3:
  br label %_17.lazy.exit.3                                                        ; inst 56
_17.lazy.exit.3:
  %36 = phi i1 [%35, %_15.lazy.then.3], [0, %_16.lazy.else.3]                      ; inst 57
  br i1 %36, label %_18.if.then.1, label %_19.if.else.1                            ; inst 58
_18.if.then.1:
  %37 = sext i32 %29 to i64                                                        ; inst 59
  %38 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %37                 ; inst 60
  store i32 %4, i32* %38                                                           ; inst 61
  %39 = sext i32 %29 to i64                                                        ; inst 62
  %40 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %39                 ; inst 63
  %41 = add i32 %4, 5                                                              ; inst 64
  store i32 %41, i32* %40                                                          ; inst 65
  %42 = sext i32 %29 to i64                                                        ; inst 66
  %43 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %42                 ; inst 67
  %44 = mul i32 %4, 2                                                              ; inst 68
  store i32 %44, i32* %43                                                          ; inst 69
  %45 = add i32 %29, 1                                                             ; inst 70
  br label %_20.if.exit.1                                                          ; inst 71
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 72
_20.if.exit.1:
  %46 = phi i32 [%45, %_18.if.then.1], [%29, %_19.if.else.1]                       ; inst 73
  %47 = add i32 %4, 1                                                              ; inst 74
  br label %_1.while.cond.0                                                        ; inst 75
_21.while.exit.0:
  ret i32 %3                                                                       ; inst 76
}

define i32 @createSparseMatrix2([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%36, %_17.if.exit.1]                             ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%35, %_17.if.exit.1]                             ; inst 3
  %5 = icmp slt i32 %3, 30                                                         ; inst 4
  br i1 %5, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 5
_2.lazy.then.0:
  %6 = icmp slt i32 %4, 200                                                        ; inst 6
  br label %_4.lazy.exit.0                                                         ; inst 7
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 8
_4.lazy.exit.0:
  %7 = phi i1 [%6, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 9
  br i1 %7, label %_5.while.body.0, label %_18.while.exit.0                        ; inst 10
_5.while.body.0:
  %8 = add i32 %3, %3                                                              ; inst 11
  %9 = icmp slt i32 %8, 30                                                         ; inst 12
  br i1 %9, label %_6.lazy.then.1, label %_7.lazy.else.1                           ; inst 13
_6.lazy.then.1:
  %10 = icmp slt i32 %4, 200                                                       ; inst 14
  br label %_8.lazy.exit.1                                                         ; inst 15
_7.lazy.else.1:
  br label %_8.lazy.exit.1                                                         ; inst 16
_8.lazy.exit.1:
  %11 = phi i1 [%10, %_6.lazy.then.1], [0, %_7.lazy.else.1]                        ; inst 17
  br i1 %11, label %_9.if.then.0, label %_10.if.else.0                             ; inst 18
_9.if.then.0:
  %12 = sext i32 %4 to i64                                                         ; inst 19
  %13 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %12                 ; inst 20
  store i32 %3, i32* %13                                                           ; inst 21
  %14 = sext i32 %4 to i64                                                         ; inst 22
  %15 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %14                 ; inst 23
  %16 = sub i32 29, %3                                                             ; inst 24
  store i32 %16, i32* %15                                                          ; inst 25
  %17 = sext i32 %4 to i64                                                         ; inst 26
  %18 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %17                 ; inst 27
  %19 = add i32 %3, 3                                                              ; inst 28
  store i32 %19, i32* %18                                                          ; inst 29
  %20 = add i32 %4, 1                                                              ; inst 30
  br label %_11.if.exit.0                                                          ; inst 31
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 32
_11.if.exit.0:
  %21 = phi i32 [%20, %_9.if.then.0], [%4, %_10.if.else.0]                         ; inst 33
  %22 = srem i32 %3, 4                                                             ; inst 34
  %23 = icmp eq i32 %22, 0                                                         ; inst 35
  br i1 %23, label %_12.lazy.then.2, label %_13.lazy.else.2                        ; inst 36
_12.lazy.then.2:
  %24 = icmp slt i32 %21, 200                                                      ; inst 37
  br label %_14.lazy.exit.2                                                        ; inst 38
_13.lazy.else.2:
  br label %_14.lazy.exit.2                                                        ; inst 39
_14.lazy.exit.2:
  %25 = phi i1 [%24, %_12.lazy.then.2], [0, %_13.lazy.else.2]                      ; inst 40
  br i1 %25, label %_15.if.then.1, label %_16.if.else.1                            ; inst 41
_15.if.then.1:
  %26 = sext i32 %21 to i64                                                        ; inst 42
  %27 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %26                 ; inst 43
  store i32 %3, i32* %27                                                           ; inst 44
  %28 = sext i32 %21 to i64                                                        ; inst 45
  %29 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %28                 ; inst 46
  %30 = sdiv i32 %3, 2                                                             ; inst 47
  store i32 %30, i32* %29                                                          ; inst 48
  %31 = sext i32 %21 to i64                                                        ; inst 49
  %32 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %31                 ; inst 50
  %33 = mul i32 %3, 3                                                              ; inst 51
  store i32 %33, i32* %32                                                          ; inst 52
  %34 = add i32 %21, 1                                                             ; inst 53
  br label %_17.if.exit.1                                                          ; inst 54
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 55
_17.if.exit.1:
  %35 = phi i32 [%34, %_15.if.then.1], [%21, %_16.if.else.1]                       ; inst 56
  %36 = add i32 %3, 1                                                              ; inst 57
  br label %_1.while.cond.0                                                        ; inst 58
_18.while.exit.0:
  ret i32 %4                                                                       ; inst 59
}

define i32 @sparseMatrixAddition([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, i32 %3, [200 x i32]* %4, [200 x i32]* %5, [200 x i32]* %6, i32 %7, [400 x i32]* %8, [400 x i32]* %9, [400 x i32]* %10) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %11 = phi i32 [0, %_0.entry.0], [%96, %_14.if.exit.0]                            ; inst 2
  %12 = phi i32 [0, %_0.entry.0], [%97, %_14.if.exit.0]                            ; inst 3
  %13 = phi i32 [0, %_0.entry.0], [%98, %_14.if.exit.0]                            ; inst 4
  %14 = icmp slt i32 %12, %3                                                       ; inst 5
  br i1 %14, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 6
_2.lazy.then.0:
  %15 = icmp slt i32 %11, %7                                                       ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %16 = phi i1 [%15, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 10
  br i1 %16, label %_5.lazy.then.1, label %_6.lazy.else.1                          ; inst 11
_5.lazy.then.1:
  %17 = icmp slt i32 %13, 400                                                      ; inst 12
  br label %_7.lazy.exit.1                                                         ; inst 13
_6.lazy.else.1:
  br label %_7.lazy.exit.1                                                         ; inst 14
_7.lazy.exit.1:
  %18 = phi i1 [%17, %_5.lazy.then.1], [0, %_6.lazy.else.1]                        ; inst 15
  br i1 %18, label %_8.while.body.0, label %_15.while.exit.0                       ; inst 16
_8.while.body.0:
  %19 = sext i32 %12 to i64                                                        ; inst 17
  %20 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %19                 ; inst 18
  %21 = load i32, i32* %20                                                         ; inst 19
  %22 = mul i32 %21, 100                                                           ; inst 20
  %23 = sext i32 %12 to i64                                                        ; inst 21
  %24 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %23                 ; inst 22
  %25 = load i32, i32* %24                                                         ; inst 23
  %26 = add i32 %22, %25                                                           ; inst 24
  %27 = sext i32 %11 to i64                                                        ; inst 25
  %28 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %27                 ; inst 26
  %29 = load i32, i32* %28                                                         ; inst 27
  %30 = mul i32 %29, 100                                                           ; inst 28
  %31 = sext i32 %11 to i64                                                        ; inst 29
  %32 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %31                 ; inst 30
  %33 = load i32, i32* %32                                                         ; inst 31
  %34 = add i32 %30, %33                                                           ; inst 32
  %35 = icmp slt i32 %26, %34                                                      ; inst 33
  br i1 %35, label %_9.if.then.0, label %_10.if.else.0                             ; inst 34
_9.if.then.0:
  %36 = sext i32 %13 to i64                                                        ; inst 35
  %37 = getelementptr [400 x i32], [400 x i32]* %8, i32 0, i64 %36                 ; inst 36
  %38 = sext i32 %12 to i64                                                        ; inst 37
  %39 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %38                 ; inst 38
  %40 = load i32, i32* %39                                                         ; inst 39
  store i32 %40, i32* %37                                                          ; inst 40
  %41 = sext i32 %13 to i64                                                        ; inst 41
  %42 = getelementptr [400 x i32], [400 x i32]* %9, i32 0, i64 %41                 ; inst 42
  %43 = sext i32 %12 to i64                                                        ; inst 43
  %44 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %43                 ; inst 44
  %45 = load i32, i32* %44                                                         ; inst 45
  store i32 %45, i32* %42                                                          ; inst 46
  %46 = sext i32 %13 to i64                                                        ; inst 47
  %47 = getelementptr [400 x i32], [400 x i32]* %10, i32 0, i64 %46                ; inst 48
  %48 = sext i32 %12 to i64                                                        ; inst 49
  %49 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %48                 ; inst 50
  %50 = load i32, i32* %49                                                         ; inst 51
  store i32 %50, i32* %47                                                          ; inst 52
  %51 = add i32 %13, 1                                                             ; inst 53
  %52 = add i32 %12, 1                                                             ; inst 54
  br label %_14.if.exit.0                                                          ; inst 55
_10.if.else.0:
  %53 = icmp sgt i32 %26, %34                                                      ; inst 56
  br i1 %53, label %_11.if.then.1, label %_12.if.else.1                            ; inst 57
_11.if.then.1:
  %54 = sext i32 %13 to i64                                                        ; inst 58
  %55 = getelementptr [400 x i32], [400 x i32]* %8, i32 0, i64 %54                 ; inst 59
  %56 = sext i32 %11 to i64                                                        ; inst 60
  %57 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %56                 ; inst 61
  %58 = load i32, i32* %57                                                         ; inst 62
  store i32 %58, i32* %55                                                          ; inst 63
  %59 = sext i32 %13 to i64                                                        ; inst 64
  %60 = getelementptr [400 x i32], [400 x i32]* %9, i32 0, i64 %59                 ; inst 65
  %61 = sext i32 %11 to i64                                                        ; inst 66
  %62 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %61                 ; inst 67
  %63 = load i32, i32* %62                                                         ; inst 68
  store i32 %63, i32* %60                                                          ; inst 69
  %64 = sext i32 %13 to i64                                                        ; inst 70
  %65 = getelementptr [400 x i32], [400 x i32]* %10, i32 0, i64 %64                ; inst 71
  %66 = sext i32 %11 to i64                                                        ; inst 72
  %67 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %66                 ; inst 73
  %68 = load i32, i32* %67                                                         ; inst 74
  store i32 %68, i32* %65                                                          ; inst 75
  %69 = add i32 %13, 1                                                             ; inst 76
  %70 = add i32 %11, 1                                                             ; inst 77
  br label %_13.if.exit.1                                                          ; inst 78
_12.if.else.1:
  %71 = sext i32 %13 to i64                                                        ; inst 79
  %72 = getelementptr [400 x i32], [400 x i32]* %8, i32 0, i64 %71                 ; inst 80
  %73 = sext i32 %12 to i64                                                        ; inst 81
  %74 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %73                 ; inst 82
  %75 = load i32, i32* %74                                                         ; inst 83
  store i32 %75, i32* %72                                                          ; inst 84
  %76 = sext i32 %13 to i64                                                        ; inst 85
  %77 = getelementptr [400 x i32], [400 x i32]* %9, i32 0, i64 %76                 ; inst 86
  %78 = sext i32 %12 to i64                                                        ; inst 87
  %79 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %78                 ; inst 88
  %80 = load i32, i32* %79                                                         ; inst 89
  store i32 %80, i32* %77                                                          ; inst 90
  %81 = sext i32 %13 to i64                                                        ; inst 91
  %82 = getelementptr [400 x i32], [400 x i32]* %10, i32 0, i64 %81                ; inst 92
  %83 = sext i32 %12 to i64                                                        ; inst 93
  %84 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %83                 ; inst 94
  %85 = load i32, i32* %84                                                         ; inst 95
  %86 = sext i32 %11 to i64                                                        ; inst 96
  %87 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %86                 ; inst 97
  %88 = load i32, i32* %87                                                         ; inst 98
  %89 = add i32 %85, %88                                                           ; inst 99
  store i32 %89, i32* %82                                                          ; inst 100
  %90 = add i32 %13, 1                                                             ; inst 101
  %91 = add i32 %12, 1                                                             ; inst 102
  %92 = add i32 %11, 1                                                             ; inst 103
  br label %_13.if.exit.1                                                          ; inst 104
_13.if.exit.1:
  %93 = phi i32 [%70, %_11.if.then.1], [%92, %_12.if.else.1]                       ; inst 105
  %94 = phi i32 [%12, %_11.if.then.1], [%91, %_12.if.else.1]                       ; inst 106
  %95 = phi i32 [%69, %_11.if.then.1], [%90, %_12.if.else.1]                       ; inst 107
  br label %_14.if.exit.0                                                          ; inst 108
_14.if.exit.0:
  %96 = phi i32 [%11, %_9.if.then.0], [%93, %_13.if.exit.1]                        ; inst 109
  %97 = phi i32 [%52, %_9.if.then.0], [%94, %_13.if.exit.1]                        ; inst 110
  %98 = phi i32 [%51, %_9.if.then.0], [%95, %_13.if.exit.1]                        ; inst 111
  br label %_1.while.cond.0                                                        ; inst 112
_15.while.exit.0:
  br label %_16.while.cond.1                                                       ; inst 113
_16.while.cond.1:
  %99 = phi i32 [%12, %_15.while.exit.0], [%120, %_20.while.body.1]                ; inst 114
  %100 = phi i32 [%13, %_15.while.exit.0], [%119, %_20.while.body.1]               ; inst 115
  %101 = icmp slt i32 %99, %3                                                      ; inst 116
  br i1 %101, label %_17.lazy.then.2, label %_18.lazy.else.2                       ; inst 117
_17.lazy.then.2:
  %102 = icmp slt i32 %100, 400                                                    ; inst 118
  br label %_19.lazy.exit.2                                                        ; inst 119
_18.lazy.else.2:
  br label %_19.lazy.exit.2                                                        ; inst 120
_19.lazy.exit.2:
  %103 = phi i1 [%102, %_17.lazy.then.2], [0, %_18.lazy.else.2]                    ; inst 121
  br i1 %103, label %_20.while.body.1, label %_21.while.exit.1                     ; inst 122
_20.while.body.1:
  %104 = sext i32 %100 to i64                                                      ; inst 123
  %105 = getelementptr [400 x i32], [400 x i32]* %8, i32 0, i64 %104               ; inst 124
  %106 = sext i32 %99 to i64                                                       ; inst 125
  %107 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %106               ; inst 126
  %108 = load i32, i32* %107                                                       ; inst 127
  store i32 %108, i32* %105                                                        ; inst 128
  %109 = sext i32 %100 to i64                                                      ; inst 129
  %110 = getelementptr [400 x i32], [400 x i32]* %9, i32 0, i64 %109               ; inst 130
  %111 = sext i32 %99 to i64                                                       ; inst 131
  %112 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %111               ; inst 132
  %113 = load i32, i32* %112                                                       ; inst 133
  store i32 %113, i32* %110                                                        ; inst 134
  %114 = sext i32 %100 to i64                                                      ; inst 135
  %115 = getelementptr [400 x i32], [400 x i32]* %10, i32 0, i64 %114              ; inst 136
  %116 = sext i32 %99 to i64                                                       ; inst 137
  %117 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %116               ; inst 138
  %118 = load i32, i32* %117                                                       ; inst 139
  store i32 %118, i32* %115                                                        ; inst 140
  %119 = add i32 %100, 1                                                           ; inst 141
  %120 = add i32 %99, 1                                                            ; inst 142
  br label %_16.while.cond.1                                                       ; inst 143
_21.while.exit.1:
  br label %_22.while.cond.2                                                       ; inst 144
_22.while.cond.2:
  %121 = phi i32 [%11, %_21.while.exit.1], [%142, %_26.while.body.2]               ; inst 145
  %122 = phi i32 [%100, %_21.while.exit.1], [%141, %_26.while.body.2]              ; inst 146
  %123 = icmp slt i32 %121, %7                                                     ; inst 147
  br i1 %123, label %_23.lazy.then.3, label %_24.lazy.else.3                       ; inst 148
_23.lazy.then.3:
  %124 = icmp slt i32 %122, 400                                                    ; inst 149
  br label %_25.lazy.exit.3                                                        ; inst 150
_24.lazy.else.3:
  br label %_25.lazy.exit.3                                                        ; inst 151
_25.lazy.exit.3:
  %125 = phi i1 [%124, %_23.lazy.then.3], [0, %_24.lazy.else.3]                    ; inst 152
  br i1 %125, label %_26.while.body.2, label %_27.while.exit.2                     ; inst 153
_26.while.body.2:
  %126 = sext i32 %122 to i64                                                      ; inst 154
  %127 = getelementptr [400 x i32], [400 x i32]* %8, i32 0, i64 %126               ; inst 155
  %128 = sext i32 %121 to i64                                                      ; inst 156
  %129 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %128               ; inst 157
  %130 = load i32, i32* %129                                                       ; inst 158
  store i32 %130, i32* %127                                                        ; inst 159
  %131 = sext i32 %122 to i64                                                      ; inst 160
  %132 = getelementptr [400 x i32], [400 x i32]* %9, i32 0, i64 %131               ; inst 161
  %133 = sext i32 %121 to i64                                                      ; inst 162
  %134 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %133               ; inst 163
  %135 = load i32, i32* %134                                                       ; inst 164
  store i32 %135, i32* %132                                                        ; inst 165
  %136 = sext i32 %122 to i64                                                      ; inst 166
  %137 = getelementptr [400 x i32], [400 x i32]* %10, i32 0, i64 %136              ; inst 167
  %138 = sext i32 %121 to i64                                                      ; inst 168
  %139 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %138               ; inst 169
  %140 = load i32, i32* %139                                                       ; inst 170
  store i32 %140, i32* %137                                                        ; inst 171
  %141 = add i32 %122, 1                                                           ; inst 172
  %142 = add i32 %121, 1                                                           ; inst 173
  br label %_22.while.cond.2                                                       ; inst 174
_27.while.exit.2:
  ret i32 %122                                                                     ; inst 175
}

define void @sparseMatrixTranspose([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, i32 %3, [200 x i32]* %4, [200 x i32]* %5, [200 x i32]* %6) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%24, %_2.while.body.0]                           ; inst 2
  %8 = icmp slt i32 %7, %3                                                         ; inst 3
  br i1 %8, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %9 = sext i32 %7 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %9                  ; inst 6
  %11 = sext i32 %7 to i64                                                         ; inst 7
  %12 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %11                 ; inst 8
  %13 = load i32, i32* %12                                                         ; inst 9
  store i32 %13, i32* %10                                                          ; inst 10
  %14 = sext i32 %7 to i64                                                         ; inst 11
  %15 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %14                 ; inst 12
  %16 = sext i32 %7 to i64                                                         ; inst 13
  %17 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %16                 ; inst 14
  %18 = load i32, i32* %17                                                         ; inst 15
  store i32 %18, i32* %15                                                          ; inst 16
  %19 = sext i32 %7 to i64                                                         ; inst 17
  %20 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %19                 ; inst 18
  %21 = sext i32 %7 to i64                                                         ; inst 19
  %22 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %21                 ; inst 20
  %23 = load i32, i32* %22                                                         ; inst 21
  store i32 %23, i32* %20                                                          ; inst 22
  %24 = add i32 %7, 1                                                              ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 25
_4.while.cond.1:
  %25 = phi i32 [1, %_3.while.exit.0], [%27, %_11.while.exit.2]                    ; inst 26
  %26 = icmp eq i32 %25, 1                                                         ; inst 27
  br i1 %26, label %_5.while.body.1, label %_12.while.exit.1                       ; inst 28
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 29
_6.while.cond.2:
  %27 = phi i32 [0, %_5.while.body.1], [%86, %_10.if.exit.0]                       ; inst 30
  %28 = phi i32 [0, %_5.while.body.1], [%87, %_10.if.exit.0]                       ; inst 31
  %29 = sub i32 %3, 1                                                              ; inst 32
  %30 = icmp slt i32 %28, %29                                                      ; inst 33
  br i1 %30, label %_7.while.body.2, label %_11.while.exit.2                       ; inst 34
_7.while.body.2:
  %31 = sext i32 %28 to i64                                                        ; inst 35
  %32 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %31                 ; inst 36
  %33 = load i32, i32* %32                                                         ; inst 37
  %34 = mul i32 %33, 100                                                           ; inst 38
  %35 = sext i32 %28 to i64                                                        ; inst 39
  %36 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %35                 ; inst 40
  %37 = load i32, i32* %36                                                         ; inst 41
  %38 = add i32 %34, %37                                                           ; inst 42
  %39 = sext i32 %28 to i64                                                        ; inst 43
  %40 = add i64 %39, 1                                                             ; inst 44
  %41 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %40                 ; inst 45
  %42 = load i32, i32* %41                                                         ; inst 46
  %43 = mul i32 %42, 100                                                           ; inst 47
  %44 = sext i32 %28 to i64                                                        ; inst 48
  %45 = add i64 %44, 1                                                             ; inst 49
  %46 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %45                 ; inst 50
  %47 = load i32, i32* %46                                                         ; inst 51
  %48 = add i32 %43, %47                                                           ; inst 52
  %49 = icmp sgt i32 %38, %48                                                      ; inst 53
  br i1 %49, label %_8.if.then.0, label %_9.if.else.0                              ; inst 54
_8.if.then.0:
  %50 = sext i32 %28 to i64                                                        ; inst 55
  %51 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %50                 ; inst 56
  %52 = load i32, i32* %51                                                         ; inst 57
  %53 = sext i32 %28 to i64                                                        ; inst 58
  %54 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %53                 ; inst 59
  %55 = load i32, i32* %54                                                         ; inst 60
  %56 = sext i32 %28 to i64                                                        ; inst 61
  %57 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %56                 ; inst 62
  %58 = load i32, i32* %57                                                         ; inst 63
  %59 = sext i32 %28 to i64                                                        ; inst 64
  %60 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %59                 ; inst 65
  %61 = sext i32 %28 to i64                                                        ; inst 66
  %62 = add i64 %61, 1                                                             ; inst 67
  %63 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %62                 ; inst 68
  %64 = load i32, i32* %63                                                         ; inst 69
  store i32 %64, i32* %60                                                          ; inst 70
  %65 = sext i32 %28 to i64                                                        ; inst 71
  %66 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %65                 ; inst 72
  %67 = sext i32 %28 to i64                                                        ; inst 73
  %68 = add i64 %67, 1                                                             ; inst 74
  %69 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %68                 ; inst 75
  %70 = load i32, i32* %69                                                         ; inst 76
  store i32 %70, i32* %66                                                          ; inst 77
  %71 = sext i32 %28 to i64                                                        ; inst 78
  %72 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %71                 ; inst 79
  %73 = sext i32 %28 to i64                                                        ; inst 80
  %74 = add i64 %73, 1                                                             ; inst 81
  %75 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %74                 ; inst 82
  %76 = load i32, i32* %75                                                         ; inst 83
  store i32 %76, i32* %72                                                          ; inst 84
  %77 = sext i32 %28 to i64                                                        ; inst 85
  %78 = add i64 %77, 1                                                             ; inst 86
  %79 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %78                 ; inst 87
  store i32 %52, i32* %79                                                          ; inst 88
  %80 = sext i32 %28 to i64                                                        ; inst 89
  %81 = add i64 %80, 1                                                             ; inst 90
  %82 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %81                 ; inst 91
  store i32 %55, i32* %82                                                          ; inst 92
  %83 = sext i32 %28 to i64                                                        ; inst 93
  %84 = add i64 %83, 1                                                             ; inst 94
  %85 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %84                 ; inst 95
  store i32 %58, i32* %85                                                          ; inst 96
  br label %_10.if.exit.0                                                          ; inst 97
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 98
_10.if.exit.0:
  %86 = phi i32 [1, %_8.if.then.0], [%27, %_9.if.else.0]                           ; inst 99
  %87 = add i32 %28, 1                                                             ; inst 100
  br label %_6.while.cond.2                                                        ; inst 101
_11.while.exit.2:
  br label %_4.while.cond.1                                                        ; inst 102
_12.while.exit.1:
  ret void                                                                         ; inst 103
}

define i32 @calculateSparseSum([200 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %5                   ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = add i32 %3, %7                                                              ; inst 9
  %9 = add i32 %2, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  %10 = srem i32 %3, 100000                                                        ; inst 12
  ret i32 %10                                                                      ; inst 13
}

define i32 @sparseMatrixMultiplication([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, i32 %3, [200 x i32]* %4, [200 x i32]* %5, [200 x i32]* %6, i32 %7) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%18, %_8.while.exit.1]                           ; inst 2
  %9 = phi i32 [0, %_0.entry.0], [%31, %_8.while.exit.1]                           ; inst 3
  %10 = icmp slt i32 %9, %3                                                        ; inst 4
  br i1 %10, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 5
_2.while.body.0:
  %11 = sext i32 %9 to i64                                                         ; inst 6
  %12 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %11                 ; inst 7
  %13 = load i32, i32* %12                                                         ; inst 8
  %14 = sext i32 %9 to i64                                                         ; inst 9
  %15 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %14                 ; inst 10
  %16 = load i32, i32* %15                                                         ; inst 11
  br label %_3.while.cond.1                                                        ; inst 12
_3.while.cond.1:
  %17 = phi i32 [0, %_2.while.body.0], [%30, %_7.if.exit.0]                        ; inst 13
  %18 = phi i32 [%8, %_2.while.body.0], [%29, %_7.if.exit.0]                       ; inst 14
  %19 = icmp slt i32 %17, %7                                                       ; inst 15
  br i1 %19, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 16
_4.while.body.1:
  %20 = sext i32 %17 to i64                                                        ; inst 17
  %21 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %20                 ; inst 18
  %22 = load i32, i32* %21                                                         ; inst 19
  %23 = icmp eq i32 %22, %13                                                       ; inst 20
  br i1 %23, label %_5.if.then.0, label %_6.if.else.0                              ; inst 21
_5.if.then.0:
  %24 = sext i32 %17 to i64                                                        ; inst 22
  %25 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 %24                 ; inst 23
  %26 = load i32, i32* %25                                                         ; inst 24
  %27 = mul i32 %16, %26                                                           ; inst 25
  %28 = add i32 %18, %27                                                           ; inst 26
  br label %_7.if.exit.0                                                           ; inst 27
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 28
_7.if.exit.0:
  %29 = phi i32 [%28, %_5.if.then.0], [%18, %_6.if.else.0]                         ; inst 29
  %30 = add i32 %17, 1                                                             ; inst 30
  br label %_3.while.cond.1                                                        ; inst 31
_8.while.exit.1:
  %31 = add i32 %9, 1                                                              ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_9.while.exit.0:
  %32 = srem i32 %8, 100000                                                        ; inst 34
  ret i32 %32                                                                      ; inst 35
}

define void @performMatrixPerformanceBenchmarks() {
_0.entry.0:
  call void @printlnInt(i32 1730)                                                  ; inst 1
  call void @printlnInt(i32 1731)                                                  ; inst 2
  call void @performLargeMatrixBenchmark()                                         ; inst 3
  call void @printlnInt(i32 1732)                                                  ; inst 4
  call void @performRepeatedOperationsBenchmark()                                  ; inst 5
  call void @printlnInt(i32 1733)                                                  ; inst 6
  call void @performMemoryAccessBenchmark()                                        ; inst 7
  ret void                                                                         ; inst 8
}

define void @performLargeMatrixBenchmark() {
_0.entry.0:
  %0 = alloca [625 x i32]                                                          ; inst 1
  %1 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 625                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [625 x i32]                                                          ; inst 11
  %7 = getelementptr [625 x i32], [625 x i32]* %6, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 625                                                        ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [625 x i32]                                                         ; inst 21
  %13 = getelementptr [625 x i32], [625 x i32]* %12, i32 0, i32 0                  ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 625                                                      ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  call void @initializeLargeMatrices([625 x i32]* %0, [625 x i32]* %6, i32 25)     ; inst 31
  br label %_10.while.cond.0                                                       ; inst 32
_10.while.cond.0:
  %18 = phi i32 [0, %_9.array.exit.2], [%20, %_11.while.body.0]                    ; inst 33
  %19 = icmp slt i32 %18, 3                                                        ; inst 34
  br i1 %19, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 35
_11.while.body.0:
  call void @matrixMultiplication625([625 x i32]* %0, [625 x i32]* %6, [625 x i32]* %12, i32 25) ; inst 36
  call void @copyMatrix625([625 x i32]* %12, [625 x i32]* %0, i32 25)              ; inst 37
  %20 = add i32 %18, 1                                                             ; inst 38
  br label %_10.while.cond.0                                                       ; inst 39
_12.while.exit.0:
  %21 = call i32 @calculateMatrixSum625([625 x i32]* %12, i32 25)                  ; inst 40
  call void @printlnInt(i32 %21)                                                   ; inst 41
  ret void                                                                         ; inst 42
}

define void @initializeLargeMatrices([625 x i32]* %0, [625 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%20, %_5.while.exit.1]                           ; inst 2
  %4 = icmp slt i32 %3, %2                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%19, %_4.while.body.1]                      ; inst 6
  %6 = icmp slt i32 %5, %2                                                         ; inst 7
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %7 = mul i32 %3, %2                                                              ; inst 9
  %8 = add i32 %7, %5                                                              ; inst 10
  %9 = sext i32 %8 to i64                                                          ; inst 11
  %10 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %9                  ; inst 12
  %11 = add i32 %3, %5                                                             ; inst 13
  %12 = srem i32 %11, 10                                                           ; inst 14
  %13 = add i32 %12, 1                                                             ; inst 15
  store i32 %13, i32* %10                                                          ; inst 16
  %14 = sext i32 %8 to i64                                                         ; inst 17
  %15 = getelementptr [625 x i32], [625 x i32]* %1, i32 0, i64 %14                 ; inst 18
  %16 = mul i32 %3, %5                                                             ; inst 19
  %17 = srem i32 %16, 7                                                            ; inst 20
  %18 = add i32 %17, 1                                                             ; inst 21
  store i32 %18, i32* %15                                                          ; inst 22
  %19 = add i32 %5, 1                                                              ; inst 23
  br label %_3.while.cond.1                                                        ; inst 24
_5.while.exit.1:
  %20 = add i32 %3, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_6.while.exit.0:
  ret void                                                                         ; inst 27
}

define void @matrixMultiplication625([625 x i32]* %0, [625 x i32]* %1, [625 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%37, %_8.while.exit.1]                           ; inst 2
  %5 = icmp slt i32 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%36, %_7.while.exit.2]                      ; inst 6
  %7 = icmp slt i32 %6, %3                                                         ; inst 7
  br i1 %7, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 8
_4.while.body.1:
  %8 = mul i32 %4, %3                                                              ; inst 9
  %9 = add i32 %8, %6                                                              ; inst 10
  %10 = sext i32 %9 to i64                                                         ; inst 11
  %11 = getelementptr [625 x i32], [625 x i32]* %2, i32 0, i64 %10                 ; inst 12
  store i32 0, i32* %11                                                            ; inst 13
  br label %_5.while.cond.2                                                        ; inst 14
_5.while.cond.2:
  %12 = phi i32 [0, %_4.while.body.1], [%35, %_6.while.body.2]                     ; inst 15
  %13 = icmp slt i32 %12, %3                                                       ; inst 16
  br i1 %13, label %_6.while.body.2, label %_7.while.exit.2                        ; inst 17
_6.while.body.2:
  %14 = mul i32 %4, %3                                                             ; inst 18
  %15 = add i32 %14, %6                                                            ; inst 19
  %16 = sext i32 %15 to i64                                                        ; inst 20
  %17 = getelementptr [625 x i32], [625 x i32]* %2, i32 0, i64 %16                 ; inst 21
  %18 = mul i32 %4, %3                                                             ; inst 22
  %19 = add i32 %18, %6                                                            ; inst 23
  %20 = sext i32 %19 to i64                                                        ; inst 24
  %21 = getelementptr [625 x i32], [625 x i32]* %2, i32 0, i64 %20                 ; inst 25
  %22 = load i32, i32* %21                                                         ; inst 26
  %23 = mul i32 %4, %3                                                             ; inst 27
  %24 = add i32 %23, %12                                                           ; inst 28
  %25 = sext i32 %24 to i64                                                        ; inst 29
  %26 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %25                 ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = mul i32 %12, %3                                                            ; inst 32
  %29 = add i32 %28, %6                                                            ; inst 33
  %30 = sext i32 %29 to i64                                                        ; inst 34
  %31 = getelementptr [625 x i32], [625 x i32]* %1, i32 0, i64 %30                 ; inst 35
  %32 = load i32, i32* %31                                                         ; inst 36
  %33 = mul i32 %27, %32                                                           ; inst 37
  %34 = add i32 %22, %33                                                           ; inst 38
  store i32 %34, i32* %17                                                          ; inst 39
  %35 = add i32 %12, 1                                                             ; inst 40
  br label %_5.while.cond.2                                                        ; inst 41
_7.while.exit.2:
  %36 = add i32 %6, 1                                                              ; inst 42
  br label %_3.while.cond.1                                                        ; inst 43
_8.while.exit.1:
  %37 = add i32 %4, 1                                                              ; inst 44
  br label %_1.while.cond.0                                                        ; inst 45
_9.while.exit.0:
  ret void                                                                         ; inst 46
}

define void @copyMatrix625([625 x i32]* %0, [625 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %4 = mul i32 %2, %2                                                              ; inst 3
  %5 = icmp slt i32 %3, %4                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 6
  %7 = getelementptr [625 x i32], [625 x i32]* %1, i32 0, i64 %6                   ; inst 7
  %8 = sext i32 %3 to i64                                                          ; inst 8
  %9 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %8                   ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  store i32 %10, i32* %7                                                           ; inst 11
  %11 = add i32 %3, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define i32 @calculateMatrixSum625([625 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 3
  %4 = mul i32 %1, %1                                                              ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = add i32 %3, %8                                                              ; inst 10
  %10 = srem i32 %9, 1000000                                                       ; inst 11
  %11 = add i32 %2, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %12 = srem i32 %3, 1000000                                                       ; inst 14
  ret i32 %12                                                                      ; inst 15
}

define void @performRepeatedOperationsBenchmark() {
_0.entry.0:
  %0 = alloca [144 x i32]                                                          ; inst 1
  %1 = getelementptr [144 x i32], [144 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 144                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [144 x i32]                                                          ; inst 11
  %7 = getelementptr [144 x i32], [144 x i32]* %6, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 144                                                        ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %12 = phi i32 [0, %_6.array.exit.1], [%19, %_8.while.body.0]                     ; inst 22
  %13 = icmp slt i32 %12, 144                                                      ; inst 23
  br i1 %13, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 24
_8.while.body.0:
  %14 = sext i32 %12 to i64                                                        ; inst 25
  %15 = getelementptr [144 x i32], [144 x i32]* %0, i32 0, i64 %14                 ; inst 26
  %16 = mul i32 %12, 3                                                             ; inst 27
  %17 = add i32 %16, 7                                                             ; inst 28
  %18 = srem i32 %17, 20                                                           ; inst 29
  store i32 %18, i32* %15                                                          ; inst 30
  %19 = add i32 %12, 1                                                             ; inst 31
  br label %_7.while.cond.0                                                        ; inst 32
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 33
_10.while.cond.1:
  %20 = phi i32 [0, %_9.while.exit.0], [%22, %_11.while.body.1]                    ; inst 34
  %21 = icmp slt i32 %20, 10                                                       ; inst 35
  br i1 %21, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 36
_11.while.body.1:
  call void @matrixTranspose144([144 x i32]* %0, [144 x i32]* %6, i32 12)          ; inst 37
  call void @copyMatrix144([144 x i32]* %6, [144 x i32]* %0, i32 12)               ; inst 38
  %22 = add i32 %20, 1                                                             ; inst 39
  br label %_10.while.cond.1                                                       ; inst 40
_12.while.exit.1:
  %23 = call i32 @calculateMatrixSum144([144 x i32]* %0, i32 12)                   ; inst 41
  call void @printlnInt(i32 %23)                                                   ; inst 42
  ret void                                                                         ; inst 43
}

define void @matrixTranspose144([144 x i32]* %0, [144 x i32]* %1, i32 %2) {
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
  %10 = getelementptr [144 x i32], [144 x i32]* %1, i32 0, i64 %9                  ; inst 12
  %11 = mul i32 %3, %2                                                             ; inst 13
  %12 = add i32 %11, %5                                                            ; inst 14
  %13 = sext i32 %12 to i64                                                        ; inst 15
  %14 = getelementptr [144 x i32], [144 x i32]* %0, i32 0, i64 %13                 ; inst 16
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

define void @copyMatrix144([144 x i32]* %0, [144 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %4 = icmp slt i32 %3, 144                                                        ; inst 3
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 5
  %6 = getelementptr [144 x i32], [144 x i32]* %1, i32 0, i64 %5                   ; inst 6
  %7 = sext i32 %3 to i64                                                          ; inst 7
  %8 = getelementptr [144 x i32], [144 x i32]* %0, i32 0, i64 %7                   ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  store i32 %9, i32* %6                                                            ; inst 10
  %10 = add i32 %3, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  ret void                                                                         ; inst 13
}

define i32 @calculateMatrixSum144([144 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 3
  %4 = mul i32 %1, %1                                                              ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [144 x i32], [144 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = add i32 %3, %8                                                              ; inst 10
  %10 = add i32 %2, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %11 = srem i32 %3, 100000                                                        ; inst 13
  ret i32 %11                                                                      ; inst 14
}

define void @performMemoryAccessBenchmark() {
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
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%11, %_5.while.body.0]                      ; inst 12
  %7 = icmp slt i32 %6, 256                                                        ; inst 13
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 14
_5.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 15
  %9 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %8                   ; inst 16
  %10 = add i32 %6, 1                                                              ; inst 17
  store i32 %10, i32* %9                                                           ; inst 18
  %11 = add i32 %6, 1                                                              ; inst 19
  br label %_4.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  %12 = call i32 @testRowMajorAccess([256 x i32]* %0, i32 16)                      ; inst 21
  %13 = call i32 @testColumnMajorAccess([256 x i32]* %0, i32 16)                   ; inst 22
  %14 = call i32 @testDiagonalAccess([256 x i32]* %0, i32 16)                      ; inst 23
  %15 = call i32 @testRandomAccess([256 x i32]* %0, i32 16)                        ; inst 24
  %16 = add i32 %12, %13                                                           ; inst 25
  %17 = add i32 %16, %14                                                           ; inst 26
  %18 = add i32 %17, %15                                                           ; inst 27
  call void @printlnInt(i32 %18)                                                   ; inst 28
  ret void                                                                         ; inst 29
}

define i32 @testRowMajorAccess([256 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%15, %_5.while.exit.1]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%6, %_5.while.exit.1]                            ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%14, %_4.while.body.1]                      ; inst 7
  %6 = phi i32 [%3, %_2.while.body.0], [%13, %_4.while.body.1]                     ; inst 8
  %7 = icmp slt i32 %5, %1                                                         ; inst 9
  br i1 %7, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %8 = mul i32 %2, %1                                                              ; inst 11
  %9 = add i32 %8, %5                                                              ; inst 12
  %10 = sext i32 %9 to i64                                                         ; inst 13
  %11 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %10                 ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = add i32 %6, %12                                                            ; inst 16
  %14 = add i32 %5, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %15 = add i32 %2, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  %16 = srem i32 %3, 10000                                                         ; inst 21
  ret i32 %16                                                                      ; inst 22
}

define i32 @testColumnMajorAccess([256 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%15, %_5.while.exit.1]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%6, %_5.while.exit.1]                            ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%14, %_4.while.body.1]                      ; inst 7
  %6 = phi i32 [%3, %_2.while.body.0], [%13, %_4.while.body.1]                     ; inst 8
  %7 = icmp slt i32 %5, %1                                                         ; inst 9
  br i1 %7, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %8 = mul i32 %5, %1                                                              ; inst 11
  %9 = add i32 %8, %2                                                              ; inst 12
  %10 = sext i32 %9 to i64                                                         ; inst 13
  %11 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %10                 ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = add i32 %6, %12                                                            ; inst 16
  %14 = add i32 %5, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %15 = add i32 %2, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  %16 = srem i32 %3, 10000                                                         ; inst 21
  ret i32 %16                                                                      ; inst 22
}

define i32 @testDiagonalAccess([256 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = sub i32 %1, 1                                                               ; inst 1
  %3 = sub i32 0, %2                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [%3, %_0.entry.0], [%22, %_11.while.exit.1]                         ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%8, %_11.while.exit.1]                           ; inst 5
  %6 = icmp slt i32 %4, %1                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %7 = phi i32 [0, %_2.while.body.0], [%21, %_10.if.exit.0]                        ; inst 9
  %8 = phi i32 [%5, %_2.while.body.0], [%20, %_10.if.exit.0]                       ; inst 10
  %9 = icmp slt i32 %7, %1                                                         ; inst 11
  br i1 %9, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 12
_4.while.body.1:
  %10 = add i32 %7, %4                                                             ; inst 13
  %11 = icmp sge i32 %10, 0                                                        ; inst 14
  br i1 %11, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 15
_5.lazy.then.0:
  %12 = icmp slt i32 %10, %1                                                       ; inst 16
  br label %_7.lazy.exit.0                                                         ; inst 17
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 18
_7.lazy.exit.0:
  %13 = phi i1 [%12, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 19
  br i1 %13, label %_8.if.then.0, label %_9.if.else.0                              ; inst 20
_8.if.then.0:
  %14 = mul i32 %7, %1                                                             ; inst 21
  %15 = add i32 %14, %10                                                           ; inst 22
  %16 = sext i32 %15 to i64                                                        ; inst 23
  %17 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %16                 ; inst 24
  %18 = load i32, i32* %17                                                         ; inst 25
  %19 = add i32 %8, %18                                                            ; inst 26
  br label %_10.if.exit.0                                                          ; inst 27
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 28
_10.if.exit.0:
  %20 = phi i32 [%19, %_8.if.then.0], [%8, %_9.if.else.0]                          ; inst 29
  %21 = add i32 %7, 1                                                              ; inst 30
  br label %_3.while.cond.1                                                        ; inst 31
_11.while.exit.1:
  %22 = add i32 %4, 1                                                              ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_12.while.exit.0:
  %23 = srem i32 %5, 10000                                                         ; inst 34
  ret i32 %23                                                                      ; inst 35
}

define i32 @testRandomAccess([256 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%20, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [7, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%19, %_2.while.body.0]                           ; inst 4
  %5 = icmp slt i32 %2, 100                                                        ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = mul i32 %3, 17                                                              ; inst 7
  %7 = add i32 %6, 5                                                               ; inst 8
  %8 = srem i32 %7, 251                                                            ; inst 9
  %9 = srem i32 %8, %1                                                             ; inst 10
  %10 = mul i32 %8, 13                                                             ; inst 11
  %11 = add i32 %10, 11                                                            ; inst 12
  %12 = srem i32 %11, 251                                                          ; inst 13
  %13 = srem i32 %12, %1                                                           ; inst 14
  %14 = mul i32 %9, %1                                                             ; inst 15
  %15 = add i32 %14, %13                                                           ; inst 16
  %16 = sext i32 %15 to i64                                                        ; inst 17
  %17 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %16                 ; inst 18
  %18 = load i32, i32* %17                                                         ; inst 19
  %19 = add i32 %4, %18                                                            ; inst 20
  %20 = add i32 %2, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_3.while.exit.0:
  %21 = srem i32 %4, 10000                                                         ; inst 23
  ret i32 %21                                                                      ; inst 24
}

define void @testMatrixEdgeCases() {
_0.entry.0:
  call void @printlnInt(i32 1740)                                                  ; inst 1
  call void @testSingleElementMatrix()                                             ; inst 2
  call void @testMinimalMatrices()                                                 ; inst 3
  call void @testBoundaryValueMatrices()                                           ; inst 4
  call void @testOverflowConditions()                                              ; inst 5
  call void @printlnInt(i32 1749)                                                  ; inst 6
  ret void                                                                         ; inst 7
}

define void @testSingleElementMatrix() {
_0.entry.0:
  %0 = alloca [1 x i32]                                                            ; inst 1
  %1 = getelementptr [1 x i32], [1 x i32]* %0, i32 0, i32 0                        ; inst 2
  store i32 42, i32* %1                                                            ; inst 3
  %2 = alloca [1 x i32]                                                            ; inst 4
  %3 = getelementptr [1 x i32], [1 x i32]* %2, i32 0, i32 0                        ; inst 5
  store i32 0, i32* %3                                                             ; inst 6
  %4 = getelementptr [1 x i32], [1 x i32]* %2, i32 0, i64 0                        ; inst 7
  %5 = getelementptr [1 x i32], [1 x i32]* %0, i32 0, i64 0                        ; inst 8
  %6 = load i32, i32* %5                                                           ; inst 9
  %7 = getelementptr [1 x i32], [1 x i32]* %0, i32 0, i64 0                        ; inst 10
  %8 = load i32, i32* %7                                                           ; inst 11
  %9 = add i32 %6, %8                                                              ; inst 12
  store i32 %9, i32* %4                                                            ; inst 13
  %10 = getelementptr [1 x i32], [1 x i32]* %2, i32 0, i64 0                       ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  call void @printlnInt(i32 %11)                                                   ; inst 16
  %12 = getelementptr [1 x i32], [1 x i32]* %2, i32 0, i64 0                       ; inst 17
  %13 = getelementptr [1 x i32], [1 x i32]* %0, i32 0, i64 0                       ; inst 18
  %14 = load i32, i32* %13                                                         ; inst 19
  %15 = getelementptr [1 x i32], [1 x i32]* %0, i32 0, i64 0                       ; inst 20
  %16 = load i32, i32* %15                                                         ; inst 21
  %17 = mul i32 %14, %16                                                           ; inst 22
  store i32 %17, i32* %12                                                          ; inst 23
  %18 = getelementptr [1 x i32], [1 x i32]* %2, i32 0, i64 0                       ; inst 24
  %19 = load i32, i32* %18                                                         ; inst 25
  call void @printlnInt(i32 %19)                                                   ; inst 26
  %20 = getelementptr [1 x i32], [1 x i32]* %2, i32 0, i64 0                       ; inst 27
  %21 = getelementptr [1 x i32], [1 x i32]* %0, i32 0, i64 0                       ; inst 28
  %22 = load i32, i32* %21                                                         ; inst 29
  store i32 %22, i32* %20                                                          ; inst 30
  %23 = getelementptr [1 x i32], [1 x i32]* %2, i32 0, i64 0                       ; inst 31
  %24 = load i32, i32* %23                                                         ; inst 32
  call void @printlnInt(i32 %24)                                                   ; inst 33
  ret void                                                                         ; inst 34
}

define void @testMinimalMatrices() {
_0.entry.0:
  %0 = alloca [4 x i32]                                                            ; inst 1
  %1 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 0                        ; inst 2
  store i32 1, i32* %1                                                             ; inst 3
  %2 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 1                        ; inst 4
  store i32 2, i32* %2                                                             ; inst 5
  %3 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 2                        ; inst 6
  store i32 3, i32* %3                                                             ; inst 7
  %4 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 3                        ; inst 8
  store i32 4, i32* %4                                                             ; inst 9
  %5 = alloca [4 x i32]                                                            ; inst 10
  %6 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i32 0                        ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 13
  %8 = icmp slt i32 %7, 4                                                          ; inst 14
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 15
_2.array.body.0:
  %9 = getelementptr i32, i32* %6, i32 %7                                          ; inst 16
  store i32 0, i32* %9                                                             ; inst 17
  %10 = add i32 %7, 1                                                              ; inst 18
  br label %_1.array.cond.0                                                        ; inst 19
_3.array.exit.0:
  %11 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 0                       ; inst 20
  %12 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 0                       ; inst 21
  %13 = load i32, i32* %12                                                         ; inst 22
  store i32 %13, i32* %11                                                          ; inst 23
  %14 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 1                       ; inst 24
  %15 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 2                       ; inst 25
  %16 = load i32, i32* %15                                                         ; inst 26
  store i32 %16, i32* %14                                                          ; inst 27
  %17 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 2                       ; inst 28
  %18 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 1                       ; inst 29
  %19 = load i32, i32* %18                                                         ; inst 30
  store i32 %19, i32* %17                                                          ; inst 31
  %20 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 3                       ; inst 32
  %21 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 3                       ; inst 33
  %22 = load i32, i32* %21                                                         ; inst 34
  store i32 %22, i32* %20                                                          ; inst 35
  %23 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 0                       ; inst 36
  %24 = load i32, i32* %23                                                         ; inst 37
  %25 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 1                       ; inst 38
  %26 = load i32, i32* %25                                                         ; inst 39
  %27 = add i32 %24, %26                                                           ; inst 40
  %28 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 2                       ; inst 41
  %29 = load i32, i32* %28                                                         ; inst 42
  %30 = add i32 %27, %29                                                           ; inst 43
  %31 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 3                       ; inst 44
  %32 = load i32, i32* %31                                                         ; inst 45
  %33 = add i32 %30, %32                                                           ; inst 46
  call void @printlnInt(i32 %33)                                                   ; inst 47
  %34 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 0                       ; inst 48
  %35 = load i32, i32* %34                                                         ; inst 49
  %36 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 3                       ; inst 50
  %37 = load i32, i32* %36                                                         ; inst 51
  %38 = mul i32 %35, %37                                                           ; inst 52
  %39 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 1                       ; inst 53
  %40 = load i32, i32* %39                                                         ; inst 54
  %41 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 2                       ; inst 55
  %42 = load i32, i32* %41                                                         ; inst 56
  %43 = mul i32 %40, %42                                                           ; inst 57
  %44 = sub i32 %38, %43                                                           ; inst 58
  call void @printlnInt(i32 %44)                                                   ; inst 59
  ret void                                                                         ; inst 60
}

define void @testBoundaryValueMatrices() {
_0.entry.0:
  %0 = alloca [9 x i32]                                                            ; inst 1
  %1 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 9                                                          ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 0                        ; inst 11
  store i32 10000, i32* %6                                                         ; inst 12
  %7 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 1                        ; inst 13
  store i32 -10000, i32* %7                                                        ; inst 14
  %8 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 2                        ; inst 15
  store i32 5000, i32* %8                                                          ; inst 16
  %9 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 3                        ; inst 17
  store i32 -5000, i32* %9                                                         ; inst 18
  %10 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 4                       ; inst 19
  store i32 20000, i32* %10                                                        ; inst 20
  %11 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 5                       ; inst 21
  store i32 -20000, i32* %11                                                       ; inst 22
  %12 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 6                       ; inst 23
  store i32 15000, i32* %12                                                        ; inst 24
  %13 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 7                       ; inst 25
  store i32 -15000, i32* %13                                                       ; inst 26
  %14 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 8                       ; inst 27
  store i32 0, i32* %14                                                            ; inst 28
  br label %_4.while.cond.0                                                        ; inst 29
_4.while.cond.0:
  %15 = phi i32 [0, %_3.array.exit.0], [%22, %_5.while.body.0]                     ; inst 30
  %16 = phi i32 [0, %_3.array.exit.0], [%21, %_5.while.body.0]                     ; inst 31
  %17 = icmp slt i32 %15, 9                                                        ; inst 32
  br i1 %17, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 33
_5.while.body.0:
  %18 = sext i32 %15 to i64                                                        ; inst 34
  %19 = getelementptr [9 x i32], [9 x i32]* %0, i32 0, i64 %18                     ; inst 35
  %20 = load i32, i32* %19                                                         ; inst 36
  %21 = add i32 %16, %20                                                           ; inst 37
  %22 = add i32 %15, 1                                                             ; inst 38
  br label %_4.while.cond.0                                                        ; inst 39
_6.while.exit.0:
  call void @printlnInt(i32 %16)                                                   ; inst 40
  %23 = alloca [16 x i32]                                                          ; inst 41
  %24 = getelementptr [16 x i32], [16 x i32]* %23, i32 0, i32 0                    ; inst 42
  br label %_7.array.cond.1                                                        ; inst 43
_7.array.cond.1:
  %25 = phi i32 [0, %_6.while.exit.0], [%28, %_8.array.body.1]                     ; inst 44
  %26 = icmp slt i32 %25, 16                                                       ; inst 45
  br i1 %26, label %_8.array.body.1, label %_9.array.exit.1                        ; inst 46
_8.array.body.1:
  %27 = getelementptr i32, i32* %24, i32 %25                                       ; inst 47
  store i32 0, i32* %27                                                            ; inst 48
  %28 = add i32 %25, 1                                                             ; inst 49
  br label %_7.array.cond.1                                                        ; inst 50
_9.array.exit.1:
  %29 = call i32 @calculateMatrixSum16([16 x i32]* %23)                            ; inst 51
  call void @printlnInt(i32 %29)                                                   ; inst 52
  %30 = alloca [16 x i32]                                                          ; inst 53
  %31 = getelementptr [16 x i32], [16 x i32]* %30, i32 0, i32 0                    ; inst 54
  br label %_10.array.cond.2                                                       ; inst 55
_10.array.cond.2:
  %32 = phi i32 [0, %_9.array.exit.1], [%35, %_11.array.body.2]                    ; inst 56
  %33 = icmp slt i32 %32, 16                                                       ; inst 57
  br i1 %33, label %_11.array.body.2, label %_12.array.exit.2                      ; inst 58
_11.array.body.2:
  %34 = getelementptr i32, i32* %31, i32 %32                                       ; inst 59
  store i32 1, i32* %34                                                            ; inst 60
  %35 = add i32 %32, 1                                                             ; inst 61
  br label %_10.array.cond.2                                                       ; inst 62
_12.array.exit.2:
  %36 = call i32 @calculateMatrixSum16([16 x i32]* %30)                            ; inst 63
  call void @printlnInt(i32 %36)                                                   ; inst 64
  ret void                                                                         ; inst 65
}

define i32 @calculateMatrixSum16([16 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 3
  %3 = icmp slt i32 %1, 16                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %4                     ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = add i32 %2, %6                                                              ; inst 9
  %8 = add i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret i32 %2                                                                       ; inst 12
}

define void @testOverflowConditions() {
_0.entry.0:
  %0 = alloca [4 x i32]                                                            ; inst 1
  %1 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 0                        ; inst 2
  store i32 1000, i32* %1                                                          ; inst 3
  %2 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 1                        ; inst 4
  store i32 2000, i32* %2                                                          ; inst 5
  %3 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 2                        ; inst 6
  store i32 3000, i32* %3                                                          ; inst 7
  %4 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 3                        ; inst 8
  store i32 4000, i32* %4                                                          ; inst 9
  %5 = alloca [4 x i32]                                                            ; inst 10
  %6 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i32 0                        ; inst 11
  store i32 5000, i32* %6                                                          ; inst 12
  %7 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i32 1                        ; inst 13
  store i32 6000, i32* %7                                                          ; inst 14
  %8 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i32 2                        ; inst 15
  store i32 7000, i32* %8                                                          ; inst 16
  %9 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i32 3                        ; inst 17
  store i32 8000, i32* %9                                                          ; inst 18
  %10 = alloca [4 x i32]                                                           ; inst 19
  %11 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i32 0                      ; inst 20
  br label %_1.array.cond.0                                                        ; inst 21
_1.array.cond.0:
  %12 = phi i32 [0, %_0.entry.0], [%15, %_2.array.body.0]                          ; inst 22
  %13 = icmp slt i32 %12, 4                                                        ; inst 23
  br i1 %13, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 24
_2.array.body.0:
  %14 = getelementptr i32, i32* %11, i32 %12                                       ; inst 25
  store i32 0, i32* %14                                                            ; inst 26
  %15 = add i32 %12, 1                                                             ; inst 27
  br label %_1.array.cond.0                                                        ; inst 28
_3.array.exit.0:
  %16 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 0                      ; inst 29
  %17 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 0                       ; inst 30
  %18 = load i32, i32* %17                                                         ; inst 31
  %19 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 0                       ; inst 32
  %20 = load i32, i32* %19                                                         ; inst 33
  %21 = mul i32 %18, %20                                                           ; inst 34
  %22 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 1                       ; inst 35
  %23 = load i32, i32* %22                                                         ; inst 36
  %24 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 2                       ; inst 37
  %25 = load i32, i32* %24                                                         ; inst 38
  %26 = mul i32 %23, %25                                                           ; inst 39
  %27 = add i32 %21, %26                                                           ; inst 40
  store i32 %27, i32* %16                                                          ; inst 41
  %28 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 1                      ; inst 42
  %29 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 0                       ; inst 43
  %30 = load i32, i32* %29                                                         ; inst 44
  %31 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 1                       ; inst 45
  %32 = load i32, i32* %31                                                         ; inst 46
  %33 = mul i32 %30, %32                                                           ; inst 47
  %34 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 1                       ; inst 48
  %35 = load i32, i32* %34                                                         ; inst 49
  %36 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 3                       ; inst 50
  %37 = load i32, i32* %36                                                         ; inst 51
  %38 = mul i32 %35, %37                                                           ; inst 52
  %39 = add i32 %33, %38                                                           ; inst 53
  store i32 %39, i32* %28                                                          ; inst 54
  %40 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 2                      ; inst 55
  %41 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 2                       ; inst 56
  %42 = load i32, i32* %41                                                         ; inst 57
  %43 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 0                       ; inst 58
  %44 = load i32, i32* %43                                                         ; inst 59
  %45 = mul i32 %42, %44                                                           ; inst 60
  %46 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 3                       ; inst 61
  %47 = load i32, i32* %46                                                         ; inst 62
  %48 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 2                       ; inst 63
  %49 = load i32, i32* %48                                                         ; inst 64
  %50 = mul i32 %47, %49                                                           ; inst 65
  %51 = add i32 %45, %50                                                           ; inst 66
  store i32 %51, i32* %40                                                          ; inst 67
  %52 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 3                      ; inst 68
  %53 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 2                       ; inst 69
  %54 = load i32, i32* %53                                                         ; inst 70
  %55 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 1                       ; inst 71
  %56 = load i32, i32* %55                                                         ; inst 72
  %57 = mul i32 %54, %56                                                           ; inst 73
  %58 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 3                       ; inst 74
  %59 = load i32, i32* %58                                                         ; inst 75
  %60 = getelementptr [4 x i32], [4 x i32]* %5, i32 0, i64 3                       ; inst 76
  %61 = load i32, i32* %60                                                         ; inst 77
  %62 = mul i32 %59, %61                                                           ; inst 78
  %63 = add i32 %57, %62                                                           ; inst 79
  store i32 %63, i32* %52                                                          ; inst 80
  %64 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 0                      ; inst 81
  %65 = load i32, i32* %64                                                         ; inst 82
  %66 = srem i32 %65, 100000                                                       ; inst 83
  %67 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 1                      ; inst 84
  %68 = load i32, i32* %67                                                         ; inst 85
  %69 = srem i32 %68, 100000                                                       ; inst 86
  %70 = add i32 %66, %69                                                           ; inst 87
  %71 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 2                      ; inst 88
  %72 = load i32, i32* %71                                                         ; inst 89
  %73 = srem i32 %72, 100000                                                       ; inst 90
  %74 = add i32 %70, %73                                                           ; inst 91
  %75 = getelementptr [4 x i32], [4 x i32]* %10, i32 0, i64 3                      ; inst 92
  %76 = load i32, i32* %75                                                         ; inst 93
  %77 = srem i32 %76, 100000                                                       ; inst 94
  %78 = add i32 %74, %77                                                           ; inst 95
  call void @printlnInt(i32 %78)                                                   ; inst 96
  ret void                                                                         ; inst 97
}

