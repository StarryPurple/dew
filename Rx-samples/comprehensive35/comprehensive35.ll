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
  %0 = alloca [20 x [20 x i32]]                                                    ; inst 1
  %1 = alloca [20 x i32]                                                           ; inst 2
  %2 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 20                                                         ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = getelementptr [20 x [20 x i32]], [20 x [20 x i32]]* %0, i32 0, i32 0        ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 20                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr [20 x i32], [20 x i32]* %7, i32 %8                           ; inst 17
  call void @memcpy([20 x i32]* %10, [20 x i32]* %1, i64 80)                       ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  call void @generate_maze([20 x [20 x i32]]* %0, i32 54321)                       ; inst 21
  %12 = getelementptr [20 x [20 x i32]], [20 x [20 x i32]]* %0, i32 0, i64 1       ; inst 22
  %13 = getelementptr [20 x i32], [20 x i32]* %12, i32 0, i64 1                    ; inst 23
  store i32 0, i32* %13                                                            ; inst 24
  %14 = getelementptr [20 x [20 x i32]], [20 x [20 x i32]]* %0, i32 0, i64 18      ; inst 25
  %15 = getelementptr [20 x i32], [20 x i32]* %14, i32 0, i64 18                   ; inst 26
  store i32 0, i32* %15                                                            ; inst 27
  %16 = trunc i64 1 to i32                                                         ; inst 28
  %17 = trunc i64 1 to i32                                                         ; inst 29
  %18 = trunc i64 18 to i32                                                        ; inst 30
  %19 = trunc i64 18 to i32                                                        ; inst 31
  %20 = call i32 @solve_maze([20 x [20 x i32]]* %0, i32 %16, i32 %17, i32 %18, i32 %19) ; inst 32
  call void @printlnInt(i32 %20)                                                   ; inst 33
  %21 = call i32 @solve_logic_puzzle()                                             ; inst 34
  call void @printlnInt(i32 %21)                                                   ; inst 35
  %22 = call i32 @run_control_flow_puzzle()                                        ; inst 36
  call void @printlnInt(i32 %22)                                                   ; inst 37
  call void @printlnInt(i32 9999)                                                  ; inst 38
  call void @exit(i32 0)                                                           ; inst 39
  ret void                                                                         ; inst 40
}

define void @generate_maze([20 x [20 x i32]]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%28, %_20.while.exit.1]                          ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%6, %_20.while.exit.1]                          ; inst 3
  %4 = icmp ult i64 %2, 20                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %5 = phi i64 [0, %_2.while.body.0], [%27, %_19.if.exit.0]                        ; inst 7
  %6 = phi i32 [%3, %_2.while.body.0], [%26, %_19.if.exit.0]                       ; inst 8
  %7 = icmp ult i64 %5, 20                                                         ; inst 9
  br i1 %7, label %_4.while.body.1, label %_20.while.exit.1                        ; inst 10
_4.while.body.1:
  %8 = icmp eq i64 %2, 0                                                           ; inst 11
  br i1 %8, label %_5.lazy.then.0, label %_6.lazy.else.0                           ; inst 12
_5.lazy.then.0:
  br label %_7.lazy.exit.0                                                         ; inst 13
_6.lazy.else.0:
  %9 = icmp eq i64 %5, 0                                                           ; inst 14
  br label %_7.lazy.exit.0                                                         ; inst 15
_7.lazy.exit.0:
  %10 = phi i1 [1, %_5.lazy.then.0], [%9, %_6.lazy.else.0]                         ; inst 16
  br i1 %10, label %_8.lazy.then.1, label %_9.lazy.else.1                          ; inst 17
_8.lazy.then.1:
  br label %_10.lazy.exit.1                                                        ; inst 18
_9.lazy.else.1:
  %11 = icmp eq i64 %2, 19                                                         ; inst 19
  br label %_10.lazy.exit.1                                                        ; inst 20
_10.lazy.exit.1:
  %12 = phi i1 [1, %_8.lazy.then.1], [%11, %_9.lazy.else.1]                        ; inst 21
  br i1 %12, label %_11.lazy.then.2, label %_12.lazy.else.2                        ; inst 22
_11.lazy.then.2:
  br label %_13.lazy.exit.2                                                        ; inst 23
_12.lazy.else.2:
  %13 = icmp eq i64 %5, 19                                                         ; inst 24
  br label %_13.lazy.exit.2                                                        ; inst 25
_13.lazy.exit.2:
  %14 = phi i1 [1, %_11.lazy.then.2], [%13, %_12.lazy.else.2]                      ; inst 26
  br i1 %14, label %_14.if.then.0, label %_15.if.else.0                            ; inst 27
