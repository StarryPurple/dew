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
  call void @testStringSearchAlgorithms()                                          ; inst 2
  call void @testTextProcessingAlgorithms()                                        ; inst 3
  call void @testStringParsingAlgorithms()                                         ; inst 4
  call void @testStringCompressionAlgorithms()                                     ; inst 5
  call void @testAdvancedStringAlgorithms()                                        ; inst 6
  call void @printlnInt(i32 1699)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @testStringSearchAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1601)                                                  ; inst 1
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
  %6 = alloca [10 x i32]                                                           ; inst 12
  %7 = getelementptr [10 x i32], [10 x i32]* %6, i32 0, i32 0                      ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 10                                                         ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  call void @initializeTextString([1000 x i32]* %0)                                ; inst 22
  call void @initializePatternString([10 x i32]* %6)                               ; inst 23
  %12 = call i32 @naiveStringSearch([1000 x i32]* %0, i32 1000, [10 x i32]* %6, i32 10) ; inst 24
  call void @printlnInt(i32 %12)                                                   ; inst 25
  %13 = call i32 @kmpStringSearch([1000 x i32]* %0, i32 1000, [10 x i32]* %6, i32 10) ; inst 26
  call void @printlnInt(i32 %13)                                                   ; inst 27
  %14 = call i32 @boyerMooreStringSearch([1000 x i32]* %0, i32 1000, [10 x i32]* %6, i32 10) ; inst 28
  call void @printlnInt(i32 %14)                                                   ; inst 29
  %15 = call i32 @multiplePatternSearch([1000 x i32]* %0, i32 1000)                ; inst 30
  call void @printlnInt(i32 %15)                                                   ; inst 31
  call void @printlnInt(i32 1602)                                                  ; inst 32
  ret void                                                                         ; inst 33
}

