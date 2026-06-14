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
  call void @generate_text([1024 x i32]* %0, i32 12345)                            ; inst 11
  %6 = alloca [64 x i32]                                                           ; inst 12
  %7 = getelementptr [64 x i32], [64 x i32]* %6, i32 0, i32 0                      ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 64                                                         ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %12 = getelementptr [64 x i32], [64 x i32]* %6, i32 0, i64 0                     ; inst 22
  store i32 65, i32* %12                                                           ; inst 23
  %13 = getelementptr [64 x i32], [64 x i32]* %6, i32 0, i64 1                     ; inst 24
  store i32 66, i32* %13                                                           ; inst 25
  %14 = getelementptr [64 x i32], [64 x i32]* %6, i32 0, i64 2                     ; inst 26
  store i32 67, i32* %14                                                           ; inst 27
  %15 = alloca [64 x i32]                                                          ; inst 28
  %16 = getelementptr [64 x i32], [64 x i32]* %15, i32 0, i32 0                    ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_7.array.cond.2:
  %17 = phi i32 [0, %_6.array.exit.1], [%20, %_8.array.body.2]                     ; inst 31
  %18 = icmp slt i32 %17, 64                                                       ; inst 32
  br i1 %18, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 33
_8.array.body.2:
  %19 = getelementptr i32, i32* %16, i32 %17                                       ; inst 34
  store i32 0, i32* %19                                                            ; inst 35
  %20 = add i32 %17, 1                                                             ; inst 36
  br label %_7.array.cond.2                                                        ; inst 37
_9.array.exit.2:
  %21 = getelementptr [64 x i32], [64 x i32]* %15, i32 0, i64 0                    ; inst 38
  store i32 88, i32* %21                                                           ; inst 39
  %22 = getelementptr [64 x i32], [64 x i32]* %15, i32 0, i64 1                    ; inst 40
  store i32 89, i32* %22                                                           ; inst 41
  %23 = getelementptr [64 x i32], [64 x i32]* %15, i32 0, i64 2                    ; inst 42
  store i32 90, i32* %23                                                           ; inst 43
  %24 = getelementptr [64 x i32], [64 x i32]* %15, i32 0, i64 3                    ; inst 44
  store i32 88, i32* %24                                                           ; inst 45
  %25 = getelementptr [64 x i32], [64 x i32]* %15, i32 0, i64 4                    ; inst 46
  store i32 89, i32* %25                                                           ; inst 47
  %26 = alloca [64 x i32]                                                          ; inst 48
  %27 = getelementptr [64 x i32], [64 x i32]* %26, i32 0, i32 0                    ; inst 49
  br label %_10.array.cond.3                                                       ; inst 50
_10.array.cond.3:
  %28 = phi i32 [0, %_9.array.exit.2], [%31, %_11.array.body.3]                    ; inst 51
  %29 = icmp slt i32 %28, 64                                                       ; inst 52
  br i1 %29, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 53
_11.array.body.3:
  %30 = getelementptr i32, i32* %27, i32 %28                                       ; inst 54
  store i32 0, i32* %30                                                            ; inst 55
  %31 = add i32 %28, 1                                                             ; inst 56
  br label %_10.array.cond.3                                                       ; inst 57
_12.array.exit.3:
  %32 = getelementptr [64 x i32], [64 x i32]* %26, i32 0, i64 0                    ; inst 58
  store i32 100, i32* %32                                                          ; inst 59
  %33 = getelementptr [64 x i32], [64 x i32]* %26, i32 0, i64 1                    ; inst 60
  store i32 100, i32* %33                                                          ; inst 61
  %34 = call i32 @find_pattern([1024 x i32]* %0, [64 x i32]* %6, i32 3)            ; inst 62
  call void @printlnInt(i32 %34)                                                   ; inst 63
  %35 = call i32 @find_pattern_with_wildcard([1024 x i32]* %0, [64 x i32]* %15, i32 5, i32 90) ; inst 64
  call void @printlnInt(i32 %35)                                                   ; inst 65
  %36 = call i32 @find_complex_pattern([1024 x i32]* %0)                           ; inst 66
  call void @printlnInt(i32 %36)                                                   ; inst 67
  %37 = call i32 @analyze_text_frequency([1024 x i32]* %0)                         ; inst 68
  call void @printlnInt(i32 %37)                                                   ; inst 69
  %38 = call i32 @trigger_error_path([1024 x i32]* %0, [64 x i32]* %6, i32 3)      ; inst 70
  call void @printlnInt(i32 %38)                                                   ; inst 71
  call void @printlnInt(i32 9999)                                                  ; inst 72
  call void @exit(i32 0)                                                           ; inst 73
  ret void                                                                         ; inst 74
}