_14.if.then.0:
  %15 = getelementptr [20 x [20 x i32]], [20 x [20 x i32]]* %0, i32 0, i64 %2      ; inst 28
  %16 = getelementptr [20 x i32], [20 x i32]* %15, i32 0, i64 %5                   ; inst 29
  store i32 1, i32* %16                                                            ; inst 30
  br label %_19.if.exit.0                                                          ; inst 31
_15.if.else.0:
  %17 = call i32 @pm_rand_update(i32 %6)                                           ; inst 32
  %18 = sdiv i32 %17, 65536                                                        ; inst 33
  %19 = srem i32 %18, 32768                                                        ; inst 34
  %20 = srem i32 %19, 4                                                            ; inst 35
  %21 = icmp eq i32 %20, 0                                                         ; inst 36
  br i1 %21, label %_16.if.then.1, label %_17.if.else.1                            ; inst 37
_16.if.then.1:
  %22 = getelementptr [20 x [20 x i32]], [20 x [20 x i32]]* %0, i32 0, i64 %2      ; inst 38
  %23 = getelementptr [20 x i32], [20 x i32]* %22, i32 0, i64 %5                   ; inst 39
  store i32 1, i32* %23                                                            ; inst 40
  br label %_18.if.exit.1                                                          ; inst 41
_17.if.else.1:
  %24 = getelementptr [20 x [20 x i32]], [20 x [20 x i32]]* %0, i32 0, i64 %2      ; inst 42
  %25 = getelementptr [20 x i32], [20 x i32]* %24, i32 0, i64 %5                   ; inst 43
  store i32 0, i32* %25                                                            ; inst 44
  br label %_18.if.exit.1                                                          ; inst 45
_18.if.exit.1:
  br label %_19.if.exit.0                                                          ; inst 46
_19.if.exit.0:
  %26 = phi i32 [%6, %_14.if.then.0], [%19, %_18.if.exit.1]                        ; inst 47
  %27 = add i64 %5, 1                                                              ; inst 48
  br label %_3.while.cond.1                                                        ; inst 49
_20.while.exit.1:
  %28 = add i64 %2, 1                                                              ; inst 50
  br label %_1.while.cond.0                                                        ; inst 51
_21.while.exit.0:
  ret void                                                                         ; inst 52
}