define void @initializeTextString([1000 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [125, %_0.entry.0], [%6, %_2.while.body.0]                          ; inst 3
  %3 = icmp slt i32 %1, 1000                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = mul i32 %2, 166                                                             ; inst 6
  %5 = add i32 %4, 1013                                                            ; inst 7
  %6 = srem i32 %5, 214743                                                         ; inst 8
  %7 = sext i32 %1 to i64                                                          ; inst 9
  %8 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %7                 ; inst 10
  %9 = srem i32 %6, 95                                                             ; inst 11
  %10 = add i32 32, %9                                                             ; inst 12
  store i32 %10, i32* %8                                                           ; inst 13
  %11 = add i32 %1, 1                                                              ; inst 14
  br label %_1.while.cond.0                                                        ; inst 15
_3.while.exit.0:
  %12 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 100               ; inst 16
  store i32 65, i32* %12                                                           ; inst 17
  %13 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 101               ; inst 18
  store i32 66, i32* %13                                                           ; inst 19
  %14 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 102               ; inst 20
  store i32 67, i32* %14                                                           ; inst 21
  %15 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 103               ; inst 22
  store i32 68, i32* %15                                                           ; inst 23
  %16 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 500               ; inst 24
  store i32 65, i32* %16                                                           ; inst 25
  %17 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 501               ; inst 26
  store i32 66, i32* %17                                                           ; inst 27
  %18 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 502               ; inst 28
  store i32 67, i32* %18                                                           ; inst 29
  %19 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 503               ; inst 30
  store i32 68, i32* %19                                                           ; inst 31
  ret void                                                                         ; inst 32
}

define void @initializePatternString([10 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 0                      ; inst 1
  store i32 65, i32* %1                                                            ; inst 2
  %2 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 1                      ; inst 3
  store i32 66, i32* %2                                                            ; inst 4
  %3 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 2                      ; inst 5
  store i32 67, i32* %3                                                            ; inst 6
  %4 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 3                      ; inst 7
  store i32 68, i32* %4                                                            ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_1.while.cond.0:
  %5 = phi i32 [4, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 10
  %6 = icmp slt i32 %5, 10                                                         ; inst 11
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 12
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 13
  %8 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 %7                     ; inst 14
  store i32 0, i32* %8                                                             ; inst 15
  %9 = add i32 %5, 1                                                               ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret void                                                                         ; inst 18
}

define i32 @naiveStringSearch([1000 x i32]* %0, i32 %1, [10 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%22, %_11.if.exit.1]                             ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%21, %_11.if.exit.1]                             ; inst 3
  %6 = sub i32 %1, %3                                                              ; inst 4
  %7 = icmp sle i32 %4, %6                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %8 = phi i32 [0, %_2.while.body.0], [%18, %_7.if.exit.0]                         ; inst 8
  %9 = icmp slt i32 %8, %3                                                         ; inst 9
  br i1 %9, label %_4.while.body.1, label %_13.critical_edge.0                     ; inst 10
_4.while.body.1:
  %10 = add i32 %4, %8                                                             ; inst 11
  %11 = sext i32 %10 to i64                                                        ; inst 12
  %12 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %11               ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = sext i32 %8 to i64                                                         ; inst 15
  %15 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %14                   ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = icmp ne i32 %13, %16                                                       ; inst 18
  br i1 %17, label %_5.if.then.0, label %_6.if.else.0                              ; inst 19
_5.if.then.0:
  br label %_8.while.exit.1                                                        ; inst 20
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 21
_7.if.exit.0:
  %18 = add i32 %8, 1                                                              ; inst 22
  br label %_3.while.cond.1                                                        ; inst 23
_8.while.exit.1:
  %19 = phi i1 [1, %_13.critical_edge.0], [0, %_5.if.then.0]                       ; inst 24
  br i1 %19, label %_9.if.then.1, label %_10.if.else.1                             ; inst 25
_9.if.then.1:
  %20 = add i32 %5, 1                                                              ; inst 26
  br label %_11.if.exit.1                                                          ; inst 27
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 28
_11.if.exit.1:
  %21 = phi i32 [%20, %_9.if.then.1], [%5, %_10.if.else.1]                         ; inst 29
  %22 = add i32 %4, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_12.while.exit.0:
  ret i32 %5                                                                       ; inst 32
_13.critical_edge.0:
  br label %_8.while.exit.1                                                        ; inst 33
}

define i32 @kmpStringSearch([1000 x i32]* %0, i32 %1, [10 x i32]* %2, i32 %3) {
_0.entry.0:
  %4 = alloca [20 x i32]                                                           ; inst 1
  %5 = getelementptr [20 x i32], [20 x i32]* %4, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 20                                                         ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 7
  store i32 0, i32* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  call void @computeLPSArray([10 x i32]* %2, i32 %3, [20 x i32]* %4)               ; inst 11
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %10 = phi i32 [0, %_3.array.exit.0], [%50, %_20.if.exit.1]                       ; inst 13
  %11 = phi i32 [0, %_3.array.exit.0], [%51, %_20.if.exit.1]                       ; inst 14
  %12 = phi i32 [0, %_3.array.exit.0], [%52, %_20.if.exit.1]                       ; inst 15
  %13 = icmp slt i32 %11, %1                                                       ; inst 16
  br i1 %13, label %_5.while.body.0, label %_21.while.exit.0                       ; inst 17
_5.while.body.0:
  %14 = sext i32 %12 to i64                                                        ; inst 18
  %15 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %14                   ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = sext i32 %11 to i64                                                        ; inst 21
  %18 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %17               ; inst 22
  %19 = load i32, i32* %18                                                         ; inst 23
  %20 = icmp eq i32 %16, %19                                                       ; inst 24
  br i1 %20, label %_6.if.then.0, label %_7.if.else.0                              ; inst 25
_6.if.then.0:
  %21 = add i32 %11, 1                                                             ; inst 26
  %22 = add i32 %12, 1                                                             ; inst 27
  br label %_8.if.exit.0                                                           ; inst 28
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 29
_8.if.exit.0:
  %23 = phi i32 [%21, %_6.if.then.0], [%11, %_7.if.else.0]                         ; inst 30
  %24 = phi i32 [%22, %_6.if.then.0], [%12, %_7.if.else.0]                         ; inst 31
  %25 = icmp eq i32 %24, %3                                                        ; inst 32
  br i1 %25, label %_9.if.then.1, label %_10.if.else.1                             ; inst 33
_9.if.then.1:
  %26 = add i32 %10, 1                                                             ; inst 34
  %27 = sext i32 %24 to i64                                                        ; inst 35
  %28 = sub i64 %27, 1                                                             ; inst 36
  %29 = getelementptr [20 x i32], [20 x i32]* %4, i32 0, i64 %28                   ; inst 37
  %30 = load i32, i32* %29                                                         ; inst 38
  br label %_20.if.exit.1                                                          ; inst 39
_10.if.else.1:
  %31 = icmp slt i32 %23, %1                                                       ; inst 40
  br i1 %31, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 41
_11.lazy.then.0:
  %32 = sext i32 %24 to i64                                                        ; inst 42
  %33 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %32                   ; inst 43
  %34 = load i32, i32* %33                                                         ; inst 44
  %35 = sext i32 %23 to i64                                                        ; inst 45
  %36 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %35               ; inst 46
  %37 = load i32, i32* %36                                                         ; inst 47
  %38 = icmp ne i32 %34, %37                                                       ; inst 48
  br label %_13.lazy.exit.0                                                        ; inst 49
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 50
_13.lazy.exit.0:
  %39 = phi i1 [%38, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 51
  br i1 %39, label %_14.if.then.2, label %_18.if.else.2                            ; inst 52
_14.if.then.2:
  %40 = icmp ne i32 %24, 0                                                         ; inst 53
  br i1 %40, label %_15.if.then.3, label %_16.if.else.3                            ; inst 54
_15.if.then.3:
  %41 = sext i32 %24 to i64                                                        ; inst 55
  %42 = sub i64 %41, 1                                                             ; inst 56
  %43 = getelementptr [20 x i32], [20 x i32]* %4, i32 0, i64 %42                   ; inst 57
  %44 = load i32, i32* %43                                                         ; inst 58
  br label %_17.if.exit.3                                                          ; inst 59
_16.if.else.3:
  %45 = add i32 %23, 1                                                             ; inst 60
  br label %_17.if.exit.3                                                          ; inst 61
_17.if.exit.3:
  %46 = phi i32 [%23, %_15.if.then.3], [%45, %_16.if.else.3]                       ; inst 62
  %47 = phi i32 [%44, %_15.if.then.3], [%24, %_16.if.else.3]                       ; inst 63
  br label %_19.if.exit.2                                                          ; inst 64
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 65
_19.if.exit.2:
  %48 = phi i32 [%46, %_17.if.exit.3], [%23, %_18.if.else.2]                       ; inst 66
  %49 = phi i32 [%47, %_17.if.exit.3], [%24, %_18.if.else.2]                       ; inst 67
  br label %_20.if.exit.1                                                          ; inst 68
_20.if.exit.1:
  %50 = phi i32 [%26, %_9.if.then.1], [%10, %_19.if.exit.2]                        ; inst 69
  %51 = phi i32 [%23, %_9.if.then.1], [%48, %_19.if.exit.2]                        ; inst 70
  %52 = phi i32 [%30, %_9.if.then.1], [%49, %_19.if.exit.2]                        ; inst 71
  br label %_4.while.cond.0                                                        ; inst 72
_21.while.exit.0:
  ret i32 %10                                                                      ; inst 73
}

define void @computeLPSArray([10 x i32]* %0, i32 %1, [20 x i32]* %2) {
_0.entry.0:
  %3 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 0                      ; inst 1
  store i32 0, i32* %3                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [1, %_0.entry.0], [%28, %_8.if.exit.0]                              ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%29, %_8.if.exit.0]                              ; inst 5
  %6 = icmp slt i32 %4, %1                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = sext i32 %4 to i64                                                          ; inst 8
  %8 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 %7                     ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = sext i32 %5 to i64                                                         ; inst 11
  %11 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 %10                   ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  %13 = icmp eq i32 %9, %12                                                        ; inst 14
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 15
_3.if.then.0:
  %14 = add i32 %5, 1                                                              ; inst 16
  %15 = sext i32 %4 to i64                                                         ; inst 17
  %16 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %15                   ; inst 18
  store i32 %14, i32* %16                                                          ; inst 19
  %17 = add i32 %4, 1                                                              ; inst 20
  br label %_8.if.exit.0                                                           ; inst 21
_4.if.else.0:
  %18 = icmp ne i32 %5, 0                                                          ; inst 22
  br i1 %18, label %_5.if.then.1, label %_6.if.else.1                              ; inst 23
_5.if.then.1:
  %19 = sext i32 %5 to i64                                                         ; inst 24
  %20 = sub i64 %19, 1                                                             ; inst 25
  %21 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %20                   ; inst 26
  %22 = load i32, i32* %21                                                         ; inst 27
  br label %_7.if.exit.1                                                           ; inst 28
_6.if.else.1:
  %23 = sext i32 %4 to i64                                                         ; inst 29
  %24 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %23                   ; inst 30
  store i32 0, i32* %24                                                            ; inst 31
  %25 = add i32 %4, 1                                                              ; inst 32
  br label %_7.if.exit.1                                                           ; inst 33
_7.if.exit.1:
  %26 = phi i32 [%4, %_5.if.then.1], [%25, %_6.if.else.1]                          ; inst 34
  %27 = phi i32 [%22, %_5.if.then.1], [%5, %_6.if.else.1]                          ; inst 35
  br label %_8.if.exit.0                                                           ; inst 36
_8.if.exit.0:
  %28 = phi i32 [%17, %_3.if.then.0], [%26, %_7.if.exit.1]                         ; inst 37
  %29 = phi i32 [%14, %_3.if.then.0], [%27, %_7.if.exit.1]                         ; inst 38
  br label %_1.while.cond.0                                                        ; inst 39
_9.while.exit.0:
  ret void                                                                         ; inst 40
}

define i32 @boyerMooreStringSearch([1000 x i32]* %0, i32 %1, [10 x i32]* %2, i32 %3) {
_0.entry.0:
  %4 = alloca [256 x i32]                                                          ; inst 1
  %5 = getelementptr [256 x i32], [256 x i32]* %4, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 256                                                        ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 7
  store i32 -1, i32* %8                                                            ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %10 = phi i32 [0, %_3.array.exit.0], [%26, %_11.if.exit.0]                       ; inst 12
  %11 = icmp slt i32 %10, %3                                                       ; inst 13
  br i1 %11, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 14
_5.while.body.0:
  %12 = sext i32 %10 to i64                                                        ; inst 15
  %13 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %12                   ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = icmp sge i32 %14, 0                                                        ; inst 18
  br i1 %15, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 19
_6.lazy.then.0:
  %16 = sext i32 %10 to i64                                                        ; inst 20
  %17 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %16                   ; inst 21
  %18 = load i32, i32* %17                                                         ; inst 22
  %19 = icmp slt i32 %18, 256                                                      ; inst 23
  br label %_8.lazy.exit.0                                                         ; inst 24
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 25
_8.lazy.exit.0:
  %20 = phi i1 [%19, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 26
  br i1 %20, label %_9.if.then.0, label %_10.if.else.0                             ; inst 27
_9.if.then.0:
  %21 = sext i32 %10 to i64                                                        ; inst 28
  %22 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %21                   ; inst 29
  %23 = load i32, i32* %22                                                         ; inst 30
  %24 = sext i32 %23 to i64                                                        ; inst 31
  %25 = getelementptr [256 x i32], [256 x i32]* %4, i32 0, i64 %24                 ; inst 32
  store i32 %10, i32* %25                                                          ; inst 33
  br label %_11.if.exit.0                                                          ; inst 34
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 35
_11.if.exit.0:
  %26 = add i32 %10, 1                                                             ; inst 36
  br label %_4.while.cond.0                                                        ; inst 37
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 38
_13.while.cond.1:
  %27 = phi i32 [0, %_12.while.exit.0], [%83, %_35.if.exit.1]                      ; inst 39
  %28 = phi i32 [0, %_12.while.exit.0], [%84, %_35.if.exit.1]                      ; inst 40
  %29 = sub i32 %1, %3                                                             ; inst 41
  %30 = icmp sle i32 %28, %29                                                      ; inst 42
  br i1 %30, label %_14.while.body.1, label %_36.while.exit.1                      ; inst 43
_14.while.body.1:
  %31 = sub i32 %3, 1                                                              ; inst 44
  br label %_15.while.cond.2                                                       ; inst 45
_15.while.cond.2:
  %32 = phi i32 [%31, %_14.while.body.1], [%43, %_19.while.body.2]                 ; inst 46
  %33 = icmp sge i32 %32, 0                                                        ; inst 47
  br i1 %33, label %_16.lazy.then.1, label %_17.lazy.else.1                        ; inst 48
_16.lazy.then.1:
  %34 = sext i32 %32 to i64                                                        ; inst 49
  %35 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %34                   ; inst 50
  %36 = load i32, i32* %35                                                         ; inst 51
  %37 = add i32 %28, %32                                                           ; inst 52
  %38 = sext i32 %37 to i64                                                        ; inst 53
  %39 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %38               ; inst 54
  %40 = load i32, i32* %39                                                         ; inst 55
  %41 = icmp eq i32 %36, %40                                                       ; inst 56
  br label %_18.lazy.exit.1                                                        ; inst 57
_17.lazy.else.1:
  br label %_18.lazy.exit.1                                                        ; inst 58
_18.lazy.exit.1:
  %42 = phi i1 [%41, %_16.lazy.then.1], [0, %_17.lazy.else.1]                      ; inst 59
  br i1 %42, label %_19.while.body.2, label %_20.while.exit.2                      ; inst 60
_19.while.body.2:
  %43 = sub i32 %32, 1                                                             ; inst 61
  br label %_15.while.cond.2                                                       ; inst 62
_20.while.exit.2:
  %44 = icmp slt i32 %32, 0                                                        ; inst 63
  br i1 %44, label %_21.if.then.1, label %_25.if.else.1                            ; inst 64
_21.if.then.1:
  %45 = add i32 %27, 1                                                             ; inst 65
  %46 = add i32 %28, %3                                                            ; inst 66
  %47 = icmp slt i32 %46, %1                                                       ; inst 67
  br i1 %47, label %_22.if.then.2, label %_23.if.else.2                            ; inst 68
_22.if.then.2:
  %48 = add i32 %28, %3                                                            ; inst 69
  %49 = add i32 %28, %3                                                            ; inst 70
  %50 = sext i32 %49 to i64                                                        ; inst 71
  %51 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %50               ; inst 72
  %52 = load i32, i32* %51                                                         ; inst 73
  %53 = sext i32 %52 to i64                                                        ; inst 74
  %54 = getelementptr [256 x i32], [256 x i32]* %4, i32 0, i64 %53                 ; inst 75
  %55 = load i32, i32* %54                                                         ; inst 76
  %56 = sub i32 %48, %55                                                           ; inst 77
  br label %_24.if.exit.2                                                          ; inst 78
_23.if.else.2:
  %57 = add i32 %28, 1                                                             ; inst 79
  br label %_24.if.exit.2                                                          ; inst 80
_24.if.exit.2:
  %58 = phi i32 [%56, %_22.if.then.2], [%57, %_23.if.else.2]                       ; inst 81
  br label %_35.if.exit.1                                                          ; inst 82
_25.if.else.1:
  %59 = add i32 %28, %32                                                           ; inst 83
  %60 = sext i32 %59 to i64                                                        ; inst 84
  %61 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %60               ; inst 85
  %62 = load i32, i32* %61                                                         ; inst 86
  %63 = icmp sge i32 %62, 0                                                        ; inst 87
  br i1 %63, label %_26.lazy.then.2, label %_27.lazy.else.2                        ; inst 88
_26.lazy.then.2:
  %64 = add i32 %28, %32                                                           ; inst 89
  %65 = sext i32 %64 to i64                                                        ; inst 90
  %66 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %65               ; inst 91
  %67 = load i32, i32* %66                                                         ; inst 92
  %68 = icmp slt i32 %67, 256                                                      ; inst 93
  br label %_28.lazy.exit.2                                                        ; inst 94
_27.lazy.else.2:
  br label %_28.lazy.exit.2                                                        ; inst 95
_28.lazy.exit.2:
  %69 = phi i1 [%68, %_26.lazy.then.2], [0, %_27.lazy.else.2]                      ; inst 96
  br i1 %69, label %_29.if.then.3, label %_30.if.else.3                            ; inst 97
_29.if.then.3:
  %70 = add i32 %28, %32                                                           ; inst 98
  %71 = sext i32 %70 to i64                                                        ; inst 99
  %72 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %71               ; inst 100
  %73 = load i32, i32* %72                                                         ; inst 101
  %74 = sext i32 %73 to i64                                                        ; inst 102
  %75 = getelementptr [256 x i32], [256 x i32]* %4, i32 0, i64 %74                 ; inst 103
  %76 = load i32, i32* %75                                                         ; inst 104
  %77 = sub i32 %32, %76                                                           ; inst 105
  br label %_31.if.exit.3                                                          ; inst 106
_30.if.else.3:
  br label %_31.if.exit.3                                                          ; inst 107
_31.if.exit.3:
  %78 = phi i32 [%77, %_29.if.then.3], [1, %_30.if.else.3]                         ; inst 108
  %79 = icmp sgt i32 %78, 1                                                        ; inst 109
  br i1 %79, label %_32.if.then.4, label %_33.if.else.4                            ; inst 110
_32.if.then.4:
  %80 = add i32 %28, %78                                                           ; inst 111
  br label %_34.if.exit.4                                                          ; inst 112
_33.if.else.4:
  %81 = add i32 %28, 1                                                             ; inst 113
  br label %_34.if.exit.4                                                          ; inst 114
_34.if.exit.4:
  %82 = phi i32 [%80, %_32.if.then.4], [%81, %_33.if.else.4]                       ; inst 115
  br label %_35.if.exit.1                                                          ; inst 116
_35.if.exit.1:
  %83 = phi i32 [%45, %_24.if.exit.2], [%27, %_34.if.exit.4]                       ; inst 117
  %84 = phi i32 [%58, %_24.if.exit.2], [%82, %_34.if.exit.4]                       ; inst 118
  br label %_13.while.cond.1                                                       ; inst 119
_36.while.exit.1:
  ret i32 %27                                                                      ; inst 120
}

define i32 @multiplePatternSearch([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [10 x i32]                                                           ; inst 1
  %3 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 0                      ; inst 2
  store i32 65, i32* %3                                                            ; inst 3
  %4 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 1                      ; inst 4
  store i32 66, i32* %4                                                            ; inst 5
  %5 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 2                      ; inst 6
  store i32 0, i32* %5                                                             ; inst 7
  %6 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 3                      ; inst 8
  store i32 0, i32* %6                                                             ; inst 9
  %7 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 4                      ; inst 10
  store i32 0, i32* %7                                                             ; inst 11
  %8 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 5                      ; inst 12
  store i32 0, i32* %8                                                             ; inst 13
  %9 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 6                      ; inst 14
  store i32 0, i32* %9                                                             ; inst 15
  %10 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 7                     ; inst 16
  store i32 0, i32* %10                                                            ; inst 17
  %11 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 8                     ; inst 18
  store i32 0, i32* %11                                                            ; inst 19
  %12 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 9                     ; inst 20
  store i32 0, i32* %12                                                            ; inst 21
  %13 = alloca [10 x i32]                                                          ; inst 22
  %14 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 0                    ; inst 23
  store i32 67, i32* %14                                                           ; inst 24
  %15 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 1                    ; inst 25
  store i32 68, i32* %15                                                           ; inst 26
  %16 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 2                    ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 3                    ; inst 29
  store i32 0, i32* %17                                                            ; inst 30
  %18 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 4                    ; inst 31
  store i32 0, i32* %18                                                            ; inst 32
  %19 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 5                    ; inst 33
  store i32 0, i32* %19                                                            ; inst 34
  %20 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 6                    ; inst 35
  store i32 0, i32* %20                                                            ; inst 36
  %21 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 7                    ; inst 37
  store i32 0, i32* %21                                                            ; inst 38
  %22 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 8                    ; inst 39
  store i32 0, i32* %22                                                            ; inst 40
  %23 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i32 9                    ; inst 41
  store i32 0, i32* %23                                                            ; inst 42
  %24 = alloca [10 x i32]                                                          ; inst 43
  %25 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 0                    ; inst 44
  store i32 69, i32* %25                                                           ; inst 45
  %26 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 1                    ; inst 46
  store i32 70, i32* %26                                                           ; inst 47
  %27 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 2                    ; inst 48
  store i32 0, i32* %27                                                            ; inst 49
  %28 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 3                    ; inst 50
  store i32 0, i32* %28                                                            ; inst 51
  %29 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 4                    ; inst 52
  store i32 0, i32* %29                                                            ; inst 53
  %30 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 5                    ; inst 54
  store i32 0, i32* %30                                                            ; inst 55
  %31 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 6                    ; inst 56
  store i32 0, i32* %31                                                            ; inst 57
  %32 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 7                    ; inst 58
  store i32 0, i32* %32                                                            ; inst 59
  %33 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 8                    ; inst 60
  store i32 0, i32* %33                                                            ; inst 61
  %34 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i32 9                    ; inst 62
  store i32 0, i32* %34                                                            ; inst 63
  %35 = call i32 @naiveStringSearch([1000 x i32]* %0, i32 %1, [10 x i32]* %2, i32 2) ; inst 64
  %36 = call i32 @naiveStringSearch([1000 x i32]* %0, i32 %1, [10 x i32]* %13, i32 2) ; inst 65
  %37 = add i32 %35, %36                                                           ; inst 66
  %38 = call i32 @naiveStringSearch([1000 x i32]* %0, i32 %1, [10 x i32]* %24, i32 2) ; inst 67
  %39 = add i32 %37, %38                                                           ; inst 68
  ret i32 %39                                                                      ; inst 69
}

define void @testTextProcessingAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1603)                                                  ; inst 1
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
  call void @initializeLargeText([2000 x i32]* %0)                                 ; inst 12
  %6 = call i32 @characterFrequencyAnalysis([2000 x i32]* %0, i32 2000)            ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @textTransformationAlgorithms([2000 x i32]* %0, i32 2000)          ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @wordCountingAlgorithms([2000 x i32]* %0, i32 2000)                ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @textFilteringAlgorithms([2000 x i32]* %0, i32 2000)               ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  call void @printlnInt(i32 1604)                                                  ; inst 21
  ret void                                                                         ; inst 22
}

define void @initializeLargeText([2000 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [521, %_0.entry.0], [%9, %_14.if.exit.1]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%28, %_14.if.exit.1]                             ; inst 3
  %3 = icmp slt i32 %2, 2000                                                       ; inst 4
  br i1 %3, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 5
_2.while.body.0:
  %4 = mul i32 %1, 166                                                             ; inst 6
  %5 = add i32 %4, 194223                                                          ; inst 7
  %6 = srem i32 %5, 2147447                                                        ; inst 8
  %7 = icmp slt i32 %6, 0                                                          ; inst 9
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %8 = sub i32 0, %6                                                               ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %9 = phi i32 [%8, %_3.if.then.0], [%6, %_4.if.else.0]                            ; inst 14
  %10 = srem i32 %9, 100                                                           ; inst 15
  %11 = icmp slt i32 %10, 70                                                       ; inst 16
  br i1 %11, label %_6.if.then.1, label %_7.if.else.1                              ; inst 17
_6.if.then.1:
  %12 = sext i32 %2 to i64                                                         ; inst 18
  %13 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %12               ; inst 19
  %14 = srem i32 %9, 26                                                            ; inst 20
  %15 = add i32 97, %14                                                            ; inst 21
  store i32 %15, i32* %13                                                          ; inst 22
  br label %_14.if.exit.1                                                          ; inst 23
_7.if.else.1:
  %16 = icmp slt i32 %10, 85                                                       ; inst 24
  br i1 %16, label %_8.if.then.2, label %_9.if.else.2                              ; inst 25
_8.if.then.2:
  %17 = sext i32 %2 to i64                                                         ; inst 26
  %18 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %17               ; inst 27
  %19 = srem i32 %9, 26                                                            ; inst 28
  %20 = add i32 65, %19                                                            ; inst 29
  store i32 %20, i32* %18                                                          ; inst 30
  br label %_13.if.exit.2                                                          ; inst 31
_9.if.else.2:
  %21 = icmp slt i32 %10, 95                                                       ; inst 32
  br i1 %21, label %_10.if.then.3, label %_11.if.else.3                            ; inst 33
_10.if.then.3:
  %22 = sext i32 %2 to i64                                                         ; inst 34
  %23 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %22               ; inst 35
  store i32 32, i32* %23                                                           ; inst 36
  br label %_12.if.exit.3                                                          ; inst 37
_11.if.else.3:
  %24 = sext i32 %2 to i64                                                         ; inst 38
  %25 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %24               ; inst 39
  %26 = srem i32 %9, 15                                                            ; inst 40
  %27 = add i32 33, %26                                                            ; inst 41
  store i32 %27, i32* %25                                                          ; inst 42
  br label %_12.if.exit.3                                                          ; inst 43
_12.if.exit.3:
  br label %_13.if.exit.2                                                          ; inst 44
_13.if.exit.2:
  br label %_14.if.exit.1                                                          ; inst 45
_14.if.exit.1:
  %28 = add i32 %2, 1                                                              ; inst 46
  br label %_1.while.cond.0                                                        ; inst 47
_15.while.exit.0:
  ret void                                                                         ; inst 48
}

define i32 @characterFrequencyAnalysis([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [256 x i32]                                                          ; inst 1
  %3 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 256                                                        ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%31, %_11.if.exit.0]                        ; inst 12
  %9 = icmp slt i32 %8, %1                                                         ; inst 13
  br i1 %9, label %_5.while.body.0, label %_12.while.exit.0                        ; inst 14
_5.while.body.0:
  %10 = sext i32 %8 to i64                                                         ; inst 15
  %11 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %10               ; inst 16
  %12 = load i32, i32* %11                                                         ; inst 17
  %13 = icmp sge i32 %12, 0                                                        ; inst 18
  br i1 %13, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 19
_6.lazy.then.0:
  %14 = sext i32 %8 to i64                                                         ; inst 20
  %15 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %14               ; inst 21
  %16 = load i32, i32* %15                                                         ; inst 22
  %17 = icmp slt i32 %16, 256                                                      ; inst 23
  br label %_8.lazy.exit.0                                                         ; inst 24
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 25
_8.lazy.exit.0:
  %18 = phi i1 [%17, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 26
  br i1 %18, label %_9.if.then.0, label %_10.if.else.0                             ; inst 27
_9.if.then.0:
  %19 = sext i32 %8 to i64                                                         ; inst 28
  %20 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %19               ; inst 29
  %21 = load i32, i32* %20                                                         ; inst 30
  %22 = sext i32 %21 to i64                                                        ; inst 31
  %23 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %22                 ; inst 32
  %24 = sext i32 %8 to i64                                                         ; inst 33
  %25 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %24               ; inst 34
  %26 = load i32, i32* %25                                                         ; inst 35
  %27 = sext i32 %26 to i64                                                        ; inst 36
  %28 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %27                 ; inst 37
  %29 = load i32, i32* %28                                                         ; inst 38
  %30 = add i32 %29, 1                                                             ; inst 39
  store i32 %30, i32* %23                                                          ; inst 40
  br label %_11.if.exit.0                                                          ; inst 41
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 42
_11.if.exit.0:
  %31 = add i32 %8, 1                                                              ; inst 43
  br label %_4.while.cond.0                                                        ; inst 44
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 45
_13.while.cond.1:
  %32 = phi i32 [0, %_12.while.exit.0], [%45, %_17.if.exit.1]                      ; inst 46
  %33 = phi i32 [0, %_12.while.exit.0], [%43, %_17.if.exit.1]                      ; inst 47
  %34 = phi i32 [0, %_12.while.exit.0], [%44, %_17.if.exit.1]                      ; inst 48
  %35 = icmp slt i32 %32, 256                                                      ; inst 49
  br i1 %35, label %_14.while.body.1, label %_18.while.exit.1                      ; inst 50
_14.while.body.1:
  %36 = sext i32 %32 to i64                                                        ; inst 51
  %37 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %36                 ; inst 52
  %38 = load i32, i32* %37                                                         ; inst 53
  %39 = icmp sgt i32 %38, %34                                                      ; inst 54
  br i1 %39, label %_15.if.then.1, label %_16.if.else.1                            ; inst 55
_15.if.then.1:
  %40 = sext i32 %32 to i64                                                        ; inst 56
  %41 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %40                 ; inst 57
  %42 = load i32, i32* %41                                                         ; inst 58
  br label %_17.if.exit.1                                                          ; inst 59
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 60
_17.if.exit.1:
  %43 = phi i32 [%32, %_15.if.then.1], [%33, %_16.if.else.1]                       ; inst 61
  %44 = phi i32 [%42, %_15.if.then.1], [%34, %_16.if.else.1]                       ; inst 62
  %45 = add i32 %32, 1                                                             ; inst 63
  br label %_13.while.cond.1                                                       ; inst 64
_18.while.exit.1:
  %46 = add i32 %33, %34                                                           ; inst 65
  ret i32 %46                                                                      ; inst 66
}

define i32 @textTransformationAlgorithms([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%22, %_8.if.exit.0]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.0]                              ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp sge i32 %7, 97                                                         ; inst 9
  br i1 %8, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 10
_3.lazy.then.0:
  %9 = sext i32 %2 to i64                                                          ; inst 11
  %10 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %9                ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = icmp sle i32 %11, 122                                                      ; inst 14
  br label %_5.lazy.exit.0                                                         ; inst 15
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 16
_5.lazy.exit.0:
  %13 = phi i1 [%12, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 17
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 18
_6.if.then.0:
  %14 = sext i32 %2 to i64                                                         ; inst 19
  %15 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %14               ; inst 20
  %16 = sext i32 %2 to i64                                                         ; inst 21
  %17 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %16               ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = sub i32 %18, 32                                                            ; inst 24
  store i32 %19, i32* %15                                                          ; inst 25
  %20 = add i32 %3, 1                                                              ; inst 26
  br label %_8.if.exit.0                                                           ; inst 27
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 28
_8.if.exit.0:
  %21 = phi i32 [%20, %_6.if.then.0], [%3, %_7.if.else.0]                          ; inst 29
  %22 = add i32 %2, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 32
_10.while.cond.1:
  %23 = phi i32 [0, %_9.while.exit.0], [%46, %_17.if.exit.1]                       ; inst 33
  %24 = phi i32 [%3, %_9.while.exit.0], [%45, %_17.if.exit.1]                      ; inst 34
  %25 = icmp slt i32 %23, %1                                                       ; inst 35
  br i1 %25, label %_11.while.body.1, label %_18.while.exit.1                      ; inst 36
_11.while.body.1:
  %26 = sext i32 %23 to i64                                                        ; inst 37
  %27 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %26               ; inst 38
  %28 = load i32, i32* %27                                                         ; inst 39
  %29 = icmp sge i32 %28, 65                                                       ; inst 40
  br i1 %29, label %_12.lazy.then.1, label %_13.lazy.else.1                        ; inst 41
_12.lazy.then.1:
  %30 = sext i32 %23 to i64                                                        ; inst 42
  %31 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %30               ; inst 43
  %32 = load i32, i32* %31                                                         ; inst 44
  %33 = icmp sle i32 %32, 90                                                       ; inst 45
  br label %_14.lazy.exit.1                                                        ; inst 46
_13.lazy.else.1:
  br label %_14.lazy.exit.1                                                        ; inst 47
_14.lazy.exit.1:
  %34 = phi i1 [%33, %_12.lazy.then.1], [0, %_13.lazy.else.1]                      ; inst 48
  br i1 %34, label %_15.if.then.1, label %_16.if.else.1                            ; inst 49
_15.if.then.1:
  %35 = sext i32 %23 to i64                                                        ; inst 50
  %36 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %35               ; inst 51
  %37 = sext i32 %23 to i64                                                        ; inst 52
  %38 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %37               ; inst 53
  %39 = load i32, i32* %38                                                         ; inst 54
  %40 = sub i32 %39, 65                                                            ; inst 55
  %41 = add i32 %40, 3                                                             ; inst 56
  %42 = srem i32 %41, 26                                                           ; inst 57
  %43 = add i32 65, %42                                                            ; inst 58
  store i32 %43, i32* %36                                                          ; inst 59
  %44 = add i32 %24, 1                                                             ; inst 60
  br label %_17.if.exit.1                                                          ; inst 61
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 62
_17.if.exit.1:
  %45 = phi i32 [%44, %_15.if.then.1], [%24, %_16.if.else.1]                       ; inst 63
  %46 = add i32 %23, 1                                                             ; inst 64
  br label %_10.while.cond.1                                                       ; inst 65
_18.while.exit.1:
  br label %_19.while.cond.2                                                       ; inst 66
_19.while.cond.2:
  %47 = phi i32 [0, %_18.while.exit.1], [%70, %_26.if.exit.2]                      ; inst 67
  %48 = phi i32 [%24, %_18.while.exit.1], [%69, %_26.if.exit.2]                    ; inst 68
  %49 = icmp slt i32 %47, %1                                                       ; inst 69
  br i1 %49, label %_20.while.body.2, label %_27.while.exit.2                      ; inst 70
_20.while.body.2:
  %50 = sext i32 %47 to i64                                                        ; inst 71
  %51 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %50               ; inst 72
  %52 = load i32, i32* %51                                                         ; inst 73
  %53 = icmp sge i32 %52, 65                                                       ; inst 74
  br i1 %53, label %_21.lazy.then.2, label %_22.lazy.else.2                        ; inst 75
_21.lazy.then.2:
  %54 = sext i32 %47 to i64                                                        ; inst 76
  %55 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %54               ; inst 77
  %56 = load i32, i32* %55                                                         ; inst 78
  %57 = icmp sle i32 %56, 90                                                       ; inst 79
  br label %_23.lazy.exit.2                                                        ; inst 80
_22.lazy.else.2:
  br label %_23.lazy.exit.2                                                        ; inst 81
_23.lazy.exit.2:
  %58 = phi i1 [%57, %_21.lazy.then.2], [0, %_22.lazy.else.2]                      ; inst 82
  br i1 %58, label %_24.if.then.2, label %_25.if.else.2                            ; inst 83
_24.if.then.2:
  %59 = sext i32 %47 to i64                                                        ; inst 84
  %60 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %59               ; inst 85
  %61 = sext i32 %47 to i64                                                        ; inst 86
  %62 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %61               ; inst 87
  %63 = load i32, i32* %62                                                         ; inst 88
  %64 = sub i32 %63, 65                                                            ; inst 89
  %65 = add i32 %64, 13                                                            ; inst 90
  %66 = srem i32 %65, 26                                                           ; inst 91
  %67 = add i32 65, %66                                                            ; inst 92
  store i32 %67, i32* %60                                                          ; inst 93
  %68 = add i32 %48, 1                                                             ; inst 94
  br label %_26.if.exit.2                                                          ; inst 95
_25.if.else.2:
  br label %_26.if.exit.2                                                          ; inst 96
_26.if.exit.2:
  %69 = phi i32 [%68, %_24.if.then.2], [%48, %_25.if.else.2]                       ; inst 97
  %70 = add i32 %47, 1                                                             ; inst 98
  br label %_19.while.cond.2                                                       ; inst 99
_27.while.exit.2:
  ret i32 %48                                                                      ; inst 100
}

define i32 @wordCountingAlgorithms([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%26, %_14.if.exit.0]                             ; inst 2
  %3 = phi i1 [0, %_0.entry.0], [%24, %_14.if.exit.0]                              ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%25, %_14.if.exit.0]                             ; inst 4
  %5 = icmp slt i32 %2, %1                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %6                 ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp eq i32 %8, 32                                                          ; inst 10
  br i1 %9, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 11
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 12
_4.lazy.else.0:
  %10 = sext i32 %2 to i64                                                         ; inst 13
  %11 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %10               ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = icmp eq i32 %12, 9                                                         ; inst 16
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %14 = phi i1 [1, %_3.lazy.then.0], [%13, %_4.lazy.else.0]                        ; inst 18
  br i1 %14, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 19
_6.lazy.then.1:
  br label %_8.lazy.exit.1                                                         ; inst 20
_7.lazy.else.1:
  %15 = sext i32 %2 to i64                                                         ; inst 21
  %16 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %15               ; inst 22
  %17 = load i32, i32* %16                                                         ; inst 23
  %18 = icmp eq i32 %17, 10                                                        ; inst 24
  br label %_8.lazy.exit.1                                                         ; inst 25
_8.lazy.exit.1:
  %19 = phi i1 [1, %_6.lazy.then.1], [%18, %_7.lazy.else.1]                        ; inst 26
  br i1 %19, label %_9.if.then.0, label %_10.if.else.0                             ; inst 27
_9.if.then.0:
  br label %_14.if.exit.0                                                          ; inst 28
_10.if.else.0:
  %20 = icmp eq i1 %3, 0                                                           ; inst 29
  br i1 %20, label %_11.if.then.1, label %_12.if.else.1                            ; inst 30
_11.if.then.1:
  %21 = add i32 %4, 1                                                              ; inst 31
  br label %_13.if.exit.1                                                          ; inst 32
_12.if.else.1:
  br label %_13.if.exit.1                                                          ; inst 33
_13.if.exit.1:
  %22 = phi i1 [1, %_11.if.then.1], [%3, %_12.if.else.1]                           ; inst 34
  %23 = phi i32 [%21, %_11.if.then.1], [%4, %_12.if.else.1]                        ; inst 35
  br label %_14.if.exit.0                                                          ; inst 36
_14.if.exit.0:
  %24 = phi i1 [0, %_9.if.then.0], [%22, %_13.if.exit.1]                           ; inst 37
  %25 = phi i32 [%4, %_9.if.then.0], [%23, %_13.if.exit.1]                         ; inst 38
  %26 = add i32 %2, 1                                                              ; inst 39
  br label %_1.while.cond.0                                                        ; inst 40
_15.while.exit.0:
  br label %_16.while.cond.1                                                       ; inst 41
_16.while.cond.1:
  %27 = phi i32 [0, %_15.while.exit.0], [%65, %_35.if.exit.2]                      ; inst 42
  %28 = phi i32 [0, %_15.while.exit.0], [%66, %_35.if.exit.2]                      ; inst 43
  %29 = sub i32 %1, 2                                                              ; inst 44
  %30 = icmp slt i32 %28, %29                                                      ; inst 45
  br i1 %30, label %_17.while.body.1, label %_36.while.exit.1                      ; inst 46
_17.while.body.1:
  %31 = sext i32 %28 to i64                                                        ; inst 47
  %32 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %31               ; inst 48
  %33 = load i32, i32* %32                                                         ; inst 49
  %34 = icmp eq i32 %33, 84                                                        ; inst 50
  br i1 %34, label %_18.lazy.then.2, label %_19.lazy.else.2                        ; inst 51
_18.lazy.then.2:
  br label %_20.lazy.exit.2                                                        ; inst 52
_19.lazy.else.2:
  %35 = sext i32 %28 to i64                                                        ; inst 53
  %36 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %35               ; inst 54
  %37 = load i32, i32* %36                                                         ; inst 55
  %38 = icmp eq i32 %37, 116                                                       ; inst 56
  br label %_20.lazy.exit.2                                                        ; inst 57
_20.lazy.exit.2:
  %39 = phi i1 [1, %_18.lazy.then.2], [%38, %_19.lazy.else.2]                      ; inst 58
  br i1 %39, label %_21.lazy.then.3, label %_25.lazy.else.3                        ; inst 59
_21.lazy.then.3:
  %40 = sext i32 %28 to i64                                                        ; inst 60
  %41 = add i64 %40, 1                                                             ; inst 61
  %42 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %41               ; inst 62
  %43 = load i32, i32* %42                                                         ; inst 63
  %44 = icmp eq i32 %43, 72                                                        ; inst 64
  br i1 %44, label %_22.lazy.then.4, label %_23.lazy.else.4                        ; inst 65
_22.lazy.then.4:
  br label %_24.lazy.exit.4                                                        ; inst 66
_23.lazy.else.4:
  %45 = sext i32 %28 to i64                                                        ; inst 67
  %46 = add i64 %45, 1                                                             ; inst 68
  %47 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %46               ; inst 69
  %48 = load i32, i32* %47                                                         ; inst 70
  %49 = icmp eq i32 %48, 104                                                       ; inst 71
  br label %_24.lazy.exit.4                                                        ; inst 72
_24.lazy.exit.4:
  %50 = phi i1 [1, %_22.lazy.then.4], [%49, %_23.lazy.else.4]                      ; inst 73
  br label %_26.lazy.exit.3                                                        ; inst 74
_25.lazy.else.3:
  br label %_26.lazy.exit.3                                                        ; inst 75
_26.lazy.exit.3:
  %51 = phi i1 [%50, %_24.lazy.exit.4], [0, %_25.lazy.else.3]                      ; inst 76
  br i1 %51, label %_27.lazy.then.5, label %_31.lazy.else.5                        ; inst 77
_27.lazy.then.5:
  %52 = sext i32 %28 to i64                                                        ; inst 78
  %53 = add i64 %52, 2                                                             ; inst 79
  %54 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %53               ; inst 80
  %55 = load i32, i32* %54                                                         ; inst 81
  %56 = icmp eq i32 %55, 69                                                        ; inst 82
  br i1 %56, label %_28.lazy.then.6, label %_29.lazy.else.6                        ; inst 83
_28.lazy.then.6:
  br label %_30.lazy.exit.6                                                        ; inst 84
_29.lazy.else.6:
  %57 = sext i32 %28 to i64                                                        ; inst 85
  %58 = add i64 %57, 2                                                             ; inst 86
  %59 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %58               ; inst 87
  %60 = load i32, i32* %59                                                         ; inst 88
  %61 = icmp eq i32 %60, 101                                                       ; inst 89
  br label %_30.lazy.exit.6                                                        ; inst 90
_30.lazy.exit.6:
  %62 = phi i1 [1, %_28.lazy.then.6], [%61, %_29.lazy.else.6]                      ; inst 91
  br label %_32.lazy.exit.5                                                        ; inst 92
_31.lazy.else.5:
  br label %_32.lazy.exit.5                                                        ; inst 93
_32.lazy.exit.5:
  %63 = phi i1 [%62, %_30.lazy.exit.6], [0, %_31.lazy.else.5]                      ; inst 94
  br i1 %63, label %_33.if.then.2, label %_34.if.else.2                            ; inst 95
_33.if.then.2:
  %64 = add i32 %27, 1                                                             ; inst 96
  br label %_35.if.exit.2                                                          ; inst 97
_34.if.else.2:
  br label %_35.if.exit.2                                                          ; inst 98
_35.if.exit.2:
  %65 = phi i32 [%64, %_33.if.then.2], [%27, %_34.if.else.2]                       ; inst 99
  %66 = add i32 %28, 1                                                             ; inst 100
  br label %_16.while.cond.1                                                       ; inst 101
_36.while.exit.1:
  %67 = add i32 %4, %27                                                            ; inst 102
  ret i32 %67                                                                      ; inst 103
}

define i32 @textFilteringAlgorithms([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%18, %_8.if.exit.0]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%17, %_8.if.exit.0]                              ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp slt i32 %7, 32                                                         ; inst 9
  br i1 %8, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 10
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 11
_4.lazy.else.0:
  %9 = sext i32 %2 to i64                                                          ; inst 12
  %10 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %9                ; inst 13
  %11 = load i32, i32* %10                                                         ; inst 14
  %12 = icmp sgt i32 %11, 126                                                      ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_5.lazy.exit.0:
  %13 = phi i1 [1, %_3.lazy.then.0], [%12, %_4.lazy.else.0]                        ; inst 17
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 18
_6.if.then.0:
  %14 = sext i32 %2 to i64                                                         ; inst 19
  %15 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %14               ; inst 20
  store i32 32, i32* %15                                                           ; inst 21
  %16 = add i32 %3, 1                                                              ; inst 22
  br label %_8.if.exit.0                                                           ; inst 23
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 24
_8.if.exit.0:
  %17 = phi i32 [%16, %_6.if.then.0], [%3, %_7.if.else.0]                          ; inst 25
  %18 = add i32 %2, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 28
_10.while.cond.1:
  %19 = phi i32 [0, %_9.while.exit.0], [%49, %_20.if.exit.1]                       ; inst 29
  %20 = phi i32 [%3, %_9.while.exit.0], [%50, %_20.if.exit.1]                      ; inst 30
  %21 = sub i32 %1, 1                                                              ; inst 31
  %22 = icmp slt i32 %19, %21                                                      ; inst 32
  br i1 %22, label %_11.while.body.1, label %_21.while.exit.1                      ; inst 33
_11.while.body.1:
  %23 = sext i32 %19 to i64                                                        ; inst 34
  %24 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %23               ; inst 35
  %25 = load i32, i32* %24                                                         ; inst 36
  %26 = icmp eq i32 %25, 32                                                        ; inst 37
  br i1 %26, label %_12.lazy.then.1, label %_13.lazy.else.1                        ; inst 38
_12.lazy.then.1:
  %27 = sext i32 %19 to i64                                                        ; inst 39
  %28 = add i64 %27, 1                                                             ; inst 40
  %29 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %28               ; inst 41
  %30 = load i32, i32* %29                                                         ; inst 42
  %31 = icmp eq i32 %30, 32                                                        ; inst 43
  br label %_14.lazy.exit.1                                                        ; inst 44
_13.lazy.else.1:
  br label %_14.lazy.exit.1                                                        ; inst 45
_14.lazy.exit.1:
  %32 = phi i1 [%31, %_12.lazy.then.1], [0, %_13.lazy.else.1]                      ; inst 46
  br i1 %32, label %_15.if.then.1, label %_19.if.else.1                            ; inst 47
_15.if.then.1:
  %33 = add i32 %19, 1                                                             ; inst 48
  br label %_16.while.cond.2                                                       ; inst 49
_16.while.cond.2:
  %34 = phi i32 [%33, %_15.if.then.1], [%43, %_17.while.body.2]                    ; inst 50
  %35 = sub i32 %1, 1                                                              ; inst 51
  %36 = icmp slt i32 %34, %35                                                      ; inst 52
  br i1 %36, label %_17.while.body.2, label %_18.while.exit.2                      ; inst 53
_17.while.body.2:
  %37 = sext i32 %34 to i64                                                        ; inst 54
  %38 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %37               ; inst 55
  %39 = sext i32 %34 to i64                                                        ; inst 56
  %40 = add i64 %39, 1                                                             ; inst 57
  %41 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %40               ; inst 58
  %42 = load i32, i32* %41                                                         ; inst 59
  store i32 %42, i32* %38                                                          ; inst 60
  %43 = add i32 %34, 1                                                             ; inst 61
  br label %_16.while.cond.2                                                       ; inst 62
_18.while.exit.2:
  %44 = sext i32 %1 to i64                                                         ; inst 63
  %45 = sub i64 %44, 1                                                             ; inst 64
  %46 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %45               ; inst 65
  store i32 0, i32* %46                                                            ; inst 66
  %47 = add i32 %20, 1                                                             ; inst 67
  br label %_20.if.exit.1                                                          ; inst 68
_19.if.else.1:
  %48 = add i32 %19, 1                                                             ; inst 69
  br label %_20.if.exit.1                                                          ; inst 70
_20.if.exit.1:
  %49 = phi i32 [%19, %_18.while.exit.2], [%48, %_19.if.else.1]                    ; inst 71
  %50 = phi i32 [%47, %_18.while.exit.2], [%20, %_19.if.else.1]                    ; inst 72
  br label %_10.while.cond.1                                                       ; inst 73
_21.while.exit.1:
  ret i32 %20                                                                      ; inst 74
}

define void @testStringParsingAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1605)                                                  ; inst 1
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
  call void @initializeParsingText([1000 x i32]* %0)                               ; inst 12
  %6 = call i32 @parseNumbersFromText([1000 x i32]* %0, i32 1000)                  ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @parseCSVLikeData([1000 x i32]* %0, i32 1000)                      ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @tokenizeText([1000 x i32]* %0, i32 1000)                          ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @parseSimpleExpressions([1000 x i32]* %0, i32 1000)                ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  call void @printlnInt(i32 1606)                                                  ; inst 21
  ret void                                                                         ; inst 22
}

