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
  %0 = alloca [60 x i32]                                                           ; inst 1
  %1 = getelementptr [60 x i32], [60 x i32]* %0, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 60                                                         ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i64 [0, %_3.array.exit.0], [%11, %_5.while.body.0]                      ; inst 12
  %7 = icmp ult i64 %6, 60                                                         ; inst 13
  br i1 %7, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 14
_5.while.body.0:
  %8 = getelementptr [60 x i32], [60 x i32]* %0, i32 0, i64 %6                     ; inst 15
  %9 = trunc i64 %6 to i32                                                         ; inst 16
  %10 = srem i32 %9, 8                                                             ; inst 17
  store i32 %10, i32* %8                                                           ; inst 18
  %11 = add i64 %6, 1                                                              ; inst 19
  br label %_4.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 21
_7.while.cond.1:
  %12 = phi i32 [0, %_6.while.exit.0], [%38, %_29.if.exit.5]                       ; inst 22
  %13 = phi i32 [-1, %_6.while.exit.0], [%39, %_29.if.exit.5]                      ; inst 23
  %14 = phi i64 [0, %_6.while.exit.0], [%49, %_29.if.exit.5]                       ; inst 24
  %15 = phi i32 [0, %_6.while.exit.0], [%47, %_29.if.exit.5]                       ; inst 25
  %16 = phi i32 [0, %_6.while.exit.0], [%48, %_29.if.exit.5]                       ; inst 26
  %17 = icmp ult i64 %14, 60                                                       ; inst 27
  br i1 %17, label %_8.while.body.1, label %_30.while.exit.1                       ; inst 28
_8.while.body.1:
  %18 = getelementptr [60 x i32], [60 x i32]* %0, i32 0, i64 %14                   ; inst 29
  %19 = load i32, i32* %18                                                         ; inst 30
  %20 = trunc i64 %14 to i32                                                       ; inst 31
  %21 = mul i32 %20, 10                                                            ; inst 32
  %22 = call i32 @process_event(i32 %15, i32 %19, i32 %21, i32 %12, i32 %13, i32 %16) ; inst 33
  %23 = icmp eq i32 %22, 1                                                         ; inst 34
  br i1 %23, label %_9.if.then.0, label %_10.if.else.0                             ; inst 35
_9.if.then.0:
  br label %_23.if.exit.0                                                          ; inst 36
_10.if.else.0:
  %24 = icmp eq i32 %22, 2                                                         ; inst 37
  br i1 %24, label %_11.if.then.1, label %_18.if.else.1                            ; inst 38
_11.if.then.1:
  %25 = icmp eq i32 %19, 2                                                         ; inst 39
  br i1 %25, label %_12.if.then.2, label %_13.if.else.2                            ; inst 40
_12.if.then.2:
  %26 = add i32 %12, 1                                                             ; inst 41
  br label %_17.if.exit.2                                                          ; inst 42
_13.if.else.2:
  %27 = icmp eq i32 %19, 3                                                         ; inst 43
  br i1 %27, label %_14.if.then.3, label %_15.if.else.3                            ; inst 44
_14.if.then.3:
  br label %_16.if.exit.3                                                          ; inst 45
_15.if.else.3:
  br label %_16.if.exit.3                                                          ; inst 46
_16.if.exit.3:
  %28 = phi i32 [%21, %_14.if.then.3], [%13, %_15.if.else.3]                       ; inst 47
  br label %_17.if.exit.2                                                          ; inst 48
_17.if.exit.2:
  %29 = phi i32 [%26, %_12.if.then.2], [%12, %_16.if.exit.3]                       ; inst 49
  %30 = phi i32 [%13, %_12.if.then.2], [%28, %_16.if.exit.3]                       ; inst 50
  br label %_22.if.exit.1                                                          ; inst 51
_18.if.else.1:
  %31 = icmp eq i32 %22, 4                                                         ; inst 52
  br i1 %31, label %_19.if.then.4, label %_20.if.else.4                            ; inst 53
_19.if.then.4:
  br label %_21.if.exit.4                                                          ; inst 54
_20.if.else.4:
  br label %_21.if.exit.4                                                          ; inst 55