define i32 @solve_maze([20 x [20 x i32]]* %0, i32 %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [%1, %_0.entry.0], [%38, %_26.if.exit.5]                            ; inst 2
  %6 = phi i32 [%2, %_0.entry.0], [%39, %_26.if.exit.5]                            ; inst 3
  %7 = phi i32 [0, %_0.entry.0], [%43, %_26.if.exit.5]                             ; inst 4
  %8 = phi i32 [0, %_0.entry.0], [%40, %_26.if.exit.5]                             ; inst 5
  %9 = icmp slt i32 %7, 1000                                                       ; inst 6
  br i1 %9, label %_2.while.body.0, label %_27.while.exit.0                        ; inst 7
_2.while.body.0:
  %10 = icmp eq i32 %5, %3                                                         ; inst 8
  br i1 %10, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 9
_3.lazy.then.0:
  %11 = icmp eq i32 %6, %4                                                         ; inst 10
  br label %_5.lazy.exit.0                                                         ; inst 11
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 12
_5.lazy.exit.0:
  %12 = phi i1 [%11, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 13
  br i1 %12, label %_6.if.then.0, label %_7.if.else.0                              ; inst 14
_6.if.then.0:
  ret i32 %7                                                                       ; inst 15
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 16
_8.if.exit.0:
  br label %_9.while.cond.1                                                        ; inst 17
_9.while.cond.1:
  %13 = phi i32 [0, %_8.if.exit.0], [%37, %_22.if.exit.4]                          ; inst 18
  %14 = icmp slt i32 %13, 4                                                        ; inst 19
  br i1 %14, label %_10.while.body.1, label %_28.critical_edge.0                   ; inst 20
_10.while.body.1:
  %15 = add i32 %8, 3                                                              ; inst 21
  %16 = add i32 %15, %13                                                           ; inst 22
  %17 = srem i32 %16, 4                                                            ; inst 23
  %18 = icmp eq i32 %17, 0                                                         ; inst 24
  br i1 %18, label %_11.if.then.1, label %_12.if.else.1                            ; inst 25
_11.if.then.1:
  %19 = sub i32 %6, 1                                                              ; inst 26
  br label %_19.if.exit.1                                                          ; inst 27
_12.if.else.1:
  %20 = icmp eq i32 %17, 1                                                         ; inst 28
  br i1 %20, label %_13.if.then.2, label %_14.if.else.2                            ; inst 29
_13.if.then.2:
  %21 = add i32 %5, 1                                                              ; inst 30
  br label %_18.if.exit.2                                                          ; inst 31
_14.if.else.2:
  %22 = icmp eq i32 %17, 2                                                         ; inst 32
  br i1 %22, label %_15.if.then.3, label %_16.if.else.3                            ; inst 33
_15.if.then.3:
  %23 = add i32 %6, 1                                                              ; inst 34
  br label %_17.if.exit.3                                                          ; inst 35
_16.if.else.3:
  %24 = sub i32 %5, 1                                                              ; inst 36
  br label %_17.if.exit.3                                                          ; inst 37
_17.if.exit.3:
  %25 = phi i32 [%23, %_15.if.then.3], [%6, %_16.if.else.3]                        ; inst 38
  %26 = phi i32 [%5, %_15.if.then.3], [%24, %_16.if.else.3]                        ; inst 39
  br label %_18.if.exit.2                                                          ; inst 40
_18.if.exit.2:
  %27 = phi i32 [%6, %_13.if.then.2], [%25, %_17.if.exit.3]                        ; inst 41
  %28 = phi i32 [%21, %_13.if.then.2], [%26, %_17.if.exit.3]                       ; inst 42
  br label %_19.if.exit.1                                                          ; inst 43
_19.if.exit.1:
  %29 = phi i32 [%19, %_11.if.then.1], [%27, %_18.if.exit.2]                       ; inst 44
  %30 = phi i32 [%5, %_11.if.then.1], [%28, %_18.if.exit.2]                        ; inst 45
  %31 = sext i32 %29 to i64                                                        ; inst 46
  %32 = getelementptr [20 x [20 x i32]], [20 x [20 x i32]]* %0, i32 0, i64 %31     ; inst 47
  %33 = sext i32 %30 to i64                                                        ; inst 48
  %34 = getelementptr [20 x i32], [20 x i32]* %32, i32 0, i64 %33                  ; inst 49
  %35 = load i32, i32* %34                                                         ; inst 50
  %36 = icmp eq i32 %35, 0                                                         ; inst 51
  br i1 %36, label %_20.if.then.4, label %_21.if.else.4                            ; inst 52
_20.if.then.4:
  br label %_23.while.exit.1                                                       ; inst 53
_21.if.else.4:
  br label %_22.if.exit.4                                                          ; inst 54
_22.if.exit.4:
  %37 = add i32 %13, 1                                                             ; inst 55
  br label %_9.while.cond.1                                                        ; inst 56
_23.while.exit.1:
  %38 = phi i32 [%5, %_28.critical_edge.0], [%30, %_20.if.then.4]                  ; inst 57
  %39 = phi i32 [%6, %_28.critical_edge.0], [%29, %_20.if.then.4]                  ; inst 58
  %40 = phi i32 [%8, %_28.critical_edge.0], [%17, %_20.if.then.4]                  ; inst 59
  %41 = phi i1 [0, %_28.critical_edge.0], [1, %_20.if.then.4]                      ; inst 60
  %42 = icmp eq i1 %41, 0                                                          ; inst 61
  br i1 %42, label %_24.if.then.5, label %_25.if.else.5                            ; inst 62
_24.if.then.5:
  ret i32 -1                                                                       ; inst 63
_25.if.else.5:
  br label %_26.if.exit.5                                                          ; inst 64
_26.if.exit.5:
  %43 = add i32 %7, 1                                                              ; inst 65
  br label %_1.while.cond.0                                                        ; inst 66
_27.while.exit.0:
  ret i32 -1                                                                       ; inst 67
_28.critical_edge.0:
  br label %_23.while.exit.1                                                       ; inst 68
}

define i32 @solve_logic_puzzle() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%35, %_30.if.then.0], [%43, %_33.if.then.1], [%46, %_36.if.then.2], [%49, %_39.if.then.3], [%52, %_42.if.then.4], [%55, %_45.if.then.5] ; inst 2
  %1 = icmp slt i32 %0, 10000                                                      ; inst 3
  br i1 %1, label %_2.while.body.0, label %_48.while.exit.0                        ; inst 4
_2.while.body.0:
  %2 = srem i32 %0, 5                                                              ; inst 5
  %3 = add i32 %2, 1                                                               ; inst 6
  %4 = sdiv i32 %0, 5                                                              ; inst 7
  %5 = srem i32 %4, 5                                                              ; inst 8
  %6 = add i32 %5, 1                                                               ; inst 9
  %7 = sdiv i32 %0, 25                                                             ; inst 10
  %8 = srem i32 %7, 5                                                              ; inst 11
  %9 = add i32 %8, 1                                                               ; inst 12
  %10 = sdiv i32 %0, 125                                                           ; inst 13
  %11 = srem i32 %10, 5                                                            ; inst 14
  %12 = add i32 %11, 1                                                             ; inst 15
  %13 = sdiv i32 %0, 625                                                           ; inst 16
  %14 = srem i32 %13, 5                                                            ; inst 17
  %15 = add i32 %14, 1                                                             ; inst 18
  %16 = icmp eq i32 %3, %6                                                         ; inst 19
  br i1 %16, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 20
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 21
_4.lazy.else.0:
  %17 = icmp eq i32 %3, %9                                                         ; inst 22
  br label %_5.lazy.exit.0                                                         ; inst 23