define void @initializeParsingText([1000 x i32]* %0) {
_0.entry.0:
  %1 = alloca [50 x i32]                                                           ; inst 1
  %2 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 0                      ; inst 2
  store i32 49, i32* %2                                                            ; inst 3
  %3 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 1                      ; inst 4
  store i32 50, i32* %3                                                            ; inst 5
  %4 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 2                      ; inst 6
  store i32 51, i32* %4                                                            ; inst 7
  %5 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 3                      ; inst 8
  store i32 44, i32* %5                                                            ; inst 9
  %6 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 4                      ; inst 10
  store i32 52, i32* %6                                                            ; inst 11
  %7 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 5                      ; inst 12
  store i32 53, i32* %7                                                            ; inst 13
  %8 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 6                      ; inst 14
  store i32 54, i32* %8                                                            ; inst 15
  %9 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 7                      ; inst 16
  store i32 44, i32* %9                                                            ; inst 17
  %10 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 8                     ; inst 18
  store i32 55, i32* %10                                                           ; inst 19
  %11 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 9                     ; inst 20
  store i32 56, i32* %11                                                           ; inst 21
  %12 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 10                    ; inst 22
  store i32 57, i32* %12                                                           ; inst 23
  %13 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 11                    ; inst 24
  store i32 32, i32* %13                                                           ; inst 25
  %14 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 12                    ; inst 26
  store i32 43, i32* %14                                                           ; inst 27
  %15 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 13                    ; inst 28
  store i32 32, i32* %15                                                           ; inst 29
  %16 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 14                    ; inst 30
  store i32 49, i32* %16                                                           ; inst 31
  %17 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 15                    ; inst 32
  store i32 50, i32* %17                                                           ; inst 33
  %18 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 16                    ; inst 34
  store i32 51, i32* %18                                                           ; inst 35
  %19 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 17                    ; inst 36
  store i32 32, i32* %19                                                           ; inst 37
  %20 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 18                    ; inst 38
  store i32 45, i32* %20                                                           ; inst 39
  %21 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 19                    ; inst 40
  store i32 32, i32* %21                                                           ; inst 41
  %22 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 20                    ; inst 42
  store i32 52, i32* %22                                                           ; inst 43
  %23 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 21                    ; inst 44
  store i32 53, i32* %23                                                           ; inst 45
  %24 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 22                    ; inst 46
  store i32 54, i32* %24                                                           ; inst 47
  %25 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 23                    ; inst 48
  store i32 32, i32* %25                                                           ; inst 49
  %26 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 24                    ; inst 50
  store i32 42, i32* %26                                                           ; inst 51
  %27 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 25                    ; inst 52
  store i32 32, i32* %27                                                           ; inst 53
  %28 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 26                    ; inst 54
  store i32 55, i32* %28                                                           ; inst 55
  %29 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 27                    ; inst 56
  store i32 56, i32* %29                                                           ; inst 57
  %30 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 28                    ; inst 58
  store i32 32, i32* %30                                                           ; inst 59
  %31 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 29                    ; inst 60
  store i32 47, i32* %31                                                           ; inst 61
  %32 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 30                    ; inst 62
  store i32 32, i32* %32                                                           ; inst 63
  %33 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 31                    ; inst 64
  store i32 57, i32* %33                                                           ; inst 65
  %34 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 32                    ; inst 66
  store i32 32, i32* %34                                                           ; inst 67
  %35 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 33                    ; inst 68
  store i32 61, i32* %35                                                           ; inst 69
  %36 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 34                    ; inst 70
  store i32 32, i32* %36                                                           ; inst 71
  %37 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 35                    ; inst 72
  store i32 49, i32* %37                                                           ; inst 73
  %38 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 36                    ; inst 74
  store i32 48, i32* %38                                                           ; inst 75
  %39 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 37                    ; inst 76
  store i32 48, i32* %39                                                           ; inst 77
  %40 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 38                    ; inst 78
  store i32 0, i32* %40                                                            ; inst 79
  %41 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 39                    ; inst 80
  store i32 0, i32* %41                                                            ; inst 81
  %42 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 40                    ; inst 82
  store i32 0, i32* %42                                                            ; inst 83
  %43 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 41                    ; inst 84
  store i32 0, i32* %43                                                            ; inst 85
  %44 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 42                    ; inst 86
  store i32 0, i32* %44                                                            ; inst 87
  %45 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 43                    ; inst 88
  store i32 0, i32* %45                                                            ; inst 89
  %46 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 44                    ; inst 90
  store i32 0, i32* %46                                                            ; inst 91
  %47 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 45                    ; inst 92
  store i32 0, i32* %47                                                            ; inst 93
  %48 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 46                    ; inst 94
  store i32 0, i32* %48                                                            ; inst 95
  %49 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 47                    ; inst 96
  store i32 0, i32* %49                                                            ; inst 97
  %50 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 48                    ; inst 98
  store i32 0, i32* %50                                                            ; inst 99
  %51 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 49                    ; inst 100
  store i32 0, i32* %51                                                            ; inst 101
  br label %_1.while.cond.0                                                        ; inst 102
_1.while.cond.0:
  %52 = phi i32 [0, %_0.entry.0], [%61, %_5.while.body.0]                          ; inst 103
  %53 = icmp slt i32 %52, 50                                                       ; inst 104
  br i1 %53, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 105
_2.lazy.then.0:
  %54 = icmp slt i32 %52, 1000                                                     ; inst 106
  br label %_4.lazy.exit.0                                                         ; inst 107
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 108
_4.lazy.exit.0:
  %55 = phi i1 [%54, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 109
  br i1 %55, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 110
_5.while.body.0:
  %56 = sext i32 %52 to i64                                                        ; inst 111
  %57 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %56               ; inst 112
  %58 = sext i32 %52 to i64                                                        ; inst 113
  %59 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %58                   ; inst 114
  %60 = load i32, i32* %59                                                         ; inst 115
  store i32 %60, i32* %57                                                          ; inst 116
  %61 = add i32 %52, 1                                                             ; inst 117
  br label %_1.while.cond.0                                                        ; inst 118
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 119
_7.while.cond.1:
  %62 = phi i32 [%52, %_6.while.exit.0], [%92, %_23.if.exit.1]                     ; inst 120
  %63 = phi i32 [99, %_6.while.exit.0], [%70, %_23.if.exit.1]                      ; inst 121
  %64 = icmp slt i32 %62, 1000                                                     ; inst 122
  br i1 %64, label %_8.while.body.1, label %_24.while.exit.1                       ; inst 123
_8.while.body.1:
  %65 = mul i32 %63, 525                                                           ; inst 124
  %66 = add i32 %65, 54223                                                         ; inst 125
  %67 = srem i32 %66, 483647                                                       ; inst 126
  %68 = icmp slt i32 %67, 0                                                        ; inst 127
  br i1 %68, label %_9.if.then.0, label %_10.if.else.0                             ; inst 128
_9.if.then.0:
  %69 = sub i32 0, %67                                                             ; inst 129
  br label %_11.if.exit.0                                                          ; inst 130
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 131
_11.if.exit.0:
  %70 = phi i32 [%69, %_9.if.then.0], [%67, %_10.if.else.0]                        ; inst 132
  %71 = srem i32 %70, 100                                                          ; inst 133
  %72 = icmp slt i32 %71, 40                                                       ; inst 134
  br i1 %72, label %_12.if.then.1, label %_13.if.else.1                            ; inst 135
_12.if.then.1:
  %73 = sext i32 %62 to i64                                                        ; inst 136
  %74 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %73               ; inst 137
  %75 = srem i32 %70, 10                                                           ; inst 138
  %76 = add i32 48, %75                                                            ; inst 139
  store i32 %76, i32* %74                                                          ; inst 140
  br label %_23.if.exit.1                                                          ; inst 141
_13.if.else.1:
  %77 = icmp slt i32 %71, 50                                                       ; inst 142
  br i1 %77, label %_14.if.then.2, label %_15.if.else.2                            ; inst 143
_14.if.then.2:
  %78 = sext i32 %62 to i64                                                        ; inst 144
  %79 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %78               ; inst 145
  store i32 44, i32* %79                                                           ; inst 146
  br label %_22.if.exit.2                                                          ; inst 147
_15.if.else.2:
  %80 = icmp slt i32 %71, 60                                                       ; inst 148
  br i1 %80, label %_16.if.then.3, label %_17.if.else.3                            ; inst 149
_16.if.then.3:
  %81 = sext i32 %62 to i64                                                        ; inst 150
  %82 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %81               ; inst 151
  store i32 32, i32* %82                                                           ; inst 152
  br label %_21.if.exit.3                                                          ; inst 153
_17.if.else.3:
  %83 = icmp slt i32 %71, 70                                                       ; inst 154
  br i1 %83, label %_18.if.then.4, label %_19.if.else.4                            ; inst 155
_18.if.then.4:
  %84 = sext i32 %62 to i64                                                        ; inst 156
  %85 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %84               ; inst 157
  %86 = srem i32 %70, 4                                                            ; inst 158
  %87 = add i32 43, %86                                                            ; inst 159
  store i32 %87, i32* %85                                                          ; inst 160
  br label %_20.if.exit.4                                                          ; inst 161
_19.if.else.4:
  %88 = sext i32 %62 to i64                                                        ; inst 162
  %89 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %88               ; inst 163
  %90 = srem i32 %70, 26                                                           ; inst 164
  %91 = add i32 97, %90                                                            ; inst 165
  store i32 %91, i32* %89                                                          ; inst 166
  br label %_20.if.exit.4                                                          ; inst 167
_20.if.exit.4:
  br label %_21.if.exit.3                                                          ; inst 168
_21.if.exit.3:
  br label %_22.if.exit.2                                                          ; inst 169
_22.if.exit.2:
  br label %_23.if.exit.1                                                          ; inst 170
_23.if.exit.1:
  %92 = add i32 %62, 1                                                             ; inst 171
  br label %_7.while.cond.1                                                        ; inst 172
_24.while.exit.1:
  ret void                                                                         ; inst 173
}

define i32 @parseNumbersFromText([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%22, %_14.if.exit.0]                             ; inst 2
  %3 = phi i1 [0, %_0.entry.0], [%20, %_14.if.exit.0]                              ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%21, %_14.if.exit.0]                             ; inst 4
  %5 = icmp slt i32 %2, %1                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %6                 ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp sge i32 %8, 48                                                         ; inst 10
  br i1 %9, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 11
_3.lazy.then.0:
  %10 = sext i32 %2 to i64                                                         ; inst 12
  %11 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %10               ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = icmp sle i32 %12, 57                                                       ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %14 = phi i1 [%13, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 18
  br i1 %14, label %_6.if.then.0, label %_10.if.else.0                             ; inst 19
_6.if.then.0:
  %15 = icmp eq i1 %3, 0                                                           ; inst 20
  br i1 %15, label %_7.if.then.1, label %_8.if.else.1                              ; inst 21
_7.if.then.1:
  br label %_9.if.exit.1                                                           ; inst 22
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 23
_9.if.exit.1:
  %16 = phi i1 [1, %_7.if.then.1], [%3, %_8.if.else.1]                             ; inst 24
  br label %_14.if.exit.0                                                          ; inst 25
_10.if.else.0:
  br i1 %3, label %_11.if.then.2, label %_12.if.else.2                             ; inst 26
_11.if.then.2:
  %17 = add i32 %4, 1                                                              ; inst 27
  br label %_13.if.exit.2                                                          ; inst 28
_12.if.else.2:
  br label %_13.if.exit.2                                                          ; inst 29
_13.if.exit.2:
  %18 = phi i1 [0, %_11.if.then.2], [%3, %_12.if.else.2]                           ; inst 30
  %19 = phi i32 [%17, %_11.if.then.2], [%4, %_12.if.else.2]                        ; inst 31
  br label %_14.if.exit.0                                                          ; inst 32
_14.if.exit.0:
  %20 = phi i1 [%16, %_9.if.exit.1], [%18, %_13.if.exit.2]                         ; inst 33
  %21 = phi i32 [%4, %_9.if.exit.1], [%19, %_13.if.exit.2]                         ; inst 34
  %22 = add i32 %2, 1                                                              ; inst 35
  br label %_1.while.cond.0                                                        ; inst 36
_15.while.exit.0:
  br i1 %3, label %_16.if.then.3, label %_17.if.else.3                             ; inst 37
_16.if.then.3:
  %23 = add i32 %4, 1                                                              ; inst 38
  br label %_18.if.exit.3                                                          ; inst 39
_17.if.else.3:
  br label %_18.if.exit.3                                                          ; inst 40
_18.if.exit.3:
  %24 = phi i32 [%23, %_16.if.then.3], [%4, %_17.if.else.3]                        ; inst 41
  ret i32 %24                                                                      ; inst 42
}

define i32 @parseCSVLikeData([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%37, %_23.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%38, %_23.if.exit.0]                             ; inst 3
  %4 = phi i1 [0, %_0.entry.0], [%39, %_23.if.exit.0]                              ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%40, %_23.if.exit.0]                             ; inst 5
  %6 = icmp slt i32 %5, %1                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_24.while.exit.0                        ; inst 7
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 8
  %8 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %7                 ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = icmp eq i32 %9, 44                                                         ; inst 11
  br i1 %10, label %_3.if.then.0, label %_7.if.else.0                              ; inst 12
_3.if.then.0:
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 13
_4.if.then.1:
  %11 = add i32 %2, 1                                                              ; inst 14
  br label %_6.if.exit.1                                                           ; inst 15
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 16
_6.if.exit.1:
  %12 = phi i32 [%11, %_4.if.then.1], [%2, %_5.if.else.1]                          ; inst 17
  %13 = phi i1 [0, %_4.if.then.1], [%4, %_5.if.else.1]                             ; inst 18
  br label %_23.if.exit.0                                                          ; inst 19
_7.if.else.0:
  %14 = sext i32 %5 to i64                                                         ; inst 20
  %15 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %14               ; inst 21
  %16 = load i32, i32* %15                                                         ; inst 22
  %17 = icmp eq i32 %16, 10                                                        ; inst 23
  br i1 %17, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 24
_8.lazy.then.0:
  br label %_10.lazy.exit.0                                                        ; inst 25
_9.lazy.else.0:
  %18 = sext i32 %5 to i64                                                         ; inst 26
  %19 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %18               ; inst 27
  %20 = load i32, i32* %19                                                         ; inst 28
  %21 = icmp eq i32 %20, 13                                                        ; inst 29
  br label %_10.lazy.exit.0                                                        ; inst 30
_10.lazy.exit.0:
  %22 = phi i1 [1, %_8.lazy.then.0], [%21, %_9.lazy.else.0]                        ; inst 31
  br i1 %22, label %_11.if.then.2, label %_15.if.else.2                            ; inst 32
_11.if.then.2:
  br i1 %4, label %_12.if.then.3, label %_13.if.else.3                             ; inst 33
_12.if.then.3:
  %23 = add i32 %2, 1                                                              ; inst 34
  br label %_14.if.exit.3                                                          ; inst 35
_13.if.else.3:
  br label %_14.if.exit.3                                                          ; inst 36
_14.if.exit.3:
  %24 = phi i32 [%23, %_12.if.then.3], [%2, %_13.if.else.3]                        ; inst 37
  %25 = phi i1 [0, %_12.if.then.3], [%4, %_13.if.else.3]                           ; inst 38
  %26 = add i32 %3, 1                                                              ; inst 39
  br label %_22.if.exit.2                                                          ; inst 40
_15.if.else.2:
  %27 = sext i32 %5 to i64                                                         ; inst 41
  %28 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %27               ; inst 42
  %29 = load i32, i32* %28                                                         ; inst 43
  %30 = icmp ne i32 %29, 32                                                        ; inst 44
  br i1 %30, label %_16.if.then.4, label %_20.if.else.4                            ; inst 45
_16.if.then.4:
  %31 = icmp eq i1 %4, 0                                                           ; inst 46
  br i1 %31, label %_17.if.then.5, label %_18.if.else.5                            ; inst 47
_17.if.then.5:
  br label %_19.if.exit.5                                                          ; inst 48
_18.if.else.5:
  br label %_19.if.exit.5                                                          ; inst 49
_19.if.exit.5:
  %32 = phi i1 [1, %_17.if.then.5], [%4, %_18.if.else.5]                           ; inst 50
  br label %_21.if.exit.4                                                          ; inst 51
_20.if.else.4:
  br label %_21.if.exit.4                                                          ; inst 52
_21.if.exit.4:
  %33 = phi i1 [%32, %_19.if.exit.5], [%4, %_20.if.else.4]                         ; inst 53
  br label %_22.if.exit.2                                                          ; inst 54
_22.if.exit.2:
  %34 = phi i32 [%24, %_14.if.exit.3], [%2, %_21.if.exit.4]                        ; inst 55
  %35 = phi i32 [%26, %_14.if.exit.3], [%3, %_21.if.exit.4]                        ; inst 56
  %36 = phi i1 [%25, %_14.if.exit.3], [%33, %_21.if.exit.4]                        ; inst 57
  br label %_23.if.exit.0                                                          ; inst 58
_23.if.exit.0:
  %37 = phi i32 [%12, %_6.if.exit.1], [%34, %_22.if.exit.2]                        ; inst 59
  %38 = phi i32 [%3, %_6.if.exit.1], [%35, %_22.if.exit.2]                         ; inst 60
  %39 = phi i1 [%13, %_6.if.exit.1], [%36, %_22.if.exit.2]                         ; inst 61
  %40 = add i32 %5, 1                                                              ; inst 62
  br label %_1.while.cond.0                                                        ; inst 63
_24.while.exit.0:
  br i1 %4, label %_25.if.then.6, label %_26.if.else.6                             ; inst 64
_25.if.then.6:
  %41 = add i32 %2, 1                                                              ; inst 65
  br label %_27.if.exit.6                                                          ; inst 66
_26.if.else.6:
  br label %_27.if.exit.6                                                          ; inst 67
_27.if.exit.6:
  %42 = phi i32 [%41, %_25.if.then.6], [%2, %_26.if.else.6]                        ; inst 68
  %43 = add i32 %42, %3                                                            ; inst 69
  ret i32 %43                                                                      ; inst 70
}

