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
  call void @printlnInt(i32 1500)                                                  ; inst 1
  call void @testMemoryAccessPatterns()                                            ; inst 2
  call void @testMultiDimensionalArrayAccess()                                     ; inst 3
  call void @testDataLayoutOptimization()                                          ; inst 4
  call void @testMemoryStridePatterns()                                            ; inst 5
  call void @testCacheConsciousAlgorithms()                                        ; inst 6
  call void @printlnInt(i32 1599)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @testMemoryAccessPatterns() {
_0.entry.0:
  call void @printlnInt(i32 1501)                                                  ; inst 1
  %0 = alloca [4096 x i32]                                                         ; inst 2
  %1 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 4096                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeLargeArray([4096 x i32]* %0)                                ; inst 12
  %6 = call i32 @sequentialAccess([4096 x i32]* %0)                                ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @stridedAccess([4096 x i32]* %0, i32 8)                            ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @randomAccess([4096 x i32]* %0)                                    ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @backwardAccess([4096 x i32]* %0)                                  ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  call void @printlnInt(i32 1502)                                                  ; inst 21
  ret void                                                                         ; inst 22
}

define void @initializeLargeArray([4096 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [98765, %_0.entry.0], [%9, %_5.if.exit.0]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 3
  %3 = icmp slt i32 %2, 4096                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = mul i32 %1, 1103                                                            ; inst 6
  %5 = add i32 %4, 4721                                                            ; inst 7
  %6 = srem i32 %5, 1048583                                                        ; inst 8
  %7 = icmp slt i32 %6, 0                                                          ; inst 9
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %8 = sub i32 0, %6                                                               ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %9 = phi i32 [%8, %_3.if.then.0], [%6, %_4.if.else.0]                            ; inst 14
  %10 = sext i32 %2 to i64                                                         ; inst 15
  %11 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %10               ; inst 16
  %12 = srem i32 %9, 1000                                                          ; inst 17
  store i32 %12, i32* %11                                                          ; inst 18
  %13 = add i32 %2, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define i32 @sequentialAccess([4096 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 3
  %3 = icmp slt i32 %1, 4096                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %4                 ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = add i32 %2, %6                                                              ; inst 9
  %8 = add i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret i32 %2                                                                       ; inst 12
}

define i32 @stridedAccess([4096 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 3
  %4 = icmp slt i32 %2, 4096                                                       ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = add i32 %3, %7                                                              ; inst 9
  %9 = add i32 %2, %1                                                              ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 12
}

define i32 @randomAccess([4096 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%16, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [54321, %_0.entry.0], [%10, %_5.if.exit.0]                          ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%15, %_5.if.exit.0]                              ; inst 4
  %4 = icmp slt i32 %1, 1000                                                       ; inst 5
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = mul i32 %2, 1103                                                            ; inst 7
  %6 = add i32 %5, 4721                                                            ; inst 8
  %7 = srem i32 %6, 1048583                                                        ; inst 9
  %8 = icmp slt i32 %7, 0                                                          ; inst 10
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 11
_3.if.then.0:
  %9 = sub i32 0, %7                                                               ; inst 12
  br label %_5.if.exit.0                                                           ; inst 13
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 14
_5.if.exit.0:
  %10 = phi i32 [%9, %_3.if.then.0], [%7, %_4.if.else.0]                           ; inst 15
  %11 = srem i32 %10, 4096                                                         ; inst 16
  %12 = sext i32 %11 to i64                                                        ; inst 17
  %13 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %12               ; inst 18
  %14 = load i32, i32* %13                                                         ; inst 19
  %15 = add i32 %3, %14                                                            ; inst 20
  %16 = add i32 %1, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 23
}

define i32 @backwardAccess([4096 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [4095, %_0.entry.0], [%8, %_2.while.body.0]                         ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 3
  %3 = icmp sge i32 %1, 0                                                          ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %4                 ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = add i32 %2, %6                                                              ; inst 9
  %8 = sub i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret i32 %2                                                                       ; inst 12
}

define void @testMultiDimensionalArrayAccess() {
_0.entry.0:
  call void @printlnInt(i32 1503)                                                  ; inst 1
  %0 = alloca [1024 x i32]                                                         ; inst 2
  %1 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 1024                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeMatrix32x32([1024 x i32]* %0)                               ; inst 12
  %6 = call i32 @rowMajorAccess([1024 x i32]* %0)                                  ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @columnMajorAccess([1024 x i32]* %0)                               ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @diagonalAccess([1024 x i32]* %0)                                  ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @blockAccess([1024 x i32]* %0)                                     ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  call void @printlnInt(i32 1504)                                                  ; inst 21
  ret void                                                                         ; inst 22
}

define void @initializeMatrix32x32([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%13, %_5.while.exit.1]                           ; inst 2
  %2 = icmp slt i32 %1, 32                                                         ; inst 3
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %3 = phi i32 [0, %_2.while.body.0], [%12, %_4.while.body.1]                      ; inst 6
  %4 = icmp slt i32 %3, 32                                                         ; inst 7
  br i1 %4, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %5 = mul i32 %1, 32                                                              ; inst 9
  %6 = add i32 %5, %3                                                              ; inst 10
  %7 = sext i32 %6 to i64                                                          ; inst 11
  %8 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %7                 ; inst 12
  %9 = add i32 %1, 1                                                               ; inst 13
  %10 = add i32 %3, 1                                                              ; inst 14
  %11 = mul i32 %9, %10                                                            ; inst 15
  store i32 %11, i32* %8                                                           ; inst 16
  %12 = add i32 %3, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %13 = add i32 %1, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define i32 @rowMajorAccess([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%14, %_5.while.exit.1]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_5.while.exit.1]                            ; inst 3
  %3 = icmp slt i32 %1, 32                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%13, %_4.while.body.1]                      ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%12, %_4.while.body.1]                     ; inst 8
  %6 = icmp slt i32 %4, 32                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = mul i32 %1, 32                                                              ; inst 11
  %8 = add i32 %7, %4                                                              ; inst 12
  %9 = sext i32 %8 to i64                                                          ; inst 13
  %10 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %9                ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = add i32 %5, %11                                                            ; inst 16
  %13 = add i32 %4, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %14 = add i32 %1, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret i32 %2                                                                       ; inst 21
}

define i32 @columnMajorAccess([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%14, %_5.while.exit.1]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_5.while.exit.1]                            ; inst 3
  %3 = icmp slt i32 %1, 32                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%13, %_4.while.body.1]                      ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%12, %_4.while.body.1]                     ; inst 8
  %6 = icmp slt i32 %4, 32                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = mul i32 %4, 32                                                              ; inst 11
  %8 = add i32 %7, %1                                                              ; inst 12
  %9 = sext i32 %8 to i64                                                          ; inst 13
  %10 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %9                ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = add i32 %5, %11                                                            ; inst 16
  %13 = add i32 %4, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %14 = add i32 %1, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret i32 %2                                                                       ; inst 21
}

define i32 @diagonalAccess([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 3
  %3 = icmp slt i32 %1, 32                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = mul i32 %1, 32                                                              ; inst 6
  %5 = add i32 %4, %1                                                              ; inst 7
  %6 = sext i32 %5 to i64                                                          ; inst 8
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = add i32 %2, %8                                                              ; inst 11
  %10 = add i32 %1, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 14
_4.while.cond.1:
  %11 = phi i32 [0, %_3.while.exit.0], [%21, %_5.while.body.1]                     ; inst 15
  %12 = phi i32 [%2, %_3.while.exit.0], [%20, %_5.while.body.1]                    ; inst 16
  %13 = icmp slt i32 %11, 32                                                       ; inst 17
  br i1 %13, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 18
_5.while.body.1:
  %14 = mul i32 %11, 32                                                            ; inst 19
  %15 = sub i32 31, %11                                                            ; inst 20
  %16 = add i32 %14, %15                                                           ; inst 21
  %17 = sext i32 %16 to i64                                                        ; inst 22
  %18 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %17               ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = add i32 %12, %19                                                           ; inst 25
  %21 = add i32 %11, 1                                                             ; inst 26
  br label %_4.while.cond.1                                                        ; inst 27
_6.while.exit.1:
  ret i32 %12                                                                      ; inst 28
}

define i32 @blockAccess([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%28, %_17.while.exit.1]                          ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_17.while.exit.1]                           ; inst 3
  %3 = icmp slt i32 %1, 32                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%27, %_16.while.exit.2]                     ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%9, %_16.while.exit.2]                     ; inst 8
  %6 = icmp slt i32 %4, 32                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_17.while.exit.1                        ; inst 10