_21.if.exit.4:
  %32 = phi i32 [0, %_19.if.then.4], [%22, %_20.if.else.4]                         ; inst 56
  %33 = phi i32 [0, %_19.if.then.4], [%16, %_20.if.else.4]                         ; inst 57
  br label %_22.if.exit.1                                                          ; inst 58
_22.if.exit.1:
  %34 = phi i32 [%29, %_17.if.exit.2], [%12, %_21.if.exit.4]                       ; inst 59
  %35 = phi i32 [%30, %_17.if.exit.2], [%13, %_21.if.exit.4]                       ; inst 60
  %36 = phi i32 [%22, %_17.if.exit.2], [%32, %_21.if.exit.4]                       ; inst 61
  %37 = phi i32 [%16, %_17.if.exit.2], [%33, %_21.if.exit.4]                       ; inst 62
  br label %_23.if.exit.0                                                          ; inst 63
_23.if.exit.0:
  %38 = phi i32 [0, %_9.if.then.0], [%34, %_22.if.exit.1]                          ; inst 64
  %39 = phi i32 [-1, %_9.if.then.0], [%35, %_22.if.exit.1]                         ; inst 65
  %40 = phi i32 [%22, %_9.if.then.0], [%36, %_22.if.exit.1]                        ; inst 66
  %41 = phi i32 [%16, %_9.if.then.0], [%37, %_22.if.exit.1]                        ; inst 67
  %42 = sub i32 %38, 5                                                             ; inst 68
  %43 = icmp slt i32 %39, %42                                                      ; inst 69
  br i1 %43, label %_24.if.then.5, label %_28.if.else.5                            ; inst 70
_24.if.then.5:
  %44 = add i32 %41, 1                                                             ; inst 71
  %45 = icmp sgt i32 %44, 3                                                        ; inst 72
  br i1 %45, label %_25.if.then.6, label %_26.if.else.6                            ; inst 73
_25.if.then.6:
  br label %_27.if.exit.6                                                          ; inst 74
_26.if.else.6:
  br label %_27.if.exit.6                                                          ; inst 75
_27.if.exit.6:
  %46 = phi i32 [4, %_25.if.then.6], [%40, %_26.if.else.6]                         ; inst 76
  br label %_29.if.exit.5                                                          ; inst 77
_28.if.else.5:
  br label %_29.if.exit.5                                                          ; inst 78
_29.if.exit.5:
  %47 = phi i32 [%46, %_27.if.exit.6], [%40, %_28.if.else.5]                       ; inst 79
  %48 = phi i32 [%44, %_27.if.exit.6], [%41, %_28.if.else.5]                       ; inst 80
  call void @printInt(i32 %47)                                                     ; inst 81
  %49 = add i64 %14, 1                                                             ; inst 82
  br label %_7.while.cond.1                                                        ; inst 83
_30.while.exit.1:
  call void @exit(i32 0)                                                           ; inst 84
  ret void                                                                         ; inst 85
}