_5.lazy.exit.0:
  %18 = phi i1 [1, %_3.lazy.then.0], [%17, %_4.lazy.else.0]                        ; inst 24
  br i1 %18, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 25
_6.lazy.then.1:
  br label %_8.lazy.exit.1                                                         ; inst 26
_7.lazy.else.1:
  %19 = icmp eq i32 %3, %12                                                        ; inst 27
  br label %_8.lazy.exit.1                                                         ; inst 28
_8.lazy.exit.1:
  %20 = phi i1 [1, %_6.lazy.then.1], [%19, %_7.lazy.else.1]                        ; inst 29
  br i1 %20, label %_9.lazy.then.2, label %_10.lazy.else.2                         ; inst 30
_9.lazy.then.2:
  br label %_11.lazy.exit.2                                                        ; inst 31
_10.lazy.else.2:
  %21 = icmp eq i32 %3, %15                                                        ; inst 32
  br label %_11.lazy.exit.2                                                        ; inst 33
_11.lazy.exit.2:
  %22 = phi i1 [1, %_9.lazy.then.2], [%21, %_10.lazy.else.2]                       ; inst 34
  br i1 %22, label %_12.lazy.then.3, label %_13.lazy.else.3                        ; inst 35
_12.lazy.then.3:
  br label %_14.lazy.exit.3                                                        ; inst 36
_13.lazy.else.3:
  %23 = icmp eq i32 %6, %9                                                         ; inst 37
  br label %_14.lazy.exit.3                                                        ; inst 38
_14.lazy.exit.3:
  %24 = phi i1 [1, %_12.lazy.then.3], [%23, %_13.lazy.else.3]                      ; inst 39
  br i1 %24, label %_15.lazy.then.4, label %_16.lazy.else.4                        ; inst 40
_15.lazy.then.4:
  br label %_17.lazy.exit.4                                                        ; inst 41
_16.lazy.else.4:
  %25 = icmp eq i32 %6, %12                                                        ; inst 42
  br label %_17.lazy.exit.4                                                        ; inst 43
_17.lazy.exit.4:
  %26 = phi i1 [1, %_15.lazy.then.4], [%25, %_16.lazy.else.4]                      ; inst 44
  br i1 %26, label %_18.lazy.then.5, label %_19.lazy.else.5                        ; inst 45
_18.lazy.then.5:
  br label %_20.lazy.exit.5                                                        ; inst 46
_19.lazy.else.5:
  %27 = icmp eq i32 %6, %15                                                        ; inst 47
  br label %_20.lazy.exit.5                                                        ; inst 48
_20.lazy.exit.5:
  %28 = phi i1 [1, %_18.lazy.then.5], [%27, %_19.lazy.else.5]                      ; inst 49
  br i1 %28, label %_21.lazy.then.6, label %_22.lazy.else.6                        ; inst 50
_21.lazy.then.6:
  br label %_23.lazy.exit.6                                                        ; inst 51
_22.lazy.else.6:
  %29 = icmp eq i32 %9, %12                                                        ; inst 52
  br label %_23.lazy.exit.6                                                        ; inst 53
_23.lazy.exit.6:
  %30 = phi i1 [1, %_21.lazy.then.6], [%29, %_22.lazy.else.6]                      ; inst 54
  br i1 %30, label %_24.lazy.then.7, label %_25.lazy.else.7                        ; inst 55
_24.lazy.then.7:
  br label %_26.lazy.exit.7                                                        ; inst 56
_25.lazy.else.7:
  %31 = icmp eq i32 %9, %15                                                        ; inst 57
  br label %_26.lazy.exit.7                                                        ; inst 58
_26.lazy.exit.7:
  %32 = phi i1 [1, %_24.lazy.then.7], [%31, %_25.lazy.else.7]                      ; inst 59
  br i1 %32, label %_27.lazy.then.8, label %_28.lazy.else.8                        ; inst 60
_27.lazy.then.8:
  br label %_29.lazy.exit.8                                                        ; inst 61
_28.lazy.else.8:
  %33 = icmp eq i32 %12, %15                                                       ; inst 62
  br label %_29.lazy.exit.8                                                        ; inst 63
_29.lazy.exit.8:
  %34 = phi i1 [1, %_27.lazy.then.8], [%33, %_28.lazy.else.8]                      ; inst 64
  br i1 %34, label %_30.if.then.0, label %_31.if.else.0                            ; inst 65
_30.if.then.0:
  %35 = add i32 %0, 1                                                              ; inst 66
  br label %_1.while.cond.0                                                        ; inst 67
_31.if.else.0:
  br label %_32.if.exit.0                                                          ; inst 68