_4.while.body.1:
  %7 = add i32 %1, 8                                                               ; inst 11
  br label %_5.while.cond.2                                                        ; inst 12
_5.while.cond.2:
  %8 = phi i32 [%1, %_4.while.body.1], [%26, %_15.while.exit.3]                    ; inst 13
  %9 = phi i32 [%5, %_4.while.body.1], [%15, %_15.while.exit.3]                    ; inst 14
  %10 = icmp slt i32 %8, %7                                                        ; inst 15
  br i1 %10, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 16
_6.lazy.then.0:
  %11 = icmp slt i32 %8, 32                                                        ; inst 17
  br label %_8.lazy.exit.0                                                         ; inst 18
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 19
_8.lazy.exit.0:
  %12 = phi i1 [%11, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 20
  br i1 %12, label %_9.while.body.2, label %_16.while.exit.2                       ; inst 21
_9.while.body.2:
  %13 = add i32 %4, 8                                                              ; inst 22
  br label %_10.while.cond.3                                                       ; inst 23
_10.while.cond.3:
  %14 = phi i32 [%4, %_9.while.body.2], [%25, %_14.while.body.3]                   ; inst 24
  %15 = phi i32 [%9, %_9.while.body.2], [%24, %_14.while.body.3]                   ; inst 25
  %16 = icmp slt i32 %14, %13                                                      ; inst 26
  br i1 %16, label %_11.lazy.then.1, label %_12.lazy.else.1                        ; inst 27
_11.lazy.then.1:
  %17 = icmp slt i32 %14, 32                                                       ; inst 28
  br label %_13.lazy.exit.1                                                        ; inst 29
_12.lazy.else.1:
  br label %_13.lazy.exit.1                                                        ; inst 30
_13.lazy.exit.1:
  %18 = phi i1 [%17, %_11.lazy.then.1], [0, %_12.lazy.else.1]                      ; inst 31
  br i1 %18, label %_14.while.body.3, label %_15.while.exit.3                      ; inst 32
_14.while.body.3:
  %19 = mul i32 %8, 32                                                             ; inst 33
  %20 = add i32 %19, %14                                                           ; inst 34
  %21 = sext i32 %20 to i64                                                        ; inst 35
  %22 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %21               ; inst 36
  %23 = load i32, i32* %22                                                         ; inst 37
  %24 = add i32 %15, %23                                                           ; inst 38
  %25 = add i32 %14, 1                                                             ; inst 39
  br label %_10.while.cond.3                                                       ; inst 40
_15.while.exit.3:
  %26 = add i32 %8, 1                                                              ; inst 41
  br label %_5.while.cond.2                                                        ; inst 42
_16.while.exit.2:
  %27 = add i32 %4, 8                                                              ; inst 43
  br label %_3.while.cond.1                                                        ; inst 44
_17.while.exit.1:
  %28 = add i32 %1, 8                                                              ; inst 45
  br label %_1.while.cond.0                                                        ; inst 46
_18.while.exit.0:
  ret i32 %2                                                                       ; inst 47
}