define i32 @process_event(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) {
_0.entry.0:
  %6 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %6, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  %7 = icmp eq i32 %1, 0                                                           ; inst 3
  br i1 %7, label %_2.if.then.1, label %_3.if.else.1                               ; inst 4
_2.if.then.1:
  br label %_4.if.exit.1                                                           ; inst 5
_3.if.else.1:
  br label %_4.if.exit.1                                                           ; inst 6
_4.if.exit.1:
  %8 = phi i32 [1, %_2.if.then.1], [%0, %_3.if.else.1]                             ; inst 7
  br label %_48.if.exit.0                                                          ; inst 8
_5.if.else.0:
  %9 = icmp eq i32 %0, 1                                                           ; inst 9
  br i1 %9, label %_6.if.then.2, label %_13.if.else.2                              ; inst 10
_6.if.then.2:
  %10 = icmp eq i32 %1, 1                                                          ; inst 11
  br i1 %10, label %_7.if.then.3, label %_8.if.else.3                              ; inst 12
_7.if.then.3:
  br label %_12.if.exit.3                                                          ; inst 13
_8.if.else.3:
  %11 = icmp eq i32 %1, 6                                                          ; inst 14
  br i1 %11, label %_9.if.then.4, label %_10.if.else.4                             ; inst 15
_9.if.then.4:
  br label %_11.if.exit.4                                                          ; inst 16
_10.if.else.4:
  br label %_11.if.exit.4                                                          ; inst 17
_11.if.exit.4:
  %12 = phi i32 [0, %_9.if.then.4], [%0, %_10.if.else.4]                           ; inst 18
  br label %_12.if.exit.3                                                          ; inst 19
_12.if.exit.3:
  %13 = phi i32 [2, %_7.if.then.3], [%12, %_11.if.exit.4]                          ; inst 20
  br label %_47.if.exit.2                                                          ; inst 21
_13.if.else.2:
  %14 = icmp eq i32 %0, 2                                                          ; inst 22
  br i1 %14, label %_14.if.then.5, label %_33.if.else.5                            ; inst 23
_14.if.then.5:
  %15 = icmp eq i32 %1, 2                                                          ; inst 24
  br i1 %15, label %_15.if.then.6, label %_19.if.else.6                            ; inst 25
_15.if.then.6:
  %16 = call i1 @validate_checksum(i32 %2)                                         ; inst 26
  br i1 %16, label %_16.if.then.7, label %_17.if.else.7                            ; inst 27
_16.if.then.7:
  br label %_18.if.exit.7                                                          ; inst 28
_17.if.else.7:
  br label %_18.if.exit.7                                                          ; inst 29
_18.if.exit.7:
  %17 = phi i32 [%0, %_16.if.then.7], [4, %_17.if.else.7]                          ; inst 30
  br label %_32.if.exit.6                                                          ; inst 31
_19.if.else.6:
  %18 = icmp eq i32 %1, 3                                                          ; inst 32
  br i1 %18, label %_20.if.then.8, label %_24.if.else.8                            ; inst 33
_20.if.then.8:
  %19 = icmp sgt i32 %2, %4                                                        ; inst 34
  br i1 %19, label %_21.if.then.9, label %_22.if.else.9                            ; inst 35
_21.if.then.9:
  br label %_23.if.exit.9                                                          ; inst 36
_22.if.else.9:
  br label %_23.if.exit.9                                                          ; inst 37
_23.if.exit.9:
  br label %_31.if.exit.8                                                          ; inst 38
_24.if.else.8:
  %20 = icmp eq i32 %1, 4                                                          ; inst 39
  br i1 %20, label %_25.if.then.10, label %_26.if.else.10                          ; inst 40
_25.if.then.10:
  br label %_30.if.exit.10                                                         ; inst 41
_26.if.else.10:
  %21 = icmp eq i32 %1, 7                                                          ; inst 42
  br i1 %21, label %_27.if.then.11, label %_28.if.else.11                          ; inst 43
_27.if.then.11:
  br label %_29.if.exit.11                                                         ; inst 44
_28.if.else.11:
  br label %_29.if.exit.11                                                         ; inst 45
_29.if.exit.11:
  %22 = phi i32 [4, %_27.if.then.11], [%0, %_28.if.else.11]                        ; inst 46
  br label %_30.if.exit.10                                                         ; inst 47
_30.if.exit.10:
  %23 = phi i32 [3, %_25.if.then.10], [%22, %_29.if.exit.11]                       ; inst 48
  br label %_31.if.exit.8                                                          ; inst 49
_31.if.exit.8:
  %24 = phi i32 [%0, %_23.if.exit.9], [%23, %_30.if.exit.10]                       ; inst 50
  br label %_32.if.exit.6                                                          ; inst 51
_32.if.exit.6:
  %25 = phi i32 [%17, %_18.if.exit.7], [%24, %_31.if.exit.8]                       ; inst 52
  br label %_46.if.exit.5                                                          ; inst 53
_33.if.else.5:
  %26 = icmp eq i32 %0, 3                                                          ; inst 54
  br i1 %26, label %_34.if.then.12, label %_41.if.else.12                          ; inst 55
_34.if.then.12:
  %27 = icmp eq i32 %1, 5                                                          ; inst 56
  br i1 %27, label %_35.if.then.13, label %_36.if.else.13                          ; inst 57
_35.if.then.13:
  br label %_40.if.exit.13                                                         ; inst 58
_36.if.else.13:
  %28 = icmp eq i32 %1, 6                                                          ; inst 59
  br i1 %28, label %_37.if.then.14, label %_38.if.else.14                          ; inst 60
_37.if.then.14:
  br label %_39.if.exit.14                                                         ; inst 61
_38.if.else.14:
  br label %_39.if.exit.14                                                         ; inst 62
_39.if.exit.14:
  %29 = phi i32 [0, %_37.if.then.14], [%0, %_38.if.else.14]                        ; inst 63
  br label %_40.if.exit.13                                                         ; inst 64
_40.if.exit.13:
  %30 = phi i32 [0, %_35.if.then.13], [%29, %_39.if.exit.14]                       ; inst 65
  br label %_45.if.exit.12                                                         ; inst 66
_41.if.else.12:
  %31 = icmp eq i32 %0, 4                                                          ; inst 67
  br i1 %31, label %_42.if.then.15, label %_43.if.else.15                          ; inst 68
_42.if.then.15:
  br label %_44.if.exit.15                                                         ; inst 69
_43.if.else.15:
  br label %_44.if.exit.15                                                         ; inst 70
_44.if.exit.15:
  br label %_45.if.exit.12                                                         ; inst 71
_45.if.exit.12:
  %32 = phi i32 [%30, %_40.if.exit.13], [%0, %_44.if.exit.15]                      ; inst 72
  br label %_46.if.exit.5                                                          ; inst 73
_46.if.exit.5:
  %33 = phi i32 [%25, %_32.if.exit.6], [%32, %_45.if.exit.12]                      ; inst 74
  br label %_47.if.exit.2                                                          ; inst 75
_47.if.exit.2:
  %34 = phi i32 [%13, %_12.if.exit.3], [%33, %_46.if.exit.5]                       ; inst 76
  br label %_48.if.exit.0                                                          ; inst 77
_48.if.exit.0:
  %35 = phi i32 [%8, %_4.if.exit.1], [%34, %_47.if.exit.2]                         ; inst 78
  %36 = call i32 @complex_state_logic(i32 %35, i32 %1, i32 %2)                     ; inst 79
  ret i32 %36                                                                      ; inst 80
}

