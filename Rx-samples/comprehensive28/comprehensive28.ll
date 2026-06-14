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
  %0 = alloca [200 x i32]                                                          ; inst 1
  %1 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 200                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [200 x i32]                                                          ; inst 11
  %7 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 200                                                        ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 -1, i32* %10                                                           ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [200 x i32]                                                         ; inst 21
  %13 = getelementptr [200 x i32], [200 x i32]* %12, i32 0, i32 0                  ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 200                                                      ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 -1, i32* %16                                                           ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  %18 = alloca [200 x i32]                                                         ; inst 31
  %19 = getelementptr [200 x i32], [200 x i32]* %18, i32 0, i32 0                  ; inst 32
  br label %_10.array.cond.3                                                       ; inst 33
_10.array.cond.3:
  %20 = phi i32 [0, %_9.array.exit.2], [%23, %_11.array.body.3]                    ; inst 34
  %21 = icmp slt i32 %20, 200                                                      ; inst 35
  br i1 %21, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 36
_11.array.body.3:
  %22 = getelementptr i32, i32* %19, i32 %20                                       ; inst 37
  store i32 -1, i32* %22                                                           ; inst 38
  %23 = add i32 %20, 1                                                             ; inst 39
  br label %_10.array.cond.3                                                       ; inst 40
_12.array.exit.3:
  %24 = alloca [200 x i32]                                                         ; inst 41
  %25 = getelementptr [200 x i32], [200 x i32]* %24, i32 0, i32 0                  ; inst 42
  br label %_13.array.cond.4                                                       ; inst 43
_13.array.cond.4:
  %26 = phi i32 [0, %_12.array.exit.3], [%29, %_14.array.body.4]                   ; inst 44
  %27 = icmp slt i32 %26, 200                                                      ; inst 45
  br i1 %27, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 46
_14.array.body.4:
  %28 = getelementptr i32, i32* %25, i32 %26                                       ; inst 47
  store i32 0, i32* %28                                                            ; inst 48
  %29 = add i32 %26, 1                                                             ; inst 49
  br label %_13.array.cond.4                                                       ; inst 50
_15.array.exit.4:
  %30 = alloca [200 x i32]                                                         ; inst 51
  %31 = getelementptr [200 x i32], [200 x i32]* %30, i32 0, i32 0                  ; inst 52
  br label %_16.array.cond.5                                                       ; inst 53
_16.array.cond.5:
  %32 = phi i32 [0, %_15.array.exit.4], [%35, %_17.array.body.5]                   ; inst 54
  %33 = icmp slt i32 %32, 200                                                      ; inst 55
  br i1 %33, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 56
_17.array.body.5:
  %34 = getelementptr i32, i32* %31, i32 %32                                       ; inst 57
  store i32 0, i32* %34                                                            ; inst 58
  %35 = add i32 %32, 1                                                             ; inst 59
  br label %_16.array.cond.5                                                       ; inst 60
_18.array.exit.5:
  br label %_19.while.cond.0                                                       ; inst 61
_19.while.cond.0:
  %36 = phi i32 [0, %_18.array.exit.5], [%45, %_20.while.body.0]                   ; inst 62
  %37 = phi i32 [0, %_18.array.exit.5], [%44, %_20.while.body.0]                   ; inst 63
  %38 = phi i32 [-1, %_18.array.exit.5], [%43, %_20.while.body.0]                  ; inst 64
  %39 = icmp slt i32 %36, 50                                                       ; inst 65
  br i1 %39, label %_20.while.body.0, label %_21.while.exit.0                      ; inst 66
