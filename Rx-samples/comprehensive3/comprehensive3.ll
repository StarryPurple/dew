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
  call void @printlnInt(i32 3000)                                                  ; inst 1
  call void @performMathematicalSeries()                                           ; inst 2
  call void @performNumberTheoryAlgorithms()                                       ; inst 3
  call void @performLinearAlgebraOperations()                                      ; inst 4
  call void @performCombinatorialAlgorithms()                                      ; inst 5
  call void @performCryptographicOperations()                                      ; inst 6
  call void @printlnInt(i32 3999)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @performMathematicalSeries() {
_0.entry.0:
  call void @printlnInt(i32 3001)                                                  ; inst 1
  %0 = call i32 @calculatePiApproximation(i32 1000)                                ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @calculateFibonacciSum(i32 50)                                     ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @calculateFactorialSeries(i32 20)                                  ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @calculateHarmonicSeries(i32 10000)                                ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  %4 = call i32 @calculateGeometricSeries(i32 100, i32 3)                          ; inst 10
  call void @printlnInt(i32 %4)                                                    ; inst 11
  call void @printlnInt(i32 3002)                                                  ; inst 12
  ret void                                                                         ; inst 13
}

define i32 @calculatePiApproximation(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [1, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 3
  %3 = phi i32 [1, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 4
  %4 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 5
  %5 = icmp slt i32 %1, %0                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 7
_2.while.body.0:
  %6 = mul i32 %2, 10000                                                           ; inst 8
  %7 = sdiv i32 %6, %3                                                             ; inst 9
  %8 = add i32 %4, %7                                                              ; inst 10
  %9 = sub i32 0, %2                                                               ; inst 11
  %10 = add i32 %3, 2                                                              ; inst 12
  %11 = add i32 %1, 1                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  %12 = mul i32 %4, 4                                                              ; inst 15
  %13 = srem i32 %12, 100000                                                       ; inst 16
  ret i32 %13                                                                      ; inst 17
}

define i32 @calculateFibonacciSum(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [1, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%2, %_2.while.body.0]                            ; inst 4
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 5
  %5 = icmp slt i32 %1, %0                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 7
_2.while.body.0:
  %6 = add i32 %4, %2                                                              ; inst 8
  %7 = srem i32 %6, 1000000                                                        ; inst 9
  %8 = add i32 %3, %2                                                              ; inst 10
  %9 = srem i32 %8, 1000000                                                        ; inst 11
  %10 = add i32 %1, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %11 = srem i32 %4, 10000                                                         ; inst 14
  ret i32 %11                                                                      ; inst 15
}

define i32 @calculateFactorialSeries(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [1, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 4
  %4 = icmp sle i32 %1, %0                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = mul i32 %2, %1                                                              ; inst 7
  %6 = srem i32 %5, 1000000                                                        ; inst 8
  %7 = add i32 %3, %6                                                              ; inst 9
  %8 = srem i32 %7, 1000000                                                        ; inst 10
  %9 = add i32 %1, 1                                                               ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %10 = srem i32 %3, 10000                                                         ; inst 13
  ret i32 %10                                                                      ; inst 14
}

define i32 @calculateHarmonicSeries(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sdiv i32 10000, %1                                                          ; inst 6
  %5 = add i32 %2, %4                                                              ; inst 7
  %6 = add i32 %1, 1                                                               ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  %7 = srem i32 %2, 10000                                                          ; inst 10
  ret i32 %7                                                                       ; inst 11
}

define i32 @calculateGeometricSeries(i32 %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [1, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 4
  %5 = icmp slt i32 %2, %0                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = add i32 %4, %3                                                              ; inst 7
  %7 = srem i32 %6, 1000000                                                        ; inst 8
  %8 = mul i32 %3, %1                                                              ; inst 9
  %9 = srem i32 %8, 1000000                                                        ; inst 10
  %10 = add i32 %2, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %11 = srem i32 %4, 10000                                                         ; inst 13
  ret i32 %11                                                                      ; inst 14
}

define void @performNumberTheoryAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 3003)                                                  ; inst 1
  %0 = call i32 @sieveOfEratosthenes(i64 2000)                                     ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @performGCDOperations(i32 100)                                     ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @performModularExponentiation()                                    ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @calculateTotientSum(i32 100)                                      ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  %4 = call i32 @findPerfectNumbers(i32 1000)                                      ; inst 10
  call void @printlnInt(i32 %4)                                                    ; inst 11
  call void @printlnInt(i32 3004)                                                  ; inst 12
  ret void                                                                         ; inst 13
}

define i32 @sieveOfEratosthenes(i64 %0) {
_0.entry.0:
  %1 = alloca [2000 x i32]                                                         ; inst 1
  %2 = getelementptr [2000 x i32], [2000 x i32]* %1, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 2000                                                       ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i64 [2, %_3.array.exit.0], [%10, %_5.while.body.0]                      ; inst 12
  %8 = icmp ult i64 %7, %0                                                         ; inst 13
  br i1 %8, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 14
_5.while.body.0:
  %9 = getelementptr [2000 x i32], [2000 x i32]* %1, i32 0, i64 %7                 ; inst 15
  store i32 1, i32* %9                                                             ; inst 16
  %10 = add i64 %7, 1                                                              ; inst 17
  br label %_4.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 19
_7.while.cond.1:
  %11 = phi i64 [2, %_6.while.exit.0], [%22, %_14.if.exit.0]                       ; inst 20
  %12 = mul i64 %11, %11                                                           ; inst 21
  %13 = icmp ult i64 %12, %0                                                       ; inst 22
  br i1 %13, label %_8.while.body.1, label %_15.while.exit.1                       ; inst 23
_8.while.body.1:
  %14 = getelementptr [2000 x i32], [2000 x i32]* %1, i32 0, i64 %11               ; inst 24
  %15 = load i32, i32* %14                                                         ; inst 25
  %16 = icmp eq i32 %15, 1                                                         ; inst 26
  br i1 %16, label %_9.if.then.0, label %_13.if.else.0                             ; inst 27
_9.if.then.0:
  %17 = mul i64 %11, %11                                                           ; inst 28
  br label %_10.while.cond.2                                                       ; inst 29
_10.while.cond.2:
  %18 = phi i64 [%17, %_9.if.then.0], [%21, %_11.while.body.2]                     ; inst 30
  %19 = icmp ult i64 %18, %0                                                       ; inst 31
  br i1 %19, label %_11.while.body.2, label %_12.while.exit.2                      ; inst 32
_11.while.body.2:
  %20 = getelementptr [2000 x i32], [2000 x i32]* %1, i32 0, i64 %18               ; inst 33
  store i32 0, i32* %20                                                            ; inst 34
  %21 = add i64 %18, %11                                                           ; inst 35
  br label %_10.while.cond.2                                                       ; inst 36
_12.while.exit.2:
  br label %_14.if.exit.0                                                          ; inst 37
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 38
_14.if.exit.0:
  %22 = add i64 %11, 1                                                             ; inst 39
  br label %_7.while.cond.1                                                        ; inst 40
_15.while.exit.1:
  br label %_16.while.cond.3                                                       ; inst 41
_16.while.cond.3:
  %23 = phi i32 [0, %_15.while.exit.1], [%30, %_20.if.exit.1]                      ; inst 42
  %24 = phi i64 [2, %_15.while.exit.1], [%31, %_20.if.exit.1]                      ; inst 43
  %25 = icmp ult i64 %24, %0                                                       ; inst 44
  br i1 %25, label %_17.while.body.3, label %_21.while.exit.3                      ; inst 45
_17.while.body.3:
  %26 = getelementptr [2000 x i32], [2000 x i32]* %1, i32 0, i64 %24               ; inst 46
  %27 = load i32, i32* %26                                                         ; inst 47
  %28 = icmp eq i32 %27, 1                                                         ; inst 48
  br i1 %28, label %_18.if.then.1, label %_19.if.else.1                            ; inst 49
_18.if.then.1:
  %29 = add i32 %23, 1                                                             ; inst 50
  br label %_20.if.exit.1                                                          ; inst 51
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 52
_20.if.exit.1:
  %30 = phi i32 [%29, %_18.if.then.1], [%23, %_19.if.else.1]                       ; inst 53
  %31 = add i64 %24, 1                                                             ; inst 54
  br label %_16.while.cond.3                                                       ; inst 55
_21.while.exit.3:
  ret i32 %23                                                                      ; inst 56
}

define i32 @performGCDOperations(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%20, %_5.while.exit.1]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_5.while.exit.1]                            ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [1, %_2.while.body.0], [%19, %_4.while.body.1]                      ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%18, %_4.while.body.1]                     ; inst 8
  %6 = icmp sle i32 %4, %0                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = mul i32 %1, 13                                                              ; inst 11
  %8 = add i32 %7, 7                                                               ; inst 12
  %9 = mul i32 %4, 17                                                              ; inst 13
  %10 = add i32 %9, 11                                                             ; inst 14
  %11 = call i32 @euclideanGCD(i32 %8, i32 %10)                                    ; inst 15
  %12 = add i32 %5, %11                                                            ; inst 16
  %13 = mul i32 %1, 19                                                             ; inst 17
  %14 = add i32 %13, 3                                                             ; inst 18
  %15 = mul i32 %4, 23                                                             ; inst 19
  %16 = add i32 %15, 5                                                             ; inst 20
  %17 = call i32 @binaryGCD(i32 %14, i32 %16)                                      ; inst 21
  %18 = add i32 %12, %17                                                           ; inst 22
  %19 = add i32 %4, 10                                                             ; inst 23
  br label %_3.while.cond.1                                                        ; inst 24
_5.while.exit.1:
  %20 = add i32 %1, 10                                                             ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_6.while.exit.0:
  %21 = srem i32 %2, 10000                                                         ; inst 27
  ret i32 %21                                                                      ; inst 28
}