define void @generate_text([1024 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%27, %_11.if.exit.2]                             ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%8, %_11.if.exit.2]                             ; inst 3
  %4 = trunc i64 1024 to i32                                                       ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = call i32 @pm_rand_update(i32 %3)                                            ; inst 7
  %7 = sdiv i32 %6, 65536                                                          ; inst 8
  %8 = srem i32 %7, 32768                                                          ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %9                ; inst 11
  %11 = srem i32 %8, 26                                                            ; inst 12
  %12 = add i32 65, %11                                                            ; inst 13
  store i32 %12, i32* %10                                                          ; inst 14
  %13 = srem i32 %2, 10                                                            ; inst 15
  %14 = icmp eq i32 %13, 0                                                         ; inst 16
  br i1 %14, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  %15 = sext i32 %2 to i64                                                         ; inst 18
  %16 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %15               ; inst 19
  %17 = sdiv i32 %2, 100                                                           ; inst 20
  %18 = add i32 65, %17                                                            ; inst 21
  store i32 %18, i32* %16                                                          ; inst 22
  br label %_5.if.exit.0                                                           ; inst 23
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 24
_5.if.exit.0:
  %19 = srem i32 %2, 27                                                            ; inst 25
  %20 = icmp eq i32 %19, 0                                                         ; inst 26
  br i1 %20, label %_6.if.then.1, label %_7.if.else.1                              ; inst 27
_6.if.then.1:
  %21 = sext i32 %2 to i64                                                         ; inst 28
  %22 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %21               ; inst 29
  store i32 66, i32* %22                                                           ; inst 30
  br label %_8.if.exit.1                                                           ; inst 31
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 32
_8.if.exit.1:
  %23 = srem i32 %2, 42                                                            ; inst 33
  %24 = icmp eq i32 %23, 0                                                         ; inst 34
  br i1 %24, label %_9.if.then.2, label %_10.if.else.2                             ; inst 35
_9.if.then.2:
  %25 = sext i32 %2 to i64                                                         ; inst 36
  %26 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %25               ; inst 37
  store i32 67, i32* %26                                                           ; inst 38
  br label %_11.if.exit.2                                                          ; inst 39
_10.if.else.2:
  br label %_11.if.exit.2                                                          ; inst 40
_11.if.exit.2:
  %27 = add i32 %2, 1                                                              ; inst 41
  br label %_1.while.cond.0                                                        ; inst 42
_12.while.exit.0:
  ret void                                                                         ; inst 43
}

define i32 @find_pattern([1024 x i32]* %0, [64 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%22, %_11.if.exit.1]                             ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%21, %_11.if.exit.1]                             ; inst 3
  %5 = trunc i64 1024 to i32                                                       ; inst 4
  %6 = sub i32 %5, %2                                                              ; inst 5
  %7 = icmp sle i32 %3, %6                                                         ; inst 6
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %8 = phi i32 [0, %_2.while.body.0], [%18, %_7.if.exit.0]                         ; inst 9
  %9 = icmp slt i32 %8, %2                                                         ; inst 10
  br i1 %9, label %_4.while.body.1, label %_13.critical_edge.0                     ; inst 11
_4.while.body.1:
  %10 = add i32 %3, %8                                                             ; inst 12
  %11 = sext i32 %10 to i64                                                        ; inst 13
  %12 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %11               ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = sext i32 %8 to i64                                                         ; inst 16
  %15 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %14                   ; inst 17
  %16 = load i32, i32* %15                                                         ; inst 18
  %17 = icmp ne i32 %13, %16                                                       ; inst 19
  br i1 %17, label %_5.if.then.0, label %_6.if.else.0                              ; inst 20
_5.if.then.0:
  br label %_8.while.exit.1                                                        ; inst 21
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 22
_7.if.exit.0:
  %18 = add i32 %8, 1                                                              ; inst 23
  br label %_3.while.cond.1                                                        ; inst 24
_8.while.exit.1:
  %19 = phi i1 [1, %_13.critical_edge.0], [0, %_5.if.then.0]                       ; inst 25
  br i1 %19, label %_9.if.then.1, label %_10.if.else.1                             ; inst 26
_9.if.then.1:
  %20 = add i32 %4, 1                                                              ; inst 27
  br label %_11.if.exit.1                                                          ; inst 28
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 29
_11.if.exit.1:
  %21 = phi i32 [%20, %_9.if.then.1], [%4, %_10.if.else.1]                         ; inst 30
  %22 = add i32 %3, 1                                                              ; inst 31
  br label %_1.while.cond.0                                                        ; inst 32
_12.while.exit.0:
  ret i32 %4                                                                       ; inst 33
_13.critical_edge.0:
  br label %_8.while.exit.1                                                        ; inst 34
}