_32.if.exit.0:
  %36 = icmp eq i32 %9, 1                                                          ; inst 69
  %37 = icmp eq i32 %6, 2                                                          ; inst 70
  %38 = icmp eq i32 %3, 5                                                          ; inst 71
  %39 = icmp ne i32 %12, 1                                                         ; inst 72
  %40 = icmp eq i32 %15, 4                                                         ; inst 73
  %41 = icmp eq i32 %3, 3                                                          ; inst 74
  %42 = icmp ne i1 %41, %36                                                        ; inst 75
  br i1 %42, label %_33.if.then.1, label %_34.if.else.1                            ; inst 76
_33.if.then.1:
  %43 = add i32 %0, 1                                                              ; inst 77
  br label %_1.while.cond.0                                                        ; inst 78
_34.if.else.1:
  br label %_35.if.exit.1                                                          ; inst 79
_35.if.exit.1:
  %44 = icmp eq i32 %6, 2                                                          ; inst 80
  %45 = icmp ne i1 %44, %37                                                        ; inst 81
  br i1 %45, label %_36.if.then.2, label %_37.if.else.2                            ; inst 82
_36.if.then.2:
  %46 = add i32 %0, 1                                                              ; inst 83
  br label %_1.while.cond.0                                                        ; inst 84
_37.if.else.2:
  br label %_38.if.exit.2                                                          ; inst 85
_38.if.exit.2:
  %47 = icmp eq i32 %9, 4                                                          ; inst 86
  %48 = icmp ne i1 %47, %38                                                        ; inst 87
  br i1 %48, label %_39.if.then.3, label %_40.if.else.3                            ; inst 88
_39.if.then.3:
  %49 = add i32 %0, 1                                                              ; inst 89
  br label %_1.while.cond.0                                                        ; inst 90
_40.if.else.3:
  br label %_41.if.exit.3                                                          ; inst 91
_41.if.exit.3:
  %50 = icmp eq i32 %12, 1                                                         ; inst 92
  %51 = icmp ne i1 %50, %39                                                        ; inst 93
  br i1 %51, label %_42.if.then.4, label %_43.if.else.4                            ; inst 94
_42.if.then.4:
  %52 = add i32 %0, 1                                                              ; inst 95
  br label %_1.while.cond.0                                                        ; inst 96
_43.if.else.4:
  br label %_44.if.exit.4                                                          ; inst 97
_44.if.exit.4:
  %53 = icmp eq i32 %15, 3                                                         ; inst 98
  %54 = icmp ne i1 %53, %40                                                        ; inst 99
  br i1 %54, label %_45.if.then.5, label %_46.if.else.5                            ; inst 100
_45.if.then.5:
  %55 = add i32 %0, 1                                                              ; inst 101
  br label %_1.while.cond.0                                                        ; inst 102
_46.if.else.5:
  br label %_47.if.exit.5                                                          ; inst 103
_47.if.exit.5:
  %56 = mul i32 %3, 10000                                                          ; inst 104
  %57 = mul i32 %6, 1000                                                           ; inst 105
  %58 = add i32 %56, %57                                                           ; inst 106
  %59 = mul i32 %9, 100                                                            ; inst 107
  %60 = add i32 %58, %59                                                           ; inst 108
  %61 = mul i32 %12, 10                                                            ; inst 109
  %62 = add i32 %60, %61                                                           ; inst 110
  %63 = add i32 %62, %15                                                           ; inst 111
  ret i32 %63                                                                      ; inst 112
_48.while.exit.0:
  ret i32 -1                                                                       ; inst 113
}

define i32 @run_control_flow_puzzle() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [1, %_0.entry.0], [%5, %_32.if.exit.4]                              ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%57, %_32.if.exit.4]                             ; inst 3
  %2 = phi i32 [1, %_0.entry.0], [%7, %_32.if.exit.4]                              ; inst 4
  %3 = phi i32 [1, %_0.entry.0], [%56, %_32.if.exit.4]                             ; inst 5
  %4 = icmp slt i32 %1, 100                                                        ; inst 6
  br i1 %4, label %_2.while.body.0, label %_33.while.exit.0                        ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %5 = phi i32 [%0, %_2.while.body.0], [%41, %_22.if.exit.0]                       ; inst 9
  %6 = phi i32 [0, %_2.while.body.0], [%44, %_22.if.exit.0]                        ; inst 10
  %7 = phi i32 [%2, %_2.while.body.0], [%42, %_22.if.exit.0]                       ; inst 11
  %8 = phi i32 [%3, %_2.while.body.0], [%43, %_22.if.exit.0]                       ; inst 12
  %9 = icmp slt i32 %6, 5                                                          ; inst 13
  br i1 %9, label %_4.while.body.1, label %_23.while.exit.1                        ; inst 14
