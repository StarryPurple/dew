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
  call void @performMemoryPoolOperations()                                         ; inst 2
  call void @performBuddyAllocationTest()                                          ; inst 3
  call void @performGarbageCollectionTest()                                        ; inst 4
  call void @performFragmentationTest()                                            ; inst 5
  call void @testMemoryEdgeCases()                                                 ; inst 6
  call void @printlnInt(i32 1899)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @performMemoryPoolOperations() {
_0.entry.0:
  call void @printlnInt(i32 1801)                                                  ; inst 1
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
  %6 = alloca [100 x i32]                                                          ; inst 12
  %7 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 100                                                        ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  call void @initializeMemoryPool([2000 x i32]* %0, i32 2000)                      ; inst 22
  call void @printlnInt(i32 1802)                                                  ; inst 23
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %12 = phi i32 [8, %_6.array.exit.1], [%26, %_14.if.exit.0]                       ; inst 25
  %13 = phi i32 [0, %_6.array.exit.1], [%24, %_14.if.exit.0]                       ; inst 26
  %14 = phi i32 [0, %_6.array.exit.1], [%25, %_14.if.exit.0]                       ; inst 27
  %15 = icmp sle i32 %12, 64                                                       ; inst 28
  br i1 %15, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 29
_8.lazy.then.0:
  %16 = icmp slt i32 %14, 100                                                      ; inst 30
  br label %_10.lazy.exit.0                                                        ; inst 31
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 32
_10.lazy.exit.0:
  %17 = phi i1 [%16, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 33
  br i1 %17, label %_11.while.body.0, label %_15.while.exit.0                      ; inst 34
_11.while.body.0:
  %18 = call i32 @allocateBlock([2000 x i32]* %0, i32 %13, i32 %12)                ; inst 35
  %19 = icmp ne i32 %18, -1                                                        ; inst 36
  br i1 %19, label %_12.if.then.0, label %_13.if.else.0                            ; inst 37
_12.if.then.0:
  %20 = sext i32 %14 to i64                                                        ; inst 38
  %21 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %20                 ; inst 39
  store i32 %18, i32* %21                                                          ; inst 40
  %22 = add i32 %14, 1                                                             ; inst 41
  %23 = call i32 @findFreeListHead([2000 x i32]* %0, i32 2000)                     ; inst 42
  br label %_14.if.exit.0                                                          ; inst 43
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 44
_14.if.exit.0:
  %24 = phi i32 [%23, %_12.if.then.0], [%13, %_13.if.else.0]                       ; inst 45
  %25 = phi i32 [%22, %_12.if.then.0], [%14, %_13.if.else.0]                       ; inst 46
  %26 = add i32 %12, 8                                                             ; inst 47
  br label %_7.while.cond.0                                                        ; inst 48
_15.while.exit.0:
  call void @printlnInt(i32 %14)                                                   ; inst 49
  call void @printlnInt(i32 1803)                                                  ; inst 50
  br label %_16.while.cond.1                                                       ; inst 51
_16.while.cond.1:
  %27 = phi i32 [0, %_15.while.exit.0], [%39, %_20.if.exit.1]                      ; inst 52
  %28 = phi i32 [0, %_15.while.exit.0], [%38, %_20.if.exit.1]                      ; inst 53
  %29 = icmp slt i32 %27, %14                                                      ; inst 54
  br i1 %29, label %_17.while.body.1, label %_21.while.exit.1                      ; inst 55
_17.while.body.1:
  %30 = srem i32 %27, 3                                                            ; inst 56
  %31 = icmp eq i32 %30, 0                                                         ; inst 57
  br i1 %31, label %_18.if.then.1, label %_19.if.else.1                            ; inst 58
_18.if.then.1:
  %32 = sext i32 %27 to i64                                                        ; inst 59
  %33 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %32                 ; inst 60
  %34 = load i32, i32* %33                                                         ; inst 61
  call void @deallocateBlock([2000 x i32]* %0, i32 %34)                            ; inst 62
  %35 = add i32 %28, 1                                                             ; inst 63
  %36 = sext i32 %27 to i64                                                        ; inst 64
  %37 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %36                 ; inst 65
  store i32 -1, i32* %37                                                           ; inst 66
  br label %_20.if.exit.1                                                          ; inst 67
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 68
_20.if.exit.1:
  %38 = phi i32 [%35, %_18.if.then.1], [%28, %_19.if.else.1]                       ; inst 69
  %39 = add i32 %27, 1                                                             ; inst 70
  br label %_16.while.cond.1                                                       ; inst 71
_21.while.exit.1:
  call void @printlnInt(i32 %28)                                                   ; inst 72
  call void @printlnInt(i32 1804)                                                  ; inst 73
  %40 = call i32 @coalesceAdjacentBlocks([2000 x i32]* %0, i32 2000)               ; inst 74
  call void @printlnInt(i32 %40)                                                   ; inst 75
  call void @printlnInt(i32 1805)                                                  ; inst 76
  br label %_22.while.cond.2                                                       ; inst 77
_22.while.cond.2:
  %41 = phi i32 [16, %_21.while.exit.1], [%53, %_29.if.exit.2]                     ; inst 78
  %42 = phi i32 [0, %_21.while.exit.1], [%51, %_29.if.exit.2]                      ; inst 79
  %43 = phi i32 [%13, %_21.while.exit.1], [%52, %_29.if.exit.2]                    ; inst 80
  %44 = icmp sle i32 %41, 48                                                       ; inst 81
  br i1 %44, label %_23.lazy.then.1, label %_24.lazy.else.1                        ; inst 82
_23.lazy.then.1:
  %45 = icmp slt i32 %42, 20                                                       ; inst 83
  br label %_25.lazy.exit.1                                                        ; inst 84
_24.lazy.else.1:
  br label %_25.lazy.exit.1                                                        ; inst 85
_25.lazy.exit.1:
  %46 = phi i1 [%45, %_23.lazy.then.1], [0, %_24.lazy.else.1]                      ; inst 86
  br i1 %46, label %_26.while.body.2, label %_30.while.exit.2                      ; inst 87
_26.while.body.2:
  %47 = call i32 @allocateBlock([2000 x i32]* %0, i32 %43, i32 %41)                ; inst 88
  %48 = icmp ne i32 %47, -1                                                        ; inst 89
  br i1 %48, label %_27.if.then.2, label %_28.if.else.2                            ; inst 90
_27.if.then.2:
  %49 = add i32 %42, 1                                                             ; inst 91
  %50 = call i32 @findFreeListHead([2000 x i32]* %0, i32 2000)                     ; inst 92
  br label %_29.if.exit.2                                                          ; inst 93
_28.if.else.2:
  br label %_29.if.exit.2                                                          ; inst 94
_29.if.exit.2:
  %51 = phi i32 [%49, %_27.if.then.2], [%42, %_28.if.else.2]                       ; inst 95
  %52 = phi i32 [%50, %_27.if.then.2], [%43, %_28.if.else.2]                       ; inst 96
  %53 = add i32 %41, 4                                                             ; inst 97
  br label %_22.while.cond.2                                                       ; inst 98
_30.while.exit.2:
  call void @printlnInt(i32 %42)                                                   ; inst 99
  call void @printlnInt(i32 1806)                                                  ; inst 100
  %54 = call i32 @analyzeMemoryUtilization([2000 x i32]* %0, i32 2000)             ; inst 101
  call void @printlnInt(i32 %54)                                                   ; inst 102
  ret void                                                                         ; inst 103
}

define void @initializeMemoryPool([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 0                  ; inst 1
  %3 = sub i32 %1, 4                                                               ; inst 2
  store i32 %3, i32* %2                                                            ; inst 3
  %4 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 1                  ; inst 4
  store i32 0, i32* %4                                                             ; inst 5
  %5 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 2                  ; inst 6
  store i32 -1, i32* %5                                                            ; inst 7
  %6 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 3                  ; inst 8
  store i32 -1, i32* %6                                                            ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_1.while.cond.0:
  %7 = phi i32 [4, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 11
  %8 = icmp slt i32 %7, %1                                                         ; inst 12
  br i1 %8, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 13
_2.while.body.0:
  %9 = sext i32 %7 to i64                                                          ; inst 14
  %10 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %9                ; inst 15
  store i32 0, i32* %10                                                            ; inst 16
  %11 = add i32 %7, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_3.while.exit.0:
  ret void                                                                         ; inst 19
}

define i32 @allocateBlock([2000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @alignSize(i32 %2, i32 4)                                          ; inst 1
  %4 = add i32 %3, 4                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i32 [%1, %_0.entry.0], [%28, %_14.if.exit.0]                            ; inst 4
  %6 = icmp ne i32 %5, -1                                                          ; inst 5
  br i1 %6, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %7 = icmp slt i32 %5, 1996                                                       ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %8 = phi i1 [%7, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 10
  br i1 %8, label %_5.while.body.0, label %_15.while.exit.0                        ; inst 11
_5.while.body.0:
  %9 = sext i32 %5 to i64                                                          ; inst 12
  %10 = add i64 %9, 1                                                              ; inst 13
  %11 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %10               ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = icmp eq i32 %12, 0                                                         ; inst 16
  br i1 %13, label %_6.if.then.0, label %_13.if.else.0                             ; inst 17
_6.if.then.0:
  %14 = sext i32 %5 to i64                                                         ; inst 18
  %15 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %14               ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = icmp sge i32 %16, %4                                                       ; inst 21
  br i1 %17, label %_7.if.then.1, label %_11.if.else.1                             ; inst 22
_7.if.then.1:
  %18 = add i32 %4, 8                                                              ; inst 23
  %19 = icmp sgt i32 %16, %18                                                      ; inst 24
  br i1 %19, label %_8.if.then.2, label %_9.if.else.2                              ; inst 25
_8.if.then.2:
  call void @splitBlock([2000 x i32]* %0, i32 %5, i32 %4)                          ; inst 26
  br label %_10.if.exit.2                                                          ; inst 27
_9.if.else.2:
  br label %_10.if.exit.2                                                          ; inst 28
_10.if.exit.2:
  %20 = sext i32 %5 to i64                                                         ; inst 29
  %21 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %20               ; inst 30
  store i32 %3, i32* %21                                                           ; inst 31
  %22 = sext i32 %5 to i64                                                         ; inst 32
  %23 = add i64 %22, 1                                                             ; inst 33
  %24 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %23               ; inst 34
  store i32 1, i32* %24                                                            ; inst 35
  ret i32 %5                                                                       ; inst 36
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 37
_12.if.exit.1:
  br label %_14.if.exit.0                                                          ; inst 38
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 39
_14.if.exit.0:
  %25 = sext i32 %5 to i64                                                         ; inst 40
  %26 = add i64 %25, 2                                                             ; inst 41
  %27 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %26               ; inst 42
  %28 = load i32, i32* %27                                                         ; inst 43
  br label %_1.while.cond.0                                                        ; inst 44
_15.while.exit.0:
  ret i32 -1                                                                       ; inst 45
}

define i32 @alignSize(i32 %0, i32 %1) {
_0.entry.0:
  %2 = add i32 %0, %1                                                              ; inst 1
  %3 = sub i32 %2, 1                                                               ; inst 2
  %4 = sdiv i32 %3, %1                                                             ; inst 3
  %5 = mul i32 %4, %1                                                              ; inst 4
  ret i32 %5                                                                       ; inst 5
}

define void @splitBlock([2000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = sext i32 %1 to i64                                                          ; inst 1
  %4 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %3                 ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = sub i32 %5, %2                                                              ; inst 4
  %7 = icmp sge i32 %6, 8                                                          ; inst 5
  br i1 %7, label %_1.if.then.0, label %_5.if.else.0                               ; inst 6
_1.if.then.0:
  %8 = add i32 %1, %2                                                              ; inst 7
  %9 = sext i32 %8 to i64                                                          ; inst 8
  %10 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %9                ; inst 9
  %11 = sub i32 %6, 4                                                              ; inst 10
  store i32 %11, i32* %10                                                          ; inst 11
  %12 = sext i32 %8 to i64                                                         ; inst 12
  %13 = add i64 %12, 1                                                             ; inst 13
  %14 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %13               ; inst 14
  store i32 0, i32* %14                                                            ; inst 15
  %15 = sext i32 %8 to i64                                                         ; inst 16
  %16 = add i64 %15, 2                                                             ; inst 17
  %17 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %16               ; inst 18
  %18 = sext i32 %1 to i64                                                         ; inst 19
  %19 = add i64 %18, 2                                                             ; inst 20
  %20 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %19               ; inst 21
  %21 = load i32, i32* %20                                                         ; inst 22
  store i32 %21, i32* %17                                                          ; inst 23
  %22 = sext i32 %8 to i64                                                         ; inst 24
  %23 = add i64 %22, 3                                                             ; inst 25
  %24 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %23               ; inst 26
  store i32 %1, i32* %24                                                           ; inst 27
  %25 = sext i32 %1 to i64                                                         ; inst 28
  %26 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %25               ; inst 29
  %27 = sub i32 %2, 4                                                              ; inst 30
  store i32 %27, i32* %26                                                          ; inst 31
  %28 = sext i32 %1 to i64                                                         ; inst 32
  %29 = add i64 %28, 2                                                             ; inst 33
  %30 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %29               ; inst 34
  store i32 %8, i32* %30                                                           ; inst 35
  %31 = sext i32 %8 to i64                                                         ; inst 36
  %32 = add i64 %31, 2                                                             ; inst 37
  %33 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %32               ; inst 38
  %34 = load i32, i32* %33                                                         ; inst 39
  %35 = icmp ne i32 %34, -1                                                        ; inst 40
  br i1 %35, label %_2.if.then.1, label %_3.if.else.1                              ; inst 41
_2.if.then.1:
  %36 = sext i32 %8 to i64                                                         ; inst 42
  %37 = add i64 %36, 2                                                             ; inst 43
  %38 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %37               ; inst 44
  %39 = load i32, i32* %38                                                         ; inst 45
  %40 = sext i32 %39 to i64                                                        ; inst 46
  %41 = add i64 %40, 3                                                             ; inst 47
  %42 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %41               ; inst 48
  store i32 %8, i32* %42                                                           ; inst 49
  br label %_4.if.exit.1                                                           ; inst 50
_3.if.else.1:
  br label %_4.if.exit.1                                                           ; inst 51
_4.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 52
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 53
_6.if.exit.0:
  ret void                                                                         ; inst 54
}

define void @deallocateBlock([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp sge i32 %1, 0                                                          ; inst 1
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  %3 = icmp slt i32 %1, 1996                                                       ; inst 3
  br label %_3.lazy.exit.0                                                         ; inst 4
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %4 = phi i1 [%3, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 6
  br i1 %4, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  %5 = sext i32 %1 to i64                                                          ; inst 8
  %6 = add i64 %5, 1                                                               ; inst 9
  %7 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %6                 ; inst 10
  store i32 0, i32* %7                                                             ; inst 11
  %8 = sext i32 %1 to i64                                                          ; inst 12
  %9 = add i64 %8, 2                                                               ; inst 13
  %10 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %9                ; inst 14
  store i32 -1, i32* %10                                                           ; inst 15
  %11 = sext i32 %1 to i64                                                         ; inst 16
  %12 = add i64 %11, 3                                                             ; inst 17
  %13 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %12               ; inst 18
  store i32 -1, i32* %13                                                           ; inst 19
  br label %_6.if.exit.0                                                           ; inst 20
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 21
_6.if.exit.0:
  ret void                                                                         ; inst 22
}

define i32 @findFreeListHead([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%14, %_5.if.exit.0]                              ; inst 2
  %3 = sub i32 %1, 4                                                               ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = add i64 %5, 1                                                               ; inst 7
  %7 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %6                 ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp eq i32 %8, 0                                                           ; inst 10
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 11
_3.if.then.0:
  ret i32 %2                                                                       ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %10 = sext i32 %2 to i64                                                         ; inst 14
  %11 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %10               ; inst 15
  %12 = load i32, i32* %11                                                         ; inst 16
  %13 = add i32 %12, 4                                                             ; inst 17
  %14 = add i32 %2, %13                                                            ; inst 18
  br label %_1.while.cond.0                                                        ; inst 19
_6.while.exit.0:
  ret i32 -1                                                                       ; inst 20
}

define i32 @coalesceAdjacentBlocks([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%54, %_11.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%55, %_11.if.exit.0]                             ; inst 3
  %4 = sub i32 %1, 8                                                               ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = add i64 %6, 1                                                               ; inst 8
  %8 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %7                 ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = icmp eq i32 %9, 0                                                          ; inst 11
  br i1 %10, label %_3.if.then.0, label %_10.if.else.0                             ; inst 12
_3.if.then.0:
  %11 = sext i32 %2 to i64                                                         ; inst 13
  %12 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %11               ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = add i32 %13, 4                                                             ; inst 16
  %15 = add i32 %2, %14                                                            ; inst 17
  %16 = sub i32 %1, 4                                                              ; inst 18
  %17 = icmp slt i32 %15, %16                                                      ; inst 19
  br i1 %17, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 20
_4.lazy.then.0:
  %18 = sext i32 %15 to i64                                                        ; inst 21
  %19 = add i64 %18, 1                                                             ; inst 22
  %20 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %19               ; inst 23
  %21 = load i32, i32* %20                                                         ; inst 24
  %22 = icmp eq i32 %21, 0                                                         ; inst 25
  br label %_6.lazy.exit.0                                                         ; inst 26
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 27
_6.lazy.exit.0:
  %23 = phi i1 [%22, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 28
  br i1 %23, label %_7.if.then.1, label %_8.if.else.1                              ; inst 29
_7.if.then.1:
  %24 = sext i32 %15 to i64                                                        ; inst 30
  %25 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %24               ; inst 31
  %26 = load i32, i32* %25                                                         ; inst 32
  %27 = add i32 %26, 4                                                             ; inst 33
  %28 = sext i32 %2 to i64                                                         ; inst 34
  %29 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %28               ; inst 35
  %30 = sext i32 %2 to i64                                                         ; inst 36
  %31 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %30               ; inst 37
  %32 = load i32, i32* %31                                                         ; inst 38
  %33 = add i32 %32, %27                                                           ; inst 39
  store i32 %33, i32* %29                                                          ; inst 40
  %34 = sext i32 %15 to i64                                                        ; inst 41
  %35 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %34               ; inst 42
  store i32 0, i32* %35                                                            ; inst 43
  %36 = sext i32 %15 to i64                                                        ; inst 44
  %37 = add i64 %36, 1                                                             ; inst 45
  %38 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %37               ; inst 46
  store i32 -1, i32* %38                                                           ; inst 47
  %39 = sext i32 %15 to i64                                                        ; inst 48
  %40 = add i64 %39, 2                                                             ; inst 49
  %41 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %40               ; inst 50
  store i32 0, i32* %41                                                            ; inst 51
  %42 = sext i32 %15 to i64                                                        ; inst 52
  %43 = add i64 %42, 3                                                             ; inst 53
  %44 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %43               ; inst 54
  store i32 0, i32* %44                                                            ; inst 55
  %45 = add i32 %3, 1                                                              ; inst 56
  br label %_9.if.exit.1                                                           ; inst 57
_8.if.else.1:
  %46 = add i32 %2, %14                                                            ; inst 58
  br label %_9.if.exit.1                                                           ; inst 59
_9.if.exit.1:
  %47 = phi i32 [%2, %_7.if.then.1], [%46, %_8.if.else.1]                          ; inst 60
  %48 = phi i32 [%45, %_7.if.then.1], [%3, %_8.if.else.1]                          ; inst 61
  br label %_11.if.exit.0                                                          ; inst 62
_10.if.else.0:
  %49 = sext i32 %2 to i64                                                         ; inst 63
  %50 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %49               ; inst 64
  %51 = load i32, i32* %50                                                         ; inst 65
  %52 = add i32 %51, 4                                                             ; inst 66
  %53 = add i32 %2, %52                                                            ; inst 67
  br label %_11.if.exit.0                                                          ; inst 68
_11.if.exit.0:
  %54 = phi i32 [%47, %_9.if.exit.1], [%53, %_10.if.else.0]                        ; inst 69
  %55 = phi i32 [%48, %_9.if.exit.1], [%3, %_10.if.else.0]                         ; inst 70
  br label %_1.while.cond.0                                                        ; inst 71
_12.while.exit.0:
  ret i32 %3                                                                       ; inst 72
}

define i32 @analyzeMemoryUtilization([2000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%30, %_8.if.exit.0]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%31, %_8.if.exit.0]                              ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%32, %_8.if.exit.0]                              ; inst 4
  %5 = sub i32 %1, 4                                                               ; inst 5
  %6 = icmp slt i32 %4, %5                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = sext i32 %4 to i64                                                          ; inst 8
  %8 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %7                 ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = add i32 %9, 4                                                              ; inst 11
  %11 = sext i32 %4 to i64                                                         ; inst 12
  %12 = add i64 %11, 1                                                             ; inst 13
  %13 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %12               ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = icmp eq i32 %14, 0                                                         ; inst 16
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  %16 = sext i32 %4 to i64                                                         ; inst 18
  %17 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %16               ; inst 19
  %18 = load i32, i32* %17                                                         ; inst 20
  %19 = add i32 %3, %18                                                            ; inst 21
  br label %_8.if.exit.0                                                           ; inst 22
_4.if.else.0:
  %20 = sext i32 %4 to i64                                                         ; inst 23
  %21 = add i64 %20, 1                                                             ; inst 24
  %22 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %21               ; inst 25
  %23 = load i32, i32* %22                                                         ; inst 26
  %24 = icmp eq i32 %23, 1                                                         ; inst 27
  br i1 %24, label %_5.if.then.1, label %_6.if.else.1                              ; inst 28
_5.if.then.1:
  %25 = sext i32 %4 to i64                                                         ; inst 29
  %26 = getelementptr [2000 x i32], [2000 x i32]* %0, i32 0, i64 %25               ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = add i32 %2, %27                                                            ; inst 32
  br label %_7.if.exit.1                                                           ; inst 33
_6.if.else.1:
  br label %_7.if.exit.1                                                           ; inst 34
_7.if.exit.1:
  %29 = phi i32 [%28, %_5.if.then.1], [%2, %_6.if.else.1]                          ; inst 35
  br label %_8.if.exit.0                                                           ; inst 36
_8.if.exit.0:
  %30 = phi i32 [%2, %_3.if.then.0], [%29, %_7.if.exit.1]                          ; inst 37
  %31 = phi i32 [%19, %_3.if.then.0], [%3, %_7.if.exit.1]                          ; inst 38
  %32 = add i32 %4, %10                                                            ; inst 39
  br label %_1.while.cond.0                                                        ; inst 40
_9.while.exit.0:
  %33 = add i32 %2, %3                                                             ; inst 41
  %34 = icmp sgt i32 %33, 0                                                        ; inst 42
  br i1 %34, label %_10.if.then.2, label %_11.if.else.2                            ; inst 43
_10.if.then.2:
  %35 = mul i32 %2, 100                                                            ; inst 44
  %36 = sdiv i32 %35, %33                                                          ; inst 45
  ret i32 %36                                                                      ; inst 46
_11.if.else.2:
  ret i32 0                                                                        ; inst 47
_12.if.exit.2:
  unreachable                                                                      ; inst 48
}

define void @performBuddyAllocationTest() {
_0.entry.0:
  call void @printlnInt(i32 1810)                                                  ; inst 1
  %0 = alloca [512 x i32]                                                          ; inst 2
  %1 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 512                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %6 = alloca [100 x i32]                                                          ; inst 12
  %7 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 100                                                        ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  call void @initializeBuddySystem([512 x i32]* %0, i32 8)                         ; inst 22
  call void @printlnInt(i32 1811)                                                  ; inst 23
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %12 = phi i32 [1, %_6.array.exit.1], [%23, %_14.if.exit.0]                       ; inst 25
  %13 = phi i32 [0, %_6.array.exit.1], [%22, %_14.if.exit.0]                       ; inst 26
  %14 = icmp sle i32 %12, 64                                                       ; inst 27
  br i1 %14, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 28
_8.lazy.then.0:
  %15 = icmp slt i32 %13, 100                                                      ; inst 29
  br label %_10.lazy.exit.0                                                        ; inst 30
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 31
_10.lazy.exit.0:
  %16 = phi i1 [%15, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 32
  br i1 %16, label %_11.while.body.0, label %_15.while.exit.0                      ; inst 33
_11.while.body.0:
  %17 = call i32 @buddyAllocate([512 x i32]* %0, i32 8, i32 %12)                   ; inst 34
  %18 = icmp ne i32 %17, -1                                                        ; inst 35
  br i1 %18, label %_12.if.then.0, label %_13.if.else.0                            ; inst 36
_12.if.then.0:
  %19 = sext i32 %13 to i64                                                        ; inst 37
  %20 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %19                 ; inst 38
  store i32 %17, i32* %20                                                          ; inst 39
  %21 = add i32 %13, 1                                                             ; inst 40
  br label %_14.if.exit.0                                                          ; inst 41
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 42
_14.if.exit.0:
  %22 = phi i32 [%21, %_12.if.then.0], [%13, %_13.if.else.0]                       ; inst 43
  %23 = mul i32 %12, 2                                                             ; inst 44
  br label %_7.while.cond.0                                                        ; inst 45
_15.while.exit.0:
  call void @printlnInt(i32 %13)                                                   ; inst 46
  call void @printlnInt(i32 1812)                                                  ; inst 47
  br label %_16.while.cond.1                                                       ; inst 48
_16.while.cond.1:
  %24 = phi i32 [0, %_15.while.exit.0], [%36, %_20.if.exit.1]                      ; inst 49
  %25 = phi i32 [0, %_15.while.exit.0], [%35, %_20.if.exit.1]                      ; inst 50
  %26 = icmp slt i32 %24, %13                                                      ; inst 51
  br i1 %26, label %_17.while.body.1, label %_21.while.exit.1                      ; inst 52
_17.while.body.1:
  %27 = srem i32 %24, 2                                                            ; inst 53
  %28 = icmp eq i32 %27, 0                                                         ; inst 54
  br i1 %28, label %_18.if.then.1, label %_19.if.else.1                            ; inst 55
_18.if.then.1:
  %29 = sext i32 %24 to i64                                                        ; inst 56
  %30 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %29                 ; inst 57
  %31 = load i32, i32* %30                                                         ; inst 58
  call void @buddyDeallocate([512 x i32]* %0, i32 8, i32 %31)                      ; inst 59
  %32 = add i32 %25, 1                                                             ; inst 60
  %33 = sext i32 %24 to i64                                                        ; inst 61
  %34 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %33                 ; inst 62
  store i32 -1, i32* %34                                                           ; inst 63
  br label %_20.if.exit.1                                                          ; inst 64
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 65
_20.if.exit.1:
  %35 = phi i32 [%32, %_18.if.then.1], [%25, %_19.if.else.1]                       ; inst 66
  %36 = add i32 %24, 1                                                             ; inst 67
  br label %_16.while.cond.1                                                       ; inst 68
_21.while.exit.1:
  call void @printlnInt(i32 %25)                                                   ; inst 69
  call void @printlnInt(i32 1813)                                                  ; inst 70
  br label %_22.while.cond.2                                                       ; inst 71
_22.while.cond.2:
  %37 = phi i32 [0, %_21.while.exit.1], [%45, %_29.if.exit.2]                      ; inst 72
  %38 = phi i32 [8, %_21.while.exit.1], [%46, %_29.if.exit.2]                      ; inst 73
  %39 = icmp sle i32 %38, 32                                                       ; inst 74
  br i1 %39, label %_23.lazy.then.1, label %_24.lazy.else.1                        ; inst 75
_23.lazy.then.1:
  %40 = icmp slt i32 %37, 10                                                       ; inst 76
  br label %_25.lazy.exit.1                                                        ; inst 77
_24.lazy.else.1:
  br label %_25.lazy.exit.1                                                        ; inst 78
_25.lazy.exit.1:
  %41 = phi i1 [%40, %_23.lazy.then.1], [0, %_24.lazy.else.1]                      ; inst 79
  br i1 %41, label %_26.while.body.2, label %_30.while.exit.2                      ; inst 80
_26.while.body.2:
  %42 = call i32 @buddyAllocate([512 x i32]* %0, i32 8, i32 %38)                   ; inst 81
  %43 = icmp ne i32 %42, -1                                                        ; inst 82
  br i1 %43, label %_27.if.then.2, label %_28.if.else.2                            ; inst 83
_27.if.then.2:
  %44 = add i32 %37, 1                                                             ; inst 84
  br label %_29.if.exit.2                                                          ; inst 85
_28.if.else.2:
  br label %_29.if.exit.2                                                          ; inst 86
_29.if.exit.2:
  %45 = phi i32 [%44, %_27.if.then.2], [%37, %_28.if.else.2]                       ; inst 87
  %46 = add i32 %38, 8                                                             ; inst 88
  br label %_22.while.cond.2                                                       ; inst 89
_30.while.exit.2:
  call void @printlnInt(i32 %37)                                                   ; inst 90
  call void @printlnInt(i32 1814)                                                  ; inst 91
  %47 = call i32 @analyzeBuddyFragmentation([512 x i32]* %0, i32 8)                ; inst 92
  call void @printlnInt(i32 %47)                                                   ; inst 93
  ret void                                                                         ; inst 94
}

define void @initializeBuddySystem([512 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = shl i32 1, %1                                                               ; inst 1
  %3 = sub i32 %2, 1                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, %3                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = sext i32 %4 to i64                                                          ; inst 7
  %7 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %6                   ; inst 8
  store i32 0, i32* %7                                                             ; inst 9
  %8 = add i32 %4, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret void                                                                         ; inst 12
}

define i32 @buddyAllocate([512 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @calculateRequiredLevel(i32 %2, i32 %1)                            ; inst 1
  %4 = icmp slt i32 %3, 0                                                          ; inst 2
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i32 -1                                                                       ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %5 = call i32 @findFreeNode([512 x i32]* %0, i32 0, i32 0, i32 %3, i32 %1)       ; inst 6
  %6 = icmp ne i32 %5, -1                                                          ; inst 7
  br i1 %6, label %_4.if.then.1, label %_5.if.else.1                               ; inst 8
_4.if.then.1:
  call void @markNodeAsAllocated([512 x i32]* %0, i32 %5, i32 %3, i32 %1)          ; inst 9
  ret i32 %5                                                                       ; inst 10
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 11
_6.if.exit.1:
  ret i32 -1                                                                       ; inst 12
}

define i32 @calculateRequiredLevel(i32 %0, i32 %1) {
_0.entry.0:
  %2 = sub i32 %1, 1                                                               ; inst 1
  %3 = shl i32 1, %2                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [%3, %_0.entry.0], [%8, %_5.if.exit.0]                              ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%9, %_5.if.exit.0]                               ; inst 5
  %6 = icmp slt i32 %5, %1                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = icmp sge i32 %4, %0                                                         ; inst 8
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 9
_3.if.then.0:
  ret i32 %5                                                                       ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %8 = sdiv i32 %4, 2                                                              ; inst 12
  %9 = add i32 %5, 1                                                               ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  ret i32 -1                                                                       ; inst 15
}

define i32 @findFreeNode([512 x i32]* %0, i32 %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = icmp eq i32 %2, %3                                                          ; inst 1
  br i1 %5, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  %6 = sext i32 %1 to i64                                                          ; inst 3
  %7 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %6                   ; inst 4
  %8 = load i32, i32* %7                                                           ; inst 5
  %9 = icmp eq i32 %8, 0                                                           ; inst 6
  br i1 %9, label %_2.if.then.1, label %_3.if.else.1                               ; inst 7
_2.if.then.1:
  ret i32 %1                                                                       ; inst 8
_3.if.else.1:
  ret i32 -1                                                                       ; inst 9
_4.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 10
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 11
_6.if.exit.0:
  %10 = phi i32 [%4, %_4.if.exit.1], [%4, %_5.if.else.0]                           ; inst 12
  %11 = phi i32 [%3, %_4.if.exit.1], [%3, %_5.if.else.0]                           ; inst 13
  %12 = phi i32 [%2, %_4.if.exit.1], [%2, %_5.if.else.0]                           ; inst 14
  %13 = phi i32 [%1, %_4.if.exit.1], [%1, %_5.if.else.0]                           ; inst 15
  %14 = phi [512 x i32]* [%0, %_4.if.exit.1], [%0, %_5.if.else.0]                  ; inst 16
  %15 = sext i32 %13 to i64                                                        ; inst 17
  %16 = getelementptr [512 x i32], [512 x i32]* %14, i32 0, i64 %15                ; inst 18
  %17 = load i32, i32* %16                                                         ; inst 19
  %18 = icmp eq i32 %17, 1                                                         ; inst 20
  br i1 %18, label %_7.if.then.2, label %_8.if.else.2                              ; inst 21
_7.if.then.2:
  ret i32 -1                                                                       ; inst 22
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 23
_9.if.exit.2:
  %19 = mul i32 2, %13                                                             ; inst 24
  %20 = add i32 %19, 1                                                             ; inst 25
  %21 = mul i32 2, %13                                                             ; inst 26
  %22 = add i32 %21, 2                                                             ; inst 27
  %23 = icmp slt i32 %20, 511                                                      ; inst 28
  br i1 %23, label %_10.if.then.3, label %_14.if.else.3                            ; inst 29
_10.if.then.3:
  %24 = add i32 %12, 1                                                             ; inst 30
  %25 = call i32 @findFreeNode([512 x i32]* %14, i32 %20, i32 %24, i32 %11, i32 %10) ; inst 31
  %26 = icmp ne i32 %25, -1                                                        ; inst 32
  br i1 %26, label %_11.if.then.4, label %_12.if.else.4                            ; inst 33
_11.if.then.4:
  ret i32 %25                                                                      ; inst 34
_12.if.else.4:
  br label %_13.if.exit.4                                                          ; inst 35
_13.if.exit.4:
  br label %_15.if.exit.3                                                          ; inst 36
_14.if.else.3:
  br label %_15.if.exit.3                                                          ; inst 37
_15.if.exit.3:
  %27 = icmp slt i32 %22, 511                                                      ; inst 38
  br i1 %27, label %_16.if.then.5, label %_20.if.else.5                            ; inst 39
_16.if.then.5:
  %28 = add i32 %12, 1                                                             ; inst 40
  %29 = call i32 @findFreeNode([512 x i32]* %14, i32 %22, i32 %28, i32 %11, i32 %10) ; inst 41
  %30 = icmp ne i32 %29, -1                                                        ; inst 42
  br i1 %30, label %_17.if.then.6, label %_18.if.else.6                            ; inst 43
_17.if.then.6:
  ret i32 %29                                                                      ; inst 44
_18.if.else.6:
  br label %_19.if.exit.6                                                          ; inst 45
_19.if.exit.6:
  br label %_21.if.exit.5                                                          ; inst 46
_20.if.else.5:
  br label %_21.if.exit.5                                                          ; inst 47
_21.if.exit.5:
  ret i32 -1                                                                       ; inst 48
}

define void @markNodeAsAllocated([512 x i32]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = sext i32 %1 to i64                                                          ; inst 1
  %5 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %4                   ; inst 2
  store i32 1, i32* %5                                                             ; inst 3
  %6 = sub i32 %1, 1                                                               ; inst 4
  %7 = sdiv i32 %6, 2                                                              ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %8 = phi i32 [%7, %_0.entry.0], [%21, %_11.if.exit.1]                            ; inst 7
  %9 = phi i32 [%1, %_0.entry.0], [%8, %_11.if.exit.1]                             ; inst 8
  %10 = icmp sge i32 %8, 0                                                         ; inst 9
  br i1 %10, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 10
_2.lazy.then.0:
  %11 = icmp sgt i32 %9, 0                                                         ; inst 11
  br label %_4.lazy.exit.0                                                         ; inst 12
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 13
_4.lazy.exit.0:
  %12 = phi i1 [%11, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 14
  br i1 %12, label %_5.while.body.0, label %_13.critical_edge.0                    ; inst 15
_5.while.body.0:
  %13 = sext i32 %8 to i64                                                         ; inst 16
  %14 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %13                 ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  %16 = icmp ne i32 %15, 1                                                         ; inst 19
  br i1 %16, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %17 = sext i32 %8 to i64                                                         ; inst 21
  %18 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %17                 ; inst 22
  store i32 2, i32* %18                                                            ; inst 23
  br label %_8.if.exit.0                                                           ; inst 24
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 25
_8.if.exit.0:
  %19 = icmp eq i32 %8, 0                                                          ; inst 26
  br i1 %19, label %_9.if.then.1, label %_10.if.else.1                             ; inst 27
_9.if.then.1:
  br label %_12.while.exit.0                                                       ; inst 28
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 29
_11.if.exit.1:
  %20 = sub i32 %8, 1                                                              ; inst 30
  %21 = sdiv i32 %20, 2                                                            ; inst 31
  br label %_1.while.cond.0                                                        ; inst 32
_12.while.exit.0:
  ret void                                                                         ; inst 33
_13.critical_edge.0:
  br label %_12.while.exit.0                                                       ; inst 34
}

define void @buddyDeallocate([512 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sge i32 %2, 0                                                          ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  %4 = icmp slt i32 %2, 511                                                        ; inst 3
  br label %_3.lazy.exit.0                                                         ; inst 4
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %5 = phi i1 [%4, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 6
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  %6 = sext i32 %2 to i64                                                          ; inst 8
  %7 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %6                   ; inst 9
  store i32 0, i32* %7                                                             ; inst 10
  call void @coalesceBuddies([512 x i32]* %0, i32 %2)                              ; inst 11
  br label %_6.if.exit.0                                                           ; inst 12
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 13
_6.if.exit.0:
  ret void                                                                         ; inst 14
}

define void @coalesceBuddies([512 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = sub i32 %1, 1                                                               ; inst 5
  %4 = sdiv i32 %3, 2                                                              ; inst 6
  %5 = mul i32 2, %4                                                               ; inst 7
  %6 = add i32 %5, 1                                                               ; inst 8
  %7 = mul i32 2, %4                                                               ; inst 9
  %8 = add i32 %7, 2                                                               ; inst 10
  %9 = sext i32 %6 to i64                                                          ; inst 11
  %10 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %9                  ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = icmp eq i32 %11, 0                                                         ; inst 14
  br i1 %12, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 15
_4.lazy.then.0:
  %13 = sext i32 %8 to i64                                                         ; inst 16
  %14 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %13                 ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  %16 = icmp eq i32 %15, 0                                                         ; inst 19
  br label %_6.lazy.exit.0                                                         ; inst 20
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 21
_6.lazy.exit.0:
  %17 = phi i1 [%16, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 22
  br i1 %17, label %_7.if.then.1, label %_8.if.else.1                              ; inst 23
_7.if.then.1:
  %18 = sext i32 %4 to i64                                                         ; inst 24
  %19 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %18                 ; inst 25
  store i32 0, i32* %19                                                            ; inst 26
  %20 = sext i32 %6 to i64                                                         ; inst 27
  %21 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %20                 ; inst 28
  store i32 -1, i32* %21                                                           ; inst 29
  %22 = sext i32 %8 to i64                                                         ; inst 30
  %23 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %22                 ; inst 31
  store i32 -1, i32* %23                                                           ; inst 32
  call void @coalesceBuddies([512 x i32]* %0, i32 %4)                              ; inst 33
  br label %_9.if.exit.1                                                           ; inst 34
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 35
_9.if.exit.1:
  ret void                                                                         ; inst 36
}

define i32 @analyzeBuddyFragmentation([512 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = shl i32 1, %1                                                               ; inst 1
  %3 = sub i32 %2, 1                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%27, %_11.if.exit.0]                             ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 5
  %6 = phi i32 [0, %_0.entry.0], [%26, %_11.if.exit.0]                             ; inst 6
  %7 = icmp slt i32 %4, %3                                                         ; inst 7
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 8
_2.while.body.0:
  %8 = sext i32 %4 to i64                                                          ; inst 9
  %9 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %8                   ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  %11 = icmp eq i32 %10, 0                                                         ; inst 12
  br i1 %11, label %_3.if.then.0, label %_4.if.else.0                              ; inst 13
_3.if.then.0:
  br label %_11.if.exit.0                                                          ; inst 14
_4.if.else.0:
  %12 = sext i32 %4 to i64                                                         ; inst 15
  %13 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %12                 ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = icmp eq i32 %14, 1                                                         ; inst 18
  br i1 %15, label %_5.if.then.1, label %_6.if.else.1                              ; inst 19
_5.if.then.1:
  %16 = add i32 %6, 1                                                              ; inst 20
  br label %_10.if.exit.1                                                          ; inst 21
_6.if.else.1:
  %17 = sext i32 %4 to i64                                                         ; inst 22
  %18 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %17                 ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = icmp eq i32 %19, 2                                                         ; inst 25
  br i1 %20, label %_7.if.then.2, label %_8.if.else.2                              ; inst 26
_7.if.then.2:
  %21 = add i32 %5, 1                                                              ; inst 27
  br label %_9.if.exit.2                                                           ; inst 28
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 29
_9.if.exit.2:
  %22 = phi i32 [%21, %_7.if.then.2], [%5, %_8.if.else.2]                          ; inst 30
  br label %_10.if.exit.1                                                          ; inst 31
_10.if.exit.1:
  %23 = phi i32 [%5, %_5.if.then.1], [%22, %_9.if.exit.2]                          ; inst 32
  %24 = phi i32 [%16, %_5.if.then.1], [%6, %_9.if.exit.2]                          ; inst 33
  br label %_11.if.exit.0                                                          ; inst 34
_11.if.exit.0:
  %25 = phi i32 [%5, %_3.if.then.0], [%23, %_10.if.exit.1]                         ; inst 35
  %26 = phi i32 [%6, %_3.if.then.0], [%24, %_10.if.exit.1]                         ; inst 36
  %27 = add i32 %4, 1                                                              ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_12.while.exit.0:
  %28 = mul i32 %5, 100                                                            ; inst 39
  %29 = add i32 %6, %5                                                             ; inst 40
  %30 = add i32 %29, 1                                                             ; inst 41
  %31 = sdiv i32 %28, %30                                                          ; inst 42
  ret i32 %31                                                                      ; inst 43
}

define void @performGarbageCollectionTest() {
_0.entry.0:
  call void @printlnInt(i32 1820)                                                  ; inst 1
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
  %6 = alloca [500 x i32]                                                          ; inst 12
  %7 = getelementptr [500 x i32], [500 x i32]* %6, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 500                                                        ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %12 = alloca [50 x i32]                                                          ; inst 22
  %13 = getelementptr [50 x i32], [50 x i32]* %12, i32 0, i32 0                    ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 25
  %15 = icmp slt i32 %14, 50                                                       ; inst 26
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 28
  store i32 0, i32* %16                                                            ; inst 29
  %17 = add i32 %14, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %18 = alloca [200 x i32]                                                         ; inst 32
  %19 = getelementptr [200 x i32], [200 x i32]* %18, i32 0, i32 0                  ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %20 = phi i32 [0, %_9.array.exit.2], [%23, %_11.array.body.3]                    ; inst 35
  %21 = icmp slt i32 %20, 200                                                      ; inst 36
  br i1 %21, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %22 = getelementptr i32, i32* %19, i32 %20                                       ; inst 38
  store i32 0, i32* %22                                                            ; inst 39
  %23 = add i32 %20, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %24 = alloca i32                                                                 ; inst 42
  store i32 0, i32* %24                                                            ; inst 43
  %25 = alloca i32                                                                 ; inst 44
  store i32 0, i32* %25                                                            ; inst 45
  call void @initializeObjectGraph([1000 x i32]* %0, [500 x i32]* %6, [50 x i32]* %12, i32* %24, i32* %25) ; inst 46
  call void @printlnInt(i32 1821)                                                  ; inst 47
  %26 = load i32, i32* %25                                                         ; inst 48
  %27 = call i32 @performMarkPhase([1000 x i32]* %0, [500 x i32]* %6, [50 x i32]* %12, [200 x i32]* %18, i32 %26) ; inst 49
  call void @printlnInt(i32 %27)                                                   ; inst 50
  call void @printlnInt(i32 1822)                                                  ; inst 51
  %28 = load i32, i32* %24                                                         ; inst 52
  %29 = call i32 @performSweepPhase([1000 x i32]* %0, [200 x i32]* %18, i32 %28)   ; inst 53
  call void @printlnInt(i32 %29)                                                   ; inst 54
  call void @printlnInt(i32 1823)                                                  ; inst 55
  %30 = load i32, i32* %24                                                         ; inst 56
  %31 = call i32 @performCompactionPhase([1000 x i32]* %0, [500 x i32]* %6, i32 %30) ; inst 57
  call void @printlnInt(i32 %31)                                                   ; inst 58
  call void @printlnInt(i32 1824)                                                  ; inst 59
  %32 = load i32, i32* %24                                                         ; inst 60
  %33 = call i32 @simulateReferenceCounting([1000 x i32]* %0, i32 %32)             ; inst 61
  call void @printlnInt(i32 %33)                                                   ; inst 62
  ret void                                                                         ; inst 63
}

define void @initializeObjectGraph([1000 x i32]* %0, [500 x i32]* %1, [50 x i32]* %2, i32* %3, i32* %4) {
_0.entry.0:
  store i32 5, i32* %4                                                             ; inst 1
  %5 = load i32, i32* %4                                                           ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%22, %_2.while.body.0]                           ; inst 4
  %7 = icmp slt i32 %6, %5                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 7
  %9 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %8                     ; inst 8
  %10 = mul i32 %6, 20                                                             ; inst 9
  store i32 %10, i32* %9                                                           ; inst 10
  %11 = sext i32 %6 to i64                                                         ; inst 11
  %12 = mul i64 %11, 20                                                            ; inst 12
  %13 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %12               ; inst 13
  store i32 1, i32* %13                                                            ; inst 14
  %14 = sext i32 %6 to i64                                                         ; inst 15
  %15 = mul i64 %14, 20                                                            ; inst 16
  %16 = add i64 %15, 1                                                             ; inst 17
  %17 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %16               ; inst 18
  store i32 16, i32* %17                                                           ; inst 19
  %18 = sext i32 %6 to i64                                                         ; inst 20
  %19 = mul i64 %18, 20                                                            ; inst 21
  %20 = add i64 %19, 2                                                             ; inst 22
  %21 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %20               ; inst 23
  store i32 1, i32* %21                                                            ; inst 24
  %22 = add i32 %6, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_3.while.exit.0:
  store i32 30, i32* %3                                                            ; inst 27
  %23 = load i32, i32* %3                                                          ; inst 28
  br label %_4.while.cond.1                                                        ; inst 29
_4.while.cond.1:
  %24 = phi i32 [0, %_3.while.exit.0], [%67, %_17.if.exit.0]                       ; inst 30
  %25 = icmp slt i32 %24, %23                                                      ; inst 31
  br i1 %25, label %_5.while.body.1, label %_18.while.exit.1                       ; inst 32
_5.while.body.1:
  %26 = mul i32 %24, 20                                                            ; inst 33
  %27 = add i32 %26, 10                                                            ; inst 34
  %28 = icmp slt i32 %27, 1000                                                     ; inst 35
  br i1 %28, label %_6.if.then.0, label %_16.if.else.0                             ; inst 36
_6.if.then.0:
  %29 = sext i32 %26 to i64                                                        ; inst 37
  %30 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %29               ; inst 38
  %31 = srem i32 %24, 3                                                            ; inst 39
  %32 = add i32 %31, 1                                                             ; inst 40
  store i32 %32, i32* %30                                                          ; inst 41
  %33 = sext i32 %26 to i64                                                        ; inst 42
  %34 = add i64 %33, 1                                                             ; inst 43
  %35 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %34               ; inst 44
  %36 = srem i32 %24, 8                                                            ; inst 45
  %37 = add i32 12, %36                                                            ; inst 46
  store i32 %37, i32* %35                                                          ; inst 47
  %38 = sext i32 %26 to i64                                                        ; inst 48
  %39 = add i64 %38, 2                                                             ; inst 49
  %40 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %39               ; inst 50
  store i32 0, i32* %40                                                            ; inst 51
  %41 = add i32 %24, 1                                                             ; inst 52
  %42 = icmp slt i32 %41, %23                                                      ; inst 53
  br i1 %42, label %_7.if.then.1, label %_8.if.else.1                              ; inst 54
_7.if.then.1:
  %43 = sext i32 %26 to i64                                                        ; inst 55
  %44 = add i64 %43, 3                                                             ; inst 56
  %45 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %44               ; inst 57
  %46 = add i32 %24, 1                                                             ; inst 58
  %47 = mul i32 %46, 20                                                            ; inst 59
  store i32 %47, i32* %45                                                          ; inst 60
  %48 = sext i32 %24 to i64                                                        ; inst 61
  %49 = mul i64 %48, 2                                                             ; inst 62
  %50 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %49                 ; inst 63
  %51 = add i32 %26, 3                                                             ; inst 64
  store i32 %51, i32* %50                                                          ; inst 65
  br label %_9.if.exit.1                                                           ; inst 66
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 67
_9.if.exit.1:
  %52 = add i32 %24, 2                                                             ; inst 68
  %53 = icmp slt i32 %52, %23                                                      ; inst 69
  br i1 %53, label %_10.lazy.then.0, label %_11.lazy.else.0                        ; inst 70
_10.lazy.then.0:
  %54 = srem i32 %24, 3                                                            ; inst 71
  %55 = icmp eq i32 %54, 0                                                         ; inst 72
  br label %_12.lazy.exit.0                                                        ; inst 73
_11.lazy.else.0:
  br label %_12.lazy.exit.0                                                        ; inst 74
_12.lazy.exit.0:
  %56 = phi i1 [%55, %_10.lazy.then.0], [0, %_11.lazy.else.0]                      ; inst 75
  br i1 %56, label %_13.if.then.2, label %_14.if.else.2                            ; inst 76
_13.if.then.2:
  %57 = sext i32 %26 to i64                                                        ; inst 77
  %58 = add i64 %57, 4                                                             ; inst 78
  %59 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %58               ; inst 79
  %60 = add i32 %24, 2                                                             ; inst 80
  %61 = mul i32 %60, 20                                                            ; inst 81
  store i32 %61, i32* %59                                                          ; inst 82
  %62 = sext i32 %24 to i64                                                        ; inst 83
  %63 = mul i64 %62, 2                                                             ; inst 84
  %64 = add i64 %63, 1                                                             ; inst 85
  %65 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %64                 ; inst 86
  %66 = add i32 %26, 4                                                             ; inst 87
  store i32 %66, i32* %65                                                          ; inst 88
  br label %_15.if.exit.2                                                          ; inst 89
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 90
_15.if.exit.2:
  br label %_17.if.exit.0                                                          ; inst 91
_16.if.else.0:
  br label %_17.if.exit.0                                                          ; inst 92
_17.if.exit.0:
  %67 = add i32 %24, 1                                                             ; inst 93
  br label %_4.while.cond.1                                                        ; inst 94
_18.while.exit.1:
  ret void                                                                         ; inst 95
}

define i32 @performMarkPhase([1000 x i32]* %0, [500 x i32]* %1, [50 x i32]* %2, [200 x i32]* %3, i32 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %6 = icmp slt i32 %5, 200                                                        ; inst 3
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 5
  %8 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %7                   ; inst 6
  store i32 0, i32* %8                                                             ; inst 7
  %9 = add i32 %5, 1                                                               ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 10
_4.while.cond.1:
  %10 = phi i32 [0, %_3.while.exit.0], [%17, %_5.while.body.1]                     ; inst 11
  %11 = phi i32 [0, %_3.while.exit.0], [%18, %_5.while.body.1]                     ; inst 12
  %12 = icmp slt i32 %11, %4                                                       ; inst 13
  br i1 %12, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 14
_5.while.body.1:
  %13 = sext i32 %11 to i64                                                        ; inst 15
  %14 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %13                   ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  %16 = call i32 @markObject([1000 x i32]* %0, [500 x i32]* %1, [200 x i32]* %3, i32 %15, i32 0) ; inst 18
  %17 = add i32 %10, %16                                                           ; inst 19
  %18 = add i32 %11, 1                                                             ; inst 20
  br label %_4.while.cond.1                                                        ; inst 21
_6.while.exit.1:
  ret i32 %10                                                                      ; inst 22
}

define i32 @markObject([1000 x i32]* %0, [500 x i32]* %1, [200 x i32]* %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = icmp sgt i32 %4, 10                                                         ; inst 1
  br i1 %5, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %6 = icmp slt i32 %3, 0                                                          ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %7 = phi i1 [1, %_1.lazy.then.0], [%6, %_2.lazy.else.0]                          ; inst 6
  br i1 %7, label %_4.lazy.then.1, label %_5.lazy.else.1                           ; inst 7
_4.lazy.then.1:
  br label %_6.lazy.exit.1                                                         ; inst 8
_5.lazy.else.1:
  %8 = icmp sge i32 %3, 1000                                                       ; inst 9
  br label %_6.lazy.exit.1                                                         ; inst 10
_6.lazy.exit.1:
  %9 = phi i1 [1, %_4.lazy.then.1], [%8, %_5.lazy.else.1]                          ; inst 11
  br i1 %9, label %_7.if.then.0, label %_8.if.else.0                               ; inst 12
_7.if.then.0:
  ret i32 0                                                                        ; inst 13
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 14
_9.if.exit.0:
  %10 = sdiv i32 %3, 20                                                            ; inst 15
  %11 = icmp sge i32 %10, 200                                                      ; inst 16
  br i1 %11, label %_10.lazy.then.2, label %_11.lazy.else.2                        ; inst 17
_10.lazy.then.2:
  br label %_12.lazy.exit.2                                                        ; inst 18
_11.lazy.else.2:
  %12 = sext i32 %10 to i64                                                        ; inst 19
  %13 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %12                 ; inst 20
  %14 = load i32, i32* %13                                                         ; inst 21
  %15 = icmp eq i32 %14, 1                                                         ; inst 22
  br label %_12.lazy.exit.2                                                        ; inst 23
_12.lazy.exit.2:
  %16 = phi i1 [1, %_10.lazy.then.2], [%15, %_11.lazy.else.2]                      ; inst 24
  br i1 %16, label %_13.if.then.1, label %_14.if.else.1                            ; inst 25
_13.if.then.1:
  ret i32 0                                                                        ; inst 26
_14.if.else.1:
  br label %_15.if.exit.1                                                          ; inst 27
_15.if.exit.1:
  %17 = sext i32 %10 to i64                                                        ; inst 28
  %18 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %17                 ; inst 29
  store i32 1, i32* %18                                                            ; inst 30
  %19 = add i32 %3, 5                                                              ; inst 31
  %20 = icmp slt i32 %19, 1000                                                     ; inst 32
  br i1 %20, label %_16.if.then.2, label %_29.if.else.2                            ; inst 33
_16.if.then.2:
  %21 = sext i32 %3 to i64                                                         ; inst 34
  %22 = add i64 %21, 3                                                             ; inst 35
  %23 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %22               ; inst 36
  %24 = load i32, i32* %23                                                         ; inst 37
  %25 = sext i32 %3 to i64                                                         ; inst 38
  %26 = add i64 %25, 4                                                             ; inst 39
  %27 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %26               ; inst 40
  %28 = load i32, i32* %27                                                         ; inst 41
  %29 = icmp sgt i32 %24, 0                                                        ; inst 42
  br i1 %29, label %_17.lazy.then.3, label %_18.lazy.else.3                        ; inst 43
_17.lazy.then.3:
  %30 = icmp slt i32 %24, 1000                                                     ; inst 44
  br label %_19.lazy.exit.3                                                        ; inst 45
_18.lazy.else.3:
  br label %_19.lazy.exit.3                                                        ; inst 46
_19.lazy.exit.3:
  %31 = phi i1 [%30, %_17.lazy.then.3], [0, %_18.lazy.else.3]                      ; inst 47
  br i1 %31, label %_20.if.then.3, label %_21.if.else.3                            ; inst 48
_20.if.then.3:
  %32 = add i32 %4, 1                                                              ; inst 49
  %33 = call i32 @markObject([1000 x i32]* %0, [500 x i32]* %1, [200 x i32]* %2, i32 %24, i32 %32) ; inst 50
  %34 = add i32 1, %33                                                             ; inst 51
  br label %_22.if.exit.3                                                          ; inst 52
_21.if.else.3:
  br label %_22.if.exit.3                                                          ; inst 53
_22.if.exit.3:
  %35 = phi i32 [%34, %_20.if.then.3], [1, %_21.if.else.3]                         ; inst 54
  %36 = icmp sgt i32 %28, 0                                                        ; inst 55
  br i1 %36, label %_23.lazy.then.4, label %_24.lazy.else.4                        ; inst 56
_23.lazy.then.4:
  %37 = icmp slt i32 %28, 1000                                                     ; inst 57
  br label %_25.lazy.exit.4                                                        ; inst 58
_24.lazy.else.4:
  br label %_25.lazy.exit.4                                                        ; inst 59
_25.lazy.exit.4:
  %38 = phi i1 [%37, %_23.lazy.then.4], [0, %_24.lazy.else.4]                      ; inst 60
  br i1 %38, label %_26.if.then.4, label %_27.if.else.4                            ; inst 61
_26.if.then.4:
  %39 = add i32 %4, 1                                                              ; inst 62
  %40 = call i32 @markObject([1000 x i32]* %0, [500 x i32]* %1, [200 x i32]* %2, i32 %28, i32 %39) ; inst 63
  %41 = add i32 %35, %40                                                           ; inst 64
  br label %_28.if.exit.4                                                          ; inst 65
_27.if.else.4:
  br label %_28.if.exit.4                                                          ; inst 66
_28.if.exit.4:
  %42 = phi i32 [%41, %_26.if.then.4], [%35, %_27.if.else.4]                       ; inst 67
  br label %_30.if.exit.2                                                          ; inst 68
_29.if.else.2:
  br label %_30.if.exit.2                                                          ; inst 69
_30.if.exit.2:
  %43 = phi i32 [%42, %_28.if.exit.4], [1, %_29.if.else.2]                         ; inst 70
  ret i32 %43                                                                      ; inst 71
}

define i32 @performSweepPhase([1000 x i32]* %0, [200 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%22, %_11.if.exit.0]                             ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%21, %_11.if.exit.0]                             ; inst 3
  %5 = icmp slt i32 %3, %2                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 6
  %7 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %6                   ; inst 7
  %8 = load i32, i32* %7                                                           ; inst 8
  %9 = icmp eq i32 %8, 0                                                           ; inst 9
  br i1 %9, label %_3.if.then.0, label %_10.if.else.0                              ; inst 10
_3.if.then.0:
  %10 = mul i32 %3, 20                                                             ; inst 11
  %11 = add i32 %10, 10                                                            ; inst 12
  %12 = icmp slt i32 %11, 1000                                                     ; inst 13
  br i1 %12, label %_4.if.then.1, label %_8.if.else.1                              ; inst 14
_4.if.then.1:
  br label %_5.while.cond.1                                                        ; inst 15
_5.while.cond.1:
  %13 = phi i32 [0, %_4.if.then.1], [%18, %_6.while.body.1]                        ; inst 16
  %14 = icmp slt i32 %13, 20                                                       ; inst 17
  br i1 %14, label %_6.while.body.1, label %_7.while.exit.1                        ; inst 18
_6.while.body.1:
  %15 = add i32 %10, %13                                                           ; inst 19
  %16 = sext i32 %15 to i64                                                        ; inst 20
  %17 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %16               ; inst 21
  store i32 0, i32* %17                                                            ; inst 22
  %18 = add i32 %13, 1                                                             ; inst 23
  br label %_5.while.cond.1                                                        ; inst 24
_7.while.exit.1:
  %19 = add i32 %4, 1                                                              ; inst 25
  br label %_9.if.exit.1                                                           ; inst 26
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 27
_9.if.exit.1:
  %20 = phi i32 [%19, %_7.while.exit.1], [%4, %_8.if.else.1]                       ; inst 28
  br label %_11.if.exit.0                                                          ; inst 29
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 30
_11.if.exit.0:
  %21 = phi i32 [%20, %_9.if.exit.1], [%4, %_10.if.else.0]                         ; inst 31
  %22 = add i32 %3, 1                                                              ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_12.while.exit.0:
  ret i32 %4                                                                       ; inst 34
}

define i32 @performCompactionPhase([1000 x i32]* %0, [500 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%38, %_20.if.exit.0]                             ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%36, %_20.if.exit.0]                             ; inst 3
  %5 = phi i32 [0, %_0.entry.0], [%37, %_20.if.exit.0]                             ; inst 4
  %6 = icmp slt i32 %3, %2                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 6
_2.while.body.0:
  %7 = mul i32 %3, 20                                                              ; inst 7
  %8 = icmp slt i32 %7, 1000                                                       ; inst 8
  br i1 %8, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 9
_3.lazy.then.0:
  %9 = sext i32 %7 to i64                                                          ; inst 10
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = icmp ne i32 %11, 0                                                         ; inst 13
  br label %_5.lazy.exit.0                                                         ; inst 14
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 15
_5.lazy.exit.0:
  %13 = phi i1 [%12, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 16
  br i1 %13, label %_6.if.then.0, label %_19.if.else.0                             ; inst 17
_6.if.then.0:
  %14 = icmp ne i32 %7, %4                                                         ; inst 18
  br i1 %14, label %_7.if.then.1, label %_17.if.else.1                             ; inst 19
_7.if.then.1:
  br label %_8.while.cond.1                                                        ; inst 20
_8.while.cond.1:
  %15 = phi i32 [0, %_7.if.then.1], [%33, %_15.while.body.1]                       ; inst 21
  %16 = icmp slt i32 %15, 20                                                       ; inst 22
  br i1 %16, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 23
_9.lazy.then.1:
  %17 = add i32 %4, %15                                                            ; inst 24
  %18 = icmp slt i32 %17, 1000                                                     ; inst 25
  br label %_11.lazy.exit.1                                                        ; inst 26
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 27
_11.lazy.exit.1:
  %19 = phi i1 [%18, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 28
  br i1 %19, label %_12.lazy.then.2, label %_13.lazy.else.2                        ; inst 29
_12.lazy.then.2:
  %20 = add i32 %7, %15                                                            ; inst 30
  %21 = icmp slt i32 %20, 1000                                                     ; inst 31
  br label %_14.lazy.exit.2                                                        ; inst 32
_13.lazy.else.2:
  br label %_14.lazy.exit.2                                                        ; inst 33
_14.lazy.exit.2:
  %22 = phi i1 [%21, %_12.lazy.then.2], [0, %_13.lazy.else.2]                      ; inst 34
  br i1 %22, label %_15.while.body.1, label %_16.while.exit.1                      ; inst 35
_15.while.body.1:
  %23 = add i32 %4, %15                                                            ; inst 36
  %24 = sext i32 %23 to i64                                                        ; inst 37
  %25 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %24               ; inst 38
  %26 = add i32 %7, %15                                                            ; inst 39
  %27 = sext i32 %26 to i64                                                        ; inst 40
  %28 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %27               ; inst 41
  %29 = load i32, i32* %28                                                         ; inst 42
  store i32 %29, i32* %25                                                          ; inst 43
  %30 = add i32 %7, %15                                                            ; inst 44
  %31 = sext i32 %30 to i64                                                        ; inst 45
  %32 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %31               ; inst 46
  store i32 0, i32* %32                                                            ; inst 47
  %33 = add i32 %15, 1                                                             ; inst 48
  br label %_8.while.cond.1                                                        ; inst 49
_16.while.exit.1:
  call void @updateReferencesAfterCompaction([1000 x i32]* %0, [500 x i32]* %1, i32 %7, i32 %4, i32 500) ; inst 50
  br label %_18.if.exit.1                                                          ; inst 51
_17.if.else.1:
  br label %_18.if.exit.1                                                          ; inst 52
_18.if.exit.1:
  %34 = add i32 %4, 20                                                             ; inst 53
  %35 = add i32 %5, 1                                                              ; inst 54
  br label %_20.if.exit.0                                                          ; inst 55
_19.if.else.0:
  br label %_20.if.exit.0                                                          ; inst 56
_20.if.exit.0:
  %36 = phi i32 [%34, %_18.if.exit.1], [%4, %_19.if.else.0]                        ; inst 57
  %37 = phi i32 [%35, %_18.if.exit.1], [%5, %_19.if.else.0]                        ; inst 58
  %38 = add i32 %3, 1                                                              ; inst 59
  br label %_1.while.cond.0                                                        ; inst 60
_21.while.exit.0:
  ret i32 %5                                                                       ; inst 61
}

define void @updateReferencesAfterCompaction([1000 x i32]* %0, [500 x i32]* %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 2
  %6 = icmp slt i32 %5, %4                                                         ; inst 3
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 4
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 5
  %8 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %7                   ; inst 6
  %9 = load i32, i32* %8                                                           ; inst 7
  %10 = icmp sgt i32 %9, 0                                                         ; inst 8
  br i1 %10, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 9
_3.lazy.then.0:
  %11 = sext i32 %5 to i64                                                         ; inst 10
  %12 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %11                 ; inst 11
  %13 = load i32, i32* %12                                                         ; inst 12
  %14 = icmp slt i32 %13, 1000                                                     ; inst 13
  br label %_5.lazy.exit.0                                                         ; inst 14
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 15
_5.lazy.exit.0:
  %15 = phi i1 [%14, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 16
  br i1 %15, label %_6.if.then.0, label %_10.if.else.0                             ; inst 17
_6.if.then.0:
  %16 = sext i32 %5 to i64                                                         ; inst 18
  %17 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %16                 ; inst 19
  %18 = load i32, i32* %17                                                         ; inst 20
  %19 = sext i32 %18 to i64                                                        ; inst 21
  %20 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %19               ; inst 22
  %21 = load i32, i32* %20                                                         ; inst 23
  %22 = icmp eq i32 %21, %2                                                        ; inst 24
  br i1 %22, label %_7.if.then.1, label %_8.if.else.1                              ; inst 25
_7.if.then.1:
  %23 = sext i32 %18 to i64                                                        ; inst 26
  %24 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %23               ; inst 27
  store i32 %3, i32* %24                                                           ; inst 28
  br label %_9.if.exit.1                                                           ; inst 29
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 30
_9.if.exit.1:
  br label %_11.if.exit.0                                                          ; inst 31
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 32
_11.if.exit.0:
  %25 = add i32 %5, 1                                                              ; inst 33
  br label %_1.while.cond.0                                                        ; inst 34
_12.while.exit.0:
  ret void                                                                         ; inst 35
}

define i32 @simulateReferenceCounting([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  call void @calculateReferenceCounts([1000 x i32]* %0, i32 %1)                    ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%35, %_14.if.exit.0]                             ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%34, %_14.if.exit.0]                             ; inst 4
  %4 = icmp slt i32 %2, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 6
_2.while.body.0:
  %5 = mul i32 %2, 20                                                              ; inst 7
  %6 = add i32 %5, 5                                                               ; inst 8
  %7 = icmp slt i32 %6, 1000                                                       ; inst 9
  br i1 %7, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 10
_3.lazy.then.0:
  %8 = sext i32 %5 to i64                                                          ; inst 11
  %9 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %8                 ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  %11 = icmp ne i32 %10, 0                                                         ; inst 14
  br label %_5.lazy.exit.0                                                         ; inst 15
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 16
_5.lazy.exit.0:
  %12 = phi i1 [%11, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 17
  br i1 %12, label %_6.if.then.0, label %_13.if.else.0                             ; inst 18
_6.if.then.0:
  %13 = sext i32 %5 to i64                                                         ; inst 19
  %14 = add i64 %13, 2                                                             ; inst 20
  %15 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %14               ; inst 21
  %16 = load i32, i32* %15                                                         ; inst 22
  %17 = icmp sgt i32 %16, 0                                                        ; inst 23
  br i1 %17, label %_7.if.then.1, label %_11.if.else.1                             ; inst 24
_7.if.then.1:
  %18 = sext i32 %5 to i64                                                         ; inst 25
  %19 = add i64 %18, 2                                                             ; inst 26
  %20 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %19               ; inst 27
  %21 = sext i32 %5 to i64                                                         ; inst 28
  %22 = add i64 %21, 2                                                             ; inst 29
  %23 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %22               ; inst 30
  %24 = load i32, i32* %23                                                         ; inst 31
  %25 = sub i32 %24, 1                                                             ; inst 32
  store i32 %25, i32* %20                                                          ; inst 33
  %26 = sext i32 %5 to i64                                                         ; inst 34
  %27 = add i64 %26, 2                                                             ; inst 35
  %28 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %27               ; inst 36
  %29 = load i32, i32* %28                                                         ; inst 37
  %30 = icmp eq i32 %29, 0                                                         ; inst 38
  br i1 %30, label %_8.if.then.2, label %_9.if.else.2                              ; inst 39
_8.if.then.2:
  call void @decrementReferencedObjects([1000 x i32]* %0, i32 %5)                  ; inst 40
  %31 = add i32 %3, 1                                                              ; inst 41
  br label %_10.if.exit.2                                                          ; inst 42
_9.if.else.2:
  br label %_10.if.exit.2                                                          ; inst 43
_10.if.exit.2:
  %32 = phi i32 [%31, %_8.if.then.2], [%3, %_9.if.else.2]                          ; inst 44
  br label %_12.if.exit.1                                                          ; inst 45
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 46
_12.if.exit.1:
  %33 = phi i32 [%32, %_10.if.exit.2], [%3, %_11.if.else.1]                        ; inst 47
  br label %_14.if.exit.0                                                          ; inst 48
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 49
_14.if.exit.0:
  %34 = phi i32 [%33, %_12.if.exit.1], [%3, %_13.if.else.0]                        ; inst 50
  %35 = add i32 %2, 2                                                              ; inst 51
  br label %_1.while.cond.0                                                        ; inst 52
_15.while.exit.0:
  ret i32 %3                                                                       ; inst 53
}

define void @calculateReferenceCounts([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%10, %_5.if.exit.0]                              ; inst 2
  %3 = icmp slt i32 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = mul i32 %2, 20                                                              ; inst 5
  %5 = add i32 %4, 2                                                               ; inst 6
  %6 = icmp slt i32 %5, 1000                                                       ; inst 7
  br i1 %6, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %7 = sext i32 %4 to i64                                                          ; inst 9
  %8 = add i64 %7, 2                                                               ; inst 10
  %9 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %8                 ; inst 11
  store i32 0, i32* %9                                                             ; inst 12
  br label %_5.if.exit.0                                                           ; inst 13
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 14
_5.if.exit.0:
  %10 = add i32 %2, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 17
_7.while.cond.1:
  %11 = phi i32 [0, %_6.while.exit.0], [%57, %_32.if.exit.1]                       ; inst 18
  %12 = icmp slt i32 %11, %1                                                       ; inst 19
  br i1 %12, label %_8.while.body.1, label %_33.while.exit.1                       ; inst 20
_8.while.body.1:
  %13 = mul i32 %11, 20                                                            ; inst 21
  %14 = add i32 %13, 5                                                             ; inst 22
  %15 = icmp slt i32 %14, 1000                                                     ; inst 23
  br i1 %15, label %_9.lazy.then.0, label %_10.lazy.else.0                         ; inst 24
_9.lazy.then.0:
  %16 = sext i32 %13 to i64                                                        ; inst 25
  %17 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %16               ; inst 26
  %18 = load i32, i32* %17                                                         ; inst 27
  %19 = icmp ne i32 %18, 0                                                         ; inst 28
  br label %_11.lazy.exit.0                                                        ; inst 29
_10.lazy.else.0:
  br label %_11.lazy.exit.0                                                        ; inst 30
_11.lazy.exit.0:
  %20 = phi i1 [%19, %_9.lazy.then.0], [0, %_10.lazy.else.0]                       ; inst 31
  br i1 %20, label %_12.if.then.1, label %_31.if.else.1                            ; inst 32
_12.if.then.1:
  %21 = sext i32 %13 to i64                                                        ; inst 33
  %22 = add i64 %21, 3                                                             ; inst 34
  %23 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %22               ; inst 35
  %24 = load i32, i32* %23                                                         ; inst 36
  %25 = sext i32 %13 to i64                                                        ; inst 37
  %26 = add i64 %25, 4                                                             ; inst 38
  %27 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %26               ; inst 39
  %28 = load i32, i32* %27                                                         ; inst 40
  %29 = icmp sgt i32 %24, 0                                                        ; inst 41
  br i1 %29, label %_13.lazy.then.1, label %_14.lazy.else.1                        ; inst 42
_13.lazy.then.1:
  %30 = icmp slt i32 %24, 1000                                                     ; inst 43
  br label %_15.lazy.exit.1                                                        ; inst 44
_14.lazy.else.1:
  br label %_15.lazy.exit.1                                                        ; inst 45
_15.lazy.exit.1:
  %31 = phi i1 [%30, %_13.lazy.then.1], [0, %_14.lazy.else.1]                      ; inst 46
  br i1 %31, label %_16.lazy.then.2, label %_17.lazy.else.2                        ; inst 47
_16.lazy.then.2:
  %32 = add i32 %24, 2                                                             ; inst 48
  %33 = icmp slt i32 %32, 1000                                                     ; inst 49
  br label %_18.lazy.exit.2                                                        ; inst 50
_17.lazy.else.2:
  br label %_18.lazy.exit.2                                                        ; inst 51
_18.lazy.exit.2:
  %34 = phi i1 [%33, %_16.lazy.then.2], [0, %_17.lazy.else.2]                      ; inst 52
  br i1 %34, label %_19.if.then.2, label %_20.if.else.2                            ; inst 53
_19.if.then.2:
  %35 = sext i32 %24 to i64                                                        ; inst 54
  %36 = add i64 %35, 2                                                             ; inst 55
  %37 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %36               ; inst 56
  %38 = sext i32 %24 to i64                                                        ; inst 57
  %39 = add i64 %38, 2                                                             ; inst 58
  %40 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %39               ; inst 59
  %41 = load i32, i32* %40                                                         ; inst 60
  %42 = add i32 %41, 1                                                             ; inst 61
  store i32 %42, i32* %37                                                          ; inst 62
  br label %_21.if.exit.2                                                          ; inst 63
_20.if.else.2:
  br label %_21.if.exit.2                                                          ; inst 64
_21.if.exit.2:
  %43 = icmp sgt i32 %28, 0                                                        ; inst 65
  br i1 %43, label %_22.lazy.then.3, label %_23.lazy.else.3                        ; inst 66
_22.lazy.then.3:
  %44 = icmp slt i32 %28, 1000                                                     ; inst 67
  br label %_24.lazy.exit.3                                                        ; inst 68
_23.lazy.else.3:
  br label %_24.lazy.exit.3                                                        ; inst 69
_24.lazy.exit.3:
  %45 = phi i1 [%44, %_22.lazy.then.3], [0, %_23.lazy.else.3]                      ; inst 70
  br i1 %45, label %_25.lazy.then.4, label %_26.lazy.else.4                        ; inst 71
_25.lazy.then.4:
  %46 = add i32 %28, 2                                                             ; inst 72
  %47 = icmp slt i32 %46, 1000                                                     ; inst 73
  br label %_27.lazy.exit.4                                                        ; inst 74
_26.lazy.else.4:
  br label %_27.lazy.exit.4                                                        ; inst 75
_27.lazy.exit.4:
  %48 = phi i1 [%47, %_25.lazy.then.4], [0, %_26.lazy.else.4]                      ; inst 76
  br i1 %48, label %_28.if.then.3, label %_29.if.else.3                            ; inst 77
_28.if.then.3:
  %49 = sext i32 %28 to i64                                                        ; inst 78
  %50 = add i64 %49, 2                                                             ; inst 79
  %51 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %50               ; inst 80
  %52 = sext i32 %28 to i64                                                        ; inst 81
  %53 = add i64 %52, 2                                                             ; inst 82
  %54 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %53               ; inst 83
  %55 = load i32, i32* %54                                                         ; inst 84
  %56 = add i32 %55, 1                                                             ; inst 85
  store i32 %56, i32* %51                                                          ; inst 86
  br label %_30.if.exit.3                                                          ; inst 87
_29.if.else.3:
  br label %_30.if.exit.3                                                          ; inst 88
_30.if.exit.3:
  br label %_32.if.exit.1                                                          ; inst 89
_31.if.else.1:
  br label %_32.if.exit.1                                                          ; inst 90
_32.if.exit.1:
  %57 = add i32 %11, 1                                                             ; inst 91
  br label %_7.while.cond.1                                                        ; inst 92
_33.while.exit.1:
  ret void                                                                         ; inst 93
}

define void @decrementReferencedObjects([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = add i32 %1, 5                                                               ; inst 1
  %3 = icmp slt i32 %2, 1000                                                       ; inst 2
  br i1 %3, label %_1.if.then.0, label %_20.if.else.0                              ; inst 3
_1.if.then.0:
  %4 = sext i32 %1 to i64                                                          ; inst 4
  %5 = add i64 %4, 3                                                               ; inst 5
  %6 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %5                 ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = sext i32 %1 to i64                                                          ; inst 8
  %9 = add i64 %8, 4                                                               ; inst 9
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 10
  %11 = load i32, i32* %10                                                         ; inst 11
  %12 = icmp sgt i32 %7, 0                                                         ; inst 12
  br i1 %12, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 13
_2.lazy.then.0:
  %13 = add i32 %7, 2                                                              ; inst 14
  %14 = icmp slt i32 %13, 1000                                                     ; inst 15
  br label %_4.lazy.exit.0                                                         ; inst 16
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 17
_4.lazy.exit.0:
  %15 = phi i1 [%14, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 18
  br i1 %15, label %_5.lazy.then.1, label %_6.lazy.else.1                          ; inst 19
_5.lazy.then.1:
  %16 = sext i32 %7 to i64                                                         ; inst 20
  %17 = add i64 %16, 2                                                             ; inst 21
  %18 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %17               ; inst 22
  %19 = load i32, i32* %18                                                         ; inst 23
  %20 = icmp sgt i32 %19, 0                                                        ; inst 24
  br label %_7.lazy.exit.1                                                         ; inst 25
_6.lazy.else.1:
  br label %_7.lazy.exit.1                                                         ; inst 26
_7.lazy.exit.1:
  %21 = phi i1 [%20, %_5.lazy.then.1], [0, %_6.lazy.else.1]                        ; inst 27
  br i1 %21, label %_8.if.then.1, label %_9.if.else.1                              ; inst 28
_8.if.then.1:
  %22 = sext i32 %7 to i64                                                         ; inst 29
  %23 = add i64 %22, 2                                                             ; inst 30
  %24 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %23               ; inst 31
  %25 = sext i32 %7 to i64                                                         ; inst 32
  %26 = add i64 %25, 2                                                             ; inst 33
  %27 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %26               ; inst 34
  %28 = load i32, i32* %27                                                         ; inst 35
  %29 = sub i32 %28, 1                                                             ; inst 36
  store i32 %29, i32* %24                                                          ; inst 37
  br label %_10.if.exit.1                                                          ; inst 38
_9.if.else.1:
  br label %_10.if.exit.1                                                          ; inst 39
_10.if.exit.1:
  %30 = icmp sgt i32 %11, 0                                                        ; inst 40
  br i1 %30, label %_11.lazy.then.2, label %_12.lazy.else.2                        ; inst 41
_11.lazy.then.2:
  %31 = add i32 %11, 2                                                             ; inst 42
  %32 = icmp slt i32 %31, 1000                                                     ; inst 43
  br label %_13.lazy.exit.2                                                        ; inst 44
_12.lazy.else.2:
  br label %_13.lazy.exit.2                                                        ; inst 45
_13.lazy.exit.2:
  %33 = phi i1 [%32, %_11.lazy.then.2], [0, %_12.lazy.else.2]                      ; inst 46
  br i1 %33, label %_14.lazy.then.3, label %_15.lazy.else.3                        ; inst 47
_14.lazy.then.3:
  %34 = sext i32 %11 to i64                                                        ; inst 48
  %35 = add i64 %34, 2                                                             ; inst 49
  %36 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %35               ; inst 50
  %37 = load i32, i32* %36                                                         ; inst 51
  %38 = icmp sgt i32 %37, 0                                                        ; inst 52
  br label %_16.lazy.exit.3                                                        ; inst 53
_15.lazy.else.3:
  br label %_16.lazy.exit.3                                                        ; inst 54
_16.lazy.exit.3:
  %39 = phi i1 [%38, %_14.lazy.then.3], [0, %_15.lazy.else.3]                      ; inst 55
  br i1 %39, label %_17.if.then.2, label %_18.if.else.2                            ; inst 56
_17.if.then.2:
  %40 = sext i32 %11 to i64                                                        ; inst 57
  %41 = add i64 %40, 2                                                             ; inst 58
  %42 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %41               ; inst 59
  %43 = sext i32 %11 to i64                                                        ; inst 60
  %44 = add i64 %43, 2                                                             ; inst 61
  %45 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %44               ; inst 62
  %46 = load i32, i32* %45                                                         ; inst 63
  %47 = sub i32 %46, 1                                                             ; inst 64
  store i32 %47, i32* %42                                                          ; inst 65
  br label %_19.if.exit.2                                                          ; inst 66
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 67
_19.if.exit.2:
  br label %_21.if.exit.0                                                          ; inst 68
_20.if.else.0:
  br label %_21.if.exit.0                                                          ; inst 69
_21.if.exit.0:
  ret void                                                                         ; inst 70
}

define void @performFragmentationTest() {
_0.entry.0:
  call void @printlnInt(i32 1830)                                                  ; inst 1
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
  %18 = alloca i32                                                                 ; inst 32
  store i32 0, i32* %18                                                            ; inst 33
  %19 = alloca i32                                                                 ; inst 34
  store i32 0, i32* %19                                                            ; inst 35
  call void @printlnInt(i32 1831)                                                  ; inst 36
  call void @createFragmentationPattern([1000 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, i32* %18, i32* %19) ; inst 37
  call void @printlnInt(i32 1832)                                                  ; inst 38
  %20 = call i32 @measureFragmentation([1000 x i32]* %0, i32 1000)                 ; inst 39
  call void @printlnInt(i32 %20)                                                   ; inst 40
  call void @printlnInt(i32 1833)                                                  ; inst 41
  %21 = call i32 @attemptFragmentedAllocations([1000 x i32]* %0, i32 1000)         ; inst 42
  call void @printlnInt(i32 %21)                                                   ; inst 43
  call void @printlnInt(i32 1834)                                                  ; inst 44
  %22 = call i32 @performMemoryCompaction([1000 x i32]* %0, i32 1000)              ; inst 45
  call void @printlnInt(i32 %22)                                                   ; inst 46
  call void @printlnInt(i32 1835)                                                  ; inst 47
  %23 = call i32 @measureFragmentation([1000 x i32]* %0, i32 1000)                 ; inst 48
  call void @printlnInt(i32 %23)                                                   ; inst 49
  ret void                                                                         ; inst 50
}

define void @createFragmentationPattern([1000 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, i32* %3, i32* %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%36, %_17.if.exit.0]                             ; inst 2
  %6 = phi i32 [0, %_0.entry.0], [%37, %_17.if.exit.0]                             ; inst 3
  %7 = icmp slt i32 %5, 950                                                        ; inst 4
  br i1 %7, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 5
_2.while.body.0:
  %8 = srem i32 %6, 4                                                              ; inst 6
  %9 = add i32 %8, 1                                                               ; inst 7
  %10 = mul i32 %9, 8                                                              ; inst 8
  %11 = srem i32 %6, 3                                                             ; inst 9
  %12 = icmp eq i32 %11, 0                                                         ; inst 10
  br i1 %12, label %_3.if.then.0, label %_13.if.else.0                             ; inst 11
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 12
_4.while.cond.1:
  %13 = phi i32 [0, %_3.if.then.0], [%21, %_8.while.body.1]                        ; inst 13
  %14 = icmp slt i32 %13, %10                                                      ; inst 14
  br i1 %14, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 15
_5.lazy.then.0:
  %15 = add i32 %5, %13                                                            ; inst 16
  %16 = icmp slt i32 %15, 1000                                                     ; inst 17
  br label %_7.lazy.exit.0                                                         ; inst 18
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 19
_7.lazy.exit.0:
  %17 = phi i1 [%16, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 20
  br i1 %17, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 21
_8.while.body.1:
  %18 = add i32 %5, %13                                                            ; inst 22
  %19 = sext i32 %18 to i64                                                        ; inst 23
  %20 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %19               ; inst 24
  store i32 1, i32* %20                                                            ; inst 25
  %21 = add i32 %13, 1                                                             ; inst 26
  br label %_4.while.cond.1                                                        ; inst 27
_9.while.exit.1:
  %22 = load i32, i32* %4                                                          ; inst 28
  %23 = icmp slt i32 %22, 200                                                      ; inst 29
  br i1 %23, label %_10.if.then.1, label %_11.if.else.1                            ; inst 30
_10.if.then.1:
  %24 = load i32, i32* %4                                                          ; inst 31
  %25 = sext i32 %24 to i64                                                        ; inst 32
  %26 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %25                 ; inst 33
  store i32 %5, i32* %26                                                           ; inst 34
  %27 = load i32, i32* %4                                                          ; inst 35
  %28 = add i32 %27, 1                                                             ; inst 36
  store i32 %28, i32* %4                                                           ; inst 37
  br label %_12.if.exit.1                                                          ; inst 38
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 39
_12.if.exit.1:
  br label %_17.if.exit.0                                                          ; inst 40
_13.if.else.0:
  %29 = load i32, i32* %3                                                          ; inst 41
  %30 = icmp slt i32 %29, 200                                                      ; inst 42
  br i1 %30, label %_14.if.then.2, label %_15.if.else.2                            ; inst 43
_14.if.then.2:
  %31 = load i32, i32* %3                                                          ; inst 44
  %32 = sext i32 %31 to i64                                                        ; inst 45
  %33 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %32                 ; inst 46
  store i32 %5, i32* %33                                                           ; inst 47
  %34 = load i32, i32* %3                                                          ; inst 48
  %35 = add i32 %34, 1                                                             ; inst 49
  store i32 %35, i32* %3                                                           ; inst 50
  br label %_16.if.exit.2                                                          ; inst 51
_15.if.else.2:
  br label %_16.if.exit.2                                                          ; inst 52
_16.if.exit.2:
  br label %_17.if.exit.0                                                          ; inst 53
_17.if.exit.0:
  %36 = add i32 %5, %10                                                            ; inst 54
  %37 = add i32 %6, 1                                                              ; inst 55
  br label %_1.while.cond.0                                                        ; inst 56
_18.while.exit.0:
  br label %_19.while.cond.2                                                       ; inst 57
_19.while.cond.2:
  %38 = phi i32 [0, %_18.while.exit.0], [%55, %_29.if.exit.3]                      ; inst 58
  %39 = load i32, i32* %4                                                          ; inst 59
  %40 = icmp slt i32 %38, %39                                                      ; inst 60
  br i1 %40, label %_20.while.body.2, label %_30.while.exit.2                      ; inst 61
_20.while.body.2:
  %41 = srem i32 %38, 3                                                            ; inst 62
  %42 = icmp eq i32 %41, 0                                                         ; inst 63
  br i1 %42, label %_21.if.then.3, label %_28.if.else.3                            ; inst 64
_21.if.then.3:
  %43 = sext i32 %38 to i64                                                        ; inst 65
  %44 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %43                 ; inst 66
  %45 = load i32, i32* %44                                                         ; inst 67
  br label %_22.while.cond.3                                                       ; inst 68
_22.while.cond.3:
  %46 = phi i32 [0, %_21.if.then.3], [%54, %_26.while.body.3]                      ; inst 69
  %47 = icmp slt i32 %46, 16                                                       ; inst 70
  br i1 %47, label %_23.lazy.then.1, label %_24.lazy.else.1                        ; inst 71
_23.lazy.then.1:
  %48 = add i32 %45, %46                                                           ; inst 72
  %49 = icmp slt i32 %48, 1000                                                     ; inst 73
  br label %_25.lazy.exit.1                                                        ; inst 74
_24.lazy.else.1:
  br label %_25.lazy.exit.1                                                        ; inst 75
_25.lazy.exit.1:
  %50 = phi i1 [%49, %_23.lazy.then.1], [0, %_24.lazy.else.1]                      ; inst 76
  br i1 %50, label %_26.while.body.3, label %_27.while.exit.3                      ; inst 77
_26.while.body.3:
  %51 = add i32 %45, %46                                                           ; inst 78
  %52 = sext i32 %51 to i64                                                        ; inst 79
  %53 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %52               ; inst 80
  store i32 0, i32* %53                                                            ; inst 81
  %54 = add i32 %46, 1                                                             ; inst 82
  br label %_22.while.cond.3                                                       ; inst 83
_27.while.exit.3:
  br label %_29.if.exit.3                                                          ; inst 84
_28.if.else.3:
  br label %_29.if.exit.3                                                          ; inst 85
_29.if.exit.3:
  %55 = add i32 %38, 1                                                             ; inst 86
  br label %_19.while.cond.2                                                       ; inst 87
_30.while.exit.2:
  ret void                                                                         ; inst 88
}

define i32 @measureFragmentation([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%22, %_11.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%23, %_11.if.exit.0]                             ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%24, %_11.if.exit.0]                             ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 5
  %6 = phi i32 [0, %_0.entry.0], [%27, %_11.if.exit.0]                             ; inst 6
  %7 = phi i32 [0, %_0.entry.0], [%26, %_11.if.exit.0]                             ; inst 7
  %8 = icmp slt i32 %6, %1                                                         ; inst 8
  br i1 %8, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 9
_2.while.body.0:
  %9 = sext i32 %6 to i64                                                          ; inst 10
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = icmp eq i32 %11, 0                                                         ; inst 13
  br i1 %12, label %_3.if.then.0, label %_10.if.else.0                             ; inst 14
_3.if.then.0:
  %13 = icmp eq i32 %5, 0                                                          ; inst 15
  br i1 %13, label %_4.if.then.1, label %_5.if.else.1                              ; inst 16
_4.if.then.1:
  %14 = add i32 %2, 1                                                              ; inst 17
  br label %_6.if.exit.1                                                           ; inst 18
_5.if.else.1:
  %15 = add i32 %7, 1                                                              ; inst 19
  br label %_6.if.exit.1                                                           ; inst 20
_6.if.exit.1:
  %16 = phi i32 [%14, %_4.if.then.1], [%2, %_5.if.else.1]                          ; inst 21
  %17 = phi i32 [1, %_4.if.then.1], [%5, %_5.if.else.1]                            ; inst 22
  %18 = phi i32 [1, %_4.if.then.1], [%15, %_5.if.else.1]                           ; inst 23
  %19 = add i32 %4, 1                                                              ; inst 24
  %20 = icmp sgt i32 %18, %3                                                       ; inst 25
  br i1 %20, label %_7.if.then.2, label %_8.if.else.2                              ; inst 26
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 27
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 28
_9.if.exit.2:
  %21 = phi i32 [%18, %_7.if.then.2], [%3, %_8.if.else.2]                          ; inst 29
  br label %_11.if.exit.0                                                          ; inst 30
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 31
_11.if.exit.0:
  %22 = phi i32 [%16, %_9.if.exit.2], [%2, %_10.if.else.0]                         ; inst 32
  %23 = phi i32 [%21, %_9.if.exit.2], [%3, %_10.if.else.0]                         ; inst 33
  %24 = phi i32 [%19, %_9.if.exit.2], [%4, %_10.if.else.0]                         ; inst 34
  %25 = phi i32 [%17, %_9.if.exit.2], [0, %_10.if.else.0]                          ; inst 35
  %26 = phi i32 [%18, %_9.if.exit.2], [0, %_10.if.else.0]                          ; inst 36
  %27 = add i32 %6, 1                                                              ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_12.while.exit.0:
  %28 = icmp sgt i32 %2, 0                                                         ; inst 39
  br i1 %28, label %_13.lazy.then.0, label %_14.lazy.else.0                        ; inst 40
_13.lazy.then.0:
  %29 = icmp sgt i32 %4, 0                                                         ; inst 41
  br label %_15.lazy.exit.0                                                        ; inst 42
_14.lazy.else.0:
  br label %_15.lazy.exit.0                                                        ; inst 43
_15.lazy.exit.0:
  %30 = phi i1 [%29, %_13.lazy.then.0], [0, %_14.lazy.else.0]                      ; inst 44
  br i1 %30, label %_16.if.then.3, label %_17.if.else.3                            ; inst 45
_16.if.then.3:
  %31 = mul i32 %2, 100                                                            ; inst 46
  %32 = add i32 %3, 1                                                              ; inst 47
  %33 = sdiv i32 %31, %32                                                          ; inst 48
  ret i32 %33                                                                      ; inst 49
_17.if.else.3:
  ret i32 0                                                                        ; inst 50
_18.if.exit.3:
  unreachable                                                                      ; inst 51
}

define i32 @attemptFragmentedAllocations([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [10 x i32]                                                           ; inst 1
  %3 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 0                      ; inst 2
  store i32 8, i32* %3                                                             ; inst 3
  %4 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 1                      ; inst 4
  store i32 16, i32* %4                                                            ; inst 5
  %5 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 2                      ; inst 6
  store i32 12, i32* %5                                                            ; inst 7
  %6 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 3                      ; inst 8
  store i32 20, i32* %6                                                            ; inst 9
  %7 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 4                      ; inst 10
  store i32 24, i32* %7                                                            ; inst 11
  %8 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 5                      ; inst 12
  store i32 32, i32* %8                                                            ; inst 13
  %9 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 6                      ; inst 14
  store i32 6, i32* %9                                                             ; inst 15
  %10 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 7                     ; inst 16
  store i32 10, i32* %10                                                           ; inst 17
  %11 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 8                     ; inst 18
  store i32 14, i32* %11                                                           ; inst 19
  %12 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 9                     ; inst 20
  store i32 18, i32* %12                                                           ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_1.while.cond.0:
  %13 = phi i32 [0, %_0.entry.0], [%32, %_11.if.exit.0]                            ; inst 23
  %14 = phi i32 [0, %_0.entry.0], [%31, %_11.if.exit.0]                            ; inst 24
  %15 = icmp slt i32 %13, 10                                                       ; inst 25
  br i1 %15, label %_2.while.body.0, label %_12.while.exit.0                       ; inst 26
_2.while.body.0:
  %16 = sext i32 %13 to i64                                                        ; inst 27
  %17 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i64 %16                   ; inst 28
  %18 = load i32, i32* %17                                                         ; inst 29
  %19 = call i32 @findFreeSpace([1000 x i32]* %0, i32 %1, i32 %18)                 ; inst 30
  %20 = icmp ne i32 %19, -1                                                        ; inst 31
  br i1 %20, label %_3.if.then.0, label %_10.if.else.0                             ; inst 32
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 33
_4.while.cond.1:
  %21 = phi i32 [0, %_3.if.then.0], [%29, %_8.while.body.1]                        ; inst 34
  %22 = icmp slt i32 %21, %18                                                      ; inst 35
  br i1 %22, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 36
_5.lazy.then.0:
  %23 = add i32 %19, %21                                                           ; inst 37
  %24 = icmp slt i32 %23, %1                                                       ; inst 38
  br label %_7.lazy.exit.0                                                         ; inst 39
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 40
_7.lazy.exit.0:
  %25 = phi i1 [%24, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 41
  br i1 %25, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 42
_8.while.body.1:
  %26 = add i32 %19, %21                                                           ; inst 43
  %27 = sext i32 %26 to i64                                                        ; inst 44
  %28 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %27               ; inst 45
  store i32 1, i32* %28                                                            ; inst 46
  %29 = add i32 %21, 1                                                             ; inst 47
  br label %_4.while.cond.1                                                        ; inst 48
_9.while.exit.1:
  %30 = add i32 %14, 1                                                             ; inst 49
  br label %_11.if.exit.0                                                          ; inst 50
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 51
_11.if.exit.0:
  %31 = phi i32 [%30, %_9.while.exit.1], [%14, %_10.if.else.0]                     ; inst 52
  %32 = add i32 %13, 1                                                             ; inst 53
  br label %_1.while.cond.0                                                        ; inst 54
_12.while.exit.0:
  ret i32 %14                                                                      ; inst 55
}

define i32 @findFreeSpace([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%16, %_11.if.exit.1]                             ; inst 2
  %4 = sub i32 %1, %2                                                              ; inst 3
  %5 = icmp sle i32 %3, %4                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%13, %_7.if.exit.0]                         ; inst 7
  %7 = icmp slt i32 %6, %2                                                         ; inst 8
  br i1 %7, label %_4.while.body.1, label %_13.critical_edge.0                     ; inst 9
_4.while.body.1:
  %8 = add i32 %3, %6                                                              ; inst 10
  %9 = sext i32 %8 to i64                                                          ; inst 11
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %9                ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = icmp ne i32 %11, 0                                                         ; inst 14
  br i1 %12, label %_5.if.then.0, label %_6.if.else.0                              ; inst 15
_5.if.then.0:
  br label %_8.while.exit.1                                                        ; inst 16
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 17
_7.if.exit.0:
  %13 = add i32 %6, 1                                                              ; inst 18
  br label %_3.while.cond.1                                                        ; inst 19
_8.while.exit.1:
  %14 = phi i32 [1, %_13.critical_edge.0], [0, %_5.if.then.0]                      ; inst 20
  %15 = icmp eq i32 %14, 1                                                         ; inst 21
  br i1 %15, label %_9.if.then.1, label %_10.if.else.1                             ; inst 22
_9.if.then.1:
  ret i32 %3                                                                       ; inst 23
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 24
_11.if.exit.1:
  %16 = add i32 %3, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_12.while.exit.0:
  ret i32 -1                                                                       ; inst 27
_13.critical_edge.0:
  br label %_8.while.exit.1                                                        ; inst 28
}

define i32 @performMemoryCompaction([1000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%34, %_17.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%35, %_17.if.exit.0]                             ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%36, %_17.if.exit.0]                             ; inst 4
  %5 = icmp slt i32 %4, %1                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = sext i32 %4 to i64                                                          ; inst 7
  %7 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %6                 ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp eq i32 %8, 1                                                           ; inst 10
  br i1 %9, label %_3.if.then.0, label %_16.if.else.0                              ; inst 11
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 12
_4.while.cond.1:
  %10 = phi i32 [0, %_3.if.then.0], [%19, %_8.while.body.1]                        ; inst 13
  %11 = add i32 %4, %10                                                            ; inst 14
  %12 = icmp slt i32 %11, %1                                                       ; inst 15
  br i1 %12, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 16
_5.lazy.then.0:
  %13 = add i32 %4, %10                                                            ; inst 17
  %14 = sext i32 %13 to i64                                                        ; inst 18
  %15 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %14               ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = icmp eq i32 %16, 1                                                         ; inst 21
  br label %_7.lazy.exit.0                                                         ; inst 22
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 23
_7.lazy.exit.0:
  %18 = phi i1 [%17, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 24
  br i1 %18, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 25
_8.while.body.1:
  %19 = add i32 %10, 1                                                             ; inst 26
  br label %_4.while.cond.1                                                        ; inst 27
_9.while.exit.1:
  %20 = icmp ne i32 %4, %2                                                         ; inst 28
  br i1 %20, label %_10.if.then.1, label %_14.if.else.1                            ; inst 29
_10.if.then.1:
  br label %_11.while.cond.2                                                       ; inst 30
_11.while.cond.2:
  %21 = phi i32 [0, %_10.if.then.1], [%29, %_12.while.body.2]                      ; inst 31
  %22 = icmp slt i32 %21, %10                                                      ; inst 32
  br i1 %22, label %_12.while.body.2, label %_13.while.exit.2                      ; inst 33
_12.while.body.2:
  %23 = add i32 %2, %21                                                            ; inst 34
  %24 = sext i32 %23 to i64                                                        ; inst 35
  %25 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %24               ; inst 36
  store i32 1, i32* %25                                                            ; inst 37
  %26 = add i32 %4, %21                                                            ; inst 38
  %27 = sext i32 %26 to i64                                                        ; inst 39
  %28 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %27               ; inst 40
  store i32 0, i32* %28                                                            ; inst 41
  %29 = add i32 %21, 1                                                             ; inst 42
  br label %_11.while.cond.2                                                       ; inst 43
_13.while.exit.2:
  br label %_15.if.exit.1                                                          ; inst 44
_14.if.else.1:
  br label %_15.if.exit.1                                                          ; inst 45
_15.if.exit.1:
  %30 = add i32 %2, %10                                                            ; inst 46
  %31 = add i32 %4, %10                                                            ; inst 47
  %32 = add i32 %3, 1                                                              ; inst 48
  br label %_17.if.exit.0                                                          ; inst 49
_16.if.else.0:
  %33 = add i32 %4, 1                                                              ; inst 50
  br label %_17.if.exit.0                                                          ; inst 51
_17.if.exit.0:
  %34 = phi i32 [%30, %_15.if.exit.1], [%2, %_16.if.else.0]                        ; inst 52
  %35 = phi i32 [%32, %_15.if.exit.1], [%3, %_16.if.else.0]                        ; inst 53
  %36 = phi i32 [%31, %_15.if.exit.1], [%33, %_16.if.else.0]                       ; inst 54
  br label %_1.while.cond.0                                                        ; inst 55
_18.while.exit.0:
  br label %_19.while.cond.3                                                       ; inst 56
_19.while.cond.3:
  %37 = phi i32 [%2, %_18.while.exit.0], [%41, %_20.while.body.3]                  ; inst 57
  %38 = icmp slt i32 %37, %1                                                       ; inst 58
  br i1 %38, label %_20.while.body.3, label %_21.while.exit.3                      ; inst 59
_20.while.body.3:
  %39 = sext i32 %37 to i64                                                        ; inst 60
  %40 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %39               ; inst 61
  store i32 0, i32* %40                                                            ; inst 62
  %41 = add i32 %37, 1                                                             ; inst 63
  br label %_19.while.cond.3                                                       ; inst 64
_21.while.exit.3:
  ret i32 %3                                                                       ; inst 65
}

define void @testMemoryEdgeCases() {
_0.entry.0:
  call void @printlnInt(i32 1840)                                                  ; inst 1
  call void @testZeroSizeAllocations()                                             ; inst 2
  call void @testMaxSizeAllocations()                                              ; inst 3
  call void @testAllocationFailures()                                              ; inst 4
  call void @testDoubleFreeDetection()                                             ; inst 5
  call void @testMemoryCorruption()                                                ; inst 6
  call void @printlnInt(i32 1849)                                                  ; inst 7
  ret void                                                                         ; inst 8
}

define void @testZeroSizeAllocations() {
_0.entry.0:
  call void @printlnInt(i32 1841)                                                  ; inst 1
  %0 = alloca [100 x i32]                                                          ; inst 2
  %1 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 100                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeMemoryPool100([100 x i32]* %0)                              ; inst 12
  %6 = call i32 @allocateBlock100([100 x i32]* %0, i32 0, i32 0)                   ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @allocateBlock100([100 x i32]* %0, i32 0, i32 -5)                  ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  ret void                                                                         ; inst 17
}

define void @testMaxSizeAllocations() {
_0.entry.0:
  call void @printlnInt(i32 1842)                                                  ; inst 1
  %0 = alloca [100 x i32]                                                          ; inst 2
  %1 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 100                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeMemoryPool100([100 x i32]* %0)                              ; inst 12
  %6 = call i32 @allocateBlock100([100 x i32]* %0, i32 0, i32 200)                 ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  %7 = call i32 @allocateBlock100([100 x i32]* %0, i32 0, i32 96)                  ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  ret void                                                                         ; inst 17
}

define void @testAllocationFailures() {
_0.entry.0:
  call void @printlnInt(i32 1843)                                                  ; inst 1
  %0 = alloca [50 x i32]                                                           ; inst 2
  %1 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 50                                                         ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeMemoryPool50([50 x i32]* %0)                                ; inst 12
  %6 = alloca [10 x i32]                                                           ; inst 13
  %7 = getelementptr [10 x i32], [10 x i32]* %6, i32 0, i32 0                      ; inst 14
  br label %_4.array.cond.1                                                        ; inst 15
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 16
  %9 = icmp slt i32 %8, 10                                                         ; inst 17
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 18
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 19
  store i32 0, i32* %10                                                            ; inst 20
  %11 = add i32 %8, 1                                                              ; inst 21
  br label %_4.array.cond.1                                                        ; inst 22
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 23
_7.while.cond.0:
  %12 = phi i32 [8, %_6.array.exit.1], [%20, %_11.if.exit.0]                       ; inst 24
  %13 = phi i32 [0, %_6.array.exit.1], [%19, %_11.if.exit.0]                       ; inst 25
  %14 = icmp slt i32 %13, 10                                                       ; inst 26
  br i1 %14, label %_8.while.body.0, label %_13.critical_edge.0                    ; inst 27
_8.while.body.0:
  %15 = call i32 @allocateBlock50([50 x i32]* %0, i32 0, i32 %12)                  ; inst 28
  %16 = icmp eq i32 %15, -1                                                        ; inst 29
  br i1 %16, label %_9.if.then.0, label %_10.if.else.0                             ; inst 30
_9.if.then.0:
  br label %_12.while.exit.0                                                       ; inst 31
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 32
_11.if.exit.0:
  %17 = sext i32 %13 to i64                                                        ; inst 33
  %18 = getelementptr [10 x i32], [10 x i32]* %6, i32 0, i64 %17                   ; inst 34
  store i32 %15, i32* %18                                                          ; inst 35
  %19 = add i32 %13, 1                                                             ; inst 36
  %20 = add i32 %12, 2                                                             ; inst 37
  br label %_7.while.cond.0                                                        ; inst 38
_12.while.exit.0:
  call void @printlnInt(i32 %13)                                                   ; inst 39
  %21 = call i32 @allocateBlock50([50 x i32]* %0, i32 0, i32 4)                    ; inst 40
  call void @printlnInt(i32 %21)                                                   ; inst 41
  ret void                                                                         ; inst 42
_13.critical_edge.0:
  br label %_12.while.exit.0                                                       ; inst 43
}

define void @testDoubleFreeDetection() {
_0.entry.0:
  call void @printlnInt(i32 1844)                                                  ; inst 1
  %0 = alloca [100 x i32]                                                          ; inst 2
  %1 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 100                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  call void @initializeMemoryPool100([100 x i32]* %0)                              ; inst 12
  %6 = call i32 @allocateBlock100([100 x i32]* %0, i32 0, i32 16)                  ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  call void @deallocateBlock100([100 x i32]* %0, i32 %6)                           ; inst 15
  %7 = sext i32 %6 to i64                                                          ; inst 16
  %8 = add i64 %7, 1                                                               ; inst 17
  %9 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %8                   ; inst 18
  %10 = load i32, i32* %9                                                          ; inst 19
  call void @printlnInt(i32 %10)                                                   ; inst 20
  call void @deallocateBlock100([100 x i32]* %0, i32 %6)                           ; inst 21
  %11 = sext i32 %6 to i64                                                         ; inst 22
  %12 = add i64 %11, 1                                                             ; inst 23
  %13 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %12                 ; inst 24
  %14 = load i32, i32* %13                                                         ; inst 25
  call void @printlnInt(i32 %14)                                                   ; inst 26
  ret void                                                                         ; inst 27
}

define void @testMemoryCorruption() {
_0.entry.0:
  call void @printlnInt(i32 1845)                                                  ; inst 1
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
  call void @initializeMemoryPool200([200 x i32]* %0)                              ; inst 12
  %6 = call i32 @allocateBlock200([200 x i32]* %0, i32 0, i32 20)                  ; inst 13
  %7 = call i32 @allocateBlock200([200 x i32]* %0, i32 0, i32 24)                  ; inst 14
  %8 = call i32 @allocateBlock200([200 x i32]* %0, i32 0, i32 16)                  ; inst 15
  %9 = icmp sge i32 %6, 0                                                          ; inst 16
  br i1 %9, label %_4.lazy.then.0, label %_5.lazy.else.0                           ; inst 17
_4.lazy.then.0:
  %10 = add i32 %6, 30                                                             ; inst 18
  %11 = icmp slt i32 %10, 200                                                      ; inst 19
  br label %_6.lazy.exit.0                                                         ; inst 20
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 21
_6.lazy.exit.0:
  %12 = phi i1 [%11, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 22
  br i1 %12, label %_7.if.then.0, label %_8.if.else.0                              ; inst 23
_7.if.then.0:
  %13 = sext i32 %6 to i64                                                         ; inst 24
  %14 = add i64 %13, 25                                                            ; inst 25
  %15 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %14                 ; inst 26
  store i32 99999, i32* %15                                                        ; inst 27
  br label %_9.if.exit.0                                                           ; inst 28
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 29
_9.if.exit.0:
  %16 = call i32 @detectMemoryCorruption([200 x i32]* %0, i32 200)                 ; inst 30
  call void @printlnInt(i32 %16)                                                   ; inst 31
  %17 = call i32 @validateMemoryIntegrity([200 x i32]* %0, i32 200)                ; inst 32
  call void @printlnInt(i32 %17)                                                   ; inst 33
  ret void                                                                         ; inst 34
}

define void @initializeMemoryPool100([100 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 0                    ; inst 1
  store i32 96, i32* %1                                                            ; inst 2
  %2 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 1                    ; inst 3
  store i32 0, i32* %2                                                             ; inst 4
  %3 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 2                    ; inst 5
  store i32 -1, i32* %3                                                            ; inst 6
  %4 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 3                    ; inst 7
  store i32 -1, i32* %4                                                            ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_1.while.cond.0:
  %5 = phi i32 [4, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 10
  %6 = icmp slt i32 %5, 100                                                        ; inst 11
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 12
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 13
  %8 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %7                   ; inst 14
  store i32 0, i32* %8                                                             ; inst 15
  %9 = add i32 %5, 1                                                               ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret void                                                                         ; inst 18
}

define void @initializeMemoryPool50([50 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 0                      ; inst 1
  store i32 46, i32* %1                                                            ; inst 2
  %2 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 1                      ; inst 3
  store i32 0, i32* %2                                                             ; inst 4
  %3 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 2                      ; inst 5
  store i32 -1, i32* %3                                                            ; inst 6
  %4 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 3                      ; inst 7
  store i32 -1, i32* %4                                                            ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_1.while.cond.0:
  %5 = phi i32 [4, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 10
  %6 = icmp slt i32 %5, 50                                                         ; inst 11
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 12
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 13
  %8 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %7                     ; inst 14
  store i32 0, i32* %8                                                             ; inst 15
  %9 = add i32 %5, 1                                                               ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret void                                                                         ; inst 18
}

define void @initializeMemoryPool200([200 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 0                    ; inst 1
  store i32 196, i32* %1                                                           ; inst 2
  %2 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 1                    ; inst 3
  store i32 0, i32* %2                                                             ; inst 4
  %3 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 2                    ; inst 5
  store i32 -1, i32* %3                                                            ; inst 6
  %4 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 3                    ; inst 7
  store i32 -1, i32* %4                                                            ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_1.while.cond.0:
  %5 = phi i32 [4, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 10
  %6 = icmp slt i32 %5, 200                                                        ; inst 11
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 12
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 13
  %8 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %7                   ; inst 14
  store i32 0, i32* %8                                                             ; inst 15
  %9 = add i32 %5, 1                                                               ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret void                                                                         ; inst 18
}

define i32 @allocateBlock100([100 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sle i32 %2, 0                                                          ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %4 = icmp sgt i32 %2, 96                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %5 = phi i1 [1, %_1.lazy.then.0], [%4, %_2.lazy.else.0]                          ; inst 6
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i32 -1                                                                       ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %6 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 1                    ; inst 10
  %7 = load i32, i32* %6                                                           ; inst 11
  %8 = icmp eq i32 %7, 0                                                           ; inst 12
  br i1 %8, label %_7.lazy.then.1, label %_8.lazy.else.1                           ; inst 13
_7.lazy.then.1:
  %9 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 0                    ; inst 14
  %10 = load i32, i32* %9                                                          ; inst 15
  %11 = icmp sge i32 %10, %2                                                       ; inst 16
  br label %_9.lazy.exit.1                                                         ; inst 17
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 18
_9.lazy.exit.1:
  %12 = phi i1 [%11, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 19
  br i1 %12, label %_10.if.then.1, label %_11.if.else.1                            ; inst 20
_10.if.then.1:
  %13 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 0                   ; inst 21
  store i32 %2, i32* %13                                                           ; inst 22
  %14 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 1                   ; inst 23
  store i32 1, i32* %14                                                            ; inst 24
  ret i32 0                                                                        ; inst 25
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 26
_12.if.exit.1:
  ret i32 -1                                                                       ; inst 27
}

define i32 @allocateBlock50([50 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sle i32 %2, 0                                                          ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %4 = icmp sgt i32 %2, 46                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %5 = phi i1 [1, %_1.lazy.then.0], [%4, %_2.lazy.else.0]                          ; inst 6
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i32 -1                                                                       ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  br label %_7.while.cond.0                                                        ; inst 10
_7.while.cond.0:
  %6 = phi i32 [0, %_6.if.exit.0], [%27, %_14.if.exit.1]                           ; inst 11
  %7 = sub i32 46, %2                                                              ; inst 12
  %8 = icmp sle i32 %6, %7                                                         ; inst 13
  br i1 %8, label %_8.while.body.0, label %_15.while.exit.0                        ; inst 14
_8.while.body.0:
  %9 = sext i32 %6 to i64                                                          ; inst 15
  %10 = add i64 %9, 1                                                              ; inst 16
  %11 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %10                   ; inst 17
  %12 = load i32, i32* %11                                                         ; inst 18
  %13 = icmp eq i32 %12, 0                                                         ; inst 19
  br i1 %13, label %_9.if.then.1, label %_13.if.else.1                             ; inst 20
_9.if.then.1:
  %14 = sext i32 %6 to i64                                                         ; inst 21
  %15 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %14                   ; inst 22
  %16 = load i32, i32* %15                                                         ; inst 23
  %17 = icmp sge i32 %16, %2                                                       ; inst 24
  br i1 %17, label %_10.if.then.2, label %_11.if.else.2                            ; inst 25
_10.if.then.2:
  %18 = sext i32 %6 to i64                                                         ; inst 26
  %19 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %18                   ; inst 27
  store i32 %2, i32* %19                                                           ; inst 28
  %20 = sext i32 %6 to i64                                                         ; inst 29
  %21 = add i64 %20, 1                                                             ; inst 30
  %22 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %21                   ; inst 31
  store i32 1, i32* %22                                                            ; inst 32
  ret i32 %6                                                                       ; inst 33
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 34
_12.if.exit.2:
  br label %_14.if.exit.1                                                          ; inst 35
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 36
_14.if.exit.1:
  %23 = sext i32 %6 to i64                                                         ; inst 37
  %24 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %23                   ; inst 38
  %25 = load i32, i32* %24                                                         ; inst 39
  %26 = add i32 %6, %25                                                            ; inst 40
  %27 = add i32 %26, 4                                                             ; inst 41
  br label %_7.while.cond.0                                                        ; inst 42
_15.while.exit.0:
  ret i32 -1                                                                       ; inst 43
}

define i32 @allocateBlock200([200 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sle i32 %2, 0                                                          ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %4 = icmp sgt i32 %2, 196                                                        ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %5 = phi i1 [1, %_1.lazy.then.0], [%4, %_2.lazy.else.0]                          ; inst 6
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i32 -1                                                                       ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %6 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 1                    ; inst 10
  %7 = load i32, i32* %6                                                           ; inst 11
  %8 = icmp eq i32 %7, 0                                                           ; inst 12
  br i1 %8, label %_7.lazy.then.1, label %_8.lazy.else.1                           ; inst 13
_7.lazy.then.1:
  %9 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 0                    ; inst 14
  %10 = load i32, i32* %9                                                          ; inst 15
  %11 = icmp sge i32 %10, %2                                                       ; inst 16
  br label %_9.lazy.exit.1                                                         ; inst 17
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 18
_9.lazy.exit.1:
  %12 = phi i1 [%11, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 19
  br i1 %12, label %_10.if.then.1, label %_11.if.else.1                            ; inst 20
_10.if.then.1:
  %13 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 0                   ; inst 21
  store i32 %2, i32* %13                                                           ; inst 22
  %14 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 1                   ; inst 23
  store i32 1, i32* %14                                                            ; inst 24
  ret i32 0                                                                        ; inst 25
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 26
_12.if.exit.1:
  ret i32 -1                                                                       ; inst 27
}

define void @deallocateBlock100([100 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp sge i32 %1, 0                                                          ; inst 1
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  %3 = add i32 %1, 1                                                               ; inst 3
  %4 = icmp slt i32 %3, 100                                                        ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 6
_3.lazy.exit.0:
  %5 = phi i1 [%4, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 7
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 8
_4.if.then.0:
  %6 = sext i32 %1 to i64                                                          ; inst 9
  %7 = add i64 %6, 1                                                               ; inst 10
  %8 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %7                   ; inst 11
  store i32 0, i32* %8                                                             ; inst 12
  br label %_6.if.exit.0                                                           ; inst 13
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 14
_6.if.exit.0:
  ret void                                                                         ; inst 15
}

define i32 @detectMemoryCorruption([200 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%16, %_8.if.exit.0]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%15, %_8.if.exit.0]                              ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %5                   ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp sgt i32 %7, 10000                                                      ; inst 9
  br i1 %8, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 10
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 11
_4.lazy.else.0:
  %9 = sext i32 %2 to i64                                                          ; inst 12
  %10 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %9                  ; inst 13
  %11 = load i32, i32* %10                                                         ; inst 14
  %12 = icmp slt i32 %11, -1000                                                    ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_5.lazy.exit.0:
  %13 = phi i1 [1, %_3.lazy.then.0], [%12, %_4.lazy.else.0]                        ; inst 17
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 18
_6.if.then.0:
  %14 = add i32 %3, 1                                                              ; inst 19
  br label %_8.if.exit.0                                                           ; inst 20
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 21
_8.if.exit.0:
  %15 = phi i32 [%14, %_6.if.then.0], [%3, %_7.if.else.0]                          ; inst 22
  %16 = add i32 %2, 1                                                              ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_9.while.exit.0:
  ret i32 %3                                                                       ; inst 25
}

define i32 @validateMemoryIntegrity([200 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%38, %_20.if.exit.1]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%28, %_20.if.exit.1]                             ; inst 3
  %4 = sub i32 %1, 4                                                               ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp sgt i32 %8, 0                                                          ; inst 10
  br i1 %9, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 11
_3.lazy.then.0:
  %10 = sext i32 %2 to i64                                                         ; inst 12
  %11 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %10                 ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = icmp sle i32 %12, 100                                                      ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %14 = phi i1 [%13, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 18
  br i1 %14, label %_6.lazy.then.1, label %_10.lazy.else.1                         ; inst 19
_6.lazy.then.1:
  %15 = sext i32 %2 to i64                                                         ; inst 20
  %16 = add i64 %15, 1                                                             ; inst 21
  %17 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %16                 ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = icmp eq i32 %18, 0                                                         ; inst 24
  br i1 %19, label %_7.lazy.then.2, label %_8.lazy.else.2                          ; inst 25
_7.lazy.then.2:
  br label %_9.lazy.exit.2                                                         ; inst 26
_8.lazy.else.2:
  %20 = sext i32 %2 to i64                                                         ; inst 27
  %21 = add i64 %20, 1                                                             ; inst 28
  %22 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %21                 ; inst 29
  %23 = load i32, i32* %22                                                         ; inst 30
  %24 = icmp eq i32 %23, 1                                                         ; inst 31
  br label %_9.lazy.exit.2                                                         ; inst 32
_9.lazy.exit.2:
  %25 = phi i1 [1, %_7.lazy.then.2], [%24, %_8.lazy.else.2]                        ; inst 33
  br label %_11.lazy.exit.1                                                        ; inst 34
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 35
_11.lazy.exit.1:
  %26 = phi i1 [%25, %_9.lazy.exit.2], [0, %_10.lazy.else.1]                       ; inst 36
  br i1 %26, label %_12.if.then.0, label %_13.if.else.0                            ; inst 37
_12.if.then.0:
  %27 = add i32 %3, 1                                                              ; inst 38
  br label %_14.if.exit.0                                                          ; inst 39
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 40
_14.if.exit.0:
  %28 = phi i32 [%27, %_12.if.then.0], [%3, %_13.if.else.0]                        ; inst 41
  %29 = sext i32 %2 to i64                                                         ; inst 42
  %30 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %29                 ; inst 43
  %31 = load i32, i32* %30                                                         ; inst 44
  %32 = add i32 %31, 4                                                             ; inst 45
  %33 = icmp sgt i32 %32, 0                                                        ; inst 46
  br i1 %33, label %_15.lazy.then.3, label %_16.lazy.else.3                        ; inst 47
_15.lazy.then.3:
  %34 = icmp slt i32 %32, 50                                                       ; inst 48
  br label %_17.lazy.exit.3                                                        ; inst 49
_16.lazy.else.3:
  br label %_17.lazy.exit.3                                                        ; inst 50
_17.lazy.exit.3:
  %35 = phi i1 [%34, %_15.lazy.then.3], [0, %_16.lazy.else.3]                      ; inst 51
  br i1 %35, label %_18.if.then.1, label %_19.if.else.1                            ; inst 52
_18.if.then.1:
  %36 = add i32 %2, %32                                                            ; inst 53
  br label %_20.if.exit.1                                                          ; inst 54
_19.if.else.1:
  %37 = add i32 %2, 4                                                              ; inst 55
  br label %_20.if.exit.1                                                          ; inst 56
_20.if.exit.1:
  %38 = phi i32 [%36, %_18.if.then.1], [%37, %_19.if.else.1]                       ; inst 57
  br label %_1.while.cond.0                                                        ; inst 58
_21.while.exit.0:
  ret i32 %3                                                                       ; inst 59
}