define i1 @validate_checksum(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%8, %_5.if.exit.0]                               ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_5.if.exit.0]                               ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = srem i32 %0, %1                                                             ; inst 6
  %5 = icmp eq i32 %4, 0                                                           ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = add i32 %2, %1                                                              ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %7 = phi i32 [%6, %_3.if.then.0], [%2, %_4.if.else.0]                            ; inst 12
  %8 = add i32 %1, 1                                                               ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  %9 = srem i32 %2, 2                                                              ; inst 15
  %10 = icmp eq i32 %9, 0                                                          ; inst 16
  ret i1 %10                                                                       ; inst 17
}

define i32 @complex_state_logic(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, 6                                                           ; inst 1
  br i1 %3, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = icmp eq i32 %0, 2                                                           ; inst 3
  br i1 %4, label %_2.if.then.1, label %_3.if.else.1                               ; inst 4
_2.if.then.1:
  %5 = call i32 @perform_recovery(i32 %0, i32 %2)                                  ; inst 5
  br label %_4.if.exit.1                                                           ; inst 6
_3.if.else.1:
  br label %_4.if.exit.1                                                           ; inst 7
_4.if.exit.1:
  %6 = phi i32 [%5, %_2.if.then.1], [%0, %_3.if.else.1]                            ; inst 8
  br label %_6.if.exit.0                                                           ; inst 9
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 10
_6.if.exit.0:
  %7 = phi i32 [%6, %_4.if.exit.1], [%0, %_5.if.else.0]                            ; inst 11
  br label %_7.while.cond.0                                                        ; inst 12
_7.while.cond.0:
  %8 = phi i32 [%2, %_6.if.exit.0], [%14, %_8.while.body.0]                        ; inst 13
  %9 = phi i32 [0, %_6.if.exit.0], [%15, %_8.while.body.0]                         ; inst 14
  %10 = icmp slt i32 %9, 5                                                         ; inst 15
  br i1 %10, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 16
_8.while.body.0:
  %11 = add i32 %9, 2                                                              ; inst 17
  %12 = sdiv i32 %8, %11                                                           ; inst 18
  %13 = mul i32 %9, %9                                                             ; inst 19
  %14 = add i32 %12, %13                                                           ; inst 20
  %15 = add i32 %9, 1                                                              ; inst 21
  br label %_7.while.cond.0                                                        ; inst 22
_9.while.exit.0:
  %16 = srem i32 %8, 10                                                            ; inst 23
  %17 = icmp eq i32 %16, 0                                                         ; inst 24
  br i1 %17, label %_10.if.then.2, label %_14.if.else.2                            ; inst 25
_10.if.then.2:
  %18 = icmp ne i32 %7, 4                                                          ; inst 26
  br i1 %18, label %_11.if.then.3, label %_12.if.else.3                            ; inst 27
_11.if.then.3:
  br label %_13.if.exit.3                                                          ; inst 28
_12.if.else.3:
  br label %_13.if.exit.3                                                          ; inst 29
_13.if.exit.3:
  %19 = phi i32 [4, %_11.if.then.3], [%7, %_12.if.else.3]                          ; inst 30
  br label %_15.if.exit.2                                                          ; inst 31
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 32
_15.if.exit.2:
  %20 = phi i32 [%19, %_13.if.exit.3], [%7, %_14.if.else.2]                        ; inst 33
  ret i32 %20                                                                      ; inst 34
}

