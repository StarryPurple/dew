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


%Transition = type { i32, i32, i32, i32, i32 }
%FSM = type { i32, i32, [200 x %Transition], i32, [100 x i32], i32, i32, i32, [50 x i32], i32, i32 }
%Task = type { i32, i32, i32, i32, i32, i32, i32 }
%ProtocolParser = type { i32, [1000 x i32], i32, i32, i32, i32, i32 }
%TaskScheduler = type { [100 x %Task], i32, i32, [100 x i32], [100 x i32], i32, i32, i32, i32 }
%NestedFSM = type { %FSM, %FSM, i32, i32, [20 x i32], i32 }

define void @init_fsm(%FSM* sret(%FSM) %0) {
_0.entry.0:
  %1 = alloca %FSM                                                                 ; inst 1
  %2 = getelementptr %FSM, %FSM* %1, i32 0, i32 0                                  ; inst 2
  store i32 0, i32* %2                                                             ; inst 3
  %3 = getelementptr %FSM, %FSM* %1, i32 0, i32 1                                  ; inst 4
  store i32 -1, i32* %3                                                            ; inst 5
  %4 = getelementptr %FSM, %FSM* %1, i32 0, i32 2                                  ; inst 6
  %5 = alloca %Transition                                                          ; inst 7
  %6 = getelementptr %Transition, %Transition* %5, i32 0, i32 0                    ; inst 8
  store i32 0, i32* %6                                                             ; inst 9
  %7 = getelementptr %Transition, %Transition* %5, i32 0, i32 1                    ; inst 10
  store i32 0, i32* %7                                                             ; inst 11
  %8 = getelementptr %Transition, %Transition* %5, i32 0, i32 2                    ; inst 12
  store i32 0, i32* %8                                                             ; inst 13
  %9 = getelementptr %Transition, %Transition* %5, i32 0, i32 3                    ; inst 14
  store i32 0, i32* %9                                                             ; inst 15
  %10 = getelementptr %Transition, %Transition* %5, i32 0, i32 4                   ; inst 16
  store i32 0, i32* %10                                                            ; inst 17
  %11 = getelementptr [200 x %Transition], [200 x %Transition]* %4, i32 0, i32 0   ; inst 18
  br label %_1.array.cond.0                                                        ; inst 19
_1.array.cond.0:
  %12 = phi i32 [0, %_0.entry.0], [%15, %_2.array.body.0]                          ; inst 20
  %13 = icmp slt i32 %12, 200                                                      ; inst 21
  br i1 %13, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 22
_2.array.body.0:
  %14 = getelementptr %Transition, %Transition* %11, i32 %12                       ; inst 23
  call void @memcpy(%Transition* %14, %Transition* %5, i64 20)                     ; inst 24
  %15 = add i32 %12, 1                                                             ; inst 25
  br label %_1.array.cond.0                                                        ; inst 26
_3.array.exit.0:
  %16 = getelementptr %FSM, %FSM* %1, i32 0, i32 3                                 ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = getelementptr %FSM, %FSM* %1, i32 0, i32 4                                 ; inst 29
  %18 = getelementptr [100 x i32], [100 x i32]* %17, i32 0, i32 0                  ; inst 30
  br label %_4.array.cond.1                                                        ; inst 31
_4.array.cond.1:
  %19 = phi i32 [0, %_3.array.exit.0], [%22, %_5.array.body.1]                     ; inst 32
  %20 = icmp slt i32 %19, 100                                                      ; inst 33
  br i1 %20, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 34
_5.array.body.1:
  %21 = getelementptr i32, i32* %18, i32 %19                                       ; inst 35
  store i32 0, i32* %21                                                            ; inst 36
  %22 = add i32 %19, 1                                                             ; inst 37
  br label %_4.array.cond.1                                                        ; inst 38
_6.array.exit.1:
  %23 = getelementptr %FSM, %FSM* %1, i32 0, i32 5                                 ; inst 39
  store i32 0, i32* %23                                                            ; inst 40
  %24 = getelementptr %FSM, %FSM* %1, i32 0, i32 6                                 ; inst 41
  store i32 0, i32* %24                                                            ; inst 42
  %25 = getelementptr %FSM, %FSM* %1, i32 0, i32 7                                 ; inst 43
  store i32 0, i32* %25                                                            ; inst 44
  %26 = getelementptr %FSM, %FSM* %1, i32 0, i32 8                                 ; inst 45
  %27 = getelementptr [50 x i32], [50 x i32]* %26, i32 0, i32 0                    ; inst 46
  br label %_7.array.cond.2                                                        ; inst 47
_7.array.cond.2:
  %28 = phi i32 [0, %_6.array.exit.1], [%31, %_8.array.body.2]                     ; inst 48
  %29 = icmp slt i32 %28, 50                                                       ; inst 49
  br i1 %29, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 50
_8.array.body.2:
  %30 = getelementptr i32, i32* %27, i32 %28                                       ; inst 51
  store i32 0, i32* %30                                                            ; inst 52
  %31 = add i32 %28, 1                                                             ; inst 53
  br label %_7.array.cond.2                                                        ; inst 54
_9.array.exit.2:
  %32 = getelementptr %FSM, %FSM* %1, i32 0, i32 9                                 ; inst 55
  store i32 0, i32* %32                                                            ; inst 56
  %33 = getelementptr %FSM, %FSM* %1, i32 0, i32 10                                ; inst 57
  store i32 0, i32* %33                                                            ; inst 58
  br label %_10.while.cond.0                                                       ; inst 59
_10.while.cond.0:
  %34 = phi i64 [0, %_9.array.exit.2], [%38, %_11.while.body.0]                    ; inst 60
  %35 = icmp ult i64 %34, 50                                                       ; inst 61
  br i1 %35, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 62
_11.while.body.0:
  %36 = getelementptr %FSM, %FSM* %1, i32 0, i32 8                                 ; inst 63
  %37 = getelementptr [50 x i32], [50 x i32]* %36, i32 0, i64 %34                  ; inst 64
  store i32 0, i32* %37                                                            ; inst 65
  %38 = add i64 %34, 1                                                             ; inst 66
  br label %_10.while.cond.0                                                       ; inst 67
_12.while.exit.0:
  %39 = getelementptr %FSM, %FSM* %1, i32 0, i32 8                                 ; inst 68
  %40 = sext i32 0 to i64                                                          ; inst 69
  %41 = getelementptr [50 x i32], [50 x i32]* %39, i32 0, i64 %40                  ; inst 70
  store i32 1, i32* %41                                                            ; inst 71
  call void @memcpy(%FSM* %0, %FSM* %1, i64 4632)                                  ; inst 72
  ret void                                                                         ; inst 73
}

define i1 @add_transition(%FSM* %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5) {
_0.entry.0:
  %6 = getelementptr %FSM, %FSM* %0, i32 0, i32 3                                  ; inst 1
  %7 = load i32, i32* %6                                                           ; inst 2
  %8 = trunc i64 200 to i32                                                        ; inst 3
  %9 = icmp sge i32 %7, %8                                                         ; inst 4
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  ret i1 0                                                                         ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %10 = getelementptr %FSM, %FSM* %0, i32 0, i32 2                                 ; inst 8
  %11 = getelementptr %FSM, %FSM* %0, i32 0, i32 3                                 ; inst 9
  %12 = load i32, i32* %11                                                         ; inst 10
  %13 = sext i32 %12 to i64                                                        ; inst 11
  %14 = getelementptr [200 x %Transition], [200 x %Transition]* %10, i32 0, i64 %13 ; inst 12
  %15 = alloca %Transition                                                         ; inst 13
  %16 = getelementptr %Transition, %Transition* %15, i32 0, i32 0                  ; inst 14
  store i32 %1, i32* %16                                                           ; inst 15
  %17 = getelementptr %Transition, %Transition* %15, i32 0, i32 1                  ; inst 16
  store i32 %2, i32* %17                                                           ; inst 17
  %18 = getelementptr %Transition, %Transition* %15, i32 0, i32 2                  ; inst 18
  store i32 %3, i32* %18                                                           ; inst 19
  %19 = getelementptr %Transition, %Transition* %15, i32 0, i32 3                  ; inst 20
  store i32 %4, i32* %19                                                           ; inst 21
  %20 = getelementptr %Transition, %Transition* %15, i32 0, i32 4                  ; inst 22
  store i32 %5, i32* %20                                                           ; inst 23
  call void @memcpy(%Transition* %14, %Transition* %15, i64 20)                    ; inst 24
  %21 = getelementptr %FSM, %FSM* %0, i32 0, i32 3                                 ; inst 25
  %22 = getelementptr %FSM, %FSM* %0, i32 0, i32 3                                 ; inst 26
  %23 = load i32, i32* %22                                                         ; inst 27
  %24 = add i32 %23, 1                                                             ; inst 28
  store i32 %24, i32* %21                                                          ; inst 29
  ret i1 1                                                                         ; inst 30
}

define i1 @fsm_add_event(%FSM* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %FSM, %FSM* %0, i32 0, i32 7                                  ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = trunc i64 100 to i32                                                        ; inst 3
  %5 = icmp sge i32 %3, %4                                                         ; inst 4
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  ret i1 0                                                                         ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %6 = getelementptr %FSM, %FSM* %0, i32 0, i32 4                                  ; inst 8
  %7 = getelementptr %FSM, %FSM* %0, i32 0, i32 6                                  ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = sext i32 %8 to i64                                                          ; inst 11
  %10 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %9                  ; inst 12
  store i32 %1, i32* %10                                                           ; inst 13
  %11 = getelementptr %FSM, %FSM* %0, i32 0, i32 6                                 ; inst 14
  %12 = getelementptr %FSM, %FSM* %0, i32 0, i32 6                                 ; inst 15
  %13 = load i32, i32* %12                                                         ; inst 16
  %14 = add i32 %13, 1                                                             ; inst 17
  %15 = trunc i64 100 to i32                                                       ; inst 18
  %16 = srem i32 %14, %15                                                          ; inst 19
  store i32 %16, i32* %11                                                          ; inst 20
  %17 = getelementptr %FSM, %FSM* %0, i32 0, i32 7                                 ; inst 21
  %18 = getelementptr %FSM, %FSM* %0, i32 0, i32 7                                 ; inst 22
  %19 = load i32, i32* %18                                                         ; inst 23
  %20 = add i32 %19, 1                                                             ; inst 24
  store i32 %20, i32* %17                                                          ; inst 25
  ret i1 1                                                                         ; inst 26
}

define i32 @fsm_get_event(%FSM* %0) {
_0.entry.0:
  %1 = getelementptr %FSM, %FSM* %0, i32 0, i32 7                                  ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp sle i32 %2, 0                                                          ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 -1                                                                       ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = getelementptr %FSM, %FSM* %0, i32 0, i32 4                                  ; inst 7
  %5 = getelementptr %FSM, %FSM* %0, i32 0, i32 5                                  ; inst 8
  %6 = load i32, i32* %5                                                           ; inst 9
  %7 = sext i32 %6 to i64                                                          ; inst 10
  %8 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %7                   ; inst 11
  %9 = load i32, i32* %8                                                           ; inst 12
  %10 = getelementptr %FSM, %FSM* %0, i32 0, i32 5                                 ; inst 13
  %11 = getelementptr %FSM, %FSM* %0, i32 0, i32 5                                 ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = add i32 %12, 1                                                             ; inst 16
  %14 = trunc i64 100 to i32                                                       ; inst 17
  %15 = srem i32 %13, %14                                                          ; inst 18
  store i32 %15, i32* %10                                                          ; inst 19
  %16 = getelementptr %FSM, %FSM* %0, i32 0, i32 7                                 ; inst 20
  %17 = getelementptr %FSM, %FSM* %0, i32 0, i32 7                                 ; inst 21
  %18 = load i32, i32* %17                                                         ; inst 22
  %19 = sub i32 %18, 1                                                             ; inst 23
  store i32 %19, i32* %16                                                          ; inst 24
  ret i32 %9                                                                       ; inst 25
}