define i32 @euclideanGCD(i32 %0, i32 %1) {
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

define i32 @binaryGCD(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = icmp eq i32 %1, 0                                                           ; inst 5
  br i1 %3, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 %0                                                                       ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  br label %_7.while.cond.0                                                        ; inst 9
_7.while.cond.0:
  %4 = phi i32 [0, %_6.if.exit.1], [%10, %_8.while.body.0]                         ; inst 10
  %5 = phi i32 [%1, %_6.if.exit.1], [%12, %_8.while.body.0]                        ; inst 11
  %6 = phi i32 [%0, %_6.if.exit.1], [%11, %_8.while.body.0]                        ; inst 12
  %7 = or i32 %6, %5                                                               ; inst 13
  %8 = and i32 %7, 1                                                               ; inst 14
  %9 = icmp eq i32 %8, 0                                                           ; inst 15
  br i1 %9, label %_8.while.body.0, label %_9.while.exit.0                         ; inst 16
_8.while.body.0:
  %10 = add i32 %4, 1                                                              ; inst 17
  %11 = ashr i32 %6, 1                                                             ; inst 18
  %12 = ashr i32 %5, 1                                                             ; inst 19
  br label %_7.while.cond.0                                                        ; inst 20
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 21
_10.while.cond.1:
  %13 = phi i32 [%6, %_9.while.exit.0], [%16, %_11.while.body.1]                   ; inst 22
  %14 = and i32 %13, 1                                                             ; inst 23
  %15 = icmp eq i32 %14, 0                                                         ; inst 24
  br i1 %15, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 25
_11.while.body.1:
  %16 = ashr i32 %13, 1                                                            ; inst 26
  br label %_10.while.cond.1                                                       ; inst 27
_12.while.exit.1:
  br label %_13.while.cond.2                                                       ; inst 28
_13.while.cond.2:
  %17 = phi i32 [%5, %_12.while.exit.1], [%27, %_20.if.exit.2]                     ; inst 29
  %18 = phi i32 [%13, %_12.while.exit.1], [%26, %_20.if.exit.2]                    ; inst 30
  %19 = icmp ne i32 %17, 0                                                         ; inst 31
  br i1 %19, label %_14.while.body.2, label %_21.while.exit.2                      ; inst 32
_14.while.body.2:
  br label %_15.while.cond.3                                                       ; inst 33
_15.while.cond.3:
  %20 = phi i32 [%17, %_14.while.body.2], [%23, %_16.while.body.3]                 ; inst 34
  %21 = and i32 %20, 1                                                             ; inst 35
  %22 = icmp eq i32 %21, 0                                                         ; inst 36
  br i1 %22, label %_16.while.body.3, label %_17.while.exit.3                      ; inst 37
_16.while.body.3:
  %23 = ashr i32 %20, 1                                                            ; inst 38
  br label %_15.while.cond.3                                                       ; inst 39
_17.while.exit.3:
  %24 = icmp sgt i32 %18, %20                                                      ; inst 40
  br i1 %24, label %_18.if.then.2, label %_19.if.else.2                            ; inst 41
_18.if.then.2:
  br label %_20.if.exit.2                                                          ; inst 42
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 43
_20.if.exit.2:
  %25 = phi i32 [%18, %_18.if.then.2], [%20, %_19.if.else.2]                       ; inst 44
  %26 = phi i32 [%20, %_18.if.then.2], [%18, %_19.if.else.2]                       ; inst 45
  %27 = sub i32 %25, %26                                                           ; inst 46
  br label %_13.while.cond.2                                                       ; inst 47
_21.while.exit.2:
  %28 = shl i32 %18, %4                                                            ; inst 48
  ret i32 %28                                                                      ; inst 49
}

define i32 @performModularExponentiation() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [2, %_0.entry.0], [%10, %_5.while.exit.1]                           ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%4, %_5.while.exit.1]                            ; inst 3
  %2 = icmp sle i32 %0, 10                                                         ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %3 = phi i32 [1, %_2.while.body.0], [%9, %_4.while.body.1]                       ; inst 7
  %4 = phi i32 [%1, %_2.while.body.0], [%8, %_4.while.body.1]                      ; inst 8
  %5 = icmp sle i32 %3, 20                                                         ; inst 9
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %6 = call i32 @modularPower(i32 %0, i32 %3, i32 97)                              ; inst 11
  %7 = add i32 %4, %6                                                              ; inst 12
  %8 = srem i32 %7, 10000                                                          ; inst 13
  %9 = add i32 %3, 1                                                               ; inst 14
  br label %_3.while.cond.1                                                        ; inst 15
_5.while.exit.1:
  %10 = add i32 %0, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_6.while.exit.0:
  ret i32 %1                                                                       ; inst 18
}

define i32 @modularPower(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = srem i32 %0, %2                                                             ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [%1, %_0.entry.0], [%13, %_5.if.exit.0]                             ; inst 3
  %5 = phi i32 [%3, %_0.entry.0], [%15, %_5.if.exit.0]                             ; inst 4
  %6 = phi i32 [1, %_0.entry.0], [%12, %_5.if.exit.0]                              ; inst 5
  %7 = icmp sgt i32 %4, 0                                                          ; inst 6
  br i1 %7, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 7
_2.while.body.0:
  %8 = srem i32 %4, 2                                                              ; inst 8
  %9 = icmp eq i32 %8, 1                                                           ; inst 9
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %10 = mul i32 %6, %5                                                             ; inst 11
  %11 = srem i32 %10, %2                                                           ; inst 12
  br label %_5.if.exit.0                                                           ; inst 13
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 14
_5.if.exit.0:
  %12 = phi i32 [%11, %_3.if.then.0], [%6, %_4.if.else.0]                          ; inst 15
  %13 = ashr i32 %4, 1                                                             ; inst 16
  %14 = mul i32 %5, %5                                                             ; inst 17
  %15 = srem i32 %14, %2                                                           ; inst 18
  br label %_1.while.cond.0                                                        ; inst 19
_6.while.exit.0:
  ret i32 %6                                                                       ; inst 20
}

define i32 @calculateTotientSum(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = call i32 @eulerTotient(i32 %1)                                              ; inst 6
  %5 = add i32 %2, %4                                                              ; inst 7
  %6 = add i32 %1, 1                                                               ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  %7 = srem i32 %2, 10000                                                          ; inst 10
  ret i32 %7                                                                       ; inst 11
}

define i32 @eulerTotient(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 2                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_5.if.else.0                               ; inst 3
_1.if.then.0:
  br label %_2.while.cond.0                                                        ; inst 4
_2.while.cond.0:
  %3 = phi i32 [%0, %_1.if.then.0], [%6, %_3.while.body.0]                         ; inst 5
  %4 = srem i32 %3, 2                                                              ; inst 6
  %5 = icmp eq i32 %4, 0                                                           ; inst 7
  br i1 %5, label %_3.while.body.0, label %_4.while.exit.0                         ; inst 8
_3.while.body.0:
  %6 = sdiv i32 %3, 2                                                              ; inst 9
  br label %_2.while.cond.0                                                        ; inst 10
_4.while.exit.0:
  %7 = sdiv i32 %0, 2                                                              ; inst 11
  %8 = sub i32 %0, %7                                                              ; inst 12
  br label %_6.if.exit.0                                                           ; inst 13
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 14
_6.if.exit.0:
  %9 = phi i32 [%3, %_4.while.exit.0], [%0, %_5.if.else.0]                         ; inst 15
  %10 = phi i32 [%8, %_4.while.exit.0], [%0, %_5.if.else.0]                        ; inst 16
  br label %_7.while.cond.1                                                        ; inst 17
_7.while.cond.1:
  %11 = phi i32 [3, %_6.if.exit.0], [%26, %_14.if.exit.1]                          ; inst 18
  %12 = phi i32 [%9, %_6.if.exit.0], [%24, %_14.if.exit.1]                         ; inst 19
  %13 = phi i32 [%10, %_6.if.exit.0], [%25, %_14.if.exit.1]                        ; inst 20
  %14 = mul i32 %11, %11                                                           ; inst 21
  %15 = icmp sle i32 %14, %12                                                      ; inst 22
  br i1 %15, label %_8.while.body.1, label %_15.while.exit.1                       ; inst 23
_8.while.body.1:
  %16 = srem i32 %12, %11                                                          ; inst 24
  %17 = icmp eq i32 %16, 0                                                         ; inst 25
  br i1 %17, label %_9.if.then.1, label %_13.if.else.1                             ; inst 26
_9.if.then.1:
  br label %_10.while.cond.2                                                       ; inst 27
_10.while.cond.2:
  %18 = phi i32 [%12, %_9.if.then.1], [%21, %_11.while.body.2]                     ; inst 28
  %19 = srem i32 %18, %11                                                          ; inst 29
  %20 = icmp eq i32 %19, 0                                                         ; inst 30
  br i1 %20, label %_11.while.body.2, label %_12.while.exit.2                      ; inst 31
_11.while.body.2:
  %21 = sdiv i32 %18, %11                                                          ; inst 32
  br label %_10.while.cond.2                                                       ; inst 33
_12.while.exit.2:
  %22 = sdiv i32 %13, %11                                                          ; inst 34
  %23 = sub i32 %13, %22                                                           ; inst 35
  br label %_14.if.exit.1                                                          ; inst 36
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 37
_14.if.exit.1:
  %24 = phi i32 [%18, %_12.while.exit.2], [%12, %_13.if.else.1]                    ; inst 38
  %25 = phi i32 [%23, %_12.while.exit.2], [%13, %_13.if.else.1]                    ; inst 39
  %26 = add i32 %11, 2                                                             ; inst 40
  br label %_7.while.cond.1                                                        ; inst 41
_15.while.exit.1:
  %27 = icmp sgt i32 %12, 1                                                        ; inst 42
  br i1 %27, label %_16.if.then.2, label %_17.if.else.2                            ; inst 43
_16.if.then.2:
  %28 = sdiv i32 %13, %12                                                          ; inst 44
  %29 = sub i32 %13, %28                                                           ; inst 45
  br label %_18.if.exit.2                                                          ; inst 46
_17.if.else.2:
  br label %_18.if.exit.2                                                          ; inst 47
_18.if.exit.2:
  %30 = phi i32 [%29, %_16.if.then.2], [%13, %_17.if.else.2]                       ; inst 48
  ret i32 %30                                                                      ; inst 49
}

define i32 @findPerfectNumbers(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [6, %_0.entry.0], [%8, %_5.if.exit.0]                               ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_5.if.exit.0]                               ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = call i32 @isPerfectNumber(i32 %1)                                           ; inst 6
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