define i32 @tokenizeText([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%86, %_56.if.exit.4]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%84, %_56.if.exit.4]                             ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%85, %_56.if.exit.4]                             ; inst 4
  %5 = icmp slt i32 %2, %1                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_57.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %6                 ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp sge i32 %8, 48                                                         ; inst 10
  br i1 %9, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 11
_3.lazy.then.0:
  %10 = sext i32 %2 to i64                                                         ; inst 12
  %11 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %10               ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = icmp sle i32 %12, 57                                                       ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %14 = phi i1 [%13, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 18
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 19
_6.if.then.0:
  br label %_41.if.exit.0                                                          ; inst 20
_7.if.else.0:
  %15 = sext i32 %2 to i64                                                         ; inst 21
  %16 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %15               ; inst 22
  %17 = load i32, i32* %16                                                         ; inst 23
  %18 = icmp sge i32 %17, 65                                                       ; inst 24
  br i1 %18, label %_8.lazy.then.1, label %_9.lazy.else.1                          ; inst 25
_8.lazy.then.1:
  %19 = sext i32 %2 to i64                                                         ; inst 26
  %20 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %19               ; inst 27
  %21 = load i32, i32* %20                                                         ; inst 28
  %22 = icmp sle i32 %21, 90                                                       ; inst 29
  br label %_10.lazy.exit.1                                                        ; inst 30
_9.lazy.else.1:
  br label %_10.lazy.exit.1                                                        ; inst 31
_10.lazy.exit.1:
  %23 = phi i1 [%22, %_8.lazy.then.1], [0, %_9.lazy.else.1]                        ; inst 32
  br i1 %23, label %_11.lazy.then.2, label %_12.lazy.else.2                        ; inst 33
_11.lazy.then.2:
  br label %_16.lazy.exit.2                                                        ; inst 34
_12.lazy.else.2:
  %24 = sext i32 %2 to i64                                                         ; inst 35
  %25 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %24               ; inst 36
  %26 = load i32, i32* %25                                                         ; inst 37
  %27 = icmp sge i32 %26, 97                                                       ; inst 38
  br i1 %27, label %_13.lazy.then.3, label %_14.lazy.else.3                        ; inst 39
_13.lazy.then.3:
  %28 = sext i32 %2 to i64                                                         ; inst 40
  %29 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %28               ; inst 41
  %30 = load i32, i32* %29                                                         ; inst 42
  %31 = icmp sle i32 %30, 122                                                      ; inst 43
  br label %_15.lazy.exit.3                                                        ; inst 44
_14.lazy.else.3:
  br label %_15.lazy.exit.3                                                        ; inst 45
_15.lazy.exit.3:
  %32 = phi i1 [%31, %_13.lazy.then.3], [0, %_14.lazy.else.3]                      ; inst 46
  br label %_16.lazy.exit.2                                                        ; inst 47
_16.lazy.exit.2:
  %33 = phi i1 [1, %_11.lazy.then.2], [%32, %_15.lazy.exit.3]                      ; inst 48
  br i1 %33, label %_17.if.then.1, label %_18.if.else.1                            ; inst 49
_17.if.then.1:
  br label %_40.if.exit.1                                                          ; inst 50
_18.if.else.1:
  %34 = sext i32 %2 to i64                                                         ; inst 51
  %35 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %34               ; inst 52
  %36 = load i32, i32* %35                                                         ; inst 53
  %37 = icmp eq i32 %36, 43                                                        ; inst 54
  br i1 %37, label %_19.lazy.then.4, label %_20.lazy.else.4                        ; inst 55
_19.lazy.then.4:
  br label %_21.lazy.exit.4                                                        ; inst 56
_20.lazy.else.4:
  %38 = sext i32 %2 to i64                                                         ; inst 57
  %39 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %38               ; inst 58
  %40 = load i32, i32* %39                                                         ; inst 59
  %41 = icmp eq i32 %40, 45                                                        ; inst 60
  br label %_21.lazy.exit.4                                                        ; inst 61
_21.lazy.exit.4:
  %42 = phi i1 [1, %_19.lazy.then.4], [%41, %_20.lazy.else.4]                      ; inst 62
  br i1 %42, label %_22.lazy.then.5, label %_23.lazy.else.5                        ; inst 63
_22.lazy.then.5:
  br label %_24.lazy.exit.5                                                        ; inst 64
_23.lazy.else.5:
  %43 = sext i32 %2 to i64                                                         ; inst 65
  %44 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %43               ; inst 66
  %45 = load i32, i32* %44                                                         ; inst 67
  %46 = icmp eq i32 %45, 42                                                        ; inst 68
  br label %_24.lazy.exit.5                                                        ; inst 69
_24.lazy.exit.5:
  %47 = phi i1 [1, %_22.lazy.then.5], [%46, %_23.lazy.else.5]                      ; inst 70
  br i1 %47, label %_25.lazy.then.6, label %_26.lazy.else.6                        ; inst 71
_25.lazy.then.6:
  br label %_27.lazy.exit.6                                                        ; inst 72
_26.lazy.else.6:
  %48 = sext i32 %2 to i64                                                         ; inst 73
  %49 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %48               ; inst 74
  %50 = load i32, i32* %49                                                         ; inst 75
  %51 = icmp eq i32 %50, 47                                                        ; inst 76
  br label %_27.lazy.exit.6                                                        ; inst 77
_27.lazy.exit.6:
  %52 = phi i1 [1, %_25.lazy.then.6], [%51, %_26.lazy.else.6]                      ; inst 78
  br i1 %52, label %_28.if.then.2, label %_29.if.else.2                            ; inst 79
_28.if.then.2:
  br label %_39.if.exit.2                                                          ; inst 80
_29.if.else.2:
  %53 = sext i32 %2 to i64                                                         ; inst 81
  %54 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %53               ; inst 82
  %55 = load i32, i32* %54                                                         ; inst 83
  %56 = icmp eq i32 %55, 44                                                        ; inst 84
  br i1 %56, label %_30.lazy.then.7, label %_31.lazy.else.7                        ; inst 85
_30.lazy.then.7:
  br label %_32.lazy.exit.7                                                        ; inst 86
_31.lazy.else.7:
  %57 = sext i32 %2 to i64                                                         ; inst 87
  %58 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %57               ; inst 88
  %59 = load i32, i32* %58                                                         ; inst 89
  %60 = icmp eq i32 %59, 46                                                        ; inst 90
  br label %_32.lazy.exit.7                                                        ; inst 91
_32.lazy.exit.7:
  %61 = phi i1 [1, %_30.lazy.then.7], [%60, %_31.lazy.else.7]                      ; inst 92
  br i1 %61, label %_33.lazy.then.8, label %_34.lazy.else.8                        ; inst 93
_33.lazy.then.8:
  br label %_35.lazy.exit.8                                                        ; inst 94
_34.lazy.else.8:
  %62 = sext i32 %2 to i64                                                         ; inst 95
  %63 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %62               ; inst 96
  %64 = load i32, i32* %63                                                         ; inst 97
  %65 = icmp eq i32 %64, 59                                                        ; inst 98
  br label %_35.lazy.exit.8                                                        ; inst 99
_35.lazy.exit.8:
  %66 = phi i1 [1, %_33.lazy.then.8], [%65, %_34.lazy.else.8]                      ; inst 100
  br i1 %66, label %_36.if.then.3, label %_37.if.else.3                            ; inst 101
_36.if.then.3:
  br label %_38.if.exit.3                                                          ; inst 102
_37.if.else.3:
  br label %_38.if.exit.3                                                          ; inst 103
_38.if.exit.3:
  %67 = phi i32 [4, %_36.if.then.3], [0, %_37.if.else.3]                           ; inst 104
  br label %_39.if.exit.2                                                          ; inst 105
_39.if.exit.2:
  %68 = phi i32 [3, %_28.if.then.2], [%67, %_38.if.exit.3]                         ; inst 106
  br label %_40.if.exit.1                                                          ; inst 107
_40.if.exit.1:
  %69 = phi i32 [2, %_17.if.then.1], [%68, %_39.if.exit.2]                         ; inst 108
  br label %_41.if.exit.0                                                          ; inst 109
_41.if.exit.0:
  %70 = phi i32 [1, %_6.if.then.0], [%69, %_40.if.exit.1]                          ; inst 110
  %71 = icmp ne i32 %70, 0                                                         ; inst 111
  br i1 %71, label %_42.lazy.then.9, label %_43.lazy.else.9                        ; inst 112
_42.lazy.then.9:
  %72 = icmp ne i32 %70, %3                                                        ; inst 113
  br label %_44.lazy.exit.9                                                        ; inst 114
_43.lazy.else.9:
  br label %_44.lazy.exit.9                                                        ; inst 115
_44.lazy.exit.9:
  %73 = phi i1 [%72, %_42.lazy.then.9], [0, %_43.lazy.else.9]                      ; inst 116
  br i1 %73, label %_45.if.then.4, label %_49.if.else.4                            ; inst 117
_45.if.then.4:
  %74 = icmp ne i32 %3, 0                                                          ; inst 118
  br i1 %74, label %_46.if.then.5, label %_47.if.else.5                            ; inst 119
_46.if.then.5:
  %75 = add i32 %4, 1                                                              ; inst 120
  br label %_48.if.exit.5                                                          ; inst 121
_47.if.else.5:
  br label %_48.if.exit.5                                                          ; inst 122
_48.if.exit.5:
  %76 = phi i32 [%75, %_46.if.then.5], [%4, %_47.if.else.5]                        ; inst 123
  br label %_56.if.exit.4                                                          ; inst 124
_49.if.else.4:
  %77 = icmp eq i32 %70, 0                                                         ; inst 125
  br i1 %77, label %_50.if.then.6, label %_54.if.else.6                            ; inst 126
_50.if.then.6:
  %78 = icmp ne i32 %3, 0                                                          ; inst 127
  br i1 %78, label %_51.if.then.7, label %_52.if.else.7                            ; inst 128
_51.if.then.7:
  %79 = add i32 %4, 1                                                              ; inst 129
  br label %_53.if.exit.7                                                          ; inst 130
_52.if.else.7:
  br label %_53.if.exit.7                                                          ; inst 131
_53.if.exit.7:
  %80 = phi i32 [0, %_51.if.then.7], [%3, %_52.if.else.7]                          ; inst 132
  %81 = phi i32 [%79, %_51.if.then.7], [%4, %_52.if.else.7]                        ; inst 133
  br label %_55.if.exit.6                                                          ; inst 134
_54.if.else.6:
  br label %_55.if.exit.6                                                          ; inst 135
_55.if.exit.6:
  %82 = phi i32 [%80, %_53.if.exit.7], [%3, %_54.if.else.6]                        ; inst 136
  %83 = phi i32 [%81, %_53.if.exit.7], [%4, %_54.if.else.6]                        ; inst 137
  br label %_56.if.exit.4                                                          ; inst 138
_56.if.exit.4:
  %84 = phi i32 [%70, %_48.if.exit.5], [%82, %_55.if.exit.6]                       ; inst 139
  %85 = phi i32 [%76, %_48.if.exit.5], [%83, %_55.if.exit.6]                       ; inst 140
  %86 = add i32 %2, 1                                                              ; inst 141
  br label %_1.while.cond.0                                                        ; inst 142
_57.while.exit.0:
  %87 = icmp ne i32 %3, 0                                                          ; inst 143
  br i1 %87, label %_58.if.then.8, label %_59.if.else.8                            ; inst 144
_58.if.then.8:
  %88 = add i32 %4, 1                                                              ; inst 145
  br label %_60.if.exit.8                                                          ; inst 146
_59.if.else.8:
  br label %_60.if.exit.8                                                          ; inst 147
_60.if.exit.8:
  %89 = phi i32 [%88, %_58.if.then.8], [%4, %_59.if.else.8]                        ; inst 148
  ret i32 %89                                                                      ; inst 149
}