define i1 @evaluate_condition(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i1 1                                                                         ; inst 3
_2.if.else.0:
  %5 = icmp eq i32 %0, 1                                                           ; inst 4
  br i1 %5, label %_3.if.then.1, label %_4.if.else.1                               ; inst 5
_3.if.then.1:
  %6 = icmp eq i32 %1, 1                                                           ; inst 6
  ret i1 %6                                                                        ; inst 7
_4.if.else.1:
  %7 = icmp eq i32 %0, 2                                                           ; inst 8
  br i1 %7, label %_5.if.then.2, label %_9.if.else.2                               ; inst 9
_5.if.then.2:
  %8 = icmp sge i32 %2, 1                                                          ; inst 10
  br i1 %8, label %_6.lazy.then.0, label %_7.lazy.else.0                           ; inst 11
_6.lazy.then.0:
  %9 = icmp sle i32 %2, 2                                                          ; inst 12
  br label %_8.lazy.exit.0                                                         ; inst 13
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 14
_8.lazy.exit.0:
  %10 = phi i1 [%9, %_6.lazy.then.0], [0, %_7.lazy.else.0]                         ; inst 15
  ret i1 %10                                                                       ; inst 16
_9.if.else.2:
  %11 = icmp eq i32 %0, 3                                                          ; inst 17
  br i1 %11, label %_10.if.then.3, label %_14.if.else.3                            ; inst 18
_10.if.then.3:
  %12 = icmp sgt i32 %3, 0                                                         ; inst 19
  br i1 %12, label %_11.lazy.then.1, label %_12.lazy.else.1                        ; inst 20
_11.lazy.then.1:
  %13 = srem i32 %3, 2                                                             ; inst 21
  %14 = icmp eq i32 %13, 0                                                         ; inst 22
  br label %_13.lazy.exit.1                                                        ; inst 23
_12.lazy.else.1:
  br label %_13.lazy.exit.1                                                        ; inst 24
_13.lazy.exit.1:
  %15 = phi i1 [%14, %_11.lazy.then.1], [0, %_12.lazy.else.1]                      ; inst 25
  ret i1 %15                                                                       ; inst 26
_14.if.else.3:
  %16 = icmp eq i32 %0, 4                                                          ; inst 27
  br i1 %16, label %_15.if.then.4, label %_19.if.else.4                            ; inst 28
_15.if.then.4:
  %17 = icmp ne i32 %1, 4                                                          ; inst 29
  br i1 %17, label %_16.lazy.then.2, label %_17.lazy.else.2                        ; inst 30
_16.lazy.then.2:
  %18 = icmp ne i32 %2, 3                                                          ; inst 31
  br label %_18.lazy.exit.2                                                        ; inst 32
_17.lazy.else.2:
  br label %_18.lazy.exit.2                                                        ; inst 33
_18.lazy.exit.2:
  %19 = phi i1 [%18, %_16.lazy.then.2], [0, %_17.lazy.else.2]                      ; inst 34
  ret i1 %19                                                                       ; inst 35
_19.if.else.4:
  %20 = icmp eq i32 %0, 5                                                          ; inst 36
  br i1 %20, label %_20.if.then.5, label %_36.if.else.5                            ; inst 37
_20.if.then.5:
  %21 = icmp eq i32 %1, 2                                                          ; inst 38
  br i1 %21, label %_21.if.then.6, label %_28.if.else.6                            ; inst 39
_21.if.then.6:
  %22 = icmp eq i32 %2, 2                                                          ; inst 40
  br i1 %22, label %_22.if.then.7, label %_23.if.else.7                            ; inst 41
_22.if.then.7:
  %23 = icmp sgt i32 %3, 10                                                        ; inst 42
  ret i1 %23                                                                       ; inst 43
_23.if.else.7:
  %24 = icmp eq i32 %2, 3                                                          ; inst 44
  br i1 %24, label %_24.if.then.8, label %_25.if.else.8                            ; inst 45
_24.if.then.8:
  %25 = icmp slt i32 %3, 5                                                         ; inst 46
  ret i1 %25                                                                       ; inst 47
_25.if.else.8:
  %26 = srem i32 %3, 3                                                             ; inst 48
  %27 = icmp eq i32 %26, 0                                                         ; inst 49
  ret i1 %27                                                                       ; inst 50
_26.if.exit.8:
  br label %_27.if.exit.7                                                          ; inst 51
_27.if.exit.7:
  br label %_35.if.exit.6                                                          ; inst 52
_28.if.else.6:
  %28 = icmp eq i32 %1, 3                                                          ; inst 53
  br i1 %28, label %_29.if.then.9, label %_33.if.else.9                            ; inst 54
_29.if.then.9:
  %29 = icmp eq i32 %2, 4                                                          ; inst 55
  br i1 %29, label %_30.lazy.then.3, label %_31.lazy.else.3                        ; inst 56
_30.lazy.then.3:
  br label %_32.lazy.exit.3                                                        ; inst 57
_31.lazy.else.3:
  %30 = icmp eq i32 %2, 5                                                          ; inst 58
  br label %_32.lazy.exit.3                                                        ; inst 59
_32.lazy.exit.3:
  %31 = phi i1 [1, %_30.lazy.then.3], [%30, %_31.lazy.else.3]                      ; inst 60
  ret i1 %31                                                                       ; inst 61
_33.if.else.9:
  ret i1 0                                                                         ; inst 62
_34.if.exit.9:
  br label %_35.if.exit.6                                                          ; inst 63
_35.if.exit.6:
  br label %_58.if.exit.5                                                          ; inst 64
_36.if.else.5:
  %32 = icmp eq i32 %0, 6                                                          ; inst 65
  br i1 %32, label %_37.if.then.10, label %_56.if.else.10                          ; inst 66
_37.if.then.10:
  %33 = mul i32 %1, 3                                                              ; inst 67
  %34 = add i32 %33, %2                                                            ; inst 68
  %35 = sdiv i32 %3, 2                                                             ; inst 69
  %36 = icmp sgt i32 %34, %35                                                      ; inst 70
  br i1 %36, label %_38.if.then.11, label %_45.if.else.11                          ; inst 71
_38.if.then.11:
  %37 = icmp slt i32 %1, 6                                                         ; inst 72
  br i1 %37, label %_39.if.then.12, label %_40.if.else.12                          ; inst 73
_39.if.then.12:
  %38 = icmp ne i32 %2, 8                                                          ; inst 74
  ret i1 %38                                                                       ; inst 75
_40.if.else.12:
  %39 = icmp eq i32 %2, 7                                                          ; inst 76
  br i1 %39, label %_41.lazy.then.4, label %_42.lazy.else.4                        ; inst 77
_41.lazy.then.4:
  br label %_43.lazy.exit.4                                                        ; inst 78
_42.lazy.else.4:
  %40 = icmp eq i32 %2, 9                                                          ; inst 79
  br label %_43.lazy.exit.4                                                        ; inst 80
_43.lazy.exit.4:
  %41 = phi i1 [1, %_41.lazy.then.4], [%40, %_42.lazy.else.4]                      ; inst 81
  ret i1 %41                                                                       ; inst 82
_44.if.exit.12:
  br label %_55.if.exit.11                                                         ; inst 83
_45.if.else.11:
  %42 = srem i32 %34, 4                                                            ; inst 84
  %43 = icmp eq i32 %42, 0                                                         ; inst 85
  br i1 %43, label %_46.if.then.13, label %_47.if.else.13                          ; inst 86
_46.if.then.13:
  %44 = icmp sgt i32 %3, %34                                                       ; inst 87
  ret i1 %44                                                                       ; inst 88
_47.if.else.13:
  %45 = srem i32 %34, 4                                                            ; inst 89
  %46 = icmp eq i32 %45, 1                                                         ; inst 90
  br i1 %46, label %_48.if.then.14, label %_49.if.else.14                          ; inst 91
_48.if.then.14:
  %47 = icmp slt i32 %3, %34                                                       ; inst 92
  ret i1 %47                                                                       ; inst 93
_49.if.else.14:
  %48 = srem i32 %34, 4                                                            ; inst 94
  %49 = icmp eq i32 %48, 2                                                         ; inst 95
  br i1 %49, label %_50.if.then.15, label %_51.if.else.15                          ; inst 96
_50.if.then.15:
  %50 = icmp eq i32 %3, %34                                                        ; inst 97
  ret i1 %50                                                                       ; inst 98
_51.if.else.15:
  %51 = icmp ne i32 %3, %34                                                        ; inst 99
  ret i1 %51                                                                       ; inst 100
_52.if.exit.15:
  br label %_53.if.exit.14                                                         ; inst 101
_53.if.exit.14:
  br label %_54.if.exit.13                                                         ; inst 102
_54.if.exit.13:
  br label %_55.if.exit.11                                                         ; inst 103
_55.if.exit.11:
  br label %_57.if.exit.10                                                         ; inst 104
_56.if.else.10:
  %52 = add i32 %0, %1                                                             ; inst 105
  %53 = add i32 %52, %2                                                            ; inst 106
  %54 = add i32 %53, %3                                                            ; inst 107
  %55 = srem i32 %54, 7                                                            ; inst 108
  %56 = icmp sgt i32 %55, 3                                                        ; inst 109
  ret i1 %56                                                                       ; inst 110
_57.if.exit.10:
  br label %_58.if.exit.5                                                          ; inst 111
_58.if.exit.5:
  br label %_59.if.exit.4                                                          ; inst 112
_59.if.exit.4:
  br label %_60.if.exit.3                                                          ; inst 113
_60.if.exit.3:
  br label %_61.if.exit.2                                                          ; inst 114
_61.if.exit.2:
  br label %_62.if.exit.1                                                          ; inst 115
_62.if.exit.1:
  br label %_63.if.exit.0                                                          ; inst 116
_63.if.exit.0:
  unreachable                                                                      ; inst 117
}

define i32 @execute_action(i32 %0, %FSM* %1, i32* %2) {
_0.entry.0:
  %3 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  %4 = icmp eq i32 %0, 1                                                           ; inst 4
  br i1 %4, label %_3.if.then.1, label %_4.if.else.1                               ; inst 5
_3.if.then.1:
  %5 = load i32, i32* %2                                                           ; inst 6
  %6 = add i32 %5, 1                                                               ; inst 7
  store i32 %6, i32* %2                                                            ; inst 8
  ret i32 1                                                                        ; inst 9
_4.if.else.1:
  %7 = icmp eq i32 %0, 2                                                           ; inst 10
  br i1 %7, label %_5.if.then.2, label %_6.if.else.2                               ; inst 11
_5.if.then.2:
  %8 = load i32, i32* %2                                                           ; inst 12
  %9 = mul i32 %8, 2                                                               ; inst 13
  store i32 %9, i32* %2                                                            ; inst 14
  ret i32 2                                                                        ; inst 15
_6.if.else.2:
  %10 = icmp eq i32 %0, 3                                                          ; inst 16
  br i1 %10, label %_7.if.then.3, label %_11.if.else.3                             ; inst 17
_7.if.then.3:
  %11 = load i32, i32* %2                                                          ; inst 18
  %12 = sub i32 %11, 1                                                             ; inst 19
  store i32 %12, i32* %2                                                           ; inst 20
  %13 = load i32, i32* %2                                                          ; inst 21
  %14 = icmp slt i32 %13, 0                                                        ; inst 22
  br i1 %14, label %_8.if.then.4, label %_9.if.else.4                              ; inst 23
_8.if.then.4:
  store i32 0, i32* %2                                                             ; inst 24
  br label %_10.if.exit.4                                                          ; inst 25
_9.if.else.4:
  br label %_10.if.exit.4                                                          ; inst 26
_10.if.exit.4:
  ret i32 3                                                                        ; inst 27
_11.if.else.3:
  %15 = icmp eq i32 %0, 4                                                          ; inst 28
  br i1 %15, label %_12.if.then.5, label %_13.if.else.5                            ; inst 29
_12.if.then.5:
  %16 = load i32, i32* %2                                                          ; inst 30
  %17 = mul i32 %16, 3                                                             ; inst 31
  %18 = add i32 %17, 17                                                            ; inst 32
  %19 = srem i32 %18, 100                                                          ; inst 33
  store i32 %19, i32* %2                                                           ; inst 34
  %20 = getelementptr %FSM, %FSM* %1, i32 0, i32 9                                 ; inst 35
  %21 = getelementptr %FSM, %FSM* %1, i32 0, i32 9                                 ; inst 36
  %22 = load i32, i32* %21                                                         ; inst 37
  %23 = add i32 %22, 1                                                             ; inst 38
  store i32 %23, i32* %20                                                          ; inst 39
  ret i32 4                                                                        ; inst 40
_13.if.else.5:
  %24 = icmp eq i32 %0, 5                                                          ; inst 41
  br i1 %24, label %_14.if.then.6, label %_21.if.else.6                            ; inst 42
_14.if.then.6:
  %25 = load i32, i32* %2                                                          ; inst 43
  %26 = icmp sgt i32 %25, 50                                                       ; inst 44
  br i1 %26, label %_15.if.then.7, label %_16.if.else.7                            ; inst 45
_15.if.then.7:
  %27 = load i32, i32* %2                                                          ; inst 46
  %28 = sdiv i32 %27, 2                                                            ; inst 47
  store i32 %28, i32* %2                                                           ; inst 48
  %29 = call i1 @fsm_add_event(%FSM* %1, i32 5)                                    ; inst 49
  br label %_20.if.exit.7                                                          ; inst 50
_16.if.else.7:
  %30 = load i32, i32* %2                                                          ; inst 51
  %31 = icmp sgt i32 %30, 25                                                       ; inst 52
  br i1 %31, label %_17.if.then.8, label %_18.if.else.8                            ; inst 53
_17.if.then.8:
  %32 = load i32, i32* %2                                                          ; inst 54
  %33 = mul i32 %32, 3                                                             ; inst 55
  store i32 %33, i32* %2                                                           ; inst 56
  %34 = call i1 @fsm_add_event(%FSM* %1, i32 1)                                    ; inst 57
  br label %_19.if.exit.8                                                          ; inst 58
_18.if.else.8:
  %35 = load i32, i32* %2                                                          ; inst 59
  %36 = add i32 %35, 10                                                            ; inst 60
  store i32 %36, i32* %2                                                           ; inst 61
  %37 = call i1 @fsm_add_event(%FSM* %1, i32 2)                                    ; inst 62
  br label %_19.if.exit.8                                                          ; inst 63
_19.if.exit.8:
  br label %_20.if.exit.7                                                          ; inst 64
_20.if.exit.7:
  ret i32 5                                                                        ; inst 65
_21.if.else.6:
  %38 = icmp eq i32 %0, 6                                                          ; inst 66
  br i1 %38, label %_22.if.then.9, label %_32.if.else.9                            ; inst 67
_22.if.then.9:
  br label %_23.while.cond.0                                                       ; inst 68
_23.while.cond.0:
  %39 = phi i32 [0, %_22.if.then.9], [%52, %_30.if.exit.11]                        ; inst 69
  %40 = icmp slt i32 %39, 5                                                        ; inst 70
  br i1 %40, label %_24.while.body.0, label %_31.while.exit.0                      ; inst 71
_24.while.body.0:
  %41 = srem i32 %39, 2                                                            ; inst 72
  %42 = icmp eq i32 %41, 0                                                         ; inst 73
  br i1 %42, label %_25.if.then.10, label %_26.if.else.10                          ; inst 74
_25.if.then.10:
  %43 = load i32, i32* %2                                                          ; inst 75
  %44 = add i32 %43, %39                                                           ; inst 76
  store i32 %44, i32* %2                                                           ; inst 77
  br label %_27.if.exit.10                                                         ; inst 78
_26.if.else.10:
  %45 = load i32, i32* %2                                                          ; inst 79
  %46 = sub i32 %45, %39                                                           ; inst 80
  store i32 %46, i32* %2                                                           ; inst 81
  br label %_27.if.exit.10                                                         ; inst 82
_27.if.exit.10:
  %47 = load i32, i32* %2                                                          ; inst 83
  %48 = srem i32 %47, 3                                                            ; inst 84
  %49 = icmp eq i32 %48, 0                                                         ; inst 85
  br i1 %49, label %_28.if.then.11, label %_29.if.else.11                          ; inst 86
_28.if.then.11:
  %50 = add i32 1, %39                                                             ; inst 87
  %51 = call i1 @fsm_add_event(%FSM* %1, i32 %50)                                  ; inst 88
  br label %_30.if.exit.11                                                         ; inst 89
_29.if.else.11:
  br label %_30.if.exit.11                                                         ; inst 90
_30.if.exit.11:
  %52 = add i32 %39, 1                                                             ; inst 91
  br label %_23.while.cond.0                                                       ; inst 92
_31.while.exit.0:
  ret i32 6                                                                        ; inst 93
_32.if.else.9:
  br label %_33.while.cond.1                                                       ; inst 94
_33.while.cond.1:
  %53 = phi i32 [0, %_32.if.else.9], [%63, %_37.if.exit.12]                        ; inst 95
  %54 = phi i32 [%0, %_32.if.else.9], [%62, %_37.if.exit.12]                       ; inst 96
  %55 = srem i32 %0, 10                                                            ; inst 97
  %56 = icmp slt i32 %53, %55                                                      ; inst 98
  br i1 %56, label %_34.while.body.1, label %_38.while.exit.1                      ; inst 99
_34.while.body.1:
  %57 = mul i32 %54, 2                                                             ; inst 100
  %58 = load i32, i32* %2                                                          ; inst 101
  %59 = add i32 %57, %58                                                           ; inst 102
  %60 = icmp sgt i32 %59, 1000                                                     ; inst 103
  br i1 %60, label %_35.if.then.12, label %_36.if.else.12                          ; inst 104
_35.if.then.12:
  %61 = srem i32 %59, 1000                                                         ; inst 105
  br label %_37.if.exit.12                                                         ; inst 106
_36.if.else.12:
  br label %_37.if.exit.12                                                         ; inst 107
_37.if.exit.12:
  %62 = phi i32 [%61, %_35.if.then.12], [%59, %_36.if.else.12]                     ; inst 108
  %63 = add i32 %53, 1                                                             ; inst 109
  br label %_33.while.cond.1                                                       ; inst 110
_38.while.exit.1:
  %64 = srem i32 %54, 100                                                          ; inst 111
  store i32 %64, i32* %2                                                           ; inst 112
  ret i32 %0                                                                       ; inst 113
_39.if.exit.9:
  br label %_40.if.exit.6                                                          ; inst 114
_40.if.exit.6:
  br label %_41.if.exit.5                                                          ; inst 115
_41.if.exit.5:
  br label %_42.if.exit.3                                                          ; inst 116
_42.if.exit.3:
  br label %_43.if.exit.2                                                          ; inst 117
_43.if.exit.2:
  br label %_44.if.exit.1                                                          ; inst 118
_44.if.exit.1:
  br label %_45.if.exit.0                                                          ; inst 119
_45.if.exit.0:
  unreachable                                                                      ; inst 120
}