_20.while.body.0:
  %40 = mul i32 %36, 17                                                            ; inst 67
  %41 = add i32 %40, 23                                                            ; inst 68
  %42 = call i32 @generate_pseudo_random_value(i32 %41, i32 1000)                  ; inst 69
  %43 = call i32 @insert_into_bst([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, [200 x i32]* %18, [200 x i32]* %24, [200 x i32]* %30, i32 %38, i32 %42, i32 %37) ; inst 70
  %44 = add i32 %37, 1                                                             ; inst 71
  %45 = add i32 %36, 1                                                             ; inst 72
  br label %_19.while.cond.0                                                       ; inst 73
_21.while.exit.0:
  %46 = call i32 @perform_tree_analysis([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, [200 x i32]* %18, [200 x i32]* %24, [200 x i32]* %30, i32 %38, i32 %37) ; inst 74
  call void @printlnInt(i32 %46)                                                   ; inst 75
  br label %_22.while.cond.1                                                       ; inst 76
_22.while.cond.1:
  %47 = phi i32 [%38, %_21.while.exit.0], [%50, %_23.while.body.1]                 ; inst 77
  %48 = phi i32 [0, %_21.while.exit.0], [%53, %_23.while.body.1]                   ; inst 78
  %49 = icmp slt i32 %48, 8                                                        ; inst 79
  br i1 %49, label %_23.while.body.1, label %_24.while.exit.1                      ; inst 80
_23.while.body.1:
  %50 = call i32 @perform_tree_rebalancing([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, [200 x i32]* %18, [200 x i32]* %24, [200 x i32]* %30, i32 %47, i32 %37) ; inst 81
  %51 = call i32 @perform_comprehensive_tree_traversal([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, [200 x i32]* %18, [200 x i32]* %24, [200 x i32]* %30, i32 %50, i32 %37, i32 %48) ; inst 82
  call void @printlnInt(i32 %51)                                                   ; inst 83
  %52 = call i32 @compute_complex_tree_properties([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, [200 x i32]* %18, [200 x i32]* %24, [200 x i32]* %30, i32 %50, i32 %37, i32 %48) ; inst 84
  call void @printlnInt(i32 %52)                                                   ; inst 85
  %53 = add i32 %48, 1                                                             ; inst 86
  br label %_22.while.cond.1                                                       ; inst 87
_24.while.exit.1:
  %54 = call i32 @validate_tree_integrity([200 x i32]* %0, [200 x i32]* %6, [200 x i32]* %12, [200 x i32]* %18, [200 x i32]* %24, [200 x i32]* %30, i32 %47, i32 %37) ; inst 88
  call void @printlnInt(i32 %54)                                                   ; inst 89
  call void @exit(i32 0)                                                           ; inst 90
  ret void                                                                         ; inst 91
}

define i32 @generate_pseudo_random_value(i32 %0, i32 %1) {
_0.entry.0:
  %2 = mul i32 %0, 15                                                              ; inst 1
  %3 = add i32 %2, 12345                                                           ; inst 2
  %4 = icmp slt i32 %3, 0                                                          ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  %5 = sub i32 0, %3                                                               ; inst 5
  br label %_3.if.exit.0                                                           ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %6 = phi i32 [%5, %_1.if.then.0], [%3, %_2.if.else.0]                            ; inst 8
  %7 = srem i32 %6, %1                                                             ; inst 9
  ret i32 %7                                                                       ; inst 10
}

define i32 @insert_into_bst([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = sext i32 %8 to i64                                                          ; inst 1
  %10 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %9                  ; inst 2
  store i32 %7, i32* %10                                                           ; inst 3
  %11 = sext i32 %8 to i64                                                         ; inst 4
  %12 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %11                 ; inst 5
  store i32 -1, i32* %12                                                           ; inst 6
  %13 = sext i32 %8 to i64                                                         ; inst 7
  %14 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %13                 ; inst 8
  store i32 -1, i32* %14                                                           ; inst 9
  %15 = sext i32 %8 to i64                                                         ; inst 10
  %16 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %15                 ; inst 11
  store i32 -1, i32* %16                                                           ; inst 12
  %17 = sext i32 %8 to i64                                                         ; inst 13
  %18 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %17                 ; inst 14
  store i32 1, i32* %18                                                            ; inst 15
  %19 = sext i32 %8 to i64                                                         ; inst 16
  %20 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %19                 ; inst 17
  store i32 1, i32* %20                                                            ; inst 18
  %21 = icmp eq i32 %6, -1                                                         ; inst 19
  br i1 %21, label %_1.if.then.0, label %_2.if.else.0                              ; inst 20
_1.if.then.0:
  ret i32 %8                                                                       ; inst 21
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 22
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 23
_4.while.cond.0:
  %22 = phi i1 [0, %_3.if.exit.0], [%55, %_14.if.exit.1]                           ; inst 24
  %23 = phi i32 [%6, %_3.if.exit.0], [%56, %_14.if.exit.1]                         ; inst 25
  %24 = icmp eq i1 %22, 0                                                          ; inst 26
  br i1 %24, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 27
_5.while.body.0:
  %25 = sext i32 %23 to i64                                                        ; inst 28
  %26 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %25                 ; inst 29
  %27 = load i32, i32* %26                                                         ; inst 30
  %28 = icmp slt i32 %7, %27                                                       ; inst 31
  br i1 %28, label %_6.if.then.1, label %_10.if.else.1                             ; inst 32
_6.if.then.1:
  %29 = sext i32 %23 to i64                                                        ; inst 33
  %30 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %29                 ; inst 34
  %31 = load i32, i32* %30                                                         ; inst 35
  %32 = icmp eq i32 %31, -1                                                        ; inst 36
  br i1 %32, label %_7.if.then.2, label %_8.if.else.2                              ; inst 37
_7.if.then.2:
  %33 = sext i32 %23 to i64                                                        ; inst 38
  %34 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %33                 ; inst 39
  store i32 %8, i32* %34                                                           ; inst 40
  %35 = sext i32 %8 to i64                                                         ; inst 41
  %36 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %35                 ; inst 42
  store i32 %23, i32* %36                                                          ; inst 43
  br label %_9.if.exit.2                                                           ; inst 44
_8.if.else.2:
  %37 = sext i32 %23 to i64                                                        ; inst 45
  %38 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %37                 ; inst 46
  %39 = load i32, i32* %38                                                         ; inst 47
  br label %_9.if.exit.2                                                           ; inst 48
_9.if.exit.2:
  %40 = phi i1 [1, %_7.if.then.2], [%22, %_8.if.else.2]                            ; inst 49
  %41 = phi i32 [%23, %_7.if.then.2], [%39, %_8.if.else.2]                         ; inst 50
  br label %_14.if.exit.1                                                          ; inst 51
_10.if.else.1:
  %42 = sext i32 %23 to i64                                                        ; inst 52
  %43 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %42                 ; inst 53
  %44 = load i32, i32* %43                                                         ; inst 54
  %45 = icmp eq i32 %44, -1                                                        ; inst 55
  br i1 %45, label %_11.if.then.3, label %_12.if.else.3                            ; inst 56
_11.if.then.3:
  %46 = sext i32 %23 to i64                                                        ; inst 57
  %47 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %46                 ; inst 58
  store i32 %8, i32* %47                                                           ; inst 59
  %48 = sext i32 %8 to i64                                                         ; inst 60
  %49 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %48                 ; inst 61
  store i32 %23, i32* %49                                                          ; inst 62
  br label %_13.if.exit.3                                                          ; inst 63
_12.if.else.3:
  %50 = sext i32 %23 to i64                                                        ; inst 64
  %51 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %50                 ; inst 65
  %52 = load i32, i32* %51                                                         ; inst 66
  br label %_13.if.exit.3                                                          ; inst 67
_13.if.exit.3:
  %53 = phi i1 [1, %_11.if.then.3], [%22, %_12.if.else.3]                          ; inst 68
  %54 = phi i32 [%23, %_11.if.then.3], [%52, %_12.if.else.3]                       ; inst 69
  br label %_14.if.exit.1                                                          ; inst 70
_14.if.exit.1:
  %55 = phi i1 [%40, %_9.if.exit.2], [%53, %_13.if.exit.3]                         ; inst 71
  %56 = phi i32 [%41, %_9.if.exit.2], [%54, %_13.if.exit.3]                        ; inst 72
  br label %_4.while.cond.0                                                        ; inst 73
_15.while.exit.0:
  call void @update_tree_properties_bottom_up([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %8) ; inst 74
  ret i32 %6                                                                       ; inst 75
}

define void @update_tree_properties_bottom_up([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %7 = phi i32 [%6, %_0.entry.0], [%63, %_14.if.exit.3]                            ; inst 2
  %8 = icmp ne i32 %7, -1                                                          ; inst 3
  br i1 %8, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 4
_2.while.body.0:
  %9 = sext i32 %7 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = icmp eq i32 %11, -1                                                        ; inst 8
  br i1 %12, label %_3.if.then.0, label %_4.if.else.0                              ; inst 9
_3.if.then.0:
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  %13 = sext i32 %7 to i64                                                         ; inst 11
  %14 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %13                 ; inst 12
  %15 = load i32, i32* %14                                                         ; inst 13
  %16 = sext i32 %15 to i64                                                        ; inst 14
  %17 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %16                 ; inst 15
  %18 = load i32, i32* %17                                                         ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_5.if.exit.0:
  %19 = phi i32 [0, %_3.if.then.0], [%18, %_4.if.else.0]                           ; inst 18
  %20 = sext i32 %7 to i64                                                         ; inst 19
  %21 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %20                 ; inst 20
  %22 = load i32, i32* %21                                                         ; inst 21
  %23 = icmp eq i32 %22, -1                                                        ; inst 22
  br i1 %23, label %_6.if.then.1, label %_7.if.else.1                              ; inst 23
_6.if.then.1:
  br label %_8.if.exit.1                                                           ; inst 24
_7.if.else.1:
  %24 = sext i32 %7 to i64                                                         ; inst 25
  %25 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %24                 ; inst 26
  %26 = load i32, i32* %25                                                         ; inst 27
  %27 = sext i32 %26 to i64                                                        ; inst 28
  %28 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %27                 ; inst 29
  %29 = load i32, i32* %28                                                         ; inst 30
  br label %_8.if.exit.1                                                           ; inst 31
_8.if.exit.1:
  %30 = phi i32 [0, %_6.if.then.1], [%29, %_7.if.else.1]                           ; inst 32
  %31 = sext i32 %7 to i64                                                         ; inst 33
  %32 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %31                 ; inst 34
  %33 = call i32 @max(i32 %19, i32 %30)                                            ; inst 35
  %34 = add i32 %33, 1                                                             ; inst 36
  store i32 %34, i32* %32                                                          ; inst 37
  %35 = sext i32 %7 to i64                                                         ; inst 38
  %36 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %35                 ; inst 39
  %37 = load i32, i32* %36                                                         ; inst 40
  %38 = icmp eq i32 %37, -1                                                        ; inst 41
  br i1 %38, label %_9.if.then.2, label %_10.if.else.2                             ; inst 42
_9.if.then.2:
  br label %_11.if.exit.2                                                          ; inst 43
_10.if.else.2:
  %39 = sext i32 %7 to i64                                                         ; inst 44
  %40 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %39                 ; inst 45
  %41 = load i32, i32* %40                                                         ; inst 46
  %42 = sext i32 %41 to i64                                                        ; inst 47
  %43 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %42                 ; inst 48
  %44 = load i32, i32* %43                                                         ; inst 49
  br label %_11.if.exit.2                                                          ; inst 50
_11.if.exit.2:
  %45 = phi i32 [0, %_9.if.then.2], [%44, %_10.if.else.2]                          ; inst 51
  %46 = sext i32 %7 to i64                                                         ; inst 52
  %47 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %46                 ; inst 53
  %48 = load i32, i32* %47                                                         ; inst 54
  %49 = icmp eq i32 %48, -1                                                        ; inst 55
  br i1 %49, label %_12.if.then.3, label %_13.if.else.3                            ; inst 56
_12.if.then.3:
  br label %_14.if.exit.3                                                          ; inst 57
_13.if.else.3:
  %50 = sext i32 %7 to i64                                                         ; inst 58
  %51 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %50                 ; inst 59
  %52 = load i32, i32* %51                                                         ; inst 60
  %53 = sext i32 %52 to i64                                                        ; inst 61
  %54 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %53                 ; inst 62
  %55 = load i32, i32* %54                                                         ; inst 63
  br label %_14.if.exit.3                                                          ; inst 64
_14.if.exit.3:
  %56 = phi i32 [0, %_12.if.then.3], [%55, %_13.if.else.3]                         ; inst 65
  %57 = sext i32 %7 to i64                                                         ; inst 66
  %58 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %57                 ; inst 67
  %59 = add i32 %45, %56                                                           ; inst 68
  %60 = add i32 %59, 1                                                             ; inst 69
  store i32 %60, i32* %58                                                          ; inst 70
  %61 = sext i32 %7 to i64                                                         ; inst 71
  %62 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %61                 ; inst 72
  %63 = load i32, i32* %62                                                         ; inst 73
  br label %_1.while.cond.0                                                        ; inst 74
_15.while.exit.0:
  ret void                                                                         ; inst 75
}

define i32 @max(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sgt i32 %0, %1                                                         ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = phi i32 [%0, %_1.if.then.0], [%1, %_2.if.else.0]                            ; inst 5
  ret i32 %3                                                                       ; inst 6
}

define i32 @min(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp slt i32 %0, %1                                                         ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = phi i32 [%0, %_1.if.then.0], [%1, %_2.if.else.0]                            ; inst 5
  ret i32 %3                                                                       ; inst 6
}

define i32 @abs(i32 %0) {
_0.entry.0:
  %1 = icmp slt i32 %0, 0                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %2 = sub i32 0, %0                                                               ; inst 3
  br label %_3.if.exit.0                                                           ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %3 = phi i32 [%2, %_1.if.then.0], [%0, %_2.if.else.0]                            ; inst 6
  ret i32 %3                                                                       ; inst 7
}

define i32 @perform_tree_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = sext i32 %6 to i64                                                         ; inst 8
  %13 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %12                 ; inst 9
  %14 = load i32, i32* %13                                                         ; inst 10
  %15 = call i32 @compute_tree_balance_factor([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) ; inst 11
  %16 = call i32 @compute_all_paths_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 0, i32 0) ; inst 12
  %17 = call i32 @compute_node_depth_variance([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 0) ; inst 13
  %18 = mul i32 %11, %14                                                           ; inst 14
  %19 = mul i32 %15, 17                                                            ; inst 15
  %20 = add i32 %18, %19                                                           ; inst 16
  %21 = srem i32 %16, 1000                                                         ; inst 17
  %22 = add i32 %20, %21                                                           ; inst 18
  %23 = add i32 %22, %17                                                           ; inst 19
  %24 = srem i32 %23, 10000                                                        ; inst 20
  ret i32 %24                                                                      ; inst 21
}

define i32 @compute_tree_balance_factor([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp eq i32 %10, -1                                                        ; inst 8
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 10
_5.if.else.1:
  %12 = sext i32 %6 to i64                                                         ; inst 11
  %13 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %12                 ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = sext i32 %14 to i64                                                        ; inst 14
  %16 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %15                 ; inst 15
  %17 = load i32, i32* %16                                                         ; inst 16
  br label %_6.if.exit.1                                                           ; inst 17
_6.if.exit.1:
  %18 = phi i32 [0, %_4.if.then.1], [%17, %_5.if.else.1]                           ; inst 18
  %19 = sext i32 %6 to i64                                                         ; inst 19
  %20 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %19                 ; inst 20
  %21 = load i32, i32* %20                                                         ; inst 21
  %22 = icmp eq i32 %21, -1                                                        ; inst 22
  br i1 %22, label %_7.if.then.2, label %_8.if.else.2                              ; inst 23
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 24
_8.if.else.2:
  %23 = sext i32 %6 to i64                                                         ; inst 25
  %24 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %23                 ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = sext i32 %25 to i64                                                        ; inst 28
  %27 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %26                 ; inst 29
  %28 = load i32, i32* %27                                                         ; inst 30
  br label %_9.if.exit.2                                                           ; inst 31
_9.if.exit.2:
  %29 = phi i32 [0, %_7.if.then.2], [%28, %_8.if.else.2]                           ; inst 32
  %30 = sub i32 %18, %29                                                           ; inst 33
  %31 = call i32 @abs(i32 %30)                                                     ; inst 34
  %32 = sext i32 %6 to i64                                                         ; inst 35
  %33 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %32                 ; inst 36
  %34 = load i32, i32* %33                                                         ; inst 37
  %35 = call i32 @compute_tree_balance_factor([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %34) ; inst 38
  %36 = sext i32 %6 to i64                                                         ; inst 39
  %37 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %36                 ; inst 40
  %38 = load i32, i32* %37                                                         ; inst 41
  %39 = call i32 @compute_tree_balance_factor([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %38) ; inst 42
  %40 = add i32 %31, %35                                                           ; inst 43
  %41 = add i32 %40, %39                                                           ; inst 44
  ret i32 %41                                                                      ; inst 45
}

define i32 @compute_all_paths_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %10 = sext i32 %6 to i64                                                         ; inst 5
  %11 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %10                 ; inst 6
  %12 = load i32, i32* %11                                                         ; inst 7
  %13 = add i32 %8, 1                                                              ; inst 8
  %14 = mul i32 %12, %13                                                           ; inst 9
  %15 = add i32 %7, %14                                                            ; inst 10
  %16 = sext i32 %6 to i64                                                         ; inst 11
  %17 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %16                 ; inst 12
  %18 = load i32, i32* %17                                                         ; inst 13
  %19 = icmp eq i32 %18, -1                                                        ; inst 14
  br i1 %19, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 15
_4.lazy.then.0:
  %20 = sext i32 %6 to i64                                                         ; inst 16
  %21 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %20                 ; inst 17
  %22 = load i32, i32* %21                                                         ; inst 18
  %23 = icmp eq i32 %22, -1                                                        ; inst 19
  br label %_6.lazy.exit.0                                                         ; inst 20
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 21
_6.lazy.exit.0:
  %24 = phi i1 [%23, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 22
  br i1 %24, label %_7.if.then.1, label %_8.if.else.1                              ; inst 23
_7.if.then.1:
  ret i32 %15                                                                      ; inst 24
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 25
_9.if.exit.1:
  %25 = sext i32 %6 to i64                                                         ; inst 26
  %26 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %25                 ; inst 27
  %27 = load i32, i32* %26                                                         ; inst 28
  %28 = add i32 %8, 1                                                              ; inst 29
  %29 = call i32 @compute_all_paths_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %27, i32 %15, i32 %28) ; inst 30
  %30 = sext i32 %6 to i64                                                         ; inst 31
  %31 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %30                 ; inst 32
  %32 = load i32, i32* %31                                                         ; inst 33
  %33 = add i32 %8, 1                                                              ; inst 34
  %34 = call i32 @compute_all_paths_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %32, i32 %15, i32 %33) ; inst 35
  %35 = add i32 %29, %34                                                           ; inst 36
  ret i32 %35                                                                      ; inst 37
}

define i32 @compute_node_depth_variance([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = mul i32 %7, %7                                                              ; inst 5
  %10 = sext i32 %6 to i64                                                         ; inst 6
  %11 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %10                 ; inst 7
  %12 = load i32, i32* %11                                                         ; inst 8
  %13 = srem i32 %12, 7                                                            ; inst 9
  %14 = add i32 %9, %13                                                            ; inst 10
  %15 = sext i32 %6 to i64                                                         ; inst 11
  %16 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %15                 ; inst 12
  %17 = load i32, i32* %16                                                         ; inst 13
  %18 = add i32 %7, 1                                                              ; inst 14
  %19 = call i32 @compute_node_depth_variance([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %17, i32 %18) ; inst 15
  %20 = sext i32 %6 to i64                                                         ; inst 16
  %21 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %20                 ; inst 17
  %22 = load i32, i32* %21                                                         ; inst 18
  %23 = add i32 %7, 1                                                              ; inst 19
  %24 = call i32 @compute_node_depth_variance([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %22, i32 %23) ; inst 20
  %25 = add i32 %14, %19                                                           ; inst 21
  %26 = add i32 %25, %24                                                           ; inst 22
  ret i32 %26                                                                      ; inst 23
}

define i32 @perform_tree_rebalancing([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%17, %_8.if.exit.0]                              ; inst 2
  %9 = phi i32 [%6, %_0.entry.0], [%18, %_8.if.exit.0]                             ; inst 3
  %10 = phi i32 [0, %_0.entry.0], [%19, %_8.if.exit.0]                             ; inst 4
  %11 = icmp slt i32 %10, %7                                                       ; inst 5
  br i1 %11, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 6
_2.lazy.then.0:
  %12 = icmp slt i32 %8, 5                                                         ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %13 = phi i1 [%12, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 10
  br i1 %13, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 11
_5.while.body.0:
  %14 = call i1 @needs_rebalancing([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %10) ; inst 12
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 13
_6.if.then.0:
  %15 = call i32 @perform_rotation_at_node([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %9, i32 %10) ; inst 14
  %16 = add i32 %8, 1                                                              ; inst 15
  br label %_8.if.exit.0                                                           ; inst 16
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 17
_8.if.exit.0:
  %17 = phi i32 [%16, %_6.if.then.0], [%8, %_7.if.else.0]                          ; inst 18
  %18 = phi i32 [%15, %_6.if.then.0], [%9, %_7.if.else.0]                          ; inst 19
  %19 = add i32 %10, 1                                                             ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_9.while.exit.0:
  ret i32 %9                                                                       ; inst 22
}

define i1 @needs_rebalancing([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i1 0                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp eq i32 %10, -1                                                        ; inst 8
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 10
_5.if.else.1:
  %12 = sext i32 %6 to i64                                                         ; inst 11
  %13 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %12                 ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = sext i32 %14 to i64                                                        ; inst 14
  %16 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %15                 ; inst 15
  %17 = load i32, i32* %16                                                         ; inst 16
  br label %_6.if.exit.1                                                           ; inst 17
_6.if.exit.1:
  %18 = phi i32 [0, %_4.if.then.1], [%17, %_5.if.else.1]                           ; inst 18
  %19 = sext i32 %6 to i64                                                         ; inst 19
  %20 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %19                 ; inst 20
  %21 = load i32, i32* %20                                                         ; inst 21
  %22 = icmp eq i32 %21, -1                                                        ; inst 22
  br i1 %22, label %_7.if.then.2, label %_8.if.else.2                              ; inst 23
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 24
_8.if.else.2:
  %23 = sext i32 %6 to i64                                                         ; inst 25
  %24 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %23                 ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = sext i32 %25 to i64                                                        ; inst 28
  %27 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %26                 ; inst 29
  %28 = load i32, i32* %27                                                         ; inst 30
  br label %_9.if.exit.2                                                           ; inst 31
_9.if.exit.2:
  %29 = phi i32 [0, %_7.if.then.2], [%28, %_8.if.else.2]                           ; inst 32
  %30 = sub i32 %18, %29                                                           ; inst 33
  %31 = call i32 @abs(i32 %30)                                                     ; inst 34
  %32 = icmp sgt i32 %31, 2                                                        ; inst 35
  ret i1 %32                                                                       ; inst 36
}

define i32 @perform_rotation_at_node([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %7, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %6                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %7 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = icmp eq i32 %11, -1                                                        ; inst 8
  br i1 %12, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 10
_5.if.else.1:
  %13 = sext i32 %7 to i64                                                         ; inst 11
  %14 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %13                 ; inst 12
  %15 = load i32, i32* %14                                                         ; inst 13
  %16 = sext i32 %15 to i64                                                        ; inst 14
  %17 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %16                 ; inst 15
  %18 = load i32, i32* %17                                                         ; inst 16
  br label %_6.if.exit.1                                                           ; inst 17
_6.if.exit.1:
  %19 = phi i32 [0, %_4.if.then.1], [%18, %_5.if.else.1]                           ; inst 18
  %20 = sext i32 %7 to i64                                                         ; inst 19
  %21 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %20                 ; inst 20
  %22 = load i32, i32* %21                                                         ; inst 21
  %23 = icmp eq i32 %22, -1                                                        ; inst 22
  br i1 %23, label %_7.if.then.2, label %_8.if.else.2                              ; inst 23
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 24
_8.if.else.2:
  %24 = sext i32 %7 to i64                                                         ; inst 25
  %25 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %24                 ; inst 26
  %26 = load i32, i32* %25                                                         ; inst 27
  %27 = sext i32 %26 to i64                                                        ; inst 28
  %28 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %27                 ; inst 29
  %29 = load i32, i32* %28                                                         ; inst 30
  br label %_9.if.exit.2                                                           ; inst 31
_9.if.exit.2:
  %30 = phi i32 [0, %_7.if.then.2], [%29, %_8.if.else.2]                           ; inst 32
  %31 = add i32 %30, 1                                                             ; inst 33
  %32 = icmp sgt i32 %19, %31                                                      ; inst 34
  br i1 %32, label %_10.if.then.3, label %_11.if.else.3                            ; inst 35
_10.if.then.3:
  %33 = call i32 @perform_right_rotation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) ; inst 36
  ret i32 %33                                                                      ; inst 37
_11.if.else.3:
  %34 = add i32 %19, 1                                                             ; inst 38
  %35 = icmp sgt i32 %30, %34                                                      ; inst 39
  br i1 %35, label %_12.if.then.4, label %_13.if.else.4                            ; inst 40
_12.if.then.4:
  %36 = call i32 @perform_left_rotation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) ; inst 41
  ret i32 %36                                                                      ; inst 42
_13.if.else.4:
  br label %_14.if.exit.4                                                          ; inst 43
_14.if.exit.4:
  br label %_15.if.exit.3                                                          ; inst 44
_15.if.exit.3:
  ret i32 %6                                                                       ; inst 45
}

define i32 @perform_right_rotation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = sext i32 %7 to i64                                                          ; inst 1
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 2
  %10 = load i32, i32* %9                                                          ; inst 3
  %11 = icmp eq i32 %10, -1                                                        ; inst 4
  br i1 %11, label %_1.if.then.0, label %_2.if.else.0                              ; inst 5
_1.if.then.0:
  ret i32 %6                                                                       ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %12 = sext i32 %7 to i64                                                         ; inst 8
  %13 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %12                 ; inst 9
  %14 = load i32, i32* %13                                                         ; inst 10
  %15 = sext i32 %7 to i64                                                         ; inst 11
  %16 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %15                 ; inst 12
  %17 = sext i32 %14 to i64                                                        ; inst 13
  %18 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %17                 ; inst 14
  %19 = load i32, i32* %18                                                         ; inst 15
  store i32 %19, i32* %16                                                          ; inst 16
  %20 = sext i32 %14 to i64                                                        ; inst 17
  %21 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %20                 ; inst 18
  %22 = load i32, i32* %21                                                         ; inst 19
  %23 = icmp ne i32 %22, -1                                                        ; inst 20
  br i1 %23, label %_4.if.then.1, label %_5.if.else.1                              ; inst 21
_4.if.then.1:
  %24 = sext i32 %14 to i64                                                        ; inst 22
  %25 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %24                 ; inst 23
  %26 = load i32, i32* %25                                                         ; inst 24
  %27 = sext i32 %26 to i64                                                        ; inst 25
  %28 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %27                 ; inst 26
  store i32 %7, i32* %28                                                           ; inst 27
  br label %_6.if.exit.1                                                           ; inst 28
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 29
_6.if.exit.1:
  %29 = sext i32 %14 to i64                                                        ; inst 30
  %30 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %29                 ; inst 31
  store i32 %7, i32* %30                                                           ; inst 32
  %31 = sext i32 %14 to i64                                                        ; inst 33
  %32 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %31                 ; inst 34
  %33 = sext i32 %7 to i64                                                         ; inst 35
  %34 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %33                 ; inst 36
  %35 = load i32, i32* %34                                                         ; inst 37
  store i32 %35, i32* %32                                                          ; inst 38
  %36 = sext i32 %7 to i64                                                         ; inst 39
  %37 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %36                 ; inst 40
  store i32 %14, i32* %37                                                          ; inst 41
  %38 = sext i32 %14 to i64                                                        ; inst 42
  %39 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %38                 ; inst 43
  %40 = load i32, i32* %39                                                         ; inst 44
  %41 = icmp ne i32 %40, -1                                                        ; inst 45
  br i1 %41, label %_7.if.then.2, label %_11.if.else.2                             ; inst 46
_7.if.then.2:
  %42 = sext i32 %14 to i64                                                        ; inst 47
  %43 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %42                 ; inst 48
  %44 = load i32, i32* %43                                                         ; inst 49
  %45 = sext i32 %44 to i64                                                        ; inst 50
  %46 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %45                 ; inst 51
  %47 = load i32, i32* %46                                                         ; inst 52
  %48 = icmp eq i32 %47, %7                                                        ; inst 53
  br i1 %48, label %_8.if.then.3, label %_9.if.else.3                              ; inst 54
_8.if.then.3:
  %49 = sext i32 %14 to i64                                                        ; inst 55
  %50 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %49                 ; inst 56
  %51 = load i32, i32* %50                                                         ; inst 57
  %52 = sext i32 %51 to i64                                                        ; inst 58
  %53 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %52                 ; inst 59
  store i32 %14, i32* %53                                                          ; inst 60
  br label %_10.if.exit.3                                                          ; inst 61
_9.if.else.3:
  %54 = sext i32 %14 to i64                                                        ; inst 62
  %55 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %54                 ; inst 63
  %56 = load i32, i32* %55                                                         ; inst 64
  %57 = sext i32 %56 to i64                                                        ; inst 65
  %58 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %57                 ; inst 66
  store i32 %14, i32* %58                                                          ; inst 67
  br label %_10.if.exit.3                                                          ; inst 68
_10.if.exit.3:
  br label %_12.if.exit.2                                                          ; inst 69
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 70
_12.if.exit.2:
  call void @update_tree_properties_bottom_up([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %7) ; inst 71
  %59 = icmp eq i32 %6, %7                                                         ; inst 72
  br i1 %59, label %_13.if.then.4, label %_14.if.else.4                            ; inst 73
_13.if.then.4:
  ret i32 %14                                                                      ; inst 74
_14.if.else.4:
  ret i32 %6                                                                       ; inst 75
_15.if.exit.4:
  unreachable                                                                      ; inst 76
}

define i32 @perform_left_rotation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = sext i32 %7 to i64                                                          ; inst 1
  %9 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %8                   ; inst 2
  %10 = load i32, i32* %9                                                          ; inst 3
  %11 = icmp eq i32 %10, -1                                                        ; inst 4
  br i1 %11, label %_1.if.then.0, label %_2.if.else.0                              ; inst 5
_1.if.then.0:
  ret i32 %6                                                                       ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %12 = sext i32 %7 to i64                                                         ; inst 8
  %13 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %12                 ; inst 9
  %14 = load i32, i32* %13                                                         ; inst 10
  %15 = sext i32 %7 to i64                                                         ; inst 11
  %16 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %15                 ; inst 12
  %17 = sext i32 %14 to i64                                                        ; inst 13
  %18 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %17                 ; inst 14
  %19 = load i32, i32* %18                                                         ; inst 15
  store i32 %19, i32* %16                                                          ; inst 16
  %20 = sext i32 %14 to i64                                                        ; inst 17
  %21 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %20                 ; inst 18
  %22 = load i32, i32* %21                                                         ; inst 19
  %23 = icmp ne i32 %22, -1                                                        ; inst 20
  br i1 %23, label %_4.if.then.1, label %_5.if.else.1                              ; inst 21
_4.if.then.1:
  %24 = sext i32 %14 to i64                                                        ; inst 22
  %25 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %24                 ; inst 23
  %26 = load i32, i32* %25                                                         ; inst 24
  %27 = sext i32 %26 to i64                                                        ; inst 25
  %28 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %27                 ; inst 26
  store i32 %7, i32* %28                                                           ; inst 27
  br label %_6.if.exit.1                                                           ; inst 28
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 29
_6.if.exit.1:
  %29 = sext i32 %14 to i64                                                        ; inst 30
  %30 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %29                 ; inst 31
  store i32 %7, i32* %30                                                           ; inst 32
  %31 = sext i32 %14 to i64                                                        ; inst 33
  %32 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %31                 ; inst 34
  %33 = sext i32 %7 to i64                                                         ; inst 35
  %34 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %33                 ; inst 36
  %35 = load i32, i32* %34                                                         ; inst 37
  store i32 %35, i32* %32                                                          ; inst 38
  %36 = sext i32 %7 to i64                                                         ; inst 39
  %37 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %36                 ; inst 40
  store i32 %14, i32* %37                                                          ; inst 41
  %38 = sext i32 %14 to i64                                                        ; inst 42
  %39 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %38                 ; inst 43
  %40 = load i32, i32* %39                                                         ; inst 44
  %41 = icmp ne i32 %40, -1                                                        ; inst 45
  br i1 %41, label %_7.if.then.2, label %_11.if.else.2                             ; inst 46
_7.if.then.2:
  %42 = sext i32 %14 to i64                                                        ; inst 47
  %43 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %42                 ; inst 48
  %44 = load i32, i32* %43                                                         ; inst 49
  %45 = sext i32 %44 to i64                                                        ; inst 50
  %46 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %45                 ; inst 51
  %47 = load i32, i32* %46                                                         ; inst 52
  %48 = icmp eq i32 %47, %7                                                        ; inst 53
  br i1 %48, label %_8.if.then.3, label %_9.if.else.3                              ; inst 54
_8.if.then.3:
  %49 = sext i32 %14 to i64                                                        ; inst 55
  %50 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %49                 ; inst 56
  %51 = load i32, i32* %50                                                         ; inst 57
  %52 = sext i32 %51 to i64                                                        ; inst 58
  %53 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %52                 ; inst 59
  store i32 %14, i32* %53                                                          ; inst 60
  br label %_10.if.exit.3                                                          ; inst 61
_9.if.else.3:
  %54 = sext i32 %14 to i64                                                        ; inst 62
  %55 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %54                 ; inst 63
  %56 = load i32, i32* %55                                                         ; inst 64
  %57 = sext i32 %56 to i64                                                        ; inst 65
  %58 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %57                 ; inst 66
  store i32 %14, i32* %58                                                          ; inst 67
  br label %_10.if.exit.3                                                          ; inst 68
_10.if.exit.3:
  br label %_12.if.exit.2                                                          ; inst 69
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 70
_12.if.exit.2:
  call void @update_tree_properties_bottom_up([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %7) ; inst 71
  %59 = icmp eq i32 %6, %7                                                         ; inst 72
  br i1 %59, label %_13.if.then.4, label %_14.if.else.4                            ; inst 73
_13.if.then.4:
  ret i32 %14                                                                      ; inst 74
_14.if.else.4:
  ret i32 %6                                                                       ; inst 75
_15.if.exit.4:
  unreachable                                                                      ; inst 76
}

define i32 @perform_comprehensive_tree_traversal([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = call i32 @perform_inorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %8) ; inst 1
  %10 = call i32 @perform_preorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %8) ; inst 2
  %11 = call i32 @perform_postorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %8) ; inst 3
  %12 = call i32 @perform_level_order_traversal_simulation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) ; inst 4
  %13 = call i32 @compute_diagonal_traversal_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 0, i32 %8) ; inst 5
  %14 = mul i32 %9, 13                                                             ; inst 6
  %15 = mul i32 %10, 17                                                            ; inst 7
  %16 = add i32 %14, %15                                                           ; inst 8
  %17 = mul i32 %11, 19                                                            ; inst 9
  %18 = add i32 %16, %17                                                           ; inst 10
  %19 = mul i32 %12, 23                                                            ; inst 11
  %20 = add i32 %18, %19                                                           ; inst 12
  %21 = mul i32 %13, 29                                                            ; inst 13
  %22 = add i32 %20, %21                                                           ; inst 14
  %23 = srem i32 %22, 100000                                                       ; inst 15
  ret i32 %23                                                                      ; inst 16
}

define i32 @perform_inorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = call i32 @perform_inorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %11, i32 %7) ; inst 8
  %13 = sext i32 %6 to i64                                                         ; inst 9
  %14 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %13                 ; inst 10
  %15 = load i32, i32* %14                                                         ; inst 11
  %16 = add i32 %7, 1                                                              ; inst 12
  %17 = mul i32 %15, %16                                                           ; inst 13
  %18 = sext i32 %6 to i64                                                         ; inst 14
  %19 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %18                 ; inst 15
  %20 = load i32, i32* %19                                                         ; inst 16
  %21 = sext i32 %6 to i64                                                         ; inst 17
  %22 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %21                 ; inst 18
  %23 = load i32, i32* %22                                                         ; inst 19
  %24 = mul i32 %20, %23                                                           ; inst 20
  %25 = add i32 %17, %24                                                           ; inst 21
  %26 = sext i32 %6 to i64                                                         ; inst 22
  %27 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %26                 ; inst 23
  %28 = load i32, i32* %27                                                         ; inst 24
  %29 = call i32 @perform_inorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %28, i32 %7) ; inst 25
  %30 = add i32 %12, %25                                                           ; inst 26
  %31 = add i32 %30, %29                                                           ; inst 27
  ret i32 %31                                                                      ; inst 28
}

define i32 @perform_preorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = add i32 %7, 2                                                              ; inst 8
  %13 = mul i32 %11, %12                                                           ; inst 9
  %14 = sext i32 %6 to i64                                                         ; inst 10
  %15 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %14                 ; inst 11
  %16 = load i32, i32* %15                                                         ; inst 12
  %17 = sext i32 %6 to i64                                                         ; inst 13
  %18 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %17                 ; inst 14
  %19 = load i32, i32* %18                                                         ; inst 15
  %20 = mul i32 %16, %19                                                           ; inst 16
  %21 = add i32 %13, %20                                                           ; inst 17
  %22 = sext i32 %6 to i64                                                         ; inst 18
  %23 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %22                 ; inst 19
  %24 = load i32, i32* %23                                                         ; inst 20
  %25 = call i32 @perform_preorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %24, i32 %7) ; inst 21
  %26 = sext i32 %6 to i64                                                         ; inst 22
  %27 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %26                 ; inst 23
  %28 = load i32, i32* %27                                                         ; inst 24
  %29 = call i32 @perform_preorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %28, i32 %7) ; inst 25
  %30 = add i32 %21, %25                                                           ; inst 26
  %31 = add i32 %30, %29                                                           ; inst 27
  ret i32 %31                                                                      ; inst 28
}

define i32 @perform_postorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = call i32 @perform_postorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %11, i32 %7) ; inst 8
  %13 = sext i32 %6 to i64                                                         ; inst 9
  %14 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %13                 ; inst 10
  %15 = load i32, i32* %14                                                         ; inst 11
  %16 = call i32 @perform_postorder_traversal_with_computation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %15, i32 %7) ; inst 12
  %17 = sext i32 %6 to i64                                                         ; inst 13
  %18 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %17                 ; inst 14
  %19 = load i32, i32* %18                                                         ; inst 15
  %20 = add i32 %7, 3                                                              ; inst 16
  %21 = mul i32 %19, %20                                                           ; inst 17
  %22 = sext i32 %6 to i64                                                         ; inst 18
  %23 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %22                 ; inst 19
  %24 = load i32, i32* %23                                                         ; inst 20
  %25 = sext i32 %6 to i64                                                         ; inst 21
  %26 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %25                 ; inst 22
  %27 = load i32, i32* %26                                                         ; inst 23
  %28 = mul i32 %24, %27                                                           ; inst 24
  %29 = add i32 %21, %28                                                           ; inst 25
  %30 = add i32 %12, %16                                                           ; inst 26
  %31 = add i32 %30, %29                                                           ; inst 27
  ret i32 %31                                                                      ; inst 28
}

define i32 @perform_level_order_traversal_simulation([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = alloca [200 x i32]                                                          ; inst 1
  %10 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i32 0                   ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %11 = phi i32 [0, %_0.entry.0], [%14, %_2.array.body.0]                          ; inst 4
  %12 = icmp slt i32 %11, 200                                                      ; inst 5
  br i1 %12, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 6
_2.array.body.0:
  %13 = getelementptr i32, i32* %10, i32 %11                                       ; inst 7
  store i32 -1, i32* %13                                                           ; inst 8
  %14 = add i32 %11, 1                                                             ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %15 = icmp eq i32 %6, -1                                                         ; inst 11
  br i1 %15, label %_4.if.then.0, label %_5.if.else.0                              ; inst 12
_4.if.then.0:
  ret i32 0                                                                        ; inst 13
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 14
_6.if.exit.0:
  %16 = sext i32 0 to i64                                                          ; inst 15
  %17 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i64 %16                 ; inst 16
  store i32 %6, i32* %17                                                           ; inst 17
  br label %_7.while.cond.0                                                        ; inst 18
_7.while.cond.0:
  %18 = phi i32 [1, %_6.if.exit.0], [%71, %_20.while.exit.1]                       ; inst 19
  %19 = phi i32 [0, %_6.if.exit.0], [%70, %_20.while.exit.1]                       ; inst 20
  %20 = phi i32 [1, %_6.if.exit.0], [%26, %_20.while.exit.1]                       ; inst 21
  %21 = phi i32 [0, %_6.if.exit.0], [%27, %_20.while.exit.1]                       ; inst 22
  %22 = icmp slt i32 %21, %20                                                      ; inst 23
  br i1 %22, label %_8.while.body.0, label %_21.while.exit.0                       ; inst 24
_8.while.body.0:
  %23 = sub i32 %20, %21                                                           ; inst 25
  br label %_9.while.cond.1                                                        ; inst 26
_9.while.cond.1:
  %24 = phi i32 [0, %_8.while.body.0], [%68, %_19.if.exit.2]                       ; inst 27
  %25 = phi i32 [0, %_8.while.body.0], [%45, %_19.if.exit.2]                       ; inst 28
  %26 = phi i32 [%20, %_8.while.body.0], [%67, %_19.if.exit.2]                     ; inst 29
  %27 = phi i32 [%21, %_8.while.body.0], [%34, %_19.if.exit.2]                     ; inst 30
  %28 = icmp slt i32 %24, %23                                                      ; inst 31
  br i1 %28, label %_10.lazy.then.0, label %_11.lazy.else.0                        ; inst 32
_10.lazy.then.0:
  %29 = icmp slt i32 %27, %26                                                      ; inst 33
  br label %_12.lazy.exit.0                                                        ; inst 34
_11.lazy.else.0:
  br label %_12.lazy.exit.0                                                        ; inst 35
_12.lazy.exit.0:
  %30 = phi i1 [%29, %_10.lazy.then.0], [0, %_11.lazy.else.0]                      ; inst 36
  br i1 %30, label %_13.while.body.1, label %_20.while.exit.1                      ; inst 37
_13.while.body.1:
  %31 = sext i32 %27 to i64                                                        ; inst 38
  %32 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i64 %31                 ; inst 39
  %33 = load i32, i32* %32                                                         ; inst 40
  %34 = add i32 %27, 1                                                             ; inst 41
  %35 = sext i32 %33 to i64                                                        ; inst 42
  %36 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %35                 ; inst 43
  %37 = load i32, i32* %36                                                         ; inst 44
  %38 = mul i32 %37, %18                                                           ; inst 45
  %39 = add i32 %25, %38                                                           ; inst 46
  %40 = sext i32 %33 to i64                                                        ; inst 47
  %41 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %40                 ; inst 48
  %42 = load i32, i32* %41                                                         ; inst 49
  %43 = add i32 %8, 1                                                              ; inst 50
  %44 = mul i32 %42, %43                                                           ; inst 51
  %45 = add i32 %39, %44                                                           ; inst 52
  %46 = sext i32 %33 to i64                                                        ; inst 53
  %47 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %46                 ; inst 54
  %48 = load i32, i32* %47                                                         ; inst 55
  %49 = icmp ne i32 %48, -1                                                        ; inst 56
  br i1 %49, label %_14.if.then.1, label %_15.if.else.1                            ; inst 57
_14.if.then.1:
  %50 = sext i32 %26 to i64                                                        ; inst 58
  %51 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i64 %50                 ; inst 59
  %52 = sext i32 %33 to i64                                                        ; inst 60
  %53 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %52                 ; inst 61
  %54 = load i32, i32* %53                                                         ; inst 62
  store i32 %54, i32* %51                                                          ; inst 63
  %55 = add i32 %26, 1                                                             ; inst 64
  br label %_16.if.exit.1                                                          ; inst 65
_15.if.else.1:
  br label %_16.if.exit.1                                                          ; inst 66
_16.if.exit.1:
  %56 = phi i32 [%55, %_14.if.then.1], [%26, %_15.if.else.1]                       ; inst 67
  %57 = sext i32 %33 to i64                                                        ; inst 68
  %58 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %57                 ; inst 69
  %59 = load i32, i32* %58                                                         ; inst 70
  %60 = icmp ne i32 %59, -1                                                        ; inst 71
  br i1 %60, label %_17.if.then.2, label %_18.if.else.2                            ; inst 72
_17.if.then.2:
  %61 = sext i32 %56 to i64                                                        ; inst 73
  %62 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i64 %61                 ; inst 74
  %63 = sext i32 %33 to i64                                                        ; inst 75
  %64 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %63                 ; inst 76
  %65 = load i32, i32* %64                                                         ; inst 77
  store i32 %65, i32* %62                                                          ; inst 78
  %66 = add i32 %56, 1                                                             ; inst 79
  br label %_19.if.exit.2                                                          ; inst 80
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 81
_19.if.exit.2:
  %67 = phi i32 [%66, %_17.if.then.2], [%56, %_18.if.else.2]                       ; inst 82
  %68 = add i32 %24, 1                                                             ; inst 83
  br label %_9.while.cond.1                                                        ; inst 84
_20.while.exit.1:
  %69 = mul i32 %25, %18                                                           ; inst 85
  %70 = add i32 %19, %69                                                           ; inst 86
  %71 = add i32 %18, 1                                                             ; inst 87
  br label %_7.while.cond.0                                                        ; inst 88
_21.while.exit.0:
  ret i32 %19                                                                      ; inst 89
}

define i32 @compute_diagonal_traversal_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %10 = sext i32 %6 to i64                                                         ; inst 5
  %11 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %10                 ; inst 6
  %12 = load i32, i32* %11                                                         ; inst 7
  %13 = add i32 %7, 1                                                              ; inst 8
  %14 = mul i32 %12, %13                                                           ; inst 9
  %15 = sext i32 %6 to i64                                                         ; inst 10
  %16 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %15                 ; inst 11
  %17 = load i32, i32* %16                                                         ; inst 12
  %18 = add i32 %8, 1                                                              ; inst 13
  %19 = mul i32 %17, %18                                                           ; inst 14
  %20 = add i32 %14, %19                                                           ; inst 15
  %21 = sext i32 %6 to i64                                                         ; inst 16
  %22 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %21                 ; inst 17
  %23 = load i32, i32* %22                                                         ; inst 18
  %24 = add i32 %7, 1                                                              ; inst 19
  %25 = call i32 @compute_diagonal_traversal_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %23, i32 %24, i32 %8) ; inst 20
  %26 = sext i32 %6 to i64                                                         ; inst 21
  %27 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %26                 ; inst 22
  %28 = load i32, i32* %27                                                         ; inst 23
  %29 = call i32 @compute_diagonal_traversal_sum([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %28, i32 %7, i32 %8) ; inst 24
  %30 = add i32 %20, %25                                                           ; inst 25
  %31 = add i32 %30, %29                                                           ; inst 26
  ret i32 %31                                                                      ; inst 27
}

define i32 @compute_complex_tree_properties([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = call i32 @compute_fibonacci_sum_for_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %8) ; inst 1
  %10 = call i32 @compute_prime_factor_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) ; inst 2
  %11 = call i32 @compute_recursive_depth_product([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 1, i32 %8) ; inst 3
  %12 = call i32 @perform_mathematical_sequence_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %8) ; inst 4
  %13 = call i32 @perform_nested_loop_computation_on_tree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) ; inst 5
  %14 = mul i32 %9, 7                                                              ; inst 6
  %15 = mul i32 %10, 11                                                            ; inst 7
  %16 = add i32 %14, %15                                                           ; inst 8
  %17 = mul i32 %11, 13                                                            ; inst 9
  %18 = add i32 %16, %17                                                           ; inst 10
  %19 = mul i32 %12, 17                                                            ; inst 11
  %20 = add i32 %18, %19                                                           ; inst 12
  %21 = mul i32 %13, 19                                                            ; inst 13
  %22 = add i32 %20, %21                                                           ; inst 14
  %23 = srem i32 %22, 1000000                                                      ; inst 15
  ret i32 %23                                                                      ; inst 16
}