_4.while.body.1:
  %10 = srem i32 %1, 2                                                             ; inst 15
  %11 = icmp eq i32 %10, 0                                                         ; inst 16
  br i1 %11, label %_5.if.then.0, label %_12.if.else.0                             ; inst 17
_5.if.then.0:
  %12 = add i32 %6, 1                                                              ; inst 18
  %13 = srem i32 %7, %12                                                           ; inst 19
  %14 = add i32 %5, %13                                                            ; inst 20
  %15 = icmp sgt i32 %14, 100                                                      ; inst 21
  br i1 %15, label %_6.if.then.1, label %_10.if.else.1                             ; inst 22
_6.if.then.1:
  br label %_7.while.cond.2                                                        ; inst 23
_7.while.cond.2:
  %16 = phi i32 [%7, %_6.if.then.1], [%20, %_8.while.body.2]                       ; inst 24
  %17 = phi i32 [0, %_6.if.then.1], [%21, %_8.while.body.2]                        ; inst 25
  %18 = icmp slt i32 %17, 3                                                        ; inst 26
  br i1 %18, label %_8.while.body.2, label %_9.while.exit.2                        ; inst 27
_8.while.body.2:
  %19 = mul i32 %8, %17                                                            ; inst 28
  %20 = add i32 %16, %19                                                           ; inst 29
  %21 = add i32 %17, 1                                                             ; inst 30
  br label %_7.while.cond.2                                                        ; inst 31
_9.while.exit.2:
  br label %_11.if.exit.1                                                          ; inst 32
_10.if.else.1:
  %22 = add i32 %7, 1                                                              ; inst 33
  br label %_11.if.exit.1                                                          ; inst 34
_11.if.exit.1:
  %23 = phi i32 [%16, %_9.while.exit.2], [%22, %_10.if.else.1]                     ; inst 35
  br label %_22.if.exit.0                                                          ; inst 36
_12.if.else.0:
  %24 = add i32 %6, 1                                                              ; inst 37
  %25 = srem i32 %5, %24                                                           ; inst 38
  %26 = add i32 %7, %25                                                            ; inst 39
  %27 = icmp sgt i32 %26, 150                                                      ; inst 40
  br i1 %27, label %_13.if.then.2, label %_20.if.else.2                            ; inst 41
_13.if.then.2:
  br label %_14.while.cond.3                                                       ; inst 42
_14.while.cond.3:
  %28 = phi i32 [%5, %_13.if.then.2], [%37, %_18.if.exit.3]                        ; inst 43
  %29 = phi i32 [%8, %_13.if.then.2], [%33, %_18.if.exit.3]                        ; inst 44
  %30 = phi i32 [0, %_13.if.then.2], [%38, %_18.if.exit.3]                         ; inst 45
  %31 = icmp slt i32 %30, 4                                                        ; inst 46
  br i1 %31, label %_15.while.body.3, label %_19.while.exit.3                      ; inst 47
_15.while.body.3:
  %32 = mul i32 %28, %30                                                           ; inst 48
  %33 = add i32 %29, %32                                                           ; inst 49
  %34 = srem i32 %33, 3                                                            ; inst 50
  %35 = icmp eq i32 %34, 0                                                         ; inst 51
  br i1 %35, label %_16.if.then.3, label %_17.if.else.3                            ; inst 52
_16.if.then.3:
  %36 = sub i32 %28, %30                                                           ; inst 53
  br label %_18.if.exit.3                                                          ; inst 54
_17.if.else.3:
  br label %_18.if.exit.3                                                          ; inst 55
_18.if.exit.3:
  %37 = phi i32 [%36, %_16.if.then.3], [%28, %_17.if.else.3]                       ; inst 56
  %38 = add i32 %30, 1                                                             ; inst 57
  br label %_14.while.cond.3                                                       ; inst 58
_19.while.exit.3:
  br label %_21.if.exit.2                                                          ; inst 59
_20.if.else.2:
  br label %_21.if.exit.2                                                          ; inst 60
_21.if.exit.2:
  %39 = phi i32 [%28, %_19.while.exit.3], [%5, %_20.if.else.2]                     ; inst 61
  %40 = phi i32 [%29, %_19.while.exit.3], [%8, %_20.if.else.2]                     ; inst 62
  br label %_22.if.exit.0                                                          ; inst 63
_22.if.exit.0:
  %41 = phi i32 [%14, %_11.if.exit.1], [%39, %_21.if.exit.2]                       ; inst 64
  %42 = phi i32 [%23, %_11.if.exit.1], [%26, %_21.if.exit.2]                       ; inst 65
  %43 = phi i32 [%8, %_11.if.exit.1], [%40, %_21.if.exit.2]                        ; inst 66
  %44 = add i32 %6, 1                                                              ; inst 67
  br label %_3.while.cond.1                                                        ; inst 68