define i1 @fsm_step(%FSM* %0, i32* %1) {
_0.entry.0:
  %2 = call i32 @fsm_get_event(%FSM* %0)                                           ; inst 1
  %3 = icmp eq i32 %2, -1                                                          ; inst 2
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i1 0                                                                         ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 6
_4.while.cond.0:
  %4 = phi i32 [0, %_3.if.exit.0], [%51, %_14.if.exit.1]                           ; inst 7
  %5 = getelementptr %FSM, %FSM* %0, i32 0, i32 3                                  ; inst 8
  %6 = load i32, i32* %5                                                           ; inst 9
  %7 = icmp slt i32 %4, %6                                                         ; inst 10
  br i1 %7, label %_5.while.body.0, label %_15.while.exit.0                        ; inst 11
_5.while.body.0:
  %8 = getelementptr %FSM, %FSM* %0, i32 0, i32 2                                  ; inst 12
  %9 = sext i32 %4 to i64                                                          ; inst 13
  %10 = getelementptr [200 x %Transition], [200 x %Transition]* %8, i32 0, i64 %9  ; inst 14
  %11 = getelementptr %Transition, %Transition* %10, i32 0, i32 0                  ; inst 15
  %12 = load i32, i32* %11                                                         ; inst 16
  %13 = getelementptr %FSM, %FSM* %0, i32 0, i32 0                                 ; inst 17
  %14 = load i32, i32* %13                                                         ; inst 18
  %15 = icmp eq i32 %12, %14                                                       ; inst 19
  br i1 %15, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 20
_6.lazy.then.0:
  %16 = getelementptr %Transition, %Transition* %10, i32 0, i32 1                  ; inst 21
  %17 = load i32, i32* %16                                                         ; inst 22
  %18 = icmp eq i32 %17, %2                                                        ; inst 23
  br label %_8.lazy.exit.0                                                         ; inst 24
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 25
_8.lazy.exit.0:
  %19 = phi i1 [%18, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 26
  br i1 %19, label %_9.if.then.1, label %_13.if.else.1                             ; inst 27
_9.if.then.1:
  %20 = getelementptr %Transition, %Transition* %10, i32 0, i32 4                  ; inst 28
  %21 = load i32, i32* %20                                                         ; inst 29
  %22 = getelementptr %FSM, %FSM* %0, i32 0, i32 0                                 ; inst 30
  %23 = load i32, i32* %22                                                         ; inst 31
  %24 = load i32, i32* %1                                                          ; inst 32
  %25 = call i1 @evaluate_condition(i32 %21, i32 %23, i32 %2, i32 %24)             ; inst 33
  br i1 %25, label %_10.if.then.2, label %_11.if.else.2                            ; inst 34
_10.if.then.2:
  %26 = getelementptr %FSM, %FSM* %0, i32 0, i32 1                                 ; inst 35
  %27 = getelementptr %FSM, %FSM* %0, i32 0, i32 0                                 ; inst 36
  %28 = load i32, i32* %27                                                         ; inst 37
  store i32 %28, i32* %26                                                          ; inst 38
  %29 = getelementptr %FSM, %FSM* %0, i32 0, i32 0                                 ; inst 39
  %30 = getelementptr %Transition, %Transition* %10, i32 0, i32 2                  ; inst 40
  %31 = load i32, i32* %30                                                         ; inst 41
  store i32 %31, i32* %29                                                          ; inst 42
  %32 = getelementptr %FSM, %FSM* %0, i32 0, i32 8                                 ; inst 43
  %33 = getelementptr %FSM, %FSM* %0, i32 0, i32 0                                 ; inst 44
  %34 = load i32, i32* %33                                                         ; inst 45
  %35 = sext i32 %34 to i64                                                        ; inst 46
  %36 = getelementptr [50 x i32], [50 x i32]* %32, i32 0, i64 %35                  ; inst 47
  %37 = getelementptr %FSM, %FSM* %0, i32 0, i32 8                                 ; inst 48
  %38 = getelementptr %FSM, %FSM* %0, i32 0, i32 0                                 ; inst 49
  %39 = load i32, i32* %38                                                         ; inst 50
  %40 = sext i32 %39 to i64                                                        ; inst 51
  %41 = getelementptr [50 x i32], [50 x i32]* %37, i32 0, i64 %40                  ; inst 52
  %42 = load i32, i32* %41                                                         ; inst 53
  %43 = add i32 %42, 1                                                             ; inst 54
  store i32 %43, i32* %36                                                          ; inst 55
  %44 = getelementptr %FSM, %FSM* %0, i32 0, i32 10                                ; inst 56
  %45 = getelementptr %FSM, %FSM* %0, i32 0, i32 10                                ; inst 57
  %46 = load i32, i32* %45                                                         ; inst 58
  %47 = add i32 %46, 1                                                             ; inst 59
  store i32 %47, i32* %44                                                          ; inst 60
  %48 = getelementptr %Transition, %Transition* %10, i32 0, i32 3                  ; inst 61
  %49 = load i32, i32* %48                                                         ; inst 62
  %50 = call i32 @execute_action(i32 %49, %FSM* %0, i32* %1)                       ; inst 63
  ret i1 1                                                                         ; inst 64
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 65
_12.if.exit.2:
  br label %_14.if.exit.1                                                          ; inst 66
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 67
_14.if.exit.1:
  %51 = add i32 %4, 1                                                              ; inst 68
  br label %_4.while.cond.0                                                        ; inst 69
_15.while.exit.0:
  %52 = getelementptr %FSM, %FSM* %0, i32 0, i32 9                                 ; inst 70
  %53 = getelementptr %FSM, %FSM* %0, i32 0, i32 9                                 ; inst 71
  %54 = load i32, i32* %53                                                         ; inst 72
  %55 = add i32 %54, 1                                                             ; inst 73
  store i32 %55, i32* %52                                                          ; inst 74
  ret i1 0                                                                         ; inst 75
}

define void @init_protocol_parser(%ProtocolParser* sret(%ProtocolParser) %0) {
_0.entry.0:
  %1 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0            ; inst 1
  store i32 0, i32* %1                                                             ; inst 2
  %2 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 1            ; inst 3
  %3 = getelementptr [1000 x i32], [1000 x i32]* %2, i32 0, i32 0                  ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 1000                                                       ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2            ; inst 13
  store i32 0, i32* %8                                                             ; inst 14
  %9 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 3            ; inst 15
  store i32 0, i32* %9                                                             ; inst 16
  %10 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 5           ; inst 19
  store i32 0, i32* %11                                                            ; inst 20
  %12 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 6           ; inst 21
  store i32 1, i32* %12                                                            ; inst 22
  ret void                                                                         ; inst 23
}

define i32 @parse_packet(%ProtocolParser* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0            ; inst 1
  %5 = load i32, i32* %4                                                           ; inst 2
  %6 = icmp eq i32 %5, 0                                                           ; inst 3
  br i1 %6, label %_1.if.then.0, label %_5.if.else.0                               ; inst 4
_1.if.then.0:
  %7 = icmp eq i32 %1, 1                                                           ; inst 5
  br i1 %7, label %_2.if.then.1, label %_3.if.else.1                               ; inst 6
_2.if.then.1:
  %8 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0            ; inst 7
  store i32 1, i32* %8                                                             ; inst 8
  %9 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 6            ; inst 9
  %10 = add i32 %3, 1                                                              ; inst 10
  store i32 %10, i32* %9                                                           ; inst 11
  ret i32 1                                                                        ; inst 12
_3.if.else.1:
  %11 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 13
  %12 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = add i32 %13, 1                                                             ; inst 16
  store i32 %14, i32* %11                                                          ; inst 17
  ret i32 -1                                                                       ; inst 18
_4.if.exit.1:
  br label %_48.if.exit.0                                                          ; inst 19
_5.if.else.0:
  %15 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 20
  %16 = load i32, i32* %15                                                         ; inst 21
  %17 = icmp eq i32 %16, 1                                                         ; inst 22
  br i1 %17, label %_6.if.then.2, label %_16.if.else.2                             ; inst 23
_6.if.then.2:
  %18 = icmp eq i32 %1, 2                                                          ; inst 24
  br i1 %18, label %_7.lazy.then.0, label %_8.lazy.else.0                          ; inst 25
_7.lazy.then.0:
  %19 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 6           ; inst 26
  %20 = load i32, i32* %19                                                         ; inst 27
  %21 = icmp eq i32 %3, %20                                                        ; inst 28
  br label %_9.lazy.exit.0                                                         ; inst 29
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 30
_9.lazy.exit.0:
  %22 = phi i1 [%21, %_7.lazy.then.0], [0, %_8.lazy.else.0]                        ; inst 31
  br i1 %22, label %_10.if.then.3, label %_11.if.else.3                            ; inst 32
_10.if.then.3:
  %23 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 33
  store i32 2, i32* %23                                                            ; inst 34
  %24 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 6           ; inst 35
  %25 = add i32 %3, 1                                                              ; inst 36
  store i32 %25, i32* %24                                                          ; inst 37
  ret i32 2                                                                        ; inst 38
_11.if.else.3:
  %26 = icmp eq i32 %1, 5                                                          ; inst 39
  br i1 %26, label %_12.if.then.4, label %_13.if.else.4                            ; inst 40
_12.if.then.4:
  %27 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 41
  store i32 0, i32* %27                                                            ; inst 42
  ret i32 0                                                                        ; inst 43
_13.if.else.4:
  %28 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 44
  %29 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 45
  %30 = load i32, i32* %29                                                         ; inst 46
  %31 = add i32 %30, 1                                                             ; inst 47
  store i32 %31, i32* %28                                                          ; inst 48
  ret i32 -1                                                                       ; inst 49
_14.if.exit.4:
  br label %_15.if.exit.3                                                          ; inst 50
_15.if.exit.3:
  br label %_47.if.exit.2                                                          ; inst 51
_16.if.else.2:
  %32 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 52
  %33 = load i32, i32* %32                                                         ; inst 53
  %34 = icmp eq i32 %33, 2                                                         ; inst 54
  br i1 %34, label %_17.if.then.5, label %_36.if.else.5                            ; inst 55
_17.if.then.5:
  %35 = icmp eq i32 %1, 3                                                          ; inst 56
  br i1 %35, label %_18.if.then.6, label %_25.if.else.6                            ; inst 57
_18.if.then.6:
  %36 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 6           ; inst 58
  %37 = load i32, i32* %36                                                         ; inst 59
  %38 = icmp eq i32 %3, %37                                                        ; inst 60
  br i1 %38, label %_19.if.then.7, label %_23.if.else.7                            ; inst 61
_19.if.then.7:
  %39 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2           ; inst 62
  %40 = load i32, i32* %39                                                         ; inst 63
  %41 = trunc i64 1000 to i32                                                      ; inst 64
  %42 = icmp slt i32 %40, %41                                                      ; inst 65
  br i1 %42, label %_20.if.then.8, label %_21.if.else.8                            ; inst 66
_20.if.then.8:
  %43 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 1           ; inst 67
  %44 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2           ; inst 68
  %45 = load i32, i32* %44                                                         ; inst 69
  %46 = sext i32 %45 to i64                                                        ; inst 70
  %47 = getelementptr [1000 x i32], [1000 x i32]* %43, i32 0, i64 %46              ; inst 71
  store i32 %2, i32* %47                                                           ; inst 72
  %48 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2           ; inst 73
  %49 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2           ; inst 74
  %50 = load i32, i32* %49                                                         ; inst 75
  %51 = add i32 %50, 1                                                             ; inst 76
  store i32 %51, i32* %48                                                          ; inst 77
  br label %_22.if.exit.8                                                          ; inst 78
_21.if.else.8:
  br label %_22.if.exit.8                                                          ; inst 79
_22.if.exit.8:
  %52 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 6           ; inst 80
  %53 = add i32 %3, 1                                                              ; inst 81
  store i32 %53, i32* %52                                                          ; inst 82
  %54 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 3           ; inst 83
  %55 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 3           ; inst 84
  %56 = load i32, i32* %55                                                         ; inst 85
  %57 = add i32 %56, 1                                                             ; inst 86
  store i32 %57, i32* %54                                                          ; inst 87
  ret i32 3                                                                        ; inst 88
_23.if.else.7:
  %58 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 89
  %59 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 90
  %60 = load i32, i32* %59                                                         ; inst 91
  %61 = add i32 %60, 1                                                             ; inst 92
  store i32 %61, i32* %58                                                          ; inst 93
  ret i32 4                                                                        ; inst 94
_24.if.exit.7:
  br label %_35.if.exit.6                                                          ; inst 95
_25.if.else.6:
  %62 = icmp eq i32 %1, 4                                                          ; inst 96
  br i1 %62, label %_26.if.then.9, label %_27.if.else.9                            ; inst 97
_26.if.then.9:
  %63 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 98
  store i32 3, i32* %63                                                            ; inst 99
  ret i32 5                                                                        ; inst 100
_27.if.else.9:
  %64 = icmp eq i32 %1, 6                                                          ; inst 101
  br i1 %64, label %_28.if.then.10, label %_29.if.else.10                          ; inst 102
_28.if.then.10:
  ret i32 6                                                                        ; inst 103
_29.if.else.10:
  %65 = icmp eq i32 %1, 5                                                          ; inst 104
  br i1 %65, label %_30.if.then.11, label %_31.if.else.11                          ; inst 105
_30.if.then.11:
  %66 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 106
  store i32 0, i32* %66                                                            ; inst 107
  %67 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2           ; inst 108
  store i32 0, i32* %67                                                            ; inst 109
  ret i32 0                                                                        ; inst 110
_31.if.else.11:
  %68 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 111
  %69 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 112
  %70 = load i32, i32* %69                                                         ; inst 113
  %71 = add i32 %70, 1                                                             ; inst 114
  store i32 %71, i32* %68                                                          ; inst 115
  ret i32 -1                                                                       ; inst 116
_32.if.exit.11:
  br label %_33.if.exit.10                                                         ; inst 117
_33.if.exit.10:
  br label %_34.if.exit.9                                                          ; inst 118
_34.if.exit.9:
  br label %_35.if.exit.6                                                          ; inst 119
_35.if.exit.6:
  br label %_46.if.exit.5                                                          ; inst 120
_36.if.else.5:
  %72 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 121
  %73 = load i32, i32* %72                                                         ; inst 122
  %74 = icmp eq i32 %73, 3                                                         ; inst 123
  br i1 %74, label %_37.if.then.12, label %_44.if.else.12                          ; inst 124
_37.if.then.12:
  %75 = icmp eq i32 %1, 2                                                          ; inst 125
  br i1 %75, label %_38.if.then.13, label %_39.if.else.13                          ; inst 126
_38.if.then.13:
  %76 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 127
  store i32 0, i32* %76                                                            ; inst 128
  %77 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2           ; inst 129
  store i32 0, i32* %77                                                            ; inst 130
  ret i32 7                                                                        ; inst 131
_39.if.else.13:
  %78 = icmp eq i32 %1, 5                                                          ; inst 132
  br i1 %78, label %_40.if.then.14, label %_41.if.else.14                          ; inst 133
_40.if.then.14:
  %79 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 134
  store i32 0, i32* %79                                                            ; inst 135
  %80 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 2           ; inst 136
  store i32 0, i32* %80                                                            ; inst 137
  ret i32 0                                                                        ; inst 138
_41.if.else.14:
  %81 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 139
  %82 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 140
  %83 = load i32, i32* %82                                                         ; inst 141
  %84 = add i32 %83, 1                                                             ; inst 142
  store i32 %84, i32* %81                                                          ; inst 143
  ret i32 -1                                                                       ; inst 144
_42.if.exit.14:
  br label %_43.if.exit.13                                                         ; inst 145
_43.if.exit.13:
  br label %_45.if.exit.12                                                         ; inst 146
_44.if.else.12:
  %85 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 147
  %86 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 4           ; inst 148
  %87 = load i32, i32* %86                                                         ; inst 149
  %88 = add i32 %87, 1                                                             ; inst 150
  store i32 %88, i32* %85                                                          ; inst 151
  %89 = getelementptr %ProtocolParser, %ProtocolParser* %0, i32 0, i32 0           ; inst 152
  store i32 0, i32* %89                                                            ; inst 153
  ret i32 -1                                                                       ; inst 154
_45.if.exit.12:
  br label %_46.if.exit.5                                                          ; inst 155
_46.if.exit.5:
  br label %_47.if.exit.2                                                          ; inst 156
_47.if.exit.2:
  br label %_48.if.exit.0                                                          ; inst 157
_48.if.exit.0:
  unreachable                                                                      ; inst 158
}

define void @init_task_scheduler(%TaskScheduler* sret(%TaskScheduler) %0) {
_0.entry.0:
  %1 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0              ; inst 1
  %2 = alloca %Task                                                                ; inst 2
  %3 = getelementptr %Task, %Task* %2, i32 0, i32 0                                ; inst 3
  store i32 0, i32* %3                                                             ; inst 4
  %4 = getelementptr %Task, %Task* %2, i32 0, i32 1                                ; inst 5
  store i32 0, i32* %4                                                             ; inst 6
  %5 = getelementptr %Task, %Task* %2, i32 0, i32 2                                ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = getelementptr %Task, %Task* %2, i32 0, i32 3                                ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = getelementptr %Task, %Task* %2, i32 0, i32 4                                ; inst 11
  store i32 0, i32* %7                                                             ; inst 12
  %8 = getelementptr %Task, %Task* %2, i32 0, i32 5                                ; inst 13
  store i32 -1, i32* %8                                                            ; inst 14
  %9 = getelementptr %Task, %Task* %2, i32 0, i32 6                                ; inst 15
  store i32 0, i32* %9                                                             ; inst 16
  %10 = getelementptr [100 x %Task], [100 x %Task]* %1, i32 0, i32 0               ; inst 17
  br label %_1.array.cond.0                                                        ; inst 18
_1.array.cond.0:
  %11 = phi i32 [0, %_0.entry.0], [%14, %_2.array.body.0]                          ; inst 19
  %12 = icmp slt i32 %11, 100                                                      ; inst 20
  br i1 %12, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 21
_2.array.body.0:
  %13 = getelementptr %Task, %Task* %10, i32 %11                                   ; inst 22
  call void @memcpy(%Task* %13, %Task* %2, i64 28)                                 ; inst 23
  %14 = add i32 %11, 1                                                             ; inst 24
  br label %_1.array.cond.0                                                        ; inst 25
_3.array.exit.0:
  %15 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 1             ; inst 26
  store i32 0, i32* %15                                                            ; inst 27
  %16 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2             ; inst 28
  store i32 -1, i32* %16                                                           ; inst 29
  %17 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3             ; inst 30
  %18 = getelementptr [100 x i32], [100 x i32]* %17, i32 0, i32 0                  ; inst 31
  br label %_4.array.cond.1                                                        ; inst 32
_4.array.cond.1:
  %19 = phi i32 [0, %_3.array.exit.0], [%22, %_5.array.body.1]                     ; inst 33
  %20 = icmp slt i32 %19, 100                                                      ; inst 34
  br i1 %20, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 35
_5.array.body.1:
  %21 = getelementptr i32, i32* %18, i32 %19                                       ; inst 36
  store i32 -1, i32* %21                                                           ; inst 37
  %22 = add i32 %19, 1                                                             ; inst 38
  br label %_4.array.cond.1                                                        ; inst 39
_6.array.exit.1:
  %23 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 4             ; inst 40
  %24 = getelementptr [100 x i32], [100 x i32]* %23, i32 0, i32 0                  ; inst 41
  br label %_7.array.cond.2                                                        ; inst 42
_7.array.cond.2:
  %25 = phi i32 [0, %_6.array.exit.1], [%28, %_8.array.body.2]                     ; inst 43
  %26 = icmp slt i32 %25, 100                                                      ; inst 44
  br i1 %26, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 45
_8.array.body.2:
  %27 = getelementptr i32, i32* %24, i32 %25                                       ; inst 46
  store i32 -1, i32* %27                                                           ; inst 47
  %28 = add i32 %25, 1                                                             ; inst 48
  br label %_7.array.cond.2                                                        ; inst 49
_9.array.exit.2:
  %29 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5             ; inst 50
  store i32 0, i32* %29                                                            ; inst 51
  %30 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 6             ; inst 52
  store i32 0, i32* %30                                                            ; inst 53
  %31 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 7             ; inst 54
  store i32 10, i32* %31                                                           ; inst 55
  %32 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 8             ; inst 56
  store i32 0, i32* %32                                                            ; inst 57
  ret void                                                                         ; inst 58
}

define i32 @add_task(%TaskScheduler* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 1              ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  %5 = trunc i64 100 to i32                                                        ; inst 3
  %6 = icmp sge i32 %4, %5                                                         ; inst 4
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  ret i32 -1                                                                       ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %7 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 1              ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0              ; inst 10
  %10 = sext i32 %8 to i64                                                         ; inst 11
  %11 = getelementptr [100 x %Task], [100 x %Task]* %9, i32 0, i64 %10             ; inst 12
  %12 = alloca %Task                                                               ; inst 13
  %13 = getelementptr %Task, %Task* %12, i32 0, i32 0                              ; inst 14
  store i32 %8, i32* %13                                                           ; inst 15
  %14 = getelementptr %Task, %Task* %12, i32 0, i32 1                              ; inst 16
  store i32 %1, i32* %14                                                           ; inst 17
  %15 = getelementptr %Task, %Task* %12, i32 0, i32 2                              ; inst 18
  store i32 0, i32* %15                                                            ; inst 19
  %16 = getelementptr %Task, %Task* %12, i32 0, i32 3                              ; inst 20
  store i32 %2, i32* %16                                                           ; inst 21
  %17 = getelementptr %Task, %Task* %12, i32 0, i32 4                              ; inst 22
  store i32 -1, i32* %17                                                           ; inst 23
  %18 = getelementptr %Task, %Task* %12, i32 0, i32 5                              ; inst 24
  store i32 -1, i32* %18                                                           ; inst 25
  %19 = getelementptr %Task, %Task* %12, i32 0, i32 6                              ; inst 26
  store i32 0, i32* %19                                                            ; inst 27
  call void @memcpy(%Task* %11, %Task* %12, i64 28)                                ; inst 28
  br label %_4.while.cond.0                                                        ; inst 29
_4.while.cond.0:
  %20 = phi i32 [0, %_3.if.exit.0], [%34, %_8.if.exit.1]                           ; inst 30
  %21 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5             ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  %23 = icmp slt i32 %20, %22                                                      ; inst 33
  br i1 %23, label %_5.while.body.0, label %_13.critical_edge.0                    ; inst 34
_5.while.body.0:
  %24 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3             ; inst 35
  %25 = sext i32 %20 to i64                                                        ; inst 36
  %26 = getelementptr [100 x i32], [100 x i32]* %24, i32 0, i64 %25                ; inst 37
  %27 = load i32, i32* %26                                                         ; inst 38
  %28 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 39
  %29 = sext i32 %27 to i64                                                        ; inst 40
  %30 = getelementptr [100 x %Task], [100 x %Task]* %28, i32 0, i64 %29            ; inst 41
  %31 = getelementptr %Task, %Task* %30, i32 0, i32 1                              ; inst 42
  %32 = load i32, i32* %31                                                         ; inst 43
  %33 = icmp slt i32 %32, %1                                                       ; inst 44
  br i1 %33, label %_6.if.then.1, label %_7.if.else.1                              ; inst 45
_6.if.then.1:
  br label %_9.while.exit.0                                                        ; inst 46
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 47
_8.if.exit.1:
  %34 = add i32 %20, 1                                                             ; inst 48
  br label %_4.while.cond.0                                                        ; inst 49
_9.while.exit.0:
  %35 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5             ; inst 50
  %36 = load i32, i32* %35                                                         ; inst 51
  br label %_10.while.cond.1                                                       ; inst 52
_10.while.cond.1:
  %37 = phi i32 [%36, %_9.while.exit.0], [%47, %_11.while.body.1]                  ; inst 53
  %38 = icmp sgt i32 %37, %20                                                      ; inst 54
  br i1 %38, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 55
_11.while.body.1:
  %39 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3             ; inst 56
  %40 = sext i32 %37 to i64                                                        ; inst 57
  %41 = getelementptr [100 x i32], [100 x i32]* %39, i32 0, i64 %40                ; inst 58
  %42 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3             ; inst 59
  %43 = sext i32 %37 to i64                                                        ; inst 60
  %44 = sub i64 %43, 1                                                             ; inst 61
  %45 = getelementptr [100 x i32], [100 x i32]* %42, i32 0, i64 %44                ; inst 62
  %46 = load i32, i32* %45                                                         ; inst 63
  store i32 %46, i32* %41                                                          ; inst 64
  %47 = sub i32 %37, 1                                                             ; inst 65
  br label %_10.while.cond.1                                                       ; inst 66
_12.while.exit.1:
  %48 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3             ; inst 67
  %49 = sext i32 %20 to i64                                                        ; inst 68
  %50 = getelementptr [100 x i32], [100 x i32]* %48, i32 0, i64 %49                ; inst 69
  store i32 %8, i32* %50                                                           ; inst 70
  %51 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5             ; inst 71
  %52 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5             ; inst 72
  %53 = load i32, i32* %52                                                         ; inst 73
  %54 = add i32 %53, 1                                                             ; inst 74
  store i32 %54, i32* %51                                                          ; inst 75
  %55 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 1             ; inst 76
  %56 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 1             ; inst 77
  %57 = load i32, i32* %56                                                         ; inst 78
  %58 = add i32 %57, 1                                                             ; inst 79
  store i32 %58, i32* %55                                                          ; inst 80
  ret i32 %8                                                                       ; inst 81
_13.critical_edge.0:
  br label %_9.while.exit.0                                                        ; inst 82
}

define i32 @schedule_next_task(%TaskScheduler* %0) {
_0.entry.0:
  %1 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 8              ; inst 1
  %2 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 8              ; inst 2
  %3 = load i32, i32* %2                                                           ; inst 3
  %4 = add i32 %3, 1                                                               ; inst 4
  store i32 %4, i32* %1                                                            ; inst 5
  %5 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2              ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp ne i32 %6, -1                                                          ; inst 8
  br i1 %7, label %_1.if.then.0, label %_32.if.else.0                              ; inst 9
_1.if.then.0:
  %8 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2              ; inst 10
  %9 = load i32, i32* %8                                                           ; inst 11
  %10 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 12
  %11 = sext i32 %9 to i64                                                         ; inst 13
  %12 = getelementptr [100 x %Task], [100 x %Task]* %10, i32 0, i64 %11            ; inst 14
  %13 = getelementptr %Task, %Task* %12, i32 0, i32 3                              ; inst 15
  %14 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 16
  %15 = sext i32 %9 to i64                                                         ; inst 17
  %16 = getelementptr [100 x %Task], [100 x %Task]* %14, i32 0, i64 %15            ; inst 18
  %17 = getelementptr %Task, %Task* %16, i32 0, i32 3                              ; inst 19
  %18 = load i32, i32* %17                                                         ; inst 20
  %19 = sub i32 %18, 1                                                             ; inst 21
  store i32 %19, i32* %13                                                          ; inst 22
  %20 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 23
  %21 = sext i32 %9 to i64                                                         ; inst 24
  %22 = getelementptr [100 x %Task], [100 x %Task]* %20, i32 0, i64 %21            ; inst 25
  %23 = getelementptr %Task, %Task* %22, i32 0, i32 6                              ; inst 26
  %24 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 27
  %25 = sext i32 %9 to i64                                                         ; inst 28
  %26 = getelementptr [100 x %Task], [100 x %Task]* %24, i32 0, i64 %25            ; inst 29
  %27 = getelementptr %Task, %Task* %26, i32 0, i32 6                              ; inst 30
  %28 = load i32, i32* %27                                                         ; inst 31
  %29 = add i32 %28, 1                                                             ; inst 32
  store i32 %29, i32* %23                                                          ; inst 33
  %30 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 34
  %31 = sext i32 %9 to i64                                                         ; inst 35
  %32 = getelementptr [100 x %Task], [100 x %Task]* %30, i32 0, i64 %31            ; inst 36
  %33 = getelementptr %Task, %Task* %32, i32 0, i32 3                              ; inst 37
  %34 = load i32, i32* %33                                                         ; inst 38
  %35 = icmp sle i32 %34, 0                                                        ; inst 39
  br i1 %35, label %_2.if.then.1, label %_3.if.else.1                              ; inst 40
_2.if.then.1:
  %36 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 41
  %37 = sext i32 %9 to i64                                                         ; inst 42
  %38 = getelementptr [100 x %Task], [100 x %Task]* %36, i32 0, i64 %37            ; inst 43
  %39 = getelementptr %Task, %Task* %38, i32 0, i32 2                              ; inst 44
  store i32 2, i32* %39                                                            ; inst 45
  %40 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2             ; inst 46
  store i32 -1, i32* %40                                                           ; inst 47
  br label %_31.if.exit.1                                                          ; inst 48
_3.if.else.1:
  %41 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5             ; inst 49
  %42 = load i32, i32* %41                                                         ; inst 50
  %43 = icmp sgt i32 %42, 0                                                        ; inst 51
  br i1 %43, label %_4.if.then.2, label %_17.if.else.2                             ; inst 52
_4.if.then.2:
  %44 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3             ; inst 53
  %45 = getelementptr [100 x i32], [100 x i32]* %44, i32 0, i64 0                  ; inst 54
  %46 = load i32, i32* %45                                                         ; inst 55
  %47 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 56
  %48 = sext i32 %9 to i64                                                         ; inst 57
  %49 = getelementptr [100 x %Task], [100 x %Task]* %47, i32 0, i64 %48            ; inst 58
  %50 = getelementptr %Task, %Task* %49, i32 0, i32 1                              ; inst 59
  %51 = load i32, i32* %50                                                         ; inst 60
  %52 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 61
  %53 = sext i32 %46 to i64                                                        ; inst 62
  %54 = getelementptr [100 x %Task], [100 x %Task]* %52, i32 0, i64 %53            ; inst 63
  %55 = getelementptr %Task, %Task* %54, i32 0, i32 1                              ; inst 64
  %56 = load i32, i32* %55                                                         ; inst 65
  %57 = icmp sgt i32 %56, %51                                                      ; inst 66
  br i1 %57, label %_5.if.then.3, label %_6.if.else.3                              ; inst 67
_5.if.then.3:
  br label %_16.if.exit.3                                                          ; inst 68
_6.if.else.3:
  %58 = icmp eq i32 %56, %51                                                       ; inst 69
  br i1 %58, label %_7.if.then.4, label %_11.if.else.4                             ; inst 70
_7.if.then.4:
  %59 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 71
  %60 = sext i32 %9 to i64                                                         ; inst 72
  %61 = getelementptr [100 x %Task], [100 x %Task]* %59, i32 0, i64 %60            ; inst 73
  %62 = getelementptr %Task, %Task* %61, i32 0, i32 6                              ; inst 74
  %63 = load i32, i32* %62                                                         ; inst 75
  %64 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 7             ; inst 76
  %65 = load i32, i32* %64                                                         ; inst 77
  %66 = srem i32 %63, %65                                                          ; inst 78
  %67 = icmp eq i32 %66, 0                                                         ; inst 79
  br i1 %67, label %_8.if.then.5, label %_9.if.else.5                              ; inst 80
_8.if.then.5:
  br label %_10.if.exit.5                                                          ; inst 81
_9.if.else.5:
  br label %_10.if.exit.5                                                          ; inst 82
_10.if.exit.5:
  %68 = phi i1 [1, %_8.if.then.5], [0, %_9.if.else.5]                              ; inst 83
  br label %_15.if.exit.4                                                          ; inst 84
_11.if.else.4:
  %69 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 8             ; inst 85
  %70 = load i32, i32* %69                                                         ; inst 86
  %71 = srem i32 %70, 50                                                           ; inst 87
  %72 = icmp eq i32 %71, 0                                                         ; inst 88
  br i1 %72, label %_12.if.then.6, label %_13.if.else.6                            ; inst 89
_12.if.then.6:
  br label %_14.if.exit.6                                                          ; inst 90
_13.if.else.6:
  br label %_14.if.exit.6                                                          ; inst 91
_14.if.exit.6:
  %73 = phi i1 [1, %_12.if.then.6], [0, %_13.if.else.6]                            ; inst 92
  br label %_15.if.exit.4                                                          ; inst 93
_15.if.exit.4:
  %74 = phi i1 [%68, %_10.if.exit.5], [%73, %_14.if.exit.6]                        ; inst 94
  br label %_16.if.exit.3                                                          ; inst 95
_16.if.exit.3:
  %75 = phi i1 [1, %_5.if.then.3], [%74, %_15.if.exit.4]                           ; inst 96
  br label %_18.if.exit.2                                                          ; inst 97
_17.if.else.2:
  br label %_18.if.exit.2                                                          ; inst 98
_18.if.exit.2:
  %76 = phi i1 [%75, %_16.if.exit.3], [0, %_17.if.else.2]                          ; inst 99
  br i1 %76, label %_19.if.then.7, label %_29.if.else.7                            ; inst 100
_19.if.then.7:
  %77 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 101
  %78 = sext i32 %9 to i64                                                         ; inst 102
  %79 = getelementptr [100 x %Task], [100 x %Task]* %77, i32 0, i64 %78            ; inst 103
  %80 = getelementptr %Task, %Task* %79, i32 0, i32 2                              ; inst 104
  store i32 0, i32* %80                                                            ; inst 105
  br label %_20.while.cond.0                                                       ; inst 106
_20.while.cond.0:
  %81 = phi i32 [0, %_19.if.then.7], [%100, %_24.if.exit.8]                        ; inst 107
  %82 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5             ; inst 108
  %83 = load i32, i32* %82                                                         ; inst 109
  %84 = icmp slt i32 %81, %83                                                      ; inst 110
  br i1 %84, label %_21.while.body.0, label %_43.critical_edge.0                   ; inst 111
_21.while.body.0:
  %85 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3             ; inst 112
  %86 = sext i32 %81 to i64                                                        ; inst 113
  %87 = getelementptr [100 x i32], [100 x i32]* %85, i32 0, i64 %86                ; inst 114
  %88 = load i32, i32* %87                                                         ; inst 115
  %89 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 116
  %90 = sext i32 %88 to i64                                                        ; inst 117
  %91 = getelementptr [100 x %Task], [100 x %Task]* %89, i32 0, i64 %90            ; inst 118
  %92 = getelementptr %Task, %Task* %91, i32 0, i32 1                              ; inst 119
  %93 = load i32, i32* %92                                                         ; inst 120
  %94 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0             ; inst 121
  %95 = sext i32 %9 to i64                                                         ; inst 122
  %96 = getelementptr [100 x %Task], [100 x %Task]* %94, i32 0, i64 %95            ; inst 123
  %97 = getelementptr %Task, %Task* %96, i32 0, i32 1                              ; inst 124
  %98 = load i32, i32* %97                                                         ; inst 125
  %99 = icmp slt i32 %93, %98                                                      ; inst 126
  br i1 %99, label %_22.if.then.8, label %_23.if.else.8                            ; inst 127
_22.if.then.8:
  br label %_25.while.exit.0                                                       ; inst 128
_23.if.else.8:
  br label %_24.if.exit.8                                                          ; inst 129
_24.if.exit.8:
  %100 = add i32 %81, 1                                                            ; inst 130
  br label %_20.while.cond.0                                                       ; inst 131
_25.while.exit.0:
  %101 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5            ; inst 132
  %102 = load i32, i32* %101                                                       ; inst 133
  br label %_26.while.cond.1                                                       ; inst 134
_26.while.cond.1:
  %103 = phi i32 [%102, %_25.while.exit.0], [%113, %_27.while.body.1]              ; inst 135
  %104 = icmp sgt i32 %103, %81                                                    ; inst 136
  br i1 %104, label %_27.while.body.1, label %_28.while.exit.1                     ; inst 137
_27.while.body.1:
  %105 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3            ; inst 138
  %106 = sext i32 %103 to i64                                                      ; inst 139
  %107 = getelementptr [100 x i32], [100 x i32]* %105, i32 0, i64 %106             ; inst 140
  %108 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3            ; inst 141
  %109 = sext i32 %103 to i64                                                      ; inst 142
  %110 = sub i64 %109, 1                                                           ; inst 143
  %111 = getelementptr [100 x i32], [100 x i32]* %108, i32 0, i64 %110             ; inst 144
  %112 = load i32, i32* %111                                                       ; inst 145
  store i32 %112, i32* %107                                                        ; inst 146
  %113 = sub i32 %103, 1                                                           ; inst 147
  br label %_26.while.cond.1                                                       ; inst 148
_28.while.exit.1:
  %114 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3            ; inst 149
  %115 = sext i32 %81 to i64                                                       ; inst 150
  %116 = getelementptr [100 x i32], [100 x i32]* %114, i32 0, i64 %115             ; inst 151
  store i32 %9, i32* %116                                                          ; inst 152
  %117 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5            ; inst 153
  %118 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5            ; inst 154
  %119 = load i32, i32* %118                                                       ; inst 155
  %120 = add i32 %119, 1                                                           ; inst 156
  store i32 %120, i32* %117                                                        ; inst 157
  %121 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2            ; inst 158
  store i32 -1, i32* %121                                                          ; inst 159
  br label %_30.if.exit.7                                                          ; inst 160
_29.if.else.7:
  br label %_30.if.exit.7                                                          ; inst 161
_30.if.exit.7:
  br label %_31.if.exit.1                                                          ; inst 162
_31.if.exit.1:
  br label %_33.if.exit.0                                                          ; inst 163
_32.if.else.0:
  br label %_33.if.exit.0                                                          ; inst 164
_33.if.exit.0:
  %122 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2            ; inst 165
  %123 = load i32, i32* %122                                                       ; inst 166
  %124 = icmp eq i32 %123, -1                                                      ; inst 167
  br i1 %124, label %_34.lazy.then.0, label %_35.lazy.else.0                       ; inst 168
_34.lazy.then.0:
  %125 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5            ; inst 169
  %126 = load i32, i32* %125                                                       ; inst 170
  %127 = icmp sgt i32 %126, 0                                                      ; inst 171
  br label %_36.lazy.exit.0                                                        ; inst 172
_35.lazy.else.0:
  br label %_36.lazy.exit.0                                                        ; inst 173
_36.lazy.exit.0:
  %128 = phi i1 [%127, %_34.lazy.then.0], [0, %_35.lazy.else.0]                    ; inst 174
  br i1 %128, label %_37.if.then.9, label %_41.if.else.9                           ; inst 175
_37.if.then.9:
  %129 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2            ; inst 176
  %130 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3            ; inst 177
  %131 = getelementptr [100 x i32], [100 x i32]* %130, i32 0, i64 0                ; inst 178
  %132 = load i32, i32* %131                                                       ; inst 179
  store i32 %132, i32* %129                                                        ; inst 180
  %133 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 0            ; inst 181
  %134 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2            ; inst 182
  %135 = load i32, i32* %134                                                       ; inst 183
  %136 = sext i32 %135 to i64                                                      ; inst 184
  %137 = getelementptr [100 x %Task], [100 x %Task]* %133, i32 0, i64 %136         ; inst 185
  %138 = getelementptr %Task, %Task* %137, i32 0, i32 2                            ; inst 186
  store i32 1, i32* %138                                                           ; inst 187
  br label %_38.while.cond.2                                                       ; inst 188
_38.while.cond.2:
  %139 = phi i32 [0, %_37.if.then.9], [%152, %_39.while.body.2]                    ; inst 189
  %140 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5            ; inst 190
  %141 = load i32, i32* %140                                                       ; inst 191
  %142 = sub i32 %141, 1                                                           ; inst 192
  %143 = icmp slt i32 %139, %142                                                   ; inst 193
  br i1 %143, label %_39.while.body.2, label %_40.while.exit.2                     ; inst 194
_39.while.body.2:
  %144 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3            ; inst 195
  %145 = sext i32 %139 to i64                                                      ; inst 196
  %146 = getelementptr [100 x i32], [100 x i32]* %144, i32 0, i64 %145             ; inst 197
  %147 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 3            ; inst 198
  %148 = sext i32 %139 to i64                                                      ; inst 199
  %149 = add i64 %148, 1                                                           ; inst 200
  %150 = getelementptr [100 x i32], [100 x i32]* %147, i32 0, i64 %149             ; inst 201
  %151 = load i32, i32* %150                                                       ; inst 202
  store i32 %151, i32* %146                                                        ; inst 203
  %152 = add i32 %139, 1                                                           ; inst 204
  br label %_38.while.cond.2                                                       ; inst 205
_40.while.exit.2:
  %153 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5            ; inst 206
  %154 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 5            ; inst 207
  %155 = load i32, i32* %154                                                       ; inst 208
  %156 = sub i32 %155, 1                                                           ; inst 209
  store i32 %156, i32* %153                                                        ; inst 210
  br label %_42.if.exit.9                                                          ; inst 211
_41.if.else.9:
  br label %_42.if.exit.9                                                          ; inst 212
_42.if.exit.9:
  %157 = getelementptr %TaskScheduler, %TaskScheduler* %0, i32 0, i32 2            ; inst 213
  %158 = load i32, i32* %157                                                       ; inst 214
  ret i32 %158                                                                     ; inst 215
_43.critical_edge.0:
  br label %_25.while.exit.0                                                       ; inst 216
}

define i32 @complex_nested_control_flow(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = srem i32 %0, 7                                                              ; inst 5
  %4 = icmp eq i32 %3, 0                                                           ; inst 6
  br i1 %4, label %_4.if.then.1, label %_59.if.else.1                              ; inst 7
_4.if.then.1:
  %5 = icmp sgt i32 %1, 100                                                        ; inst 8
  br i1 %5, label %_5.if.then.2, label %_42.if.else.2                              ; inst 9
_5.if.then.2:
  %6 = srem i32 %1, 3                                                              ; inst 10
  %7 = icmp eq i32 %6, 0                                                           ; inst 11
  br i1 %7, label %_6.if.then.3, label %_22.if.else.3                              ; inst 12
_6.if.then.3:
  br label %_7.while.cond.0                                                        ; inst 13
_7.while.cond.0:
  %8 = phi i32 [%1, %_6.if.then.3], [%25, %_20.if.exit.4]                          ; inst 14
  %9 = phi i32 [0, %_6.if.then.3], [%26, %_20.if.exit.4]                           ; inst 15
  %10 = icmp slt i32 %9, %0                                                        ; inst 16
  br i1 %10, label %_8.while.body.0, label %_21.while.exit.0                       ; inst 17
_8.while.body.0:
  %11 = srem i32 %9, 2                                                             ; inst 18
  %12 = icmp eq i32 %11, 0                                                         ; inst 19
  br i1 %12, label %_9.if.then.4, label %_16.if.else.4                             ; inst 20
_9.if.then.4:
  %13 = mul i32 %9, 2                                                              ; inst 21
  %14 = add i32 %8, %13                                                            ; inst 22
  %15 = icmp sgt i32 %14, 1000                                                     ; inst 23
  br i1 %15, label %_10.if.then.5, label %_14.if.else.5                            ; inst 24
_10.if.then.5:
  %16 = srem i32 %14, 1000                                                         ; inst 25
  %17 = icmp slt i32 %16, 100                                                      ; inst 26
  br i1 %17, label %_11.if.then.6, label %_12.if.else.6                            ; inst 27
_11.if.then.6:
  %18 = add i32 %16, 50                                                            ; inst 28
  br label %_13.if.exit.6                                                          ; inst 29
_12.if.else.6:
  br label %_13.if.exit.6                                                          ; inst 30
_13.if.exit.6:
  %19 = phi i32 [%18, %_11.if.then.6], [%16, %_12.if.else.6]                       ; inst 31
  br label %_15.if.exit.5                                                          ; inst 32
_14.if.else.5:
  br label %_15.if.exit.5                                                          ; inst 33
_15.if.exit.5:
  %20 = phi i32 [%19, %_13.if.exit.6], [%14, %_14.if.else.5]                       ; inst 34
  br label %_20.if.exit.4                                                          ; inst 35
_16.if.else.4:
  %21 = sub i32 %8, %9                                                             ; inst 36
  %22 = icmp slt i32 %21, 0                                                        ; inst 37
  br i1 %22, label %_17.if.then.7, label %_18.if.else.7                            ; inst 38
_17.if.then.7:
  %23 = sub i32 0, %21                                                             ; inst 39
  br label %_19.if.exit.7                                                          ; inst 40
_18.if.else.7:
  br label %_19.if.exit.7                                                          ; inst 41
_19.if.exit.7:
  %24 = phi i32 [%23, %_17.if.then.7], [%21, %_18.if.else.7]                       ; inst 42
  br label %_20.if.exit.4                                                          ; inst 43
_20.if.exit.4:
  %25 = phi i32 [%20, %_15.if.exit.5], [%24, %_19.if.exit.7]                       ; inst 44
  %26 = add i32 %9, 1                                                              ; inst 45
  br label %_7.while.cond.0                                                        ; inst 46
_21.while.exit.0:
  br label %_41.if.exit.3                                                          ; inst 47
_22.if.else.3:
  %27 = srem i32 %1, 3                                                             ; inst 48
  %28 = icmp eq i32 %27, 1                                                         ; inst 49
  br i1 %28, label %_23.if.then.8, label %_39.if.else.8                            ; inst 50
_23.if.then.8:
  br label %_24.while.cond.1                                                       ; inst 51
_24.while.cond.1:
  %29 = phi i32 [%1, %_23.if.then.8], [%44, %_37.if.exit.12]                       ; inst 52
  %30 = phi i32 [%0, %_23.if.then.8], [%46, %_37.if.exit.12]                       ; inst 53
  %31 = icmp sgt i32 %30, 0                                                        ; inst 54
  br i1 %31, label %_25.while.body.1, label %_67.critical_edge.0                   ; inst 55
_25.while.body.1:
  %32 = srem i32 %30, 4                                                            ; inst 56
  %33 = icmp eq i32 %32, 0                                                         ; inst 57
  br i1 %33, label %_26.if.then.9, label %_27.if.else.9                            ; inst 58
_26.if.then.9:
  %34 = mul i32 %29, 2                                                             ; inst 59
  br label %_34.if.exit.9                                                          ; inst 60
_27.if.else.9:
  %35 = srem i32 %30, 4                                                            ; inst 61
  %36 = icmp eq i32 %35, 1                                                         ; inst 62
  br i1 %36, label %_28.if.then.10, label %_29.if.else.10                          ; inst 63
_28.if.then.10:
  %37 = add i32 %29, %30                                                           ; inst 64
  br label %_33.if.exit.10                                                         ; inst 65
_29.if.else.10:
  %38 = srem i32 %30, 4                                                            ; inst 66
  %39 = icmp eq i32 %38, 2                                                         ; inst 67
  br i1 %39, label %_30.if.then.11, label %_31.if.else.11                          ; inst 68
_30.if.then.11:
  %40 = sub i32 %29, %30                                                           ; inst 69
  br label %_32.if.exit.11                                                         ; inst 70
_31.if.else.11:
  %41 = sdiv i32 %29, 2                                                            ; inst 71
  br label %_32.if.exit.11                                                         ; inst 72
_32.if.exit.11:
  %42 = phi i32 [%40, %_30.if.then.11], [%41, %_31.if.else.11]                     ; inst 73
  br label %_33.if.exit.10                                                         ; inst 74
_33.if.exit.10:
  %43 = phi i32 [%37, %_28.if.then.10], [%42, %_32.if.exit.11]                     ; inst 75
  br label %_34.if.exit.9                                                          ; inst 76
_34.if.exit.9:
  %44 = phi i32 [%34, %_26.if.then.9], [%43, %_33.if.exit.10]                      ; inst 77
  %45 = icmp sgt i32 %44, 500                                                      ; inst 78
  br i1 %45, label %_35.if.then.12, label %_36.if.else.12                          ; inst 79
_35.if.then.12:
  br label %_38.while.exit.1                                                       ; inst 80
_36.if.else.12:
  br label %_37.if.exit.12                                                         ; inst 81
_37.if.exit.12:
  %46 = sub i32 %30, 1                                                             ; inst 82
  br label %_24.while.cond.1                                                       ; inst 83
_38.while.exit.1:
  %47 = phi i32 [%29, %_67.critical_edge.0], [%44, %_35.if.then.12]                ; inst 84
  br label %_40.if.exit.8                                                          ; inst 85
_39.if.else.8:
  %48 = sub i32 %0, 1                                                              ; inst 86
  %49 = sdiv i32 %1, 2                                                             ; inst 87
  %50 = call i32 @complex_nested_control_flow(i32 %48, i32 %49)                    ; inst 88
  br label %_40.if.exit.8                                                          ; inst 89
_40.if.exit.8:
  %51 = phi i32 [%47, %_38.while.exit.1], [%50, %_39.if.else.8]                    ; inst 90
  br label %_41.if.exit.3                                                          ; inst 91
_41.if.exit.3:
  %52 = phi i32 [%8, %_21.while.exit.0], [%51, %_40.if.exit.8]                     ; inst 92
  br label %_58.if.exit.2                                                          ; inst 93
_42.if.else.2:
  %53 = icmp sgt i32 %1, 50                                                        ; inst 94
  br i1 %53, label %_43.if.then.13, label %_56.if.else.13                          ; inst 95
_43.if.then.13:
  br label %_44.while.cond.2                                                       ; inst 96
_44.while.cond.2:
  %54 = phi i32 [%1, %_43.if.then.13], [%71, %_54.if.exit.14]                      ; inst 97
  %55 = phi i32 [0, %_43.if.then.13], [%72, %_54.if.exit.14]                       ; inst 98
  %56 = icmp slt i32 %55, 10                                                       ; inst 99
  br i1 %56, label %_45.while.body.2, label %_55.while.exit.2                      ; inst 100
_45.while.body.2:
  %57 = srem i32 %55, 3                                                            ; inst 101
  %58 = icmp eq i32 %57, 0                                                         ; inst 102
  br i1 %58, label %_46.if.then.14, label %_47.if.else.14                          ; inst 103
_46.if.then.14:
  %59 = mul i32 %55, %0                                                            ; inst 104
  %60 = add i32 %54, %59                                                           ; inst 105
  br label %_54.if.exit.14                                                         ; inst 106
_47.if.else.14:
  %61 = srem i32 %55, 3                                                            ; inst 107
  %62 = icmp eq i32 %61, 1                                                         ; inst 108
  br i1 %62, label %_48.if.then.15, label %_49.if.else.15                          ; inst 109
_48.if.then.15:
  %63 = mul i32 %55, %0                                                            ; inst 110
  %64 = sub i32 %54, %63                                                           ; inst 111
  br label %_53.if.exit.15                                                         ; inst 112
_49.if.else.15:
  %65 = add i32 %55, 1                                                             ; inst 113
  %66 = mul i32 %54, %65                                                           ; inst 114
  %67 = icmp sgt i32 %66, 800                                                      ; inst 115
  br i1 %67, label %_50.if.then.16, label %_51.if.else.16                          ; inst 116
_50.if.then.16:
  %68 = srem i32 %66, 800                                                          ; inst 117
  br label %_52.if.exit.16                                                         ; inst 118
_51.if.else.16:
  br label %_52.if.exit.16                                                         ; inst 119
_52.if.exit.16:
  %69 = phi i32 [%68, %_50.if.then.16], [%66, %_51.if.else.16]                     ; inst 120
  br label %_53.if.exit.15                                                         ; inst 121
_53.if.exit.15:
  %70 = phi i32 [%64, %_48.if.then.15], [%69, %_52.if.exit.16]                     ; inst 122
  br label %_54.if.exit.14                                                         ; inst 123
_54.if.exit.14:
  %71 = phi i32 [%60, %_46.if.then.14], [%70, %_53.if.exit.15]                     ; inst 124
  %72 = add i32 %55, 1                                                             ; inst 125
  br label %_44.while.cond.2                                                       ; inst 126
_55.while.exit.2:
  br label %_57.if.exit.13                                                         ; inst 127
_56.if.else.13:
  %73 = sub i32 %0, 2                                                              ; inst 128
  %74 = add i32 %1, %0                                                             ; inst 129
  %75 = call i32 @complex_nested_control_flow(i32 %73, i32 %74)                    ; inst 130
  br label %_57.if.exit.13                                                         ; inst 131
_57.if.exit.13:
  %76 = phi i32 [%54, %_55.while.exit.2], [%75, %_56.if.else.13]                   ; inst 132
  br label %_58.if.exit.2                                                          ; inst 133
_58.if.exit.2:
  %77 = phi i32 [%52, %_41.if.exit.3], [%76, %_57.if.exit.13]                      ; inst 134
  br label %_66.if.exit.1                                                          ; inst 135
_59.if.else.1:
  %78 = srem i32 %0, 7                                                             ; inst 136
  %79 = icmp eq i32 %78, 1                                                         ; inst 137
  br i1 %79, label %_60.if.then.17, label %_64.if.else.17                          ; inst 138
_60.if.then.17:
  %80 = mul i32 %0, 10                                                             ; inst 139
  %81 = icmp sgt i32 %1, %80                                                       ; inst 140
  br i1 %81, label %_61.if.then.18, label %_62.if.else.18                          ; inst 141
_61.if.then.18:
  %82 = sub i32 %0, 1                                                              ; inst 142
  %83 = sub i32 %1, %0                                                             ; inst 143
  %84 = call i32 @complex_nested_control_flow(i32 %82, i32 %83)                    ; inst 144
  br label %_63.if.exit.18                                                         ; inst 145
_62.if.else.18:
  %85 = sub i32 %0, 1                                                              ; inst 146
  %86 = add i32 %1, %0                                                             ; inst 147
  %87 = call i32 @complex_nested_control_flow(i32 %85, i32 %86)                    ; inst 148
  br label %_63.if.exit.18                                                         ; inst 149
_63.if.exit.18:
  %88 = phi i32 [%84, %_61.if.then.18], [%87, %_62.if.else.18]                     ; inst 150
  br label %_65.if.exit.17                                                         ; inst 151
_64.if.else.17:
  %89 = sub i32 %0, 1                                                              ; inst 152
  %90 = mul i32 %1, 2                                                              ; inst 153
  %91 = add i32 %90, %0                                                            ; inst 154
  %92 = call i32 @complex_nested_control_flow(i32 %89, i32 %91)                    ; inst 155
  br label %_65.if.exit.17                                                         ; inst 156
_65.if.exit.17:
  %93 = phi i32 [%88, %_63.if.exit.18], [%92, %_64.if.else.17]                     ; inst 157
  br label %_66.if.exit.1                                                          ; inst 158
_66.if.exit.1:
  %94 = phi i32 [%77, %_58.if.exit.2], [%93, %_65.if.exit.17]                      ; inst 159
  %95 = srem i32 %94, 10000                                                        ; inst 160
  ret i32 %95                                                                      ; inst 161
_67.critical_edge.0:
  br label %_38.while.exit.1                                                       ; inst 162
}

define void @test_complex_control_flow() {
_0.entry.0:
  call void @printlnInt(i32 20001)                                                 ; inst 1
  %0 = alloca %FSM                                                                 ; inst 2
  call void @init_fsm(%FSM* %0)                                                    ; inst 3
  %1 = alloca i32                                                                  ; inst 4
  store i32 42, i32* %1                                                            ; inst 5
  %2 = call i1 @add_transition(%FSM* %0, i32 0, i32 0, i32 1, i32 1, i32 0)        ; inst 6
  %3 = call i1 @add_transition(%FSM* %0, i32 1, i32 1, i32 2, i32 2, i32 1)        ; inst 7
  %4 = call i1 @add_transition(%FSM* %0, i32 2, i32 2, i32 1, i32 3, i32 5)        ; inst 8
  %5 = call i1 @add_transition(%FSM* %0, i32 2, i32 3, i32 4, i32 4, i32 4)        ; inst 9
  %6 = call i1 @add_transition(%FSM* %0, i32 4, i32 5, i32 1, i32 5, i32 6)        ; inst 10
  %7 = call i1 @add_transition(%FSM* %0, i32 1, i32 6, i32 6, i32 6, i32 2)        ; inst 11
  %8 = call i1 @add_transition(%FSM* %0, i32 6, i32 7, i32 1, i32 1, i32 3)        ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%15, %_2.while.body.0]                           ; inst 14
  %10 = icmp slt i32 %9, 100                                                       ; inst 15
  br i1 %10, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 16
_2.while.body.0:
  %11 = mul i32 %9, 7                                                              ; inst 17
  %12 = add i32 %11, 3                                                             ; inst 18
  %13 = srem i32 %12, 10                                                           ; inst 19
  %14 = call i1 @fsm_add_event(%FSM* %0, i32 %13)                                  ; inst 20
  %15 = add i32 %9, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 23
_4.while.cond.1:
  %16 = phi i32 [0, %_3.while.exit.0], [%21, %_8.if.exit.0]                        ; inst 24
  %17 = icmp slt i32 %16, 150                                                      ; inst 25
  br i1 %17, label %_5.while.body.1, label %_9.while.exit.1                        ; inst 26
_5.while.body.1:
  %18 = call i1 @fsm_step(%FSM* %0, i32* %1)                                       ; inst 27
  %19 = icmp eq i1 %18, 0                                                          ; inst 28
  br i1 %19, label %_6.if.then.0, label %_7.if.else.0                              ; inst 29
_6.if.then.0:
  %20 = call i1 @fsm_add_event(%FSM* %0, i32 1)                                    ; inst 30
  br label %_8.if.exit.0                                                           ; inst 31
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 32
_8.if.exit.0:
  %21 = add i32 %16, 1                                                             ; inst 33
  br label %_4.while.cond.1                                                        ; inst 34
_9.while.exit.1:
  %22 = getelementptr %FSM, %FSM* %0, i32 0, i32 10                                ; inst 35
  %23 = load i32, i32* %22                                                         ; inst 36
  call void @printlnInt(i32 %23)                                                   ; inst 37
  %24 = getelementptr %FSM, %FSM* %0, i32 0, i32 9                                 ; inst 38
  %25 = load i32, i32* %24                                                         ; inst 39
  call void @printlnInt(i32 %25)                                                   ; inst 40
  %26 = load i32, i32* %1                                                          ; inst 41
  call void @printlnInt(i32 %26)                                                   ; inst 42
  %27 = alloca %ProtocolParser                                                     ; inst 43
  call void @init_protocol_parser(%ProtocolParser* %27)                            ; inst 44
  br label %_10.while.cond.2                                                       ; inst 45
_10.while.cond.2:
  %28 = phi i32 [0, %_9.while.exit.1], [%39, %_26.if.exit.3]                       ; inst 46
  %29 = phi i32 [0, %_9.while.exit.1], [%55, %_26.if.exit.3]                       ; inst 47
  %30 = icmp slt i32 %29, 200                                                      ; inst 48
  br i1 %30, label %_11.while.body.2, label %_27.while.exit.2                      ; inst 49
_11.while.body.2:
  %31 = srem i32 %29, 7                                                            ; inst 50
  %32 = add i32 %31, 1                                                             ; inst 51
  %33 = mul i32 %29, 13                                                            ; inst 52
  %34 = add i32 %33, 7                                                             ; inst 53
  %35 = add i32 %29, 1                                                             ; inst 54
  %36 = call i32 @parse_packet(%ProtocolParser* %27, i32 %32, i32 %34, i32 %35)    ; inst 55
  %37 = icmp sgt i32 %36, 0                                                        ; inst 56
  br i1 %37, label %_12.if.then.1, label %_13.if.else.1                            ; inst 57
_12.if.then.1:
  %38 = add i32 %28, 1                                                             ; inst 58
  br label %_14.if.exit.1                                                          ; inst 59
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 60
_14.if.exit.1:
  %39 = phi i32 [%38, %_12.if.then.1], [%28, %_13.if.else.1]                       ; inst 61
  %40 = getelementptr %ProtocolParser, %ProtocolParser* %27, i32 0, i32 0          ; inst 62
  %41 = load i32, i32* %40                                                         ; inst 63
  %42 = icmp eq i32 %41, 2                                                         ; inst 64
  br i1 %42, label %_15.lazy.then.0, label %_16.lazy.else.0                        ; inst 65
_15.lazy.then.0:
  %43 = srem i32 %29, 10                                                           ; inst 66
  %44 = icmp eq i32 %43, 0                                                         ; inst 67
  br label %_17.lazy.exit.0                                                        ; inst 68
_16.lazy.else.0:
  br label %_17.lazy.exit.0                                                        ; inst 69
_17.lazy.exit.0:
  %45 = phi i1 [%44, %_15.lazy.then.0], [0, %_16.lazy.else.0]                      ; inst 70
  br i1 %45, label %_18.if.then.2, label %_19.if.else.2                            ; inst 71
_18.if.then.2:
  %46 = add i32 %35, 1                                                             ; inst 72
  %47 = call i32 @parse_packet(%ProtocolParser* %27, i32 6, i32 0, i32 %46)        ; inst 73
  br label %_20.if.exit.2                                                          ; inst 74
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 75
_20.if.exit.2:
  %48 = getelementptr %ProtocolParser, %ProtocolParser* %27, i32 0, i32 4          ; inst 76
  %49 = load i32, i32* %48                                                         ; inst 77
  %50 = icmp sgt i32 %49, 5                                                        ; inst 78
  br i1 %50, label %_21.lazy.then.1, label %_22.lazy.else.1                        ; inst 79
_21.lazy.then.1:
  %51 = srem i32 %29, 15                                                           ; inst 80
  %52 = icmp eq i32 %51, 0                                                         ; inst 81
  br label %_23.lazy.exit.1                                                        ; inst 82
_22.lazy.else.1:
  br label %_23.lazy.exit.1                                                        ; inst 83
_23.lazy.exit.1:
  %53 = phi i1 [%52, %_21.lazy.then.1], [0, %_22.lazy.else.1]                      ; inst 84
  br i1 %53, label %_24.if.then.3, label %_25.if.else.3                            ; inst 85
_24.if.then.3:
  %54 = call i32 @parse_packet(%ProtocolParser* %27, i32 5, i32 0, i32 0)          ; inst 86
  br label %_26.if.exit.3                                                          ; inst 87
_25.if.else.3:
  br label %_26.if.exit.3                                                          ; inst 88
_26.if.exit.3:
  %55 = add i32 %29, 1                                                             ; inst 89
  br label %_10.while.cond.2                                                       ; inst 90
_27.while.exit.2:
  %56 = getelementptr %ProtocolParser, %ProtocolParser* %27, i32 0, i32 3          ; inst 91
  %57 = load i32, i32* %56                                                         ; inst 92
  call void @printlnInt(i32 %57)                                                   ; inst 93
  %58 = getelementptr %ProtocolParser, %ProtocolParser* %27, i32 0, i32 4          ; inst 94
  %59 = load i32, i32* %58                                                         ; inst 95
  call void @printlnInt(i32 %59)                                                   ; inst 96
  call void @printlnInt(i32 %28)                                                   ; inst 97
  %60 = alloca %TaskScheduler                                                      ; inst 98
  call void @init_task_scheduler(%TaskScheduler* %60)                              ; inst 99
  br label %_28.while.cond.3                                                       ; inst 100
_28.while.cond.3:
  %61 = phi i32 [0, %_27.while.exit.2], [%70, %_29.while.body.3]                   ; inst 101
  %62 = icmp slt i32 %61, 50                                                       ; inst 102
  br i1 %62, label %_29.while.body.3, label %_30.while.exit.3                      ; inst 103
_29.while.body.3:
  %63 = srem i32 %61, 4                                                            ; inst 104
  %64 = add i32 %63, 1                                                             ; inst 105
  %65 = mul i32 %61, 3                                                             ; inst 106
  %66 = add i32 %65, 5                                                             ; inst 107
  %67 = srem i32 %66, 20                                                           ; inst 108
  %68 = add i32 %67, 1                                                             ; inst 109
  %69 = call i32 @add_task(%TaskScheduler* %60, i32 %64, i32 %68)                  ; inst 110
  %70 = add i32 %61, 1                                                             ; inst 111
  br label %_28.while.cond.3                                                       ; inst 112
_30.while.exit.3:
  br label %_31.while.cond.4                                                       ; inst 113
_31.while.cond.4:
  %71 = phi i32 [0, %_30.while.exit.3], [%92, %_41.if.exit.5]                      ; inst 114
  %72 = phi i32 [0, %_30.while.exit.3], [%77, %_41.if.exit.5]                      ; inst 115
  %73 = icmp slt i32 %71, 1000                                                     ; inst 116
  br i1 %73, label %_32.while.body.4, label %_42.while.exit.4                      ; inst 117
_32.while.body.4:
  %74 = call i32 @schedule_next_task(%TaskScheduler* %60)                          ; inst 118
  %75 = icmp ne i32 %74, -1                                                        ; inst 119
  br i1 %75, label %_33.if.then.4, label %_34.if.else.4                            ; inst 120
_33.if.then.4:
  %76 = add i32 %72, 1                                                             ; inst 121
  br label %_35.if.exit.4                                                          ; inst 122
_34.if.else.4:
  br label %_35.if.exit.4                                                          ; inst 123
_35.if.exit.4:
  %77 = phi i32 [%76, %_33.if.then.4], [%72, %_34.if.else.4]                       ; inst 124
  %78 = srem i32 %71, 50                                                           ; inst 125
  %79 = icmp eq i32 %78, 0                                                         ; inst 126
  br i1 %79, label %_36.lazy.then.2, label %_37.lazy.else.2                        ; inst 127
_36.lazy.then.2:
  %80 = getelementptr %TaskScheduler, %TaskScheduler* %60, i32 0, i32 1            ; inst 128
  %81 = load i32, i32* %80                                                         ; inst 129
  %82 = trunc i64 100 to i32                                                       ; inst 130
  %83 = icmp slt i32 %81, %82                                                      ; inst 131
  br label %_38.lazy.exit.2                                                        ; inst 132
_37.lazy.else.2:
  br label %_38.lazy.exit.2                                                        ; inst 133
_38.lazy.exit.2:
  %84 = phi i1 [%83, %_36.lazy.then.2], [0, %_37.lazy.else.2]                      ; inst 134
  br i1 %84, label %_39.if.then.5, label %_40.if.else.5                            ; inst 135
_39.if.then.5:
  %85 = sdiv i32 %71, 50                                                           ; inst 136
  %86 = srem i32 %85, 4                                                            ; inst 137
  %87 = add i32 %86, 1                                                             ; inst 138
  %88 = sdiv i32 %71, 10                                                           ; inst 139
  %89 = srem i32 %88, 15                                                           ; inst 140
  %90 = add i32 %89, 1                                                             ; inst 141
  %91 = call i32 @add_task(%TaskScheduler* %60, i32 %87, i32 %90)                  ; inst 142
  br label %_41.if.exit.5                                                          ; inst 143
_40.if.else.5:
  br label %_41.if.exit.5                                                          ; inst 144
_41.if.exit.5:
  %92 = add i32 %71, 1                                                             ; inst 145
  br label %_31.while.cond.4                                                       ; inst 146
_42.while.exit.4:
  call void @printlnInt(i32 %72)                                                   ; inst 147
  %93 = getelementptr %TaskScheduler, %TaskScheduler* %60, i32 0, i32 1            ; inst 148
  %94 = load i32, i32* %93                                                         ; inst 149
  call void @printlnInt(i32 %94)                                                   ; inst 150
  br label %_43.while.cond.5                                                       ; inst 151
_43.while.cond.5:
  %95 = phi i32 [1, %_42.while.exit.4], [%102, %_44.while.body.5]                  ; inst 152
  %96 = phi i32 [0, %_42.while.exit.4], [%101, %_44.while.body.5]                  ; inst 153
  %97 = icmp sle i32 %95, 20                                                       ; inst 154
  br i1 %97, label %_44.while.body.5, label %_45.while.exit.5                      ; inst 155
_44.while.body.5:
  %98 = mul i32 %95, 17                                                            ; inst 156
  %99 = add i32 %98, 3                                                             ; inst 157
  %100 = call i32 @complex_nested_control_flow(i32 %95, i32 %99)                   ; inst 158
  %101 = add i32 %96, %100                                                         ; inst 159
  %102 = add i32 %95, 1                                                            ; inst 160
  br label %_43.while.cond.5                                                       ; inst 161
_45.while.exit.5:
  %103 = srem i32 %96, 100000                                                      ; inst 162
  call void @printlnInt(i32 %103)                                                  ; inst 163
  %104 = alloca %FSM                                                               ; inst 164
  call void @init_fsm(%FSM* %104)                                                  ; inst 165
  %105 = alloca i32                                                                ; inst 166
  store i32 17, i32* %105                                                          ; inst 167
  %106 = call i1 @add_transition(%FSM* %104, i32 0, i32 0, i32 2, i32 2, i32 0)    ; inst 168
  %107 = call i1 @add_transition(%FSM* %104, i32 2, i32 1, i32 3, i32 4, i32 2)    ; inst 169
  %108 = call i1 @add_transition(%FSM* %104, i32 3, i32 4, i32 4, i32 6, i32 1)    ; inst 170
  %109 = call i1 @add_transition(%FSM* %104, i32 4, i32 9, i32 0, i32 1, i32 0)    ; inst 171
  br label %_46.while.cond.6                                                       ; inst 172
_46.while.cond.6:
  %110 = phi i32 [0, %_45.while.exit.5], [%140, %_65.if.exit.9]                    ; inst 173
  %111 = icmp slt i32 %110, 100                                                    ; inst 174
  br i1 %111, label %_47.while.body.6, label %_66.while.exit.6                     ; inst 175
_47.while.body.6:
  %112 = call i1 @fsm_step(%FSM* %0, i32* %1)                                      ; inst 176
  %113 = icmp eq i1 %112, 0                                                        ; inst 177
  br i1 %113, label %_48.if.then.6, label %_49.if.else.6                           ; inst 178
_48.if.then.6:
  %114 = srem i32 %110, 5                                                          ; inst 179
  %115 = call i1 @fsm_add_event(%FSM* %0, i32 %114)                                ; inst 180
  br label %_50.if.exit.6                                                          ; inst 181
_49.if.else.6:
  br label %_50.if.exit.6                                                          ; inst 182
_50.if.exit.6:
  %116 = call i1 @fsm_step(%FSM* %104, i32* %105)                                  ; inst 183
  %117 = icmp eq i1 %116, 0                                                        ; inst 184
  br i1 %117, label %_51.if.then.7, label %_52.if.else.7                           ; inst 185
_51.if.then.7:
  %118 = srem i32 %110, 3                                                          ; inst 186
  %119 = call i1 @fsm_add_event(%FSM* %104, i32 %118)                              ; inst 187
  br label %_53.if.exit.7                                                          ; inst 188
_52.if.else.7:
  br label %_53.if.exit.7                                                          ; inst 189
_53.if.exit.7:
  %120 = getelementptr %FSM, %FSM* %0, i32 0, i32 0                                ; inst 190
  %121 = load i32, i32* %120                                                       ; inst 191
  %122 = icmp eq i32 %121, 2                                                       ; inst 192
  br i1 %122, label %_54.lazy.then.3, label %_55.lazy.else.3                       ; inst 193
_54.lazy.then.3:
  %123 = getelementptr %FSM, %FSM* %104, i32 0, i32 0                              ; inst 194
  %124 = load i32, i32* %123                                                       ; inst 195
  %125 = icmp eq i32 %124, 3                                                       ; inst 196
  br label %_56.lazy.exit.3                                                        ; inst 197
_55.lazy.else.3:
  br label %_56.lazy.exit.3                                                        ; inst 198
_56.lazy.exit.3:
  %126 = phi i1 [%125, %_54.lazy.then.3], [0, %_55.lazy.else.3]                    ; inst 199
  br i1 %126, label %_57.if.then.8, label %_58.if.else.8                           ; inst 200
_57.if.then.8:
  %127 = call i1 @fsm_add_event(%FSM* %104, i32 2)                                 ; inst 201
  %128 = call i1 @fsm_add_event(%FSM* %0, i32 6)                                   ; inst 202
  br label %_59.if.exit.8                                                          ; inst 203
_58.if.else.8:
  br label %_59.if.exit.8                                                          ; inst 204
_59.if.exit.8:
  %129 = load i32, i32* %1                                                         ; inst 205
  %130 = icmp sgt i32 %129, 80                                                     ; inst 206
  br i1 %130, label %_60.lazy.then.4, label %_61.lazy.else.4                       ; inst 207
_60.lazy.then.4:
  %131 = load i32, i32* %105                                                       ; inst 208
  %132 = icmp slt i32 %131, 20                                                     ; inst 209
  br label %_62.lazy.exit.4                                                        ; inst 210
_61.lazy.else.4:
  br label %_62.lazy.exit.4                                                        ; inst 211
_62.lazy.exit.4:
  %133 = phi i1 [%132, %_60.lazy.then.4], [0, %_61.lazy.else.4]                    ; inst 212
  br i1 %133, label %_63.if.then.9, label %_64.if.else.9                           ; inst 213
_63.if.then.9:
  %134 = load i32, i32* %105                                                       ; inst 214
  %135 = load i32, i32* %1                                                         ; inst 215
  %136 = sdiv i32 %135, 4                                                          ; inst 216
  %137 = add i32 %134, %136                                                        ; inst 217
  store i32 %137, i32* %105                                                        ; inst 218
  %138 = load i32, i32* %1                                                         ; inst 219
  %139 = sub i32 %138, 10                                                          ; inst 220
  store i32 %139, i32* %1                                                          ; inst 221
  br label %_65.if.exit.9                                                          ; inst 222
_64.if.else.9:
  br label %_65.if.exit.9                                                          ; inst 223
_65.if.exit.9:
  %140 = add i32 %110, 1                                                           ; inst 224
  br label %_46.while.cond.6                                                       ; inst 225
_66.while.exit.6:
  %141 = getelementptr %FSM, %FSM* %104, i32 0, i32 10                             ; inst 226
  %142 = load i32, i32* %141                                                       ; inst 227
  call void @printlnInt(i32 %142)                                                  ; inst 228
  %143 = load i32, i32* %105                                                       ; inst 229
  call void @printlnInt(i32 %143)                                                  ; inst 230
  call void @printlnInt(i32 20999)                                                 ; inst 231
  ret void                                                                         ; inst 232
}

define void @main() {
_0.entry.0:
  call void @test_complex_control_flow()                                           ; inst 1
  call void @exit(i32 0)                                                           ; inst 2
  ret void                                                                         ; inst 3
}