define i32 @parseSimpleExpressions([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%66, %_38.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%67, %_38.if.exit.0]                             ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%68, %_38.if.exit.0]                             ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%70, %_38.if.exit.0]                             ; inst 5
  %6 = icmp slt i32 %5, %1                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_39.while.exit.0                        ; inst 7
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 8
  %8 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %7                 ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = icmp sge i32 %9, 48                                                        ; inst 11
  br i1 %10, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 12
_3.lazy.then.0:
  %11 = sext i32 %5 to i64                                                         ; inst 13
  %12 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %11               ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = icmp sle i32 %13, 57                                                       ; inst 16
  br label %_5.lazy.exit.0                                                         ; inst 17
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 18
_5.lazy.exit.0:
  %15 = phi i1 [%14, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 19
  br i1 %15, label %_6.if.then.0, label %_16.if.else.0                             ; inst 20
_6.if.then.0:
  br label %_7.while.cond.1                                                        ; inst 21
_7.while.cond.1:
  %16 = phi i32 [%5, %_6.if.then.0], [%28, %_14.while.body.1]                      ; inst 22
  %17 = icmp slt i32 %16, %1                                                       ; inst 23
  br i1 %17, label %_8.lazy.then.1, label %_9.lazy.else.1                          ; inst 24
_8.lazy.then.1:
  %18 = sext i32 %16 to i64                                                        ; inst 25
  %19 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %18               ; inst 26
  %20 = load i32, i32* %19                                                         ; inst 27
  %21 = icmp sge i32 %20, 48                                                       ; inst 28
  br label %_10.lazy.exit.1                                                        ; inst 29
_9.lazy.else.1:
  br label %_10.lazy.exit.1                                                        ; inst 30
_10.lazy.exit.1:
  %22 = phi i1 [%21, %_8.lazy.then.1], [0, %_9.lazy.else.1]                        ; inst 31
  br i1 %22, label %_11.lazy.then.2, label %_12.lazy.else.2                        ; inst 32
_11.lazy.then.2:
  %23 = sext i32 %16 to i64                                                        ; inst 33
  %24 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %23               ; inst 34
  %25 = load i32, i32* %24                                                         ; inst 35
  %26 = icmp sle i32 %25, 57                                                       ; inst 36
  br label %_13.lazy.exit.2                                                        ; inst 37
_12.lazy.else.2:
  br label %_13.lazy.exit.2                                                        ; inst 38
_13.lazy.exit.2:
  %27 = phi i1 [%26, %_11.lazy.then.2], [0, %_12.lazy.else.2]                      ; inst 39
  br i1 %27, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 40
_14.while.body.1:
  %28 = add i32 %16, 1                                                             ; inst 41
  br label %_7.while.cond.1                                                        ; inst 42
_15.while.exit.1:
  %29 = add i32 %4, 1                                                              ; inst 43
  %30 = sub i32 %16, 1                                                             ; inst 44
  br label %_38.if.exit.0                                                          ; inst 45
_16.if.else.0:
  %31 = sext i32 %5 to i64                                                         ; inst 46
  %32 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %31               ; inst 47
  %33 = load i32, i32* %32                                                         ; inst 48
  %34 = icmp eq i32 %33, 43                                                        ; inst 49
  br i1 %34, label %_17.lazy.then.3, label %_18.lazy.else.3                        ; inst 50
_17.lazy.then.3:
  br label %_19.lazy.exit.3                                                        ; inst 51
_18.lazy.else.3:
  %35 = sext i32 %5 to i64                                                         ; inst 52
  %36 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %35               ; inst 53
  %37 = load i32, i32* %36                                                         ; inst 54
  %38 = icmp eq i32 %37, 45                                                        ; inst 55
  br label %_19.lazy.exit.3                                                        ; inst 56
_19.lazy.exit.3:
  %39 = phi i1 [1, %_17.lazy.then.3], [%38, %_18.lazy.else.3]                      ; inst 57
  br i1 %39, label %_20.lazy.then.4, label %_21.lazy.else.4                        ; inst 58
_20.lazy.then.4:
  br label %_22.lazy.exit.4                                                        ; inst 59
_21.lazy.else.4:
  %40 = sext i32 %5 to i64                                                         ; inst 60
  %41 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %40               ; inst 61
  %42 = load i32, i32* %41                                                         ; inst 62
  %43 = icmp eq i32 %42, 42                                                        ; inst 63
  br label %_22.lazy.exit.4                                                        ; inst 64
_22.lazy.exit.4:
  %44 = phi i1 [1, %_20.lazy.then.4], [%43, %_21.lazy.else.4]                      ; inst 65
  br i1 %44, label %_23.lazy.then.5, label %_24.lazy.else.5                        ; inst 66
_23.lazy.then.5:
  br label %_25.lazy.exit.5                                                        ; inst 67
_24.lazy.else.5:
  %45 = sext i32 %5 to i64                                                         ; inst 68
  %46 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %45               ; inst 69
  %47 = load i32, i32* %46                                                         ; inst 70
  %48 = icmp eq i32 %47, 47                                                        ; inst 71
  br label %_25.lazy.exit.5                                                        ; inst 72
_25.lazy.exit.5:
  %49 = phi i1 [1, %_23.lazy.then.5], [%48, %_24.lazy.else.5]                      ; inst 73
  br i1 %49, label %_26.if.then.1, label %_27.if.else.1                            ; inst 74
_26.if.then.1:
  %50 = add i32 %3, 1                                                              ; inst 75
  br label %_37.if.exit.1                                                          ; inst 76
_27.if.else.1:
  %51 = sext i32 %5 to i64                                                         ; inst 77
  %52 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %51               ; inst 78
  %53 = load i32, i32* %52                                                         ; inst 79
  %54 = icmp eq i32 %53, 61                                                        ; inst 80
  br i1 %54, label %_28.if.then.2, label %_35.if.else.2                            ; inst 81
_28.if.then.2:
  %55 = icmp sgt i32 %4, 0                                                         ; inst 82
  br i1 %55, label %_29.lazy.then.6, label %_30.lazy.else.6                        ; inst 83
_29.lazy.then.6:
  %56 = icmp sgt i32 %3, 0                                                         ; inst 84
  br label %_31.lazy.exit.6                                                        ; inst 85
_30.lazy.else.6:
  br label %_31.lazy.exit.6                                                        ; inst 86
_31.lazy.exit.6:
  %57 = phi i1 [%56, %_29.lazy.then.6], [0, %_30.lazy.else.6]                      ; inst 87
  br i1 %57, label %_32.if.then.3, label %_33.if.else.3                            ; inst 88
_32.if.then.3:
  %58 = add i32 %2, 1                                                              ; inst 89
  br label %_34.if.exit.3                                                          ; inst 90
_33.if.else.3:
  br label %_34.if.exit.3                                                          ; inst 91
_34.if.exit.3:
  %59 = phi i32 [%58, %_32.if.then.3], [%2, %_33.if.else.3]                        ; inst 92
  br label %_36.if.exit.2                                                          ; inst 93
_35.if.else.2:
  br label %_36.if.exit.2                                                          ; inst 94
_36.if.exit.2:
  %60 = phi i32 [%59, %_34.if.exit.3], [%2, %_35.if.else.2]                        ; inst 95
  %61 = phi i32 [0, %_34.if.exit.3], [%3, %_35.if.else.2]                          ; inst 96
  %62 = phi i32 [0, %_34.if.exit.3], [%4, %_35.if.else.2]                          ; inst 97
  br label %_37.if.exit.1                                                          ; inst 98
_37.if.exit.1:
  %63 = phi i32 [%2, %_26.if.then.1], [%60, %_36.if.exit.2]                        ; inst 99
  %64 = phi i32 [%50, %_26.if.then.1], [%61, %_36.if.exit.2]                       ; inst 100
  %65 = phi i32 [%4, %_26.if.then.1], [%62, %_36.if.exit.2]                        ; inst 101
  br label %_38.if.exit.0                                                          ; inst 102
_38.if.exit.0:
  %66 = phi i32 [%2, %_15.while.exit.1], [%63, %_37.if.exit.1]                     ; inst 103
  %67 = phi i32 [%3, %_15.while.exit.1], [%64, %_37.if.exit.1]                     ; inst 104
  %68 = phi i32 [%29, %_15.while.exit.1], [%65, %_37.if.exit.1]                    ; inst 105
  %69 = phi i32 [%30, %_15.while.exit.1], [%5, %_37.if.exit.1]                     ; inst 106
  %70 = add i32 %69, 1                                                             ; inst 107
  br label %_1.while.cond.0                                                        ; inst 108
_39.while.exit.0:
  ret i32 %2                                                                       ; inst 109
}