define i32 @find_pattern_with_wildcard([1024 x i32]* %0, [64 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%28, %_14.if.exit.1]                             ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%27, %_14.if.exit.1]                             ; inst 3
  %6 = trunc i64 1024 to i32                                                       ; inst 4
  %7 = sub i32 %6, %2                                                              ; inst 5
  %8 = icmp sle i32 %4, %7                                                         ; inst 6
  br i1 %8, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %9 = phi i32 [0, %_2.while.body.0], [%24, %_10.if.exit.0]                        ; inst 9
  %10 = icmp slt i32 %9, %2                                                        ; inst 10
  br i1 %10, label %_4.while.body.1, label %_16.critical_edge.0                    ; inst 11
_4.while.body.1:
  %11 = sext i32 %9 to i64                                                         ; inst 12
  %12 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %11                   ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = icmp ne i32 %13, %3                                                        ; inst 15
  br i1 %14, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 16
_5.lazy.then.0:
  %15 = add i32 %4, %9                                                             ; inst 17
  %16 = sext i32 %15 to i64                                                        ; inst 18
  %17 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %16               ; inst 19
  %18 = load i32, i32* %17                                                         ; inst 20
  %19 = sext i32 %9 to i64                                                         ; inst 21
  %20 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %19                   ; inst 22
  %21 = load i32, i32* %20                                                         ; inst 23
  %22 = icmp ne i32 %18, %21                                                       ; inst 24
  br label %_7.lazy.exit.0                                                         ; inst 25
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 26
_7.lazy.exit.0:
  %23 = phi i1 [%22, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 27
  br i1 %23, label %_8.if.then.0, label %_9.if.else.0                              ; inst 28
_8.if.then.0:
  br label %_11.while.exit.1                                                       ; inst 29
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 30
_10.if.exit.0:
  %24 = add i32 %9, 1                                                              ; inst 31
  br label %_3.while.cond.1                                                        ; inst 32
_11.while.exit.1:
  %25 = phi i1 [1, %_16.critical_edge.0], [0, %_8.if.then.0]                       ; inst 33
  br i1 %25, label %_12.if.then.1, label %_13.if.else.1                            ; inst 34
_12.if.then.1:
  %26 = add i32 %5, 1                                                              ; inst 35
  br label %_14.if.exit.1                                                          ; inst 36
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 37
_14.if.exit.1:
  %27 = phi i32 [%26, %_12.if.then.1], [%5, %_13.if.else.1]                        ; inst 38
  %28 = add i32 %4, 1                                                              ; inst 39
  br label %_1.while.cond.0                                                        ; inst 40
_15.while.exit.0:
  ret i32 %5                                                                       ; inst 41
_16.critical_edge.0:
  br label %_11.while.exit.1                                                       ; inst 42
}