define i32 @isPerfectNumber(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [2, %_0.entry.0], [%14, %_8.if.exit.0]                              ; inst 2
  %2 = phi i32 [1, %_0.entry.0], [%13, %_8.if.exit.0]                              ; inst 3
  %3 = mul i32 %1, %1                                                              ; inst 4
  %4 = icmp sle i32 %3, %0                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = srem i32 %0, %1                                                             ; inst 7
  %6 = icmp eq i32 %5, 0                                                           ; inst 8
  br i1 %6, label %_3.if.then.0, label %_7.if.else.0                               ; inst 9
_3.if.then.0:
  %7 = add i32 %2, %1                                                              ; inst 10
  %8 = sdiv i32 %0, %1                                                             ; inst 11
  %9 = icmp ne i32 %1, %8                                                          ; inst 12
  br i1 %9, label %_4.if.then.1, label %_5.if.else.1                               ; inst 13
_4.if.then.1:
  %10 = sdiv i32 %0, %1                                                            ; inst 14
  %11 = add i32 %7, %10                                                            ; inst 15
  br label %_6.if.exit.1                                                           ; inst 16
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 17
_6.if.exit.1:
  %12 = phi i32 [%11, %_4.if.then.1], [%7, %_5.if.else.1]                          ; inst 18
  br label %_8.if.exit.0                                                           ; inst 19
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 20
_8.if.exit.0:
  %13 = phi i32 [%12, %_6.if.exit.1], [%2, %_7.if.else.0]                          ; inst 21
  %14 = add i32 %1, 1                                                              ; inst 22
  br label %_1.while.cond.0                                                        ; inst 23
_9.while.exit.0:
  %15 = icmp eq i32 %2, %0                                                         ; inst 24
  %16 = zext i1 %15 to i32                                                         ; inst 25
  ret i32 %16                                                                      ; inst 26
}