define i32 @compute_fibonacci_sum_for_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = srem i32 %11, 20                                                           ; inst 8
  %13 = srem i32 %7, 5                                                             ; inst 9
  %14 = add i32 %12, %13                                                           ; inst 10
  %15 = call i32 @compute_fibonacci_iterative(i32 %14)                             ; inst 11
  %16 = sext i32 %6 to i64                                                         ; inst 12
  %17 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %16                 ; inst 13
  %18 = load i32, i32* %17                                                         ; inst 14
  %19 = call i32 @compute_fibonacci_sum_for_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %18, i32 %7) ; inst 15
  %20 = sext i32 %6 to i64                                                         ; inst 16
  %21 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %20                 ; inst 17
  %22 = load i32, i32* %21                                                         ; inst 18
  %23 = call i32 @compute_fibonacci_sum_for_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %22, i32 %7) ; inst 19
  %24 = add i32 %15, %19                                                           ; inst 20
  %25 = add i32 %24, %23                                                           ; inst 21
  ret i32 %25                                                                      ; inst 22
}

define i32 @compute_fibonacci_iterative(i32 %0) {
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
  %8 = srem i32 %3, 10000                                                          ; inst 14
  ret i32 %8                                                                       ; inst 15
}

define i32 @compute_prime_factor_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = call i32 @abs(i32 %11)                                                     ; inst 8
  %13 = add i32 %12, 1                                                             ; inst 9
  %14 = call i32 @count_prime_factors(i32 %13)                                     ; inst 10
  %15 = sext i32 %6 to i64                                                         ; inst 11
  %16 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %15                 ; inst 12
  %17 = load i32, i32* %16                                                         ; inst 13
  %18 = add i32 %17, 1                                                             ; inst 14
  %19 = call i32 @count_prime_factors(i32 %18)                                     ; inst 15
  %20 = sext i32 %6 to i64                                                         ; inst 16
  %21 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %20                 ; inst 17
  %22 = load i32, i32* %21                                                         ; inst 18
  %23 = add i32 %22, 1                                                             ; inst 19
  %24 = call i32 @count_prime_factors(i32 %23)                                     ; inst 20
  %25 = mul i32 %14, 5                                                             ; inst 21
  %26 = mul i32 %19, 3                                                             ; inst 22
  %27 = add i32 %25, %26                                                           ; inst 23
  %28 = mul i32 %24, 7                                                             ; inst 24
  %29 = add i32 %27, %28                                                           ; inst 25
  %30 = sext i32 %6 to i64                                                         ; inst 26
  %31 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %30                 ; inst 27
  %32 = load i32, i32* %31                                                         ; inst 28
  %33 = call i32 @compute_prime_factor_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %32, i32 %7) ; inst 29
  %34 = sext i32 %6 to i64                                                         ; inst 30
  %35 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %34                 ; inst 31
  %36 = load i32, i32* %35                                                         ; inst 32
  %37 = call i32 @compute_prime_factor_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %36, i32 %7) ; inst 33
  %38 = add i32 %29, %33                                                           ; inst 34
  %39 = add i32 %38, %37                                                           ; inst 35
  ret i32 %39                                                                      ; inst 36
}

