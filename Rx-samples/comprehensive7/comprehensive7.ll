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
  call void @testGraphTraversalAlgorithms()                                        ; inst 2
  call void @testShortestPathAlgorithms()                                          ; inst 3
  call void @testMinimumSpanningTreeAlgorithms()                                   ; inst 4
  call void @testNetworkFlowAlgorithms()                                           ; inst 5
  call void @testGraphConnectivityAlgorithms()                                     ; inst 6
  call void @printlnInt(i32 1799)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @testGraphTraversalAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1701)                                                  ; inst 1
  %0 = alloca [2500 x i32]                                                         ; inst 2
  %1 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 2500                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeGraph([2500 x i32]* %0, i32 50)                             ; inst 12
  %6 = call i32 @depthFirstSearch([2500 x i32]* %0, i32 50, i32 0)                 ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @breadthFirstSearch([2500 x i32]* %0, i32 50, i32 0)               ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @iterativeDepthFirstSearch([2500 x i32]* %0, i32 50, i32 0)        ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @detectCycles([2500 x i32]* %0, i32 50)                            ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  call void @printlnInt(i32 1702)                                                  ; inst 21
  ret void                                                                         ; inst 22
}

define void @initializeGraph([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %3 = mul i32 %1, %1                                                              ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %5                 ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %2, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 11
_4.while.cond.1:
  %8 = phi i32 [0, %_3.while.exit.0], [%36, %_17.while.exit.2]                     ; inst 12
  %9 = icmp slt i32 %8, %1                                                         ; inst 13
  br i1 %9, label %_5.while.body.1, label %_18.while.exit.1                        ; inst 14
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 15
_6.while.cond.2:
  %10 = phi i32 [0, %_5.while.body.1], [%35, %_16.if.exit.0]                       ; inst 16
  %11 = icmp slt i32 %10, %1                                                       ; inst 17
  br i1 %11, label %_7.while.body.2, label %_17.while.exit.2                       ; inst 18
_7.while.body.2:
  %12 = icmp ne i32 %8, %10                                                        ; inst 19
  br i1 %12, label %_8.lazy.then.0, label %_12.lazy.else.0                         ; inst 20
_8.lazy.then.0:
  %13 = add i32 %8, %10                                                            ; inst 21
  %14 = srem i32 %13, 7                                                            ; inst 22
  %15 = icmp eq i32 %14, 0                                                         ; inst 23
  br i1 %15, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 24
_9.lazy.then.1:
  br label %_11.lazy.exit.1                                                        ; inst 25
_10.lazy.else.1:
  %16 = mul i32 %8, %10                                                            ; inst 26
  %17 = srem i32 %16, 11                                                           ; inst 27
  %18 = icmp eq i32 %17, 0                                                         ; inst 28
  br label %_11.lazy.exit.1                                                        ; inst 29
_11.lazy.exit.1:
  %19 = phi i1 [1, %_9.lazy.then.1], [%18, %_10.lazy.else.1]                       ; inst 30
  br label %_13.lazy.exit.0                                                        ; inst 31
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 32
_13.lazy.exit.0:
  %20 = phi i1 [%19, %_11.lazy.exit.1], [0, %_12.lazy.else.0]                      ; inst 33
  br i1 %20, label %_14.if.then.0, label %_15.if.else.0                            ; inst 34
_14.if.then.0:
  %21 = mul i32 %8, %1                                                             ; inst 35
  %22 = add i32 %21, %10                                                           ; inst 36
  %23 = sext i32 %22 to i64                                                        ; inst 37
  %24 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %23               ; inst 38
  %25 = add i32 %8, %10                                                            ; inst 39
  %26 = srem i32 %25, 10                                                           ; inst 40
  %27 = add i32 1, %26                                                             ; inst 41
  store i32 %27, i32* %24                                                          ; inst 42
  %28 = mul i32 %10, %1                                                            ; inst 43
  %29 = add i32 %28, %8                                                            ; inst 44
  %30 = sext i32 %29 to i64                                                        ; inst 45
  %31 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %30               ; inst 46
  %32 = add i32 %8, %10                                                            ; inst 47
  %33 = srem i32 %32, 10                                                           ; inst 48
  %34 = add i32 1, %33                                                             ; inst 49
  store i32 %34, i32* %31                                                          ; inst 50
  br label %_16.if.exit.0                                                          ; inst 51
_15.if.else.0:
  br label %_16.if.exit.0                                                          ; inst 52
_16.if.exit.0:
  %35 = add i32 %10, 1                                                             ; inst 53
  br label %_6.while.cond.2                                                        ; inst 54
_17.while.exit.2:
  %36 = add i32 %8, 1                                                              ; inst 55
  br label %_4.while.cond.1                                                        ; inst 56
_18.while.exit.1:
  ret void                                                                         ; inst 57
}

define i32 @depthFirstSearch([2500 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [50 x i1]                                                            ; inst 1
  %4 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 50                                                         ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i1, i1* %4, i32 %5                                            ; inst 7
  store i1 0, i1* %7                                                               ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = call i32 @dfsRecursive([2500 x i32]* %0, i32 %1, i32 %2, [50 x i1]* %3)     ; inst 11
  ret i32 %9                                                                       ; inst 12
}

define i32 @dfsRecursive([2500 x i32]* %0, i32 %1, i32 %2, [50 x i1]* %3) {
_0.entry.0:
  %4 = sext i32 %2 to i64                                                          ; inst 1
  %5 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %4                       ; inst 2
  store i1 1, i1* %5                                                               ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %6 = phi i32 [1, %_0.entry.0], [%22, %_8.if.exit.0]                              ; inst 5
  %7 = phi i32 [0, %_0.entry.0], [%23, %_8.if.exit.0]                              ; inst 6
  %8 = icmp slt i32 %7, %1                                                         ; inst 7
  br i1 %8, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 8
_2.while.body.0:
  %9 = mul i32 %2, %1                                                              ; inst 9
  %10 = add i32 %9, %7                                                             ; inst 10
  %11 = sext i32 %10 to i64                                                        ; inst 11
  %12 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %11               ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = icmp sgt i32 %13, 0                                                        ; inst 14
  br i1 %14, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 15
_3.lazy.then.0:
  %15 = sext i32 %7 to i64                                                         ; inst 16
  %16 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %15                     ; inst 17
  %17 = load i1, i1* %16                                                           ; inst 18
  %18 = icmp eq i1 %17, 0                                                          ; inst 19
  br label %_5.lazy.exit.0                                                         ; inst 20
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 21
_5.lazy.exit.0:
  %19 = phi i1 [%18, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 22
  br i1 %19, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  %20 = call i32 @dfsRecursive([2500 x i32]* %0, i32 %1, i32 %7, [50 x i1]* %3)    ; inst 24
  %21 = add i32 %6, %20                                                            ; inst 25
  br label %_8.if.exit.0                                                           ; inst 26
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 27
_8.if.exit.0:
  %22 = phi i32 [%21, %_6.if.then.0], [%6, %_7.if.else.0]                          ; inst 28
  %23 = add i32 %7, 1                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_9.while.exit.0:
  ret i32 %6                                                                       ; inst 31
}

define i32 @breadthFirstSearch([2500 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [50 x i1]                                                            ; inst 1
  %4 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 50                                                         ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i1, i1* %4, i32 %5                                            ; inst 7
  store i1 0, i1* %7                                                               ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = alloca [50 x i32]                                                           ; inst 11
  %10 = getelementptr [50 x i32], [50 x i32]* %9, i32 0, i32 0                     ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 14
  %12 = icmp slt i32 %11, 50                                                       ; inst 15
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %13 = getelementptr i32, i32* %10, i32 %11                                       ; inst 17
  store i32 -1, i32* %13                                                           ; inst 18
  %14 = add i32 %11, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %15 = sext i32 0 to i64                                                          ; inst 21
  %16 = getelementptr [50 x i32], [50 x i32]* %9, i32 0, i64 %15                   ; inst 22
  store i32 %2, i32* %16                                                           ; inst 23
  %17 = sext i32 %2 to i64                                                         ; inst 24
  %18 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %17                     ; inst 25
  store i1 1, i1* %18                                                              ; inst 26
  br label %_7.while.cond.0                                                        ; inst 27
_7.while.cond.0:
  %19 = phi i32 [1, %_6.array.exit.1], [%28, %_17.while.exit.1]                    ; inst 28
  %20 = phi i32 [0, %_6.array.exit.1], [%27, %_17.while.exit.1]                    ; inst 29
  %21 = phi i32 [0, %_6.array.exit.1], [%26, %_17.while.exit.1]                    ; inst 30
  %22 = icmp slt i32 %21, %19                                                      ; inst 31
  br i1 %22, label %_8.while.body.0, label %_18.while.exit.0                       ; inst 32
_8.while.body.0:
  %23 = sext i32 %21 to i64                                                        ; inst 33
  %24 = getelementptr [50 x i32], [50 x i32]* %9, i32 0, i64 %23                   ; inst 34
  %25 = load i32, i32* %24                                                         ; inst 35
  %26 = add i32 %21, 1                                                             ; inst 36
  %27 = add i32 %20, 1                                                             ; inst 37
  br label %_9.while.cond.1                                                        ; inst 38
_9.while.cond.1:
  %28 = phi i32 [%19, %_8.while.body.0], [%47, %_16.if.exit.0]                     ; inst 39
  %29 = phi i32 [0, %_8.while.body.0], [%48, %_16.if.exit.0]                       ; inst 40
  %30 = icmp slt i32 %29, %1                                                       ; inst 41
  br i1 %30, label %_10.while.body.1, label %_17.while.exit.1                      ; inst 42
_10.while.body.1:
  %31 = mul i32 %25, %1                                                            ; inst 43
  %32 = add i32 %31, %29                                                           ; inst 44
  %33 = sext i32 %32 to i64                                                        ; inst 45
  %34 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %33               ; inst 46
  %35 = load i32, i32* %34                                                         ; inst 47
  %36 = icmp sgt i32 %35, 0                                                        ; inst 48
  br i1 %36, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 49
_11.lazy.then.0:
  %37 = sext i32 %29 to i64                                                        ; inst 50
  %38 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %37                     ; inst 51
  %39 = load i1, i1* %38                                                           ; inst 52
  %40 = icmp eq i1 %39, 0                                                          ; inst 53
  br label %_13.lazy.exit.0                                                        ; inst 54
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 55
_13.lazy.exit.0:
  %41 = phi i1 [%40, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 56
  br i1 %41, label %_14.if.then.0, label %_15.if.else.0                            ; inst 57
_14.if.then.0:
  %42 = sext i32 %29 to i64                                                        ; inst 58
  %43 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %42                     ; inst 59
  store i1 1, i1* %43                                                              ; inst 60
  %44 = sext i32 %28 to i64                                                        ; inst 61
  %45 = getelementptr [50 x i32], [50 x i32]* %9, i32 0, i64 %44                   ; inst 62
  store i32 %29, i32* %45                                                          ; inst 63
  %46 = add i32 %28, 1                                                             ; inst 64
  br label %_16.if.exit.0                                                          ; inst 65
_15.if.else.0:
  br label %_16.if.exit.0                                                          ; inst 66
_16.if.exit.0:
  %47 = phi i32 [%46, %_14.if.then.0], [%28, %_15.if.else.0]                       ; inst 67
  %48 = add i32 %29, 1                                                             ; inst 68
  br label %_9.while.cond.1                                                        ; inst 69
_17.while.exit.1:
  br label %_7.while.cond.0                                                        ; inst 70
_18.while.exit.0:
  ret i32 %20                                                                      ; inst 71
}

define i32 @iterativeDepthFirstSearch([2500 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [50 x i1]                                                            ; inst 1
  %4 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 50                                                         ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i1, i1* %4, i32 %5                                            ; inst 7
  store i1 0, i1* %7                                                               ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = alloca [1250 x i32]                                                         ; inst 11
  %10 = getelementptr [1250 x i32], [1250 x i32]* %9, i32 0, i32 0                 ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 14
  %12 = icmp slt i32 %11, 1250                                                     ; inst 15
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %13 = getelementptr i32, i32* %10, i32 %11                                       ; inst 17
  store i32 -1, i32* %13                                                           ; inst 18
  %14 = add i32 %11, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %15 = sext i32 0 to i64                                                          ; inst 21
  %16 = getelementptr [1250 x i32], [1250 x i32]* %9, i32 0, i64 %15               ; inst 22
  store i32 %2, i32* %16                                                           ; inst 23
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %17 = phi i32 [0, %_6.array.exit.1], [%50, %_20.if.exit.0]                       ; inst 25
  %18 = phi i32 [1, %_6.array.exit.1], [%51, %_20.if.exit.0]                       ; inst 26
  %19 = icmp sgt i32 %18, 0                                                        ; inst 27
  br i1 %19, label %_8.while.body.0, label %_21.while.exit.0                       ; inst 28
_8.while.body.0:
  %20 = sub i32 %18, 1                                                             ; inst 29
  %21 = sext i32 %20 to i64                                                        ; inst 30
  %22 = getelementptr [1250 x i32], [1250 x i32]* %9, i32 0, i64 %21               ; inst 31
  %23 = load i32, i32* %22                                                         ; inst 32
  %24 = sext i32 %23 to i64                                                        ; inst 33
  %25 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %24                     ; inst 34
  %26 = load i1, i1* %25                                                           ; inst 35
  %27 = icmp eq i1 %26, 0                                                          ; inst 36
  br i1 %27, label %_9.if.then.0, label %_19.if.else.0                             ; inst 37
_9.if.then.0:
  %28 = sext i32 %23 to i64                                                        ; inst 38
  %29 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %28                     ; inst 39
  store i1 1, i1* %29                                                              ; inst 40
  %30 = add i32 %17, 1                                                             ; inst 41
  br label %_10.while.cond.1                                                       ; inst 42
_10.while.cond.1:
  %31 = phi i32 [%20, %_9.if.then.0], [%48, %_17.if.exit.1]                        ; inst 43
  %32 = phi i32 [0, %_9.if.then.0], [%49, %_17.if.exit.1]                          ; inst 44
  %33 = icmp slt i32 %32, %1                                                       ; inst 45
  br i1 %33, label %_11.while.body.1, label %_18.while.exit.1                      ; inst 46
_11.while.body.1:
  %34 = mul i32 %23, %1                                                            ; inst 47
  %35 = add i32 %34, %32                                                           ; inst 48
  %36 = sext i32 %35 to i64                                                        ; inst 49
  %37 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %36               ; inst 50
  %38 = load i32, i32* %37                                                         ; inst 51
  %39 = icmp sgt i32 %38, 0                                                        ; inst 52
  br i1 %39, label %_12.lazy.then.0, label %_13.lazy.else.0                        ; inst 53
_12.lazy.then.0:
  %40 = sext i32 %32 to i64                                                        ; inst 54
  %41 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %40                     ; inst 55
  %42 = load i1, i1* %41                                                           ; inst 56
  %43 = icmp eq i1 %42, 0                                                          ; inst 57
  br label %_14.lazy.exit.0                                                        ; inst 58
_13.lazy.else.0:
  br label %_14.lazy.exit.0                                                        ; inst 59
_14.lazy.exit.0:
  %44 = phi i1 [%43, %_12.lazy.then.0], [0, %_13.lazy.else.0]                      ; inst 60
  br i1 %44, label %_15.if.then.1, label %_16.if.else.1                            ; inst 61
_15.if.then.1:
  %45 = sext i32 %31 to i64                                                        ; inst 62
  %46 = getelementptr [1250 x i32], [1250 x i32]* %9, i32 0, i64 %45               ; inst 63
  store i32 %32, i32* %46                                                          ; inst 64
  %47 = add i32 %31, 1                                                             ; inst 65
  br label %_17.if.exit.1                                                          ; inst 66
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 67
_17.if.exit.1:
  %48 = phi i32 [%47, %_15.if.then.1], [%31, %_16.if.else.1]                       ; inst 68
  %49 = add i32 %32, 1                                                             ; inst 69
  br label %_10.while.cond.1                                                       ; inst 70
_18.while.exit.1:
  br label %_20.if.exit.0                                                          ; inst 71
_19.if.else.0:
  br label %_20.if.exit.0                                                          ; inst 72
_20.if.exit.0:
  %50 = phi i32 [%30, %_18.while.exit.1], [%17, %_19.if.else.0]                    ; inst 73
  %51 = phi i32 [%31, %_18.while.exit.1], [%20, %_19.if.else.0]                    ; inst 74
  br label %_7.while.cond.0                                                        ; inst 75
_21.while.exit.0:
  ret i32 %17                                                                      ; inst 76
}

define i32 @detectCycles([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [50 x i1]                                                            ; inst 1
  %3 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 50                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 7
  store i1 0, i1* %6                                                               ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = alloca [50 x i1]                                                            ; inst 11
  %9 = getelementptr [50 x i1], [50 x i1]* %8, i32 0, i32 0                        ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 50                                                       ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr i1, i1* %9, i32 %10                                          ; inst 17
  store i1 0, i1* %12                                                              ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %14 = phi i32 [0, %_6.array.exit.1], [%25, %_14.if.exit.0]                       ; inst 22
  %15 = phi i32 [0, %_6.array.exit.1], [%24, %_14.if.exit.0]                       ; inst 23
  %16 = icmp slt i32 %14, %1                                                       ; inst 24
  br i1 %16, label %_8.while.body.0, label %_15.while.exit.0                       ; inst 25
_8.while.body.0:
  %17 = sext i32 %14 to i64                                                        ; inst 26
  %18 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %17                     ; inst 27
  %19 = load i1, i1* %18                                                           ; inst 28
  %20 = icmp eq i1 %19, 0                                                          ; inst 29
  br i1 %20, label %_9.if.then.0, label %_13.if.else.0                             ; inst 30
_9.if.then.0:
  %21 = call i1 @dfsCycleDetection([2500 x i32]* %0, i32 %1, i32 %14, [50 x i1]* %2, [50 x i1]* %8) ; inst 31
  br i1 %21, label %_10.if.then.1, label %_11.if.else.1                            ; inst 32
_10.if.then.1:
  %22 = add i32 %15, 1                                                             ; inst 33
  br label %_12.if.exit.1                                                          ; inst 34
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 35
_12.if.exit.1:
  %23 = phi i32 [%22, %_10.if.then.1], [%15, %_11.if.else.1]                       ; inst 36
  br label %_14.if.exit.0                                                          ; inst 37
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 38
_14.if.exit.0:
  %24 = phi i32 [%23, %_12.if.exit.1], [%15, %_13.if.else.0]                       ; inst 39
  %25 = add i32 %14, 1                                                             ; inst 40
  br label %_7.while.cond.0                                                        ; inst 41
_15.while.exit.0:
  ret i32 %15                                                                      ; inst 42
}

define i1 @dfsCycleDetection([2500 x i32]* %0, i32 %1, i32 %2, [50 x i1]* %3, [50 x i1]* %4) {
_0.entry.0:
  %5 = sext i32 %2 to i64                                                          ; inst 1
  %6 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %5                       ; inst 2
  store i1 1, i1* %6                                                               ; inst 3
  %7 = sext i32 %2 to i64                                                          ; inst 4
  %8 = getelementptr [50 x i1], [50 x i1]* %4, i32 0, i64 %7                       ; inst 5
  store i1 1, i1* %8                                                               ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%25, %_14.if.exit.0]                             ; inst 8
  %10 = icmp slt i32 %9, %1                                                        ; inst 9
  br i1 %10, label %_2.while.body.0, label %_15.while.exit.0                       ; inst 10
_2.while.body.0:
  %11 = mul i32 %2, %1                                                             ; inst 11
  %12 = add i32 %11, %9                                                            ; inst 12
  %13 = sext i32 %12 to i64                                                        ; inst 13
  %14 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %13               ; inst 14
  %15 = load i32, i32* %14                                                         ; inst 15
  %16 = icmp sgt i32 %15, 0                                                        ; inst 16
  br i1 %16, label %_3.if.then.0, label %_13.if.else.0                             ; inst 17
_3.if.then.0:
  %17 = sext i32 %9 to i64                                                         ; inst 18
  %18 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %17                     ; inst 19
  %19 = load i1, i1* %18                                                           ; inst 20
  %20 = icmp eq i1 %19, 0                                                          ; inst 21
  br i1 %20, label %_4.if.then.1, label %_8.if.else.1                              ; inst 22
_4.if.then.1:
  %21 = call i1 @dfsCycleDetection([2500 x i32]* %0, i32 %1, i32 %9, [50 x i1]* %3, [50 x i1]* %4) ; inst 23
  br i1 %21, label %_5.if.then.2, label %_6.if.else.2                              ; inst 24
_5.if.then.2:
  ret i1 1                                                                         ; inst 25
_6.if.else.2:
  br label %_7.if.exit.2                                                           ; inst 26
_7.if.exit.2:
  br label %_12.if.exit.1                                                          ; inst 27
_8.if.else.1:
  %22 = sext i32 %9 to i64                                                         ; inst 28
  %23 = getelementptr [50 x i1], [50 x i1]* %4, i32 0, i64 %22                     ; inst 29
  %24 = load i1, i1* %23                                                           ; inst 30
  br i1 %24, label %_9.if.then.3, label %_10.if.else.3                             ; inst 31
_9.if.then.3:
  ret i1 1                                                                         ; inst 32
_10.if.else.3:
  br label %_11.if.exit.3                                                          ; inst 33
_11.if.exit.3:
  br label %_12.if.exit.1                                                          ; inst 34
_12.if.exit.1:
  br label %_14.if.exit.0                                                          ; inst 35
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 36
_14.if.exit.0:
  %25 = add i32 %9, 1                                                              ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_15.while.exit.0:
  %26 = sext i32 %2 to i64                                                         ; inst 39
  %27 = getelementptr [50 x i1], [50 x i1]* %4, i32 0, i64 %26                     ; inst 40
  store i1 0, i1* %27                                                              ; inst 41
  ret i1 0                                                                         ; inst 42
}

define void @testShortestPathAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1703)                                                  ; inst 1
  %0 = alloca [2500 x i32]                                                         ; inst 2
  %1 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 2500                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeWeightedGraph([2500 x i32]* %0, i32 50)                     ; inst 12
  %6 = call i32 @dijkstraShortestPath([2500 x i32]* %0, i32 50, i32 0)             ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @floydWarshallAllPairs([2500 x i32]* %0, i32 20)                   ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @bellmanFordShortestPath([2500 x i32]* %0, i32 50, i32 0)          ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  call void @printlnInt(i32 1704)                                                  ; inst 19
  ret void                                                                         ; inst 20
}

define void @initializeWeightedGraph([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %3 = mul i32 %1, %1                                                              ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %5                 ; inst 7
  store i32 9999, i32* %6                                                          ; inst 8
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
  %13 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %12               ; inst 18
  store i32 0, i32* %13                                                            ; inst 19
  %14 = add i32 %8, 1                                                              ; inst 20
  br label %_4.while.cond.1                                                        ; inst 21
_6.while.exit.1:
  br label %_7.while.cond.2                                                        ; inst 22
_7.while.cond.2:
  %15 = phi i32 [0, %_6.while.exit.1], [%37, %_20.while.exit.3]                    ; inst 23
  %16 = icmp slt i32 %15, %1                                                       ; inst 24
  br i1 %16, label %_8.while.body.2, label %_21.while.exit.2                       ; inst 25
_8.while.body.2:
  br label %_9.while.cond.3                                                        ; inst 26
_9.while.cond.3:
  %17 = phi i32 [0, %_8.while.body.2], [%36, %_19.if.exit.0]                       ; inst 27
  %18 = icmp slt i32 %17, %1                                                       ; inst 28
  br i1 %18, label %_10.while.body.3, label %_20.while.exit.3                      ; inst 29
_10.while.body.3:
  %19 = icmp ne i32 %15, %17                                                       ; inst 30
  br i1 %19, label %_11.lazy.then.0, label %_15.lazy.else.0                        ; inst 31
_11.lazy.then.0:
  %20 = add i32 %15, %17                                                           ; inst 32
  %21 = srem i32 %20, 5                                                            ; inst 33
  %22 = icmp eq i32 %21, 0                                                         ; inst 34
  br i1 %22, label %_12.lazy.then.1, label %_13.lazy.else.1                        ; inst 35
_12.lazy.then.1:
  br label %_14.lazy.exit.1                                                        ; inst 36
_13.lazy.else.1:
  %23 = mul i32 %15, 2                                                             ; inst 37
  %24 = add i32 %23, %17                                                           ; inst 38
  %25 = srem i32 %24, 7                                                            ; inst 39
  %26 = icmp eq i32 %25, 0                                                         ; inst 40
  br label %_14.lazy.exit.1                                                        ; inst 41
_14.lazy.exit.1:
  %27 = phi i1 [1, %_12.lazy.then.1], [%26, %_13.lazy.else.1]                      ; inst 42
  br label %_16.lazy.exit.0                                                        ; inst 43
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 44
_16.lazy.exit.0:
  %28 = phi i1 [%27, %_14.lazy.exit.1], [0, %_15.lazy.else.0]                      ; inst 45
  br i1 %28, label %_17.if.then.0, label %_18.if.else.0                            ; inst 46
_17.if.then.0:
  %29 = add i32 %15, %17                                                           ; inst 47
  %30 = srem i32 %29, 15                                                           ; inst 48
  %31 = add i32 1, %30                                                             ; inst 49
  %32 = mul i32 %15, %1                                                            ; inst 50
  %33 = add i32 %32, %17                                                           ; inst 51
  %34 = sext i32 %33 to i64                                                        ; inst 52
  %35 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %34               ; inst 53
  store i32 %31, i32* %35                                                          ; inst 54
  br label %_19.if.exit.0                                                          ; inst 55
_18.if.else.0:
  br label %_19.if.exit.0                                                          ; inst 56
_19.if.exit.0:
  %36 = add i32 %17, 1                                                             ; inst 57
  br label %_9.while.cond.3                                                        ; inst 58
_20.while.exit.3:
  %37 = add i32 %15, 1                                                             ; inst 59
  br label %_7.while.cond.2                                                        ; inst 60
_21.while.exit.2:
  ret void                                                                         ; inst 61
}

define i32 @dijkstraShortestPath([2500 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [50 x i32]                                                           ; inst 1
  %4 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 50                                                         ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 7
  store i32 9999, i32* %7                                                          ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = alloca [50 x i1]                                                            ; inst 11
  %10 = getelementptr [50 x i1], [50 x i1]* %9, i32 0, i32 0                       ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 14
  %12 = icmp slt i32 %11, 50                                                       ; inst 15
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %13 = getelementptr i1, i1* %10, i32 %11                                         ; inst 17
  store i1 0, i1* %13                                                              ; inst 18
  %14 = add i32 %11, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %15 = sext i32 %2 to i64                                                         ; inst 21
  %16 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %15                   ; inst 22
  store i32 0, i32* %16                                                            ; inst 23
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %17 = phi i32 [0, %_6.array.exit.1], [%75, %_32.while.exit.2]                    ; inst 25
  %18 = phi i32 [0, %_6.array.exit.1], [%45, %_32.while.exit.2]                    ; inst 26
  %19 = icmp slt i32 %17, %1                                                       ; inst 27
  br i1 %19, label %_8.while.body.0, label %_34.critical_edge.0                    ; inst 28
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 29
_9.while.cond.1:
  %20 = phi i32 [0, %_8.while.body.0], [%38, %_16.if.exit.0]                       ; inst 30
  %21 = phi i32 [-1, %_8.while.body.0], [%36, %_16.if.exit.0]                      ; inst 31
  %22 = phi i32 [9999, %_8.while.body.0], [%37, %_16.if.exit.0]                    ; inst 32
  %23 = icmp slt i32 %20, %1                                                       ; inst 33
  br i1 %23, label %_10.while.body.1, label %_17.while.exit.1                      ; inst 34
_10.while.body.1:
  %24 = sext i32 %20 to i64                                                        ; inst 35
  %25 = getelementptr [50 x i1], [50 x i1]* %9, i32 0, i64 %24                     ; inst 36
  %26 = load i1, i1* %25                                                           ; inst 37
  %27 = icmp eq i1 %26, 0                                                          ; inst 38
  br i1 %27, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 39
_11.lazy.then.0:
  %28 = sext i32 %20 to i64                                                        ; inst 40
  %29 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %28                   ; inst 41
  %30 = load i32, i32* %29                                                         ; inst 42
  %31 = icmp slt i32 %30, %22                                                      ; inst 43
  br label %_13.lazy.exit.0                                                        ; inst 44
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 45
_13.lazy.exit.0:
  %32 = phi i1 [%31, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 46
  br i1 %32, label %_14.if.then.0, label %_15.if.else.0                            ; inst 47
_14.if.then.0:
  %33 = sext i32 %20 to i64                                                        ; inst 48
  %34 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %33                   ; inst 49
  %35 = load i32, i32* %34                                                         ; inst 50
  br label %_16.if.exit.0                                                          ; inst 51
_15.if.else.0:
  br label %_16.if.exit.0                                                          ; inst 52
_16.if.exit.0:
  %36 = phi i32 [%20, %_14.if.then.0], [%21, %_15.if.else.0]                       ; inst 53
  %37 = phi i32 [%35, %_14.if.then.0], [%22, %_15.if.else.0]                       ; inst 54
  %38 = add i32 %20, 1                                                             ; inst 55
  br label %_9.while.cond.1                                                        ; inst 56
_17.while.exit.1:
  %39 = icmp eq i32 %21, -1                                                        ; inst 57
  br i1 %39, label %_18.if.then.1, label %_19.if.else.1                            ; inst 58
_18.if.then.1:
  br label %_33.while.exit.0                                                       ; inst 59
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 60
_20.if.exit.1:
  %40 = sext i32 %21 to i64                                                        ; inst 61
  %41 = getelementptr [50 x i1], [50 x i1]* %9, i32 0, i64 %40                     ; inst 62
  store i1 1, i1* %41                                                              ; inst 63
  %42 = sext i32 %21 to i64                                                        ; inst 64
  %43 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %42                   ; inst 65
  %44 = load i32, i32* %43                                                         ; inst 66
  %45 = add i32 %18, %44                                                           ; inst 67
  br label %_21.while.cond.2                                                       ; inst 68
_21.while.cond.2:
  %46 = phi i32 [0, %_20.if.exit.1], [%74, %_31.if.exit.2]                         ; inst 69
  %47 = icmp slt i32 %46, %1                                                       ; inst 70
  br i1 %47, label %_22.while.body.2, label %_32.while.exit.2                      ; inst 71
_22.while.body.2:
  %48 = sext i32 %46 to i64                                                        ; inst 72
  %49 = getelementptr [50 x i1], [50 x i1]* %9, i32 0, i64 %48                     ; inst 73
  %50 = load i1, i1* %49                                                           ; inst 74
  %51 = icmp eq i1 %50, 0                                                          ; inst 75
  br i1 %51, label %_23.lazy.then.1, label %_24.lazy.else.1                        ; inst 76
_23.lazy.then.1:
  %52 = mul i32 %21, %1                                                            ; inst 77
  %53 = add i32 %52, %46                                                           ; inst 78
  %54 = sext i32 %53 to i64                                                        ; inst 79
  %55 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %54               ; inst 80
  %56 = load i32, i32* %55                                                         ; inst 81
  %57 = icmp ne i32 %56, 9999                                                      ; inst 82
  br label %_25.lazy.exit.1                                                        ; inst 83
_24.lazy.else.1:
  br label %_25.lazy.exit.1                                                        ; inst 84
_25.lazy.exit.1:
  %58 = phi i1 [%57, %_23.lazy.then.1], [0, %_24.lazy.else.1]                      ; inst 85
  br i1 %58, label %_26.if.then.2, label %_30.if.else.2                            ; inst 86
_26.if.then.2:
  %59 = sext i32 %21 to i64                                                        ; inst 87
  %60 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %59                   ; inst 88
  %61 = load i32, i32* %60                                                         ; inst 89
  %62 = mul i32 %21, %1                                                            ; inst 90
  %63 = add i32 %62, %46                                                           ; inst 91
  %64 = sext i32 %63 to i64                                                        ; inst 92
  %65 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %64               ; inst 93
  %66 = load i32, i32* %65                                                         ; inst 94
  %67 = add i32 %61, %66                                                           ; inst 95
  %68 = sext i32 %46 to i64                                                        ; inst 96
  %69 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %68                   ; inst 97
  %70 = load i32, i32* %69                                                         ; inst 98
  %71 = icmp slt i32 %67, %70                                                      ; inst 99
  br i1 %71, label %_27.if.then.3, label %_28.if.else.3                            ; inst 100
_27.if.then.3:
  %72 = sext i32 %46 to i64                                                        ; inst 101
  %73 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %72                   ; inst 102
  store i32 %67, i32* %73                                                          ; inst 103
  br label %_29.if.exit.3                                                          ; inst 104
_28.if.else.3:
  br label %_29.if.exit.3                                                          ; inst 105
_29.if.exit.3:
  br label %_31.if.exit.2                                                          ; inst 106
_30.if.else.2:
  br label %_31.if.exit.2                                                          ; inst 107
_31.if.exit.2:
  %74 = add i32 %46, 1                                                             ; inst 108
  br label %_21.while.cond.2                                                       ; inst 109
_32.while.exit.2:
  %75 = add i32 %17, 1                                                             ; inst 110
  br label %_7.while.cond.0                                                        ; inst 111
_33.while.exit.0:
  ret i32 %18                                                                      ; inst 112
_34.critical_edge.0:
  br label %_33.while.exit.0                                                       ; inst 113
}

define i32 @floydWarshallAllPairs([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp sgt i32 %1, 20                                                         ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = phi i32 [20, %_1.if.then.0], [%1, %_2.if.else.0]                            ; inst 5
  %4 = alloca [400 x i32]                                                          ; inst 6
  %5 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i32 0                    ; inst 7
  br label %_4.array.cond.0                                                        ; inst 8
_4.array.cond.0:
  %6 = phi i32 [0, %_3.if.exit.0], [%9, %_5.array.body.0]                          ; inst 9
  %7 = icmp slt i32 %6, 400                                                        ; inst 10
  br i1 %7, label %_5.array.body.0, label %_6.array.exit.0                         ; inst 11
_5.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 12
  store i32 9999, i32* %8                                                          ; inst 13
  %9 = add i32 %6, 1                                                               ; inst 14
  br label %_4.array.cond.0                                                        ; inst 15
_6.array.exit.0:
  br label %_7.while.cond.0                                                        ; inst 16
_7.while.cond.0:
  %10 = phi i32 [0, %_6.array.exit.0], [%24, %_11.while.exit.1]                    ; inst 17
  %11 = icmp slt i32 %10, %3                                                       ; inst 18
  br i1 %11, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 19
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 20
_9.while.cond.1:
  %12 = phi i32 [0, %_8.while.body.0], [%23, %_10.while.body.1]                    ; inst 21
  %13 = icmp slt i32 %12, %3                                                       ; inst 22
  br i1 %13, label %_10.while.body.1, label %_11.while.exit.1                      ; inst 23
_10.while.body.1:
  %14 = mul i32 %10, %3                                                            ; inst 24
  %15 = add i32 %14, %12                                                           ; inst 25
  %16 = sext i32 %15 to i64                                                        ; inst 26
  %17 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %16                 ; inst 27
  %18 = mul i32 %10, %1                                                            ; inst 28
  %19 = add i32 %18, %12                                                           ; inst 29
  %20 = sext i32 %19 to i64                                                        ; inst 30
  %21 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %20               ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  store i32 %22, i32* %17                                                          ; inst 33
  %23 = add i32 %12, 1                                                             ; inst 34
  br label %_9.while.cond.1                                                        ; inst 35
_11.while.exit.1:
  %24 = add i32 %10, 1                                                             ; inst 36
  br label %_7.while.cond.0                                                        ; inst 37
_12.while.exit.0:
  br label %_13.while.cond.2                                                       ; inst 38
_13.while.cond.2:
  %25 = phi i32 [0, %_12.while.exit.0], [%67, %_29.while.exit.3]                   ; inst 39
  %26 = icmp slt i32 %25, %3                                                       ; inst 40
  br i1 %26, label %_14.while.body.2, label %_30.while.exit.2                      ; inst 41
_14.while.body.2:
  br label %_15.while.cond.3                                                       ; inst 42
_15.while.cond.3:
  %27 = phi i32 [0, %_14.while.body.2], [%66, %_28.while.exit.4]                   ; inst 43
  %28 = icmp slt i32 %27, %3                                                       ; inst 44
  br i1 %28, label %_16.while.body.3, label %_29.while.exit.3                      ; inst 45
_16.while.body.3:
  br label %_17.while.cond.4                                                       ; inst 46
_17.while.cond.4:
  %29 = phi i32 [0, %_16.while.body.3], [%65, %_27.if.exit.1]                      ; inst 47
  %30 = icmp slt i32 %29, %3                                                       ; inst 48
  br i1 %30, label %_18.while.body.4, label %_28.while.exit.4                      ; inst 49
_18.while.body.4:
  %31 = mul i32 %27, %3                                                            ; inst 50
  %32 = add i32 %31, %25                                                           ; inst 51
  %33 = sext i32 %32 to i64                                                        ; inst 52
  %34 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %33                 ; inst 53
  %35 = load i32, i32* %34                                                         ; inst 54
  %36 = icmp ne i32 %35, 9999                                                      ; inst 55
  br i1 %36, label %_19.lazy.then.0, label %_20.lazy.else.0                        ; inst 56
_19.lazy.then.0:
  %37 = mul i32 %25, %3                                                            ; inst 57
  %38 = add i32 %37, %29                                                           ; inst 58
  %39 = sext i32 %38 to i64                                                        ; inst 59
  %40 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %39                 ; inst 60
  %41 = load i32, i32* %40                                                         ; inst 61
  %42 = icmp ne i32 %41, 9999                                                      ; inst 62
  br label %_21.lazy.exit.0                                                        ; inst 63
_20.lazy.else.0:
  br label %_21.lazy.exit.0                                                        ; inst 64
_21.lazy.exit.0:
  %43 = phi i1 [%42, %_19.lazy.then.0], [0, %_20.lazy.else.0]                      ; inst 65
  br i1 %43, label %_22.if.then.1, label %_26.if.else.1                            ; inst 66
_22.if.then.1:
  %44 = mul i32 %27, %3                                                            ; inst 67
  %45 = add i32 %44, %25                                                           ; inst 68
  %46 = sext i32 %45 to i64                                                        ; inst 69
  %47 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %46                 ; inst 70
  %48 = load i32, i32* %47                                                         ; inst 71
  %49 = mul i32 %25, %3                                                            ; inst 72
  %50 = add i32 %49, %29                                                           ; inst 73
  %51 = sext i32 %50 to i64                                                        ; inst 74
  %52 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %51                 ; inst 75
  %53 = load i32, i32* %52                                                         ; inst 76
  %54 = add i32 %48, %53                                                           ; inst 77
  %55 = mul i32 %27, %3                                                            ; inst 78
  %56 = add i32 %55, %29                                                           ; inst 79
  %57 = sext i32 %56 to i64                                                        ; inst 80
  %58 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %57                 ; inst 81
  %59 = load i32, i32* %58                                                         ; inst 82
  %60 = icmp slt i32 %54, %59                                                      ; inst 83
  br i1 %60, label %_23.if.then.2, label %_24.if.else.2                            ; inst 84
_23.if.then.2:
  %61 = mul i32 %27, %3                                                            ; inst 85
  %62 = add i32 %61, %29                                                           ; inst 86
  %63 = sext i32 %62 to i64                                                        ; inst 87
  %64 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %63                 ; inst 88
  store i32 %54, i32* %64                                                          ; inst 89
  br label %_25.if.exit.2                                                          ; inst 90
_24.if.else.2:
  br label %_25.if.exit.2                                                          ; inst 91
_25.if.exit.2:
  br label %_27.if.exit.1                                                          ; inst 92
_26.if.else.1:
  br label %_27.if.exit.1                                                          ; inst 93
_27.if.exit.1:
  %65 = add i32 %29, 1                                                             ; inst 94
  br label %_17.while.cond.4                                                       ; inst 95
_28.while.exit.4:
  %66 = add i32 %27, 1                                                             ; inst 96
  br label %_15.while.cond.3                                                       ; inst 97
_29.while.exit.3:
  %67 = add i32 %25, 1                                                             ; inst 98
  br label %_13.while.cond.2                                                       ; inst 99
_30.while.exit.2:
  br label %_31.while.cond.5                                                       ; inst 100
_31.while.cond.5:
  %68 = phi i32 [0, %_30.while.exit.2], [%90, %_41.while.exit.6]                   ; inst 101
  %69 = phi i32 [0, %_30.while.exit.2], [%71, %_41.while.exit.6]                   ; inst 102
  %70 = icmp slt i32 %68, %3                                                       ; inst 103
  br i1 %70, label %_32.while.body.5, label %_42.while.exit.5                      ; inst 104
_32.while.body.5:
  br label %_33.while.cond.6                                                       ; inst 105
_33.while.cond.6:
  %71 = phi i32 [%69, %_32.while.body.5], [%88, %_40.if.exit.3]                    ; inst 106
  %72 = phi i32 [0, %_32.while.body.5], [%89, %_40.if.exit.3]                      ; inst 107
  %73 = icmp slt i32 %72, %3                                                       ; inst 108
  br i1 %73, label %_34.while.body.6, label %_41.while.exit.6                      ; inst 109
_34.while.body.6:
  %74 = icmp ne i32 %68, %72                                                       ; inst 110
  br i1 %74, label %_35.lazy.then.1, label %_36.lazy.else.1                        ; inst 111
_35.lazy.then.1:
  %75 = mul i32 %68, %3                                                            ; inst 112
  %76 = add i32 %75, %72                                                           ; inst 113
  %77 = sext i32 %76 to i64                                                        ; inst 114
  %78 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %77                 ; inst 115
  %79 = load i32, i32* %78                                                         ; inst 116
  %80 = icmp ne i32 %79, 9999                                                      ; inst 117
  br label %_37.lazy.exit.1                                                        ; inst 118
_36.lazy.else.1:
  br label %_37.lazy.exit.1                                                        ; inst 119
_37.lazy.exit.1:
  %81 = phi i1 [%80, %_35.lazy.then.1], [0, %_36.lazy.else.1]                      ; inst 120
  br i1 %81, label %_38.if.then.3, label %_39.if.else.3                            ; inst 121
_38.if.then.3:
  %82 = mul i32 %68, %3                                                            ; inst 122
  %83 = add i32 %82, %72                                                           ; inst 123
  %84 = sext i32 %83 to i64                                                        ; inst 124
  %85 = getelementptr [400 x i32], [400 x i32]* %4, i32 0, i64 %84                 ; inst 125
  %86 = load i32, i32* %85                                                         ; inst 126
  %87 = add i32 %71, %86                                                           ; inst 127
  br label %_40.if.exit.3                                                          ; inst 128
_39.if.else.3:
  br label %_40.if.exit.3                                                          ; inst 129
_40.if.exit.3:
  %88 = phi i32 [%87, %_38.if.then.3], [%71, %_39.if.else.3]                       ; inst 130
  %89 = add i32 %72, 1                                                             ; inst 131
  br label %_33.while.cond.6                                                       ; inst 132
_41.while.exit.6:
  %90 = add i32 %68, 1                                                             ; inst 133
  br label %_31.while.cond.5                                                       ; inst 134
_42.while.exit.5:
  ret i32 %69                                                                      ; inst 135
}

define i32 @bellmanFordShortestPath([2500 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [50 x i32]                                                           ; inst 1
  %4 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 50                                                         ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 7
  store i32 9999, i32* %7                                                          ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = sext i32 %2 to i64                                                          ; inst 11
  %10 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %9                    ; inst 12
  store i32 0, i32* %10                                                            ; inst 13
  br label %_4.while.cond.0                                                        ; inst 14
_4.while.cond.0:
  %11 = phi i32 [0, %_3.array.exit.0], [%16, %_20.while.exit.1]                    ; inst 15
  %12 = phi i32 [0, %_3.array.exit.0], [%50, %_20.while.exit.1]                    ; inst 16
  %13 = sub i32 %1, 1                                                              ; inst 17
  %14 = icmp slt i32 %12, %13                                                      ; inst 18
  br i1 %14, label %_5.while.body.0, label %_21.while.exit.0                       ; inst 19
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 20
_6.while.cond.1:
  %15 = phi i32 [0, %_5.while.body.0], [%49, %_19.while.exit.2]                    ; inst 21
  %16 = phi i32 [%11, %_5.while.body.0], [%18, %_19.while.exit.2]                  ; inst 22
  %17 = icmp slt i32 %15, %1                                                       ; inst 23
  br i1 %17, label %_7.while.body.1, label %_20.while.exit.1                       ; inst 24
_7.while.body.1:
  br label %_8.while.cond.2                                                        ; inst 25
_8.while.cond.2:
  %18 = phi i32 [%16, %_7.while.body.1], [%47, %_18.if.exit.0]                     ; inst 26
  %19 = phi i32 [0, %_7.while.body.1], [%48, %_18.if.exit.0]                       ; inst 27
  %20 = icmp slt i32 %19, %1                                                       ; inst 28
  br i1 %20, label %_9.while.body.2, label %_19.while.exit.2                       ; inst 29
_9.while.body.2:
  %21 = mul i32 %15, %1                                                            ; inst 30
  %22 = add i32 %21, %19                                                           ; inst 31
  %23 = sext i32 %22 to i64                                                        ; inst 32
  %24 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %23               ; inst 33
  %25 = load i32, i32* %24                                                         ; inst 34
  %26 = icmp ne i32 %25, 9999                                                      ; inst 35
  br i1 %26, label %_10.lazy.then.0, label %_11.lazy.else.0                        ; inst 36
_10.lazy.then.0:
  %27 = sext i32 %15 to i64                                                        ; inst 37
  %28 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %27                   ; inst 38
  %29 = load i32, i32* %28                                                         ; inst 39
  %30 = icmp ne i32 %29, 9999                                                      ; inst 40
  br label %_12.lazy.exit.0                                                        ; inst 41
_11.lazy.else.0:
  br label %_12.lazy.exit.0                                                        ; inst 42
_12.lazy.exit.0:
  %31 = phi i1 [%30, %_10.lazy.then.0], [0, %_11.lazy.else.0]                      ; inst 43
  br i1 %31, label %_13.if.then.0, label %_17.if.else.0                            ; inst 44
_13.if.then.0:
  %32 = sext i32 %15 to i64                                                        ; inst 45
  %33 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %32                   ; inst 46
  %34 = load i32, i32* %33                                                         ; inst 47
  %35 = mul i32 %15, %1                                                            ; inst 48
  %36 = add i32 %35, %19                                                           ; inst 49
  %37 = sext i32 %36 to i64                                                        ; inst 50
  %38 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %37               ; inst 51
  %39 = load i32, i32* %38                                                         ; inst 52
  %40 = add i32 %34, %39                                                           ; inst 53
  %41 = sext i32 %19 to i64                                                        ; inst 54
  %42 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %41                   ; inst 55
  %43 = load i32, i32* %42                                                         ; inst 56
  %44 = icmp slt i32 %40, %43                                                      ; inst 57
  br i1 %44, label %_14.if.then.1, label %_15.if.else.1                            ; inst 58
_14.if.then.1:
  %45 = add i32 %18, 1                                                             ; inst 59
  br label %_16.if.exit.1                                                          ; inst 60
_15.if.else.1:
  br label %_16.if.exit.1                                                          ; inst 61
_16.if.exit.1:
  %46 = phi i32 [%45, %_14.if.then.1], [%18, %_15.if.else.1]                       ; inst 62
  br label %_18.if.exit.0                                                          ; inst 63
_17.if.else.0:
  br label %_18.if.exit.0                                                          ; inst 64
_18.if.exit.0:
  %47 = phi i32 [%46, %_16.if.exit.1], [%18, %_17.if.else.0]                       ; inst 65
  %48 = add i32 %19, 1                                                             ; inst 66
  br label %_8.while.cond.2                                                        ; inst 67
_19.while.exit.2:
  %49 = add i32 %15, 1                                                             ; inst 68
  br label %_6.while.cond.1                                                        ; inst 69
_20.while.exit.1:
  %50 = add i32 %12, 1                                                             ; inst 70
  br label %_4.while.cond.0                                                        ; inst 71
_21.while.exit.0:
  br label %_22.while.cond.3                                                       ; inst 72
_22.while.cond.3:
  %51 = phi i32 [0, %_21.while.exit.0], [%85, %_35.while.exit.4]                   ; inst 73
  %52 = phi i32 [%11, %_21.while.exit.0], [%55, %_35.while.exit.4]                 ; inst 74
  %53 = icmp slt i32 %51, %1                                                       ; inst 75
  br i1 %53, label %_23.while.body.3, label %_36.while.exit.3                      ; inst 76
_23.while.body.3:
  br label %_24.while.cond.4                                                       ; inst 77
_24.while.cond.4:
  %54 = phi i32 [0, %_23.while.body.3], [%84, %_34.if.exit.2]                      ; inst 78
  %55 = phi i32 [%52, %_23.while.body.3], [%83, %_34.if.exit.2]                    ; inst 79
  %56 = icmp slt i32 %54, %1                                                       ; inst 80
  br i1 %56, label %_25.while.body.4, label %_35.while.exit.4                      ; inst 81
_25.while.body.4:
  %57 = mul i32 %51, %1                                                            ; inst 82
  %58 = add i32 %57, %54                                                           ; inst 83
  %59 = sext i32 %58 to i64                                                        ; inst 84
  %60 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %59               ; inst 85
  %61 = load i32, i32* %60                                                         ; inst 86
  %62 = icmp ne i32 %61, 9999                                                      ; inst 87
  br i1 %62, label %_26.lazy.then.1, label %_27.lazy.else.1                        ; inst 88
_26.lazy.then.1:
  %63 = sext i32 %51 to i64                                                        ; inst 89
  %64 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %63                   ; inst 90
  %65 = load i32, i32* %64                                                         ; inst 91
  %66 = icmp ne i32 %65, 9999                                                      ; inst 92
  br label %_28.lazy.exit.1                                                        ; inst 93
_27.lazy.else.1:
  br label %_28.lazy.exit.1                                                        ; inst 94
_28.lazy.exit.1:
  %67 = phi i1 [%66, %_26.lazy.then.1], [0, %_27.lazy.else.1]                      ; inst 95
  br i1 %67, label %_29.if.then.2, label %_33.if.else.2                            ; inst 96
_29.if.then.2:
  %68 = sext i32 %51 to i64                                                        ; inst 97
  %69 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %68                   ; inst 98
  %70 = load i32, i32* %69                                                         ; inst 99
  %71 = mul i32 %51, %1                                                            ; inst 100
  %72 = add i32 %71, %54                                                           ; inst 101
  %73 = sext i32 %72 to i64                                                        ; inst 102
  %74 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %73               ; inst 103
  %75 = load i32, i32* %74                                                         ; inst 104
  %76 = add i32 %70, %75                                                           ; inst 105
  %77 = sext i32 %54 to i64                                                        ; inst 106
  %78 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %77                   ; inst 107
  %79 = load i32, i32* %78                                                         ; inst 108
  %80 = icmp slt i32 %76, %79                                                      ; inst 109
  br i1 %80, label %_30.if.then.3, label %_31.if.else.3                            ; inst 110
_30.if.then.3:
  %81 = add i32 %55, 1                                                             ; inst 111
  br label %_32.if.exit.3                                                          ; inst 112
_31.if.else.3:
  br label %_32.if.exit.3                                                          ; inst 113
_32.if.exit.3:
  %82 = phi i32 [%81, %_30.if.then.3], [%55, %_31.if.else.3]                       ; inst 114
  br label %_34.if.exit.2                                                          ; inst 115
_33.if.else.2:
  br label %_34.if.exit.2                                                          ; inst 116
_34.if.exit.2:
  %83 = phi i32 [%82, %_32.if.exit.3], [%55, %_33.if.else.2]                       ; inst 117
  %84 = add i32 %54, 1                                                             ; inst 118
  br label %_24.while.cond.4                                                       ; inst 119
_35.while.exit.4:
  %85 = add i32 %51, 1                                                             ; inst 120
  br label %_22.while.cond.3                                                       ; inst 121
_36.while.exit.3:
  br label %_37.while.cond.5                                                       ; inst 122
_37.while.cond.5:
  %86 = phi i32 [0, %_36.while.exit.3], [%97, %_41.if.exit.4]                      ; inst 123
  %87 = phi i32 [0, %_36.while.exit.3], [%98, %_41.if.exit.4]                      ; inst 124
  %88 = icmp slt i32 %87, %1                                                       ; inst 125
  br i1 %88, label %_38.while.body.5, label %_42.while.exit.5                      ; inst 126
_38.while.body.5:
  %89 = sext i32 %87 to i64                                                        ; inst 127
  %90 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %89                   ; inst 128
  %91 = load i32, i32* %90                                                         ; inst 129
  %92 = icmp ne i32 %91, 9999                                                      ; inst 130
  br i1 %92, label %_39.if.then.4, label %_40.if.else.4                            ; inst 131
_39.if.then.4:
  %93 = sext i32 %87 to i64                                                        ; inst 132
  %94 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %93                   ; inst 133
  %95 = load i32, i32* %94                                                         ; inst 134
  %96 = add i32 %86, %95                                                           ; inst 135
  br label %_41.if.exit.4                                                          ; inst 136
_40.if.else.4:
  br label %_41.if.exit.4                                                          ; inst 137
_41.if.exit.4:
  %97 = phi i32 [%96, %_39.if.then.4], [%86, %_40.if.else.4]                       ; inst 138
  %98 = add i32 %87, 1                                                             ; inst 139
  br label %_37.while.cond.5                                                       ; inst 140
_42.while.exit.5:
  %99 = add i32 %86, %52                                                           ; inst 141
  ret i32 %99                                                                      ; inst 142
}

define void @testMinimumSpanningTreeAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1705)                                                  ; inst 1
  %0 = alloca [2500 x i32]                                                         ; inst 2
  %1 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 2500                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeWeightedGraph([2500 x i32]* %0, i32 50)                     ; inst 12
  %6 = call i32 @kruskalMST([2500 x i32]* %0, i32 50)                              ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @primMST([2500 x i32]* %0, i32 50)                                 ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  call void @printlnInt(i32 1706)                                                  ; inst 17
  ret void                                                                         ; inst 18
}

define i32 @kruskalMST([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [1500 x i32]                                                         ; inst 1
  %3 = getelementptr [1500 x i32], [1500 x i32]* %2, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 1500                                                       ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%51, %_20.while.exit.1]                     ; inst 12
  %9 = phi i32 [0, %_3.array.exit.0], [%14, %_20.while.exit.1]                     ; inst 13
  %10 = icmp slt i32 %8, %1                                                        ; inst 14
  br i1 %10, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 15
_5.lazy.then.0:
  %11 = icmp slt i32 %9, 500                                                       ; inst 16
  br label %_7.lazy.exit.0                                                         ; inst 17
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 18
_7.lazy.exit.0:
  %12 = phi i1 [%11, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 19
  br i1 %12, label %_8.while.body.0, label %_21.while.exit.0                       ; inst 20
_8.while.body.0:
  %13 = add i32 %8, 1                                                              ; inst 21
  br label %_9.while.cond.1                                                        ; inst 22
_9.while.cond.1:
  %14 = phi i32 [%9, %_8.while.body.0], [%49, %_19.if.exit.0]                      ; inst 23
  %15 = phi i32 [%13, %_8.while.body.0], [%50, %_19.if.exit.0]                     ; inst 24
  %16 = icmp slt i32 %15, %1                                                       ; inst 25
  br i1 %16, label %_10.lazy.then.1, label %_11.lazy.else.1                        ; inst 26
_10.lazy.then.1:
  %17 = icmp slt i32 %14, 500                                                      ; inst 27
  br label %_12.lazy.exit.1                                                        ; inst 28
_11.lazy.else.1:
  br label %_12.lazy.exit.1                                                        ; inst 29
_12.lazy.exit.1:
  %18 = phi i1 [%17, %_10.lazy.then.1], [0, %_11.lazy.else.1]                      ; inst 30
  br i1 %18, label %_13.while.body.1, label %_20.while.exit.1                      ; inst 31
_13.while.body.1:
  %19 = mul i32 %8, %1                                                             ; inst 32
  %20 = add i32 %19, %15                                                           ; inst 33
  %21 = sext i32 %20 to i64                                                        ; inst 34
  %22 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %21               ; inst 35
  %23 = load i32, i32* %22                                                         ; inst 36
  %24 = icmp ne i32 %23, 9999                                                      ; inst 37
  br i1 %24, label %_14.lazy.then.2, label %_15.lazy.else.2                        ; inst 38
_14.lazy.then.2:
  %25 = mul i32 %8, %1                                                             ; inst 39
  %26 = add i32 %25, %15                                                           ; inst 40
  %27 = sext i32 %26 to i64                                                        ; inst 41
  %28 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %27               ; inst 42
  %29 = load i32, i32* %28                                                         ; inst 43
  %30 = icmp ne i32 %29, 0                                                         ; inst 44
  br label %_16.lazy.exit.2                                                        ; inst 45
_15.lazy.else.2:
  br label %_16.lazy.exit.2                                                        ; inst 46
_16.lazy.exit.2:
  %31 = phi i1 [%30, %_14.lazy.then.2], [0, %_15.lazy.else.2]                      ; inst 47
  br i1 %31, label %_17.if.then.0, label %_18.if.else.0                            ; inst 48
_17.if.then.0:
  %32 = sext i32 %14 to i64                                                        ; inst 49
  %33 = mul i64 %32, 3                                                             ; inst 50
  %34 = getelementptr [1500 x i32], [1500 x i32]* %2, i32 0, i64 %33               ; inst 51
  %35 = mul i32 %8, %1                                                             ; inst 52
  %36 = add i32 %35, %15                                                           ; inst 53
  %37 = sext i32 %36 to i64                                                        ; inst 54
  %38 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %37               ; inst 55
  %39 = load i32, i32* %38                                                         ; inst 56
  store i32 %39, i32* %34                                                          ; inst 57
  %40 = sext i32 %14 to i64                                                        ; inst 58
  %41 = mul i64 %40, 3                                                             ; inst 59
  %42 = add i64 %41, 1                                                             ; inst 60
  %43 = getelementptr [1500 x i32], [1500 x i32]* %2, i32 0, i64 %42               ; inst 61
  store i32 %8, i32* %43                                                           ; inst 62
  %44 = sext i32 %14 to i64                                                        ; inst 63
  %45 = mul i64 %44, 3                                                             ; inst 64
  %46 = add i64 %45, 2                                                             ; inst 65
  %47 = getelementptr [1500 x i32], [1500 x i32]* %2, i32 0, i64 %46               ; inst 66
  store i32 %15, i32* %47                                                          ; inst 67
  %48 = add i32 %14, 1                                                             ; inst 68
  br label %_19.if.exit.0                                                          ; inst 69
_18.if.else.0:
  br label %_19.if.exit.0                                                          ; inst 70
_19.if.exit.0:
  %49 = phi i32 [%48, %_17.if.then.0], [%14, %_18.if.else.0]                       ; inst 71
  %50 = add i32 %15, 1                                                             ; inst 72
  br label %_9.while.cond.1                                                        ; inst 73
_20.while.exit.1:
  %51 = add i32 %8, 1                                                              ; inst 74
  br label %_4.while.cond.0                                                        ; inst 75
_21.while.exit.0:
  call void @sortEdgesByWeight([1500 x i32]* %2, i32 %9)                           ; inst 76
  br label %_22.while.cond.2                                                       ; inst 77
_22.while.cond.2:
  %52 = phi i32 [0, %_21.while.exit.0], [%78, %_29.if.exit.1]                      ; inst 78
  %53 = phi i32 [0, %_21.while.exit.0], [%76, %_29.if.exit.1]                      ; inst 79
  %54 = phi i32 [0, %_21.while.exit.0], [%77, %_29.if.exit.1]                      ; inst 80
  %55 = icmp slt i32 %52, %9                                                       ; inst 81
  br i1 %55, label %_23.lazy.then.3, label %_24.lazy.else.3                        ; inst 82
_23.lazy.then.3:
  %56 = sub i32 %1, 1                                                              ; inst 83
  %57 = icmp slt i32 %53, %56                                                      ; inst 84
  br label %_25.lazy.exit.3                                                        ; inst 85
_24.lazy.else.3:
  br label %_25.lazy.exit.3                                                        ; inst 86
_25.lazy.exit.3:
  %58 = phi i1 [%57, %_23.lazy.then.3], [0, %_24.lazy.else.3]                      ; inst 87
  br i1 %58, label %_26.while.body.2, label %_30.while.exit.2                      ; inst 88
_26.while.body.2:
  %59 = sext i32 %52 to i64                                                        ; inst 89
  %60 = mul i64 %59, 3                                                             ; inst 90
  %61 = getelementptr [1500 x i32], [1500 x i32]* %2, i32 0, i64 %60               ; inst 91
  %62 = load i32, i32* %61                                                         ; inst 92
  %63 = sext i32 %52 to i64                                                        ; inst 93
  %64 = mul i64 %63, 3                                                             ; inst 94
  %65 = add i64 %64, 1                                                             ; inst 95
  %66 = getelementptr [1500 x i32], [1500 x i32]* %2, i32 0, i64 %65               ; inst 96
  %67 = load i32, i32* %66                                                         ; inst 97
  %68 = sext i32 %52 to i64                                                        ; inst 98
  %69 = mul i64 %68, 3                                                             ; inst 99
  %70 = add i64 %69, 2                                                             ; inst 100
  %71 = getelementptr [1500 x i32], [1500 x i32]* %2, i32 0, i64 %70               ; inst 101
  %72 = load i32, i32* %71                                                         ; inst 102
  %73 = icmp ne i32 %67, %72                                                       ; inst 103
  br i1 %73, label %_27.if.then.1, label %_28.if.else.1                            ; inst 104
_27.if.then.1:
  %74 = add i32 %54, %62                                                           ; inst 105
  %75 = add i32 %53, 1                                                             ; inst 106
  br label %_29.if.exit.1                                                          ; inst 107
_28.if.else.1:
  br label %_29.if.exit.1                                                          ; inst 108
_29.if.exit.1:
  %76 = phi i32 [%75, %_27.if.then.1], [%53, %_28.if.else.1]                       ; inst 109
  %77 = phi i32 [%74, %_27.if.then.1], [%54, %_28.if.else.1]                       ; inst 110
  %78 = add i32 %52, 1                                                             ; inst 111
  br label %_22.while.cond.2                                                       ; inst 112
_30.while.exit.2:
  ret i32 %54                                                                      ; inst 113
}

define void @sortEdgesByWeight([1500 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%76, %_8.while.exit.1]                           ; inst 2
  %3 = sub i32 %1, 1                                                               ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%75, %_7.if.exit.0]                         ; inst 7
  %6 = sub i32 %1, %2                                                              ; inst 8
  %7 = sub i32 %6, 1                                                               ; inst 9
  %8 = icmp slt i32 %5, %7                                                         ; inst 10
  br i1 %8, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 11
_4.while.body.1:
  %9 = sext i32 %5 to i64                                                          ; inst 12
  %10 = mul i64 %9, 3                                                              ; inst 13
  %11 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %10               ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = sext i32 %5 to i64                                                         ; inst 16
  %14 = add i64 %13, 1                                                             ; inst 17
  %15 = mul i64 %14, 3                                                             ; inst 18
  %16 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %15               ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = icmp sgt i32 %12, %17                                                      ; inst 21
  br i1 %18, label %_5.if.then.0, label %_6.if.else.0                              ; inst 22
_5.if.then.0:
  %19 = sext i32 %5 to i64                                                         ; inst 23
  %20 = mul i64 %19, 3                                                             ; inst 24
  %21 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %20               ; inst 25
  %22 = load i32, i32* %21                                                         ; inst 26
  %23 = sext i32 %5 to i64                                                         ; inst 27
  %24 = mul i64 %23, 3                                                             ; inst 28
  %25 = add i64 %24, 1                                                             ; inst 29
  %26 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %25               ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = sext i32 %5 to i64                                                         ; inst 32
  %29 = mul i64 %28, 3                                                             ; inst 33
  %30 = add i64 %29, 2                                                             ; inst 34
  %31 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %30               ; inst 35
  %32 = load i32, i32* %31                                                         ; inst 36
  %33 = sext i32 %5 to i64                                                         ; inst 37
  %34 = mul i64 %33, 3                                                             ; inst 38
  %35 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %34               ; inst 39
  %36 = sext i32 %5 to i64                                                         ; inst 40
  %37 = add i64 %36, 1                                                             ; inst 41
  %38 = mul i64 %37, 3                                                             ; inst 42
  %39 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %38               ; inst 43
  %40 = load i32, i32* %39                                                         ; inst 44
  store i32 %40, i32* %35                                                          ; inst 45
  %41 = sext i32 %5 to i64                                                         ; inst 46
  %42 = mul i64 %41, 3                                                             ; inst 47
  %43 = add i64 %42, 1                                                             ; inst 48
  %44 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %43               ; inst 49
  %45 = sext i32 %5 to i64                                                         ; inst 50
  %46 = add i64 %45, 1                                                             ; inst 51
  %47 = mul i64 %46, 3                                                             ; inst 52
  %48 = add i64 %47, 1                                                             ; inst 53
  %49 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %48               ; inst 54
  %50 = load i32, i32* %49                                                         ; inst 55
  store i32 %50, i32* %44                                                          ; inst 56
  %51 = sext i32 %5 to i64                                                         ; inst 57
  %52 = mul i64 %51, 3                                                             ; inst 58
  %53 = add i64 %52, 2                                                             ; inst 59
  %54 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %53               ; inst 60
  %55 = sext i32 %5 to i64                                                         ; inst 61
  %56 = add i64 %55, 1                                                             ; inst 62
  %57 = mul i64 %56, 3                                                             ; inst 63
  %58 = add i64 %57, 2                                                             ; inst 64
  %59 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %58               ; inst 65
  %60 = load i32, i32* %59                                                         ; inst 66
  store i32 %60, i32* %54                                                          ; inst 67
  %61 = sext i32 %5 to i64                                                         ; inst 68
  %62 = add i64 %61, 1                                                             ; inst 69
  %63 = mul i64 %62, 3                                                             ; inst 70
  %64 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %63               ; inst 71
  store i32 %22, i32* %64                                                          ; inst 72
  %65 = sext i32 %5 to i64                                                         ; inst 73
  %66 = add i64 %65, 1                                                             ; inst 74
  %67 = mul i64 %66, 3                                                             ; inst 75
  %68 = add i64 %67, 1                                                             ; inst 76
  %69 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %68               ; inst 77
  store i32 %27, i32* %69                                                          ; inst 78
  %70 = sext i32 %5 to i64                                                         ; inst 79
  %71 = add i64 %70, 1                                                             ; inst 80
  %72 = mul i64 %71, 3                                                             ; inst 81
  %73 = add i64 %72, 2                                                             ; inst 82
  %74 = getelementptr [1500 x i32], [1500 x i32]* %0, i32 0, i64 %73               ; inst 83
  store i32 %32, i32* %74                                                          ; inst 84
  br label %_7.if.exit.0                                                           ; inst 85
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 86
_7.if.exit.0:
  %75 = add i32 %5, 1                                                              ; inst 87
  br label %_3.while.cond.1                                                        ; inst 88
_8.while.exit.1:
  %76 = add i32 %2, 1                                                              ; inst 89
  br label %_1.while.cond.0                                                        ; inst 90
_9.while.exit.0:
  ret void                                                                         ; inst 91
}

define i32 @primMST([2500 x i32]* %0, i32 %1) {
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
  store i32 9999, i32* %6                                                          ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = alloca [50 x i1]                                                            ; inst 11
  %9 = getelementptr [50 x i1], [50 x i1]* %8, i32 0, i32 0                        ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 50                                                       ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr i1, i1* %9, i32 %10                                          ; inst 17
  store i1 0, i1* %12                                                              ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %14 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 0                     ; inst 21
  store i32 0, i32* %14                                                            ; inst 22
  br label %_7.while.cond.0                                                        ; inst 23
_7.while.cond.0:
  %15 = phi i32 [0, %_6.array.exit.1], [%82, %_35.while.exit.2]                    ; inst 24
  %16 = phi i32 [0, %_6.array.exit.1], [%43, %_35.while.exit.2]                    ; inst 25
  %17 = icmp slt i32 %15, %1                                                       ; inst 26
  br i1 %17, label %_8.while.body.0, label %_37.critical_edge.0                    ; inst 27
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 28
_9.while.cond.1:
  %18 = phi i32 [0, %_8.while.body.0], [%36, %_16.if.exit.0]                       ; inst 29
  %19 = phi i32 [9999, %_8.while.body.0], [%34, %_16.if.exit.0]                    ; inst 30
  %20 = phi i32 [-1, %_8.while.body.0], [%35, %_16.if.exit.0]                      ; inst 31
  %21 = icmp slt i32 %18, %1                                                       ; inst 32
  br i1 %21, label %_10.while.body.1, label %_17.while.exit.1                      ; inst 33
_10.while.body.1:
  %22 = sext i32 %18 to i64                                                        ; inst 34
  %23 = getelementptr [50 x i1], [50 x i1]* %8, i32 0, i64 %22                     ; inst 35
  %24 = load i1, i1* %23                                                           ; inst 36
  %25 = icmp eq i1 %24, 0                                                          ; inst 37
  br i1 %25, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 38
_11.lazy.then.0:
  %26 = sext i32 %18 to i64                                                        ; inst 39
  %27 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %26                   ; inst 40
  %28 = load i32, i32* %27                                                         ; inst 41
  %29 = icmp slt i32 %28, %19                                                      ; inst 42
  br label %_13.lazy.exit.0                                                        ; inst 43
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 44
_13.lazy.exit.0:
  %30 = phi i1 [%29, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 45
  br i1 %30, label %_14.if.then.0, label %_15.if.else.0                            ; inst 46
_14.if.then.0:
  %31 = sext i32 %18 to i64                                                        ; inst 47
  %32 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %31                   ; inst 48
  %33 = load i32, i32* %32                                                         ; inst 49
  br label %_16.if.exit.0                                                          ; inst 50
_15.if.else.0:
  br label %_16.if.exit.0                                                          ; inst 51
_16.if.exit.0:
  %34 = phi i32 [%33, %_14.if.then.0], [%19, %_15.if.else.0]                       ; inst 52
  %35 = phi i32 [%18, %_14.if.then.0], [%20, %_15.if.else.0]                       ; inst 53
  %36 = add i32 %18, 1                                                             ; inst 54
  br label %_9.while.cond.1                                                        ; inst 55
_17.while.exit.1:
  %37 = icmp eq i32 %20, -1                                                        ; inst 56
  br i1 %37, label %_18.if.then.1, label %_19.if.else.1                            ; inst 57
_18.if.then.1:
  br label %_36.while.exit.0                                                       ; inst 58
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 59
_20.if.exit.1:
  %38 = sext i32 %20 to i64                                                        ; inst 60
  %39 = getelementptr [50 x i1], [50 x i1]* %8, i32 0, i64 %38                     ; inst 61
  store i1 1, i1* %39                                                              ; inst 62
  %40 = sext i32 %20 to i64                                                        ; inst 63
  %41 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %40                   ; inst 64
  %42 = load i32, i32* %41                                                         ; inst 65
  %43 = add i32 %16, %42                                                           ; inst 66
  br label %_21.while.cond.2                                                       ; inst 67
_21.while.cond.2:
  %44 = phi i32 [0, %_20.if.exit.1], [%81, %_34.if.exit.2]                         ; inst 68
  %45 = icmp slt i32 %44, %1                                                       ; inst 69
  br i1 %45, label %_22.while.body.2, label %_35.while.exit.2                      ; inst 70
_22.while.body.2:
  %46 = sext i32 %44 to i64                                                        ; inst 71
  %47 = getelementptr [50 x i1], [50 x i1]* %8, i32 0, i64 %46                     ; inst 72
  %48 = load i1, i1* %47                                                           ; inst 73
  %49 = icmp eq i1 %48, 0                                                          ; inst 74
  br i1 %49, label %_23.lazy.then.1, label %_24.lazy.else.1                        ; inst 75
_23.lazy.then.1:
  %50 = mul i32 %20, %1                                                            ; inst 76
  %51 = add i32 %50, %44                                                           ; inst 77
  %52 = sext i32 %51 to i64                                                        ; inst 78
  %53 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %52               ; inst 79
  %54 = load i32, i32* %53                                                         ; inst 80
  %55 = icmp ne i32 %54, 9999                                                      ; inst 81
  br label %_25.lazy.exit.1                                                        ; inst 82
_24.lazy.else.1:
  br label %_25.lazy.exit.1                                                        ; inst 83
_25.lazy.exit.1:
  %56 = phi i1 [%55, %_23.lazy.then.1], [0, %_24.lazy.else.1]                      ; inst 84
  br i1 %56, label %_26.lazy.then.2, label %_27.lazy.else.2                        ; inst 85
_26.lazy.then.2:
  %57 = mul i32 %20, %1                                                            ; inst 86
  %58 = add i32 %57, %44                                                           ; inst 87
  %59 = sext i32 %58 to i64                                                        ; inst 88
  %60 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %59               ; inst 89
  %61 = load i32, i32* %60                                                         ; inst 90
  %62 = icmp ne i32 %61, 0                                                         ; inst 91
  br label %_28.lazy.exit.2                                                        ; inst 92
_27.lazy.else.2:
  br label %_28.lazy.exit.2                                                        ; inst 93
_28.lazy.exit.2:
  %63 = phi i1 [%62, %_26.lazy.then.2], [0, %_27.lazy.else.2]                      ; inst 94
  br i1 %63, label %_29.lazy.then.3, label %_30.lazy.else.3                        ; inst 95
_29.lazy.then.3:
  %64 = mul i32 %20, %1                                                            ; inst 96
  %65 = add i32 %64, %44                                                           ; inst 97
  %66 = sext i32 %65 to i64                                                        ; inst 98
  %67 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %66               ; inst 99
  %68 = load i32, i32* %67                                                         ; inst 100
  %69 = sext i32 %44 to i64                                                        ; inst 101
  %70 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %69                   ; inst 102
  %71 = load i32, i32* %70                                                         ; inst 103
  %72 = icmp slt i32 %68, %71                                                      ; inst 104
  br label %_31.lazy.exit.3                                                        ; inst 105
_30.lazy.else.3:
  br label %_31.lazy.exit.3                                                        ; inst 106
_31.lazy.exit.3:
  %73 = phi i1 [%72, %_29.lazy.then.3], [0, %_30.lazy.else.3]                      ; inst 107
  br i1 %73, label %_32.if.then.2, label %_33.if.else.2                            ; inst 108
_32.if.then.2:
  %74 = sext i32 %44 to i64                                                        ; inst 109
  %75 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %74                   ; inst 110
  %76 = mul i32 %20, %1                                                            ; inst 111
  %77 = add i32 %76, %44                                                           ; inst 112
  %78 = sext i32 %77 to i64                                                        ; inst 113
  %79 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %78               ; inst 114
  %80 = load i32, i32* %79                                                         ; inst 115
  store i32 %80, i32* %75                                                          ; inst 116
  br label %_34.if.exit.2                                                          ; inst 117
_33.if.else.2:
  br label %_34.if.exit.2                                                          ; inst 118
_34.if.exit.2:
  %81 = add i32 %44, 1                                                             ; inst 119
  br label %_21.while.cond.2                                                       ; inst 120
_35.while.exit.2:
  %82 = add i32 %15, 1                                                             ; inst 121
  br label %_7.while.cond.0                                                        ; inst 122
_36.while.exit.0:
  ret i32 %16                                                                      ; inst 123
_37.critical_edge.0:
  br label %_36.while.exit.0                                                       ; inst 124
}

define void @testNetworkFlowAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1707)                                                  ; inst 1
  %0 = alloca [900 x i32]                                                          ; inst 2
  %1 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 900                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeFlowNetwork([900 x i32]* %0, i32 30)                        ; inst 12
  %6 = call i32 @fordFulkersonMaxFlow([900 x i32]* %0, i32 30, i32 0, i32 29)      ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @minCostMaxFlow([900 x i32]* %0, i32 30)                           ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  call void @printlnInt(i32 1708)                                                  ; inst 17
  ret void                                                                         ; inst 18
}

define void @initializeFlowNetwork([900 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %3 = mul i32 %1, %1                                                              ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %5                   ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %2, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 11
_4.while.cond.1:
  %8 = phi i32 [0, %_3.while.exit.0], [%35, %_11.if.exit.1]                        ; inst 12
  %9 = sub i32 %1, 1                                                               ; inst 13
  %10 = icmp slt i32 %8, %9                                                        ; inst 14
  br i1 %10, label %_5.while.body.1, label %_12.while.exit.1                       ; inst 15
_5.while.body.1:
  %11 = mul i32 %8, %1                                                             ; inst 16
  %12 = add i32 %8, 1                                                              ; inst 17
  %13 = add i32 %11, %12                                                           ; inst 18
  %14 = sext i32 %13 to i64                                                        ; inst 19
  %15 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %14                 ; inst 20
  %16 = srem i32 %8, 20                                                            ; inst 21
  %17 = add i32 10, %16                                                            ; inst 22
  store i32 %17, i32* %15                                                          ; inst 23
  %18 = add i32 %8, 5                                                              ; inst 24
  %19 = icmp slt i32 %18, %1                                                       ; inst 25
  br i1 %19, label %_6.if.then.0, label %_7.if.else.0                              ; inst 26
_6.if.then.0:
  %20 = mul i32 %8, %1                                                             ; inst 27
  %21 = add i32 %8, 5                                                              ; inst 28
  %22 = add i32 %20, %21                                                           ; inst 29
  %23 = sext i32 %22 to i64                                                        ; inst 30
  %24 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %23                 ; inst 31
  %25 = srem i32 %8, 10                                                            ; inst 32
  %26 = add i32 5, %25                                                             ; inst 33
  store i32 %26, i32* %24                                                          ; inst 34
  br label %_8.if.exit.0                                                           ; inst 35
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 36
_8.if.exit.0:
  %27 = icmp sgt i32 %8, 5                                                         ; inst 37
  br i1 %27, label %_9.if.then.1, label %_10.if.else.1                             ; inst 38
_9.if.then.1:
  %28 = mul i32 %8, %1                                                             ; inst 39
  %29 = sub i32 %8, 3                                                              ; inst 40
  %30 = add i32 %28, %29                                                           ; inst 41
  %31 = sext i32 %30 to i64                                                        ; inst 42
  %32 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %31                 ; inst 43
  %33 = srem i32 %8, 7                                                             ; inst 44
  %34 = add i32 3, %33                                                             ; inst 45
  store i32 %34, i32* %32                                                          ; inst 46
  br label %_11.if.exit.1                                                          ; inst 47
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 48
_11.if.exit.1:
  %35 = add i32 %8, 1                                                              ; inst 49
  br label %_4.while.cond.1                                                        ; inst 50
_12.while.exit.1:
  ret void                                                                         ; inst 51
}

define i32 @fordFulkersonMaxFlow([900 x i32]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca [900 x i32]                                                          ; inst 1
  %5 = getelementptr [900 x i32], [900 x i32]* %4, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 900                                                        ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 7
  store i32 0, i32* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %10 = phi i32 [0, %_3.array.exit.0], [%18, %_5.while.body.0]                     ; inst 12
  %11 = mul i32 %1, %1                                                             ; inst 13
  %12 = icmp slt i32 %10, %11                                                      ; inst 14
  br i1 %12, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 15
_5.while.body.0:
  %13 = sext i32 %10 to i64                                                        ; inst 16
  %14 = getelementptr [900 x i32], [900 x i32]* %4, i32 0, i64 %13                 ; inst 17
  %15 = sext i32 %10 to i64                                                        ; inst 18
  %16 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %15                 ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  store i32 %17, i32* %14                                                          ; inst 21
  %18 = add i32 %10, 1                                                             ; inst 22
  br label %_4.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 24
_7.while.cond.1:
  %19 = phi i32 [0, %_6.while.exit.0], [%30, %_17.while.exit.2]                    ; inst 25
  %20 = phi i32 [0, %_6.while.exit.0], [%59, %_17.while.exit.2]                    ; inst 26
  %21 = icmp slt i32 %20, 100                                                      ; inst 27
  br i1 %21, label %_8.while.body.1, label %_19.critical_edge.0                    ; inst 28
_8.while.body.1:
  %22 = alloca [30 x i32]                                                          ; inst 29
  %23 = getelementptr [30 x i32], [30 x i32]* %22, i32 0, i32 0                    ; inst 30
  br label %_9.array.cond.1                                                        ; inst 31
_9.array.cond.1:
  %24 = phi i32 [0, %_8.while.body.1], [%27, %_10.array.body.1]                    ; inst 32
  %25 = icmp slt i32 %24, 30                                                       ; inst 33
  br i1 %25, label %_10.array.body.1, label %_11.array.exit.1                      ; inst 34
_10.array.body.1:
  %26 = getelementptr i32, i32* %23, i32 %24                                       ; inst 35
  store i32 -1, i32* %26                                                           ; inst 36
  %27 = add i32 %24, 1                                                             ; inst 37
  br label %_9.array.cond.1                                                        ; inst 38
_11.array.exit.1:
  %28 = call i32 @bfsAugmentingPath([900 x i32]* %4, i32 %1, i32 %2, i32 %3, [30 x i32]* %22) ; inst 39
  %29 = icmp eq i32 %28, 0                                                         ; inst 40
  br i1 %29, label %_12.if.then.0, label %_13.if.else.0                            ; inst 41
_12.if.then.0:
  br label %_18.while.exit.1                                                       ; inst 42
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 43
_14.if.exit.0:
  %30 = add i32 %19, %28                                                           ; inst 44
  br label %_15.while.cond.2                                                       ; inst 45
_15.while.cond.2:
  %31 = phi i32 [%3, %_14.if.exit.0], [%58, %_16.while.body.2]                     ; inst 46
  %32 = icmp ne i32 %31, %2                                                        ; inst 47
  br i1 %32, label %_16.while.body.2, label %_17.while.exit.2                      ; inst 48
_16.while.body.2:
  %33 = sext i32 %31 to i64                                                        ; inst 49
  %34 = getelementptr [30 x i32], [30 x i32]* %22, i32 0, i64 %33                  ; inst 50
  %35 = load i32, i32* %34                                                         ; inst 51
  %36 = mul i32 %35, %1                                                            ; inst 52
  %37 = add i32 %36, %31                                                           ; inst 53
  %38 = sext i32 %37 to i64                                                        ; inst 54
  %39 = getelementptr [900 x i32], [900 x i32]* %4, i32 0, i64 %38                 ; inst 55
  %40 = mul i32 %35, %1                                                            ; inst 56
  %41 = add i32 %40, %31                                                           ; inst 57
  %42 = sext i32 %41 to i64                                                        ; inst 58
  %43 = getelementptr [900 x i32], [900 x i32]* %4, i32 0, i64 %42                 ; inst 59
  %44 = load i32, i32* %43                                                         ; inst 60
  %45 = sub i32 %44, %28                                                           ; inst 61
  store i32 %45, i32* %39                                                          ; inst 62
  %46 = mul i32 %31, %1                                                            ; inst 63
  %47 = add i32 %46, %35                                                           ; inst 64
  %48 = sext i32 %47 to i64                                                        ; inst 65
  %49 = getelementptr [900 x i32], [900 x i32]* %4, i32 0, i64 %48                 ; inst 66
  %50 = mul i32 %31, %1                                                            ; inst 67
  %51 = add i32 %50, %35                                                           ; inst 68
  %52 = sext i32 %51 to i64                                                        ; inst 69
  %53 = getelementptr [900 x i32], [900 x i32]* %4, i32 0, i64 %52                 ; inst 70
  %54 = load i32, i32* %53                                                         ; inst 71
  %55 = add i32 %54, %28                                                           ; inst 72
  store i32 %55, i32* %49                                                          ; inst 73
  %56 = sext i32 %31 to i64                                                        ; inst 74
  %57 = getelementptr [30 x i32], [30 x i32]* %22, i32 0, i64 %56                  ; inst 75
  %58 = load i32, i32* %57                                                         ; inst 76
  br label %_15.while.cond.2                                                       ; inst 77
_17.while.exit.2:
  %59 = add i32 %20, 1                                                             ; inst 78
  br label %_7.while.cond.1                                                        ; inst 79
_18.while.exit.1:
  ret i32 %19                                                                      ; inst 80
_19.critical_edge.0:
  br label %_18.while.exit.1                                                       ; inst 81
}

define i32 @bfsAugmentingPath([900 x i32]* %0, i32 %1, i32 %2, i32 %3, [30 x i32]* %4) {
_0.entry.0:
  %5 = alloca [30 x i1]                                                            ; inst 1
  %6 = getelementptr [30 x i1], [30 x i1]* %5, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 4
  %8 = icmp slt i32 %7, 30                                                         ; inst 5
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %9 = getelementptr i1, i1* %6, i32 %7                                            ; inst 7
  store i1 0, i1* %9                                                               ; inst 8
  %10 = add i32 %7, 1                                                              ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %11 = alloca [30 x i32]                                                          ; inst 11
  %12 = getelementptr [30 x i32], [30 x i32]* %11, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %13 = phi i32 [0, %_3.array.exit.0], [%16, %_5.array.body.1]                     ; inst 14
  %14 = icmp slt i32 %13, 30                                                       ; inst 15
  br i1 %14, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %15 = getelementptr i32, i32* %12, i32 %13                                       ; inst 17
  store i32 -1, i32* %15                                                           ; inst 18
  %16 = add i32 %13, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %17 = sext i32 0 to i64                                                          ; inst 21
  %18 = getelementptr [30 x i32], [30 x i32]* %11, i32 0, i64 %17                  ; inst 22
  store i32 %2, i32* %18                                                           ; inst 23
  %19 = sext i32 %2 to i64                                                         ; inst 24
  %20 = getelementptr [30 x i1], [30 x i1]* %5, i32 0, i64 %19                     ; inst 25
  store i1 1, i1* %20                                                              ; inst 26
  %21 = sext i32 %2 to i64                                                         ; inst 27
  %22 = getelementptr [30 x i32], [30 x i32]* %4, i32 0, i64 %21                   ; inst 28
  store i32 -1, i32* %22                                                           ; inst 29
  br label %_7.while.cond.0                                                        ; inst 30
_7.while.cond.0:
  %23 = phi i32 [0, %_6.array.exit.1], [%29, %_26.while.exit.1]                    ; inst 31
  %24 = phi i32 [1, %_6.array.exit.1], [%31, %_26.while.exit.1]                    ; inst 32
  %25 = icmp slt i32 %23, %24                                                      ; inst 33
  br i1 %25, label %_8.while.body.0, label %_27.while.exit.0                       ; inst 34
_8.while.body.0:
  %26 = sext i32 %23 to i64                                                        ; inst 35
  %27 = getelementptr [30 x i32], [30 x i32]* %11, i32 0, i64 %26                  ; inst 36
  %28 = load i32, i32* %27                                                         ; inst 37
  %29 = add i32 %23, 1                                                             ; inst 38
  br label %_9.while.cond.1                                                        ; inst 39
_9.while.cond.1:
  %30 = phi i32 [0, %_8.while.body.0], [%71, %_25.if.exit.0]                       ; inst 40
  %31 = phi i32 [%24, %_8.while.body.0], [%70, %_25.if.exit.0]                     ; inst 41
  %32 = icmp slt i32 %30, %1                                                       ; inst 42
  br i1 %32, label %_10.while.body.1, label %_26.while.exit.1                      ; inst 43
_10.while.body.1:
  %33 = sext i32 %30 to i64                                                        ; inst 44
  %34 = getelementptr [30 x i1], [30 x i1]* %5, i32 0, i64 %33                     ; inst 45
  %35 = load i1, i1* %34                                                           ; inst 46
  %36 = icmp eq i1 %35, 0                                                          ; inst 47
  br i1 %36, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 48
_11.lazy.then.0:
  %37 = mul i32 %28, %1                                                            ; inst 49
  %38 = add i32 %37, %30                                                           ; inst 50
  %39 = sext i32 %38 to i64                                                        ; inst 51
  %40 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %39                 ; inst 52
  %41 = load i32, i32* %40                                                         ; inst 53
  %42 = icmp sgt i32 %41, 0                                                        ; inst 54
  br label %_13.lazy.exit.0                                                        ; inst 55
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 56
_13.lazy.exit.0:
  %43 = phi i1 [%42, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 57
  br i1 %43, label %_14.if.then.0, label %_24.if.else.0                            ; inst 58
_14.if.then.0:
  %44 = sext i32 %31 to i64                                                        ; inst 59
  %45 = getelementptr [30 x i32], [30 x i32]* %11, i32 0, i64 %44                  ; inst 60
  store i32 %30, i32* %45                                                          ; inst 61
  %46 = add i32 %31, 1                                                             ; inst 62
  %47 = sext i32 %30 to i64                                                        ; inst 63
  %48 = getelementptr [30 x i1], [30 x i1]* %5, i32 0, i64 %47                     ; inst 64
  store i1 1, i1* %48                                                              ; inst 65
  %49 = sext i32 %30 to i64                                                        ; inst 66
  %50 = getelementptr [30 x i32], [30 x i32]* %4, i32 0, i64 %49                   ; inst 67
  store i32 %28, i32* %50                                                          ; inst 68
  %51 = icmp eq i32 %30, %3                                                        ; inst 69
  br i1 %51, label %_15.if.then.1, label %_22.if.else.1                            ; inst 70
_15.if.then.1:
  br label %_16.while.cond.2                                                       ; inst 71
_16.while.cond.2:
  %52 = phi i32 [%3, %_15.if.then.1], [%57, %_20.if.exit.2]                        ; inst 72
  %53 = phi i32 [9999, %_15.if.then.1], [%69, %_20.if.exit.2]                      ; inst 73
  %54 = icmp ne i32 %52, %2                                                        ; inst 74
  br i1 %54, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 75
_17.while.body.2:
  %55 = sext i32 %52 to i64                                                        ; inst 76
  %56 = getelementptr [30 x i32], [30 x i32]* %4, i32 0, i64 %55                   ; inst 77
  %57 = load i32, i32* %56                                                         ; inst 78
  %58 = mul i32 %57, %1                                                            ; inst 79
  %59 = add i32 %58, %52                                                           ; inst 80
  %60 = sext i32 %59 to i64                                                        ; inst 81
  %61 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %60                 ; inst 82
  %62 = load i32, i32* %61                                                         ; inst 83
  %63 = icmp slt i32 %62, %53                                                      ; inst 84
  br i1 %63, label %_18.if.then.2, label %_19.if.else.2                            ; inst 85
_18.if.then.2:
  %64 = mul i32 %57, %1                                                            ; inst 86
  %65 = add i32 %64, %52                                                           ; inst 87
  %66 = sext i32 %65 to i64                                                        ; inst 88
  %67 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %66                 ; inst 89
  %68 = load i32, i32* %67                                                         ; inst 90
  br label %_20.if.exit.2                                                          ; inst 91
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 92
_20.if.exit.2:
  %69 = phi i32 [%68, %_18.if.then.2], [%53, %_19.if.else.2]                       ; inst 93
  br label %_16.while.cond.2                                                       ; inst 94
_21.while.exit.2:
  ret i32 %53                                                                      ; inst 95
_22.if.else.1:
  br label %_23.if.exit.1                                                          ; inst 96
_23.if.exit.1:
  br label %_25.if.exit.0                                                          ; inst 97
_24.if.else.0:
  br label %_25.if.exit.0                                                          ; inst 98
_25.if.exit.0:
  %70 = phi i32 [%46, %_23.if.exit.1], [%31, %_24.if.else.0]                       ; inst 99
  %71 = add i32 %30, 1                                                             ; inst 100
  br label %_9.while.cond.1                                                        ; inst 101
_26.while.exit.1:
  br label %_7.while.cond.0                                                        ; inst 102
_27.while.exit.0:
  ret i32 0                                                                        ; inst 103
}

define i32 @minCostMaxFlow([900 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%36, %_11.while.exit.1]                          ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%7, %_11.while.exit.1]                           ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%8, %_11.while.exit.1]                           ; inst 4
  %5 = icmp slt i32 %2, %1                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%35, %_10.if.exit.0]                        ; inst 8
  %7 = phi i32 [%3, %_2.while.body.0], [%33, %_10.if.exit.0]                       ; inst 9
  %8 = phi i32 [%4, %_2.while.body.0], [%34, %_10.if.exit.0]                       ; inst 10
  %9 = icmp slt i32 %6, %1                                                         ; inst 11
  br i1 %9, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 12
_4.while.body.1:
  %10 = mul i32 %2, %1                                                             ; inst 13
  %11 = add i32 %10, %6                                                            ; inst 14
  %12 = sext i32 %11 to i64                                                        ; inst 15
  %13 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %12                 ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = icmp sgt i32 %14, 0                                                        ; inst 18
  br i1 %15, label %_5.if.then.0, label %_9.if.else.0                              ; inst 19
_5.if.then.0:
  %16 = icmp sgt i32 %2, %6                                                        ; inst 20
  br i1 %16, label %_6.if.then.1, label %_7.if.else.1                              ; inst 21
_6.if.then.1:
  %17 = sub i32 %2, %6                                                             ; inst 22
  br label %_8.if.exit.1                                                           ; inst 23
_7.if.else.1:
  %18 = sub i32 %6, %2                                                             ; inst 24
  br label %_8.if.exit.1                                                           ; inst 25
_8.if.exit.1:
  %19 = phi i32 [%17, %_6.if.then.1], [%18, %_7.if.else.1]                         ; inst 26
  %20 = mul i32 %2, %1                                                             ; inst 27
  %21 = add i32 %20, %6                                                            ; inst 28
  %22 = sext i32 %21 to i64                                                        ; inst 29
  %23 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %22                 ; inst 30
  %24 = load i32, i32* %23                                                         ; inst 31
  %25 = mul i32 %24, %19                                                           ; inst 32
  %26 = add i32 %8, %25                                                            ; inst 33
  %27 = mul i32 %2, %1                                                             ; inst 34
  %28 = add i32 %27, %6                                                            ; inst 35
  %29 = sext i32 %28 to i64                                                        ; inst 36
  %30 = getelementptr [900 x i32], [900 x i32]* %0, i32 0, i64 %29                 ; inst 37
  %31 = load i32, i32* %30                                                         ; inst 38
  %32 = add i32 %7, %31                                                            ; inst 39
  br label %_10.if.exit.0                                                          ; inst 40
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 41
_10.if.exit.0:
  %33 = phi i32 [%32, %_8.if.exit.1], [%7, %_9.if.else.0]                          ; inst 42
  %34 = phi i32 [%26, %_8.if.exit.1], [%8, %_9.if.else.0]                          ; inst 43
  %35 = add i32 %6, 1                                                              ; inst 44
  br label %_3.while.cond.1                                                        ; inst 45
_11.while.exit.1:
  %36 = add i32 %2, 1                                                              ; inst 46
  br label %_1.while.cond.0                                                        ; inst 47
_12.while.exit.0:
  %37 = add i32 %3, 1                                                              ; inst 48
  %38 = sdiv i32 %4, %37                                                           ; inst 49
  ret i32 %38                                                                      ; inst 50
}

define void @testGraphConnectivityAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1709)                                                  ; inst 1
  %0 = alloca [2500 x i32]                                                         ; inst 2
  %1 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 2500                                                       ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeGraph([2500 x i32]* %0, i32 50)                             ; inst 12
  %6 = call i32 @findConnectedComponents([2500 x i32]* %0, i32 50)                 ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @findStronglyConnectedComponents([2500 x i32]* %0, i32 50)         ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @findArticulationPoints([2500 x i32]* %0, i32 50)                  ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @findBridges([2500 x i32]* %0, i32 50)                             ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  call void @printlnInt(i32 1710)                                                  ; inst 21
  ret void                                                                         ; inst 22
}

define i32 @findConnectedComponents([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [50 x i1]                                                            ; inst 1
  %3 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 50                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 7
  store i1 0, i1* %6                                                               ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%16, %_8.if.exit.0]                         ; inst 12
  %9 = phi i32 [0, %_3.array.exit.0], [%17, %_8.if.exit.0]                         ; inst 13
  %10 = icmp slt i32 %9, %1                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 15
_5.while.body.0:
  %11 = sext i32 %9 to i64                                                         ; inst 16
  %12 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %11                     ; inst 17
  %13 = load i1, i1* %12                                                           ; inst 18
  %14 = icmp eq i1 %13, 0                                                          ; inst 19
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  call void @dfsComponentTraversal([2500 x i32]* %0, i32 %1, i32 %9, [50 x i1]* %2) ; inst 21
  %15 = add i32 %8, 1                                                              ; inst 22
  br label %_8.if.exit.0                                                           ; inst 23
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 24
_8.if.exit.0:
  %16 = phi i32 [%15, %_6.if.then.0], [%8, %_7.if.else.0]                          ; inst 25
  %17 = add i32 %9, 1                                                              ; inst 26
  br label %_4.while.cond.0                                                        ; inst 27
_9.while.exit.0:
  ret i32 %8                                                                       ; inst 28
}

define void @dfsComponentTraversal([2500 x i32]* %0, i32 %1, i32 %2, [50 x i1]* %3) {
_0.entry.0:
  %4 = sext i32 %2 to i64                                                          ; inst 1
  %5 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %4                       ; inst 2
  store i1 1, i1* %5                                                               ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%19, %_8.if.exit.0]                              ; inst 5
  %7 = icmp slt i32 %6, %1                                                         ; inst 6
  br i1 %7, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %8 = mul i32 %2, %1                                                              ; inst 8
  %9 = add i32 %8, %6                                                              ; inst 9
  %10 = sext i32 %9 to i64                                                         ; inst 10
  %11 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %10               ; inst 11
  %12 = load i32, i32* %11                                                         ; inst 12
  %13 = icmp sgt i32 %12, 0                                                        ; inst 13
  br i1 %13, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 14
_3.lazy.then.0:
  %14 = sext i32 %6 to i64                                                         ; inst 15
  %15 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %14                     ; inst 16
  %16 = load i1, i1* %15                                                           ; inst 17
  %17 = icmp eq i1 %16, 0                                                          ; inst 18
  br label %_5.lazy.exit.0                                                         ; inst 19
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 20
_5.lazy.exit.0:
  %18 = phi i1 [%17, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 21
  br i1 %18, label %_6.if.then.0, label %_7.if.else.0                              ; inst 22
_6.if.then.0:
  call void @dfsComponentTraversal([2500 x i32]* %0, i32 %1, i32 %6, [50 x i1]* %3) ; inst 23
  br label %_8.if.exit.0                                                           ; inst 24
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 25
_8.if.exit.0:
  %19 = add i32 %6, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_9.while.exit.0:
  ret void                                                                         ; inst 28
}

define i32 @findStronglyConnectedComponents([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [50 x i1]                                                            ; inst 1
  %3 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i32 0                        ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 50                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 7
  store i1 0, i1* %6                                                               ; inst 8
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
  %14 = alloca i32                                                                 ; inst 21
  store i32 0, i32* %14                                                            ; inst 22
  br label %_7.while.cond.0                                                        ; inst 23
_7.while.cond.0:
  %15 = phi i32 [0, %_6.array.exit.1], [%21, %_11.if.exit.0]                       ; inst 24
  %16 = icmp slt i32 %15, %1                                                       ; inst 25
  br i1 %16, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 26
_8.while.body.0:
  %17 = sext i32 %15 to i64                                                        ; inst 27
  %18 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %17                     ; inst 28
  %19 = load i1, i1* %18                                                           ; inst 29
  %20 = icmp eq i1 %19, 0                                                          ; inst 30
  br i1 %20, label %_9.if.then.0, label %_10.if.else.0                             ; inst 31
_9.if.then.0:
  call void @dfsFinishTime([2500 x i32]* %0, i32 %1, i32 %15, [50 x i1]* %2, [50 x i32]* %8, i32* %14) ; inst 32
  br label %_11.if.exit.0                                                          ; inst 33
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 34
_11.if.exit.0:
  %21 = add i32 %15, 1                                                             ; inst 35
  br label %_7.while.cond.0                                                        ; inst 36
_12.while.exit.0:
  %22 = alloca [2500 x i32]                                                        ; inst 37
  %23 = getelementptr [2500 x i32], [2500 x i32]* %22, i32 0, i32 0                ; inst 38
  br label %_13.array.cond.2                                                       ; inst 39
_13.array.cond.2:
  %24 = phi i32 [0, %_12.while.exit.0], [%27, %_14.array.body.2]                   ; inst 40
  %25 = icmp slt i32 %24, 2500                                                     ; inst 41
  br i1 %25, label %_14.array.body.2, label %_15.array.exit.2                      ; inst 42
_14.array.body.2:
  %26 = getelementptr i32, i32* %23, i32 %24                                       ; inst 43
  store i32 0, i32* %26                                                            ; inst 44
  %27 = add i32 %24, 1                                                             ; inst 45
  br label %_13.array.cond.2                                                       ; inst 46
_15.array.exit.2:
  br label %_16.while.cond.1                                                       ; inst 47
_16.while.cond.1:
  %28 = phi i32 [0, %_15.array.exit.2], [%42, %_20.while.exit.2]                   ; inst 48
  %29 = icmp slt i32 %28, %1                                                       ; inst 49
  br i1 %29, label %_17.while.body.1, label %_21.while.exit.1                      ; inst 50
_17.while.body.1:
  br label %_18.while.cond.2                                                       ; inst 51
_18.while.cond.2:
  %30 = phi i32 [0, %_17.while.body.1], [%41, %_19.while.body.2]                   ; inst 52
  %31 = icmp slt i32 %30, %1                                                       ; inst 53
  br i1 %31, label %_19.while.body.2, label %_20.while.exit.2                      ; inst 54
_19.while.body.2:
  %32 = mul i32 %30, %1                                                            ; inst 55
  %33 = add i32 %32, %28                                                           ; inst 56
  %34 = sext i32 %33 to i64                                                        ; inst 57
  %35 = getelementptr [2500 x i32], [2500 x i32]* %22, i32 0, i64 %34              ; inst 58
  %36 = mul i32 %28, %1                                                            ; inst 59
  %37 = add i32 %36, %30                                                           ; inst 60
  %38 = sext i32 %37 to i64                                                        ; inst 61
  %39 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %38               ; inst 62
  %40 = load i32, i32* %39                                                         ; inst 63
  store i32 %40, i32* %35                                                          ; inst 64
  %41 = add i32 %30, 1                                                             ; inst 65
  br label %_18.while.cond.2                                                       ; inst 66
_20.while.exit.2:
  %42 = add i32 %28, 1                                                             ; inst 67
  br label %_16.while.cond.1                                                       ; inst 68
_21.while.exit.1:
  br label %_22.while.cond.3                                                       ; inst 69
_22.while.cond.3:
  %43 = phi i32 [0, %_21.while.exit.1], [%47, %_23.while.body.3]                   ; inst 70
  %44 = icmp slt i32 %43, %1                                                       ; inst 71
  br i1 %44, label %_23.while.body.3, label %_24.while.exit.3                      ; inst 72
_23.while.body.3:
  %45 = sext i32 %43 to i64                                                        ; inst 73
  %46 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %45                     ; inst 74
  store i1 0, i1* %46                                                              ; inst 75
  %47 = add i32 %43, 1                                                             ; inst 76
  br label %_22.while.cond.3                                                       ; inst 77
_24.while.exit.3:
  %48 = load i32, i32* %14                                                         ; inst 78
  %49 = sub i32 %48, 1                                                             ; inst 79
  br label %_25.while.cond.4                                                       ; inst 80
_25.while.cond.4:
  %50 = phi i32 [0, %_24.while.exit.3], [%61, %_29.if.exit.1]                      ; inst 81
  %51 = phi i32 [%49, %_24.while.exit.3], [%62, %_29.if.exit.1]                    ; inst 82
  %52 = icmp sge i32 %51, 0                                                        ; inst 83
  br i1 %52, label %_26.while.body.4, label %_30.while.exit.4                      ; inst 84
_26.while.body.4:
  %53 = sext i32 %51 to i64                                                        ; inst 85
  %54 = getelementptr [50 x i32], [50 x i32]* %8, i32 0, i64 %53                   ; inst 86
  %55 = load i32, i32* %54                                                         ; inst 87
  %56 = sext i32 %55 to i64                                                        ; inst 88
  %57 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %56                     ; inst 89
  %58 = load i1, i1* %57                                                           ; inst 90
  %59 = icmp eq i1 %58, 0                                                          ; inst 91
  br i1 %59, label %_27.if.then.1, label %_28.if.else.1                            ; inst 92
_27.if.then.1:
  call void @dfsComponentTraversal([2500 x i32]* %22, i32 %1, i32 %55, [50 x i1]* %2) ; inst 93
  %60 = add i32 %50, 1                                                             ; inst 94
  br label %_29.if.exit.1                                                          ; inst 95
_28.if.else.1:
  br label %_29.if.exit.1                                                          ; inst 96
_29.if.exit.1:
  %61 = phi i32 [%60, %_27.if.then.1], [%50, %_28.if.else.1]                       ; inst 97
  %62 = sub i32 %51, 1                                                             ; inst 98
  br label %_25.while.cond.4                                                       ; inst 99
_30.while.exit.4:
  ret i32 %50                                                                      ; inst 100
}

define void @dfsFinishTime([2500 x i32]* %0, i32 %1, i32 %2, [50 x i1]* %3, [50 x i32]* %4, i32* %5) {
_0.entry.0:
  %6 = sext i32 %2 to i64                                                          ; inst 1
  %7 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %6                       ; inst 2
  store i1 1, i1* %7                                                               ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.0]                              ; inst 5
  %9 = icmp slt i32 %8, %1                                                         ; inst 6
  br i1 %9, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %10 = mul i32 %2, %1                                                             ; inst 8
  %11 = add i32 %10, %8                                                            ; inst 9
  %12 = sext i32 %11 to i64                                                        ; inst 10
  %13 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %12               ; inst 11
  %14 = load i32, i32* %13                                                         ; inst 12
  %15 = icmp sgt i32 %14, 0                                                        ; inst 13
  br i1 %15, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 14
_3.lazy.then.0:
  %16 = sext i32 %8 to i64                                                         ; inst 15
  %17 = getelementptr [50 x i1], [50 x i1]* %3, i32 0, i64 %16                     ; inst 16
  %18 = load i1, i1* %17                                                           ; inst 17
  %19 = icmp eq i1 %18, 0                                                          ; inst 18
  br label %_5.lazy.exit.0                                                         ; inst 19
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 20
_5.lazy.exit.0:
  %20 = phi i1 [%19, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 21
  br i1 %20, label %_6.if.then.0, label %_7.if.else.0                              ; inst 22
_6.if.then.0:
  call void @dfsFinishTime([2500 x i32]* %0, i32 %1, i32 %8, [50 x i1]* %3, [50 x i32]* %4, i32* %5) ; inst 23
  br label %_8.if.exit.0                                                           ; inst 24
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 25
_8.if.exit.0:
  %21 = add i32 %8, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_9.while.exit.0:
  %22 = load i32, i32* %5                                                          ; inst 28
  %23 = sext i32 %22 to i64                                                        ; inst 29
  %24 = getelementptr [50 x i32], [50 x i32]* %4, i32 0, i64 %23                   ; inst 30
  store i32 %2, i32* %24                                                           ; inst 31
  %25 = load i32, i32* %5                                                          ; inst 32
  %26 = add i32 %25, 1                                                             ; inst 33
  store i32 %26, i32* %5                                                           ; inst 34
  ret void                                                                         ; inst 35
}

define i32 @findArticulationPoints([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%51, %_14.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%50, %_14.if.exit.0]                             ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 5
_2.while.body.0:
  %5 = call i32 @findConnectedComponents([2500 x i32]* %0, i32 %1)                 ; inst 6
  %6 = alloca [50 x i32]                                                           ; inst 7
  %7 = getelementptr [50 x i32], [50 x i32]* %6, i32 0, i32 0                      ; inst 8
  br label %_3.array.cond.0                                                        ; inst 9
_3.array.cond.0:
  %8 = phi i32 [0, %_2.while.body.0], [%11, %_4.array.body.0]                      ; inst 10
  %9 = icmp slt i32 %8, 50                                                         ; inst 11
  br i1 %9, label %_4.array.body.0, label %_5.array.exit.0                         ; inst 12
_4.array.body.0:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 13
  store i32 0, i32* %10                                                            ; inst 14
  %11 = add i32 %8, 1                                                              ; inst 15
  br label %_3.array.cond.0                                                        ; inst 16
_5.array.exit.0:
  br label %_6.while.cond.1                                                        ; inst 17
_6.while.cond.1:
  %12 = phi i32 [0, %_5.array.exit.0], [%29, %_7.while.body.1]                     ; inst 18
  %13 = icmp slt i32 %12, %1                                                       ; inst 19
  br i1 %13, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 20
_7.while.body.1:
  %14 = sext i32 %12 to i64                                                        ; inst 21
  %15 = getelementptr [50 x i32], [50 x i32]* %6, i32 0, i64 %14                   ; inst 22
  %16 = mul i32 %2, %1                                                             ; inst 23
  %17 = add i32 %16, %12                                                           ; inst 24
  %18 = sext i32 %17 to i64                                                        ; inst 25
  %19 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %18               ; inst 26
  %20 = load i32, i32* %19                                                         ; inst 27
  store i32 %20, i32* %15                                                          ; inst 28
  %21 = mul i32 %2, %1                                                             ; inst 29
  %22 = add i32 %21, %12                                                           ; inst 30
  %23 = sext i32 %22 to i64                                                        ; inst 31
  %24 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %23               ; inst 32
  store i32 0, i32* %24                                                            ; inst 33
  %25 = mul i32 %12, %1                                                            ; inst 34
  %26 = add i32 %25, %2                                                            ; inst 35
  %27 = sext i32 %26 to i64                                                        ; inst 36
  %28 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %27               ; inst 37
  store i32 0, i32* %28                                                            ; inst 38
  %29 = add i32 %12, 1                                                             ; inst 39
  br label %_6.while.cond.1                                                        ; inst 40
_8.while.exit.1:
  %30 = call i32 @findConnectedComponents([2500 x i32]* %0, i32 %1)                ; inst 41
  br label %_9.while.cond.2                                                        ; inst 42
_9.while.cond.2:
  %31 = phi i32 [0, %_8.while.exit.1], [%47, %_10.while.body.2]                    ; inst 43
  %32 = icmp slt i32 %31, %1                                                       ; inst 44
  br i1 %32, label %_10.while.body.2, label %_11.while.exit.2                      ; inst 45
_10.while.body.2:
  %33 = mul i32 %2, %1                                                             ; inst 46
  %34 = add i32 %33, %31                                                           ; inst 47
  %35 = sext i32 %34 to i64                                                        ; inst 48
  %36 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %35               ; inst 49
  %37 = sext i32 %31 to i64                                                        ; inst 50
  %38 = getelementptr [50 x i32], [50 x i32]* %6, i32 0, i64 %37                   ; inst 51
  %39 = load i32, i32* %38                                                         ; inst 52
  store i32 %39, i32* %36                                                          ; inst 53
  %40 = mul i32 %31, %1                                                            ; inst 54
  %41 = add i32 %40, %2                                                            ; inst 55
  %42 = sext i32 %41 to i64                                                        ; inst 56
  %43 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %42               ; inst 57
  %44 = sext i32 %31 to i64                                                        ; inst 58
  %45 = getelementptr [50 x i32], [50 x i32]* %6, i32 0, i64 %44                   ; inst 59
  %46 = load i32, i32* %45                                                         ; inst 60
  store i32 %46, i32* %43                                                          ; inst 61
  %47 = add i32 %31, 1                                                             ; inst 62
  br label %_9.while.cond.2                                                        ; inst 63
_11.while.exit.2:
  %48 = icmp sgt i32 %30, %5                                                       ; inst 64
  br i1 %48, label %_12.if.then.0, label %_13.if.else.0                            ; inst 65
_12.if.then.0:
  %49 = add i32 %3, 1                                                              ; inst 66
  br label %_14.if.exit.0                                                          ; inst 67
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 68
_14.if.exit.0:
  %50 = phi i32 [%49, %_12.if.then.0], [%3, %_13.if.else.0]                        ; inst 69
  %51 = add i32 %2, 1                                                              ; inst 70
  br label %_1.while.cond.0                                                        ; inst 71
_15.while.exit.0:
  ret i32 %3                                                                       ; inst 72
}

define i32 @findBridges([2500 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%43, %_11.while.exit.1]                          ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%7, %_11.while.exit.1]                           ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %5 = add i32 %2, 1                                                               ; inst 6
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %6 = phi i32 [%5, %_2.while.body.0], [%42, %_10.if.exit.0]                       ; inst 8
  %7 = phi i32 [%3, %_2.while.body.0], [%41, %_10.if.exit.0]                       ; inst 9
  %8 = icmp slt i32 %6, %1                                                         ; inst 10
  br i1 %8, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 11
_4.while.body.1:
  %9 = mul i32 %2, %1                                                              ; inst 12
  %10 = add i32 %9, %6                                                             ; inst 13
  %11 = sext i32 %10 to i64                                                        ; inst 14
  %12 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %11               ; inst 15
  %13 = load i32, i32* %12                                                         ; inst 16
  %14 = icmp sgt i32 %13, 0                                                        ; inst 17
  br i1 %14, label %_5.if.then.0, label %_9.if.else.0                              ; inst 18
_5.if.then.0:
  %15 = call i32 @findConnectedComponents([2500 x i32]* %0, i32 %1)                ; inst 19
  %16 = mul i32 %2, %1                                                             ; inst 20
  %17 = add i32 %16, %6                                                            ; inst 21
  %18 = sext i32 %17 to i64                                                        ; inst 22
  %19 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %18               ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = mul i32 %2, %1                                                             ; inst 25
  %22 = add i32 %21, %6                                                            ; inst 26
  %23 = sext i32 %22 to i64                                                        ; inst 27
  %24 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %23               ; inst 28
  store i32 0, i32* %24                                                            ; inst 29
  %25 = mul i32 %6, %1                                                             ; inst 30
  %26 = add i32 %25, %2                                                            ; inst 31
  %27 = sext i32 %26 to i64                                                        ; inst 32
  %28 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %27               ; inst 33
  store i32 0, i32* %28                                                            ; inst 34
  %29 = call i32 @findConnectedComponents([2500 x i32]* %0, i32 %1)                ; inst 35
  %30 = mul i32 %2, %1                                                             ; inst 36
  %31 = add i32 %30, %6                                                            ; inst 37
  %32 = sext i32 %31 to i64                                                        ; inst 38
  %33 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %32               ; inst 39
  store i32 %20, i32* %33                                                          ; inst 40
  %34 = mul i32 %6, %1                                                             ; inst 41
  %35 = add i32 %34, %2                                                            ; inst 42
  %36 = sext i32 %35 to i64                                                        ; inst 43
  %37 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %36               ; inst 44
  store i32 %20, i32* %37                                                          ; inst 45
  %38 = icmp sgt i32 %29, %15                                                      ; inst 46
  br i1 %38, label %_6.if.then.1, label %_7.if.else.1                              ; inst 47
_6.if.then.1:
  %39 = add i32 %7, 1                                                              ; inst 48
  br label %_8.if.exit.1                                                           ; inst 49
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 50
_8.if.exit.1:
  %40 = phi i32 [%39, %_6.if.then.1], [%7, %_7.if.else.1]                          ; inst 51
  br label %_10.if.exit.0                                                          ; inst 52
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 53
_10.if.exit.0:
  %41 = phi i32 [%40, %_8.if.exit.1], [%7, %_9.if.else.0]                          ; inst 54
  %42 = add i32 %6, 1                                                              ; inst 55
  br label %_3.while.cond.1                                                        ; inst 56
_11.while.exit.1:
  %43 = add i32 %2, 1                                                              ; inst 57
  br label %_1.while.cond.0                                                        ; inst 58
_12.while.exit.0:
  ret i32 %3                                                                       ; inst 59
}