define void @performLinearAlgebraOperations() {
_0.entry.0:
  call void @printlnInt(i32 3005)                                                  ; inst 1
  %0 = call i32 @performMatrixCalculations()                                       ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @performVectorCalculations()                                       ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @solveLinearSystem()                                               ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  call void @printlnInt(i32 3006)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @performMatrixCalculations() {
_0.entry.0:
  %0 = alloca [16 x i32]                                                           ; inst 1
  %1 = alloca [625 x i32]                                                          ; inst 2
  %2 = getelementptr [625 x i32], [625 x i32]* %1, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 625                                                        ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [625 x i32]                                                          ; inst 12
  %8 = getelementptr [625 x i32], [625 x i32]* %7, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 625                                                       ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 18
  store i32 0, i32* %11                                                            ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [625 x i32]                                                         ; inst 22
  %14 = getelementptr [625 x i32], [625 x i32]* %13, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 25
  %16 = icmp slt i32 %15, 625                                                      ; inst 26
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = add i32 %15, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  call void @initializeMatrixA([625 x i32]* %1, i64 25)                            ; inst 32
  call void @initializeMatrixB([625 x i32]* %7, i64 25)                            ; inst 33
  call void @multiplyMatrices([625 x i32]* %1, [625 x i32]* %7, [625 x i32]* %13, i64 25) ; inst 34
  %19 = call i32 @calculateMatrixTrace([625 x i32]* %13, i64 25)                   ; inst 35
  %20 = alloca [16 x i32]                                                          ; inst 36
  %21 = getelementptr [16 x i32], [16 x i32]* %20, i32 0, i32 0                    ; inst 37
  br label %_10.array.cond.3                                                       ; inst 38
_10.array.cond.3:
  %22 = phi i32 [0, %_9.array.exit.2], [%25, %_11.array.body.3]                    ; inst 39
  %23 = icmp slt i32 %22, 16                                                       ; inst 40
  br i1 %23, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 41
_11.array.body.3:
  %24 = getelementptr i32, i32* %21, i32 %22                                       ; inst 42
  store i32 0, i32* %24                                                            ; inst 43
  %25 = add i32 %22, 1                                                             ; inst 44
  br label %_10.array.cond.3                                                       ; inst 45
_12.array.exit.3:
  call void @extractSubmatrix([625 x i32]* %13, [16 x i32]* %20, i64 25, i64 4)    ; inst 46
  call void @memcpy([16 x i32]* %0, [16 x i32]* %20, i64 64)                       ; inst 47
  %26 = call i32 @calculateDeterminant4x4([16 x i32]* %0)                          ; inst 48
  %27 = add i32 %19, %26                                                           ; inst 49
  %28 = srem i32 %27, 10000                                                        ; inst 50
  ret i32 %28                                                                      ; inst 51
}

define void @initializeMatrixA([625 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%14, %_5.while.exit.1]                           ; inst 2
  %3 = icmp ult i64 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i64 [0, %_2.while.body.0], [%13, %_4.while.body.1]                      ; inst 6
  %5 = icmp ult i64 %4, %1                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %6 = mul i64 %2, %1                                                              ; inst 9
  %7 = add i64 %6, %4                                                              ; inst 10
  %8 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %7                   ; inst 11
  %9 = add i64 %2, %4                                                              ; inst 12
  %10 = add i64 %9, 1                                                              ; inst 13
  %11 = trunc i64 %10 to i32                                                       ; inst 14
  %12 = srem i32 %11, 10                                                           ; inst 15
  store i32 %12, i32* %8                                                           ; inst 16
  %13 = add i64 %4, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %14 = add i64 %2, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define void @initializeMatrixB([625 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%14, %_5.while.exit.1]                           ; inst 2
  %3 = icmp ult i64 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i64 [0, %_2.while.body.0], [%13, %_4.while.body.1]                      ; inst 6
  %5 = icmp ult i64 %4, %1                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %6 = mul i64 %2, %1                                                              ; inst 9
  %7 = add i64 %6, %4                                                              ; inst 10
  %8 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %7                   ; inst 11
  %9 = mul i64 %2, %4                                                              ; inst 12
  %10 = add i64 %9, 1                                                              ; inst 13
  %11 = trunc i64 %10 to i32                                                       ; inst 14
  %12 = srem i32 %11, 10                                                           ; inst 15
  store i32 %12, i32* %8                                                           ; inst 16
  %13 = add i64 %4, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %14 = add i64 %2, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define void @multiplyMatrices([625 x i32]* %0, [625 x i32]* %1, [625 x i32]* %2, i64 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i64 [0, %_0.entry.0], [%12, %_5.while.exit.1]                           ; inst 2
  %5 = icmp ult i64 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %6 = phi i64 [0, %_2.while.body.0], [%11, %_4.while.body.1]                      ; inst 6
  %7 = icmp ult i64 %6, %3                                                         ; inst 7
  br i1 %7, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %8 = mul i64 %4, %3                                                              ; inst 9
  %9 = add i64 %8, %6                                                              ; inst 10
  %10 = getelementptr [625 x i32], [625 x i32]* %2, i32 0, i64 %9                  ; inst 11
  store i32 0, i32* %10                                                            ; inst 12
  %11 = add i64 %6, 1                                                              ; inst 13
  br label %_3.while.cond.1                                                        ; inst 14
_5.while.exit.1:
  %12 = add i64 %4, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  br label %_7.while.cond.2                                                        ; inst 17
_7.while.cond.2:
  %13 = phi i64 [0, %_6.while.exit.0], [%53, %_32.while.exit.3]                    ; inst 18
  %14 = icmp ult i64 %13, %3                                                       ; inst 19
  br i1 %14, label %_8.while.body.2, label %_33.while.exit.2                       ; inst 20
_8.while.body.2:
  br label %_9.while.cond.3                                                        ; inst 21
_9.while.cond.3:
  %15 = phi i64 [0, %_8.while.body.2], [%52, %_31.while.exit.4]                    ; inst 22
  %16 = icmp ult i64 %15, %3                                                       ; inst 23
  br i1 %16, label %_10.while.body.3, label %_32.while.exit.3                      ; inst 24
_10.while.body.3:
  br label %_11.while.cond.4                                                       ; inst 25
_11.while.cond.4:
  %17 = phi i64 [0, %_10.while.body.3], [%51, %_30.while.exit.5]                   ; inst 26
  %18 = icmp ult i64 %17, %3                                                       ; inst 27
  br i1 %18, label %_12.while.body.4, label %_31.while.exit.4                      ; inst 28
_12.while.body.4:
  %19 = add i64 %13, 5                                                             ; inst 29
  %20 = icmp ugt i64 %19, %3                                                       ; inst 30
  br i1 %20, label %_13.if.then.0, label %_14.if.else.0                            ; inst 31
_13.if.then.0:
  br label %_15.if.exit.0                                                          ; inst 32
_14.if.else.0:
  br label %_15.if.exit.0                                                          ; inst 33
_15.if.exit.0:
  %21 = phi i64 [%3, %_13.if.then.0], [%19, %_14.if.else.0]                        ; inst 34
  br label %_16.while.cond.5                                                       ; inst 35
_16.while.cond.5:
  %22 = phi i64 [%13, %_15.if.exit.0], [%50, %_29.while.exit.6]                    ; inst 36
  %23 = icmp ult i64 %22, %21                                                      ; inst 37
  br i1 %23, label %_17.while.body.5, label %_30.while.exit.5                      ; inst 38
_17.while.body.5:
  %24 = add i64 %15, 5                                                             ; inst 39
  %25 = icmp ugt i64 %24, %3                                                       ; inst 40
  br i1 %25, label %_18.if.then.1, label %_19.if.else.1                            ; inst 41
_18.if.then.1:
  br label %_20.if.exit.1                                                          ; inst 42
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 43
_20.if.exit.1:
  %26 = phi i64 [%3, %_18.if.then.1], [%24, %_19.if.else.1]                        ; inst 44
  br label %_21.while.cond.6                                                       ; inst 45
_21.while.cond.6:
  %27 = phi i64 [%15, %_20.if.exit.1], [%49, %_28.while.exit.7]                    ; inst 46
  %28 = icmp ult i64 %27, %26                                                      ; inst 47
  br i1 %28, label %_22.while.body.6, label %_29.while.exit.6                      ; inst 48
_22.while.body.6:
  %29 = add i64 %17, 5                                                             ; inst 49
  %30 = icmp ugt i64 %29, %3                                                       ; inst 50
  br i1 %30, label %_23.if.then.2, label %_24.if.else.2                            ; inst 51
_23.if.then.2:
  br label %_25.if.exit.2                                                          ; inst 52
_24.if.else.2:
  br label %_25.if.exit.2                                                          ; inst 53
_25.if.exit.2:
  %31 = phi i64 [%3, %_23.if.then.2], [%29, %_24.if.else.2]                        ; inst 54
  br label %_26.while.cond.7                                                       ; inst 55
_26.while.cond.7:
  %32 = phi i64 [%17, %_25.if.exit.2], [%48, %_27.while.body.7]                    ; inst 56
  %33 = icmp ult i64 %32, %31                                                      ; inst 57
  br i1 %33, label %_27.while.body.7, label %_28.while.exit.7                      ; inst 58
_27.while.body.7:
  %34 = mul i64 %22, %3                                                            ; inst 59
  %35 = add i64 %34, %27                                                           ; inst 60
  %36 = getelementptr [625 x i32], [625 x i32]* %2, i32 0, i64 %35                 ; inst 61
  %37 = load i32, i32* %36                                                         ; inst 62
  %38 = mul i64 %22, %3                                                            ; inst 63
  %39 = add i64 %38, %32                                                           ; inst 64
  %40 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %39                 ; inst 65
  %41 = load i32, i32* %40                                                         ; inst 66
  %42 = mul i64 %32, %3                                                            ; inst 67
  %43 = add i64 %42, %27                                                           ; inst 68
  %44 = getelementptr [625 x i32], [625 x i32]* %1, i32 0, i64 %43                 ; inst 69
  %45 = load i32, i32* %44                                                         ; inst 70
  %46 = mul i32 %41, %45                                                           ; inst 71
  %47 = add i32 %37, %46                                                           ; inst 72
  store i32 %47, i32* %36                                                          ; inst 73
  %48 = add i64 %32, 1                                                             ; inst 74
  br label %_26.while.cond.7                                                       ; inst 75
_28.while.exit.7:
  %49 = add i64 %27, 1                                                             ; inst 76
  br label %_21.while.cond.6                                                       ; inst 77
_29.while.exit.6:
  %50 = add i64 %22, 1                                                             ; inst 78
  br label %_16.while.cond.5                                                       ; inst 79
_30.while.exit.5:
  %51 = add i64 %17, 5                                                             ; inst 80
  br label %_11.while.cond.4                                                       ; inst 81
_31.while.exit.4:
  %52 = add i64 %15, 5                                                             ; inst 82
  br label %_9.while.cond.3                                                        ; inst 83
_32.while.exit.3:
  %53 = add i64 %13, 5                                                             ; inst 84
  br label %_7.while.cond.2                                                        ; inst 85
_33.while.exit.2:
  ret void                                                                         ; inst 86
}

define i32 @calculateMatrixTrace([625 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 3
  %4 = icmp ult i64 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = mul i64 %2, %1                                                              ; inst 6
  %6 = add i64 %5, %2                                                              ; inst 7
  %7 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = add i32 %3, %8                                                              ; inst 10
  %10 = add i64 %2, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 13
}

define void @extractSubmatrix([625 x i32]* %0, [16 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i64 [0, %_0.entry.0], [%16, %_5.while.exit.1]                           ; inst 2
  %5 = icmp ult i64 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %6 = phi i64 [0, %_2.while.body.0], [%15, %_4.while.body.1]                      ; inst 6
  %7 = icmp ult i64 %6, %3                                                         ; inst 7
  br i1 %7, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %8 = mul i64 %4, %3                                                              ; inst 9
  %9 = add i64 %8, %6                                                              ; inst 10
  %10 = getelementptr [16 x i32], [16 x i32]* %1, i32 0, i64 %9                    ; inst 11
  %11 = mul i64 %4, %2                                                             ; inst 12
  %12 = add i64 %11, %6                                                            ; inst 13
  %13 = getelementptr [625 x i32], [625 x i32]* %0, i32 0, i64 %12                 ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  store i32 %14, i32* %10                                                          ; inst 16
  %15 = add i64 %6, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %16 = add i64 %4, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define i32 @calculateDeterminant4x4([16 x i32]* %0) {
_0.entry.0:
  %1 = alloca [9 x i32]                                                            ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%41, %_17.if.exit.1]                             ; inst 3
  %3 = phi i64 [0, %_0.entry.0], [%42, %_17.if.exit.1]                             ; inst 4
  %4 = icmp ult i64 %3, 4                                                          ; inst 5
  br i1 %4, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 6
_2.while.body.0:
  %5 = alloca [9 x i32]                                                            ; inst 7
  %6 = getelementptr [9 x i32], [9 x i32]* %5, i32 0, i32 0                        ; inst 8
  br label %_3.array.cond.0                                                        ; inst 9
_3.array.cond.0:
  %7 = phi i32 [0, %_2.while.body.0], [%10, %_4.array.body.0]                      ; inst 10
  %8 = icmp slt i32 %7, 9                                                          ; inst 11
  br i1 %8, label %_4.array.body.0, label %_5.array.exit.0                         ; inst 12
_4.array.body.0:
  %9 = getelementptr i32, i32* %6, i32 %7                                          ; inst 13
  store i32 0, i32* %9                                                             ; inst 14
  %10 = add i32 %7, 1                                                              ; inst 15
  br label %_3.array.cond.0                                                        ; inst 16
_5.array.exit.0:
  br label %_6.while.cond.1                                                        ; inst 17
_6.while.cond.1:
  %11 = phi i64 [1, %_5.array.exit.0], [%29, %_13.while.exit.2]                    ; inst 18
  %12 = phi i64 [0, %_5.array.exit.0], [%28, %_13.while.exit.2]                    ; inst 19
  %13 = icmp ult i64 %11, 4                                                        ; inst 20
  br i1 %13, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 21
_7.while.body.1:
  br label %_8.while.cond.2                                                        ; inst 22
_8.while.cond.2:
  %14 = phi i64 [0, %_7.while.body.1], [%26, %_12.if.exit.0]                       ; inst 23
  %15 = phi i64 [0, %_7.while.body.1], [%27, %_12.if.exit.0]                       ; inst 24
  %16 = icmp ult i64 %15, 4                                                        ; inst 25
  br i1 %16, label %_9.while.body.2, label %_13.while.exit.2                       ; inst 26
_9.while.body.2:
  %17 = icmp ne i64 %15, %3                                                        ; inst 27
  br i1 %17, label %_10.if.then.0, label %_11.if.else.0                            ; inst 28
_10.if.then.0:
  %18 = mul i64 %12, 3                                                             ; inst 29
  %19 = add i64 %18, %14                                                           ; inst 30
  %20 = getelementptr [9 x i32], [9 x i32]* %5, i32 0, i64 %19                     ; inst 31
  %21 = mul i64 %11, 4                                                             ; inst 32
  %22 = add i64 %21, %15                                                           ; inst 33
  %23 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %22                   ; inst 34
  %24 = load i32, i32* %23                                                         ; inst 35
  store i32 %24, i32* %20                                                          ; inst 36
  %25 = add i64 %14, 1                                                             ; inst 37
  br label %_12.if.exit.0                                                          ; inst 38
_11.if.else.0:
  br label %_12.if.exit.0                                                          ; inst 39
_12.if.exit.0:
  %26 = phi i64 [%25, %_10.if.then.0], [%14, %_11.if.else.0]                       ; inst 40
  %27 = add i64 %15, 1                                                             ; inst 41
  br label %_8.while.cond.2                                                        ; inst 42
_13.while.exit.2:
  %28 = add i64 %12, 1                                                             ; inst 43
  %29 = add i64 %11, 1                                                             ; inst 44
  br label %_6.while.cond.1                                                        ; inst 45
_14.while.exit.1:
  call void @memcpy([9 x i32]* %1, [9 x i32]* %5, i64 36)                          ; inst 46
  %30 = call i32 @calculateDeterminant3x3([9 x i32]* %1)                           ; inst 47
  %31 = urem i64 %3, 2                                                             ; inst 48
  %32 = icmp eq i64 %31, 0                                                         ; inst 49
  br i1 %32, label %_15.if.then.1, label %_16.if.else.1                            ; inst 50
_15.if.then.1:
  %33 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %3                    ; inst 51
  %34 = load i32, i32* %33                                                         ; inst 52
  %35 = mul i32 %34, %30                                                           ; inst 53
  %36 = add i32 %2, %35                                                            ; inst 54
  br label %_17.if.exit.1                                                          ; inst 55
_16.if.else.1:
  %37 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %3                    ; inst 56
  %38 = load i32, i32* %37                                                         ; inst 57
  %39 = mul i32 %38, %30                                                           ; inst 58
  %40 = sub i32 %2, %39                                                            ; inst 59
  br label %_17.if.exit.1                                                          ; inst 60
_17.if.exit.1:
  %41 = phi i32 [%36, %_15.if.then.1], [%40, %_16.if.else.1]                       ; inst 61
  %42 = add i64 %3, 1                                                              ; inst 62
  br label %_1.while.cond.0                                                        ; inst 63
_18.while.exit.0:
  ret i32 %2                                                                       ; inst 64
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

define i32 @performVectorCalculations() {
_0.entry.0:
  %0 = alloca [100 x i32]                                                          ; inst 1
  %1 = alloca [100 x i32]                                                          ; inst 2
  %2 = alloca [100 x i32]                                                          ; inst 3
  %3 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i32 0                    ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 100                                                        ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = alloca [100 x i32]                                                          ; inst 13
  %9 = getelementptr [100 x i32], [100 x i32]* %8, i32 0, i32 0                    ; inst 14
  br label %_4.array.cond.1                                                        ; inst 15
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 16
  %11 = icmp slt i32 %10, 100                                                      ; inst 17
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 18
_5.array.body.1:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 19
  store i32 0, i32* %12                                                            ; inst 20
  %13 = add i32 %10, 1                                                             ; inst 21
  br label %_4.array.cond.1                                                        ; inst 22
_6.array.exit.1:
  %14 = alloca [100 x i32]                                                         ; inst 23
  %15 = getelementptr [100 x i32], [100 x i32]* %14, i32 0, i32 0                  ; inst 24
  br label %_7.array.cond.2                                                        ; inst 25
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 26
  %17 = icmp slt i32 %16, 100                                                      ; inst 27
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 28
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 29
  store i32 0, i32* %18                                                            ; inst 30
  %19 = add i32 %16, 1                                                             ; inst 31
  br label %_7.array.cond.2                                                        ; inst 32
_9.array.exit.2:
  call void @initializeVectors([100 x i32]* %2, [100 x i32]* %8, i64 100)          ; inst 33
  %20 = call i32 @vectorDotProduct([100 x i32]* %2, [100 x i32]* %8, i64 100)      ; inst 34
  call void @vectorAddition([100 x i32]* %2, [100 x i32]* %8, [100 x i32]* %14, i64 100) ; inst 35
  call void @memcpy([100 x i32]* %0, [100 x i32]* %2, i64 400)                     ; inst 36
  %21 = call i32 @vectorMagnitude([100 x i32]* %0, i64 100)                        ; inst 37
  call void @memcpy([100 x i32]* %1, [100 x i32]* %8, i64 400)                     ; inst 38
  %22 = call i32 @vectorMagnitude([100 x i32]* %1, i64 100)                        ; inst 39
  call void @vectorScalarMultiply([100 x i32]* %14, i32 3, i64 100)                ; inst 40
  %23 = add i32 %20, %21                                                           ; inst 41
  %24 = add i32 %23, %22                                                           ; inst 42
  %25 = srem i32 %24, 10000                                                        ; inst 43
  ret i32 %25                                                                      ; inst 44
}

define void @initializeVectors([100 x i32]* %0, [100 x i32]* %1, i64 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i64 [0, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 2
  %4 = icmp ult i64 %3, %2                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %3                   ; inst 5
  %6 = add i64 %3, 1                                                               ; inst 6
  %7 = trunc i64 %6 to i32                                                         ; inst 7
  %8 = srem i32 %7, 20                                                             ; inst 8
  store i32 %8, i32* %5                                                            ; inst 9
  %9 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %3                   ; inst 10
  %10 = mul i64 %3, 2                                                              ; inst 11
  %11 = add i64 %10, 3                                                             ; inst 12
  %12 = trunc i64 %11 to i32                                                       ; inst 13
  %13 = srem i32 %12, 15                                                           ; inst 14
  store i32 %13, i32* %9                                                           ; inst 15
  %14 = add i64 %3, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret void                                                                         ; inst 18
}

define i32 @vectorDotProduct([100 x i32]* %0, [100 x i32]* %1, i64 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i64 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 3
  %5 = icmp ult i64 %3, %2                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %3                   ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %3                   ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = mul i32 %7, %9                                                             ; inst 10
  %11 = add i32 %4, %10                                                            ; inst 11
  %12 = add i64 %3, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %13 = srem i32 %4, 10000                                                         ; inst 14
  ret i32 %13                                                                      ; inst 15
}

define void @vectorAddition([100 x i32]* %0, [100 x i32]* %1, [100 x i32]* %2, i64 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i64 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 2
  %5 = icmp ult i64 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %6 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %4                   ; inst 5
  %7 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %4                   ; inst 6
  %8 = load i32, i32* %7                                                           ; inst 7
  %9 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %4                   ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = add i32 %8, %10                                                            ; inst 10
  store i32 %11, i32* %6                                                           ; inst 11
  %12 = add i64 %4, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define i32 @vectorMagnitude([100 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 3
  %4 = icmp ult i64 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = mul i32 %6, %8                                                              ; inst 10
  %10 = add i32 %3, %9                                                             ; inst 11
  %11 = add i64 %2, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %12 = call i32 @integerSquareRoot(i32 %3)                                        ; inst 14
  ret i32 %12                                                                      ; inst 15
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
  %2 = phi i32 [0, %_3.if.exit.0], [%3, %_5.while.body.0]                          ; inst 6
  %3 = phi i32 [%0, %_3.if.exit.0], [%7, %_5.while.body.0]                         ; inst 7
  %4 = icmp ne i32 %3, %2                                                          ; inst 8
  br i1 %4, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 9
_5.while.body.0:
  %5 = sdiv i32 %0, %3                                                             ; inst 10
  %6 = add i32 %3, %5                                                              ; inst 11
  %7 = sdiv i32 %6, 2                                                              ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 14
}

define void @vectorScalarMultiply([100 x i32]* %0, i32 %1, i64 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i64 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %4 = icmp ult i64 %3, %2                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %3                   ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = mul i32 %6, %1                                                              ; inst 7
  store i32 %7, i32* %5                                                            ; inst 8
  %8 = add i64 %3, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  ret void                                                                         ; inst 11
}

define i32 @solveLinearSystem() {
_0.entry.0:
  %0 = alloca [30 x i32]                                                           ; inst 1
  %1 = alloca [30 x i32]                                                           ; inst 2
  %2 = getelementptr [30 x i32], [30 x i32]* %1, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 30                                                         ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeLinearSystem([30 x i32]* %1, i64 5)                         ; inst 12
  call void @gaussianElimination([30 x i32]* %1, i64 5)                            ; inst 13
  call void @memcpy([30 x i32]* %0, [30 x i32]* %1, i64 120)                       ; inst 14
  %7 = call i32 @backSubstitution([30 x i32]* %0, i64 5)                           ; inst 15
  %8 = srem i32 %7, 10000                                                          ; inst 16
  ret i32 %8                                                                       ; inst 17
}

define void @initializeLinearSystem([30 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%29, %_8.while.exit.1]                           ; inst 2
  %3 = icmp ult i64 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i64 [0, %_2.while.body.0], [%21, %_7.if.exit.0]                         ; inst 6
  %5 = icmp ult i64 %4, %1                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 8
_4.while.body.1:
  %6 = icmp eq i64 %2, %4                                                          ; inst 9
  br i1 %6, label %_5.if.then.0, label %_6.if.else.0                               ; inst 10
_5.if.then.0:
  %7 = add i64 %1, 1                                                               ; inst 11
  %8 = mul i64 %2, %7                                                              ; inst 12
  %9 = add i64 %8, %4                                                              ; inst 13
  %10 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %9                    ; inst 14
  %11 = trunc i64 %2 to i32                                                        ; inst 15
  %12 = add i32 10, %11                                                            ; inst 16
  store i32 %12, i32* %10                                                          ; inst 17
  br label %_7.if.exit.0                                                           ; inst 18
_6.if.else.0:
  %13 = add i64 %1, 1                                                              ; inst 19
  %14 = mul i64 %2, %13                                                            ; inst 20
  %15 = add i64 %14, %4                                                            ; inst 21
  %16 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %15                   ; inst 22
  %17 = add i64 %2, %4                                                             ; inst 23
  %18 = add i64 %17, 1                                                             ; inst 24
  %19 = trunc i64 %18 to i32                                                       ; inst 25
  %20 = srem i32 %19, 5                                                            ; inst 26
  store i32 %20, i32* %16                                                          ; inst 27
  br label %_7.if.exit.0                                                           ; inst 28
_7.if.exit.0:
  %21 = add i64 %4, 1                                                              ; inst 29
  br label %_3.while.cond.1                                                        ; inst 30
_8.while.exit.1:
  %22 = add i64 %1, 1                                                              ; inst 31
  %23 = mul i64 %2, %22                                                            ; inst 32
  %24 = add i64 %23, %1                                                            ; inst 33
  %25 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %24                   ; inst 34
  %26 = add i64 %2, 1                                                              ; inst 35
  %27 = trunc i64 %26 to i32                                                       ; inst 36
  %28 = mul i32 %27, 10                                                            ; inst 37
  store i32 %28, i32* %25                                                          ; inst 38
  %29 = add i64 %2, 1                                                              ; inst 39
  br label %_1.while.cond.0                                                        ; inst 40
_9.while.exit.0:
  ret void                                                                         ; inst 41
}

define void @gaussianElimination([30 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%60, %_20.while.exit.2]                          ; inst 2
  %3 = icmp ult i64 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 4
_2.while.body.0:
  %4 = add i64 %2, 1                                                               ; inst 5
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %5 = phi i64 [%4, %_2.while.body.0], [%22, %_7.if.exit.0]                        ; inst 7
  %6 = phi i64 [%2, %_2.while.body.0], [%21, %_7.if.exit.0]                        ; inst 8
  %7 = icmp ult i64 %5, %1                                                         ; inst 9
  br i1 %7, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 10
_4.while.body.1:
  %8 = add i64 %1, 1                                                               ; inst 11
  %9 = mul i64 %5, %8                                                              ; inst 12
  %10 = add i64 %9, %2                                                             ; inst 13
  %11 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %10                   ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = call i32 @abs(i32 %12)                                                     ; inst 16
  %14 = add i64 %1, 1                                                              ; inst 17
  %15 = mul i64 %6, %14                                                            ; inst 18
  %16 = add i64 %15, %2                                                            ; inst 19
  %17 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %16                   ; inst 20
  %18 = load i32, i32* %17                                                         ; inst 21
  %19 = call i32 @abs(i32 %18)                                                     ; inst 22
  %20 = icmp sgt i32 %13, %19                                                      ; inst 23
  br i1 %20, label %_5.if.then.0, label %_6.if.else.0                              ; inst 24
_5.if.then.0:
  br label %_7.if.exit.0                                                           ; inst 25
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 26
_7.if.exit.0:
  %21 = phi i64 [%5, %_5.if.then.0], [%6, %_6.if.else.0]                           ; inst 27
  %22 = add i64 %5, 1                                                              ; inst 28
  br label %_3.while.cond.1                                                        ; inst 29
_8.while.exit.1:
  %23 = icmp ne i64 %6, %2                                                         ; inst 30
  br i1 %23, label %_9.if.then.1, label %_10.if.else.1                             ; inst 31
_9.if.then.1:
  call void @swapRows([30 x i32]* %0, i64 %2, i64 %6, i64 %1)                      ; inst 32
  br label %_11.if.exit.1                                                          ; inst 33
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 34
_11.if.exit.1:
  %24 = add i64 %2, 1                                                              ; inst 35
  br label %_12.while.cond.2                                                       ; inst 36
_12.while.cond.2:
  %25 = phi i64 [%24, %_11.if.exit.1], [%59, %_19.if.exit.2]                       ; inst 37
  %26 = icmp ult i64 %25, %1                                                       ; inst 38
  br i1 %26, label %_13.while.body.2, label %_20.while.exit.2                      ; inst 39
_13.while.body.2:
  %27 = add i64 %1, 1                                                              ; inst 40
  %28 = mul i64 %2, %27                                                            ; inst 41
  %29 = add i64 %28, %2                                                            ; inst 42
  %30 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %29                   ; inst 43
  %31 = load i32, i32* %30                                                         ; inst 44
  %32 = icmp ne i32 %31, 0                                                         ; inst 45
  br i1 %32, label %_14.if.then.2, label %_18.if.else.2                            ; inst 46
_14.if.then.2:
  %33 = add i64 %1, 1                                                              ; inst 47
  %34 = mul i64 %25, %33                                                           ; inst 48
  %35 = add i64 %34, %2                                                            ; inst 49
  %36 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %35                   ; inst 50
  %37 = load i32, i32* %36                                                         ; inst 51
  %38 = add i64 %1, 1                                                              ; inst 52
  %39 = mul i64 %2, %38                                                            ; inst 53
  %40 = add i64 %39, %2                                                            ; inst 54
  %41 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %40                   ; inst 55
  %42 = load i32, i32* %41                                                         ; inst 56
  %43 = sdiv i32 %37, %42                                                          ; inst 57
  br label %_15.while.cond.3                                                       ; inst 58
_15.while.cond.3:
  %44 = phi i64 [%2, %_14.if.then.2], [%58, %_16.while.body.3]                     ; inst 59
  %45 = icmp ule i64 %44, %1                                                       ; inst 60
  br i1 %45, label %_16.while.body.3, label %_17.while.exit.3                      ; inst 61
_16.while.body.3:
  %46 = add i64 %1, 1                                                              ; inst 62
  %47 = mul i64 %25, %46                                                           ; inst 63
  %48 = add i64 %47, %44                                                           ; inst 64
  %49 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %48                   ; inst 65
  %50 = load i32, i32* %49                                                         ; inst 66
  %51 = add i64 %1, 1                                                              ; inst 67
  %52 = mul i64 %2, %51                                                            ; inst 68
  %53 = add i64 %52, %44                                                           ; inst 69
  %54 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %53                   ; inst 70
  %55 = load i32, i32* %54                                                         ; inst 71
  %56 = mul i32 %43, %55                                                           ; inst 72
  %57 = sub i32 %50, %56                                                           ; inst 73
  store i32 %57, i32* %49                                                          ; inst 74
  %58 = add i64 %44, 1                                                             ; inst 75
  br label %_15.while.cond.3                                                       ; inst 76
_17.while.exit.3:
  br label %_19.if.exit.2                                                          ; inst 77
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 78
_19.if.exit.2:
  %59 = add i64 %25, 1                                                             ; inst 79
  br label %_12.while.cond.2                                                       ; inst 80
_20.while.exit.2:
  %60 = add i64 %2, 1                                                              ; inst 81
  br label %_1.while.cond.0                                                        ; inst 82
_21.while.exit.0:
  ret void                                                                         ; inst 83
}

define void @swapRows([30 x i32]* %0, i64 %1, i64 %2, i64 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i64 [0, %_0.entry.0], [%24, %_2.while.body.0]                           ; inst 2
  %5 = icmp ule i64 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %6 = add i64 %3, 1                                                               ; inst 5
  %7 = mul i64 %1, %6                                                              ; inst 6
  %8 = add i64 %7, %4                                                              ; inst 7
  %9 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %8                     ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = add i64 %3, 1                                                              ; inst 10
  %12 = mul i64 %1, %11                                                            ; inst 11
  %13 = add i64 %12, %4                                                            ; inst 12
  %14 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %13                   ; inst 13
  %15 = add i64 %3, 1                                                              ; inst 14
  %16 = mul i64 %2, %15                                                            ; inst 15
  %17 = add i64 %16, %4                                                            ; inst 16
  %18 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %17                   ; inst 17
  %19 = load i32, i32* %18                                                         ; inst 18
  store i32 %19, i32* %14                                                          ; inst 19
  %20 = add i64 %3, 1                                                              ; inst 20
  %21 = mul i64 %2, %20                                                            ; inst 21
  %22 = add i64 %21, %4                                                            ; inst 22
  %23 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %22                   ; inst 23
  store i32 %10, i32* %23                                                          ; inst 24
  %24 = add i64 %4, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_3.while.exit.0:
  ret void                                                                         ; inst 27
}

define i32 @backSubstitution([30 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca [5 x i32]                                                            ; inst 1
  %3 = getelementptr [5 x i32], [5 x i32]* %2, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 5                                                          ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = sub i64 %1, 1                                                               ; inst 11
  %9 = trunc i64 %8 to i32                                                         ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %10 = phi i32 [0, %_3.array.exit.0], [%53, %_11.if.exit.0]                       ; inst 14
  %11 = phi i32 [%9, %_3.array.exit.0], [%13, %_11.if.exit.0]                      ; inst 15
  %12 = icmp sge i32 %11, 0                                                        ; inst 16
  br i1 %12, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 17
_5.while.body.0:
  %13 = sub i32 %11, 1                                                             ; inst 18
  %14 = add i32 %13, 1                                                             ; inst 19
  %15 = sext i32 %14 to i64                                                        ; inst 20
  %16 = getelementptr [5 x i32], [5 x i32]* %2, i32 0, i64 %15                     ; inst 21
  %17 = add i64 %1, 1                                                              ; inst 22
  %18 = mul i64 %15, %17                                                           ; inst 23
  %19 = add i64 %18, %1                                                            ; inst 24
  %20 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %19                   ; inst 25
  %21 = load i32, i32* %20                                                         ; inst 26
  store i32 %21, i32* %16                                                          ; inst 27
  %22 = add i64 %15, 1                                                             ; inst 28
  br label %_6.while.cond.1                                                        ; inst 29
_6.while.cond.1:
  %23 = phi i64 [%22, %_5.while.body.0], [%36, %_7.while.body.1]                   ; inst 30
  %24 = icmp ult i64 %23, %1                                                       ; inst 31
  br i1 %24, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 32
_7.while.body.1:
  %25 = getelementptr [5 x i32], [5 x i32]* %2, i32 0, i64 %15                     ; inst 33
  %26 = load i32, i32* %25                                                         ; inst 34
  %27 = add i64 %1, 1                                                              ; inst 35
  %28 = mul i64 %15, %27                                                           ; inst 36
  %29 = add i64 %28, %23                                                           ; inst 37
  %30 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %29                   ; inst 38
  %31 = load i32, i32* %30                                                         ; inst 39
  %32 = getelementptr [5 x i32], [5 x i32]* %2, i32 0, i64 %23                     ; inst 40
  %33 = load i32, i32* %32                                                         ; inst 41
  %34 = mul i32 %31, %33                                                           ; inst 42
  %35 = sub i32 %26, %34                                                           ; inst 43
  store i32 %35, i32* %25                                                          ; inst 44
  %36 = add i64 %23, 1                                                             ; inst 45
  br label %_6.while.cond.1                                                        ; inst 46
_8.while.exit.1:
  %37 = add i64 %1, 1                                                              ; inst 47
  %38 = mul i64 %15, %37                                                           ; inst 48
  %39 = add i64 %38, %15                                                           ; inst 49
  %40 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %39                   ; inst 50
  %41 = load i32, i32* %40                                                         ; inst 51
  %42 = icmp ne i32 %41, 0                                                         ; inst 52
  br i1 %42, label %_9.if.then.0, label %_10.if.else.0                             ; inst 53
_9.if.then.0:
  %43 = getelementptr [5 x i32], [5 x i32]* %2, i32 0, i64 %15                     ; inst 54
  %44 = load i32, i32* %43                                                         ; inst 55
  %45 = add i64 %1, 1                                                              ; inst 56
  %46 = mul i64 %15, %45                                                           ; inst 57
  %47 = add i64 %46, %15                                                           ; inst 58
  %48 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %47                   ; inst 59
  %49 = load i32, i32* %48                                                         ; inst 60
  %50 = sdiv i32 %44, %49                                                          ; inst 61
  store i32 %50, i32* %43                                                          ; inst 62
  br label %_11.if.exit.0                                                          ; inst 63
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 64
_11.if.exit.0:
  %51 = getelementptr [5 x i32], [5 x i32]* %2, i32 0, i64 %15                     ; inst 65
  %52 = load i32, i32* %51                                                         ; inst 66
  %53 = add i32 %10, %52                                                           ; inst 67
  br label %_4.while.cond.0                                                        ; inst 68
_12.while.exit.0:
  ret i32 %10                                                                      ; inst 69
}

define i32 @abs(i32 %0) {
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

define void @performCombinatorialAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 3007)                                                  ; inst 1
  %0 = call i32 @calculatePascalTriangle(i64 20)                                   ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @calculatePermutations(i32 15)                                     ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @calculateCombinations(i32 20)                                     ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @calculateCatalanNumbers(i64 15)                                   ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 3008)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @calculatePascalTriangle(i64 %0) {
_0.entry.0:
  %1 = alloca [410 x i32]                                                          ; inst 1
  %2 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 410                                                        ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i64 0                    ; inst 11
  store i32 1, i32* %7                                                             ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %8 = phi i64 [1, %_3.array.exit.0], [%42, %_8.while.exit.1]                      ; inst 14
  %9 = phi i32 [1, %_3.array.exit.0], [%41, %_8.while.exit.1]                      ; inst 15
  %10 = icmp ult i64 %8, %0                                                        ; inst 16
  br i1 %10, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 17
_5.while.body.0:
  %11 = mul i64 %8, %0                                                             ; inst 18
  %12 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i64 %11                 ; inst 19
  store i32 1, i32* %12                                                            ; inst 20
  %13 = add i32 %9, 1                                                              ; inst 21
  br label %_6.while.cond.1                                                        ; inst 22
_6.while.cond.1:
  %14 = phi i64 [1, %_5.while.body.0], [%37, %_7.while.body.1]                     ; inst 23
  %15 = phi i32 [%13, %_5.while.body.0], [%36, %_7.while.body.1]                   ; inst 24
  %16 = icmp ult i64 %14, %8                                                       ; inst 25
  br i1 %16, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 26
_7.while.body.1:
  %17 = mul i64 %8, %0                                                             ; inst 27
  %18 = add i64 %17, %14                                                           ; inst 28
  %19 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i64 %18                 ; inst 29
  %20 = sub i64 %8, 1                                                              ; inst 30
  %21 = mul i64 %20, %0                                                            ; inst 31
  %22 = add i64 %21, %14                                                           ; inst 32
  %23 = sub i64 %22, 1                                                             ; inst 33
  %24 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i64 %23                 ; inst 34
  %25 = load i32, i32* %24                                                         ; inst 35
  %26 = sub i64 %8, 1                                                              ; inst 36
  %27 = mul i64 %26, %0                                                            ; inst 37
  %28 = add i64 %27, %14                                                           ; inst 38
  %29 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i64 %28                 ; inst 39
  %30 = load i32, i32* %29                                                         ; inst 40
  %31 = add i32 %25, %30                                                           ; inst 41
  store i32 %31, i32* %19                                                          ; inst 42
  %32 = mul i64 %8, %0                                                             ; inst 43
  %33 = add i64 %32, %14                                                           ; inst 44
  %34 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i64 %33                 ; inst 45
  %35 = load i32, i32* %34                                                         ; inst 46
  %36 = add i32 %15, %35                                                           ; inst 47
  %37 = add i64 %14, 1                                                             ; inst 48
  br label %_6.while.cond.1                                                        ; inst 49
_8.while.exit.1:
  %38 = mul i64 %8, %0                                                             ; inst 50
  %39 = add i64 %38, %8                                                            ; inst 51
  %40 = getelementptr [410 x i32], [410 x i32]* %1, i32 0, i64 %39                 ; inst 52
  store i32 1, i32* %40                                                            ; inst 53
  %41 = add i32 %15, 1                                                             ; inst 54
  %42 = add i64 %8, 1                                                              ; inst 55
  br label %_4.while.cond.0                                                        ; inst 56
_9.while.exit.0:
  %43 = srem i32 %9, 10000                                                         ; inst 57
  ret i32 %43                                                                      ; inst 58
}

define i32 @calculatePermutations(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%11, %_5.while.exit.1]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_5.while.exit.1]                            ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [1, %_2.while.body.0], [%10, %_4.while.body.1]                      ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%9, %_4.while.body.1]                      ; inst 8
  %6 = icmp sle i32 %4, %1                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = call i32 @permutation(i32 %1, i32 %4)                                       ; inst 11
  %8 = add i32 %5, %7                                                              ; inst 12
  %9 = srem i32 %8, 1000000                                                        ; inst 13
  %10 = add i32 %4, 1                                                              ; inst 14
  br label %_3.while.cond.1                                                        ; inst 15
_5.while.exit.1:
  %11 = add i32 %1, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_6.while.exit.0:
  %12 = srem i32 %2, 10000                                                         ; inst 18
  ret i32 %12                                                                      ; inst 19
}

define i32 @permutation(i32 %0, i32 %1) {
_0.entry.0:
  %2 = sub i32 %0, %1                                                              ; inst 1
  %3 = add i32 %2, 1                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [%3, %_0.entry.0], [%9, %_2.while.body.0]                           ; inst 4
  %5 = phi i32 [1, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 5
  %6 = icmp sle i32 %4, %0                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = mul i32 %5, %4                                                              ; inst 8
  %8 = srem i32 %7, 1000000                                                        ; inst 9
  %9 = add i32 %4, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret i32 %5                                                                       ; inst 12
}

define i32 @calculateCombinations(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%11, %_5.while.exit.1]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_5.while.exit.1]                            ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%10, %_4.while.body.1]                      ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%9, %_4.while.body.1]                      ; inst 8
  %6 = icmp sle i32 %4, %1                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = call i32 @combination(i32 %1, i32 %4)                                       ; inst 11
  %8 = add i32 %5, %7                                                              ; inst 12
  %9 = srem i32 %8, 1000000                                                        ; inst 13
  %10 = add i32 %4, 1                                                              ; inst 14
  br label %_3.while.cond.1                                                        ; inst 15
_5.while.exit.1:
  %11 = add i32 %1, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_6.while.exit.0:
  %12 = srem i32 %2, 10000                                                         ; inst 18
  ret i32 %12                                                                      ; inst 19
}

define i32 @combination(i32 %0, i32 %1) {
_0.entry.0:
  %2 = sub i32 %0, %1                                                              ; inst 1
  %3 = icmp sgt i32 %1, %2                                                         ; inst 2
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %4 = sub i32 %0, %1                                                              ; inst 4
  br label %_3.if.exit.0                                                           ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = phi i32 [%4, %_1.if.then.0], [%1, %_2.if.else.0]                            ; inst 7
  br label %_4.while.cond.0                                                        ; inst 8
_4.while.cond.0:
  %6 = phi i32 [0, %_3.if.exit.0], [%13, %_5.while.body.0]                         ; inst 9
  %7 = phi i32 [1, %_3.if.exit.0], [%12, %_5.while.body.0]                         ; inst 10
  %8 = icmp slt i32 %6, %5                                                         ; inst 11
  br i1 %8, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 12
_5.while.body.0:
  %9 = sub i32 %0, %6                                                              ; inst 13
  %10 = mul i32 %7, %9                                                             ; inst 14
  %11 = add i32 %6, 1                                                              ; inst 15
  %12 = sdiv i32 %10, %11                                                          ; inst 16
  %13 = add i32 %6, 1                                                              ; inst 17
  br label %_4.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  %14 = srem i32 %7, 1000000                                                       ; inst 19
  ret i32 %14                                                                      ; inst 20
}

define i32 @calculateCatalanNumbers(i64 %0) {
_0.entry.0:
  %1 = alloca [15 x i32]                                                           ; inst 1
  %2 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 15                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 0                      ; inst 11
  store i32 1, i32* %7                                                             ; inst 12
  %8 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 1                      ; inst 13
  store i32 1, i32* %8                                                             ; inst 14
  br label %_4.while.cond.0                                                        ; inst 15
_4.while.cond.0:
  %9 = phi i32 [2, %_3.array.exit.0], [%31, %_8.while.exit.1]                      ; inst 16
  %10 = phi i64 [2, %_3.array.exit.0], [%32, %_8.while.exit.1]                     ; inst 17
  %11 = icmp ult i64 %10, %0                                                       ; inst 18
  br i1 %11, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 19
_5.while.body.0:
  %12 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 %10                   ; inst 20
  store i32 0, i32* %12                                                            ; inst 21
  br label %_6.while.cond.1                                                        ; inst 22
_6.while.cond.1:
  %13 = phi i64 [0, %_5.while.body.0], [%27, %_7.while.body.1]                     ; inst 23
  %14 = icmp ult i64 %13, %10                                                      ; inst 24
  br i1 %14, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 25
_7.while.body.1:
  %15 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 %10                   ; inst 26
  %16 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 %10                   ; inst 27
  %17 = load i32, i32* %16                                                         ; inst 28
  %18 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 %13                   ; inst 29
  %19 = load i32, i32* %18                                                         ; inst 30
  %20 = sub i64 %10, 1                                                             ; inst 31
  %21 = sub i64 %20, %13                                                           ; inst 32
  %22 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 %21                   ; inst 33
  %23 = load i32, i32* %22                                                         ; inst 34
  %24 = mul i32 %19, %23                                                           ; inst 35
  %25 = add i32 %17, %24                                                           ; inst 36
  %26 = srem i32 %25, 1000000                                                      ; inst 37
  store i32 %26, i32* %15                                                          ; inst 38
  %27 = add i64 %13, 1                                                             ; inst 39
  br label %_6.while.cond.1                                                        ; inst 40
_8.while.exit.1:
  %28 = getelementptr [15 x i32], [15 x i32]* %1, i32 0, i64 %10                   ; inst 41
  %29 = load i32, i32* %28                                                         ; inst 42
  %30 = add i32 %9, %29                                                            ; inst 43
  %31 = srem i32 %30, 1000000                                                      ; inst 44
  %32 = add i64 %10, 1                                                             ; inst 45
  br label %_4.while.cond.0                                                        ; inst 46
_9.while.exit.0:
  %33 = srem i32 %9, 10000                                                         ; inst 47
  ret i32 %33                                                                      ; inst 48
}

define void @performCryptographicOperations() {
_0.entry.0:
  call void @printlnInt(i32 3009)                                                  ; inst 1
  %0 = call i32 @performRSAOperations()                                            ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @performModularInverse()                                           ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @performPrimalityTesting()                                         ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @performHashOperations()                                           ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 3010)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @performRSAOperations() {
_0.entry.0:
  %0 = call i32 @modularInverse(i32 17, i32 3120)                                  ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %1 = phi i32 [2, %_0.entry.0], [%9, %_5.if.exit.0]                               ; inst 3
  %2 = phi i32 [0, %_0.entry.0], [%8, %_5.if.exit.0]                               ; inst 4
  %3 = icmp slt i32 %1, 100                                                        ; inst 5
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %4 = call i32 @modularPower(i32 %1, i32 17, i32 3233)                            ; inst 7
  %5 = call i32 @modularPower(i32 %4, i32 %0, i32 3233)                            ; inst 8
  %6 = icmp eq i32 %5, %1                                                          ; inst 9
  br i1 %6, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %7 = add i32 %2, %1                                                              ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %8 = phi i32 [%7, %_3.if.then.0], [%2, %_4.if.else.0]                            ; inst 14
  %9 = add i32 %1, 7                                                               ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  %10 = srem i32 %2, 10000                                                         ; inst 17
  ret i32 %10                                                                      ; inst 18
}

define i32 @modularInverse(i32 %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [1, %_0.entry.0], [%2, %_2.while.body.0]                            ; inst 3
  %4 = phi i32 [%1, %_0.entry.0], [%9, %_2.while.body.0]                           ; inst 4
  %5 = phi i32 [%0, %_0.entry.0], [%4, %_2.while.body.0]                           ; inst 5
  %6 = icmp ne i32 %4, 0                                                           ; inst 6
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = sdiv i32 %5, %4                                                             ; inst 8
  %8 = mul i32 %7, %4                                                              ; inst 9
  %9 = sub i32 %5, %8                                                              ; inst 10
  %10 = mul i32 %7, %2                                                             ; inst 11
  %11 = sub i32 %3, %10                                                            ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %12 = icmp slt i32 %3, 0                                                         ; inst 14
  br i1 %12, label %_4.if.then.0, label %_5.if.else.0                              ; inst 15
_4.if.then.0:
  %13 = add i32 %3, %1                                                             ; inst 16
  br label %_6.if.exit.0                                                           ; inst 17
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 18
_6.if.exit.0:
  %14 = phi i32 [%13, %_4.if.then.0], [%3, %_5.if.else.0]                          ; inst 19
  ret i32 %14                                                                      ; inst 20
}

define i32 @performModularInverse() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [2, %_0.entry.0], [%9, %_5.if.exit.0]                               ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%8, %_5.if.exit.0]                               ; inst 3
  %2 = icmp slt i32 %0, 97                                                         ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %3 = call i32 @euclideanGCD(i32 %0, i32 97)                                      ; inst 6
  %4 = icmp eq i32 %3, 1                                                           ; inst 7
  br i1 %4, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %5 = call i32 @modularInverse(i32 %0, i32 97)                                    ; inst 9
  %6 = add i32 %1, %5                                                              ; inst 10
  %7 = srem i32 %6, 10000                                                          ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %8 = phi i32 [%7, %_3.if.then.0], [%1, %_4.if.else.0]                            ; inst 14
  %9 = add i32 %0, 1                                                               ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  ret i32 %1                                                                       ; inst 17
}

define i32 @performPrimalityTesting() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [3, %_0.entry.0], [%7, %_5.if.exit.0]                               ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%6, %_5.if.exit.0]                               ; inst 3
  %2 = icmp slt i32 %0, 500                                                        ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %3 = call i32 @fermatPrimalityTest(i32 %0, i32 5)                                ; inst 6
  %4 = icmp eq i32 %3, 1                                                           ; inst 7
  br i1 %4, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %5 = add i32 %1, 1                                                               ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %6 = phi i32 [%5, %_3.if.then.0], [%1, %_4.if.else.0]                            ; inst 12
  %7 = add i32 %0, 2                                                               ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  ret i32 %1                                                                       ; inst 15
}