define i32 @perform_recovery(i32 %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 3
  %4 = icmp slt i32 %2, 10                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = add i32 %2, 1                                                               ; inst 6
  %6 = srem i32 %1, %5                                                             ; inst 7
  %7 = add i32 %3, %6                                                              ; inst 8
  %8 = add i32 %2, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  %9 = icmp sgt i32 %3, 20                                                         ; inst 11
  br i1 %9, label %_4.if.then.0, label %_5.if.else.0                               ; inst 12
_4.if.then.0:
  ret i32 %0                                                                       ; inst 13
_5.if.else.0:
  ret i32 4                                                                        ; inst 14
_6.if.exit.0:
  unreachable                                                                      ; inst 15
}

define i32 @another_layer_of_protocol(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %0, 2                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_2.while.cond.0                                                        ; inst 3
_2.while.cond.0:
  %3 = phi i32 [0, %_1.if.then.0], [%7, %_3.while.body.0]                          ; inst 4
  %4 = phi i32 [%1, %_1.if.then.0], [%6, %_3.while.body.0]                         ; inst 5
  %5 = icmp slt i32 %3, 5                                                          ; inst 6
  br i1 %5, label %_3.while.body.0, label %_4.while.exit.0                         ; inst 7
_3.while.body.0:
  %6 = add i32 %4, %3                                                              ; inst 8
  %7 = add i32 %3, 1                                                               ; inst 9
  br label %_2.while.cond.0                                                        ; inst 10
_4.while.exit.0:
  br label %_9.if.exit.0                                                           ; inst 11
_5.if.else.0:
  %8 = icmp eq i32 %0, 3                                                           ; inst 12
  br i1 %8, label %_6.if.then.1, label %_7.if.else.1                               ; inst 13
_6.if.then.1:
  %9 = sub i32 %1, 10                                                              ; inst 14
  br label %_8.if.exit.1                                                           ; inst 15
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 16
_8.if.exit.1:
  %10 = phi i32 [%9, %_6.if.then.1], [%1, %_7.if.else.1]                           ; inst 17
  br label %_9.if.exit.0                                                           ; inst 18
_9.if.exit.0:
  %11 = phi i32 [%4, %_4.while.exit.0], [%10, %_8.if.exit.1]                       ; inst 19
  ret i32 %11                                                                      ; inst 20
}

define i32 @yet_another_protocol_function(i32 %0, i32 %1) {
_0.entry.0:
  %2 = add i32 %0, %1                                                              ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 3
  %4 = phi i32 [%2, %_0.entry.0], [%6, %_2.while.body.0]                           ; inst 4
  %5 = icmp slt i32 %3, 3                                                          ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = call i32 @another_layer_of_protocol(i32 %3, i32 %4)                         ; inst 7
  %7 = add i32 %3, 1                                                               ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  ret i32 %4                                                                       ; inst 10
}

define i32 @process_complex_packet(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @yet_another_protocol_function(i32 %0, i32 %1)                     ; inst 1
  %4 = call i32 @yet_another_protocol_function(i32 %1, i32 %2)                     ; inst 2
  %5 = call i32 @yet_another_protocol_function(i32 %0, i32 %2)                     ; inst 3
  %6 = sub i32 %3, %4                                                              ; inst 4
  %7 = add i32 %6, %5                                                              ; inst 5
  ret i32 %7                                                                       ; inst 6
}