define i32 @count_prime_factors(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [2, %_0.entry.0], [%12, %_5.while.exit.1]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%6, %_5.while.exit.1]                            ; inst 3
  %3 = phi i32 [%0, %_0.entry.0], [%7, %_5.while.exit.1]                           ; inst 4
  %4 = mul i32 %1, %1                                                              ; inst 5
  %5 = icmp sle i32 %4, %3                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %6 = phi i32 [%2, %_2.while.body.0], [%10, %_4.while.body.1]                     ; inst 9
  %7 = phi i32 [%3, %_2.while.body.0], [%11, %_4.while.body.1]                     ; inst 10
  %8 = srem i32 %7, %1                                                             ; inst 11
  %9 = icmp eq i32 %8, 0                                                           ; inst 12
  br i1 %9, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 13
_4.while.body.1:
  %10 = add i32 %6, 1                                                              ; inst 14
  %11 = sdiv i32 %7, %1                                                            ; inst 15
  br label %_3.while.cond.1                                                        ; inst 16
_5.while.exit.1:
  %12 = add i32 %1, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  %13 = icmp sgt i32 %3, 1                                                         ; inst 19
  br i1 %13, label %_7.if.then.0, label %_8.if.else.0                              ; inst 20
_7.if.then.0:
  %14 = add i32 %2, 1                                                              ; inst 21
  br label %_9.if.exit.0                                                           ; inst 22
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 23
_9.if.exit.0:
  %15 = phi i32 [%14, %_7.if.then.0], [%2, %_8.if.else.0]                          ; inst 24
  ret i32 %15                                                                      ; inst 25
}