define i32 @fermatPrimalityTest(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = icmp sle i32 %0, 3                                                          ; inst 5
  br i1 %3, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 1                                                                        ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  %4 = srem i32 %0, 2                                                              ; inst 9
  %5 = icmp eq i32 %4, 0                                                           ; inst 10
  br i1 %5, label %_7.if.then.2, label %_8.if.else.2                               ; inst 11
_7.if.then.2:
  ret i32 0                                                                        ; inst 12
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 13
_9.if.exit.2:
  br label %_10.while.cond.0                                                       ; inst 14
_10.while.cond.0:
  %6 = phi i32 [0, %_9.if.exit.2], [%16, %_14.if.exit.3]                           ; inst 15
  %7 = phi i32 [%0, %_9.if.exit.2], [%9, %_14.if.exit.3]                           ; inst 16
  %8 = icmp slt i32 %6, %1                                                         ; inst 17
  br i1 %8, label %_11.while.body.0, label %_15.while.exit.0                       ; inst 18
_11.while.body.0:
  %9 = call i32 @updateSeed(i32 %7)                                                ; inst 19
  %10 = sub i32 %0, 3                                                              ; inst 20
  %11 = srem i32 %9, %10                                                           ; inst 21
  %12 = add i32 2, %11                                                             ; inst 22
  %13 = sub i32 %0, 1                                                              ; inst 23
  %14 = call i32 @modularPower(i32 %12, i32 %13, i32 %0)                           ; inst 24
  %15 = icmp ne i32 %14, 1                                                         ; inst 25
  br i1 %15, label %_12.if.then.3, label %_13.if.else.3                            ; inst 26
_12.if.then.3:
  ret i32 0                                                                        ; inst 27
_13.if.else.3:
  br label %_14.if.exit.3                                                          ; inst 28
_14.if.exit.3:
  %16 = add i32 %6, 1                                                              ; inst 29
  br label %_10.while.cond.0                                                       ; inst 30
_15.while.exit.0:
  ret i32 1                                                                        ; inst 31
}