define void @testDataLayoutOptimization() {
_0.entry.0:
  call void @printlnInt(i32 1505)                                                  ; inst 1
  %0 = call i32 @testStructureOfArrays()                                           ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @testArrayOfStructures()                                           ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @testHybridDataLayout()                                            ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  call void @printlnInt(i32 1506)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @testStructureOfArrays() {
_0.entry.0:
  %0 = alloca [1000 x i32]                                                         ; inst 1
  %1 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 1000                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [1000 x i32]                                                         ; inst 11
  %7 = getelementptr [1000 x i32], [1000 x i32]* %6, i32 0, i32 0                  ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 1000                                                       ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [1000 x i32]                                                        ; inst 21
  %13 = getelementptr [1000 x i32], [1000 x i32]* %12, i32 0, i32 0                ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 1000                                                     ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  br label %_10.while.cond.0                                                       ; inst 31
_10.while.cond.0:
  %18 = phi i32 [0, %_9.array.exit.2], [%28, %_11.while.body.0]                    ; inst 32
  %19 = icmp slt i32 %18, 1000                                                     ; inst 33
  br i1 %19, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 34
_11.while.body.0:
  %20 = sext i32 %18 to i64                                                        ; inst 35
  %21 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %20               ; inst 36
  store i32 %18, i32* %21                                                          ; inst 37
  %22 = sext i32 %18 to i64                                                        ; inst 38
  %23 = getelementptr [1000 x i32], [1000 x i32]* %6, i32 0, i64 %22               ; inst 39
  %24 = mul i32 %18, 2                                                             ; inst 40
  store i32 %24, i32* %23                                                          ; inst 41
  %25 = sext i32 %18 to i64                                                        ; inst 42
  %26 = getelementptr [1000 x i32], [1000 x i32]* %12, i32 0, i64 %25              ; inst 43
  %27 = mul i32 %18, 3                                                             ; inst 44
  store i32 %27, i32* %26                                                          ; inst 45
  %28 = add i32 %18, 1                                                             ; inst 46
  br label %_10.while.cond.0                                                       ; inst 47
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 48
_13.while.cond.1:
  %29 = phi i32 [0, %_12.while.exit.0], [%36, %_14.while.body.1]                   ; inst 49
  %30 = phi i32 [0, %_12.while.exit.0], [%37, %_14.while.body.1]                   ; inst 50
  %31 = icmp slt i32 %30, 1000                                                     ; inst 51
  br i1 %31, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 52
_14.while.body.1:
  %32 = sext i32 %30 to i64                                                        ; inst 53
  %33 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %32               ; inst 54
  %34 = load i32, i32* %33                                                         ; inst 55
  %35 = mul i32 %34, 2                                                             ; inst 56
  %36 = add i32 %29, %35                                                           ; inst 57
  %37 = add i32 %30, 1                                                             ; inst 58
  br label %_13.while.cond.1                                                       ; inst 59
_15.while.exit.1:
  br label %_16.while.cond.2                                                       ; inst 60
_16.while.cond.2:
  %38 = phi i32 [0, %_15.while.exit.1], [%45, %_17.while.body.2]                   ; inst 61
  %39 = phi i32 [0, %_15.while.exit.1], [%46, %_17.while.body.2]                   ; inst 62
  %40 = icmp slt i32 %39, 1000                                                     ; inst 63
  br i1 %40, label %_17.while.body.2, label %_18.while.exit.2                      ; inst 64
_17.while.body.2:
  %41 = sext i32 %39 to i64                                                        ; inst 65
  %42 = getelementptr [1000 x i32], [1000 x i32]* %6, i32 0, i64 %41               ; inst 66
  %43 = load i32, i32* %42                                                         ; inst 67
  %44 = mul i32 %43, 3                                                             ; inst 68
  %45 = add i32 %38, %44                                                           ; inst 69
  %46 = add i32 %39, 1                                                             ; inst 70
  br label %_16.while.cond.2                                                       ; inst 71
_18.while.exit.2:
  br label %_19.while.cond.3                                                       ; inst 72
_19.while.cond.3:
  %47 = phi i32 [0, %_18.while.exit.2], [%54, %_20.while.body.3]                   ; inst 73
  %48 = phi i32 [0, %_18.while.exit.2], [%55, %_20.while.body.3]                   ; inst 74
  %49 = icmp slt i32 %48, 1000                                                     ; inst 75
  br i1 %49, label %_20.while.body.3, label %_21.while.exit.3                      ; inst 76
_20.while.body.3:
  %50 = sext i32 %48 to i64                                                        ; inst 77
  %51 = getelementptr [1000 x i32], [1000 x i32]* %12, i32 0, i64 %50              ; inst 78
  %52 = load i32, i32* %51                                                         ; inst 79
  %53 = mul i32 %52, 4                                                             ; inst 80
  %54 = add i32 %47, %53                                                           ; inst 81
  %55 = add i32 %48, 1                                                             ; inst 82
  br label %_19.while.cond.3                                                       ; inst 83
_21.while.exit.3:
  %56 = add i32 %29, %38                                                           ; inst 84
  %57 = add i32 %56, %47                                                           ; inst 85
  ret i32 %57                                                                      ; inst 86
}

define i32 @testArrayOfStructures() {
_0.entry.0:
  %0 = alloca [3000 x i32]                                                         ; inst 1
  %1 = getelementptr [3000 x i32], [3000 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 3000                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%21, %_5.while.body.0]                      ; inst 12
  %7 = icmp slt i32 %6, 1000                                                       ; inst 13
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 14
_5.while.body.0:
  %8 = mul i32 %6, 3                                                               ; inst 15
  %9 = sext i32 %8 to i64                                                          ; inst 16
  %10 = getelementptr [3000 x i32], [3000 x i32]* %0, i32 0, i64 %9                ; inst 17
  store i32 %6, i32* %10                                                           ; inst 18
  %11 = mul i32 %6, 3                                                              ; inst 19
  %12 = add i32 %11, 1                                                             ; inst 20
  %13 = sext i32 %12 to i64                                                        ; inst 21
  %14 = getelementptr [3000 x i32], [3000 x i32]* %0, i32 0, i64 %13               ; inst 22
  %15 = mul i32 %6, 2                                                              ; inst 23
  store i32 %15, i32* %14                                                          ; inst 24
  %16 = mul i32 %6, 3                                                              ; inst 25
  %17 = add i32 %16, 2                                                             ; inst 26
  %18 = sext i32 %17 to i64                                                        ; inst 27
  %19 = getelementptr [3000 x i32], [3000 x i32]* %0, i32 0, i64 %18               ; inst 28
  %20 = mul i32 %6, 3                                                              ; inst 29
  store i32 %20, i32* %19                                                          ; inst 30
  %21 = add i32 %6, 1                                                              ; inst 31
  br label %_4.while.cond.0                                                        ; inst 32
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 33
_7.while.cond.1:
  %22 = phi i32 [0, %_6.while.exit.0], [%50, %_8.while.body.1]                     ; inst 34
  %23 = phi i32 [0, %_6.while.exit.0], [%49, %_8.while.body.1]                     ; inst 35
  %24 = icmp slt i32 %22, 1000                                                     ; inst 36
  br i1 %24, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 37
_8.while.body.1:
  %25 = mul i32 %22, 3                                                             ; inst 38
  %26 = sext i32 %25 to i64                                                        ; inst 39
  %27 = getelementptr [3000 x i32], [3000 x i32]* %0, i32 0, i64 %26               ; inst 40
  %28 = load i32, i32* %27                                                         ; inst 41
  %29 = mul i32 %22, 3                                                             ; inst 42
  %30 = add i32 %29, 1                                                             ; inst 43
  %31 = sext i32 %30 to i64                                                        ; inst 44
  %32 = getelementptr [3000 x i32], [3000 x i32]* %0, i32 0, i64 %31               ; inst 45
  %33 = load i32, i32* %32                                                         ; inst 46
  %34 = mul i32 %22, 3                                                             ; inst 47
  %35 = add i32 %34, 2                                                             ; inst 48
  %36 = sext i32 %35 to i64                                                        ; inst 49
  %37 = getelementptr [3000 x i32], [3000 x i32]* %0, i32 0, i64 %36               ; inst 50
  %38 = load i32, i32* %37                                                         ; inst 51
  %39 = mul i32 %28, %28                                                           ; inst 52
  %40 = srem i32 %39, 1073741824                                                   ; inst 53
  %41 = mul i32 %33, %33                                                           ; inst 54
  %42 = srem i32 %41, 1073741824                                                   ; inst 55
  %43 = add i32 %40, %42                                                           ; inst 56
  %44 = mul i32 %38, %38                                                           ; inst 57
  %45 = srem i32 %44, 1073741824                                                   ; inst 58
  %46 = add i32 %43, %45                                                           ; inst 59
  %47 = srem i32 %46, 1073741824                                                   ; inst 60
  %48 = add i32 %23, %47                                                           ; inst 61
  %49 = srem i32 %48, 1073741824                                                   ; inst 62
  %50 = add i32 %22, 1                                                             ; inst 63
  br label %_7.while.cond.1                                                        ; inst 64
_9.while.exit.1:
  ret i32 %23                                                                      ; inst 65
}

define i32 @testHybridDataLayout() {
_0.entry.0:
  %0 = alloca [250 x i32]                                                          ; inst 1
  %1 = getelementptr [250 x i32], [250 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 250                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [250 x i32]                                                          ; inst 11
  %7 = getelementptr [250 x i32], [250 x i32]* %6, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 250                                                        ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [250 x i32]                                                         ; inst 21
  %13 = getelementptr [250 x i32], [250 x i32]* %12, i32 0, i32 0                  ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 250                                                      ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  %18 = alloca [250 x i32]                                                         ; inst 31
  %19 = getelementptr [250 x i32], [250 x i32]* %18, i32 0, i32 0                  ; inst 32
  br label %_10.array.cond.3                                                       ; inst 33
_10.array.cond.3:
  %20 = phi i32 [0, %_9.array.exit.2], [%23, %_11.array.body.3]                    ; inst 34
  %21 = icmp slt i32 %20, 250                                                      ; inst 35
  br i1 %21, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 36
_11.array.body.3:
  %22 = getelementptr i32, i32* %19, i32 %20                                       ; inst 37
  store i32 0, i32* %22                                                            ; inst 38
  %23 = add i32 %20, 1                                                             ; inst 39
  br label %_10.array.cond.3                                                       ; inst 40
_12.array.exit.3:
  %24 = alloca [250 x i32]                                                         ; inst 41
  %25 = getelementptr [250 x i32], [250 x i32]* %24, i32 0, i32 0                  ; inst 42
  br label %_13.array.cond.4                                                       ; inst 43
_13.array.cond.4:
  %26 = phi i32 [0, %_12.array.exit.3], [%29, %_14.array.body.4]                   ; inst 44
  %27 = icmp slt i32 %26, 250                                                      ; inst 45
  br i1 %27, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 46
_14.array.body.4:
  %28 = getelementptr i32, i32* %25, i32 %26                                       ; inst 47
  store i32 0, i32* %28                                                            ; inst 48
  %29 = add i32 %26, 1                                                             ; inst 49
  br label %_13.array.cond.4                                                       ; inst 50
_15.array.exit.4:
  %30 = alloca [250 x i32]                                                         ; inst 51
  %31 = getelementptr [250 x i32], [250 x i32]* %30, i32 0, i32 0                  ; inst 52
  br label %_16.array.cond.5                                                       ; inst 53
_16.array.cond.5:
  %32 = phi i32 [0, %_15.array.exit.4], [%35, %_17.array.body.5]                   ; inst 54
  %33 = icmp slt i32 %32, 250                                                      ; inst 55
  br i1 %33, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 56
_17.array.body.5:
  %34 = getelementptr i32, i32* %31, i32 %32                                       ; inst 57
  store i32 0, i32* %34                                                            ; inst 58
  %35 = add i32 %32, 1                                                             ; inst 59
  br label %_16.array.cond.5                                                       ; inst 60
_18.array.exit.5:
  br label %_19.while.cond.0                                                       ; inst 61
_19.while.cond.0:
  %36 = phi i32 [0, %_18.array.exit.5], [%57, %_20.while.body.0]                   ; inst 62
  %37 = icmp slt i32 %36, 250                                                      ; inst 63
  br i1 %37, label %_20.while.body.0, label %_21.while.exit.0                      ; inst 64
_20.while.body.0:
  %38 = sext i32 %36 to i64                                                        ; inst 65
  %39 = getelementptr [250 x i32], [250 x i32]* %0, i32 0, i64 %38                 ; inst 66
  store i32 %36, i32* %39                                                          ; inst 67
  %40 = sext i32 %36 to i64                                                        ; inst 68
  %41 = getelementptr [250 x i32], [250 x i32]* %6, i32 0, i64 %40                 ; inst 69
  %42 = mul i32 %36, 2                                                             ; inst 70
  store i32 %42, i32* %41                                                          ; inst 71
  %43 = sext i32 %36 to i64                                                        ; inst 72
  %44 = getelementptr [250 x i32], [250 x i32]* %12, i32 0, i64 %43                ; inst 73
  %45 = mul i32 %36, 3                                                             ; inst 74
  store i32 %45, i32* %44                                                          ; inst 75
  %46 = sext i32 %36 to i64                                                        ; inst 76
  %47 = getelementptr [250 x i32], [250 x i32]* %18, i32 0, i64 %46                ; inst 77
  %48 = add i32 %36, 250                                                           ; inst 78
  store i32 %48, i32* %47                                                          ; inst 79
  %49 = sext i32 %36 to i64                                                        ; inst 80
  %50 = getelementptr [250 x i32], [250 x i32]* %24, i32 0, i64 %49                ; inst 81
  %51 = add i32 %36, 250                                                           ; inst 82
  %52 = mul i32 %51, 2                                                             ; inst 83
  store i32 %52, i32* %50                                                          ; inst 84
  %53 = sext i32 %36 to i64                                                        ; inst 85
  %54 = getelementptr [250 x i32], [250 x i32]* %30, i32 0, i64 %53                ; inst 86
  %55 = add i32 %36, 250                                                           ; inst 87
  %56 = mul i32 %55, 3                                                             ; inst 88
  store i32 %56, i32* %54                                                          ; inst 89
  %57 = add i32 %36, 1                                                             ; inst 90
  br label %_19.while.cond.0                                                       ; inst 91
_21.while.exit.0:
  br label %_22.while.cond.1                                                       ; inst 92
_22.while.cond.1:
  %58 = phi i32 [0, %_21.while.exit.0], [%73, %_23.while.body.1]                   ; inst 93
  %59 = phi i32 [0, %_21.while.exit.0], [%72, %_23.while.body.1]                   ; inst 94
  %60 = icmp slt i32 %58, 250                                                      ; inst 95
  br i1 %60, label %_23.while.body.1, label %_24.while.exit.1                      ; inst 96
_23.while.body.1:
  %61 = sext i32 %58 to i64                                                        ; inst 97
  %62 = getelementptr [250 x i32], [250 x i32]* %0, i32 0, i64 %61                 ; inst 98
  %63 = load i32, i32* %62                                                         ; inst 99
  %64 = sext i32 %58 to i64                                                        ; inst 100
  %65 = getelementptr [250 x i32], [250 x i32]* %6, i32 0, i64 %64                 ; inst 101
  %66 = load i32, i32* %65                                                         ; inst 102
  %67 = add i32 %63, %66                                                           ; inst 103
  %68 = sext i32 %58 to i64                                                        ; inst 104
  %69 = getelementptr [250 x i32], [250 x i32]* %12, i32 0, i64 %68                ; inst 105
  %70 = load i32, i32* %69                                                         ; inst 106
  %71 = add i32 %67, %70                                                           ; inst 107
  %72 = add i32 %59, %71                                                           ; inst 108
  %73 = add i32 %58, 1                                                             ; inst 109
  br label %_22.while.cond.1                                                       ; inst 110
_24.while.exit.1:
  br label %_25.while.cond.2                                                       ; inst 111
_25.while.cond.2:
  %74 = phi i32 [0, %_24.while.exit.1], [%89, %_26.while.body.2]                   ; inst 112
  %75 = phi i32 [%59, %_24.while.exit.1], [%88, %_26.while.body.2]                 ; inst 113
  %76 = icmp slt i32 %74, 250                                                      ; inst 114
  br i1 %76, label %_26.while.body.2, label %_27.while.exit.2                      ; inst 115
_26.while.body.2:
  %77 = sext i32 %74 to i64                                                        ; inst 116
  %78 = getelementptr [250 x i32], [250 x i32]* %18, i32 0, i64 %77                ; inst 117
  %79 = load i32, i32* %78                                                         ; inst 118
  %80 = sext i32 %74 to i64                                                        ; inst 119
  %81 = getelementptr [250 x i32], [250 x i32]* %24, i32 0, i64 %80                ; inst 120
  %82 = load i32, i32* %81                                                         ; inst 121
  %83 = add i32 %79, %82                                                           ; inst 122
  %84 = sext i32 %74 to i64                                                        ; inst 123
  %85 = getelementptr [250 x i32], [250 x i32]* %30, i32 0, i64 %84                ; inst 124
  %86 = load i32, i32* %85                                                         ; inst 125
  %87 = add i32 %83, %86                                                           ; inst 126
  %88 = add i32 %75, %87                                                           ; inst 127
  %89 = add i32 %74, 1                                                             ; inst 128
  br label %_25.while.cond.2                                                       ; inst 129
_27.while.exit.2:
  ret i32 %75                                                                      ; inst 130
}

define void @testMemoryStridePatterns() {
_0.entry.0:
  call void @printlnInt(i32 1507)                                                  ; inst 1
  %0 = alloca [2048 x i32]                                                         ; inst 2
  %1 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 2048                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeStrideTestArray([2048 x i32]* %0)                           ; inst 12
  %6 = call i32 @processWithStride([2048 x i32]* %0, i32 1)                        ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @processWithStride([2048 x i32]* %0, i32 2)                        ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @processWithStride([2048 x i32]* %0, i32 4)                        ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @processWithStride([2048 x i32]* %0, i32 8)                        ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  %10 = call i32 @processWithStride([2048 x i32]* %0, i32 16)                      ; inst 21
  call void @printlnInt(i32 %10)                                                   ; inst 22
  %11 = call i32 @processWithComplexStride([2048 x i32]* %0)                       ; inst 23
  call void @printlnInt(i32 %11)                                                   ; inst 24
  call void @printlnInt(i32 1508)                                                  ; inst 25
  ret void                                                                         ; inst 26
}

define void @initializeStrideTestArray([2048 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 2048                                                       ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = sext i32 %1 to i64                                                          ; inst 5
  %4 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %3                 ; inst 6
  %5 = srem i32 %1, 100                                                            ; inst 7
  %6 = add i32 %5, 1                                                               ; inst 8
  store i32 %6, i32* %4                                                            ; inst 9
  %7 = add i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret void                                                                         ; inst 12
}

define i32 @processWithStride([2048 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 3
  %4 = icmp slt i32 %2, 2048                                                       ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = add i32 %2, 1                                                               ; inst 9
  %9 = mul i32 %7, %8                                                              ; inst 10
  %10 = add i32 %3, %9                                                             ; inst 11
  %11 = add i32 %2, %1                                                             ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 14
}

define i32 @processWithComplexStride([2048 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%13, %_8.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%9, %_8.if.exit.0]                               ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%8, %_8.if.exit.0]                               ; inst 4
  %4 = icmp slt i32 %2, 2048                                                       ; inst 5
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 7
  %6 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %5                 ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = add i32 %3, %7                                                              ; inst 10
  %9 = add i32 %2, %1                                                              ; inst 11
  %10 = icmp eq i32 %1, 1                                                          ; inst 12
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 13
_3.if.then.0:
  br label %_8.if.exit.0                                                           ; inst 14
_4.if.else.0:
  %11 = icmp eq i32 %1, 4                                                          ; inst 15
  br i1 %11, label %_5.if.then.1, label %_6.if.else.1                              ; inst 16
_5.if.then.1:
  br label %_7.if.exit.1                                                           ; inst 17
_6.if.else.1:
  br label %_7.if.exit.1                                                           ; inst 18
_7.if.exit.1:
  %12 = phi i32 [2, %_5.if.then.1], [1, %_6.if.else.1]                             ; inst 19
  br label %_8.if.exit.0                                                           ; inst 20
_8.if.exit.0:
  %13 = phi i32 [4, %_3.if.then.0], [%12, %_7.if.exit.1]                           ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_9.while.exit.0:
  ret i32 %3                                                                       ; inst 23
}

define void @testCacheConsciousAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1509)                                                  ; inst 1
  %0 = call i32 @cacheObliviousMatrixMultiplication()                              ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @cacheConsciousSort()                                              ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @cacheAwareDataProcessing()                                        ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @temporalLocalityOptimization()                                    ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 1510)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @cacheObliviousMatrixMultiplication() {
_0.entry.0:
  %0 = alloca [64 x i32]                                                           ; inst 1
  %1 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 64                                                         ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [64 x i32]                                                           ; inst 11
  %7 = getelementptr [64 x i32], [64 x i32]* %6, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 64                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [64 x i32]                                                          ; inst 21
  %13 = getelementptr [64 x i32], [64 x i32]* %12, i32 0, i32 0                    ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 64                                                       ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  br label %_10.while.cond.0                                                       ; inst 31
_10.while.cond.0:
  %18 = phi i32 [0, %_9.array.exit.2], [%31, %_11.while.body.0]                    ; inst 32
  %19 = icmp slt i32 %18, 64                                                       ; inst 33
  br i1 %19, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 34
_11.while.body.0:
  %20 = sext i32 %18 to i64                                                        ; inst 35
  %21 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %20                   ; inst 36
  %22 = srem i32 %18, 10                                                           ; inst 37
  %23 = add i32 %22, 1                                                             ; inst 38
  store i32 %23, i32* %21                                                          ; inst 39
  %24 = sext i32 %18 to i64                                                        ; inst 40
  %25 = getelementptr [64 x i32], [64 x i32]* %6, i32 0, i64 %24                   ; inst 41
  %26 = mul i32 %18, 2                                                             ; inst 42
  %27 = srem i32 %26, 10                                                           ; inst 43
  %28 = add i32 %27, 1                                                             ; inst 44
  store i32 %28, i32* %25                                                          ; inst 45
  %29 = sext i32 %18 to i64                                                        ; inst 46
  %30 = getelementptr [64 x i32], [64 x i32]* %12, i32 0, i64 %29                  ; inst 47
  store i32 0, i32* %30                                                            ; inst 48
  %31 = add i32 %18, 1                                                             ; inst 49
  br label %_10.while.cond.0                                                       ; inst 50
_12.while.exit.0:
  call void @cacheObliviousMultiplyRecursive([64 x i32]* %0, [64 x i32]* %6, [64 x i32]* %12, i32 8, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0) ; inst 51
  br label %_13.while.cond.1                                                       ; inst 52
_13.while.cond.1:
  %32 = phi i32 [0, %_12.while.exit.0], [%38, %_14.while.body.1]                   ; inst 53
  %33 = phi i32 [0, %_12.while.exit.0], [%39, %_14.while.body.1]                   ; inst 54
  %34 = icmp slt i32 %33, 64                                                       ; inst 55
  br i1 %34, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 56
_14.while.body.1:
  %35 = sext i32 %33 to i64                                                        ; inst 57
  %36 = getelementptr [64 x i32], [64 x i32]* %12, i32 0, i64 %35                  ; inst 58
  %37 = load i32, i32* %36                                                         ; inst 59
  %38 = add i32 %32, %37                                                           ; inst 60
  %39 = add i32 %33, 1                                                             ; inst 61
  br label %_13.while.cond.1                                                       ; inst 62
_15.while.exit.1:
  ret i32 %32                                                                      ; inst 63
}

define void @cacheObliviousMultiplyRecursive([64 x i32]* %0, [64 x i32]* %1, [64 x i32]* %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) {
_0.entry.0:
  %10 = icmp sle i32 %3, 2                                                         ; inst 1
  br i1 %10, label %_1.if.then.0, label %_11.if.else.0                             ; inst 2
_1.if.then.0:
  br label %_2.while.cond.0                                                        ; inst 3
_2.while.cond.0:
  %11 = phi i32 [0, %_1.if.then.0], [%48, %_9.while.exit.1]                        ; inst 4
  %12 = icmp slt i32 %11, %3                                                       ; inst 5
  br i1 %12, label %_3.while.body.0, label %_10.while.exit.0                       ; inst 6
_3.while.body.0:
  br label %_4.while.cond.1                                                        ; inst 7
_4.while.cond.1:
  %13 = phi i32 [0, %_3.while.body.0], [%47, %_8.while.exit.2]                     ; inst 8
  %14 = icmp slt i32 %13, %3                                                       ; inst 9
  br i1 %14, label %_5.while.body.1, label %_9.while.exit.1                        ; inst 10
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 11
_6.while.cond.2:
  %15 = phi i32 [0, %_5.while.body.1], [%46, %_7.while.body.2]                     ; inst 12
  %16 = icmp slt i32 %15, %3                                                       ; inst 13
  br i1 %16, label %_7.while.body.2, label %_8.while.exit.2                        ; inst 14
_7.while.body.2:
  %17 = add i32 %8, %11                                                            ; inst 15
  %18 = mul i32 %17, 8                                                             ; inst 16
  %19 = add i32 %9, %13                                                            ; inst 17
  %20 = add i32 %18, %19                                                           ; inst 18
  %21 = sext i32 %20 to i64                                                        ; inst 19
  %22 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %21                   ; inst 20
  %23 = add i32 %8, %11                                                            ; inst 21
  %24 = mul i32 %23, 8                                                             ; inst 22
  %25 = add i32 %9, %13                                                            ; inst 23
  %26 = add i32 %24, %25                                                           ; inst 24
  %27 = sext i32 %26 to i64                                                        ; inst 25
  %28 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %27                   ; inst 26
  %29 = load i32, i32* %28                                                         ; inst 27
  %30 = add i32 %4, %11                                                            ; inst 28
  %31 = mul i32 %30, 8                                                             ; inst 29
  %32 = add i32 %5, %15                                                            ; inst 30
  %33 = add i32 %31, %32                                                           ; inst 31
  %34 = sext i32 %33 to i64                                                        ; inst 32
  %35 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %34                   ; inst 33
  %36 = load i32, i32* %35                                                         ; inst 34
  %37 = add i32 %6, %15                                                            ; inst 35
  %38 = mul i32 %37, 8                                                             ; inst 36
  %39 = add i32 %7, %13                                                            ; inst 37
  %40 = add i32 %38, %39                                                           ; inst 38
  %41 = sext i32 %40 to i64                                                        ; inst 39
  %42 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %41                   ; inst 40
  %43 = load i32, i32* %42                                                         ; inst 41
  %44 = mul i32 %36, %43                                                           ; inst 42
  %45 = add i32 %29, %44                                                           ; inst 43
  store i32 %45, i32* %22                                                          ; inst 44
  %46 = add i32 %15, 1                                                             ; inst 45
  br label %_6.while.cond.2                                                        ; inst 46
_8.while.exit.2:
  %47 = add i32 %13, 1                                                             ; inst 47
  br label %_4.while.cond.1                                                        ; inst 48
_9.while.exit.1:
  %48 = add i32 %11, 1                                                             ; inst 49
  br label %_2.while.cond.0                                                        ; inst 50
_10.while.exit.0:
  ret void                                                                         ; inst 51
_11.if.else.0:
  br label %_12.if.exit.0                                                          ; inst 52
_12.if.exit.0:
  %49 = sdiv i32 %3, 2                                                             ; inst 53
  call void @cacheObliviousMultiplyRecursive([64 x i32]* %0, [64 x i32]* %1, [64 x i32]* %2, i32 %49, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) ; inst 54
  %50 = add i32 %5, %49                                                            ; inst 55
  %51 = add i32 %6, %49                                                            ; inst 56
  call void @cacheObliviousMultiplyRecursive([64 x i32]* %0, [64 x i32]* %1, [64 x i32]* %2, i32 %49, i32 %4, i32 %50, i32 %51, i32 %7, i32 %8, i32 %9) ; inst 57
  ret void                                                                         ; inst 58
}

define i32 @cacheConsciousSort() {
_0.entry.0:
  %0 = alloca [512 x i32]                                                          ; inst 1
  %1 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 512                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  call void @initializeSortTestData([512 x i32]* %0)                               ; inst 11
  %6 = call i32 @cacheConsciousMergeSort([512 x i32]* %0, i32 0, i32 511)          ; inst 12
  ret i32 %6                                                                       ; inst 13
}

define void @initializeSortTestData([512 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [13579, %_0.entry.0], [%9, %_5.if.exit.0]                           ; inst 3
  %3 = icmp slt i32 %1, 512                                                        ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = mul i32 %2, 1103                                                            ; inst 6
  %5 = add i32 %4, 4721                                                            ; inst 7
  %6 = srem i32 %5, 1048583                                                        ; inst 8
  %7 = icmp slt i32 %6, 0                                                          ; inst 9
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %8 = sub i32 0, %6                                                               ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %9 = phi i32 [%8, %_3.if.then.0], [%6, %_4.if.else.0]                            ; inst 14
  %10 = sext i32 %1 to i64                                                         ; inst 15
  %11 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %10                 ; inst 16
  %12 = srem i32 %9, 1000                                                          ; inst 17
  store i32 %12, i32* %11                                                          ; inst 18
  %13 = add i32 %1, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define i32 @cacheConsciousMergeSort([512 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sge i32 %1, %2                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = sub i32 %2, %1                                                              ; inst 5
  %5 = add i32 %4, 1                                                               ; inst 6
  %6 = icmp sle i32 %5, 16                                                         ; inst 7
  br i1 %6, label %_4.if.then.1, label %_5.if.else.1                               ; inst 8
_4.if.then.1:
  %7 = call i32 @insertionSort([512 x i32]* %0, i32 %1, i32 %2)                    ; inst 9
  ret i32 %7                                                                       ; inst 10
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 11
_6.if.exit.1:
  %8 = sub i32 %2, %1                                                              ; inst 12
  %9 = sdiv i32 %8, 2                                                              ; inst 13
  %10 = add i32 %1, %9                                                             ; inst 14
  %11 = call i32 @cacheConsciousMergeSort([512 x i32]* %0, i32 %1, i32 %10)        ; inst 15
  %12 = add i32 %10, 1                                                             ; inst 16
  %13 = call i32 @cacheConsciousMergeSort([512 x i32]* %0, i32 %12, i32 %2)        ; inst 17
  %14 = call i32 @cacheFriendlyMerge([512 x i32]* %0, i32 %1, i32 %10, i32 %2)     ; inst 18
  %15 = add i32 %11, %13                                                           ; inst 19
  %16 = add i32 %15, %14                                                           ; inst 20
  ret i32 %16                                                                      ; inst 21
}

define i32 @insertionSort([512 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = add i32 %1, 1                                                               ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [%3, %_0.entry.0], [%33, %_11.if.exit.0]                            ; inst 3
  %5 = phi i32 [0, %_0.entry.0], [%29, %_11.if.exit.0]                             ; inst 4
  %6 = icmp sle i32 %4, %2                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  %7 = sext i32 %4 to i64                                                          ; inst 7
  %8 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %7                   ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = sub i32 %4, 1                                                              ; inst 10
  br label %_3.while.cond.1                                                        ; inst 11
_3.while.cond.1:
  %11 = phi i32 [%10, %_2.while.body.0], [%25, %_7.while.body.1]                   ; inst 12
  %12 = phi i32 [%5, %_2.while.body.0], [%26, %_7.while.body.1]                    ; inst 13
  %13 = icmp sge i32 %11, %1                                                       ; inst 14
  br i1 %13, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 15
_4.lazy.then.0:
  %14 = sext i32 %11 to i64                                                        ; inst 16
  %15 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %14                 ; inst 17
  %16 = load i32, i32* %15                                                         ; inst 18
  %17 = icmp sgt i32 %16, %9                                                       ; inst 19
  br label %_6.lazy.exit.0                                                         ; inst 20
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 21
_6.lazy.exit.0:
  %18 = phi i1 [%17, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 22
  br i1 %18, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 23
_7.while.body.1:
  %19 = add i32 %11, 1                                                             ; inst 24
  %20 = sext i32 %19 to i64                                                        ; inst 25
  %21 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %20                 ; inst 26
  %22 = sext i32 %11 to i64                                                        ; inst 27
  %23 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %22                 ; inst 28
  %24 = load i32, i32* %23                                                         ; inst 29
  store i32 %24, i32* %21                                                          ; inst 30
  %25 = sub i32 %11, 1                                                             ; inst 31
  %26 = add i32 %12, 1                                                             ; inst 32
  br label %_3.while.cond.1                                                        ; inst 33
_8.while.exit.1:
  %27 = icmp sge i32 %11, %1                                                       ; inst 34
  br i1 %27, label %_9.if.then.0, label %_10.if.else.0                             ; inst 35
_9.if.then.0:
  %28 = add i32 %12, 1                                                             ; inst 36
  br label %_11.if.exit.0                                                          ; inst 37
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 38
_11.if.exit.0:
  %29 = phi i32 [%28, %_9.if.then.0], [%12, %_10.if.else.0]                        ; inst 39
  %30 = add i32 %11, 1                                                             ; inst 40
  %31 = sext i32 %30 to i64                                                        ; inst 41
  %32 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %31                 ; inst 42
  store i32 %9, i32* %32                                                           ; inst 43
  %33 = add i32 %4, 1                                                              ; inst 44
  br label %_1.while.cond.0                                                        ; inst 45
_12.while.exit.0:
  ret i32 %5                                                                       ; inst 46
}

define i32 @cacheFriendlyMerge([512 x i32]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = sub i32 %2, %1                                                              ; inst 1
  %5 = add i32 %4, 1                                                               ; inst 2
  %6 = sub i32 %3, %2                                                              ; inst 3
  %7 = alloca [128 x i32]                                                          ; inst 4
  %8 = getelementptr [128 x i32], [128 x i32]* %7, i32 0, i32 0                    ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%12, %_2.array.body.0]                           ; inst 7
  %10 = icmp slt i32 %9, 128                                                       ; inst 8
  br i1 %10, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 9
_2.array.body.0:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 10
  store i32 0, i32* %11                                                            ; inst 11
  %12 = add i32 %9, 1                                                              ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  %13 = alloca [128 x i32]                                                         ; inst 14
  %14 = getelementptr [128 x i32], [128 x i32]* %13, i32 0, i32 0                  ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %15 = phi i32 [0, %_3.array.exit.0], [%18, %_5.array.body.1]                     ; inst 17
  %16 = icmp slt i32 %15, 128                                                      ; inst 18
  br i1 %16, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 20
  store i32 0, i32* %17                                                            ; inst 21
  %18 = add i32 %15, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %19 = phi i32 [0, %_6.array.exit.1], [%29, %_11.while.body.0]                    ; inst 25
  %20 = icmp slt i32 %19, %5                                                       ; inst 26
  br i1 %20, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 27
_8.lazy.then.0:
  %21 = icmp slt i32 %19, 128                                                      ; inst 28
  br label %_10.lazy.exit.0                                                        ; inst 29
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 30
_10.lazy.exit.0:
  %22 = phi i1 [%21, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 31
  br i1 %22, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 32
_11.while.body.0:
  %23 = sext i32 %19 to i64                                                        ; inst 33
  %24 = getelementptr [128 x i32], [128 x i32]* %7, i32 0, i64 %23                 ; inst 34
  %25 = add i32 %1, %19                                                            ; inst 35
  %26 = sext i32 %25 to i64                                                        ; inst 36
  %27 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %26                 ; inst 37
  %28 = load i32, i32* %27                                                         ; inst 38
  store i32 %28, i32* %24                                                          ; inst 39
  %29 = add i32 %19, 1                                                             ; inst 40
  br label %_7.while.cond.0                                                        ; inst 41
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 42
_13.while.cond.1:
  %30 = phi i32 [0, %_12.while.exit.0], [%41, %_17.while.body.1]                   ; inst 43
  %31 = icmp slt i32 %30, %6                                                       ; inst 44
  br i1 %31, label %_14.lazy.then.1, label %_15.lazy.else.1                        ; inst 45
_14.lazy.then.1:
  %32 = icmp slt i32 %30, 128                                                      ; inst 46
  br label %_16.lazy.exit.1                                                        ; inst 47
_15.lazy.else.1:
  br label %_16.lazy.exit.1                                                        ; inst 48
_16.lazy.exit.1:
  %33 = phi i1 [%32, %_14.lazy.then.1], [0, %_15.lazy.else.1]                      ; inst 49
  br i1 %33, label %_17.while.body.1, label %_18.while.exit.1                      ; inst 50
_17.while.body.1:
  %34 = sext i32 %30 to i64                                                        ; inst 51
  %35 = getelementptr [128 x i32], [128 x i32]* %13, i32 0, i64 %34                ; inst 52
  %36 = add i32 %2, 1                                                              ; inst 53
  %37 = add i32 %36, %30                                                           ; inst 54
  %38 = sext i32 %37 to i64                                                        ; inst 55
  %39 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %38                 ; inst 56
  %40 = load i32, i32* %39                                                         ; inst 57
  store i32 %40, i32* %35                                                          ; inst 58
  %41 = add i32 %30, 1                                                             ; inst 59
  br label %_13.while.cond.1                                                       ; inst 60
_18.while.exit.1:
  br label %_19.while.cond.2                                                       ; inst 61
_19.while.cond.2:
  %42 = phi i32 [%1, %_18.while.exit.1], [%75, %_32.if.exit.0]                     ; inst 62
  %43 = phi i32 [0, %_18.while.exit.1], [%53, %_32.if.exit.0]                      ; inst 63
  %44 = phi i32 [0, %_18.while.exit.1], [%73, %_32.if.exit.0]                      ; inst 64
  %45 = phi i32 [0, %_18.while.exit.1], [%74, %_32.if.exit.0]                      ; inst 65
  %46 = icmp slt i32 %45, %5                                                       ; inst 66
  br i1 %46, label %_20.lazy.then.2, label %_21.lazy.else.2                        ; inst 67
_20.lazy.then.2:
  %47 = icmp slt i32 %44, %6                                                       ; inst 68
  br label %_22.lazy.exit.2                                                        ; inst 69
_21.lazy.else.2:
  br label %_22.lazy.exit.2                                                        ; inst 70
_22.lazy.exit.2:
  %48 = phi i1 [%47, %_20.lazy.then.2], [0, %_21.lazy.else.2]                      ; inst 71
  br i1 %48, label %_23.lazy.then.3, label %_24.lazy.else.3                        ; inst 72
_23.lazy.then.3:
  %49 = icmp slt i32 %45, 128                                                      ; inst 73
  br label %_25.lazy.exit.3                                                        ; inst 74
_24.lazy.else.3:
  br label %_25.lazy.exit.3                                                        ; inst 75
_25.lazy.exit.3:
  %50 = phi i1 [%49, %_23.lazy.then.3], [0, %_24.lazy.else.3]                      ; inst 76
  br i1 %50, label %_26.lazy.then.4, label %_27.lazy.else.4                        ; inst 77
_26.lazy.then.4:
  %51 = icmp slt i32 %44, 128                                                      ; inst 78
  br label %_28.lazy.exit.4                                                        ; inst 79
_27.lazy.else.4:
  br label %_28.lazy.exit.4                                                        ; inst 80
_28.lazy.exit.4:
  %52 = phi i1 [%51, %_26.lazy.then.4], [0, %_27.lazy.else.4]                      ; inst 81
  br i1 %52, label %_29.while.body.2, label %_33.while.exit.2                      ; inst 82
_29.while.body.2:
  %53 = add i32 %43, 1                                                             ; inst 83
  %54 = sext i32 %45 to i64                                                        ; inst 84
  %55 = getelementptr [128 x i32], [128 x i32]* %7, i32 0, i64 %54                 ; inst 85
  %56 = load i32, i32* %55                                                         ; inst 86
  %57 = sext i32 %44 to i64                                                        ; inst 87
  %58 = getelementptr [128 x i32], [128 x i32]* %13, i32 0, i64 %57                ; inst 88
  %59 = load i32, i32* %58                                                         ; inst 89
  %60 = icmp sle i32 %56, %59                                                      ; inst 90
  br i1 %60, label %_30.if.then.0, label %_31.if.else.0                            ; inst 91
_30.if.then.0:
  %61 = sext i32 %42 to i64                                                        ; inst 92
  %62 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %61                 ; inst 93
  %63 = sext i32 %45 to i64                                                        ; inst 94
  %64 = getelementptr [128 x i32], [128 x i32]* %7, i32 0, i64 %63                 ; inst 95
  %65 = load i32, i32* %64                                                         ; inst 96
  store i32 %65, i32* %62                                                          ; inst 97
  %66 = add i32 %45, 1                                                             ; inst 98
  br label %_32.if.exit.0                                                          ; inst 99
_31.if.else.0:
  %67 = sext i32 %42 to i64                                                        ; inst 100
  %68 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %67                 ; inst 101
  %69 = sext i32 %44 to i64                                                        ; inst 102
  %70 = getelementptr [128 x i32], [128 x i32]* %13, i32 0, i64 %69                ; inst 103
  %71 = load i32, i32* %70                                                         ; inst 104
  store i32 %71, i32* %68                                                          ; inst 105
  %72 = add i32 %44, 1                                                             ; inst 106
  br label %_32.if.exit.0                                                          ; inst 107
_32.if.exit.0:
  %73 = phi i32 [%44, %_30.if.then.0], [%72, %_31.if.else.0]                       ; inst 108
  %74 = phi i32 [%66, %_30.if.then.0], [%45, %_31.if.else.0]                       ; inst 109
  %75 = add i32 %42, 1                                                             ; inst 110
  br label %_19.while.cond.2                                                       ; inst 111
_33.while.exit.2:
  br label %_34.while.cond.3                                                       ; inst 112
_34.while.cond.3:
  %76 = phi i32 [%42, %_33.while.exit.2], [%87, %_38.while.body.3]                 ; inst 113
  %77 = phi i32 [%45, %_33.while.exit.2], [%86, %_38.while.body.3]                 ; inst 114
  %78 = icmp slt i32 %77, %5                                                       ; inst 115
  br i1 %78, label %_35.lazy.then.5, label %_36.lazy.else.5                        ; inst 116
_35.lazy.then.5:
  %79 = icmp slt i32 %77, 128                                                      ; inst 117
  br label %_37.lazy.exit.5                                                        ; inst 118
_36.lazy.else.5:
  br label %_37.lazy.exit.5                                                        ; inst 119
_37.lazy.exit.5:
  %80 = phi i1 [%79, %_35.lazy.then.5], [0, %_36.lazy.else.5]                      ; inst 120
  br i1 %80, label %_38.while.body.3, label %_39.while.exit.3                      ; inst 121
_38.while.body.3:
  %81 = sext i32 %76 to i64                                                        ; inst 122
  %82 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %81                 ; inst 123
  %83 = sext i32 %77 to i64                                                        ; inst 124
  %84 = getelementptr [128 x i32], [128 x i32]* %7, i32 0, i64 %83                 ; inst 125
  %85 = load i32, i32* %84                                                         ; inst 126
  store i32 %85, i32* %82                                                          ; inst 127
  %86 = add i32 %77, 1                                                             ; inst 128
  %87 = add i32 %76, 1                                                             ; inst 129
  br label %_34.while.cond.3                                                       ; inst 130
_39.while.exit.3:
  br label %_40.while.cond.4                                                       ; inst 131
_40.while.cond.4:
  %88 = phi i32 [%76, %_39.while.exit.3], [%99, %_44.while.body.4]                 ; inst 132
  %89 = phi i32 [%44, %_39.while.exit.3], [%98, %_44.while.body.4]                 ; inst 133
  %90 = icmp slt i32 %89, %6                                                       ; inst 134
  br i1 %90, label %_41.lazy.then.6, label %_42.lazy.else.6                        ; inst 135
_41.lazy.then.6:
  %91 = icmp slt i32 %89, 128                                                      ; inst 136
  br label %_43.lazy.exit.6                                                        ; inst 137
_42.lazy.else.6:
  br label %_43.lazy.exit.6                                                        ; inst 138
_43.lazy.exit.6:
  %92 = phi i1 [%91, %_41.lazy.then.6], [0, %_42.lazy.else.6]                      ; inst 139
  br i1 %92, label %_44.while.body.4, label %_45.while.exit.4                      ; inst 140
_44.while.body.4:
  %93 = sext i32 %88 to i64                                                        ; inst 141
  %94 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %93                 ; inst 142
  %95 = sext i32 %89 to i64                                                        ; inst 143
  %96 = getelementptr [128 x i32], [128 x i32]* %13, i32 0, i64 %95                ; inst 144
  %97 = load i32, i32* %96                                                         ; inst 145
  store i32 %97, i32* %94                                                          ; inst 146
  %98 = add i32 %89, 1                                                             ; inst 147
  %99 = add i32 %88, 1                                                             ; inst 148
  br label %_40.while.cond.4                                                       ; inst 149
_45.while.exit.4:
  ret i32 %43                                                                      ; inst 150
}

define i32 @cacheAwareDataProcessing() {
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
  call void @initializeDataGrid([1024 x i32]* %0)                                  ; inst 11
  %6 = call i32 @processDataInBlocks([1024 x i32]* %0)                             ; inst 12
  ret i32 %6                                                                       ; inst 13
}

define void @initializeDataGrid([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i64 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %2 = icmp ult i64 %1, 1024                                                       ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %1                 ; inst 5
  %4 = urem i64 %1, 50                                                             ; inst 6
  %5 = trunc i64 %4 to i32                                                         ; inst 7
  %6 = add i32 %5, 1                                                               ; inst 8
  store i32 %6, i32* %3                                                            ; inst 9
  %7 = add i64 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret void                                                                         ; inst 12
}

define i32 @processDataInBlocks([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i64 [0, %_0.entry.0], [%32, %_17.while.exit.1]                          ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_17.while.exit.1]                           ; inst 3
  %3 = icmp ult i64 %1, 32                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i64 [0, %_2.while.body.0], [%31, %_16.while.exit.2]                     ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%9, %_16.while.exit.2]                     ; inst 8
  %6 = icmp ult i64 %4, 32                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_17.while.exit.1                        ; inst 10
_4.while.body.1:
  %7 = add i64 %1, 8                                                               ; inst 11
  br label %_5.while.cond.2                                                        ; inst 12
_5.while.cond.2:
  %8 = phi i64 [%1, %_4.while.body.1], [%30, %_15.while.exit.3]                    ; inst 13
  %9 = phi i32 [%5, %_4.while.body.1], [%14, %_15.while.exit.3]                    ; inst 14
  %10 = icmp ult i64 %8, %7                                                        ; inst 15
  br i1 %10, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 16
_6.lazy.then.0:
  %11 = icmp ult i64 %8, 32                                                        ; inst 17
  br label %_8.lazy.exit.0                                                         ; inst 18
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 19
_8.lazy.exit.0:
  %12 = phi i1 [%11, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 20
  br i1 %12, label %_9.while.body.2, label %_16.while.exit.2                       ; inst 21
_9.while.body.2:
  %13 = add i64 %4, 8                                                              ; inst 22
  br label %_10.while.cond.3                                                       ; inst 23
_10.while.cond.3:
  %14 = phi i32 [%9, %_9.while.body.2], [%28, %_14.while.body.3]                   ; inst 24
  %15 = phi i64 [%4, %_9.while.body.2], [%29, %_14.while.body.3]                   ; inst 25
  %16 = icmp ult i64 %15, %13                                                      ; inst 26
  br i1 %16, label %_11.lazy.then.1, label %_12.lazy.else.1                        ; inst 27
_11.lazy.then.1:
  %17 = icmp ult i64 %15, 32                                                       ; inst 28
  br label %_13.lazy.exit.1                                                        ; inst 29
_12.lazy.else.1:
  br label %_13.lazy.exit.1                                                        ; inst 30
_13.lazy.exit.1:
  %18 = phi i1 [%17, %_11.lazy.then.1], [0, %_12.lazy.else.1]                      ; inst 31
  br i1 %18, label %_14.while.body.3, label %_15.while.exit.3                      ; inst 32
_14.while.body.3:
  %19 = mul i64 %8, 32                                                             ; inst 33
  %20 = add i64 %19, %15                                                           ; inst 34
  %21 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %20               ; inst 35
  %22 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %20               ; inst 36
  %23 = load i32, i32* %22                                                         ; inst 37
  %24 = mul i32 %23, 2                                                             ; inst 38
  %25 = add i32 %24, 1                                                             ; inst 39
  store i32 %25, i32* %21                                                          ; inst 40
  %26 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %20               ; inst 41
  %27 = load i32, i32* %26                                                         ; inst 42
  %28 = add i32 %14, %27                                                           ; inst 43
  %29 = add i64 %15, 1                                                             ; inst 44
  br label %_10.while.cond.3                                                       ; inst 45
_15.while.exit.3:
  %30 = add i64 %8, 1                                                              ; inst 46
  br label %_5.while.cond.2                                                        ; inst 47
_16.while.exit.2:
  %31 = add i64 %4, 8                                                              ; inst 48
  br label %_3.while.cond.1                                                        ; inst 49
_17.while.exit.1:
  %32 = add i64 %1, 8                                                              ; inst 50
  br label %_1.while.cond.0                                                        ; inst 51
_18.while.exit.0:
  ret i32 %2                                                                       ; inst 52
}

define i32 @temporalLocalityOptimization() {
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
  call void @initializeWorkingSet([256 x i32]* %0)                                 ; inst 11
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%11, %_5.while.body.0]                      ; inst 13
  %7 = phi i32 [0, %_3.array.exit.0], [%10, %_5.while.body.0]                      ; inst 14
  %8 = icmp slt i32 %6, 100                                                        ; inst 15
  br i1 %8, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 16
_5.while.body.0:
  %9 = call i32 @processWorkingSet([256 x i32]* %0)                                ; inst 17
  %10 = add i32 %7, %9                                                             ; inst 18
  %11 = add i32 %6, 1                                                              ; inst 19
  br label %_4.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret i32 %7                                                                       ; inst 21
}

define void @initializeWorkingSet([256 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 256                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = sext i32 %1 to i64                                                          ; inst 5
  %4 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %3                   ; inst 6
  %5 = add i32 %1, 1                                                               ; inst 7
  store i32 %5, i32* %4                                                            ; inst 8
  %6 = add i32 %1, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  ret void                                                                         ; inst 11
}

define i32 @processWorkingSet([256 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 3
  %3 = icmp slt i32 %2, 256                                                        ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 6
  %5 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %4                   ; inst 7
  %6 = sext i32 %2 to i64                                                          ; inst 8
  %7 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %6                   ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = add i32 %8, 1                                                               ; inst 11
  store i32 %9, i32* %5                                                            ; inst 12
  %10 = add i32 %1, 1                                                              ; inst 13
  %11 = add i32 %2, 1                                                              ; inst 14
  br label %_1.while.cond.0                                                        ; inst 15
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 16
_4.while.cond.1:
  %12 = phi i32 [%1, %_3.while.exit.0], [%21, %_5.while.body.1]                    ; inst 17
  %13 = phi i32 [0, %_3.while.exit.0], [%22, %_5.while.body.1]                     ; inst 18
  %14 = icmp slt i32 %13, 256                                                      ; inst 19
  br i1 %14, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 20
_5.while.body.1:
  %15 = sext i32 %13 to i64                                                        ; inst 21
  %16 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %15                 ; inst 22
  %17 = sext i32 %13 to i64                                                        ; inst 23
  %18 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %17                 ; inst 24
  %19 = load i32, i32* %18                                                         ; inst 25
  %20 = mul i32 %19, 2                                                             ; inst 26
  store i32 %20, i32* %16                                                          ; inst 27
  %21 = add i32 %12, 1                                                             ; inst 28
  %22 = add i32 %13, 1                                                             ; inst 29
  br label %_4.while.cond.1                                                        ; inst 30
_6.while.exit.1:
  br label %_7.while.cond.2                                                        ; inst 31
_7.while.cond.2:
  %23 = phi i32 [%12, %_6.while.exit.1], [%37, %_11.if.exit.0]                     ; inst 32
  %24 = phi i32 [0, %_6.while.exit.1], [%38, %_11.if.exit.0]                       ; inst 33
  %25 = icmp slt i32 %24, 256                                                      ; inst 34
  br i1 %25, label %_8.while.body.2, label %_12.while.exit.2                       ; inst 35
_8.while.body.2:
  %26 = sext i32 %24 to i64                                                        ; inst 36
  %27 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %26                 ; inst 37
  %28 = load i32, i32* %27                                                         ; inst 38
  %29 = srem i32 %28, 2                                                            ; inst 39
  %30 = icmp eq i32 %29, 0                                                         ; inst 40
  br i1 %30, label %_9.if.then.0, label %_10.if.else.0                             ; inst 41
_9.if.then.0:
  %31 = sext i32 %24 to i64                                                        ; inst 42
  %32 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %31                 ; inst 43
  %33 = sext i32 %24 to i64                                                        ; inst 44
  %34 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %33                 ; inst 45
  %35 = load i32, i32* %34                                                         ; inst 46
  %36 = sdiv i32 %35, 2                                                            ; inst 47
  store i32 %36, i32* %32                                                          ; inst 48
  br label %_11.if.exit.0                                                          ; inst 49
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 50
_11.if.exit.0:
  %37 = add i32 %23, 1                                                             ; inst 51
  %38 = add i32 %24, 1                                                             ; inst 52
  br label %_7.while.cond.2                                                        ; inst 53
_12.while.exit.2:
  ret i32 %23                                                                      ; inst 54
}