define i32 @compute_recursive_depth_product([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %10 = sext i32 %6 to i64                                                         ; inst 5
  %11 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %10                 ; inst 6
  %12 = load i32, i32* %11                                                         ; inst 7
  %13 = srem i32 %12, 10                                                           ; inst 8
  %14 = add i32 %13, 1                                                             ; inst 9
  %15 = srem i32 %7, 5                                                             ; inst 10
  %16 = add i32 %15, 1                                                             ; inst 11
  %17 = mul i32 %14, %16                                                           ; inst 12
  %18 = srem i32 %8, 3                                                             ; inst 13
  %19 = add i32 %18, 1                                                             ; inst 14
  %20 = add i32 %17, %19                                                           ; inst 15
  %21 = sext i32 %6 to i64                                                         ; inst 16
  %22 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %21                 ; inst 17
  %23 = load i32, i32* %22                                                         ; inst 18
  %24 = add i32 %7, 1                                                              ; inst 19
  %25 = call i32 @compute_recursive_depth_product([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %23, i32 %24, i32 %8) ; inst 20
  %26 = sext i32 %6 to i64                                                         ; inst 21
  %27 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %26                 ; inst 22
  %28 = load i32, i32* %27                                                         ; inst 23
  %29 = add i32 %7, 1                                                              ; inst 24
  %30 = call i32 @compute_recursive_depth_product([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %28, i32 %29, i32 %8) ; inst 25
  %31 = mul i32 %20, %25                                                           ; inst 26
  %32 = srem i32 %31, 10000                                                        ; inst 27
  %33 = mul i32 %32, %30                                                           ; inst 28
  %34 = srem i32 %33, 10000                                                        ; inst 29
  %35 = srem i32 %34, 100000                                                       ; inst 30
  ret i32 %35                                                                      ; inst 31
}

define i32 @perform_mathematical_sequence_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = sext i32 %6 to i64                                                         ; inst 8
  %13 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %12                 ; inst 9
  %14 = load i32, i32* %13                                                         ; inst 10
  %15 = sext i32 %6 to i64                                                         ; inst 11
  %16 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %15                 ; inst 12
  %17 = load i32, i32* %16                                                         ; inst 13
  %18 = call i32 @compute_arithmetic_sequence_sum(i32 %11, i32 %14, i32 %17)       ; inst 14
  %19 = sext i32 %6 to i64                                                         ; inst 15
  %20 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %19                 ; inst 16
  %21 = load i32, i32* %20                                                         ; inst 17
  %22 = srem i32 %21, 5                                                            ; inst 18
  %23 = add i32 %22, 1                                                             ; inst 19
  %24 = sext i32 %6 to i64                                                         ; inst 20
  %25 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %24                 ; inst 21
  %26 = load i32, i32* %25                                                         ; inst 22
  %27 = srem i32 %26, 3                                                            ; inst 23
  %28 = add i32 %27, 1                                                             ; inst 24
  %29 = srem i32 %7, 7                                                             ; inst 25
  %30 = add i32 %29, 3                                                             ; inst 26
  %31 = call i32 @compute_geometric_sequence_sum(i32 %23, i32 %28, i32 %30)        ; inst 27
  %32 = sext i32 %6 to i64                                                         ; inst 28
  %33 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %32                 ; inst 29
  %34 = load i32, i32* %33                                                         ; inst 30
  %35 = sext i32 %6 to i64                                                         ; inst 31
  %36 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %35                 ; inst 32
  %37 = load i32, i32* %36                                                         ; inst 33
  %38 = call i32 @compute_quadratic_sequence_sum(i32 %34, i32 %37, i32 %7)         ; inst 34
  %39 = sext i32 %6 to i64                                                         ; inst 35
  %40 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %39                 ; inst 36
  %41 = load i32, i32* %40                                                         ; inst 37
  %42 = call i32 @perform_mathematical_sequence_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %41, i32 %7) ; inst 38
  %43 = sext i32 %6 to i64                                                         ; inst 39
  %44 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %43                 ; inst 40
  %45 = load i32, i32* %44                                                         ; inst 41
  %46 = call i32 @perform_mathematical_sequence_analysis([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %45, i32 %7) ; inst 42
  %47 = add i32 %18, %31                                                           ; inst 43
  %48 = add i32 %47, %38                                                           ; inst 44
  %49 = add i32 %48, %42                                                           ; inst 45
  %50 = add i32 %49, %46                                                           ; inst 46
  ret i32 %50                                                                      ; inst 47
}

define i32 @compute_arithmetic_sequence_sum(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @abs(i32 %2)                                                       ; inst 1
  %4 = call i32 @min(i32 %3, i32 20)                                               ; inst 2
  %5 = srem i32 %0, 100                                                            ; inst 3
  %6 = srem i32 %1, 10                                                             ; inst 4
  %7 = mul i32 2, %5                                                               ; inst 5
  %8 = sub i32 %4, 1                                                               ; inst 6
  %9 = mul i32 %8, %6                                                              ; inst 7
  %10 = add i32 %7, %9                                                             ; inst 8
  %11 = mul i32 %4, %10                                                            ; inst 9
  %12 = sdiv i32 %11, 2                                                            ; inst 10
  %13 = call i32 @abs(i32 %12)                                                     ; inst 11
  %14 = srem i32 %13, 10000                                                        ; inst 12
  ret i32 %14                                                                      ; inst 13
}

define i32 @compute_geometric_sequence_sum(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @abs(i32 %2)                                                       ; inst 1
  %4 = call i32 @min(i32 %3, i32 15)                                               ; inst 2
  %5 = call i32 @abs(i32 %0)                                                       ; inst 3
  %6 = srem i32 %5, 10                                                             ; inst 4
  %7 = add i32 %6, 1                                                               ; inst 5
  %8 = call i32 @abs(i32 %1)                                                       ; inst 6
  %9 = srem i32 %8, 3                                                              ; inst 7
  %10 = add i32 %9, 1                                                              ; inst 8
  %11 = icmp eq i32 %10, 1                                                         ; inst 9
  br i1 %11, label %_1.if.then.0, label %_2.if.else.0                              ; inst 10
_1.if.then.0:
  %12 = mul i32 %7, %4                                                             ; inst 11
  %13 = srem i32 %12, 10000                                                        ; inst 12
  ret i32 %13                                                                      ; inst 13
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 14
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 15
_4.while.cond.0:
  %14 = phi i32 [0, %_3.if.exit.0], [%19, %_5.while.body.0]                        ; inst 16
  %15 = phi i32 [0, %_3.if.exit.0], [%22, %_5.while.body.0]                        ; inst 17
  %16 = phi i32 [%7, %_3.if.exit.0], [%21, %_5.while.body.0]                       ; inst 18
  %17 = icmp slt i32 %15, %4                                                       ; inst 19
  br i1 %17, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 20
_5.while.body.0:
  %18 = add i32 %14, %16                                                           ; inst 21
  %19 = srem i32 %18, 10000                                                        ; inst 22
  %20 = mul i32 %16, %10                                                           ; inst 23
  %21 = srem i32 %20, 1000                                                         ; inst 24
  %22 = add i32 %15, 1                                                             ; inst 25
  br label %_4.while.cond.0                                                        ; inst 26
_6.while.exit.0:
  ret i32 %14                                                                      ; inst 27
}

define i32 @compute_quadratic_sequence_sum(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @abs(i32 %2)                                                       ; inst 1
  %4 = call i32 @min(i32 %3, i32 25)                                               ; inst 2
  %5 = call i32 @abs(i32 %0)                                                       ; inst 3
  %6 = srem i32 %5, 10                                                             ; inst 4
  %7 = add i32 %6, 1                                                               ; inst 5
  %8 = call i32 @abs(i32 %1)                                                       ; inst 6
  %9 = srem i32 %8, 5                                                              ; inst 7
  %10 = add i32 %9, 1                                                              ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_1.while.cond.0:
  %11 = phi i32 [1, %_0.entry.0], [%22, %_2.while.body.0]                          ; inst 10
  %12 = phi i32 [0, %_0.entry.0], [%21, %_2.while.body.0]                          ; inst 11
  %13 = icmp sle i32 %11, %4                                                       ; inst 12
  br i1 %13, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 13
_2.while.body.0:
  %14 = mul i32 %7, %11                                                            ; inst 14
  %15 = mul i32 %14, %11                                                           ; inst 15
  %16 = mul i32 %10, %11                                                           ; inst 16
  %17 = add i32 %15, %16                                                           ; inst 17
  %18 = srem i32 %2, 7                                                             ; inst 18
  %19 = add i32 %17, %18                                                           ; inst 19
  %20 = add i32 %12, %19                                                           ; inst 20
  %21 = srem i32 %20, 10000                                                        ; inst 21
  %22 = add i32 %11, 1                                                             ; inst 22
  br label %_1.while.cond.0                                                        ; inst 23
_3.while.exit.0:
  ret i32 %12                                                                      ; inst 24
}

define i32 @perform_nested_loop_computation_on_tree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%13, %_8.while.exit.1]                           ; inst 2
  %10 = phi i32 [0, %_0.entry.0], [%47, %_8.while.exit.1]                          ; inst 3
  %11 = icmp slt i32 %10, %7                                                       ; inst 4
  br i1 %11, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %12 = phi i32 [0, %_2.while.body.0], [%46, %_7.while.exit.2]                     ; inst 7
  %13 = phi i32 [%9, %_2.while.body.0], [%20, %_7.while.exit.2]                    ; inst 8
  %14 = sext i32 %10 to i64                                                        ; inst 9
  %15 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %14                 ; inst 10
  %16 = load i32, i32* %15                                                         ; inst 11
  %17 = call i32 @min(i32 %16, i32 15)                                             ; inst 12
  %18 = icmp slt i32 %12, %17                                                      ; inst 13
  br i1 %18, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 14
_4.while.body.1:
  br label %_5.while.cond.2                                                        ; inst 15
_5.while.cond.2:
  %19 = phi i32 [0, %_4.while.body.1], [%45, %_6.while.body.2]                     ; inst 16
  %20 = phi i32 [%13, %_4.while.body.1], [%44, %_6.while.body.2]                   ; inst 17
  %21 = sext i32 %10 to i64                                                        ; inst 18
  %22 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %21                 ; inst 19
  %23 = load i32, i32* %22                                                         ; inst 20
  %24 = call i32 @min(i32 %23, i32 8)                                              ; inst 21
  %25 = icmp slt i32 %19, %24                                                      ; inst 22
  br i1 %25, label %_6.while.body.2, label %_7.while.exit.2                        ; inst 23
_6.while.body.2:
  %26 = sext i32 %10 to i64                                                        ; inst 24
  %27 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %26                 ; inst 25
  %28 = load i32, i32* %27                                                         ; inst 26
  %29 = add i32 %12, 1                                                             ; inst 27
  %30 = mul i32 %28, %29                                                           ; inst 28
  %31 = add i32 %19, 1                                                             ; inst 29
  %32 = mul i32 %30, %31                                                           ; inst 30
  %33 = add i32 %10, 1                                                             ; inst 31
  %34 = mul i32 %8, %33                                                            ; inst 32
  %35 = add i32 %32, %34                                                           ; inst 33
  %36 = srem i32 %35, 1000                                                         ; inst 34
  %37 = add i32 %20, %36                                                           ; inst 35
  %38 = srem i32 %37, 100000                                                       ; inst 36
  %39 = sext i32 %10 to i64                                                        ; inst 37
  %40 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %39                 ; inst 38
  %41 = load i32, i32* %40                                                         ; inst 39
  %42 = call i32 @perform_inner_nested_computation(i32 %41, i32 %12, i32 %19, i32 %8) ; inst 40
  %43 = add i32 %38, %42                                                           ; inst 41
  %44 = srem i32 %43, 100000                                                       ; inst 42
  %45 = add i32 %19, 1                                                             ; inst 43
  br label %_5.while.cond.2                                                        ; inst 44
_7.while.exit.2:
  %46 = add i32 %12, 1                                                             ; inst 45
  br label %_3.while.cond.1                                                        ; inst 46
_8.while.exit.1:
  %47 = add i32 %10, 1                                                             ; inst 47
  br label %_1.while.cond.0                                                        ; inst 48
_9.while.exit.0:
  ret i32 %9                                                                       ; inst 49
}