define void @testStringCompressionAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1607)                                                  ; inst 1
  %0 = alloca [1500 x i32]                                                         ; inst 2
  %1 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 1500                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeCompressionText([1500 x i32]* %0)                           ; inst 12
  %6 = call i32 @runLengthEncoding([1500 x i32]* %0, i32 1500)                     ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @simpleDictionaryCompression([1500 x i32]* %0, i32 1500)           ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @patternBasedCompression([1500 x i32]* %0, i32 1500)               ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @frequencyBasedEncoding([1500 x i32]* %0, i32 1500)                ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  call void @printlnInt(i32 1608)                                                  ; inst 21
  ret void                                                                         ; inst 22
}

define void @initializeCompressionText([1500 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%23, %_14.if.exit.0]                             ; inst 2
  %2 = icmp slt i32 %1, 1500                                                       ; inst 3
  br i1 %2, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 4
_2.while.body.0:
  %3 = srem i32 %1, 100                                                            ; inst 5
  %4 = icmp slt i32 %3, 20                                                         ; inst 6
  br i1 %4, label %_3.if.then.0, label %_4.if.else.0                               ; inst 7
_3.if.then.0:
  %5 = sext i32 %1 to i64                                                          ; inst 8
  %6 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %5                 ; inst 9
  store i32 65, i32* %6                                                            ; inst 10
  br label %_14.if.exit.0                                                          ; inst 11
_4.if.else.0:
  %7 = srem i32 %1, 100                                                            ; inst 12
  %8 = icmp slt i32 %7, 40                                                         ; inst 13
  br i1 %8, label %_5.if.then.1, label %_6.if.else.1                               ; inst 14
_5.if.then.1:
  %9 = sext i32 %1 to i64                                                          ; inst 15
  %10 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %9                ; inst 16
  store i32 66, i32* %10                                                           ; inst 17
  br label %_13.if.exit.1                                                          ; inst 18
_6.if.else.1:
  %11 = srem i32 %1, 100                                                           ; inst 19
  %12 = icmp slt i32 %11, 60                                                       ; inst 20
  br i1 %12, label %_7.if.then.2, label %_8.if.else.2                              ; inst 21
_7.if.then.2:
  %13 = sext i32 %1 to i64                                                         ; inst 22
  %14 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %13               ; inst 23
  store i32 67, i32* %14                                                           ; inst 24
  br label %_12.if.exit.2                                                          ; inst 25
_8.if.else.2:
  %15 = srem i32 %1, 100                                                           ; inst 26
  %16 = icmp slt i32 %15, 80                                                       ; inst 27
  br i1 %16, label %_9.if.then.3, label %_10.if.else.3                             ; inst 28
_9.if.then.3:
  %17 = sext i32 %1 to i64                                                         ; inst 29
  %18 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %17               ; inst 30
  store i32 32, i32* %18                                                           ; inst 31
  br label %_11.if.exit.3                                                          ; inst 32
_10.if.else.3:
  %19 = sext i32 %1 to i64                                                         ; inst 33
  %20 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %19               ; inst 34
  %21 = srem i32 %1, 5                                                             ; inst 35
  %22 = add i32 68, %21                                                            ; inst 36
  store i32 %22, i32* %20                                                          ; inst 37
  br label %_11.if.exit.3                                                          ; inst 38
_11.if.exit.3:
  br label %_12.if.exit.2                                                          ; inst 39
_12.if.exit.2:
  br label %_13.if.exit.1                                                          ; inst 40
_13.if.exit.1:
  br label %_14.if.exit.0                                                          ; inst 41
_14.if.exit.0:
  %23 = add i32 %1, 1                                                              ; inst 42
  br label %_1.while.cond.0                                                        ; inst 43
_15.while.exit.0:
  ret void                                                                         ; inst 44
}

define i32 @runLengthEncoding([1500 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%22, %_11.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%21, %_11.if.exit.0]                             ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  br label %_3.while.cond.1                                                        ; inst 9
_3.while.cond.1:
  %8 = phi i32 [1, %_2.while.body.0], [%17, %_7.while.body.1]                      ; inst 10
  %9 = add i32 %2, %8                                                              ; inst 11
  %10 = icmp slt i32 %9, %1                                                        ; inst 12
  br i1 %10, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 13
_4.lazy.then.0:
  %11 = add i32 %2, %8                                                             ; inst 14
  %12 = sext i32 %11 to i64                                                        ; inst 15
  %13 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %12               ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = icmp eq i32 %14, %7                                                        ; inst 18
  br label %_6.lazy.exit.0                                                         ; inst 19
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 20
_6.lazy.exit.0:
  %16 = phi i1 [%15, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 21
  br i1 %16, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 22
_7.while.body.1:
  %17 = add i32 %8, 1                                                              ; inst 23
  br label %_3.while.cond.1                                                        ; inst 24
_8.while.exit.1:
  %18 = icmp sgt i32 %8, 3                                                         ; inst 25
  br i1 %18, label %_9.if.then.0, label %_10.if.else.0                             ; inst 26
_9.if.then.0:
  %19 = add i32 %3, 2                                                              ; inst 27
  br label %_11.if.exit.0                                                          ; inst 28
_10.if.else.0:
  %20 = add i32 %3, %8                                                             ; inst 29
  br label %_11.if.exit.0                                                          ; inst 30
_11.if.exit.0:
  %21 = phi i32 [%19, %_9.if.then.0], [%20, %_10.if.else.0]                        ; inst 31
  %22 = add i32 %2, %8                                                             ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_12.while.exit.0:
  ret i32 %3                                                                       ; inst 34
}

define i32 @simpleDictionaryCompression([1500 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [256 x i32]                                                          ; inst 1
  %3 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 256                                                        ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%41, %_14.if.exit.0]                        ; inst 12
  %9 = phi i32 [0, %_3.array.exit.0], [%42, %_14.if.exit.0]                        ; inst 13
  %10 = icmp slt i32 %9, %1                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 15
_5.while.body.0:
  %11 = sext i32 %9 to i64                                                         ; inst 16
  %12 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %11               ; inst 17
  %13 = load i32, i32* %12                                                         ; inst 18
  %14 = icmp sge i32 %13, 0                                                        ; inst 19
  br i1 %14, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 20
_6.lazy.then.0:
  %15 = sext i32 %9 to i64                                                         ; inst 21
  %16 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %15               ; inst 22
  %17 = load i32, i32* %16                                                         ; inst 23
  %18 = icmp slt i32 %17, 256                                                      ; inst 24
  br label %_8.lazy.exit.0                                                         ; inst 25
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 26
_8.lazy.exit.0:
  %19 = phi i1 [%18, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 27
  br i1 %19, label %_9.if.then.0, label %_13.if.else.0                             ; inst 28
_9.if.then.0:
  %20 = sext i32 %9 to i64                                                         ; inst 29
  %21 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %20               ; inst 30
  %22 = load i32, i32* %21                                                         ; inst 31
  %23 = sext i32 %22 to i64                                                        ; inst 32
  %24 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %23                 ; inst 33
  %25 = load i32, i32* %24                                                         ; inst 34
  %26 = icmp eq i32 %25, 0                                                         ; inst 35
  br i1 %26, label %_10.if.then.1, label %_11.if.else.1                            ; inst 36
_10.if.then.1:
  %27 = add i32 %8, 1                                                              ; inst 37
  br label %_12.if.exit.1                                                          ; inst 38
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 39
_12.if.exit.1:
  %28 = phi i32 [%27, %_10.if.then.1], [%8, %_11.if.else.1]                        ; inst 40
  %29 = sext i32 %9 to i64                                                         ; inst 41
  %30 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %29               ; inst 42
  %31 = load i32, i32* %30                                                         ; inst 43
  %32 = sext i32 %31 to i64                                                        ; inst 44
  %33 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %32                 ; inst 45
  %34 = sext i32 %9 to i64                                                         ; inst 46
  %35 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %34               ; inst 47
  %36 = load i32, i32* %35                                                         ; inst 48
  %37 = sext i32 %36 to i64                                                        ; inst 49
  %38 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %37                 ; inst 50
  %39 = load i32, i32* %38                                                         ; inst 51
  %40 = add i32 %39, 1                                                             ; inst 52
  store i32 %40, i32* %33                                                          ; inst 53
  br label %_14.if.exit.0                                                          ; inst 54
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 55
_14.if.exit.0:
  %41 = phi i32 [%28, %_12.if.exit.1], [%8, %_13.if.else.0]                        ; inst 56
  %42 = add i32 %9, 1                                                              ; inst 57
  br label %_4.while.cond.0                                                        ; inst 58
_15.while.exit.0:
  %43 = icmp sle i32 %8, 2                                                         ; inst 59
  br i1 %43, label %_16.if.then.2, label %_17.if.else.2                            ; inst 60
_16.if.then.2:
  br label %_24.if.exit.2                                                          ; inst 61
_17.if.else.2:
  %44 = icmp sle i32 %8, 4                                                         ; inst 62
  br i1 %44, label %_18.if.then.3, label %_19.if.else.3                            ; inst 63
_18.if.then.3:
  br label %_23.if.exit.3                                                          ; inst 64
_19.if.else.3:
  %45 = icmp sle i32 %8, 16                                                        ; inst 65
  br i1 %45, label %_20.if.then.4, label %_21.if.else.4                            ; inst 66
_20.if.then.4:
  br label %_22.if.exit.4                                                          ; inst 67
_21.if.else.4:
  br label %_22.if.exit.4                                                          ; inst 68
_22.if.exit.4:
  %46 = phi i32 [4, %_20.if.then.4], [8, %_21.if.else.4]                           ; inst 69
  br label %_23.if.exit.3                                                          ; inst 70
_23.if.exit.3:
  %47 = phi i32 [2, %_18.if.then.3], [%46, %_22.if.exit.4]                         ; inst 71
  br label %_24.if.exit.2                                                          ; inst 72
_24.if.exit.2:
  %48 = phi i32 [1, %_16.if.then.2], [%47, %_23.if.exit.3]                         ; inst 73
  %49 = mul i32 %1, %48                                                            ; inst 74
  %50 = sdiv i32 %49, 8                                                            ; inst 75
  ret i32 %50                                                                      ; inst 76
}

define i32 @patternBasedCompression([1500 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%39, %_11.if.exit.1]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%41, %_11.if.exit.1]                             ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%40, %_11.if.exit.1]                             ; inst 4
  %5 = sub i32 %1, 1                                                               ; inst 5
  %6 = icmp slt i32 %3, %5                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 7
_2.while.body.0:
  %7 = sext i32 %3 to i64                                                          ; inst 8
  %8 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %7                 ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = mul i32 %9, 256                                                            ; inst 11
  %11 = sext i32 %3 to i64                                                         ; inst 12
  %12 = add i64 %11, 1                                                             ; inst 13
  %13 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %12               ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = add i32 %10, %14                                                           ; inst 16
  %16 = add i32 %3, 2                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_3.while.cond.1:
  %17 = phi i32 [1, %_2.while.body.0], [%34, %_7.if.exit.0]                        ; inst 19
  %18 = phi i32 [%16, %_2.while.body.0], [%35, %_7.if.exit.0]                      ; inst 20
  %19 = sub i32 %1, 1                                                              ; inst 21
  %20 = icmp slt i32 %18, %19                                                      ; inst 22
  br i1 %20, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 23
_4.while.body.1:
  %21 = sext i32 %18 to i64                                                        ; inst 24
  %22 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %21               ; inst 25
  %23 = load i32, i32* %22                                                         ; inst 26
  %24 = mul i32 %23, 256                                                           ; inst 27
  %25 = sext i32 %18 to i64                                                        ; inst 28
  %26 = add i64 %25, 1                                                             ; inst 29
  %27 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %26               ; inst 30
  %28 = load i32, i32* %27                                                         ; inst 31
  %29 = add i32 %24, %28                                                           ; inst 32
  %30 = icmp eq i32 %29, %15                                                       ; inst 33
  br i1 %30, label %_5.if.then.0, label %_6.if.else.0                              ; inst 34
_5.if.then.0:
  %31 = add i32 %17, 1                                                             ; inst 35
  %32 = add i32 %18, 2                                                             ; inst 36
  br label %_7.if.exit.0                                                           ; inst 37
_6.if.else.0:
  %33 = add i32 %18, 1                                                             ; inst 38
  br label %_7.if.exit.0                                                           ; inst 39
_7.if.exit.0:
  %34 = phi i32 [%31, %_5.if.then.0], [%17, %_6.if.else.0]                         ; inst 40
  %35 = phi i32 [%32, %_5.if.then.0], [%33, %_6.if.else.0]                         ; inst 41
  br label %_3.while.cond.1                                                        ; inst 42
_8.while.exit.1:
  %36 = icmp sgt i32 %17, 2                                                        ; inst 43
  br i1 %36, label %_9.if.then.1, label %_10.if.else.1                             ; inst 44
_9.if.then.1:
  %37 = add i32 %4, 1                                                              ; inst 45
  %38 = add i32 %2, %17                                                            ; inst 46
  br label %_11.if.exit.1                                                          ; inst 47
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 48
_11.if.exit.1:
  %39 = phi i32 [%38, %_9.if.then.1], [%2, %_10.if.else.1]                         ; inst 49
  %40 = phi i32 [%37, %_9.if.then.1], [%4, %_10.if.else.1]                         ; inst 50
  %41 = add i32 %3, 1                                                              ; inst 51
  br label %_1.while.cond.0                                                        ; inst 52
_12.while.exit.0:
  %42 = add i32 %4, %2                                                             ; inst 53
  ret i32 %42                                                                      ; inst 54
}