define i32 @performHashOperations() {
_0.entry.0:
  %0 = alloca [100 x i32]                                                          ; inst 1
  %1 = alloca [100 x i32]                                                          ; inst 2
  %2 = alloca [100 x i32]                                                          ; inst 3
  %3 = alloca [100 x i32]                                                          ; inst 4
  %4 = alloca [100 x i32]                                                          ; inst 5
  %5 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i32 0                    ; inst 6
  br label %_1.array.cond.0                                                        ; inst 7
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 8
  %7 = icmp slt i32 %6, 100                                                        ; inst 9
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 10
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 11
  store i32 0, i32* %8                                                             ; inst 12
  %9 = add i32 %6, 1                                                               ; inst 13
  br label %_1.array.cond.0                                                        ; inst 14
_3.array.exit.0:
  call void @initializeHashInput([100 x i32]* %4, i64 100)                         ; inst 15
  call void @memcpy([100 x i32]* %0, [100 x i32]* %4, i64 400)                     ; inst 16
  %10 = call i32 @djb2Hash([100 x i32]* %0, i64 100)                               ; inst 17
  call void @memcpy([100 x i32]* %1, [100 x i32]* %4, i64 400)                     ; inst 18
  %11 = call i32 @sdbmHash([100 x i32]* %1, i64 100)                               ; inst 19
  call void @memcpy([100 x i32]* %2, [100 x i32]* %4, i64 400)                     ; inst 20
  %12 = call i32 @fnvHash([100 x i32]* %2, i64 100)                                ; inst 21
  %13 = add i32 %10, %11                                                           ; inst 22
  %14 = add i32 %13, %12                                                           ; inst 23
  %15 = srem i32 %14, 10000                                                        ; inst 24
  call void @memcpy([100 x i32]* %3, [100 x i32]* %4, i64 400)                     ; inst 25
  %16 = call i32 @testHashDistribution([100 x i32]* %3, i64 100)                   ; inst 26
  %17 = add i32 %15, %16                                                           ; inst 27
  %18 = srem i32 %17, 10000                                                        ; inst 28
  ret i32 %18                                                                      ; inst 29
}