define i32 @perform_inner_nested_computation(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = call i32 @abs(i32 %0)                                                       ; inst 1
  %5 = srem i32 %4, 50                                                             ; inst 2
  %6 = add i32 %5, 1                                                               ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%12, %_8.while.exit.1]                           ; inst 5
  %8 = phi i32 [1, %_0.entry.0], [%36, %_8.while.exit.1]                           ; inst 6
  %9 = add i32 %1, 1                                                               ; inst 7
  %10 = call i32 @min(i32 %9, i32 5)                                               ; inst 8
  %11 = icmp sle i32 %8, %10                                                       ; inst 9
  br i1 %11, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 10
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 11
_3.while.cond.1:
  %12 = phi i32 [%7, %_2.while.body.0], [%18, %_7.while.exit.2]                    ; inst 12
  %13 = phi i32 [1, %_2.while.body.0], [%35, %_7.while.exit.2]                     ; inst 13
  %14 = add i32 %2, 1                                                              ; inst 14
  %15 = call i32 @min(i32 %14, i32 4)                                              ; inst 15
  %16 = icmp sle i32 %13, %15                                                      ; inst 16
  br i1 %16, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 17
_4.while.body.1:
  br label %_5.while.cond.2                                                        ; inst 18
_5.while.cond.2:
  %17 = phi i32 [1, %_4.while.body.1], [%34, %_6.while.body.2]                     ; inst 19
  %18 = phi i32 [%12, %_4.while.body.1], [%33, %_6.while.body.2]                   ; inst 20
  %19 = add i32 %3, 1                                                              ; inst 21
  %20 = call i32 @min(i32 %19, i32 3)                                              ; inst 22
  %21 = icmp sle i32 %17, %20                                                      ; inst 23
  br i1 %21, label %_6.while.body.2, label %_7.while.exit.2                        ; inst 24
_6.while.body.2:
  %22 = mul i32 %6, %8                                                             ; inst 25
  %23 = mul i32 %22, %13                                                           ; inst 26
  %24 = mul i32 %23, %17                                                           ; inst 27
  %25 = mul i32 %8, %8                                                             ; inst 28
  %26 = add i32 %24, %25                                                           ; inst 29
  %27 = mul i32 %13, %13                                                           ; inst 30
  %28 = add i32 %26, %27                                                           ; inst 31
  %29 = mul i32 %17, %17                                                           ; inst 32
  %30 = add i32 %28, %29                                                           ; inst 33
  %31 = srem i32 %30, 1000                                                         ; inst 34
  %32 = add i32 %18, %31                                                           ; inst 35
  %33 = srem i32 %32, 10000                                                        ; inst 36
  %34 = add i32 %17, 1                                                             ; inst 37
  br label %_5.while.cond.2                                                        ; inst 38
_7.while.exit.2:
  %35 = add i32 %13, 1                                                             ; inst 39
  br label %_3.while.cond.1                                                        ; inst 40
_8.while.exit.1:
  %36 = add i32 %8, 1                                                              ; inst 41
  br label %_1.while.cond.0                                                        ; inst 42
_9.while.exit.0:
  ret i32 %7                                                                       ; inst 43
}