_23.while.exit.1:
  %45 = srem i32 %1, 10                                                            ; inst 69
  %46 = icmp eq i32 %45, 0                                                         ; inst 70
  br i1 %46, label %_24.if.then.4, label %_31.if.else.4                            ; inst 71
_24.if.then.4:
  %47 = add i32 %5, %7                                                             ; inst 72
  %48 = add i32 %47, %8                                                            ; inst 73
  %49 = srem i32 %48, 7                                                            ; inst 74
  %50 = icmp eq i32 %49, 0                                                         ; inst 75
  br i1 %50, label %_25.if.then.5, label %_29.if.else.5                            ; inst 76
_25.if.then.5:
  %51 = icmp sgt i32 %1, 50                                                        ; inst 77
  br i1 %51, label %_26.if.then.6, label %_27.if.else.6                            ; inst 78
_26.if.then.6:
  %52 = add i32 %1, 1                                                              ; inst 79
  br label %_28.if.exit.6                                                          ; inst 80
_27.if.else.6:
  br label %_28.if.exit.6                                                          ; inst 81
_28.if.exit.6:
  %53 = phi i32 [%52, %_26.if.then.6], [%1, %_27.if.else.6]                        ; inst 82
  %54 = add i32 %8, %53                                                            ; inst 83
  br label %_30.if.exit.5                                                          ; inst 84
_29.if.else.5:
  br label %_30.if.exit.5                                                          ; inst 85
_30.if.exit.5:
  %55 = phi i32 [%54, %_28.if.exit.6], [%8, %_29.if.else.5]                        ; inst 86
  br label %_32.if.exit.4                                                          ; inst 87
_31.if.else.4:
  br label %_32.if.exit.4                                                          ; inst 88
_32.if.exit.4:
  %56 = phi i32 [%55, %_30.if.exit.5], [%8, %_31.if.else.4]                        ; inst 89
  %57 = add i32 %1, 1                                                              ; inst 90
  br label %_1.while.cond.0                                                        ; inst 91
_33.while.exit.0:
  %58 = add i32 %0, %2                                                             ; inst 92
  %59 = add i32 %58, %3                                                            ; inst 93
  ret i32 %59                                                                      ; inst 94
}

define void @another_puzzle() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%7, %_17.if.exit.0]                              ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%26, %_17.if.exit.0]                             ; inst 3
  %2 = phi i32 [0, %_0.entry.0], [%25, %_17.if.exit.0]                             ; inst 4
  %3 = icmp slt i32 %1, 500                                                        ; inst 5
  br i1 %3, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 6
_2.while.body.0:
  %4 = add i32 %2, 1                                                               ; inst 7
  %5 = mul i32 %1, 3                                                               ; inst 8
  %6 = add i32 %0, %5                                                              ; inst 9
  %7 = srem i32 %6, 17                                                             ; inst 10
  %8 = icmp slt i32 %7, 5                                                          ; inst 11
  br i1 %8, label %_3.if.then.0, label %_7.if.else.0                               ; inst 12
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 13
_4.while.cond.1:
  %9 = phi i32 [%4, %_3.if.then.0], [%12, %_5.while.body.1]                        ; inst 14
  %10 = phi i32 [0, %_3.if.then.0], [%13, %_5.while.body.1]                        ; inst 15
  %11 = icmp slt i32 %10, %7                                                       ; inst 16
  br i1 %11, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 17
_5.while.body.1:
  %12 = add i32 %9, %10                                                            ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.while.cond.1                                                        ; inst 20
_6.while.exit.1:
  br label %_17.if.exit.0                                                          ; inst 21
_7.if.else.0:
  %14 = icmp slt i32 %7, 12                                                        ; inst 22
  br i1 %14, label %_8.if.then.1, label %_12.if.else.1                             ; inst 23
_8.if.then.1:
  br label %_9.while.cond.2                                                        ; inst 24
_9.while.cond.2:
  %15 = phi i32 [%4, %_8.if.then.1], [%18, %_10.while.body.2]                      ; inst 25
  %16 = phi i32 [10, %_8.if.then.1], [%19, %_10.while.body.2]                      ; inst 26
  %17 = icmp sgt i32 %16, %7                                                       ; inst 27
  br i1 %17, label %_10.while.body.2, label %_11.while.exit.2                      ; inst 28
_10.while.body.2:
  %18 = sub i32 %15, %16                                                           ; inst 29
  %19 = sub i32 %16, 1                                                             ; inst 30
  br label %_9.while.cond.2                                                        ; inst 31
_11.while.exit.2:
  br label %_16.if.exit.1                                                          ; inst 32
_12.if.else.1:
  %20 = mul i32 %4, 2                                                              ; inst 33
  %21 = icmp sgt i32 %20, 10000                                                    ; inst 34
  br i1 %21, label %_13.if.then.2, label %_14.if.else.2                            ; inst 35