define i32 @frequencyBasedEncoding([1500 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [256 x i32]                                                          ; inst 1
  %3 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 256                                                        ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%31, %_11.if.exit.0]                        ; inst 12
  %9 = icmp slt i32 %8, %1                                                         ; inst 13
  br i1 %9, label %_5.while.body.0, label %_12.while.exit.0                        ; inst 14
_5.while.body.0:
  %10 = sext i32 %8 to i64                                                         ; inst 15
  %11 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %10               ; inst 16
  %12 = load i32, i32* %11                                                         ; inst 17
  %13 = icmp sge i32 %12, 0                                                        ; inst 18
  br i1 %13, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 19
_6.lazy.then.0:
  %14 = sext i32 %8 to i64                                                         ; inst 20
  %15 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %14               ; inst 21
  %16 = load i32, i32* %15                                                         ; inst 22
  %17 = icmp slt i32 %16, 256                                                      ; inst 23
  br label %_8.lazy.exit.0                                                         ; inst 24
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 25
_8.lazy.exit.0:
  %18 = phi i1 [%17, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 26
  br i1 %18, label %_9.if.then.0, label %_10.if.else.0                             ; inst 27
_9.if.then.0:
  %19 = sext i32 %8 to i64                                                         ; inst 28
  %20 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %19               ; inst 29
  %21 = load i32, i32* %20                                                         ; inst 30
  %22 = sext i32 %21 to i64                                                        ; inst 31
  %23 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %22                 ; inst 32
  %24 = sext i32 %8 to i64                                                         ; inst 33
  %25 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %24               ; inst 34
  %26 = load i32, i32* %25                                                         ; inst 35
  %27 = sext i32 %26 to i64                                                        ; inst 36
  %28 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %27                 ; inst 37
  %29 = load i32, i32* %28                                                         ; inst 38
  %30 = add i32 %29, 1                                                             ; inst 39
  store i32 %30, i32* %23                                                          ; inst 40
  br label %_11.if.exit.0                                                          ; inst 41
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 42
_11.if.exit.0:
  %31 = add i32 %8, 1                                                              ; inst 43
  br label %_4.while.cond.0                                                        ; inst 44
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 45
_13.while.cond.1:
  %32 = phi i32 [0, %_12.while.exit.0], [%63, %_26.if.exit.1]                      ; inst 46
  %33 = phi i32 [0, %_12.while.exit.0], [%62, %_26.if.exit.1]                      ; inst 47
  %34 = icmp slt i32 %32, 256                                                      ; inst 48
  br i1 %34, label %_14.while.body.1, label %_27.while.exit.1                      ; inst 49
_14.while.body.1:
  %35 = sext i32 %32 to i64                                                        ; inst 50
  %36 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %35                 ; inst 51
  %37 = load i32, i32* %36                                                         ; inst 52
  %38 = icmp sgt i32 %37, 0                                                        ; inst 53
  br i1 %38, label %_15.if.then.1, label %_25.if.else.1                            ; inst 54
_15.if.then.1:
  %39 = sext i32 %32 to i64                                                        ; inst 55
  %40 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %39                 ; inst 56
  %41 = load i32, i32* %40                                                         ; inst 57
  %42 = sdiv i32 %1, 2                                                             ; inst 58
  %43 = icmp sgt i32 %41, %42                                                      ; inst 59
  br i1 %43, label %_16.if.then.2, label %_17.if.else.2                            ; inst 60
_16.if.then.2:
  br label %_24.if.exit.2                                                          ; inst 61
_17.if.else.2:
  %44 = sext i32 %32 to i64                                                        ; inst 62
  %45 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %44                 ; inst 63
  %46 = load i32, i32* %45                                                         ; inst 64
  %47 = sdiv i32 %1, 8                                                             ; inst 65
  %48 = icmp sgt i32 %46, %47                                                      ; inst 66
  br i1 %48, label %_18.if.then.3, label %_19.if.else.3                            ; inst 67
_18.if.then.3:
  br label %_23.if.exit.3                                                          ; inst 68
_19.if.else.3:
  %49 = sext i32 %32 to i64                                                        ; inst 69
  %50 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %49                 ; inst 70
  %51 = load i32, i32* %50                                                         ; inst 71
  %52 = sdiv i32 %1, 32                                                            ; inst 72
  %53 = icmp sgt i32 %51, %52                                                      ; inst 73
  br i1 %53, label %_20.if.then.4, label %_21.if.else.4                            ; inst 74
_20.if.then.4:
  br label %_22.if.exit.4                                                          ; inst 75
_21.if.else.4:
  br label %_22.if.exit.4                                                          ; inst 76
_22.if.exit.4:
  %54 = phi i32 [5, %_20.if.then.4], [8, %_21.if.else.4]                           ; inst 77
  br label %_23.if.exit.3                                                          ; inst 78
_23.if.exit.3:
  %55 = phi i32 [3, %_18.if.then.3], [%54, %_22.if.exit.4]                         ; inst 79
  br label %_24.if.exit.2                                                          ; inst 80
_24.if.exit.2:
  %56 = phi i32 [1, %_16.if.then.2], [%55, %_23.if.exit.3]                         ; inst 81
  %57 = sext i32 %32 to i64                                                        ; inst 82
  %58 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %57                 ; inst 83
  %59 = load i32, i32* %58                                                         ; inst 84
  %60 = mul i32 %59, %56                                                           ; inst 85
  %61 = add i32 %33, %60                                                           ; inst 86
  br label %_26.if.exit.1                                                          ; inst 87
_25.if.else.1:
  br label %_26.if.exit.1                                                          ; inst 88
_26.if.exit.1:
  %62 = phi i32 [%61, %_24.if.exit.2], [%33, %_25.if.else.1]                       ; inst 89
  %63 = add i32 %32, 1                                                             ; inst 90
  br label %_13.while.cond.1                                                       ; inst 91
_27.while.exit.1:
  %64 = sdiv i32 %33, 8                                                            ; inst 92
  ret i32 %64                                                                      ; inst 93
}

define void @testAdvancedStringAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1609)                                                  ; inst 1
  %0 = alloca [800 x i32]                                                          ; inst 2
  %1 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 800                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %6 = alloca [800 x i32]                                                          ; inst 12
  %7 = getelementptr [800 x i32], [800 x i32]* %6, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 800                                                        ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  call void @initializeAdvancedTestStrings([800 x i32]* %0, [800 x i32]* %6)       ; inst 22
  %12 = call i32 @longestCommonSubsequence([800 x i32]* %0, [800 x i32]* %6, i32 200, i32 200) ; inst 23
  call void @printlnInt(i32 %12)                                                   ; inst 24
  %13 = call i32 @calculateEditDistance([800 x i32]* %0, [800 x i32]* %6, i32 100, i32 100) ; inst 25
  call void @printlnInt(i32 %13)                                                   ; inst 26
  %14 = call i32 @findLongestPalindrome([800 x i32]* %0, i32 400)                  ; inst 27
  call void @printlnInt(i32 %14)                                                   ; inst 28
  %15 = call i32 @detectStringRotations([800 x i32]* %0, [800 x i32]* %6, i32 200, i32 200) ; inst 29
  call void @printlnInt(i32 %15)                                                   ; inst 30
  call void @printlnInt(i32 1610)                                                  ; inst 31
  ret void                                                                         ; inst 32
}

define void @initializeAdvancedTestStrings([800 x i32]* %0, [800 x i32]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%13, %_2.while.body.0]                           ; inst 2
  %3 = icmp slt i32 %2, 400                                                        ; inst 3
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %4                   ; inst 6
  %6 = srem i32 %2, 26                                                             ; inst 7
  %7 = add i32 65, %6                                                              ; inst 8
  store i32 %7, i32* %5                                                            ; inst 9
  %8 = sext i32 %2 to i64                                                          ; inst 10
  %9 = getelementptr [800 x i32], [800 x i32]* %1, i32 0, i64 %8                   ; inst 11
  %10 = add i32 %2, 3                                                              ; inst 12
  %11 = srem i32 %10, 26                                                           ; inst 13
  %12 = add i32 65, %11                                                            ; inst 14
  store i32 %12, i32* %9                                                           ; inst 15
  %13 = add i32 %2, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  %14 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 100                 ; inst 18
  store i32 88, i32* %14                                                           ; inst 19
  %15 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 101                 ; inst 20
  store i32 89, i32* %15                                                           ; inst 21
  %16 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 102                 ; inst 22
  store i32 90, i32* %16                                                           ; inst 23
  %17 = getelementptr [800 x i32], [800 x i32]* %1, i32 0, i64 150                 ; inst 24
  store i32 88, i32* %17                                                           ; inst 25
  %18 = getelementptr [800 x i32], [800 x i32]* %1, i32 0, i64 151                 ; inst 26
  store i32 89, i32* %18                                                           ; inst 27
  %19 = getelementptr [800 x i32], [800 x i32]* %1, i32 0, i64 152                 ; inst 28
  store i32 90, i32* %19                                                           ; inst 29
  ret void                                                                         ; inst 30
}