define i32 @validate_tree_integrity([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = call i32 @validate_tree_structure_recursive([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 -1) ; inst 1
  %9 = call i32 @validate_tree_properties_comprehensive([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) ; inst 2
  %10 = call i32 @validate_tree_consistency_checks([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) ; inst 3
  %11 = call i32 @validate_edge_cases_and_boundaries([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) ; inst 4
  %12 = mul i32 %8, 13                                                             ; inst 5
  %13 = mul i32 %9, 17                                                             ; inst 6
  %14 = add i32 %12, %13                                                           ; inst 7
  %15 = mul i32 %10, 19                                                            ; inst 8
  %16 = add i32 %14, %15                                                           ; inst 9
  %17 = mul i32 %11, 23                                                            ; inst 10
  %18 = add i32 %16, %17                                                           ; inst 11
  %19 = srem i32 %18, 1000000                                                      ; inst 12
  ret i32 %19                                                                      ; inst 13
}

define i32 @validate_tree_structure_recursive([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = icmp ne i32 %11, %7                                                        ; inst 8
  br i1 %12, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  ret i32 0                                                                        ; inst 10
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 11
_6.if.exit.1:
  %13 = sext i32 %6 to i64                                                         ; inst 12
  %14 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %13                 ; inst 13
  %15 = load i32, i32* %14                                                         ; inst 14
  %16 = call i32 @validate_tree_structure_recursive([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %15, i32 %6) ; inst 15
  %17 = sext i32 %6 to i64                                                         ; inst 16
  %18 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %17                 ; inst 17
  %19 = load i32, i32* %18                                                         ; inst 18
  %20 = call i32 @validate_tree_structure_recursive([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %19, i32 %6) ; inst 19
  %21 = call i32 @validate_bst_property_at_node([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) ; inst 20
  %22 = mul i32 %16, %20                                                           ; inst 21
  %23 = mul i32 %22, %21                                                           ; inst 22
  ret i32 %23                                                                      ; inst 23
}

define i32 @validate_bst_property_at_node([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = call i32 @find_maximum_in_subtree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %10) ; inst 8
  %12 = sext i32 %6 to i64                                                         ; inst 9
  %13 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %12                 ; inst 10
  %14 = load i32, i32* %13                                                         ; inst 11
  %15 = call i32 @find_minimum_in_subtree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %14) ; inst 12
  %16 = sext i32 %6 to i64                                                         ; inst 13
  %17 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %16                 ; inst 14
  %18 = load i32, i32* %17                                                         ; inst 15
  %19 = icmp eq i32 %18, -1                                                        ; inst 16
  br i1 %19, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 17
_4.lazy.then.0:
  br label %_6.lazy.exit.0                                                         ; inst 18
_5.lazy.else.0:
  %20 = sext i32 %6 to i64                                                         ; inst 19
  %21 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %20                 ; inst 20
  %22 = load i32, i32* %21                                                         ; inst 21
  %23 = icmp slt i32 %11, %22                                                      ; inst 22
  br label %_6.lazy.exit.0                                                         ; inst 23
_6.lazy.exit.0:
  %24 = phi i1 [1, %_4.lazy.then.0], [%23, %_5.lazy.else.0]                        ; inst 24
  %25 = sext i32 %6 to i64                                                         ; inst 25
  %26 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %25                 ; inst 26
  %27 = load i32, i32* %26                                                         ; inst 27
  %28 = icmp eq i32 %27, -1                                                        ; inst 28
  br i1 %28, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 29
_7.lazy.then.1:
  br label %_9.lazy.exit.1                                                         ; inst 30
_8.lazy.else.1:
  %29 = sext i32 %6 to i64                                                         ; inst 31
  %30 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %29                 ; inst 32
  %31 = load i32, i32* %30                                                         ; inst 33
  %32 = icmp sgt i32 %15, %31                                                      ; inst 34
  br label %_9.lazy.exit.1                                                         ; inst 35
_9.lazy.exit.1:
  %33 = phi i1 [1, %_7.lazy.then.1], [%32, %_8.lazy.else.1]                        ; inst 36
  br i1 %24, label %_10.lazy.then.2, label %_11.lazy.else.2                        ; inst 37
_10.lazy.then.2:
  br label %_12.lazy.exit.2                                                        ; inst 38
_11.lazy.else.2:
  br label %_12.lazy.exit.2                                                        ; inst 39
_12.lazy.exit.2:
  %34 = phi i1 [%33, %_10.lazy.then.2], [0, %_11.lazy.else.2]                      ; inst 40
  br i1 %34, label %_13.if.then.1, label %_14.if.else.1                            ; inst 41
_13.if.then.1:
  br label %_15.if.exit.1                                                          ; inst 42
_14.if.else.1:
  br label %_15.if.exit.1                                                          ; inst 43
_15.if.exit.1:
  %35 = phi i32 [1, %_13.if.then.1], [0, %_14.if.else.1]                           ; inst 44
  ret i32 %35                                                                      ; inst 45
}

define i32 @find_maximum_in_subtree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 -100000                                                                  ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %8 = phi i32 [%6, %_3.if.exit.0], [%15, %_5.while.body.0]                        ; inst 6
  %9 = sext i32 %8 to i64                                                          ; inst 7
  %10 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %9                  ; inst 8
  %11 = load i32, i32* %10                                                         ; inst 9
  %12 = icmp ne i32 %11, -1                                                        ; inst 10
  br i1 %12, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 11
_5.while.body.0:
  %13 = sext i32 %8 to i64                                                         ; inst 12
  %14 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %13                 ; inst 13
  %15 = load i32, i32* %14                                                         ; inst 14
  br label %_4.while.cond.0                                                        ; inst 15
_6.while.exit.0:
  %16 = sext i32 %8 to i64                                                         ; inst 16
  %17 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %16                 ; inst 17
  %18 = load i32, i32* %17                                                         ; inst 18
  ret i32 %18                                                                      ; inst 19
}

define i32 @find_minimum_in_subtree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 100000                                                                   ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %8 = phi i32 [%6, %_3.if.exit.0], [%15, %_5.while.body.0]                        ; inst 6
  %9 = sext i32 %8 to i64                                                          ; inst 7
  %10 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %9                  ; inst 8
  %11 = load i32, i32* %10                                                         ; inst 9
  %12 = icmp ne i32 %11, -1                                                        ; inst 10
  br i1 %12, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 11
_5.while.body.0:
  %13 = sext i32 %8 to i64                                                         ; inst 12
  %14 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %13                 ; inst 13
  %15 = load i32, i32* %14                                                         ; inst 14
  br label %_4.while.cond.0                                                        ; inst 15
_6.while.exit.0:
  %16 = sext i32 %8 to i64                                                         ; inst 16
  %17 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %16                 ; inst 17
  %18 = load i32, i32* %17                                                         ; inst 18
  ret i32 %18                                                                      ; inst 19
}

define i32 @validate_tree_properties_comprehensive([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%24, %_8.if.exit.1]                              ; inst 2
  %9 = phi i32 [0, %_0.entry.0], [%25, %_8.if.exit.1]                              ; inst 3
  %10 = icmp slt i32 %9, %7                                                        ; inst 4
  br i1 %10, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 5
_2.while.body.0:
  %11 = call i32 @compute_expected_height([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %9) ; inst 6
  %12 = call i32 @compute_expected_subtree_size([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %9) ; inst 7
  %13 = sext i32 %9 to i64                                                         ; inst 8
  %14 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %13                 ; inst 9
  %15 = load i32, i32* %14                                                         ; inst 10
  %16 = icmp eq i32 %11, %15                                                       ; inst 11
  br i1 %16, label %_3.if.then.0, label %_4.if.else.0                              ; inst 12
_3.if.then.0:
  %17 = add i32 %8, 10                                                             ; inst 13
  br label %_5.if.exit.0                                                           ; inst 14
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %18 = phi i32 [%17, %_3.if.then.0], [%8, %_4.if.else.0]                          ; inst 16
  %19 = sext i32 %9 to i64                                                         ; inst 17
  %20 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %19                 ; inst 18
  %21 = load i32, i32* %20                                                         ; inst 19
  %22 = icmp eq i32 %12, %21                                                       ; inst 20
  br i1 %22, label %_6.if.then.1, label %_7.if.else.1                              ; inst 21
_6.if.then.1:
  %23 = add i32 %18, 15                                                            ; inst 22
  br label %_8.if.exit.1                                                           ; inst 23
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 24
_8.if.exit.1:
  %24 = phi i32 [%23, %_6.if.then.1], [%18, %_7.if.else.1]                         ; inst 25
  %25 = add i32 %9, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_9.while.exit.0:
  ret i32 %8                                                                       ; inst 28
}

define i32 @compute_expected_height([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp eq i32 %10, -1                                                        ; inst 8
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 10
_5.if.else.1:
  %12 = sext i32 %6 to i64                                                         ; inst 11
  %13 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %12                 ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = call i32 @compute_expected_height([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %14) ; inst 14
  br label %_6.if.exit.1                                                           ; inst 15
_6.if.exit.1:
  %16 = phi i32 [0, %_4.if.then.1], [%15, %_5.if.else.1]                           ; inst 16
  %17 = sext i32 %6 to i64                                                         ; inst 17
  %18 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %17                 ; inst 18
  %19 = load i32, i32* %18                                                         ; inst 19
  %20 = icmp eq i32 %19, -1                                                        ; inst 20
  br i1 %20, label %_7.if.then.2, label %_8.if.else.2                              ; inst 21
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 22
_8.if.else.2:
  %21 = sext i32 %6 to i64                                                         ; inst 23
  %22 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %21                 ; inst 24
  %23 = load i32, i32* %22                                                         ; inst 25
  %24 = call i32 @compute_expected_height([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %23) ; inst 26
  br label %_9.if.exit.2                                                           ; inst 27
_9.if.exit.2:
  %25 = phi i32 [0, %_7.if.then.2], [%24, %_8.if.else.2]                           ; inst 28
  %26 = call i32 @max(i32 %16, i32 %25)                                            ; inst 29
  %27 = add i32 %26, 1                                                             ; inst 30
  ret i32 %27                                                                      ; inst 31
}

define i32 @compute_expected_subtree_size([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp eq i32 %10, -1                                                        ; inst 8
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 10
_5.if.else.1:
  %12 = sext i32 %6 to i64                                                         ; inst 11
  %13 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %12                 ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = call i32 @compute_expected_subtree_size([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %14) ; inst 14
  br label %_6.if.exit.1                                                           ; inst 15
_6.if.exit.1:
  %16 = phi i32 [0, %_4.if.then.1], [%15, %_5.if.else.1]                           ; inst 16
  %17 = sext i32 %6 to i64                                                         ; inst 17
  %18 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %17                 ; inst 18
  %19 = load i32, i32* %18                                                         ; inst 19
  %20 = icmp eq i32 %19, -1                                                        ; inst 20
  br i1 %20, label %_7.if.then.2, label %_8.if.else.2                              ; inst 21
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 22
_8.if.else.2:
  %21 = sext i32 %6 to i64                                                         ; inst 23
  %22 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %21                 ; inst 24
  %23 = load i32, i32* %22                                                         ; inst 25
  %24 = call i32 @compute_expected_subtree_size([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %23) ; inst 26
  br label %_9.if.exit.2                                                           ; inst 27
_9.if.exit.2:
  %25 = phi i32 [0, %_7.if.then.2], [%24, %_8.if.else.2]                           ; inst 28
  %26 = add i32 %16, %25                                                           ; inst 29
  %27 = add i32 %26, 1                                                             ; inst 30
  ret i32 %27                                                                      ; inst 31
}

define i32 @validate_tree_consistency_checks([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = call i32 @count_reachable_nodes_from_root([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) ; inst 1
  %9 = icmp eq i32 %8, %7                                                          ; inst 2
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %10 = phi i32 [100, %_1.if.then.0], [0, %_2.if.else.0]                           ; inst 6
  %11 = call i32 @detect_cycles_in_tree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) ; inst 7
  %12 = icmp eq i32 %11, 0                                                         ; inst 8
  br i1 %12, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  %13 = add i32 %10, 200                                                           ; inst 10
  br label %_6.if.exit.1                                                           ; inst 11
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 12
_6.if.exit.1:
  %14 = phi i32 [%13, %_4.if.then.1], [%10, %_5.if.else.1]                         ; inst 13
  %15 = call i32 @check_balance_consistency([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) ; inst 14
  %16 = add i32 %14, %15                                                           ; inst 15
  ret i32 %16                                                                      ; inst 16
}

define i32 @count_reachable_nodes_from_root([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = call i32 @count_reachable_nodes_from_root([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %10) ; inst 8
  %12 = sext i32 %6 to i64                                                         ; inst 9
  %13 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %12                 ; inst 10
  %14 = load i32, i32* %13                                                         ; inst 11
  %15 = call i32 @count_reachable_nodes_from_root([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %14) ; inst 12
  %16 = add i32 1, %11                                                             ; inst 13
  %17 = add i32 %16, %15                                                           ; inst 14
  ret i32 %17                                                                      ; inst 15
}

define i32 @detect_cycles_in_tree([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = alloca [200 x i1]                                                           ; inst 1
  %9 = getelementptr [200 x i1], [200 x i1]* %8, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %10 = phi i32 [0, %_0.entry.0], [%13, %_2.array.body.0]                          ; inst 4
  %11 = icmp slt i32 %10, 200                                                      ; inst 5
  br i1 %11, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 6
_2.array.body.0:
  %12 = getelementptr i1, i1* %9, i32 %10                                          ; inst 7
  store i1 0, i1* %12                                                              ; inst 8
  %13 = add i32 %10, 1                                                             ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %14 = call i32 @perform_dfs_cycle_detection([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, [200 x i1]* %8) ; inst 11
  ret i32 %14                                                                      ; inst 12
}

define i32 @perform_dfs_cycle_detection([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, [200 x i1]* %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i1], [200 x i1]* %7, i32 0, i64 %9                    ; inst 6
  %11 = load i1, i1* %10                                                           ; inst 7
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 8
_4.if.then.1:
  ret i32 1                                                                        ; inst 9
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 10
_6.if.exit.1:
  %12 = sext i32 %6 to i64                                                         ; inst 11
  %13 = getelementptr [200 x i1], [200 x i1]* %7, i32 0, i64 %12                   ; inst 12
  store i1 1, i1* %13                                                              ; inst 13
  %14 = sext i32 %6 to i64                                                         ; inst 14
  %15 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %14                 ; inst 15
  %16 = load i32, i32* %15                                                         ; inst 16
  %17 = call i32 @perform_dfs_cycle_detection([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %16, [200 x i1]* %7) ; inst 17
  %18 = sext i32 %6 to i64                                                         ; inst 18
  %19 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %18                 ; inst 19
  %20 = load i32, i32* %19                                                         ; inst 20
  %21 = call i32 @perform_dfs_cycle_detection([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %20, [200 x i1]* %7) ; inst 21
  %22 = sext i32 %6 to i64                                                         ; inst 22
  %23 = getelementptr [200 x i1], [200 x i1]* %7, i32 0, i64 %22                   ; inst 23
  store i1 0, i1* %23                                                              ; inst 24
  %24 = add i32 %17, %21                                                           ; inst 25
  ret i32 %24                                                                      ; inst 26
}

define i32 @check_balance_consistency([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp eq i32 %10, -1                                                        ; inst 8
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 9
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 10
_5.if.else.1:
  %12 = sext i32 %6 to i64                                                         ; inst 11
  %13 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %12                 ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = sext i32 %14 to i64                                                        ; inst 14
  %16 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %15                 ; inst 15
  %17 = load i32, i32* %16                                                         ; inst 16
  br label %_6.if.exit.1                                                           ; inst 17
_6.if.exit.1:
  %18 = phi i32 [0, %_4.if.then.1], [%17, %_5.if.else.1]                           ; inst 18
  %19 = sext i32 %6 to i64                                                         ; inst 19
  %20 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %19                 ; inst 20
  %21 = load i32, i32* %20                                                         ; inst 21
  %22 = icmp eq i32 %21, -1                                                        ; inst 22
  br i1 %22, label %_7.if.then.2, label %_8.if.else.2                              ; inst 23
_7.if.then.2:
  br label %_9.if.exit.2                                                           ; inst 24
_8.if.else.2:
  %23 = sext i32 %6 to i64                                                         ; inst 25
  %24 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %23                 ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = sext i32 %25 to i64                                                        ; inst 28
  %27 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %26                 ; inst 29
  %28 = load i32, i32* %27                                                         ; inst 30
  br label %_9.if.exit.2                                                           ; inst 31
_9.if.exit.2:
  %29 = phi i32 [0, %_7.if.then.2], [%28, %_8.if.else.2]                           ; inst 32
  %30 = sub i32 %18, %29                                                           ; inst 33
  %31 = call i32 @abs(i32 %30)                                                     ; inst 34
  %32 = icmp sle i32 %31, 3                                                        ; inst 35
  br i1 %32, label %_10.if.then.3, label %_11.if.else.3                            ; inst 36
_10.if.then.3:
  br label %_12.if.exit.3                                                          ; inst 37
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 38
_12.if.exit.3:
  %33 = phi i32 [10, %_10.if.then.3], [0, %_11.if.else.3]                          ; inst 39
  %34 = sext i32 %6 to i64                                                         ; inst 40
  %35 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %34                 ; inst 41
  %36 = load i32, i32* %35                                                         ; inst 42
  %37 = call i32 @check_balance_consistency([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %36) ; inst 43
  %38 = sext i32 %6 to i64                                                         ; inst 44
  %39 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %38                 ; inst 45
  %40 = load i32, i32* %39                                                         ; inst 46
  %41 = call i32 @check_balance_consistency([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %40) ; inst 47
  %42 = add i32 %33, %37                                                           ; inst 48
  %43 = add i32 %42, %41                                                           ; inst 49
  ret i32 %43                                                                      ; inst 50
}

define i32 @validate_edge_cases_and_boundaries([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  %9 = icmp eq i32 %7, 0                                                           ; inst 3
  br label %_3.lazy.exit.0                                                         ; inst 4
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %10 = phi i1 [%9, %_1.lazy.then.0], [0, %_2.lazy.else.0]                         ; inst 6
  br i1 %10, label %_4.if.then.0, label %_5.if.else.0                              ; inst 7
_4.if.then.0:
  br label %_6.if.exit.0                                                           ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %11 = phi i32 [50, %_4.if.then.0], [0, %_5.if.else.0]                            ; inst 10
  %12 = icmp ne i32 %6, -1                                                         ; inst 11
  br i1 %12, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 12
_7.lazy.then.1:
  %13 = sext i32 %6 to i64                                                         ; inst 13
  %14 = getelementptr [200 x i32], [200 x i32]* %3, i32 0, i64 %13                 ; inst 14
  %15 = load i32, i32* %14                                                         ; inst 15
  %16 = icmp eq i32 %15, -1                                                        ; inst 16
  br label %_9.lazy.exit.1                                                         ; inst 17
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 18
_9.lazy.exit.1:
  %17 = phi i1 [%16, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 19
  br i1 %17, label %_10.if.then.1, label %_11.if.else.1                            ; inst 20
_10.if.then.1:
  %18 = add i32 %11, 30                                                            ; inst 21
  br label %_12.if.exit.1                                                          ; inst 22
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 23
_12.if.exit.1:
  %19 = phi i32 [%18, %_10.if.then.1], [%11, %_11.if.else.1]                       ; inst 24
  %20 = call i32 @count_single_node_subtrees([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) ; inst 25
  %21 = mul i32 %20, 5                                                             ; inst 26
  %22 = add i32 %19, %21                                                           ; inst 27
  %23 = call i32 @count_leaf_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) ; inst 28
  %24 = sub i32 %7, %23                                                            ; inst 29
  %25 = icmp sgt i32 %23, 0                                                        ; inst 30
  br i1 %25, label %_13.lazy.then.2, label %_14.lazy.else.2                        ; inst 31
_13.lazy.then.2:
  %26 = icmp sge i32 %24, 0                                                        ; inst 32
  br label %_15.lazy.exit.2                                                        ; inst 33
_14.lazy.else.2:
  br label %_15.lazy.exit.2                                                        ; inst 34
_15.lazy.exit.2:
  %27 = phi i1 [%26, %_13.lazy.then.2], [0, %_14.lazy.else.2]                      ; inst 35
  br i1 %27, label %_16.if.then.2, label %_17.if.else.2                            ; inst 36
_16.if.then.2:
  %28 = add i32 %22, 25                                                            ; inst 37
  br label %_18.if.exit.2                                                          ; inst 38
_17.if.else.2:
  br label %_18.if.exit.2                                                          ; inst 39
_18.if.exit.2:
  %29 = phi i32 [%28, %_16.if.then.2], [%22, %_17.if.else.2]                       ; inst 40
  %30 = call i32 @find_maximum_depth([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 0) ; inst 41
  %31 = icmp sgt i32 %30, 0                                                        ; inst 42
  br i1 %31, label %_19.lazy.then.3, label %_20.lazy.else.3                        ; inst 43
_19.lazy.then.3:
  %32 = icmp sle i32 %30, %7                                                       ; inst 44
  br label %_21.lazy.exit.3                                                        ; inst 45
_20.lazy.else.3:
  br label %_21.lazy.exit.3                                                        ; inst 46
_21.lazy.exit.3:
  %33 = phi i1 [%32, %_19.lazy.then.3], [0, %_20.lazy.else.3]                      ; inst 47
  br i1 %33, label %_22.if.then.3, label %_23.if.else.3                            ; inst 48
_22.if.then.3:
  %34 = add i32 %29, 20                                                            ; inst 49
  br label %_24.if.exit.3                                                          ; inst 50
_23.if.else.3:
  br label %_24.if.exit.3                                                          ; inst 51
_24.if.exit.3:
  %35 = phi i32 [%34, %_22.if.then.3], [%29, %_23.if.else.3]                       ; inst 52
  ret i32 %35                                                                      ; inst 53
}

define i32 @count_single_node_subtrees([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp eq i32 %10, -1                                                        ; inst 8
  br i1 %11, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 9
_4.lazy.then.0:
  %12 = sext i32 %6 to i64                                                         ; inst 10
  %13 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %12                 ; inst 11
  %14 = load i32, i32* %13                                                         ; inst 12
  %15 = icmp eq i32 %14, -1                                                        ; inst 13
  br label %_6.lazy.exit.0                                                         ; inst 14
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 15
_6.lazy.exit.0:
  %16 = phi i1 [%15, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 16
  br i1 %16, label %_7.if.then.1, label %_8.if.else.1                              ; inst 17
_7.if.then.1:
  br label %_9.if.exit.1                                                           ; inst 18
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 19
_9.if.exit.1:
  %17 = phi i32 [1, %_7.if.then.1], [0, %_8.if.else.1]                             ; inst 20
  %18 = sext i32 %6 to i64                                                         ; inst 21
  %19 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %18                 ; inst 22
  %20 = load i32, i32* %19                                                         ; inst 23
  %21 = call i32 @count_single_node_subtrees([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %20) ; inst 24
  %22 = sext i32 %6 to i64                                                         ; inst 25
  %23 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %22                 ; inst 26
  %24 = load i32, i32* %23                                                         ; inst 27
  %25 = call i32 @count_single_node_subtrees([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %24) ; inst 28
  %26 = add i32 %17, %21                                                           ; inst 29
  %27 = add i32 %26, %25                                                           ; inst 30
  ret i32 %27                                                                      ; inst 31
}

define i32 @count_leaf_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %8                   ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp eq i32 %10, -1                                                        ; inst 8
  br i1 %11, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 9
_4.lazy.then.0:
  %12 = sext i32 %6 to i64                                                         ; inst 10
  %13 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %12                 ; inst 11
  %14 = load i32, i32* %13                                                         ; inst 12
  %15 = icmp eq i32 %14, -1                                                        ; inst 13
  br label %_6.lazy.exit.0                                                         ; inst 14
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 15
_6.lazy.exit.0:
  %16 = phi i1 [%15, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 16
  br i1 %16, label %_7.if.then.1, label %_8.if.else.1                              ; inst 17
_7.if.then.1:
  ret i32 1                                                                        ; inst 18
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 19
_9.if.exit.1:
  %17 = sext i32 %6 to i64                                                         ; inst 20
  %18 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %17                 ; inst 21
  %19 = load i32, i32* %18                                                         ; inst 22
  %20 = call i32 @count_leaf_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %19) ; inst 23
  %21 = sext i32 %6 to i64                                                         ; inst 24
  %22 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %21                 ; inst 25
  %23 = load i32, i32* %22                                                         ; inst 26
  %24 = call i32 @count_leaf_nodes([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %23) ; inst 27
  %25 = add i32 %20, %24                                                           ; inst 28
  ret i32 %25                                                                      ; inst 29
}

define i32 @find_maximum_depth([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  %8 = icmp eq i32 %6, -1                                                          ; inst 1
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %7                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %9 = sext i32 %6 to i64                                                          ; inst 5
  %10 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %9                  ; inst 6
  %11 = load i32, i32* %10                                                         ; inst 7
  %12 = add i32 %7, 1                                                              ; inst 8
  %13 = call i32 @find_maximum_depth([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %11, i32 %12) ; inst 9
  %14 = sext i32 %6 to i64                                                         ; inst 10
  %15 = getelementptr [200 x i32], [200 x i32]* %2, i32 0, i64 %14                 ; inst 11
  %16 = load i32, i32* %15                                                         ; inst 12
  %17 = add i32 %7, 1                                                              ; inst 13
  %18 = call i32 @find_maximum_depth([200 x i32]* %0, [200 x i32]* %1, [200 x i32]* %2, [200 x i32]* %3, [200 x i32]* %4, [200 x i32]* %5, i32 %16, i32 %17) ; inst 14
  %19 = call i32 @max(i32 %13, i32 %18)                                            ; inst 15
  ret i32 %19                                                                      ; inst 16
}