define i32 @updateSeed(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 1103                                                            ; inst 1
  %2 = add i32 %1, 4721                                                            ; inst 2
  %3 = srem i32 %2, 1048583                                                        ; inst 3
  %4 = icmp slt i32 %3, 0                                                          ; inst 4
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  %5 = sub i32 0, %3                                                               ; inst 6
  br label %_3.if.exit.0                                                           ; inst 7
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 8
_3.if.exit.0:
  %6 = phi i32 [%5, %_1.if.then.0], [%3, %_2.if.else.0]                            ; inst 9
  ret i32 %6                                                                       ; inst 10
}

define void @initializeHashInput([100 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %3 = phi i32 [42, %_0.entry.0], [%5, %_2.while.body.0]                           ; inst 3
  %4 = icmp ult i64 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = call i32 @updateSeed(i32 %3)                                                ; inst 6
  %6 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                   ; inst 7
  %7 = srem i32 %5, 256                                                            ; inst 8
  store i32 %7, i32* %6                                                            ; inst 9
  %8 = add i64 %2, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret void                                                                         ; inst 12
}

define i32 @djb2Hash([100 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [5381, %_0.entry.0], [%11, %_2.while.body.0]                        ; inst 3
  %4 = icmp ult i64 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = shl i32 %3, 5                                                               ; inst 6
  %6 = srem i32 %5, 65536                                                          ; inst 7
  %7 = add i32 %6, %3                                                              ; inst 8
  %8 = srem i32 %7, 65536                                                          ; inst 9
  %9 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                   ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  %11 = add i32 %8, %10                                                            ; inst 12
  %12 = add i64 %2, 1                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  %13 = srem i32 %3, 65536                                                         ; inst 15
  ret i32 %13                                                                      ; inst 16
}

define i32 @sdbmHash([100 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%13, %_2.while.body.0]                           ; inst 3
  %4 = icmp ult i64 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = shl i32 %3, 6                                                               ; inst 8
  %8 = srem i32 %7, 65536                                                          ; inst 9
  %9 = add i32 %6, %8                                                              ; inst 10
  %10 = shl i32 %3, 16                                                             ; inst 11
  %11 = srem i32 %10, 65536                                                        ; inst 12
  %12 = add i32 %9, %11                                                            ; inst 13
  %13 = sub i32 %12, %3                                                            ; inst 14
  %14 = add i64 %2, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_3.while.exit.0:
  %15 = srem i32 %3, 65536                                                         ; inst 17
  ret i32 %15                                                                      ; inst 18
}

define i32 @fnvHash([100 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [2166136261, %_0.entry.0], [%10, %_2.while.body.0]                  ; inst 3
  %4 = icmp ult i64 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = xor i32 %3, %6                                                              ; inst 8
  %8 = urem i32 %7, 65536                                                          ; inst 9
  %9 = mul i32 %8, 403                                                             ; inst 10
  %10 = urem i32 %9, 65536                                                         ; inst 11
  %11 = add i64 %2, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %12 = srem i32 %3, 65536                                                         ; inst 14
  ret i32 %12                                                                      ; inst 15
}

define i32 @testHashDistribution([100 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca [100 x i32]                                                          ; inst 1
  %3 = alloca [100 x i32]                                                          ; inst 2
  %4 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 5
  %6 = icmp slt i32 %5, 100                                                        ; inst 6
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 8
  store i32 0, i32* %7                                                             ; inst 9
  %8 = add i32 %5, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %9 = phi i32 [0, %_3.array.exit.0], [%26, %_8.while.exit.1]                      ; inst 13
  %10 = phi i64 [1, %_3.array.exit.0], [%27, %_8.while.exit.1]                     ; inst 14
  %11 = icmp ule i64 %10, 10                                                       ; inst 15
  br i1 %11, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 16
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 17
_6.while.cond.1:
  %12 = phi i64 [0, %_5.while.body.0], [%17, %_7.while.body.1]                     ; inst 18
  %13 = icmp ult i64 %12, %1                                                       ; inst 19
  br i1 %13, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 20
_7.while.body.1:
  %14 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %12                 ; inst 21
  %15 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %12                 ; inst 22
  %16 = load i32, i32* %15                                                         ; inst 23
  store i32 %16, i32* %14                                                          ; inst 24
  %17 = add i64 %12, 1                                                             ; inst 25
  br label %_6.while.cond.1                                                        ; inst 26
_8.while.exit.1:
  %18 = mul i64 %10, 7                                                             ; inst 27
  %19 = urem i64 %18, %1                                                           ; inst 28
  %20 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %19                 ; inst 29
  %21 = load i32, i32* %20                                                         ; inst 30
  %22 = trunc i64 %10 to i32                                                       ; inst 31
  %23 = add i32 %21, %22                                                           ; inst 32
  store i32 %23, i32* %20                                                          ; inst 33
  call void @memcpy([100 x i32]* %2, [100 x i32]* %3, i64 400)                     ; inst 34
  %24 = call i32 @djb2Hash([100 x i32]* %2, i64 %1)                                ; inst 35
  %25 = add i32 %9, %24                                                            ; inst 36
  %26 = srem i32 %25, 10000                                                        ; inst 37
  %27 = add i64 %10, 1                                                             ; inst 38
  br label %_4.while.cond.0                                                        ; inst 39
_9.while.exit.0:
  ret i32 %9                                                                       ; inst 40
}