_13.if.then.2:
  %22 = sdiv i32 %20, 3                                                            ; inst 36
  br label %_15.if.exit.2                                                          ; inst 37
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 38
_15.if.exit.2:
  %23 = phi i32 [%22, %_13.if.then.2], [%20, %_14.if.else.2]                       ; inst 39
  br label %_16.if.exit.1                                                          ; inst 40
_16.if.exit.1:
  %24 = phi i32 [%15, %_11.while.exit.2], [%23, %_15.if.exit.2]                    ; inst 41
  br label %_17.if.exit.0                                                          ; inst 42
_17.if.exit.0:
  %25 = phi i32 [%9, %_6.while.exit.1], [%24, %_16.if.exit.1]                      ; inst 43
  %26 = add i32 %1, 1                                                              ; inst 44
  br label %_1.while.cond.0                                                        ; inst 45
_18.while.exit.0:
  call void @printlnInt(i32 %2)                                                    ; inst 46
  ret void                                                                         ; inst 47
}

define void @yet_another_control_flow() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%27, %_14.while.exit.1]                          ; inst 2
  %1 = phi i32 [1, %_0.entry.0], [%5, %_14.while.exit.1]                           ; inst 3
  %2 = phi i32 [1, %_0.entry.0], [%6, %_14.while.exit.1]                           ; inst 4
  %3 = icmp slt i32 %0, 10                                                         ; inst 5
  br i1 %3, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%26, %_13.while.exit.2]                     ; inst 8
  %5 = phi i32 [%1, %_2.while.body.0], [%9, %_13.while.exit.2]                     ; inst 9
  %6 = phi i32 [%2, %_2.while.body.0], [%10, %_13.while.exit.2]                    ; inst 10
  %7 = icmp slt i32 %4, 10                                                         ; inst 11
  br i1 %7, label %_4.while.body.1, label %_14.while.exit.1                        ; inst 12
_4.while.body.1:
  br label %_5.while.cond.2                                                        ; inst 13
_5.while.cond.2:
  %8 = phi i32 [0, %_4.while.body.1], [%25, %_12.if.exit.1]                        ; inst 14
  %9 = phi i32 [%5, %_4.while.body.1], [%23, %_12.if.exit.1]                       ; inst 15
  %10 = phi i32 [%6, %_4.while.body.1], [%24, %_12.if.exit.1]                      ; inst 16
  %11 = icmp slt i32 %8, 10                                                        ; inst 17
  br i1 %11, label %_6.while.body.2, label %_13.while.exit.2                       ; inst 18
_6.while.body.2:
  %12 = mul i32 %4, 2                                                              ; inst 19
  %13 = add i32 %0, %12                                                            ; inst 20
  %14 = mul i32 %8, 3                                                              ; inst 21
  %15 = add i32 %13, %14                                                           ; inst 22
  %16 = srem i32 %15, 5                                                            ; inst 23
  %17 = icmp eq i32 %16, 0                                                         ; inst 24
  br i1 %17, label %_7.if.then.0, label %_8.if.else.0                              ; inst 25
_7.if.then.0:
  %18 = add i32 %10, 1                                                             ; inst 26
  br label %_9.if.exit.0                                                           ; inst 27
_8.if.else.0:
  %19 = add i32 %9, 1                                                              ; inst 28
  br label %_9.if.exit.0                                                           ; inst 29
_9.if.exit.0:
  %20 = phi i32 [%9, %_7.if.then.0], [%19, %_8.if.else.0]                          ; inst 30
  %21 = phi i32 [%18, %_7.if.then.0], [%10, %_8.if.else.0]                         ; inst 31
  %22 = icmp sgt i32 %21, %20                                                      ; inst 32
  br i1 %22, label %_10.if.then.1, label %_11.if.else.1                            ; inst 33
_10.if.then.1:
  br label %_12.if.exit.1                                                          ; inst 34
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 35
_12.if.exit.1:
  %23 = phi i32 [%21, %_10.if.then.1], [%20, %_11.if.else.1]                       ; inst 36
  %24 = phi i32 [%20, %_10.if.then.1], [%21, %_11.if.else.1]                       ; inst 37
  %25 = add i32 %8, 1                                                              ; inst 38
  br label %_5.while.cond.2                                                        ; inst 39
_13.while.exit.2:
  %26 = add i32 %4, 1                                                              ; inst 40
  br label %_3.while.cond.1                                                        ; inst 41
_14.while.exit.1:
  %27 = add i32 %0, 1                                                              ; inst 42
  br label %_1.while.cond.0                                                        ; inst 43
_15.while.exit.0:
  %28 = mul i32 %2, 1000                                                           ; inst 44
  %29 = add i32 %28, %1                                                            ; inst 45
  call void @printlnInt(i32 %29)                                                   ; inst 46
  ret void                                                                         ; inst 47
}