define i32 @find_complex_pattern([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%46, %_17.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%45, %_17.if.exit.0]                             ; inst 3
  %3 = trunc i64 1024 to i32                                                       ; inst 4
  %4 = sub i32 %3, 5                                                               ; inst 5
  %5 = icmp slt i32 %1, %4                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 7
_2.while.body.0:
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = sext i32 %1 to i64                                                          ; inst 11
  %10 = add i64 %9, 3                                                              ; inst 12
  %11 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %10               ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = icmp eq i32 %8, %12                                                        ; inst 15
  br i1 %13, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 16
_3.lazy.then.0:
  %14 = sext i32 %1 to i64                                                         ; inst 17
  %15 = add i64 %14, 1                                                             ; inst 18
  %16 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %15               ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = sext i32 %1 to i64                                                         ; inst 21
  %19 = add i64 %18, 4                                                             ; inst 22
  %20 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %19               ; inst 23
  %21 = load i32, i32* %20                                                         ; inst 24
  %22 = icmp eq i32 %17, %21                                                       ; inst 25
  br label %_5.lazy.exit.0                                                         ; inst 26
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 27
_5.lazy.exit.0:
  %23 = phi i1 [%22, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 28
  br i1 %23, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 29
_6.lazy.then.1:
  %24 = sext i32 %1 to i64                                                         ; inst 30
  %25 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %24               ; inst 31
  %26 = load i32, i32* %25                                                         ; inst 32
  %27 = sext i32 %1 to i64                                                         ; inst 33
  %28 = add i64 %27, 2                                                             ; inst 34
  %29 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %28               ; inst 35
  %30 = load i32, i32* %29                                                         ; inst 36
  %31 = icmp slt i32 %26, %30                                                      ; inst 37
  br label %_8.lazy.exit.1                                                         ; inst 38
_7.lazy.else.1:
  br label %_8.lazy.exit.1                                                         ; inst 39
_8.lazy.exit.1:
  %32 = phi i1 [%31, %_6.lazy.then.1], [0, %_7.lazy.else.1]                        ; inst 40
  br i1 %32, label %_9.if.then.0, label %_16.if.else.0                             ; inst 41
_9.if.then.0:
  br label %_10.while.cond.1                                                       ; inst 42
_10.while.cond.1:
  %33 = phi i32 [0, %_9.if.then.0], [%41, %_11.while.body.1]                       ; inst 43
  %34 = phi i32 [0, %_9.if.then.0], [%40, %_11.while.body.1]                       ; inst 44
  %35 = icmp slt i32 %33, 5                                                        ; inst 45
  br i1 %35, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 46
_11.while.body.1:
  %36 = add i32 %1, %33                                                            ; inst 47
  %37 = sext i32 %36 to i64                                                        ; inst 48
  %38 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %37               ; inst 49
  %39 = load i32, i32* %38                                                         ; inst 50
  %40 = add i32 %34, %39                                                           ; inst 51
  %41 = add i32 %33, 1                                                             ; inst 52
  br label %_10.while.cond.1                                                       ; inst 53
_12.while.exit.1:
  %42 = icmp sgt i32 %34, 350                                                      ; inst 54
  br i1 %42, label %_13.if.then.1, label %_14.if.else.1                            ; inst 55
_13.if.then.1:
  %43 = add i32 %2, 1                                                              ; inst 56
  br label %_15.if.exit.1                                                          ; inst 57
_14.if.else.1:
  br label %_15.if.exit.1                                                          ; inst 58
_15.if.exit.1:
  %44 = phi i32 [%43, %_13.if.then.1], [%2, %_14.if.else.1]                        ; inst 59
  br label %_17.if.exit.0                                                          ; inst 60
_16.if.else.0:
  br label %_17.if.exit.0                                                          ; inst 61
_17.if.exit.0:
  %45 = phi i32 [%44, %_15.if.exit.1], [%2, %_16.if.else.0]                        ; inst 62
  %46 = add i32 %1, 1                                                              ; inst 63
  br label %_1.while.cond.0                                                        ; inst 64
_18.while.exit.0:
  ret i32 %2                                                                       ; inst 65
}

define i32 @analyze_text_frequency([1024 x i32]* %0) {
_0.entry.0:
  %1 = alloca [26 x i32]                                                           ; inst 1
  %2 = getelementptr [26 x i32], [26 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 26                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i32 [0, %_3.array.exit.0], [%24, %_11.if.exit.0]                        ; inst 12
  %8 = trunc i64 1024 to i32                                                       ; inst 13
  %9 = icmp slt i32 %7, %8                                                         ; inst 14
  br i1 %9, label %_5.while.body.0, label %_12.while.exit.0                        ; inst 15
_5.while.body.0:
  %10 = sext i32 %7 to i64                                                         ; inst 16
  %11 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %10               ; inst 17
  %12 = load i32, i32* %11                                                         ; inst 18
  %13 = icmp sge i32 %12, 65                                                       ; inst 19
  br i1 %13, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 20
_6.lazy.then.0:
  %14 = icmp sle i32 %12, 90                                                       ; inst 21
  br label %_8.lazy.exit.0                                                         ; inst 22
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 23
_8.lazy.exit.0:
  %15 = phi i1 [%14, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 24
  br i1 %15, label %_9.if.then.0, label %_10.if.else.0                             ; inst 25
_9.if.then.0:
  %16 = sext i32 %12 to i64                                                        ; inst 26
  %17 = sub i64 %16, 65                                                            ; inst 27
  %18 = getelementptr [26 x i32], [26 x i32]* %1, i32 0, i64 %17                   ; inst 28
  %19 = sext i32 %12 to i64                                                        ; inst 29
  %20 = sub i64 %19, 65                                                            ; inst 30
  %21 = getelementptr [26 x i32], [26 x i32]* %1, i32 0, i64 %20                   ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  %23 = add i32 %22, 1                                                             ; inst 33
  store i32 %23, i32* %18                                                          ; inst 34
  br label %_11.if.exit.0                                                          ; inst 35
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 36
_11.if.exit.0:
  %24 = add i32 %7, 1                                                              ; inst 37
  br label %_4.while.cond.0                                                        ; inst 38
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 39
_13.while.cond.1:
  %25 = phi i32 [-1, %_12.while.exit.0], [%37, %_17.if.exit.1]                     ; inst 40
  %26 = phi i32 [0, %_12.while.exit.0], [%38, %_17.if.exit.1]                      ; inst 41
  %27 = phi i32 [0, %_12.while.exit.0], [%39, %_17.if.exit.1]                      ; inst 42
  %28 = icmp slt i32 %27, 26                                                       ; inst 43
  br i1 %28, label %_14.while.body.1, label %_18.while.exit.1                      ; inst 44
_14.while.body.1:
  %29 = sext i32 %27 to i64                                                        ; inst 45
  %30 = getelementptr [26 x i32], [26 x i32]* %1, i32 0, i64 %29                   ; inst 46
  %31 = load i32, i32* %30                                                         ; inst 47
  %32 = icmp sgt i32 %31, %26                                                      ; inst 48
  br i1 %32, label %_15.if.then.1, label %_16.if.else.1                            ; inst 49
_15.if.then.1:
  %33 = sext i32 %27 to i64                                                        ; inst 50
  %34 = getelementptr [26 x i32], [26 x i32]* %1, i32 0, i64 %33                   ; inst 51
  %35 = load i32, i32* %34                                                         ; inst 52
  %36 = add i32 %27, 65                                                            ; inst 53
  br label %_17.if.exit.1                                                          ; inst 54
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 55
_17.if.exit.1:
  %37 = phi i32 [%36, %_15.if.then.1], [%25, %_16.if.else.1]                       ; inst 56
  %38 = phi i32 [%35, %_15.if.then.1], [%26, %_16.if.else.1]                       ; inst 57
  %39 = add i32 %27, 1                                                             ; inst 58
  br label %_13.while.cond.1                                                       ; inst 59
_18.while.exit.1:
  %40 = mul i32 %25, 1000                                                          ; inst 60
  %41 = add i32 %40, %26                                                           ; inst 61
  ret i32 %41                                                                      ; inst 62
}

define i32 @state_machine_search([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%32, %_32.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%33, %_32.if.exit.0]                             ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%34, %_32.if.exit.0]                             ; inst 4
  %4 = trunc i64 1024 to i32                                                       ; inst 5
  %5 = icmp slt i32 %3, %4                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_33.while.exit.0                        ; inst 7
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = icmp eq i32 %1, 0                                                           ; inst 11
  br i1 %9, label %_3.if.then.0, label %_7.if.else.0                               ; inst 12
_3.if.then.0:
  %10 = icmp eq i32 %8, 65                                                         ; inst 13
  br i1 %10, label %_4.if.then.1, label %_5.if.else.1                              ; inst 14
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 15
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 16
_6.if.exit.1:
  %11 = phi i32 [1, %_4.if.then.1], [%1, %_5.if.else.1]                            ; inst 17
  br label %_32.if.exit.0                                                          ; inst 18
_7.if.else.0:
  %12 = icmp eq i32 %1, 1                                                          ; inst 19
  br i1 %12, label %_8.if.then.2, label %_15.if.else.2                             ; inst 20
_8.if.then.2:
  %13 = icmp eq i32 %8, 66                                                         ; inst 21
  br i1 %13, label %_9.if.then.3, label %_10.if.else.3                             ; inst 22
_9.if.then.3:
  br label %_14.if.exit.3                                                          ; inst 23
_10.if.else.3:
  %14 = icmp ne i32 %8, 65                                                         ; inst 24
  br i1 %14, label %_11.if.then.4, label %_12.if.else.4                            ; inst 25
_11.if.then.4:
  br label %_13.if.exit.4                                                          ; inst 26
_12.if.else.4:
  br label %_13.if.exit.4                                                          ; inst 27
_13.if.exit.4:
  %15 = phi i32 [0, %_11.if.then.4], [%1, %_12.if.else.4]                          ; inst 28
  br label %_14.if.exit.3                                                          ; inst 29
_14.if.exit.3:
  %16 = phi i32 [2, %_9.if.then.3], [%15, %_13.if.exit.4]                          ; inst 30
  br label %_31.if.exit.2                                                          ; inst 31
_15.if.else.2:
  %17 = icmp eq i32 %1, 2                                                          ; inst 32
  br i1 %17, label %_16.if.then.5, label %_23.if.else.5                            ; inst 33
_16.if.then.5:
  %18 = icmp eq i32 %8, 67                                                         ; inst 34
  br i1 %18, label %_17.if.then.6, label %_18.if.else.6                            ; inst 35
_17.if.then.6:
  br label %_22.if.exit.6                                                          ; inst 36
_18.if.else.6:
  %19 = icmp eq i32 %8, 65                                                         ; inst 37
  br i1 %19, label %_19.if.then.7, label %_20.if.else.7                            ; inst 38
_19.if.then.7:
  br label %_21.if.exit.7                                                          ; inst 39
_20.if.else.7:
  br label %_21.if.exit.7                                                          ; inst 40
_21.if.exit.7:
  %20 = phi i32 [1, %_19.if.then.7], [0, %_20.if.else.7]                           ; inst 41
  br label %_22.if.exit.6                                                          ; inst 42
_22.if.exit.6:
  %21 = phi i32 [3, %_17.if.then.6], [%20, %_21.if.exit.7]                         ; inst 43
  br label %_30.if.exit.5                                                          ; inst 44
_23.if.else.5:
  %22 = icmp eq i32 %1, 3                                                          ; inst 45
  br i1 %22, label %_24.if.then.8, label %_28.if.else.8                            ; inst 46
_24.if.then.8:
  %23 = add i32 %2, 1                                                              ; inst 47
  %24 = icmp eq i32 %8, 65                                                         ; inst 48
  br i1 %24, label %_25.if.then.9, label %_26.if.else.9                            ; inst 49
_25.if.then.9:
  br label %_27.if.exit.9                                                          ; inst 50
_26.if.else.9:
  br label %_27.if.exit.9                                                          ; inst 51
_27.if.exit.9:
  %25 = phi i32 [1, %_25.if.then.9], [0, %_26.if.else.9]                           ; inst 52
  br label %_29.if.exit.8                                                          ; inst 53
_28.if.else.8:
  br label %_29.if.exit.8                                                          ; inst 54
_29.if.exit.8:
  %26 = phi i32 [%25, %_27.if.exit.9], [%1, %_28.if.else.8]                        ; inst 55
  %27 = phi i32 [%23, %_27.if.exit.9], [%2, %_28.if.else.8]                        ; inst 56
  br label %_30.if.exit.5                                                          ; inst 57
_30.if.exit.5:
  %28 = phi i32 [%21, %_22.if.exit.6], [%26, %_29.if.exit.8]                       ; inst 58
  %29 = phi i32 [%2, %_22.if.exit.6], [%27, %_29.if.exit.8]                        ; inst 59
  br label %_31.if.exit.2                                                          ; inst 60
_31.if.exit.2:
  %30 = phi i32 [%16, %_14.if.exit.3], [%28, %_30.if.exit.5]                       ; inst 61
  %31 = phi i32 [%2, %_14.if.exit.3], [%29, %_30.if.exit.5]                        ; inst 62
  br label %_32.if.exit.0                                                          ; inst 63
_32.if.exit.0:
  %32 = phi i32 [%11, %_6.if.exit.1], [%30, %_31.if.exit.2]                        ; inst 64
  %33 = phi i32 [%2, %_6.if.exit.1], [%31, %_31.if.exit.2]                         ; inst 65
  %34 = add i32 %3, 1                                                              ; inst 66
  br label %_1.while.cond.0                                                        ; inst 67
_33.while.exit.0:
  ret i32 %2                                                                       ; inst 68
}

define i32 @trigger_error_path([1024 x i32]* %0, [64 x i32]* %1, i32 %2) {
_0.entry.0:
  %3 = alloca [1024 x i32]                                                         ; inst 1
  call void @memcpy([1024 x i32]* %3, [1024 x i32]* %0, i64 4096)                  ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 4
  %5 = trunc i64 1024 to i32                                                       ; inst 5
  %6 = icmp slt i32 %4, %5                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = sext i32 %4 to i64                                                          ; inst 8
  %8 = getelementptr [1024 x i32], [1024 x i32]* %3, i32 0, i64 %7                 ; inst 9
  %9 = sext i32 %4 to i64                                                          ; inst 10
  %10 = getelementptr [1024 x i32], [1024 x i32]* %3, i32 0, i64 %9                ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = srem i32 %4, 10                                                            ; inst 13
  %13 = add i32 %11, %12                                                           ; inst 14
  store i32 %13, i32* %8                                                           ; inst 15
  %14 = add i32 %4, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 18
_4.while.cond.1:
  %15 = phi i32 [0, %_3.while.exit.0], [%46, %_26.if.exit.1]                       ; inst 19
  %16 = phi i32 [0, %_3.while.exit.0], [%47, %_26.if.exit.1]                       ; inst 20
  %17 = trunc i64 1024 to i32                                                      ; inst 21
  %18 = sub i32 %17, %2                                                            ; inst 22
  %19 = icmp sle i32 %16, %18                                                      ; inst 23
  br i1 %19, label %_5.while.body.1, label %_27.while.exit.1                       ; inst 24
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 25
_6.while.cond.2:
  %20 = phi i32 [0, %_5.while.body.1], [%32, %_10.if.exit.0]                       ; inst 26
  %21 = phi i32 [0, %_5.while.body.1], [%33, %_10.if.exit.0]                       ; inst 27
  %22 = icmp slt i32 %21, %2                                                       ; inst 28
  br i1 %22, label %_7.while.body.2, label %_11.while.exit.2                       ; inst 29
_7.while.body.2:
  %23 = add i32 %16, %21                                                           ; inst 30
  %24 = sext i32 %23 to i64                                                        ; inst 31
  %25 = getelementptr [1024 x i32], [1024 x i32]* %3, i32 0, i64 %24               ; inst 32
  %26 = load i32, i32* %25                                                         ; inst 33
  %27 = sext i32 %21 to i64                                                        ; inst 34
  %28 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %27                   ; inst 35
  %29 = load i32, i32* %28                                                         ; inst 36
  %30 = icmp eq i32 %26, %29                                                       ; inst 37
  br i1 %30, label %_8.if.then.0, label %_9.if.else.0                              ; inst 38
_8.if.then.0:
  %31 = add i32 %20, 1                                                             ; inst 39
  br label %_10.if.exit.0                                                          ; inst 40
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 41
_10.if.exit.0:
  %32 = phi i32 [%31, %_8.if.then.0], [%20, %_9.if.else.0]                         ; inst 42
  %33 = add i32 %21, 1                                                             ; inst 43
  br label %_6.while.cond.2                                                        ; inst 44
_11.while.exit.2:
  %34 = icmp sgt i32 %20, 0                                                        ; inst 45
  br i1 %34, label %_12.if.then.1, label %_25.if.else.1                            ; inst 46
_12.if.then.1:
  %35 = icmp slt i32 %20, 2                                                        ; inst 47
  br i1 %35, label %_13.if.then.2, label %_14.if.else.2                            ; inst 48
_13.if.then.2:
  br label %_15.if.exit.2                                                          ; inst 49
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 50
_15.if.exit.2:
  %36 = phi i1 [0, %_13.if.then.2], [1, %_14.if.else.2]                            ; inst 51
  br label %_16.while.cond.3                                                       ; inst 52
_16.while.cond.3:
  %37 = phi i32 [2, %_15.if.exit.2], [%42, %_20.if.exit.3]                         ; inst 53
  %38 = mul i32 %37, %37                                                           ; inst 54
  %39 = icmp sle i32 %38, %20                                                      ; inst 55
  br i1 %39, label %_17.while.body.3, label %_37.critical_edge.0                   ; inst 56
_17.while.body.3:
  %40 = srem i32 %20, %37                                                          ; inst 57
  %41 = icmp eq i32 %40, 0                                                         ; inst 58
  br i1 %41, label %_18.if.then.3, label %_19.if.else.3                            ; inst 59
_18.if.then.3:
  br label %_21.while.exit.3                                                       ; inst 60
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 61
_20.if.exit.3:
  %42 = add i32 %37, 1                                                             ; inst 62
  br label %_16.while.cond.3                                                       ; inst 63
_21.while.exit.3:
  %43 = phi i1 [%36, %_37.critical_edge.0], [0, %_18.if.then.3]                    ; inst 64
  br i1 %43, label %_22.if.then.4, label %_23.if.else.4                            ; inst 65
_22.if.then.4:
  %44 = add i32 %15, 1                                                             ; inst 66
  br label %_24.if.exit.4                                                          ; inst 67
_23.if.else.4:
  br label %_24.if.exit.4                                                          ; inst 68
_24.if.exit.4:
  %45 = phi i32 [%44, %_22.if.then.4], [%15, %_23.if.else.4]                       ; inst 69
  br label %_26.if.exit.1                                                          ; inst 70
_25.if.else.1:
  br label %_26.if.exit.1                                                          ; inst 71
_26.if.exit.1:
  %46 = phi i32 [%45, %_24.if.exit.4], [%15, %_25.if.else.1]                       ; inst 72
  %47 = add i32 %16, 1                                                             ; inst 73
  br label %_4.while.cond.1                                                        ; inst 74
_27.while.exit.1:
  br label %_28.while.cond.4                                                       ; inst 75
_28.while.cond.4:
  %48 = phi i32 [0, %_27.while.exit.1], [%61, %_32.if.exit.5]                      ; inst 76
  %49 = phi i32 [0, %_27.while.exit.1], [%62, %_32.if.exit.5]                      ; inst 77
  %50 = icmp slt i32 %49, 100                                                      ; inst 78
  br i1 %50, label %_29.while.body.4, label %_33.while.exit.4                      ; inst 79
_29.while.body.4:
  %51 = srem i32 %49, 3                                                            ; inst 80
  %52 = icmp eq i32 %51, 0                                                         ; inst 81
  br i1 %52, label %_30.if.then.5, label %_31.if.else.5                            ; inst 82
_30.if.then.5:
  %53 = sext i32 %49 to i64                                                        ; inst 83
  %54 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %53               ; inst 84
  %55 = load i32, i32* %54                                                         ; inst 85
  %56 = add i32 %48, %55                                                           ; inst 86
  br label %_32.if.exit.5                                                          ; inst 87
_31.if.else.5:
  %57 = sext i32 %49 to i64                                                        ; inst 88
  %58 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %57               ; inst 89
  %59 = load i32, i32* %58                                                         ; inst 90
  %60 = sub i32 %48, %59                                                           ; inst 91
  br label %_32.if.exit.5                                                          ; inst 92
_32.if.exit.5:
  %61 = phi i32 [%56, %_30.if.then.5], [%60, %_31.if.else.5]                       ; inst 93
  %62 = add i32 %49, 1                                                             ; inst 94
  br label %_28.while.cond.4                                                       ; inst 95
_33.while.exit.4:
  %63 = add i32 %15, %48                                                           ; inst 96
  %64 = icmp sgt i32 %63, 1000                                                     ; inst 97
  br i1 %64, label %_34.if.then.6, label %_35.if.else.6                            ; inst 98
_34.if.then.6:
  ret i32 0                                                                        ; inst 99
_35.if.else.6:
  br label %_36.if.exit.6                                                          ; inst 100
_36.if.exit.6:
  ret i32 %63                                                                      ; inst 101
_37.critical_edge.0:
  br label %_21.while.exit.3                                                       ; inst 102
}

define void @another_level_of_search([1024 x i32]* %0) {
_0.entry.0:
  %1 = alloca [64 x i32]                                                           ; inst 1
  %2 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 64                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %7 = phi i32 [0, %_3.array.exit.0], [%14, %_5.while.body.0]                      ; inst 12
  %8 = trunc i64 64 to i32                                                         ; inst 13
  %9 = icmp slt i32 %7, %8                                                         ; inst 14
  br i1 %9, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 15
_5.while.body.0:
  %10 = sext i32 %7 to i64                                                         ; inst 16
  %11 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %10                   ; inst 17
  %12 = srem i32 %7, 5                                                             ; inst 18
  %13 = add i32 70, %12                                                            ; inst 19
  store i32 %13, i32* %11                                                          ; inst 20
  %14 = add i32 %7, 1                                                              ; inst 21
  br label %_4.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 23
_7.while.cond.1:
  %15 = phi i32 [0, %_6.while.exit.0], [%31, %_17.if.exit.1]                       ; inst 24
  %16 = trunc i64 960 to i32                                                       ; inst 25
  %17 = icmp slt i32 %15, %16                                                      ; inst 26
  br i1 %17, label %_8.while.body.1, label %_19.critical_edge.0                    ; inst 27
_8.while.body.1:
  br label %_9.while.cond.2                                                        ; inst 28
_9.while.cond.2:
  %18 = phi i32 [0, %_8.while.body.1], [%29, %_13.if.exit.0]                       ; inst 29
  %19 = trunc i64 64 to i32                                                        ; inst 30
  %20 = icmp slt i32 %18, %19                                                      ; inst 31
  br i1 %20, label %_10.while.body.2, label %_20.critical_edge.1                   ; inst 32
_10.while.body.2:
  %21 = add i32 %15, %18                                                           ; inst 33
  %22 = sext i32 %21 to i64                                                        ; inst 34
  %23 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %22               ; inst 35
  %24 = load i32, i32* %23                                                         ; inst 36
  %25 = sext i32 %18 to i64                                                        ; inst 37
  %26 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %25                   ; inst 38
  %27 = load i32, i32* %26                                                         ; inst 39
  %28 = icmp ne i32 %24, %27                                                       ; inst 40
  br i1 %28, label %_11.if.then.0, label %_12.if.else.0                            ; inst 41
_11.if.then.0:
  br label %_14.while.exit.2                                                       ; inst 42
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 43
_13.if.exit.0:
  %29 = add i32 %18, 1                                                             ; inst 44
  br label %_9.while.cond.2                                                        ; inst 45
_14.while.exit.2:
  %30 = phi i1 [1, %_20.critical_edge.1], [0, %_11.if.then.0]                      ; inst 46
  br i1 %30, label %_15.if.then.1, label %_16.if.else.1                            ; inst 47
_15.if.then.1:
  br label %_18.while.exit.1                                                       ; inst 48
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 49
_17.if.exit.1:
  %31 = add i32 %15, 1                                                             ; inst 50
  br label %_7.while.cond.1                                                        ; inst 51
_18.while.exit.1:
  %32 = phi i32 [-1, %_19.critical_edge.0], [%15, %_15.if.then.1]                  ; inst 52
  call void @printlnInt(i32 %32)                                                   ; inst 53
  ret void                                                                         ; inst 54
_19.critical_edge.0:
  br label %_18.while.exit.1                                                       ; inst 55
_20.critical_edge.1:
  br label %_14.while.exit.2                                                       ; inst 56
}

define void @yet_another_search_function() {
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
  call void @generate_text([1024 x i32]* %0, i32 54321)                            ; inst 11
  %6 = call i32 @state_machine_search([1024 x i32]* %0)                            ; inst 12
  call void @another_level_of_search([1024 x i32]* %0)                             ; inst 13
  call void @printlnInt(i32 %6)                                                    ; inst 14
  ret void                                                                         ; inst 15
}