define i32 @longestCommonSubsequence([800 x i32]* %0, [800 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca [201 x i32]                                                          ; inst 1
  %5 = getelementptr [201 x i32], [201 x i32]* %4, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 201                                                        ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 7
  store i32 0, i32* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %10 = alloca [201 x i32]                                                         ; inst 11
  %11 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i32 0                  ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %12 = phi i32 [0, %_3.array.exit.0], [%15, %_5.array.body.1]                     ; inst 14
  %13 = icmp slt i32 %12, 201                                                      ; inst 15
  br i1 %13, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %14 = getelementptr i32, i32* %11, i32 %12                                       ; inst 17
  store i32 0, i32* %14                                                            ; inst 18
  %15 = add i32 %12, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %16 = phi i32 [1, %_6.array.exit.1], [%72, %_29.while.exit.2]                    ; inst 22
  %17 = icmp sle i32 %16, %2                                                       ; inst 23
  br i1 %17, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 24
_8.lazy.then.0:
  %18 = icmp sle i32 %16, 200                                                      ; inst 25
  br label %_10.lazy.exit.0                                                        ; inst 26
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 27
_10.lazy.exit.0:
  %19 = phi i1 [%18, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 28
  br i1 %19, label %_11.while.body.0, label %_30.while.exit.0                      ; inst 29
_11.while.body.0:
  br label %_12.while.cond.1                                                       ; inst 30
_12.while.cond.1:
  %20 = phi i32 [1, %_11.while.body.0], [%59, %_22.if.exit.0]                      ; inst 31
  %21 = icmp sle i32 %20, %3                                                       ; inst 32
  br i1 %21, label %_13.lazy.then.1, label %_14.lazy.else.1                        ; inst 33
_13.lazy.then.1:
  %22 = icmp sle i32 %20, 200                                                      ; inst 34
  br label %_15.lazy.exit.1                                                        ; inst 35
_14.lazy.else.1:
  br label %_15.lazy.exit.1                                                        ; inst 36
_15.lazy.exit.1:
  %23 = phi i1 [%22, %_13.lazy.then.1], [0, %_14.lazy.else.1]                      ; inst 37
  br i1 %23, label %_16.while.body.1, label %_23.while.exit.1                      ; inst 38
_16.while.body.1:
  %24 = sext i32 %16 to i64                                                        ; inst 39
  %25 = sub i64 %24, 1                                                             ; inst 40
  %26 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %25                 ; inst 41
  %27 = load i32, i32* %26                                                         ; inst 42
  %28 = sext i32 %20 to i64                                                        ; inst 43
  %29 = sub i64 %28, 1                                                             ; inst 44
  %30 = getelementptr [800 x i32], [800 x i32]* %1, i32 0, i64 %29                 ; inst 45
  %31 = load i32, i32* %30                                                         ; inst 46
  %32 = icmp eq i32 %27, %31                                                       ; inst 47
  br i1 %32, label %_17.if.then.0, label %_18.if.else.0                            ; inst 48
_17.if.then.0:
  %33 = sext i32 %20 to i64                                                        ; inst 49
  %34 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i64 %33                ; inst 50
  %35 = sext i32 %20 to i64                                                        ; inst 51
  %36 = sub i64 %35, 1                                                             ; inst 52
  %37 = getelementptr [201 x i32], [201 x i32]* %4, i32 0, i64 %36                 ; inst 53
  %38 = load i32, i32* %37                                                         ; inst 54
  %39 = add i32 %38, 1                                                             ; inst 55
  store i32 %39, i32* %34                                                          ; inst 56
  br label %_22.if.exit.0                                                          ; inst 57
_18.if.else.0:
  %40 = sext i32 %20 to i64                                                        ; inst 58
  %41 = getelementptr [201 x i32], [201 x i32]* %4, i32 0, i64 %40                 ; inst 59
  %42 = load i32, i32* %41                                                         ; inst 60
  %43 = sext i32 %20 to i64                                                        ; inst 61
  %44 = sub i64 %43, 1                                                             ; inst 62
  %45 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i64 %44                ; inst 63
  %46 = load i32, i32* %45                                                         ; inst 64
  %47 = icmp sgt i32 %42, %46                                                      ; inst 65
  br i1 %47, label %_19.if.then.1, label %_20.if.else.1                            ; inst 66
_19.if.then.1:
  %48 = sext i32 %20 to i64                                                        ; inst 67
  %49 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i64 %48                ; inst 68
  %50 = sext i32 %20 to i64                                                        ; inst 69
  %51 = getelementptr [201 x i32], [201 x i32]* %4, i32 0, i64 %50                 ; inst 70
  %52 = load i32, i32* %51                                                         ; inst 71
  store i32 %52, i32* %49                                                          ; inst 72
  br label %_21.if.exit.1                                                          ; inst 73
_20.if.else.1:
  %53 = sext i32 %20 to i64                                                        ; inst 74
  %54 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i64 %53                ; inst 75
  %55 = sext i32 %20 to i64                                                        ; inst 76
  %56 = sub i64 %55, 1                                                             ; inst 77
  %57 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i64 %56                ; inst 78
  %58 = load i32, i32* %57                                                         ; inst 79
  store i32 %58, i32* %54                                                          ; inst 80
  br label %_21.if.exit.1                                                          ; inst 81
_21.if.exit.1:
  br label %_22.if.exit.0                                                          ; inst 82
_22.if.exit.0:
  %59 = add i32 %20, 1                                                             ; inst 83
  br label %_12.while.cond.1                                                       ; inst 84
_23.while.exit.1:
  br label %_24.while.cond.2                                                       ; inst 85
_24.while.cond.2:
  %60 = phi i32 [0, %_23.while.exit.1], [%71, %_28.while.body.2]                   ; inst 86
  %61 = icmp sle i32 %60, %3                                                       ; inst 87
  br i1 %61, label %_25.lazy.then.2, label %_26.lazy.else.2                        ; inst 88
_25.lazy.then.2:
  %62 = icmp sle i32 %60, 200                                                      ; inst 89
  br label %_27.lazy.exit.2                                                        ; inst 90
_26.lazy.else.2:
  br label %_27.lazy.exit.2                                                        ; inst 91
_27.lazy.exit.2:
  %63 = phi i1 [%62, %_25.lazy.then.2], [0, %_26.lazy.else.2]                      ; inst 92
  br i1 %63, label %_28.while.body.2, label %_29.while.exit.2                      ; inst 93
_28.while.body.2:
  %64 = sext i32 %60 to i64                                                        ; inst 94
  %65 = getelementptr [201 x i32], [201 x i32]* %4, i32 0, i64 %64                 ; inst 95
  %66 = sext i32 %60 to i64                                                        ; inst 96
  %67 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i64 %66                ; inst 97
  %68 = load i32, i32* %67                                                         ; inst 98
  store i32 %68, i32* %65                                                          ; inst 99
  %69 = sext i32 %60 to i64                                                        ; inst 100
  %70 = getelementptr [201 x i32], [201 x i32]* %10, i32 0, i64 %69                ; inst 101
  store i32 0, i32* %70                                                            ; inst 102
  %71 = add i32 %60, 1                                                             ; inst 103
  br label %_24.while.cond.2                                                       ; inst 104
_29.while.exit.2:
  %72 = add i32 %16, 1                                                             ; inst 105
  br label %_7.while.cond.0                                                        ; inst 106
_30.while.exit.0:
  %73 = icmp sle i32 %3, 200                                                       ; inst 107
  br i1 %73, label %_31.if.then.2, label %_32.if.else.2                            ; inst 108
_31.if.then.2:
  %74 = sext i32 %3 to i64                                                         ; inst 109
  %75 = getelementptr [201 x i32], [201 x i32]* %4, i32 0, i64 %74                 ; inst 110
  %76 = load i32, i32* %75                                                         ; inst 111
  br label %_33.if.exit.2                                                          ; inst 112
_32.if.else.2:
  %77 = getelementptr [201 x i32], [201 x i32]* %4, i32 0, i64 200                 ; inst 113
  %78 = load i32, i32* %77                                                         ; inst 114
  br label %_33.if.exit.2                                                          ; inst 115
_33.if.exit.2:
  %79 = phi i32 [%76, %_31.if.then.2], [%78, %_32.if.else.2]                       ; inst 116
  ret i32 %79                                                                      ; inst 117
}

define i32 @calculateEditDistance([800 x i32]* %0, [800 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp sgt i32 %2, 100                                                        ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %5 = phi i32 [100, %_1.if.then.0], [%2, %_2.if.else.0]                           ; inst 5
  %6 = icmp sgt i32 %3, 100                                                        ; inst 6
  br i1 %6, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 8
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 9
_6.if.exit.1:
  %7 = phi i32 [100, %_4.if.then.1], [%3, %_5.if.else.1]                           ; inst 10
  %8 = alloca [101 x i32]                                                          ; inst 11
  %9 = getelementptr [101 x i32], [101 x i32]* %8, i32 0, i32 0                    ; inst 12
  br label %_7.array.cond.0                                                        ; inst 13
_7.array.cond.0:
  %10 = phi i32 [0, %_6.if.exit.1], [%13, %_8.array.body.0]                        ; inst 14
  %11 = icmp slt i32 %10, 101                                                      ; inst 15
  br i1 %11, label %_8.array.body.0, label %_9.array.exit.0                        ; inst 16
_8.array.body.0:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 17
  store i32 0, i32* %12                                                            ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_7.array.cond.0                                                        ; inst 20
_9.array.exit.0:
  %14 = alloca [101 x i32]                                                         ; inst 21
  %15 = getelementptr [101 x i32], [101 x i32]* %14, i32 0, i32 0                  ; inst 22
  br label %_10.array.cond.1                                                       ; inst 23
_10.array.cond.1:
  %16 = phi i32 [0, %_9.array.exit.0], [%19, %_11.array.body.1]                    ; inst 24
  %17 = icmp slt i32 %16, 101                                                      ; inst 25
  br i1 %17, label %_11.array.body.1, label %_12.array.exit.1                      ; inst 26
_11.array.body.1:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 27
  store i32 0, i32* %18                                                            ; inst 28
  %19 = add i32 %16, 1                                                             ; inst 29
  br label %_10.array.cond.1                                                       ; inst 30
_12.array.exit.1:
  br label %_13.while.cond.0                                                       ; inst 31
_13.while.cond.0:
  %20 = phi i32 [0, %_12.array.exit.1], [%24, %_14.while.body.0]                   ; inst 32
  %21 = icmp sle i32 %20, %7                                                       ; inst 33
  br i1 %21, label %_14.while.body.0, label %_15.while.exit.0                      ; inst 34
_14.while.body.0:
  %22 = sext i32 %20 to i64                                                        ; inst 35
  %23 = getelementptr [101 x i32], [101 x i32]* %8, i32 0, i64 %22                 ; inst 36
  store i32 %20, i32* %23                                                          ; inst 37
  %24 = add i32 %20, 1                                                             ; inst 38
  br label %_13.while.cond.0                                                       ; inst 39
_15.while.exit.0:
  br label %_16.while.cond.1                                                       ; inst 40
_16.while.cond.1:
  %25 = phi i32 [1, %_15.while.exit.0], [%70, %_32.while.exit.3]                   ; inst 41
  %26 = icmp sle i32 %25, %5                                                       ; inst 42
  br i1 %26, label %_17.while.body.1, label %_33.while.exit.1                      ; inst 43
_17.while.body.1:
  %27 = getelementptr [101 x i32], [101 x i32]* %14, i32 0, i64 0                  ; inst 44
  store i32 %25, i32* %27                                                          ; inst 45
  br label %_18.while.cond.2                                                       ; inst 46
_18.while.cond.2:
  %28 = phi i32 [1, %_17.while.body.1], [%61, %_28.if.exit.4]                      ; inst 47
  %29 = icmp sle i32 %28, %7                                                       ; inst 48
  br i1 %29, label %_19.while.body.2, label %_29.while.exit.2                      ; inst 49
_19.while.body.2:
  %30 = sext i32 %25 to i64                                                        ; inst 50
  %31 = sub i64 %30, 1                                                             ; inst 51
  %32 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %31                 ; inst 52
  %33 = load i32, i32* %32                                                         ; inst 53
  %34 = sext i32 %28 to i64                                                        ; inst 54
  %35 = sub i64 %34, 1                                                             ; inst 55
  %36 = getelementptr [800 x i32], [800 x i32]* %1, i32 0, i64 %35                 ; inst 56
  %37 = load i32, i32* %36                                                         ; inst 57
  %38 = icmp eq i32 %33, %37                                                       ; inst 58
  br i1 %38, label %_20.if.then.2, label %_21.if.else.2                            ; inst 59
_20.if.then.2:
  br label %_22.if.exit.2                                                          ; inst 60
_21.if.else.2:
  br label %_22.if.exit.2                                                          ; inst 61
_22.if.exit.2:
  %39 = phi i32 [0, %_20.if.then.2], [1, %_21.if.else.2]                           ; inst 62
  %40 = sext i32 %28 to i64                                                        ; inst 63
  %41 = getelementptr [101 x i32], [101 x i32]* %8, i32 0, i64 %40                 ; inst 64
  %42 = load i32, i32* %41                                                         ; inst 65
  %43 = add i32 %42, 1                                                             ; inst 66
  %44 = sext i32 %28 to i64                                                        ; inst 67
  %45 = sub i64 %44, 1                                                             ; inst 68
  %46 = getelementptr [101 x i32], [101 x i32]* %14, i32 0, i64 %45                ; inst 69
  %47 = load i32, i32* %46                                                         ; inst 70
  %48 = add i32 %47, 1                                                             ; inst 71
  %49 = sext i32 %28 to i64                                                        ; inst 72
  %50 = sub i64 %49, 1                                                             ; inst 73
  %51 = getelementptr [101 x i32], [101 x i32]* %8, i32 0, i64 %50                 ; inst 74
  %52 = load i32, i32* %51                                                         ; inst 75
  %53 = add i32 %52, %39                                                           ; inst 76
  %54 = icmp slt i32 %43, %48                                                      ; inst 77
  br i1 %54, label %_23.if.then.3, label %_24.if.else.3                            ; inst 78
_23.if.then.3:
  br label %_25.if.exit.3                                                          ; inst 79
_24.if.else.3:
  br label %_25.if.exit.3                                                          ; inst 80
_25.if.exit.3:
  %55 = phi i32 [%43, %_23.if.then.3], [%48, %_24.if.else.3]                       ; inst 81
  %56 = icmp slt i32 %53, %55                                                      ; inst 82
  br i1 %56, label %_26.if.then.4, label %_27.if.else.4                            ; inst 83
_26.if.then.4:
  %57 = sext i32 %28 to i64                                                        ; inst 84
  %58 = getelementptr [101 x i32], [101 x i32]* %14, i32 0, i64 %57                ; inst 85
  store i32 %53, i32* %58                                                          ; inst 86
  br label %_28.if.exit.4                                                          ; inst 87
_27.if.else.4:
  %59 = sext i32 %28 to i64                                                        ; inst 88
  %60 = getelementptr [101 x i32], [101 x i32]* %14, i32 0, i64 %59                ; inst 89
  store i32 %55, i32* %60                                                          ; inst 90
  br label %_28.if.exit.4                                                          ; inst 91
_28.if.exit.4:
  %61 = add i32 %28, 1                                                             ; inst 92
  br label %_18.while.cond.2                                                       ; inst 93
_29.while.exit.2:
  br label %_30.while.cond.3                                                       ; inst 94
_30.while.cond.3:
  %62 = phi i32 [0, %_29.while.exit.2], [%69, %_31.while.body.3]                   ; inst 95
  %63 = icmp sle i32 %62, %7                                                       ; inst 96
  br i1 %63, label %_31.while.body.3, label %_32.while.exit.3                      ; inst 97
_31.while.body.3:
  %64 = sext i32 %62 to i64                                                        ; inst 98
  %65 = getelementptr [101 x i32], [101 x i32]* %8, i32 0, i64 %64                 ; inst 99
  %66 = sext i32 %62 to i64                                                        ; inst 100
  %67 = getelementptr [101 x i32], [101 x i32]* %14, i32 0, i64 %66                ; inst 101
  %68 = load i32, i32* %67                                                         ; inst 102
  store i32 %68, i32* %65                                                          ; inst 103
  %69 = add i32 %62, 1                                                             ; inst 104
  br label %_30.while.cond.3                                                       ; inst 105
_32.while.exit.3:
  %70 = add i32 %25, 1                                                             ; inst 106
  br label %_16.while.cond.1                                                       ; inst 107
_33.while.exit.1:
  %71 = sext i32 %7 to i64                                                         ; inst 108
  %72 = getelementptr [101 x i32], [101 x i32]* %8, i32 0, i64 %71                 ; inst 109
  %73 = load i32, i32* %72                                                         ; inst 110
  ret i32 %73                                                                      ; inst 111
}

define i32 @findLongestPalindrome([800 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [1, %_0.entry.0], [%7, %_14.while.exit.1]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%25, %_14.while.exit.1]                          ; inst 3
  %4 = icmp slt i32 %3, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %5 = phi i32 [%3, %_2.while.body.0], [%23, %_13.if.exit.0]                       ; inst 7
  %6 = phi i32 [%3, %_2.while.body.0], [%24, %_13.if.exit.0]                       ; inst 8
  %7 = phi i32 [%2, %_2.while.body.0], [%22, %_13.if.exit.0]                       ; inst 9
  %8 = icmp sge i32 %5, 0                                                          ; inst 10
  br i1 %8, label %_4.lazy.then.0, label %_5.lazy.else.0                           ; inst 11
_4.lazy.then.0:
  %9 = icmp slt i32 %6, %1                                                         ; inst 12
  br label %_6.lazy.exit.0                                                         ; inst 13
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 14
_6.lazy.exit.0:
  %10 = phi i1 [%9, %_4.lazy.then.0], [0, %_5.lazy.else.0]                         ; inst 15
  br i1 %10, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 16
_7.lazy.then.1:
  %11 = sext i32 %5 to i64                                                         ; inst 17
  %12 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %11                 ; inst 18
  %13 = load i32, i32* %12                                                         ; inst 19
  %14 = sext i32 %6 to i64                                                         ; inst 20
  %15 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %14                 ; inst 21
  %16 = load i32, i32* %15                                                         ; inst 22
  %17 = icmp eq i32 %13, %16                                                       ; inst 23
  br label %_9.lazy.exit.1                                                         ; inst 24
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 25
_9.lazy.exit.1:
  %18 = phi i1 [%17, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 26
  br i1 %18, label %_10.while.body.1, label %_14.while.exit.1                      ; inst 27
_10.while.body.1:
  %19 = sub i32 %6, %5                                                             ; inst 28
  %20 = add i32 %19, 1                                                             ; inst 29
  %21 = icmp sgt i32 %20, %7                                                       ; inst 30
  br i1 %21, label %_11.if.then.0, label %_12.if.else.0                            ; inst 31
_11.if.then.0:
  br label %_13.if.exit.0                                                          ; inst 32
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 33
_13.if.exit.0:
  %22 = phi i32 [%20, %_11.if.then.0], [%7, %_12.if.else.0]                        ; inst 34
  %23 = sub i32 %5, 1                                                              ; inst 35
  %24 = add i32 %6, 1                                                              ; inst 36
  br label %_3.while.cond.1                                                        ; inst 37
_14.while.exit.1:
  %25 = add i32 %3, 1                                                              ; inst 38
  br label %_1.while.cond.0                                                        ; inst 39
_15.while.exit.0:
  br label %_16.while.cond.2                                                       ; inst 40
_16.while.cond.2:
  %26 = phi i32 [%2, %_15.while.exit.0], [%31, %_29.while.exit.3]                  ; inst 41
  %27 = phi i32 [0, %_15.while.exit.0], [%51, %_29.while.exit.3]                   ; inst 42
  %28 = sub i32 %1, 1                                                              ; inst 43
  %29 = icmp slt i32 %27, %28                                                      ; inst 44
  br i1 %29, label %_17.while.body.2, label %_30.while.exit.2                      ; inst 45
_17.while.body.2:
  %30 = add i32 %27, 1                                                             ; inst 46
  br label %_18.while.cond.3                                                       ; inst 47
_18.while.cond.3:
  %31 = phi i32 [%26, %_17.while.body.2], [%48, %_28.if.exit.1]                    ; inst 48
  %32 = phi i32 [%27, %_17.while.body.2], [%49, %_28.if.exit.1]                    ; inst 49
  %33 = phi i32 [%30, %_17.while.body.2], [%50, %_28.if.exit.1]                    ; inst 50
  %34 = icmp sge i32 %32, 0                                                        ; inst 51
  br i1 %34, label %_19.lazy.then.2, label %_20.lazy.else.2                        ; inst 52
_19.lazy.then.2:
  %35 = icmp slt i32 %33, %1                                                       ; inst 53
  br label %_21.lazy.exit.2                                                        ; inst 54
_20.lazy.else.2:
  br label %_21.lazy.exit.2                                                        ; inst 55
_21.lazy.exit.2:
  %36 = phi i1 [%35, %_19.lazy.then.2], [0, %_20.lazy.else.2]                      ; inst 56
  br i1 %36, label %_22.lazy.then.3, label %_23.lazy.else.3                        ; inst 57
_22.lazy.then.3:
  %37 = sext i32 %32 to i64                                                        ; inst 58
  %38 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %37                 ; inst 59
  %39 = load i32, i32* %38                                                         ; inst 60
  %40 = sext i32 %33 to i64                                                        ; inst 61
  %41 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %40                 ; inst 62
  %42 = load i32, i32* %41                                                         ; inst 63
  %43 = icmp eq i32 %39, %42                                                       ; inst 64
  br label %_24.lazy.exit.3                                                        ; inst 65
_23.lazy.else.3:
  br label %_24.lazy.exit.3                                                        ; inst 66
_24.lazy.exit.3:
  %44 = phi i1 [%43, %_22.lazy.then.3], [0, %_23.lazy.else.3]                      ; inst 67
  br i1 %44, label %_25.while.body.3, label %_29.while.exit.3                      ; inst 68
_25.while.body.3:
  %45 = sub i32 %33, %32                                                           ; inst 69
  %46 = add i32 %45, 1                                                             ; inst 70
  %47 = icmp sgt i32 %46, %31                                                      ; inst 71
  br i1 %47, label %_26.if.then.1, label %_27.if.else.1                            ; inst 72
_26.if.then.1:
  br label %_28.if.exit.1                                                          ; inst 73
_27.if.else.1:
  br label %_28.if.exit.1                                                          ; inst 74
_28.if.exit.1:
  %48 = phi i32 [%46, %_26.if.then.1], [%31, %_27.if.else.1]                       ; inst 75
  %49 = sub i32 %32, 1                                                             ; inst 76
  %50 = add i32 %33, 1                                                             ; inst 77
  br label %_18.while.cond.3                                                       ; inst 78
_29.while.exit.3:
  %51 = add i32 %27, 1                                                             ; inst 79
  br label %_16.while.cond.2                                                       ; inst 80
_30.while.exit.2:
  ret i32 %26                                                                      ; inst 81
}

define i32 @detectStringRotations([800 x i32]* %0, [800 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp ne i32 %2, %3                                                          ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %5 = phi i32 [0, %_3.if.exit.0], [%27, %_20.if.exit.2]                           ; inst 6
  %6 = phi i32 [0, %_3.if.exit.0], [%26, %_20.if.exit.2]                           ; inst 7
  %7 = icmp slt i32 %5, %2                                                         ; inst 8
  br i1 %7, label %_5.lazy.then.0, label %_6.lazy.else.0                           ; inst 9
_5.lazy.then.0:
  %8 = icmp slt i32 %5, 200                                                        ; inst 10
  br label %_7.lazy.exit.0                                                         ; inst 11
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 12
_7.lazy.exit.0:
  %9 = phi i1 [%8, %_5.lazy.then.0], [0, %_6.lazy.else.0]                          ; inst 13
  br i1 %9, label %_8.while.body.0, label %_21.while.exit.0                        ; inst 14
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 15
_9.while.cond.1:
  %10 = phi i32 [0, %_8.while.body.0], [%23, %_16.if.exit.1]                       ; inst 16
  %11 = icmp slt i32 %10, %2                                                       ; inst 17
  br i1 %11, label %_10.lazy.then.1, label %_11.lazy.else.1                        ; inst 18
_10.lazy.then.1:
  %12 = icmp slt i32 %10, 200                                                      ; inst 19
  br label %_12.lazy.exit.1                                                        ; inst 20
_11.lazy.else.1:
  br label %_12.lazy.exit.1                                                        ; inst 21
_12.lazy.exit.1:
  %13 = phi i1 [%12, %_10.lazy.then.1], [0, %_11.lazy.else.1]                      ; inst 22
  br i1 %13, label %_13.while.body.1, label %_22.critical_edge.0                   ; inst 23
_13.while.body.1:
  %14 = add i32 %10, %5                                                            ; inst 24
  %15 = srem i32 %14, %2                                                           ; inst 25
  %16 = sext i32 %10 to i64                                                        ; inst 26
  %17 = getelementptr [800 x i32], [800 x i32]* %0, i32 0, i64 %16                 ; inst 27
  %18 = load i32, i32* %17                                                         ; inst 28
  %19 = sext i32 %15 to i64                                                        ; inst 29
  %20 = getelementptr [800 x i32], [800 x i32]* %1, i32 0, i64 %19                 ; inst 30
  %21 = load i32, i32* %20                                                         ; inst 31
  %22 = icmp ne i32 %18, %21                                                       ; inst 32
  br i1 %22, label %_14.if.then.1, label %_15.if.else.1                            ; inst 33
_14.if.then.1:
  br label %_17.while.exit.1                                                       ; inst 34
_15.if.else.1:
  br label %_16.if.exit.1                                                          ; inst 35
_16.if.exit.1:
  %23 = add i32 %10, 1                                                             ; inst 36
  br label %_9.while.cond.1                                                        ; inst 37
_17.while.exit.1:
  %24 = phi i1 [1, %_22.critical_edge.0], [0, %_14.if.then.1]                      ; inst 38
  br i1 %24, label %_18.if.then.2, label %_19.if.else.2                            ; inst 39
_18.if.then.2:
  %25 = add i32 %6, 1                                                              ; inst 40
  br label %_20.if.exit.2                                                          ; inst 41
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 42
_20.if.exit.2:
  %26 = phi i32 [%25, %_18.if.then.2], [%6, %_19.if.else.2]                        ; inst 43
  %27 = add i32 %5, 1                                                              ; inst 44
  br label %_4.while.cond.0                                                        ; inst 45
_21.while.exit.0:
  ret i32 %6                                                                       ; inst 46
_22.critical_edge.0:
  br label %_17.while.exit.1                                                       ; inst 47
}

