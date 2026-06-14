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
  call void @printlnInt(i32 2000)                                                  ; inst 1
  call void @performComplexControlFlowTest()                                       ; inst 2
  call void @performGraphAlgorithms()                                              ; inst 3
  call void @performDynamicProgramming()                                           ; inst 4
  call void @performStateMachineSimulation()                                       ; inst 5
  call void @performSearchAlgorithms()                                             ; inst 6
  call void @printlnInt(i32 2999)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @performComplexControlFlowTest() {
_0.entry.0:
  call void @printlnInt(i32 2001)                                                  ; inst 1
  %0 = call i32 @complexNestedLoops(i32 100)                                       ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @multipleBranchingPatterns(i32 1000)                               ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @earlyExitPatterns(i32 500)                                        ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @simulateSwitchBehavior(i32 200)                                   ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 2002)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @complexNestedLoops(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%53, %_41.if.exit.10]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%44, %_41.if.exit.10]                            ; inst 3
  %3 = icmp slt i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_43.critical_edge.0                     ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%36, %_31.if.exit.7]                        ; inst 7
  %5 = phi i32 [0, %_2.while.body.0], [%42, %_31.if.exit.7]                        ; inst 8
  %6 = phi i32 [%2, %_2.while.body.0], [%37, %_31.if.exit.7]                       ; inst 9
  %7 = icmp slt i32 %5, %0                                                         ; inst 10
  br i1 %7, label %_4.while.body.1, label %_44.critical_edge.1                     ; inst 11
_4.while.body.1:
  br label %_5.while.cond.2                                                        ; inst 12
_5.while.cond.2:
  %8 = phi i32 [0, %_4.while.body.1], [%20, %_12.if.else.1], [%35, %_24.if.exit.5] ; inst 13
  %9 = phi i32 [%4, %_4.while.body.1], [%9, %_12.if.else.1], [%30, %_24.if.exit.5] ; inst 14
  %10 = icmp slt i32 %8, 50                                                        ; inst 15
  br i1 %10, label %_6.while.body.2, label %_45.critical_edge.2                    ; inst 16
_6.while.body.2:
  %11 = add i32 %1, %5                                                             ; inst 17
  %12 = add i32 %11, %8                                                            ; inst 18
  %13 = srem i32 %12, 3                                                            ; inst 19
  %14 = icmp eq i32 %13, 0                                                         ; inst 20
  br i1 %14, label %_7.if.then.0, label %_14.if.else.0                             ; inst 21
_7.if.then.0:
  %15 = mul i32 %1, %5                                                             ; inst 22
  %16 = srem i32 %15, 5                                                            ; inst 23
  %17 = icmp eq i32 %16, 0                                                         ; inst 24
  br i1 %17, label %_8.if.then.1, label %_12.if.else.1                             ; inst 25
_8.if.then.1:
  %18 = add i32 %9, %8                                                             ; inst 26
  %19 = icmp sgt i32 %18, 1000                                                     ; inst 27
  br i1 %19, label %_9.if.then.2, label %_10.if.else.2                             ; inst 28
_9.if.then.2:
  br label %_25.while.exit.2                                                       ; inst 29
_10.if.else.2:
  br label %_11.if.exit.2                                                          ; inst 30
_11.if.exit.2:
  br label %_13.if.exit.1                                                          ; inst 31
_12.if.else.1:
  %20 = add i32 %8, 2                                                              ; inst 32
  br label %_5.while.cond.2                                                        ; inst 33
_13.if.exit.1:
  br label %_21.if.exit.0                                                          ; inst 34
_14.if.else.0:
  %21 = add i32 %1, %5                                                             ; inst 35
  %22 = add i32 %21, %8                                                            ; inst 36
  %23 = srem i32 %22, 7                                                            ; inst 37
  %24 = icmp eq i32 %23, 0                                                         ; inst 38
  br i1 %24, label %_15.if.then.3, label %_19.if.else.3                            ; inst 39
_15.if.then.3:
  %25 = sdiv i32 %8, 2                                                             ; inst 40
  %26 = sub i32 %9, %25                                                            ; inst 41
  %27 = icmp slt i32 %26, 0                                                        ; inst 42
  br i1 %27, label %_16.if.then.4, label %_17.if.else.4                            ; inst 43
_16.if.then.4:
  br label %_18.if.exit.4                                                          ; inst 44
_17.if.else.4:
  br label %_18.if.exit.4                                                          ; inst 45
_18.if.exit.4:
  %28 = phi i32 [0, %_16.if.then.4], [%26, %_17.if.else.4]                         ; inst 46
  br label %_20.if.exit.3                                                          ; inst 47
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 48
_20.if.exit.3:
  %29 = phi i32 [%28, %_18.if.exit.4], [%9, %_19.if.else.3]                        ; inst 49
  br label %_21.if.exit.0                                                          ; inst 50
_21.if.exit.0:
  %30 = phi i32 [%18, %_13.if.exit.1], [%29, %_20.if.exit.3]                       ; inst 51
  %31 = srem i32 %8, 2                                                             ; inst 52
  %32 = icmp eq i32 %31, 0                                                         ; inst 53
  br i1 %32, label %_22.if.then.5, label %_23.if.else.5                            ; inst 54
_22.if.then.5:
  %33 = add i32 %8, 1                                                              ; inst 55
  br label %_24.if.exit.5                                                          ; inst 56
_23.if.else.5:
  %34 = add i32 %8, 3                                                              ; inst 57
  br label %_24.if.exit.5                                                          ; inst 58
_24.if.exit.5:
  %35 = phi i32 [%33, %_22.if.then.5], [%34, %_23.if.else.5]                       ; inst 59
  br label %_5.while.cond.2                                                        ; inst 60
_25.while.exit.2:
  %36 = phi i32 [%9, %_45.critical_edge.2], [%18, %_9.if.then.2]                   ; inst 61
  %37 = add i32 %6, %36                                                            ; inst 62
  %38 = srem i32 %5, 3                                                             ; inst 63
  %39 = icmp eq i32 %38, 0                                                         ; inst 64
  br i1 %39, label %_26.if.then.6, label %_27.if.else.6                            ; inst 65
_26.if.then.6:
  %40 = add i32 %5, 2                                                              ; inst 66
  br label %_28.if.exit.6                                                          ; inst 67
_27.if.else.6:
  %41 = add i32 %5, 1                                                              ; inst 68
  br label %_28.if.exit.6                                                          ; inst 69
_28.if.exit.6:
  %42 = phi i32 [%40, %_26.if.then.6], [%41, %_27.if.else.6]                       ; inst 70
  %43 = icmp sgt i32 %37, 50000                                                    ; inst 71
  br i1 %43, label %_29.if.then.7, label %_30.if.else.7                            ; inst 72
_29.if.then.7:
  br label %_32.while.exit.1                                                       ; inst 73
_30.if.else.7:
  br label %_31.if.exit.7                                                          ; inst 74
_31.if.exit.7:
  br label %_3.while.cond.1                                                        ; inst 75
_32.while.exit.1:
  %44 = phi i32 [%6, %_44.critical_edge.1], [%37, %_29.if.then.7]                  ; inst 76
  %45 = srem i32 %1, 10                                                            ; inst 77
  %46 = icmp eq i32 %45, 0                                                         ; inst 78
  br i1 %46, label %_33.if.then.8, label %_34.if.else.8                            ; inst 79
_33.if.then.8:
  %47 = add i32 %1, 5                                                              ; inst 80
  br label %_38.if.exit.8                                                          ; inst 81
_34.if.else.8:
  %48 = srem i32 %1, 5                                                             ; inst 82
  %49 = icmp eq i32 %48, 0                                                         ; inst 83
  br i1 %49, label %_35.if.then.9, label %_36.if.else.9                            ; inst 84
_35.if.then.9:
  %50 = add i32 %1, 3                                                              ; inst 85
  br label %_37.if.exit.9                                                          ; inst 86
_36.if.else.9:
  %51 = add i32 %1, 1                                                              ; inst 87
  br label %_37.if.exit.9                                                          ; inst 88
_37.if.exit.9:
  %52 = phi i32 [%50, %_35.if.then.9], [%51, %_36.if.else.9]                       ; inst 89
  br label %_38.if.exit.8                                                          ; inst 90
_38.if.exit.8:
  %53 = phi i32 [%47, %_33.if.then.8], [%52, %_37.if.exit.9]                       ; inst 91
  %54 = icmp sgt i32 %44, 100000                                                   ; inst 92
  br i1 %54, label %_39.if.then.10, label %_40.if.else.10                          ; inst 93
_39.if.then.10:
  br label %_42.while.exit.0                                                       ; inst 94
_40.if.else.10:
  br label %_41.if.exit.10                                                         ; inst 95
_41.if.exit.10:
  br label %_1.while.cond.0                                                        ; inst 96
_42.while.exit.0:
  %55 = phi i32 [%2, %_43.critical_edge.0], [%44, %_39.if.then.10]                 ; inst 97
  %56 = srem i32 %55, 10000                                                        ; inst 98
  ret i32 %56                                                                      ; inst 99
_43.critical_edge.0:
  br label %_42.while.exit.0                                                       ; inst 100
_44.critical_edge.1:
  br label %_32.while.exit.1                                                       ; inst 101
_45.critical_edge.2:
  br label %_25.while.exit.2                                                       ; inst 102
}

define i32 @multipleBranchingPatterns(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%58, %_32.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%57, %_32.if.exit.0]                             ; inst 3
  %3 = icmp slt i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_33.while.exit.0                        ; inst 5
_2.while.body.0:
  %4 = mul i32 %1, 17                                                              ; inst 6
  %5 = add i32 %4, 23                                                              ; inst 7
  %6 = srem i32 %5, 100                                                            ; inst 8
  %7 = icmp slt i32 %6, 10                                                         ; inst 9
  br i1 %7, label %_3.if.then.0, label %_13.if.else.0                              ; inst 10
_3.if.then.0:
  %8 = icmp slt i32 %6, 5                                                          ; inst 11
  br i1 %8, label %_4.if.then.1, label %_8.if.else.1                               ; inst 12
_4.if.then.1:
  %9 = srem i32 %6, 2                                                              ; inst 13
  %10 = icmp eq i32 %9, 0                                                          ; inst 14
  br i1 %10, label %_5.if.then.2, label %_6.if.else.2                              ; inst 15
_5.if.then.2:
  %11 = mul i32 %6, 3                                                              ; inst 16
  %12 = add i32 %2, %11                                                            ; inst 17
  br label %_7.if.exit.2                                                           ; inst 18
_6.if.else.2:
  %13 = mul i32 %6, 5                                                              ; inst 19
  %14 = add i32 %2, %13                                                            ; inst 20
  br label %_7.if.exit.2                                                           ; inst 21
_7.if.exit.2:
  %15 = phi i32 [%12, %_5.if.then.2], [%14, %_6.if.else.2]                         ; inst 22
  br label %_12.if.exit.1                                                          ; inst 23
_8.if.else.1:
  %16 = srem i32 %6, 3                                                             ; inst 24
  %17 = icmp eq i32 %16, 0                                                         ; inst 25
  br i1 %17, label %_9.if.then.3, label %_10.if.else.3                             ; inst 26
_9.if.then.3:
  %18 = mul i32 %6, 2                                                              ; inst 27
  %19 = add i32 %2, %18                                                            ; inst 28
  br label %_11.if.exit.3                                                          ; inst 29
_10.if.else.3:
  %20 = mul i32 %6, 4                                                              ; inst 30
  %21 = add i32 %2, %20                                                            ; inst 31
  br label %_11.if.exit.3                                                          ; inst 32
_11.if.exit.3:
  %22 = phi i32 [%19, %_9.if.then.3], [%21, %_10.if.else.3]                        ; inst 33
  br label %_12.if.exit.1                                                          ; inst 34
_12.if.exit.1:
  %23 = phi i32 [%15, %_7.if.exit.2], [%22, %_11.if.exit.3]                        ; inst 35
  br label %_32.if.exit.0                                                          ; inst 36
_13.if.else.0:
  %24 = icmp slt i32 %6, 30                                                        ; inst 37
  br i1 %24, label %_14.if.then.4, label %_18.if.else.4                            ; inst 38
_14.if.then.4:
  %25 = icmp slt i32 %6, 20                                                        ; inst 39
  br i1 %25, label %_15.if.then.5, label %_16.if.else.5                            ; inst 40
_15.if.then.5:
  %26 = call i32 @complexCalculation(i32 %6)                                       ; inst 41
  %27 = add i32 %2, %26                                                            ; inst 42
  br label %_17.if.exit.5                                                          ; inst 43
_16.if.else.5:
  %28 = call i32 @simpleCalculation(i32 %6)                                        ; inst 44
  %29 = add i32 %2, %28                                                            ; inst 45
  br label %_17.if.exit.5                                                          ; inst 46
_17.if.exit.5:
  %30 = phi i32 [%27, %_15.if.then.5], [%29, %_16.if.else.5]                       ; inst 47
  br label %_31.if.exit.4                                                          ; inst 48
_18.if.else.4:
  %31 = icmp slt i32 %6, 60                                                        ; inst 49
  br i1 %31, label %_19.if.then.6, label %_23.if.else.6                            ; inst 50
_19.if.then.6:
  %32 = call i32 @isSpecialNumber(i32 %6)                                          ; inst 51
  %33 = icmp eq i32 %32, 1                                                         ; inst 52
  br i1 %33, label %_20.if.then.7, label %_21.if.else.7                            ; inst 53
_20.if.then.7:
  %34 = call i32 @processSpecialNumber(i32 %6)                                     ; inst 54
  %35 = add i32 %2, %34                                                            ; inst 55
  br label %_22.if.exit.7                                                          ; inst 56
_21.if.else.7:
  %36 = call i32 @processNormalNumber(i32 %6)                                      ; inst 57
  %37 = add i32 %2, %36                                                            ; inst 58
  br label %_22.if.exit.7                                                          ; inst 59
_22.if.exit.7:
  %38 = phi i32 [%35, %_20.if.then.7], [%37, %_21.if.else.7]                       ; inst 60
  br label %_30.if.exit.6                                                          ; inst 61
_23.if.else.6:
  %39 = icmp slt i32 %6, 80                                                        ; inst 62
  br i1 %39, label %_24.if.then.8, label %_28.if.else.8                            ; inst 63
_24.if.then.8:
  br label %_25.while.cond.1                                                       ; inst 64
_25.while.cond.1:
  %40 = phi i32 [0, %_24.if.then.8], [%46, %_26.while.body.1]                      ; inst 65
  %41 = phi i32 [0, %_24.if.then.8], [%45, %_26.while.body.1]                      ; inst 66
  %42 = srem i32 %6, 10                                                            ; inst 67
  %43 = icmp slt i32 %40, %42                                                      ; inst 68
  br i1 %43, label %_26.while.body.1, label %_27.while.exit.1                      ; inst 69
_26.while.body.1:
  %44 = mul i32 %40, %40                                                           ; inst 70
  %45 = add i32 %41, %44                                                           ; inst 71
  %46 = add i32 %40, 1                                                             ; inst 72
  br label %_25.while.cond.1                                                       ; inst 73
_27.while.exit.1:
  %47 = add i32 %2, %41                                                            ; inst 74
  br label %_29.if.exit.8                                                          ; inst 75
_28.if.else.8:
  %48 = mul i32 %6, %6                                                             ; inst 76
  %49 = srem i32 %48, 17                                                           ; inst 77
  %50 = add i32 %6, 13                                                             ; inst 78
  %51 = srem i32 %50, 7                                                            ; inst 79
  %52 = add i32 %49, %51                                                           ; inst 80
  %53 = add i32 %2, %52                                                            ; inst 81
  br label %_29.if.exit.8                                                          ; inst 82
_29.if.exit.8:
  %54 = phi i32 [%47, %_27.while.exit.1], [%53, %_28.if.else.8]                    ; inst 83
  br label %_30.if.exit.6                                                          ; inst 84
_30.if.exit.6:
  %55 = phi i32 [%38, %_22.if.exit.7], [%54, %_29.if.exit.8]                       ; inst 85
  br label %_31.if.exit.4                                                          ; inst 86
_31.if.exit.4:
  %56 = phi i32 [%30, %_17.if.exit.5], [%55, %_30.if.exit.6]                       ; inst 87
  br label %_32.if.exit.0                                                          ; inst 88
_32.if.exit.0:
  %57 = phi i32 [%23, %_12.if.exit.1], [%56, %_31.if.exit.4]                       ; inst 89
  %58 = add i32 %1, 1                                                              ; inst 90
  br label %_1.while.cond.0                                                        ; inst 91
_33.while.exit.0:
  %59 = srem i32 %2, 10000                                                         ; inst 92
  ret i32 %59                                                                      ; inst 93
}

define i32 @complexCalculation(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [%0, %_0.entry.0], [%6, %_2.while.body.0]                           ; inst 3
  %3 = icmp sgt i32 %2, 0                                                          ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = srem i32 %2, 10                                                             ; inst 6
  %5 = add i32 %1, %4                                                              ; inst 7
  %6 = sdiv i32 %2, 10                                                             ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  %7 = mul i32 %1, %1                                                              ; inst 10
  ret i32 %7                                                                       ; inst 11
}

define i32 @simpleCalculation(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 2                                                               ; inst 1
  %2 = add i32 %1, 1                                                               ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @isSpecialNumber(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 7                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 3
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 4
_2.lazy.else.0:
  %3 = srem i32 %0, 11                                                             ; inst 5
  %4 = icmp eq i32 %3, 0                                                           ; inst 6
  br label %_3.lazy.exit.0                                                         ; inst 7
_3.lazy.exit.0:
  %5 = phi i1 [1, %_1.lazy.then.0], [%4, %_2.lazy.else.0]                          ; inst 8
  %6 = zext i1 %5 to i32                                                           ; inst 9
  ret i32 %6                                                                       ; inst 10
}

define i32 @processSpecialNumber(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 7                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %3 = mul i32 %0, 7                                                               ; inst 4
  br label %_3.if.exit.0                                                           ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = phi i32 [%3, %_1.if.then.0], [%0, %_2.if.else.0]                            ; inst 7
  %5 = srem i32 %0, 11                                                             ; inst 8
  %6 = icmp eq i32 %5, 0                                                           ; inst 9
  br i1 %6, label %_4.if.then.1, label %_5.if.else.1                               ; inst 10
_4.if.then.1:
  %7 = mul i32 %4, 11                                                              ; inst 11
  br label %_6.if.exit.1                                                           ; inst 12
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 13
_6.if.exit.1:
  %8 = phi i32 [%7, %_4.if.then.1], [%4, %_5.if.else.1]                            ; inst 14
  %9 = srem i32 %8, 1000                                                           ; inst 15
  ret i32 %9                                                                       ; inst 16
}

define i32 @processNormalNumber(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 3                                                               ; inst 1
  %2 = add i32 %1, 7                                                               ; inst 2
  %3 = srem i32 %2, 100                                                            ; inst 3
  ret i32 %3                                                                       ; inst 4
}

define i32 @earlyExitPatterns(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%29, %_26.if.exit.5]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%27, %_26.if.exit.5]                             ; inst 3
  %3 = icmp slt i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_27.while.exit.0                        ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%4, %_12.if.then.3], [%19, %_22.if.exit.4]  ; inst 7
  %5 = phi i32 [0, %_2.while.body.0], [%18, %_12.if.then.3], [%25, %_22.if.exit.4] ; inst 8
  %6 = phi i32 [%2, %_2.while.body.0], [%6, %_12.if.then.3], [%20, %_22.if.exit.4] ; inst 9
  %7 = icmp slt i32 %5, %0                                                         ; inst 10
  br i1 %7, label %_4.while.body.1, label %_28.critical_edge.0                     ; inst 11
_4.while.body.1:
  %8 = mul i32 %1, 31                                                              ; inst 12
  %9 = mul i32 %5, 17                                                              ; inst 13
  %10 = add i32 %8, %9                                                             ; inst 14
  %11 = srem i32 %10, 100                                                          ; inst 15
  %12 = icmp eq i32 %11, 42                                                        ; inst 16
  br i1 %12, label %_5.if.then.0, label %_9.if.else.0                              ; inst 17
_5.if.then.0:
  %13 = add i32 %4, 1                                                              ; inst 18
  %14 = add i32 %6, 1                                                              ; inst 19
  %15 = icmp sgt i32 %14, 20                                                       ; inst 20
  br i1 %15, label %_6.if.then.1, label %_7.if.else.1                              ; inst 21
_6.if.then.1:
  ret i32 %14                                                                      ; inst 22
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 23
_8.if.exit.1:
  br label %_16.if.exit.0                                                          ; inst 24
_9.if.else.0:
  %16 = icmp sgt i32 %11, 95                                                       ; inst 25
  br i1 %16, label %_10.if.then.2, label %_11.if.else.2                            ; inst 26
_10.if.then.2:
  br label %_23.while.exit.1                                                       ; inst 27
_11.if.else.2:
  %17 = icmp slt i32 %11, 5                                                        ; inst 28
  br i1 %17, label %_12.if.then.3, label %_13.if.else.3                            ; inst 29
_12.if.then.3:
  %18 = add i32 %5, 10                                                             ; inst 30
  br label %_3.while.cond.1                                                        ; inst 31
_13.if.else.3:
  br label %_14.if.exit.3                                                          ; inst 32
_14.if.exit.3:
  br label %_15.if.exit.2                                                          ; inst 33
_15.if.exit.2:
  br label %_16.if.exit.0                                                          ; inst 34
_16.if.exit.0:
  %19 = phi i32 [%13, %_8.if.exit.1], [%4, %_15.if.exit.2]                         ; inst 35
  %20 = phi i32 [%14, %_8.if.exit.1], [%6, %_15.if.exit.2]                         ; inst 36
  %21 = icmp sgt i32 %19, 3                                                        ; inst 37
  br i1 %21, label %_17.lazy.then.0, label %_18.lazy.else.0                        ; inst 38
_17.lazy.then.0:
  %22 = srem i32 %11, 13                                                           ; inst 39
  %23 = icmp eq i32 %22, 0                                                         ; inst 40
  br label %_19.lazy.exit.0                                                        ; inst 41
_18.lazy.else.0:
  br label %_19.lazy.exit.0                                                        ; inst 42
_19.lazy.exit.0:
  %24 = phi i1 [%23, %_17.lazy.then.0], [0, %_18.lazy.else.0]                      ; inst 43
  br i1 %24, label %_20.if.then.4, label %_21.if.else.4                            ; inst 44
_20.if.then.4:
  br label %_23.while.exit.1                                                       ; inst 45
_21.if.else.4:
  br label %_22.if.exit.4                                                          ; inst 46
_22.if.exit.4:
  %25 = add i32 %5, 1                                                              ; inst 47
  br label %_3.while.cond.1                                                        ; inst 48
_23.while.exit.1:
  %26 = phi i32 [%4, %_28.critical_edge.0], [%4, %_10.if.then.2], [%19, %_20.if.then.4] ; inst 49
  %27 = phi i32 [%6, %_28.critical_edge.0], [%6, %_10.if.then.2], [%20, %_20.if.then.4] ; inst 50
  %28 = icmp sgt i32 %26, 5                                                        ; inst 51
  br i1 %28, label %_24.if.then.5, label %_25.if.else.5                            ; inst 52
_24.if.then.5:
  ret i32 %27                                                                      ; inst 53
_25.if.else.5:
  br label %_26.if.exit.5                                                          ; inst 54
_26.if.exit.5:
  %29 = add i32 %1, 1                                                              ; inst 55
  br label %_1.while.cond.0                                                        ; inst 56
_27.while.exit.0:
  ret i32 %2                                                                       ; inst 57
_28.critical_edge.0:
  br label %_23.while.exit.1                                                       ; inst 58
}

define i32 @simulateSwitchBehavior(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%67, %_47.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%66, %_47.if.exit.0]                             ; inst 3
  %3 = icmp slt i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_48.while.exit.0                        ; inst 5
_2.while.body.0:
  %4 = srem i32 %1, 16                                                             ; inst 6
  %5 = icmp eq i32 %4, 0                                                           ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = call i32 @processCase0(i32 %1)                                              ; inst 9
  %7 = add i32 %2, %6                                                              ; inst 10
  br label %_47.if.exit.0                                                          ; inst 11
_4.if.else.0:
  %8 = icmp eq i32 %4, 1                                                           ; inst 12
  br i1 %8, label %_5.if.then.1, label %_6.if.else.1                               ; inst 13
_5.if.then.1:
  %9 = call i32 @processCase1(i32 %1)                                              ; inst 14
  %10 = add i32 %2, %9                                                             ; inst 15
  br label %_46.if.exit.1                                                          ; inst 16
_6.if.else.1:
  %11 = icmp eq i32 %4, 2                                                          ; inst 17
  br i1 %11, label %_7.if.then.2, label %_8.if.else.2                              ; inst 18
_7.if.then.2:
  %12 = call i32 @processCase2(i32 %1)                                             ; inst 19
  %13 = add i32 %2, %12                                                            ; inst 20
  br label %_45.if.exit.2                                                          ; inst 21
_8.if.else.2:
  %14 = icmp eq i32 %4, 3                                                          ; inst 22
  br i1 %14, label %_9.if.then.3, label %_10.if.else.3                             ; inst 23
_9.if.then.3:
  %15 = call i32 @processCase3(i32 %1)                                             ; inst 24
  %16 = add i32 %2, %15                                                            ; inst 25
  br label %_44.if.exit.3                                                          ; inst 26
_10.if.else.3:
  %17 = icmp eq i32 %4, 4                                                          ; inst 27
  br i1 %17, label %_11.if.then.4, label %_12.if.else.4                            ; inst 28
_11.if.then.4:
  %18 = call i32 @processCase4(i32 %1)                                             ; inst 29
  %19 = add i32 %2, %18                                                            ; inst 30
  br label %_43.if.exit.4                                                          ; inst 31
_12.if.else.4:
  %20 = icmp eq i32 %4, 5                                                          ; inst 32
  br i1 %20, label %_13.if.then.5, label %_14.if.else.5                            ; inst 33
_13.if.then.5:
  %21 = call i32 @processCase5(i32 %1)                                             ; inst 34
  %22 = add i32 %2, %21                                                            ; inst 35
  br label %_42.if.exit.5                                                          ; inst 36
_14.if.else.5:
  %23 = icmp eq i32 %4, 6                                                          ; inst 37
  br i1 %23, label %_15.if.then.6, label %_16.if.else.6                            ; inst 38
_15.if.then.6:
  %24 = call i32 @processCase6(i32 %1)                                             ; inst 39
  %25 = add i32 %2, %24                                                            ; inst 40
  br label %_41.if.exit.6                                                          ; inst 41
_16.if.else.6:
  %26 = icmp eq i32 %4, 7                                                          ; inst 42
  br i1 %26, label %_17.if.then.7, label %_18.if.else.7                            ; inst 43
_17.if.then.7:
  %27 = call i32 @processCase7(i32 %1)                                             ; inst 44
  %28 = add i32 %2, %27                                                            ; inst 45
  br label %_40.if.exit.7                                                          ; inst 46
_18.if.else.7:
  %29 = icmp eq i32 %4, 8                                                          ; inst 47
  br i1 %29, label %_19.if.then.8, label %_20.if.else.8                            ; inst 48
_19.if.then.8:
  %30 = call i32 @processCase8(i32 %1)                                             ; inst 49
  %31 = add i32 %2, %30                                                            ; inst 50
  br label %_39.if.exit.8                                                          ; inst 51
_20.if.else.8:
  %32 = icmp eq i32 %4, 9                                                          ; inst 52
  br i1 %32, label %_21.if.then.9, label %_22.if.else.9                            ; inst 53
_21.if.then.9:
  %33 = call i32 @processCase9(i32 %1)                                             ; inst 54
  %34 = add i32 %2, %33                                                            ; inst 55
  br label %_38.if.exit.9                                                          ; inst 56
_22.if.else.9:
  %35 = icmp eq i32 %4, 10                                                         ; inst 57
  br i1 %35, label %_23.if.then.10, label %_24.if.else.10                          ; inst 58
_23.if.then.10:
  %36 = call i32 @processCase10(i32 %1)                                            ; inst 59
  %37 = add i32 %2, %36                                                            ; inst 60
  br label %_37.if.exit.10                                                         ; inst 61
_24.if.else.10:
  %38 = icmp eq i32 %4, 11                                                         ; inst 62
  br i1 %38, label %_25.if.then.11, label %_26.if.else.11                          ; inst 63
_25.if.then.11:
  %39 = call i32 @processCase11(i32 %1)                                            ; inst 64
  %40 = add i32 %2, %39                                                            ; inst 65
  br label %_36.if.exit.11                                                         ; inst 66
_26.if.else.11:
  %41 = icmp eq i32 %4, 12                                                         ; inst 67
  br i1 %41, label %_27.if.then.12, label %_28.if.else.12                          ; inst 68
_27.if.then.12:
  %42 = call i32 @processCase12(i32 %1)                                            ; inst 69
  %43 = add i32 %2, %42                                                            ; inst 70
  br label %_35.if.exit.12                                                         ; inst 71
_28.if.else.12:
  %44 = icmp eq i32 %4, 13                                                         ; inst 72
  br i1 %44, label %_29.if.then.13, label %_30.if.else.13                          ; inst 73
_29.if.then.13:
  %45 = call i32 @processCase13(i32 %1)                                            ; inst 74
  %46 = add i32 %2, %45                                                            ; inst 75
  br label %_34.if.exit.13                                                         ; inst 76
_30.if.else.13:
  %47 = icmp eq i32 %4, 14                                                         ; inst 77
  br i1 %47, label %_31.if.then.14, label %_32.if.else.14                          ; inst 78
_31.if.then.14:
  %48 = call i32 @processCase14(i32 %1)                                            ; inst 79
  %49 = add i32 %2, %48                                                            ; inst 80
  br label %_33.if.exit.14                                                         ; inst 81
_32.if.else.14:
  %50 = call i32 @processCase15(i32 %1)                                            ; inst 82
  %51 = add i32 %2, %50                                                            ; inst 83
  br label %_33.if.exit.14                                                         ; inst 84
_33.if.exit.14:
  %52 = phi i32 [%49, %_31.if.then.14], [%51, %_32.if.else.14]                     ; inst 85
  br label %_34.if.exit.13                                                         ; inst 86
_34.if.exit.13:
  %53 = phi i32 [%46, %_29.if.then.13], [%52, %_33.if.exit.14]                     ; inst 87
  br label %_35.if.exit.12                                                         ; inst 88
_35.if.exit.12:
  %54 = phi i32 [%43, %_27.if.then.12], [%53, %_34.if.exit.13]                     ; inst 89
  br label %_36.if.exit.11                                                         ; inst 90
_36.if.exit.11:
  %55 = phi i32 [%40, %_25.if.then.11], [%54, %_35.if.exit.12]                     ; inst 91
  br label %_37.if.exit.10                                                         ; inst 92
_37.if.exit.10:
  %56 = phi i32 [%37, %_23.if.then.10], [%55, %_36.if.exit.11]                     ; inst 93
  br label %_38.if.exit.9                                                          ; inst 94
_38.if.exit.9:
  %57 = phi i32 [%34, %_21.if.then.9], [%56, %_37.if.exit.10]                      ; inst 95
  br label %_39.if.exit.8                                                          ; inst 96
_39.if.exit.8:
  %58 = phi i32 [%31, %_19.if.then.8], [%57, %_38.if.exit.9]                       ; inst 97
  br label %_40.if.exit.7                                                          ; inst 98
_40.if.exit.7:
  %59 = phi i32 [%28, %_17.if.then.7], [%58, %_39.if.exit.8]                       ; inst 99
  br label %_41.if.exit.6                                                          ; inst 100
_41.if.exit.6:
  %60 = phi i32 [%25, %_15.if.then.6], [%59, %_40.if.exit.7]                       ; inst 101
  br label %_42.if.exit.5                                                          ; inst 102
_42.if.exit.5:
  %61 = phi i32 [%22, %_13.if.then.5], [%60, %_41.if.exit.6]                       ; inst 103
  br label %_43.if.exit.4                                                          ; inst 104
_43.if.exit.4:
  %62 = phi i32 [%19, %_11.if.then.4], [%61, %_42.if.exit.5]                       ; inst 105
  br label %_44.if.exit.3                                                          ; inst 106
_44.if.exit.3:
  %63 = phi i32 [%16, %_9.if.then.3], [%62, %_43.if.exit.4]                        ; inst 107
  br label %_45.if.exit.2                                                          ; inst 108
_45.if.exit.2:
  %64 = phi i32 [%13, %_7.if.then.2], [%63, %_44.if.exit.3]                        ; inst 109
  br label %_46.if.exit.1                                                          ; inst 110
_46.if.exit.1:
  %65 = phi i32 [%10, %_5.if.then.1], [%64, %_45.if.exit.2]                        ; inst 111
  br label %_47.if.exit.0                                                          ; inst 112
_47.if.exit.0:
  %66 = phi i32 [%7, %_3.if.then.0], [%65, %_46.if.exit.1]                         ; inst 113
  %67 = add i32 %1, 1                                                              ; inst 114
  br label %_1.while.cond.0                                                        ; inst 115
_48.while.exit.0:
  %68 = srem i32 %2, 10000                                                         ; inst 116
  ret i32 %68                                                                      ; inst 117
}

define i32 @processCase0(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 2                                                               ; inst 1
  ret i32 %1                                                                       ; inst 2
}

define i32 @processCase1(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 3                                                               ; inst 1
  %2 = add i32 %1, 1                                                               ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase2(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, %0                                                              ; inst 1
  %2 = srem i32 %1, 100                                                            ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase3(i32 %0) {
_0.entry.0:
  %1 = add i32 %0, 5                                                               ; inst 1
  %2 = mul i32 %1, 2                                                               ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase4(i32 %0) {
_0.entry.0:
  %1 = sdiv i32 %0, 2                                                              ; inst 1
  %2 = add i32 %1, 10                                                              ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase5(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 7                                                              ; inst 1
  %2 = srem i32 %0, 11                                                             ; inst 2
  %3 = add i32 %1, %2                                                              ; inst 3
  ret i32 %3                                                                       ; inst 4
}

define i32 @processCase6(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 7                                                               ; inst 1
  %2 = srem i32 %1, 23                                                             ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase7(i32 %0) {
_0.entry.0:
  %1 = add i32 %0, 3                                                               ; inst 1
  %2 = add i32 %0, 7                                                               ; inst 2
  %3 = mul i32 %1, %2                                                              ; inst 3
  %4 = srem i32 %3, 50                                                             ; inst 4
  ret i32 %4                                                                       ; inst 5
}

define i32 @processCase8(i32 %0) {
_0.entry.0:
  %1 = xor i32 %0, 42                                                              ; inst 1
  ret i32 %1                                                                       ; inst 2
}

define i32 @processCase9(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 13                                                              ; inst 1
  %2 = srem i32 %1, 17                                                             ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase10(i32 %0) {
_0.entry.0:
  %1 = sdiv i32 %0, 3                                                              ; inst 1
  %2 = add i32 %0, %1                                                              ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase11(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 19                                                              ; inst 1
  %2 = srem i32 %1, 31                                                             ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @processCase12(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 2                                                               ; inst 1
  %2 = add i32 %1, 1                                                               ; inst 2
  %3 = srem i32 %2, 25                                                             ; inst 3
  ret i32 %3                                                                       ; inst 4
}

define i32 @processCase13(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 6                                                              ; inst 1
  %2 = mul i32 %1, %0                                                              ; inst 2
  %3 = srem i32 %2, 8                                                              ; inst 3
  ret i32 %3                                                                       ; inst 4
}

define i32 @processCase14(i32 %0) {
_0.entry.0:
  %1 = add i32 %0, 47                                                              ; inst 1
  ret i32 %1                                                                       ; inst 2
}

define i32 @processCase15(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 37                                                              ; inst 1
  %2 = srem i32 %1, 41                                                             ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define void @performGraphAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 2003)                                                  ; inst 1
  %0 = call i32 @performGraphTraversal()                                           ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @performShortestPath()                                             ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @performConnectivityTest()                                         ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  call void @printlnInt(i32 2004)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @performGraphTraversal() {
_0.entry.0:
  %0 = alloca [2500 x i32]                                                         ; inst 1
  %1 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 2500                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [50 x i32]                                                           ; inst 11
  %7 = getelementptr [50 x i32], [50 x i32]* %6, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 50                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  call void @initializeRandomGraph([2500 x i32]* %0, i64 50)                       ; inst 21
  %12 = call i32 @depthFirstSearch([2500 x i32]* %0, [50 x i32]* %6, i64 50, i64 0) ; inst 22
  call void @resetArray([50 x i32]* %6, i64 50)                                    ; inst 23
  %13 = call i32 @breadthFirstSearch([2500 x i32]* %0, [50 x i32]* %6, i64 50, i64 0) ; inst 24
  %14 = add i32 %12, %13                                                           ; inst 25
  ret i32 %14                                                                      ; inst 26
}

define void @initializeRandomGraph([2500 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca i32                                                                  ; inst 1
  store i32 12345, i32* %2                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i64 [0, %_0.entry.0], [%18, %_11.while.exit.1]                          ; inst 4
  %4 = icmp ult i64 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %5 = phi i64 [0, %_2.while.body.0], [%17, %_10.if.exit.0]                        ; inst 8
  %6 = icmp ult i64 %5, %1                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 10
_4.while.body.1:
  %7 = icmp ne i64 %3, %5                                                          ; inst 11
  br i1 %7, label %_5.if.then.0, label %_9.if.else.0                               ; inst 12
_5.if.then.0:
  call void @update(i32* %2)                                                       ; inst 13
  %8 = load i32, i32* %2                                                           ; inst 14
  %9 = srem i32 %8, 100                                                            ; inst 15
  %10 = icmp slt i32 %9, 20                                                        ; inst 16
  br i1 %10, label %_6.if.then.1, label %_7.if.else.1                              ; inst 17
_6.if.then.1:
  %11 = mul i64 %3, %1                                                             ; inst 18
  %12 = add i64 %11, %5                                                            ; inst 19
  %13 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %12               ; inst 20
  store i32 1, i32* %13                                                            ; inst 21
  %14 = mul i64 %5, %1                                                             ; inst 22
  %15 = add i64 %14, %3                                                            ; inst 23
  %16 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %15               ; inst 24
  store i32 1, i32* %16                                                            ; inst 25
  br label %_8.if.exit.1                                                           ; inst 26
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 27
_8.if.exit.1:
  br label %_10.if.exit.0                                                          ; inst 28
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 29
_10.if.exit.0:
  %17 = add i64 %5, 1                                                              ; inst 30
  br label %_3.while.cond.1                                                        ; inst 31
_11.while.exit.1:
  %18 = add i64 %3, 1                                                              ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_12.while.exit.0:
  ret void                                                                         ; inst 34
}

define void @resetArray([50 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 2
  %3 = icmp ult i64 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %2                     ; inst 5
  store i32 0, i32* %4                                                             ; inst 6
  %5 = add i64 %2, 1                                                               ; inst 7
  br label %_1.while.cond.0                                                        ; inst 8
_3.while.exit.0:
  ret void                                                                         ; inst 9
}

define i32 @depthFirstSearch([2500 x i32]* %0, [50 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = alloca [1000 x i64]                                                         ; inst 1
  %5 = getelementptr [1000 x i64], [1000 x i64]* %4, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 1000                                                       ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i64, i64* %5, i32 %6                                          ; inst 7
  store i64 0, i64* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %10 = getelementptr [1000 x i64], [1000 x i64]* %4, i32 0, i64 0                 ; inst 11
  store i64 %3, i64* %10                                                           ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %11 = phi i32 [0, %_3.array.exit.0], [%38, %_17.if.exit.0]                       ; inst 14
  %12 = phi i64 [1, %_3.array.exit.0], [%39, %_17.if.exit.0]                       ; inst 15
  %13 = icmp ugt i64 %12, 0                                                        ; inst 16
  br i1 %13, label %_5.while.body.0, label %_18.while.exit.0                       ; inst 17
_5.while.body.0:
  %14 = sub i64 %12, 1                                                             ; inst 18
  %15 = getelementptr [1000 x i64], [1000 x i64]* %4, i32 0, i64 %14               ; inst 19
  %16 = load i64, i64* %15                                                         ; inst 20
  %17 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %16                   ; inst 21
  %18 = load i32, i32* %17                                                         ; inst 22
  %19 = icmp eq i32 %18, 0                                                         ; inst 23
  br i1 %19, label %_6.if.then.0, label %_16.if.else.0                             ; inst 24
_6.if.then.0:
  %20 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %16                   ; inst 25
  store i32 1, i32* %20                                                            ; inst 26
  %21 = add i32 %11, 1                                                             ; inst 27
  br label %_7.while.cond.1                                                        ; inst 28
_7.while.cond.1:
  %22 = phi i64 [0, %_6.if.then.0], [%37, %_14.if.exit.1]                          ; inst 29
  %23 = phi i64 [%14, %_6.if.then.0], [%36, %_14.if.exit.1]                        ; inst 30
  %24 = icmp ult i64 %22, %2                                                       ; inst 31
  br i1 %24, label %_8.while.body.1, label %_15.while.exit.1                       ; inst 32
_8.while.body.1:
  %25 = mul i64 %16, %2                                                            ; inst 33
  %26 = add i64 %25, %22                                                           ; inst 34
  %27 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %26               ; inst 35
  %28 = load i32, i32* %27                                                         ; inst 36
  %29 = icmp eq i32 %28, 1                                                         ; inst 37
  br i1 %29, label %_9.lazy.then.0, label %_10.lazy.else.0                         ; inst 38
_9.lazy.then.0:
  %30 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %22                   ; inst 39
  %31 = load i32, i32* %30                                                         ; inst 40
  %32 = icmp eq i32 %31, 0                                                         ; inst 41
  br label %_11.lazy.exit.0                                                        ; inst 42
_10.lazy.else.0:
  br label %_11.lazy.exit.0                                                        ; inst 43
_11.lazy.exit.0:
  %33 = phi i1 [%32, %_9.lazy.then.0], [0, %_10.lazy.else.0]                       ; inst 44
  br i1 %33, label %_12.if.then.1, label %_13.if.else.1                            ; inst 45
_12.if.then.1:
  %34 = getelementptr [1000 x i64], [1000 x i64]* %4, i32 0, i64 %23               ; inst 46
  store i64 %22, i64* %34                                                          ; inst 47
  %35 = add i64 %23, 1                                                             ; inst 48
  br label %_14.if.exit.1                                                          ; inst 49
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 50
_14.if.exit.1:
  %36 = phi i64 [%35, %_12.if.then.1], [%23, %_13.if.else.1]                       ; inst 51
  %37 = add i64 %22, 1                                                             ; inst 52
  br label %_7.while.cond.1                                                        ; inst 53
_15.while.exit.1:
  br label %_17.if.exit.0                                                          ; inst 54
_16.if.else.0:
  br label %_17.if.exit.0                                                          ; inst 55
_17.if.exit.0:
  %38 = phi i32 [%21, %_15.while.exit.1], [%11, %_16.if.else.0]                    ; inst 56
  %39 = phi i64 [%23, %_15.while.exit.1], [%14, %_16.if.else.0]                    ; inst 57
  br label %_4.while.cond.0                                                        ; inst 58
_18.while.exit.0:
  ret i32 %11                                                                      ; inst 59
}

define i32 @breadthFirstSearch([2500 x i32]* %0, [50 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = alloca [50 x i64]                                                           ; inst 1
  %5 = getelementptr [50 x i64], [50 x i64]* %4, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 50                                                         ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i64, i64* %5, i32 %6                                          ; inst 7
  store i64 0, i64* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %10 = getelementptr [50 x i64], [50 x i64]* %4, i32 0, i64 0                     ; inst 11
  store i64 %3, i64* %10                                                           ; inst 12
  %11 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %3                    ; inst 13
  store i32 1, i32* %11                                                            ; inst 14
  br label %_4.while.cond.0                                                        ; inst 15
_4.while.cond.0:
  %12 = phi i64 [0, %_3.array.exit.0], [%18, %_14.while.exit.1]                    ; inst 16
  %13 = phi i64 [1, %_3.array.exit.0], [%19, %_14.while.exit.1]                    ; inst 17
  %14 = phi i32 [1, %_3.array.exit.0], [%21, %_14.while.exit.1]                    ; inst 18
  %15 = icmp ult i64 %12, %13                                                      ; inst 19
  br i1 %15, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 20
_5.while.body.0:
  %16 = getelementptr [50 x i64], [50 x i64]* %4, i32 0, i64 %12                   ; inst 21
  %17 = load i64, i64* %16                                                         ; inst 22
  %18 = add i64 %12, 1                                                             ; inst 23
  br label %_6.while.cond.1                                                        ; inst 24
_6.while.cond.1:
  %19 = phi i64 [%13, %_5.while.body.0], [%36, %_13.if.exit.0]                     ; inst 25
  %20 = phi i64 [0, %_5.while.body.0], [%38, %_13.if.exit.0]                       ; inst 26
  %21 = phi i32 [%14, %_5.while.body.0], [%37, %_13.if.exit.0]                     ; inst 27
  %22 = icmp ult i64 %20, %2                                                       ; inst 28
  br i1 %22, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 29
_7.while.body.1:
  %23 = mul i64 %17, %2                                                            ; inst 30
  %24 = add i64 %23, %20                                                           ; inst 31
  %25 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %24               ; inst 32
  %26 = load i32, i32* %25                                                         ; inst 33
  %27 = icmp eq i32 %26, 1                                                         ; inst 34
  br i1 %27, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 35
_8.lazy.then.0:
  %28 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %20                   ; inst 36
  %29 = load i32, i32* %28                                                         ; inst 37
  %30 = icmp eq i32 %29, 0                                                         ; inst 38
  br label %_10.lazy.exit.0                                                        ; inst 39
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 40
_10.lazy.exit.0:
  %31 = phi i1 [%30, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 41
  br i1 %31, label %_11.if.then.0, label %_12.if.else.0                            ; inst 42
_11.if.then.0:
  %32 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %20                   ; inst 43
  store i32 1, i32* %32                                                            ; inst 44
  %33 = add i32 %21, 1                                                             ; inst 45
  %34 = getelementptr [50 x i64], [50 x i64]* %4, i32 0, i64 %19                   ; inst 46
  store i64 %20, i64* %34                                                          ; inst 47
  %35 = add i64 %19, 1                                                             ; inst 48
  br label %_13.if.exit.0                                                          ; inst 49
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 50
_13.if.exit.0:
  %36 = phi i64 [%35, %_11.if.then.0], [%19, %_12.if.else.0]                       ; inst 51
  %37 = phi i32 [%33, %_11.if.then.0], [%21, %_12.if.else.0]                       ; inst 52
  %38 = add i64 %20, 1                                                             ; inst 53
  br label %_6.while.cond.1                                                        ; inst 54
_14.while.exit.1:
  br label %_4.while.cond.0                                                        ; inst 55
_15.while.exit.0:
  ret i32 %14                                                                      ; inst 56
}

define i32 @performShortestPath() {
_0.entry.0:
  %0 = alloca [2500 x i32]                                                         ; inst 1
  %1 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 2500                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  call void @initializeDistanceMatrix([2500 x i32]* %0, i64 50)                    ; inst 11
  call void @floydWarshall([2500 x i32]* %0, i64 50)                               ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %6 = phi i64 [0, %_3.array.exit.0], [%26, %_14.while.exit.1]                     ; inst 14
  %7 = phi i32 [0, %_3.array.exit.0], [%10, %_14.while.exit.1]                     ; inst 15
  %8 = icmp ult i64 %6, 50                                                         ; inst 16
  br i1 %8, label %_5.while.body.0, label %_15.while.exit.0                        ; inst 17
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 18
_6.while.cond.1:
  %9 = phi i64 [0, %_5.while.body.0], [%25, %_13.if.exit.0]                        ; inst 19
  %10 = phi i32 [%7, %_5.while.body.0], [%24, %_13.if.exit.0]                      ; inst 20
  %11 = icmp ult i64 %9, 50                                                        ; inst 21
  br i1 %11, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 22
_7.while.body.1:
  %12 = icmp ne i64 %6, %9                                                         ; inst 23
  br i1 %12, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 24
_8.lazy.then.0:
  %13 = mul i64 %6, 50                                                             ; inst 25
  %14 = add i64 %13, %9                                                            ; inst 26
  %15 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %14               ; inst 27
  %16 = load i32, i32* %15                                                         ; inst 28
  %17 = icmp slt i32 %16, 1000000                                                  ; inst 29
  br label %_10.lazy.exit.0                                                        ; inst 30
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 31
_10.lazy.exit.0:
  %18 = phi i1 [%17, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 32
  br i1 %18, label %_11.if.then.0, label %_12.if.else.0                            ; inst 33
_11.if.then.0:
  %19 = mul i64 %6, 50                                                             ; inst 34
  %20 = add i64 %19, %9                                                            ; inst 35
  %21 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %20               ; inst 36
  %22 = load i32, i32* %21                                                         ; inst 37
  %23 = add i32 %10, %22                                                           ; inst 38
  br label %_13.if.exit.0                                                          ; inst 39
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 40
_13.if.exit.0:
  %24 = phi i32 [%23, %_11.if.then.0], [%10, %_12.if.else.0]                       ; inst 41
  %25 = add i64 %9, 1                                                              ; inst 42
  br label %_6.while.cond.1                                                        ; inst 43
_14.while.exit.1:
  %26 = add i64 %6, 1                                                              ; inst 44
  br label %_4.while.cond.0                                                        ; inst 45
_15.while.exit.0:
  %27 = srem i32 %7, 10000                                                         ; inst 46
  ret i32 %27                                                                      ; inst 47
}

define void @initializeDistanceMatrix([2500 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca i32                                                                  ; inst 1
  store i32 54321, i32* %2                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i64 [0, %_0.entry.0], [%24, %_11.while.exit.1]                          ; inst 4
  %4 = icmp ult i64 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %5 = phi i64 [0, %_2.while.body.0], [%23, %_10.if.exit.0]                        ; inst 8
  %6 = icmp ult i64 %5, %1                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 10
_4.while.body.1:
  %7 = icmp eq i64 %3, %5                                                          ; inst 11
  br i1 %7, label %_5.if.then.0, label %_6.if.else.0                               ; inst 12
_5.if.then.0:
  %8 = mul i64 %3, %1                                                              ; inst 13
  %9 = add i64 %8, %5                                                              ; inst 14
  %10 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %9                ; inst 15
  store i32 0, i32* %10                                                            ; inst 16
  br label %_10.if.exit.0                                                          ; inst 17
_6.if.else.0:
  call void @update(i32* %2)                                                       ; inst 18
  %11 = load i32, i32* %2                                                          ; inst 19
  %12 = srem i32 %11, 100                                                          ; inst 20
  %13 = icmp slt i32 %12, 30                                                       ; inst 21
  br i1 %13, label %_7.if.then.1, label %_8.if.else.1                              ; inst 22
_7.if.then.1:
  %14 = mul i64 %3, %1                                                             ; inst 23
  %15 = add i64 %14, %5                                                            ; inst 24
  %16 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %15               ; inst 25
  %17 = load i32, i32* %2                                                          ; inst 26
  %18 = srem i32 %17, 20                                                           ; inst 27
  %19 = add i32 %18, 1                                                             ; inst 28
  store i32 %19, i32* %16                                                          ; inst 29
  br label %_9.if.exit.1                                                           ; inst 30
_8.if.else.1:
  %20 = mul i64 %3, %1                                                             ; inst 31
  %21 = add i64 %20, %5                                                            ; inst 32
  %22 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %21               ; inst 33
  store i32 1000000, i32* %22                                                      ; inst 34
  br label %_9.if.exit.1                                                           ; inst 35
_9.if.exit.1:
  br label %_10.if.exit.0                                                          ; inst 36
_10.if.exit.0:
  %23 = add i64 %5, 1                                                              ; inst 37
  br label %_3.while.cond.1                                                        ; inst 38
_11.while.exit.1:
  %24 = add i64 %3, 1                                                              ; inst 39
  br label %_1.while.cond.0                                                        ; inst 40
_12.while.exit.0:
  ret void                                                                         ; inst 41
}

define void @floydWarshall([2500 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%27, %_11.while.exit.1]                          ; inst 2
  %3 = icmp ult i64 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i64 [0, %_2.while.body.0], [%26, %_10.while.exit.2]                     ; inst 6
  %5 = icmp ult i64 %4, %1                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_11.while.exit.1                        ; inst 8
_4.while.body.1:
  br label %_5.while.cond.2                                                        ; inst 9
_5.while.cond.2:
  %6 = phi i64 [0, %_4.while.body.1], [%25, %_9.if.exit.0]                         ; inst 10
  %7 = icmp ult i64 %6, %1                                                         ; inst 11
  br i1 %7, label %_6.while.body.2, label %_10.while.exit.2                        ; inst 12
_6.while.body.2:
  %8 = mul i64 %4, %1                                                              ; inst 13
  %9 = add i64 %8, %6                                                              ; inst 14
  %10 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %9                ; inst 15
  %11 = load i32, i32* %10                                                         ; inst 16
  %12 = mul i64 %4, %1                                                             ; inst 17
  %13 = add i64 %12, %2                                                            ; inst 18
  %14 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %13               ; inst 19
  %15 = load i32, i32* %14                                                         ; inst 20
  %16 = mul i64 %2, %1                                                             ; inst 21
  %17 = add i64 %16, %6                                                            ; inst 22
  %18 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %17               ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = add i32 %15, %19                                                           ; inst 25
  %21 = icmp slt i32 %20, %11                                                      ; inst 26
  br i1 %21, label %_7.if.then.0, label %_8.if.else.0                              ; inst 27
_7.if.then.0:
  %22 = mul i64 %4, %1                                                             ; inst 28
  %23 = add i64 %22, %6                                                            ; inst 29
  %24 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %23               ; inst 30
  store i32 %20, i32* %24                                                          ; inst 31
  br label %_9.if.exit.0                                                           ; inst 32
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 33
_9.if.exit.0:
  %25 = add i64 %6, 1                                                              ; inst 34
  br label %_5.while.cond.2                                                        ; inst 35
_10.while.exit.2:
  %26 = add i64 %4, 1                                                              ; inst 36
  br label %_3.while.cond.1                                                        ; inst 37
_11.while.exit.1:
  %27 = add i64 %2, 1                                                              ; inst 38
  br label %_1.while.cond.0                                                        ; inst 39
_12.while.exit.0:
  ret void                                                                         ; inst 40
}

define i32 @performConnectivityTest() {
_0.entry.0:
  %0 = alloca [2500 x i32]                                                         ; inst 1
  %1 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 2500                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  call void @initializeRandomGraph([2500 x i32]* %0, i64 50)                       ; inst 11
  %6 = call i32 @countConnectedComponents([2500 x i32]* %0, i64 50)                ; inst 12
  ret i32 %6                                                                       ; inst 13
}

define i32 @countConnectedComponents([2500 x i32]* %0, i64 %1) {
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
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%15, %_8.if.exit.0]                         ; inst 12
  %9 = phi i64 [0, %_3.array.exit.0], [%16, %_8.if.exit.0]                         ; inst 13
  %10 = icmp ult i64 %9, %1                                                        ; inst 14
  br i1 %10, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 15
_5.while.body.0:
  %11 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %9                    ; inst 16
  %12 = load i32, i32* %11                                                         ; inst 17
  %13 = icmp eq i32 %12, 0                                                         ; inst 18
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 19
_6.if.then.0:
  %14 = add i32 %8, 1                                                              ; inst 20
  call void @dfsMarkComponent([2500 x i32]* %0, [50 x i32]* %2, i64 %1, i64 %9)    ; inst 21
  br label %_8.if.exit.0                                                           ; inst 22
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 23
_8.if.exit.0:
  %15 = phi i32 [%14, %_6.if.then.0], [%8, %_7.if.else.0]                          ; inst 24
  %16 = add i64 %9, 1                                                              ; inst 25
  br label %_4.while.cond.0                                                        ; inst 26
_9.while.exit.0:
  ret i32 %8                                                                       ; inst 27
}

define void @dfsMarkComponent([2500 x i32]* %0, [50 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %3                     ; inst 1
  store i32 1, i32* %4                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i64 [0, %_0.entry.0], [%16, %_8.if.exit.0]                              ; inst 4
  %6 = icmp ult i64 %5, %2                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %7 = mul i64 %3, %2                                                              ; inst 7
  %8 = add i64 %7, %5                                                              ; inst 8
  %9 = getelementptr [2500 x i32], [2500 x i32]* %0, i32 0, i64 %8                 ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = icmp eq i32 %10, 1                                                         ; inst 11
  br i1 %11, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 12
_3.lazy.then.0:
  %12 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %5                    ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = icmp eq i32 %13, 0                                                         ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %15 = phi i1 [%14, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 18
  br i1 %15, label %_6.if.then.0, label %_7.if.else.0                              ; inst 19
_6.if.then.0:
  call void @dfsMarkComponent([2500 x i32]* %0, [50 x i32]* %1, i64 %2, i64 %5)    ; inst 20
  br label %_8.if.exit.0                                                           ; inst 21
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 22
_8.if.exit.0:
  %16 = add i64 %5, 1                                                              ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_9.while.exit.0:
  ret void                                                                         ; inst 25
}

define void @performDynamicProgramming() {
_0.entry.0:
  call void @printlnInt(i32 2005)                                                  ; inst 1
  %0 = call i32 @longestCommonSubsequence()                                        ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @knapsackProblem()                                                 ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @editDistance()                                                    ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  call void @printlnInt(i32 2006)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @longestCommonSubsequence() {
_0.entry.0:
  %0 = alloca [30 x i32]                                                           ; inst 1
  %1 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 30                                                         ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [25 x i32]                                                           ; inst 11
  %7 = getelementptr [25 x i32], [25 x i32]* %6, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 25                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [806 x i32]                                                         ; inst 21
  %13 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i32 0                  ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 806                                                      ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  call void @initializeStrings([30 x i32]* %0, [25 x i32]* %6, i32 17, i32 23)     ; inst 31
  br label %_10.while.cond.0                                                       ; inst 32
_10.while.cond.0:
  %18 = phi i64 [1, %_9.array.exit.2], [%57, %_20.while.exit.1]                    ; inst 33
  %19 = icmp ule i64 %18, 30                                                       ; inst 34
  br i1 %19, label %_11.while.body.0, label %_21.while.exit.0                      ; inst 35
_11.while.body.0:
  br label %_12.while.cond.1                                                       ; inst 36
_12.while.cond.1:
  %20 = phi i64 [1, %_11.while.body.0], [%56, %_19.if.exit.0]                      ; inst 37
  %21 = icmp ule i64 %20, 25                                                       ; inst 38
  br i1 %21, label %_13.while.body.1, label %_20.while.exit.1                      ; inst 39
_13.while.body.1:
  %22 = sub i64 %18, 1                                                             ; inst 40
  %23 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %22                   ; inst 41
  %24 = load i32, i32* %23                                                         ; inst 42
  %25 = sub i64 %20, 1                                                             ; inst 43
  %26 = getelementptr [25 x i32], [25 x i32]* %6, i32 0, i64 %25                   ; inst 44
  %27 = load i32, i32* %26                                                         ; inst 45
  %28 = icmp eq i32 %24, %27                                                       ; inst 46
  br i1 %28, label %_14.if.then.0, label %_15.if.else.0                            ; inst 47
_14.if.then.0:
  %29 = mul i64 %18, 26                                                            ; inst 48
  %30 = add i64 %29, %20                                                           ; inst 49
  %31 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i64 %30                ; inst 50
  %32 = sub i64 %18, 1                                                             ; inst 51
  %33 = mul i64 %32, 26                                                            ; inst 52
  %34 = sub i64 %20, 1                                                             ; inst 53
  %35 = add i64 %33, %34                                                           ; inst 54
  %36 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i64 %35                ; inst 55
  %37 = load i32, i32* %36                                                         ; inst 56
  %38 = add i32 %37, 1                                                             ; inst 57
  store i32 %38, i32* %31                                                          ; inst 58
  br label %_19.if.exit.0                                                          ; inst 59
_15.if.else.0:
  %39 = sub i64 %18, 1                                                             ; inst 60
  %40 = mul i64 %39, 26                                                            ; inst 61
  %41 = add i64 %40, %20                                                           ; inst 62
  %42 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i64 %41                ; inst 63
  %43 = load i32, i32* %42                                                         ; inst 64
  %44 = mul i64 %18, 26                                                            ; inst 65
  %45 = sub i64 %20, 1                                                             ; inst 66
  %46 = add i64 %44, %45                                                           ; inst 67
  %47 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i64 %46                ; inst 68
  %48 = load i32, i32* %47                                                         ; inst 69
  %49 = icmp sgt i32 %43, %48                                                      ; inst 70
  br i1 %49, label %_16.if.then.1, label %_17.if.else.1                            ; inst 71
_16.if.then.1:
  %50 = mul i64 %18, 26                                                            ; inst 72
  %51 = add i64 %50, %20                                                           ; inst 73
  %52 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i64 %51                ; inst 74
  store i32 %43, i32* %52                                                          ; inst 75
  br label %_18.if.exit.1                                                          ; inst 76
_17.if.else.1:
  %53 = mul i64 %18, 26                                                            ; inst 77
  %54 = add i64 %53, %20                                                           ; inst 78
  %55 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i64 %54                ; inst 79
  store i32 %48, i32* %55                                                          ; inst 80
  br label %_18.if.exit.1                                                          ; inst 81
_18.if.exit.1:
  br label %_19.if.exit.0                                                          ; inst 82
_19.if.exit.0:
  %56 = add i64 %20, 1                                                             ; inst 83
  br label %_12.while.cond.1                                                       ; inst 84
_20.while.exit.1:
  %57 = add i64 %18, 1                                                             ; inst 85
  br label %_10.while.cond.0                                                       ; inst 86
_21.while.exit.0:
  %58 = getelementptr [806 x i32], [806 x i32]* %12, i32 0, i64 805                ; inst 87
  %59 = load i32, i32* %58                                                         ; inst 88
  ret i32 %59                                                                      ; inst 89
}

define void @initializeStrings([30 x i32]* %0, [25 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca i32                                                                  ; inst 1
  store i32 %2, i32* %4                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i64 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 4
  %6 = icmp ult i64 %5, 30                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @update(i32* %4)                                                       ; inst 7
  %7 = getelementptr [30 x i32], [30 x i32]* %0, i32 0, i64 %5                     ; inst 8
  %8 = load i32, i32* %4                                                           ; inst 9
  %9 = srem i32 %8, 26                                                             ; inst 10
  store i32 %9, i32* %7                                                            ; inst 11
  %10 = add i64 %5, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %11 = alloca i32                                                                 ; inst 14
  store i32 %3, i32* %11                                                           ; inst 15
  br label %_4.while.cond.1                                                        ; inst 16
_4.while.cond.1:
  %12 = phi i64 [0, %_3.while.exit.0], [%17, %_5.while.body.1]                     ; inst 17
  %13 = icmp ult i64 %12, 25                                                       ; inst 18
  br i1 %13, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 19
_5.while.body.1:
  call void @update(i32* %11)                                                      ; inst 20
  %14 = getelementptr [25 x i32], [25 x i32]* %1, i32 0, i64 %12                   ; inst 21
  %15 = load i32, i32* %11                                                         ; inst 22
  %16 = srem i32 %15, 26                                                           ; inst 23
  store i32 %16, i32* %14                                                          ; inst 24
  %17 = add i64 %12, 1                                                             ; inst 25
  br label %_4.while.cond.1                                                        ; inst 26
_6.while.exit.1:
  ret void                                                                         ; inst 27
}

define i32 @knapsackProblem() {
_0.entry.0:
  %0 = alloca [20 x i32]                                                           ; inst 1
  %1 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 20                                                         ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [20 x i32]                                                           ; inst 11
  %7 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 20                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [2121 x i32]                                                        ; inst 21
  %13 = getelementptr [2121 x i32], [2121 x i32]* %12, i32 0, i32 0                ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 2121                                                     ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  call void @initializeKnapsackItems([20 x i32]* %0, [20 x i32]* %6, i64 20)       ; inst 31
  br label %_10.while.cond.0                                                       ; inst 32
_10.while.cond.0:
  %18 = phi i64 [1, %_9.array.exit.2], [%57, %_20.while.exit.1]                    ; inst 33
  %19 = icmp ule i64 %18, 20                                                       ; inst 34
  br i1 %19, label %_11.while.body.0, label %_21.while.exit.0                      ; inst 35
_11.while.body.0:
  br label %_12.while.cond.1                                                       ; inst 36
_12.while.cond.1:
  %20 = phi i64 [1, %_11.while.body.0], [%56, %_19.if.exit.0]                      ; inst 37
  %21 = icmp ule i64 %20, 100                                                      ; inst 38
  br i1 %21, label %_13.while.body.1, label %_20.while.exit.1                      ; inst 39
_13.while.body.1:
  %22 = sub i64 %18, 1                                                             ; inst 40
  %23 = mul i64 %22, 101                                                           ; inst 41
  %24 = add i64 %23, %20                                                           ; inst 42
  %25 = getelementptr [2121 x i32], [2121 x i32]* %12, i32 0, i64 %24              ; inst 43
  %26 = load i32, i32* %25                                                         ; inst 44
  %27 = sub i64 %18, 1                                                             ; inst 45
  %28 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %27                   ; inst 46
  %29 = load i32, i32* %28                                                         ; inst 47
  %30 = trunc i64 %20 to i32                                                       ; inst 48
  %31 = icmp sle i32 %29, %30                                                      ; inst 49
  br i1 %31, label %_14.if.then.0, label %_18.if.else.0                            ; inst 50
_14.if.then.0:
  %32 = sub i64 %18, 1                                                             ; inst 51
  %33 = getelementptr [20 x i32], [20 x i32]* %6, i32 0, i64 %32                   ; inst 52
  %34 = load i32, i32* %33                                                         ; inst 53
  %35 = sub i64 %18, 1                                                             ; inst 54
  %36 = mul i64 %35, 101                                                           ; inst 55
  %37 = sub i64 %18, 1                                                             ; inst 56
  %38 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %37                   ; inst 57
  %39 = load i32, i32* %38                                                         ; inst 58
  %40 = sext i32 %39 to i64                                                        ; inst 59
  %41 = sub i64 %20, %40                                                           ; inst 60
  %42 = add i64 %36, %41                                                           ; inst 61
  %43 = getelementptr [2121 x i32], [2121 x i32]* %12, i32 0, i64 %42              ; inst 62
  %44 = load i32, i32* %43                                                         ; inst 63
  %45 = add i32 %34, %44                                                           ; inst 64
  %46 = icmp sgt i32 %45, %26                                                      ; inst 65
  br i1 %46, label %_15.if.then.1, label %_16.if.else.1                            ; inst 66
_15.if.then.1:
  %47 = mul i64 %18, 101                                                           ; inst 67
  %48 = add i64 %47, %20                                                           ; inst 68
  %49 = getelementptr [2121 x i32], [2121 x i32]* %12, i32 0, i64 %48              ; inst 69
  store i32 %45, i32* %49                                                          ; inst 70
  br label %_17.if.exit.1                                                          ; inst 71
_16.if.else.1:
  %50 = mul i64 %18, 101                                                           ; inst 72
  %51 = add i64 %50, %20                                                           ; inst 73
  %52 = getelementptr [2121 x i32], [2121 x i32]* %12, i32 0, i64 %51              ; inst 74
  store i32 %26, i32* %52                                                          ; inst 75
  br label %_17.if.exit.1                                                          ; inst 76
_17.if.exit.1:
  br label %_19.if.exit.0                                                          ; inst 77
_18.if.else.0:
  %53 = mul i64 %18, 101                                                           ; inst 78
  %54 = add i64 %53, %20                                                           ; inst 79
  %55 = getelementptr [2121 x i32], [2121 x i32]* %12, i32 0, i64 %54              ; inst 80
  store i32 %26, i32* %55                                                          ; inst 81
  br label %_19.if.exit.0                                                          ; inst 82
_19.if.exit.0:
  %56 = add i64 %20, 1                                                             ; inst 83
  br label %_12.while.cond.1                                                       ; inst 84
_20.while.exit.1:
  %57 = add i64 %18, 1                                                             ; inst 85
  br label %_10.while.cond.0                                                       ; inst 86
_21.while.exit.0:
  %58 = getelementptr [2121 x i32], [2121 x i32]* %12, i32 0, i64 2120             ; inst 87
  %59 = load i32, i32* %58                                                         ; inst 88
  ret i32 %59                                                                      ; inst 89
}

define void @initializeKnapsackItems([20 x i32]* %0, [20 x i32]* %1, i64 %2) {
_0.entry.0:
  %3 = alloca i32                                                                  ; inst 1
  store i32 98765, i32* %3                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i64 [0, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 4
  %5 = icmp ult i64 %4, %2                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @update(i32* %3)                                                       ; inst 7
  %6 = getelementptr [20 x i32], [20 x i32]* %0, i32 0, i64 %4                     ; inst 8
  %7 = load i32, i32* %3                                                           ; inst 9
  %8 = srem i32 %7, 20                                                             ; inst 10
  %9 = add i32 %8, 1                                                               ; inst 11
  store i32 %9, i32* %6                                                            ; inst 12
  call void @update(i32* %3)                                                       ; inst 13
  %10 = getelementptr [20 x i32], [20 x i32]* %1, i32 0, i64 %4                    ; inst 14
  %11 = load i32, i32* %3                                                          ; inst 15
  %12 = srem i32 %11, 50                                                           ; inst 16
  %13 = add i32 %12, 1                                                             ; inst 17
  store i32 %13, i32* %10                                                          ; inst 18
  %14 = add i64 %4, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_3.while.exit.0:
  ret void                                                                         ; inst 21
}

define i32 @editDistance() {
_0.entry.0:
  %0 = alloca [15 x i32]                                                           ; inst 1
  %1 = getelementptr [15 x i32], [15 x i32]* %0, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 15                                                         ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [12 x i32]                                                           ; inst 11
  %7 = getelementptr [12 x i32], [12 x i32]* %6, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 12                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [208 x i32]                                                         ; inst 21
  %13 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i32 0                  ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 208                                                      ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  call void @initializeEditStrings([15 x i32]* %0, [12 x i32]* %6, i64 15, i64 12) ; inst 31
  br label %_10.while.cond.0                                                       ; inst 32
_10.while.cond.0:
  %18 = phi i64 [0, %_9.array.exit.2], [%23, %_11.while.body.0]                    ; inst 33
  %19 = icmp ule i64 %18, 15                                                       ; inst 34
  br i1 %19, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 35
_11.while.body.0:
  %20 = mul i64 %18, 13                                                            ; inst 36
  %21 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %20                ; inst 37
  %22 = trunc i64 %18 to i32                                                       ; inst 38
  store i32 %22, i32* %21                                                          ; inst 39
  %23 = add i64 %18, 1                                                             ; inst 40
  br label %_10.while.cond.0                                                       ; inst 41
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 42
_13.while.cond.1:
  %24 = phi i64 [0, %_12.while.exit.0], [%28, %_14.while.body.1]                   ; inst 43
  %25 = icmp ule i64 %24, 12                                                       ; inst 44
  br i1 %25, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 45
_14.while.body.1:
  %26 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %24                ; inst 46
  %27 = trunc i64 %24 to i32                                                       ; inst 47
  store i32 %27, i32* %26                                                          ; inst 48
  %28 = add i64 %24, 1                                                             ; inst 49
  br label %_13.while.cond.1                                                       ; inst 50
_15.while.exit.1:
  br label %_16.while.cond.2                                                       ; inst 51
_16.while.cond.2:
  %29 = phi i64 [1, %_15.while.exit.1], [%73, %_23.while.exit.3]                   ; inst 52
  %30 = icmp ule i64 %29, 15                                                       ; inst 53
  br i1 %30, label %_17.while.body.2, label %_24.while.exit.2                      ; inst 54
_17.while.body.2:
  br label %_18.while.cond.3                                                       ; inst 55
_18.while.cond.3:
  %31 = phi i64 [1, %_17.while.body.2], [%72, %_22.if.exit.0]                      ; inst 56
  %32 = icmp ule i64 %31, 12                                                       ; inst 57
  br i1 %32, label %_19.while.body.3, label %_23.while.exit.3                      ; inst 58
_19.while.body.3:
  %33 = sub i64 %29, 1                                                             ; inst 59
  %34 = getelementptr [15 x i32], [15 x i32]* %0, i32 0, i64 %33                   ; inst 60
  %35 = load i32, i32* %34                                                         ; inst 61
  %36 = sub i64 %31, 1                                                             ; inst 62
  %37 = getelementptr [12 x i32], [12 x i32]* %6, i32 0, i64 %36                   ; inst 63
  %38 = load i32, i32* %37                                                         ; inst 64
  %39 = icmp eq i32 %35, %38                                                       ; inst 65
  br i1 %39, label %_20.if.then.0, label %_21.if.else.0                            ; inst 66
_20.if.then.0:
  %40 = mul i64 %29, 13                                                            ; inst 67
  %41 = add i64 %40, %31                                                           ; inst 68
  %42 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %41                ; inst 69
  %43 = sub i64 %29, 1                                                             ; inst 70
  %44 = mul i64 %43, 13                                                            ; inst 71
  %45 = sub i64 %31, 1                                                             ; inst 72
  %46 = add i64 %44, %45                                                           ; inst 73
  %47 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %46                ; inst 74
  %48 = load i32, i32* %47                                                         ; inst 75
  store i32 %48, i32* %42                                                          ; inst 76
  br label %_22.if.exit.0                                                          ; inst 77
_21.if.else.0:
  %49 = mul i64 %29, 13                                                            ; inst 78
  %50 = sub i64 %31, 1                                                             ; inst 79
  %51 = add i64 %49, %50                                                           ; inst 80
  %52 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %51                ; inst 81
  %53 = load i32, i32* %52                                                         ; inst 82
  %54 = add i32 %53, 1                                                             ; inst 83
  %55 = sub i64 %29, 1                                                             ; inst 84
  %56 = mul i64 %55, 13                                                            ; inst 85
  %57 = add i64 %56, %31                                                           ; inst 86
  %58 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %57                ; inst 87
  %59 = load i32, i32* %58                                                         ; inst 88
  %60 = add i32 %59, 1                                                             ; inst 89
  %61 = sub i64 %29, 1                                                             ; inst 90
  %62 = mul i64 %61, 13                                                            ; inst 91
  %63 = sub i64 %31, 1                                                             ; inst 92
  %64 = add i64 %62, %63                                                           ; inst 93
  %65 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %64                ; inst 94
  %66 = load i32, i32* %65                                                         ; inst 95
  %67 = add i32 %66, 1                                                             ; inst 96
  %68 = call i32 @findMinimum(i32 %54, i32 %60, i32 %67)                           ; inst 97
  %69 = mul i64 %29, 13                                                            ; inst 98
  %70 = add i64 %69, %31                                                           ; inst 99
  %71 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 %70                ; inst 100
  store i32 %68, i32* %71                                                          ; inst 101
  br label %_22.if.exit.0                                                          ; inst 102
_22.if.exit.0:
  %72 = add i64 %31, 1                                                             ; inst 103
  br label %_18.while.cond.3                                                       ; inst 104
_23.while.exit.3:
  %73 = add i64 %29, 1                                                             ; inst 105
  br label %_16.while.cond.2                                                       ; inst 106
_24.while.exit.2:
  %74 = getelementptr [208 x i32], [208 x i32]* %12, i32 0, i64 207                ; inst 107
  %75 = load i32, i32* %74                                                         ; inst 108
  ret i32 %75                                                                      ; inst 109
}

define void @initializeEditStrings([15 x i32]* %0, [12 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = alloca i32                                                                  ; inst 1
  store i32 11111, i32* %4                                                         ; inst 2
  %5 = alloca i32                                                                  ; inst 3
  store i32 22222, i32* %5                                                         ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %6 = phi i64 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 6
  %7 = icmp ult i64 %6, %2                                                         ; inst 7
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  call void @update(i32* %4)                                                       ; inst 9
  %8 = getelementptr [15 x i32], [15 x i32]* %0, i32 0, i64 %6                     ; inst 10
  %9 = load i32, i32* %4                                                           ; inst 11
  %10 = srem i32 %9, 10                                                            ; inst 12
  store i32 %10, i32* %8                                                           ; inst 13
  %11 = add i64 %6, 1                                                              ; inst 14
  br label %_1.while.cond.0                                                        ; inst 15
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 16
_4.while.cond.1:
  %12 = phi i64 [0, %_3.while.exit.0], [%17, %_5.while.body.1]                     ; inst 17
  %13 = icmp ult i64 %12, %3                                                       ; inst 18
  br i1 %13, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 19
_5.while.body.1:
  call void @update(i32* %5)                                                       ; inst 20
  %14 = getelementptr [12 x i32], [12 x i32]* %1, i32 0, i64 %12                   ; inst 21
  %15 = load i32, i32* %5                                                          ; inst 22
  %16 = srem i32 %15, 10                                                           ; inst 23
  store i32 %16, i32* %14                                                          ; inst 24
  %17 = add i64 %12, 1                                                             ; inst 25
  br label %_4.while.cond.1                                                        ; inst 26
_6.while.exit.1:
  ret void                                                                         ; inst 27
}

define i32 @findMinimum(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %1, %0                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = phi i32 [%1, %_1.if.then.0], [%0, %_2.if.else.0]                            ; inst 5
  %5 = icmp slt i32 %2, %4                                                         ; inst 6
  br i1 %5, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 8
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 9
_6.if.exit.1:
  %6 = phi i32 [%2, %_4.if.then.1], [%4, %_5.if.else.1]                            ; inst 10
  ret i32 %6                                                                       ; inst 11
}

define void @performStateMachineSimulation() {
_0.entry.0:
  call void @printlnInt(i32 2007)                                                  ; inst 1
  %0 = call i32 @finiteStateAutomaton()                                            ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @trafficLightSimulation()                                          ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  call void @printlnInt(i32 2008)                                                  ; inst 6
  ret void                                                                         ; inst 7
}

define i32 @finiteStateAutomaton() {
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
  call void @generateInputSequence([1000 x i32]* %0, i64 1000)                     ; inst 11
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%16, %_8.if.exit.0]                         ; inst 13
  %7 = phi i32 [0, %_3.array.exit.0], [%12, %_8.if.exit.0]                         ; inst 14
  %8 = phi i64 [0, %_3.array.exit.0], [%17, %_8.if.exit.0]                         ; inst 15
  %9 = icmp ult i64 %8, 1000                                                       ; inst 16
  br i1 %9, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 17
_5.while.body.0:
  %10 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %8                ; inst 18
  %11 = load i32, i32* %10                                                         ; inst 19
  %12 = call i32 @stateTransition(i32 %7, i32 %11)                                 ; inst 20
  %13 = call i32 @isAcceptingState(i32 %12)                                        ; inst 21
  %14 = icmp eq i32 %13, 1                                                         ; inst 22
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  %15 = add i32 %6, 1                                                              ; inst 24
  br label %_8.if.exit.0                                                           ; inst 25
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 26
_8.if.exit.0:
  %16 = phi i32 [%15, %_6.if.then.0], [%6, %_7.if.else.0]                          ; inst 27
  %17 = add i64 %8, 1                                                              ; inst 28
  br label %_4.while.cond.0                                                        ; inst 29
_9.while.exit.0:
  ret i32 %6                                                                       ; inst 30
}

define void @generateInputSequence([1000 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca i32                                                                  ; inst 1
  store i32 13579, i32* %2                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i64 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 4
  %4 = icmp ult i64 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @update(i32* %2)                                                       ; inst 7
  %5 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %3                 ; inst 8
  %6 = load i32, i32* %2                                                           ; inst 9
  %7 = srem i32 %6, 4                                                              ; inst 10
  store i32 %7, i32* %5                                                            ; inst 11
  %8 = add i64 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define i32 @stateTransition(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_11.if.else.0                              ; inst 2
_1.if.then.0:
  %3 = icmp eq i32 %1, 0                                                           ; inst 3
  br i1 %3, label %_2.if.then.1, label %_3.if.else.1                               ; inst 4
_2.if.then.1:
  ret i32 1                                                                        ; inst 5
_3.if.else.1:
  %4 = icmp eq i32 %1, 1                                                           ; inst 6
  br i1 %4, label %_4.if.then.2, label %_5.if.else.2                               ; inst 7
_4.if.then.2:
  ret i32 2                                                                        ; inst 8
_5.if.else.2:
  %5 = icmp eq i32 %1, 2                                                           ; inst 9
  br i1 %5, label %_6.if.then.3, label %_7.if.else.3                               ; inst 10
_6.if.then.3:
  ret i32 3                                                                        ; inst 11
_7.if.else.3:
  ret i32 0                                                                        ; inst 12
_8.if.exit.3:
  br label %_9.if.exit.2                                                           ; inst 13
_9.if.exit.2:
  br label %_10.if.exit.1                                                          ; inst 14
_10.if.exit.1:
  br label %_93.if.exit.0                                                          ; inst 15
_11.if.else.0:
  %6 = icmp eq i32 %0, 1                                                           ; inst 16
  br i1 %6, label %_12.if.then.4, label %_22.if.else.4                             ; inst 17
_12.if.then.4:
  %7 = icmp eq i32 %1, 0                                                           ; inst 18
  br i1 %7, label %_13.if.then.5, label %_14.if.else.5                             ; inst 19
_13.if.then.5:
  ret i32 0                                                                        ; inst 20
_14.if.else.5:
  %8 = icmp eq i32 %1, 1                                                           ; inst 21
  br i1 %8, label %_15.if.then.6, label %_16.if.else.6                             ; inst 22
_15.if.then.6:
  ret i32 4                                                                        ; inst 23
_16.if.else.6:
  %9 = icmp eq i32 %1, 2                                                           ; inst 24
  br i1 %9, label %_17.if.then.7, label %_18.if.else.7                             ; inst 25
_17.if.then.7:
  ret i32 5                                                                        ; inst 26
_18.if.else.7:
  ret i32 1                                                                        ; inst 27
_19.if.exit.7:
  br label %_20.if.exit.6                                                          ; inst 28
_20.if.exit.6:
  br label %_21.if.exit.5                                                          ; inst 29
_21.if.exit.5:
  br label %_92.if.exit.4                                                          ; inst 30
_22.if.else.4:
  %10 = icmp eq i32 %0, 2                                                          ; inst 31
  br i1 %10, label %_23.if.then.8, label %_33.if.else.8                            ; inst 32
_23.if.then.8:
  %11 = icmp eq i32 %1, 0                                                          ; inst 33
  br i1 %11, label %_24.if.then.9, label %_25.if.else.9                            ; inst 34
_24.if.then.9:
  ret i32 6                                                                        ; inst 35
_25.if.else.9:
  %12 = icmp eq i32 %1, 1                                                          ; inst 36
  br i1 %12, label %_26.if.then.10, label %_27.if.else.10                          ; inst 37
_26.if.then.10:
  ret i32 0                                                                        ; inst 38
_27.if.else.10:
  %13 = icmp eq i32 %1, 2                                                          ; inst 39
  br i1 %13, label %_28.if.then.11, label %_29.if.else.11                          ; inst 40
_28.if.then.11:
  ret i32 7                                                                        ; inst 41
_29.if.else.11:
  ret i32 2                                                                        ; inst 42
_30.if.exit.11:
  br label %_31.if.exit.10                                                         ; inst 43
_31.if.exit.10:
  br label %_32.if.exit.9                                                          ; inst 44
_32.if.exit.9:
  br label %_91.if.exit.8                                                          ; inst 45
_33.if.else.8:
  %14 = icmp eq i32 %0, 3                                                          ; inst 46
  br i1 %14, label %_34.if.then.12, label %_44.if.else.12                          ; inst 47
_34.if.then.12:
  %15 = icmp eq i32 %1, 0                                                          ; inst 48
  br i1 %15, label %_35.if.then.13, label %_36.if.else.13                          ; inst 49
_35.if.then.13:
  ret i32 7                                                                        ; inst 50
_36.if.else.13:
  %16 = icmp eq i32 %1, 1                                                          ; inst 51
  br i1 %16, label %_37.if.then.14, label %_38.if.else.14                          ; inst 52
_37.if.then.14:
  ret i32 6                                                                        ; inst 53
_38.if.else.14:
  %17 = icmp eq i32 %1, 2                                                          ; inst 54
  br i1 %17, label %_39.if.then.15, label %_40.if.else.15                          ; inst 55
_39.if.then.15:
  ret i32 0                                                                        ; inst 56
_40.if.else.15:
  ret i32 3                                                                        ; inst 57
_41.if.exit.15:
  br label %_42.if.exit.14                                                         ; inst 58
_42.if.exit.14:
  br label %_43.if.exit.13                                                         ; inst 59
_43.if.exit.13:
  br label %_90.if.exit.12                                                         ; inst 60
_44.if.else.12:
  %18 = icmp eq i32 %0, 4                                                          ; inst 61
  br i1 %18, label %_45.if.then.16, label %_55.if.else.16                          ; inst 62
_45.if.then.16:
  %19 = icmp eq i32 %1, 0                                                          ; inst 63
  br i1 %19, label %_46.if.then.17, label %_47.if.else.17                          ; inst 64
_46.if.then.17:
  ret i32 2                                                                        ; inst 65
_47.if.else.17:
  %20 = icmp eq i32 %1, 1                                                          ; inst 66
  br i1 %20, label %_48.if.then.18, label %_49.if.else.18                          ; inst 67
_48.if.then.18:
  ret i32 1                                                                        ; inst 68
_49.if.else.18:
  %21 = icmp eq i32 %1, 2                                                          ; inst 69
  br i1 %21, label %_50.if.then.19, label %_51.if.else.19                          ; inst 70
_50.if.then.19:
  ret i32 4                                                                        ; inst 71
_51.if.else.19:
  ret i32 5                                                                        ; inst 72
_52.if.exit.19:
  br label %_53.if.exit.18                                                         ; inst 73
_53.if.exit.18:
  br label %_54.if.exit.17                                                         ; inst 74
_54.if.exit.17:
  br label %_89.if.exit.16                                                         ; inst 75
_55.if.else.16:
  %22 = icmp eq i32 %0, 5                                                          ; inst 76
  br i1 %22, label %_56.if.then.20, label %_66.if.else.20                          ; inst 77
_56.if.then.20:
  %23 = icmp eq i32 %1, 0                                                          ; inst 78
  br i1 %23, label %_57.if.then.21, label %_58.if.else.21                          ; inst 79
_57.if.then.21:
  ret i32 4                                                                        ; inst 80
_58.if.else.21:
  %24 = icmp eq i32 %1, 1                                                          ; inst 81
  br i1 %24, label %_59.if.then.22, label %_60.if.else.22                          ; inst 82
_59.if.then.22:
  ret i32 3                                                                        ; inst 83
_60.if.else.22:
  %25 = icmp eq i32 %1, 2                                                          ; inst 84
  br i1 %25, label %_61.if.then.23, label %_62.if.else.23                          ; inst 85
_61.if.then.23:
  ret i32 1                                                                        ; inst 86
_62.if.else.23:
  ret i32 6                                                                        ; inst 87
_63.if.exit.23:
  br label %_64.if.exit.22                                                         ; inst 88
_64.if.exit.22:
  br label %_65.if.exit.21                                                         ; inst 89
_65.if.exit.21:
  br label %_88.if.exit.20                                                         ; inst 90
_66.if.else.20:
  %26 = icmp eq i32 %0, 6                                                          ; inst 91
  br i1 %26, label %_67.if.then.24, label %_77.if.else.24                          ; inst 92
_67.if.then.24:
  %27 = icmp eq i32 %1, 0                                                          ; inst 93
  br i1 %27, label %_68.if.then.25, label %_69.if.else.25                          ; inst 94
_68.if.then.25:
  ret i32 5                                                                        ; inst 95
_69.if.else.25:
  %28 = icmp eq i32 %1, 1                                                          ; inst 96
  br i1 %28, label %_70.if.then.26, label %_71.if.else.26                          ; inst 97
_70.if.then.26:
  ret i32 7                                                                        ; inst 98
_71.if.else.26:
  %29 = icmp eq i32 %1, 2                                                          ; inst 99
  br i1 %29, label %_72.if.then.27, label %_73.if.else.27                          ; inst 100
_72.if.then.27:
  ret i32 2                                                                        ; inst 101
_73.if.else.27:
  ret i32 4                                                                        ; inst 102
_74.if.exit.27:
  br label %_75.if.exit.26                                                         ; inst 103
_75.if.exit.26:
  br label %_76.if.exit.25                                                         ; inst 104
_76.if.exit.25:
  br label %_87.if.exit.24                                                         ; inst 105
_77.if.else.24:
  %30 = icmp eq i32 %1, 0                                                          ; inst 106
  br i1 %30, label %_78.if.then.28, label %_79.if.else.28                          ; inst 107
_78.if.then.28:
  ret i32 3                                                                        ; inst 108
_79.if.else.28:
  %31 = icmp eq i32 %1, 1                                                          ; inst 109
  br i1 %31, label %_80.if.then.29, label %_81.if.else.29                          ; inst 110
_80.if.then.29:
  ret i32 5                                                                        ; inst 111
_81.if.else.29:
  %32 = icmp eq i32 %1, 2                                                          ; inst 112
  br i1 %32, label %_82.if.then.30, label %_83.if.else.30                          ; inst 113
_82.if.then.30:
  ret i32 6                                                                        ; inst 114
_83.if.else.30:
  ret i32 7                                                                        ; inst 115
_84.if.exit.30:
  br label %_85.if.exit.29                                                         ; inst 116
_85.if.exit.29:
  br label %_86.if.exit.28                                                         ; inst 117
_86.if.exit.28:
  br label %_87.if.exit.24                                                         ; inst 118
_87.if.exit.24:
  br label %_88.if.exit.20                                                         ; inst 119
_88.if.exit.20:
  br label %_89.if.exit.16                                                         ; inst 120
_89.if.exit.16:
  br label %_90.if.exit.12                                                         ; inst 121
_90.if.exit.12:
  br label %_91.if.exit.8                                                          ; inst 122
_91.if.exit.8:
  br label %_92.if.exit.4                                                          ; inst 123
_92.if.exit.4:
  br label %_93.if.exit.0                                                          ; inst 124
_93.if.exit.0:
  unreachable                                                                      ; inst 125
}

define i32 @isAcceptingState(i32 %0) {
_0.entry.0:
  %1 = icmp eq i32 %0, 3                                                           ; inst 1
  br i1 %1, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %2 = icmp eq i32 %0, 5                                                           ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %3 = phi i1 [1, %_1.lazy.then.0], [%2, %_2.lazy.else.0]                          ; inst 6
  br i1 %3, label %_4.lazy.then.1, label %_5.lazy.else.1                           ; inst 7
_4.lazy.then.1:
  br label %_6.lazy.exit.1                                                         ; inst 8
_5.lazy.else.1:
  %4 = icmp eq i32 %0, 7                                                           ; inst 9
  br label %_6.lazy.exit.1                                                         ; inst 10
_6.lazy.exit.1:
  %5 = phi i1 [1, %_4.lazy.then.1], [%4, %_5.lazy.else.1]                          ; inst 11
  %6 = zext i1 %5 to i32                                                           ; inst 12
  ret i32 %6                                                                       ; inst 13
}

define i32 @trafficLightSimulation() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%16, %_5.if.exit.0]                              ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%12, %_5.if.exit.0]                              ; inst 3
  %2 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 4
  %3 = phi i32 [2, %_0.entry.0], [%14, %_5.if.exit.0]                              ; inst 5
  %4 = phi i32 [0, %_0.entry.0], [%15, %_5.if.exit.0]                              ; inst 6
  %5 = icmp slt i32 %0, 1000                                                       ; inst 7
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 8
_2.while.body.0:
  %6 = add i32 %2, 1                                                               ; inst 9
  %7 = call i32 @shouldChangeState(i32 %4, i32 %3, i32 %6, i32 %0)                 ; inst 10
  %8 = icmp eq i32 %7, 1                                                           ; inst 11
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 12
_3.if.then.0:
  %9 = call i32 @getNextTrafficState(i32 %4)                                       ; inst 13
  %10 = call i32 @getNextTrafficState(i32 %3)                                      ; inst 14
  %11 = add i32 %1, 1                                                              ; inst 15
  br label %_5.if.exit.0                                                           ; inst 16
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 17
_5.if.exit.0:
  %12 = phi i32 [%11, %_3.if.then.0], [%1, %_4.if.else.0]                          ; inst 18
  %13 = phi i32 [0, %_3.if.then.0], [%6, %_4.if.else.0]                            ; inst 19
  %14 = phi i32 [%10, %_3.if.then.0], [%3, %_4.if.else.0]                          ; inst 20
  %15 = phi i32 [%9, %_3.if.then.0], [%4, %_4.if.else.0]                           ; inst 21
  %16 = add i32 %0, 1                                                              ; inst 22
  br label %_1.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  ret i32 %1                                                                       ; inst 24
}

define i32 @shouldChangeState(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = srem i32 %3, 100                                                            ; inst 1
  %5 = sdiv i32 %4, 10                                                             ; inst 2
  %6 = icmp eq i32 %0, 2                                                           ; inst 3
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  %7 = add i32 30, %5                                                              ; inst 5
  %8 = icmp sge i32 %2, %7                                                         ; inst 6
  %9 = zext i1 %8 to i32                                                           ; inst 7
  ret i32 %9                                                                       ; inst 8
_2.if.else.0:
  %10 = icmp eq i32 %0, 1                                                          ; inst 9
  br i1 %10, label %_3.if.then.1, label %_4.if.else.1                              ; inst 10
_3.if.then.1:
  %11 = icmp sge i32 %2, 5                                                         ; inst 11
  %12 = zext i1 %11 to i32                                                         ; inst 12
  ret i32 %12                                                                      ; inst 13
_4.if.else.1:
  %13 = add i32 35, %5                                                             ; inst 14
  %14 = icmp sge i32 %2, %13                                                       ; inst 15
  %15 = zext i1 %14 to i32                                                         ; inst 16
  ret i32 %15                                                                      ; inst 17
_5.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 18
_6.if.exit.0:
  unreachable                                                                      ; inst 19
}

define i32 @getNextTrafficState(i32 %0) {
_0.entry.0:
  %1 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 2                                                                        ; inst 3
_2.if.else.0:
  %2 = icmp eq i32 %0, 1                                                           ; inst 4
  br i1 %2, label %_3.if.then.1, label %_4.if.else.1                               ; inst 5
_3.if.then.1:
  ret i32 0                                                                        ; inst 6
_4.if.else.1:
  ret i32 1                                                                        ; inst 7
_5.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 8
_6.if.exit.0:
  unreachable                                                                      ; inst 9
}

define void @performSearchAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 2009)                                                  ; inst 1
  %0 = call i32 @performBinarySearchTests()                                        ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @performPatternMatching()                                          ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  call void @printlnInt(i32 2010)                                                  ; inst 6
  ret void                                                                         ; inst 7
}

define i32 @performBinarySearchTests() {
_0.entry.0:
  %0 = alloca [500 x i32]                                                          ; inst 1
  %1 = alloca [500 x i32]                                                          ; inst 2
  %2 = alloca [500 x i32]                                                          ; inst 3
  %3 = alloca [500 x i32]                                                          ; inst 4
  %4 = getelementptr [500 x i32], [500 x i32]* %3, i32 0, i32 0                    ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 7
  %6 = icmp slt i32 %5, 500                                                        ; inst 8
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 9
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 10
  store i32 0, i32* %7                                                             ; inst 11
  %8 = add i32 %5, 1                                                               ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  call void @initializeSortedArray([500 x i32]* %3, i64 500)                       ; inst 14
  br label %_4.while.cond.0                                                        ; inst 15
_4.while.cond.0:
  %9 = phi i32 [0, %_3.array.exit.0], [%17, %_8.if.exit.0]                         ; inst 16
  %10 = phi i32 [0, %_3.array.exit.0], [%16, %_8.if.exit.0]                        ; inst 17
  %11 = icmp slt i32 %9, 100                                                       ; inst 18
  br i1 %11, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 19
_5.while.body.0:
  %12 = mul i32 %9, 10                                                             ; inst 20
  call void @memcpy([500 x i32]* %0, [500 x i32]* %3, i64 2000)                    ; inst 21
  %13 = call i32 @binarySearch([500 x i32]* %0, i64 500, i32 %12)                  ; inst 22
  %14 = icmp ne i32 %13, -1                                                        ; inst 23
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 24
_6.if.then.0:
  %15 = add i32 %10, 1                                                             ; inst 25
  br label %_8.if.exit.0                                                           ; inst 26
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 27
_8.if.exit.0:
  %16 = phi i32 [%15, %_6.if.then.0], [%10, %_7.if.else.0]                         ; inst 28
  %17 = add i32 %9, 1                                                              ; inst 29
  br label %_4.while.cond.0                                                        ; inst 30
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 31
_10.while.cond.1:
  %18 = phi i32 [0, %_9.while.exit.0], [%26, %_14.if.exit.1]                       ; inst 32
  %19 = phi i32 [%10, %_9.while.exit.0], [%25, %_14.if.exit.1]                     ; inst 33
  %20 = icmp slt i32 %18, 50                                                       ; inst 34
  br i1 %20, label %_11.while.body.1, label %_15.while.exit.1                      ; inst 35
_11.while.body.1:
  %21 = mul i32 %18, 20                                                            ; inst 36
  call void @memcpy([500 x i32]* %1, [500 x i32]* %3, i64 2000)                    ; inst 37
  %22 = call i32 @binarySearchFirst([500 x i32]* %1, i64 500, i32 %21)             ; inst 38
  %23 = icmp ne i32 %22, -1                                                        ; inst 39
  br i1 %23, label %_12.if.then.1, label %_13.if.else.1                            ; inst 40
_12.if.then.1:
  %24 = add i32 %19, %22                                                           ; inst 41
  br label %_14.if.exit.1                                                          ; inst 42
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 43
_14.if.exit.1:
  %25 = phi i32 [%24, %_12.if.then.1], [%19, %_13.if.else.1]                       ; inst 44
  %26 = add i32 %18, 1                                                             ; inst 45
  br label %_10.while.cond.1                                                       ; inst 46
_15.while.exit.1:
  br label %_16.while.cond.2                                                       ; inst 47
_16.while.cond.2:
  %27 = phi i32 [0, %_15.while.exit.1], [%35, %_20.if.exit.2]                      ; inst 48
  %28 = phi i32 [%19, %_15.while.exit.1], [%34, %_20.if.exit.2]                    ; inst 49
  %29 = icmp slt i32 %27, 50                                                       ; inst 50
  br i1 %29, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 51
_17.while.body.2:
  %30 = mul i32 %27, 20                                                            ; inst 52
  call void @memcpy([500 x i32]* %2, [500 x i32]* %3, i64 2000)                    ; inst 53
  %31 = call i32 @binarySearchLast([500 x i32]* %2, i64 500, i32 %30)              ; inst 54
  %32 = icmp ne i32 %31, -1                                                        ; inst 55
  br i1 %32, label %_18.if.then.2, label %_19.if.else.2                            ; inst 56
_18.if.then.2:
  %33 = add i32 %28, %31                                                           ; inst 57
  br label %_20.if.exit.2                                                          ; inst 58
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 59
_20.if.exit.2:
  %34 = phi i32 [%33, %_18.if.then.2], [%28, %_19.if.else.2]                       ; inst 60
  %35 = add i32 %27, 1                                                             ; inst 61
  br label %_16.while.cond.2                                                       ; inst 62
_21.while.exit.2:
  %36 = srem i32 %28, 10000                                                        ; inst 63
  ret i32 %36                                                                      ; inst 64
}

define void @initializeSortedArray([500 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %3 = icmp ult i64 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %2                   ; inst 5
  %5 = trunc i64 %2 to i32                                                         ; inst 6
  %6 = sdiv i32 %5, 5                                                              ; inst 7
  %7 = mul i32 %6, 10                                                              ; inst 8
  store i32 %7, i32* %4                                                            ; inst 9
  %8 = add i64 %2, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret void                                                                         ; inst 12
}

define i32 @binarySearch([500 x i32]* %0, i64 %1, i32 %2) {
_0.entry.0:
  %3 = sub i64 %1, 1                                                               ; inst 1
  %4 = trunc i64 %3 to i32                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i32 [%4, %_0.entry.0], [%21, %_8.if.exit.0]                             ; inst 4
  %6 = phi i32 [0, %_0.entry.0], [%22, %_8.if.exit.0]                              ; inst 5
  %7 = icmp sle i32 %6, %5                                                         ; inst 6
  br i1 %7, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %8 = sub i32 %5, %6                                                              ; inst 8
  %9 = sdiv i32 %8, 2                                                              ; inst 9
  %10 = add i32 %6, %9                                                             ; inst 10
  %11 = sext i32 %10 to i64                                                        ; inst 11
  %12 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %11                 ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = icmp eq i32 %13, %2                                                        ; inst 14
  br i1 %14, label %_3.if.then.0, label %_4.if.else.0                              ; inst 15
_3.if.then.0:
  ret i32 %10                                                                      ; inst 16
_4.if.else.0:
  %15 = sext i32 %10 to i64                                                        ; inst 17
  %16 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %15                 ; inst 18
  %17 = load i32, i32* %16                                                         ; inst 19
  %18 = icmp slt i32 %17, %2                                                       ; inst 20
  br i1 %18, label %_5.if.then.1, label %_6.if.else.1                              ; inst 21
_5.if.then.1:
  %19 = add i32 %10, 1                                                             ; inst 22
  br label %_7.if.exit.1                                                           ; inst 23
_6.if.else.1:
  %20 = sub i32 %10, 1                                                             ; inst 24
  br label %_7.if.exit.1                                                           ; inst 25
_7.if.exit.1:
  %21 = phi i32 [%5, %_5.if.then.1], [%20, %_6.if.else.1]                          ; inst 26
  %22 = phi i32 [%19, %_5.if.then.1], [%6, %_6.if.else.1]                          ; inst 27
  br label %_8.if.exit.0                                                           ; inst 28
_8.if.exit.0:
  br label %_1.while.cond.0                                                        ; inst 29
_9.while.exit.0:
  ret i32 -1                                                                       ; inst 30
}

define i32 @binarySearchFirst([500 x i32]* %0, i64 %1, i32 %2) {
_0.entry.0:
  %3 = sub i64 %1, 1                                                               ; inst 1
  %4 = trunc i64 %3 to i32                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i32 [-1, %_0.entry.0], [%25, %_8.if.exit.0]                             ; inst 4
  %6 = phi i32 [%4, %_0.entry.0], [%26, %_8.if.exit.0]                             ; inst 5
  %7 = phi i32 [0, %_0.entry.0], [%27, %_8.if.exit.0]                              ; inst 6
  %8 = icmp sle i32 %7, %6                                                         ; inst 7
  br i1 %8, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 8
_2.while.body.0:
  %9 = sub i32 %6, %7                                                              ; inst 9
  %10 = sdiv i32 %9, 2                                                             ; inst 10
  %11 = add i32 %7, %10                                                            ; inst 11
  %12 = sext i32 %11 to i64                                                        ; inst 12
  %13 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %12                 ; inst 13
  %14 = load i32, i32* %13                                                         ; inst 14
  %15 = icmp eq i32 %14, %2                                                        ; inst 15
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 16
_3.if.then.0:
  %16 = sub i32 %11, 1                                                             ; inst 17
  br label %_8.if.exit.0                                                           ; inst 18
_4.if.else.0:
  %17 = sext i32 %11 to i64                                                        ; inst 19
  %18 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %17                 ; inst 20
  %19 = load i32, i32* %18                                                         ; inst 21
  %20 = icmp slt i32 %19, %2                                                       ; inst 22
  br i1 %20, label %_5.if.then.1, label %_6.if.else.1                              ; inst 23
_5.if.then.1:
  %21 = add i32 %11, 1                                                             ; inst 24
  br label %_7.if.exit.1                                                           ; inst 25
_6.if.else.1:
  %22 = sub i32 %11, 1                                                             ; inst 26
  br label %_7.if.exit.1                                                           ; inst 27
_7.if.exit.1:
  %23 = phi i32 [%6, %_5.if.then.1], [%22, %_6.if.else.1]                          ; inst 28
  %24 = phi i32 [%21, %_5.if.then.1], [%7, %_6.if.else.1]                          ; inst 29
  br label %_8.if.exit.0                                                           ; inst 30
_8.if.exit.0:
  %25 = phi i32 [%11, %_3.if.then.0], [%5, %_7.if.exit.1]                          ; inst 31
  %26 = phi i32 [%16, %_3.if.then.0], [%23, %_7.if.exit.1]                         ; inst 32
  %27 = phi i32 [%7, %_3.if.then.0], [%24, %_7.if.exit.1]                          ; inst 33
  br label %_1.while.cond.0                                                        ; inst 34
_9.while.exit.0:
  ret i32 %5                                                                       ; inst 35
}

define i32 @binarySearchLast([500 x i32]* %0, i64 %1, i32 %2) {
_0.entry.0:
  %3 = sub i64 %1, 1                                                               ; inst 1
  %4 = trunc i64 %3 to i32                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i32 [-1, %_0.entry.0], [%25, %_8.if.exit.0]                             ; inst 4
  %6 = phi i32 [%4, %_0.entry.0], [%26, %_8.if.exit.0]                             ; inst 5
  %7 = phi i32 [0, %_0.entry.0], [%27, %_8.if.exit.0]                              ; inst 6
  %8 = icmp sle i32 %7, %6                                                         ; inst 7
  br i1 %8, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 8
_2.while.body.0:
  %9 = sub i32 %6, %7                                                              ; inst 9
  %10 = sdiv i32 %9, 2                                                             ; inst 10
  %11 = add i32 %7, %10                                                            ; inst 11
  %12 = sext i32 %11 to i64                                                        ; inst 12
  %13 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %12                 ; inst 13
  %14 = load i32, i32* %13                                                         ; inst 14
  %15 = icmp eq i32 %14, %2                                                        ; inst 15
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 16
_3.if.then.0:
  %16 = add i32 %11, 1                                                             ; inst 17
  br label %_8.if.exit.0                                                           ; inst 18
_4.if.else.0:
  %17 = sext i32 %11 to i64                                                        ; inst 19
  %18 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %17                 ; inst 20
  %19 = load i32, i32* %18                                                         ; inst 21
  %20 = icmp slt i32 %19, %2                                                       ; inst 22
  br i1 %20, label %_5.if.then.1, label %_6.if.else.1                              ; inst 23
_5.if.then.1:
  %21 = add i32 %11, 1                                                             ; inst 24
  br label %_7.if.exit.1                                                           ; inst 25
_6.if.else.1:
  %22 = sub i32 %11, 1                                                             ; inst 26
  br label %_7.if.exit.1                                                           ; inst 27
_7.if.exit.1:
  %23 = phi i32 [%6, %_5.if.then.1], [%22, %_6.if.else.1]                          ; inst 28
  %24 = phi i32 [%21, %_5.if.then.1], [%7, %_6.if.else.1]                          ; inst 29
  br label %_8.if.exit.0                                                           ; inst 30
_8.if.exit.0:
  %25 = phi i32 [%11, %_3.if.then.0], [%5, %_7.if.exit.1]                          ; inst 31
  %26 = phi i32 [%6, %_3.if.then.0], [%23, %_7.if.exit.1]                          ; inst 32
  %27 = phi i32 [%16, %_3.if.then.0], [%24, %_7.if.exit.1]                         ; inst 33
  br label %_1.while.cond.0                                                        ; inst 34
_9.while.exit.0:
  ret i32 %5                                                                       ; inst 35
}

define i32 @performPatternMatching() {
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
  %6 = alloca [10 x i32]                                                           ; inst 11
  %7 = getelementptr [10 x i32], [10 x i32]* %6, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 10                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  call void @initializeTextAndPattern([200 x i32]* %0, [10 x i32]* %6, i64 200, i64 10) ; inst 21
  %12 = call i32 @naivePatternMatching([200 x i32]* %0, [10 x i32]* %6, i64 200, i64 10) ; inst 22
  %13 = call i32 @kmpPatternMatching([200 x i32]* %0, [10 x i32]* %6, i64 200, i64 10) ; inst 23
  %14 = add i32 %12, %13                                                           ; inst 24
  ret i32 %14                                                                      ; inst 25
}

define void @initializeTextAndPattern([200 x i32]* %0, [10 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = alloca i32                                                                  ; inst 1
  store i32 24681, i32* %4                                                         ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i64 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 4
  %6 = icmp ult i64 %5, %2                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @update(i32* %4)                                                       ; inst 7
  %7 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %5                   ; inst 8
  %8 = load i32, i32* %4                                                           ; inst 9
  %9 = srem i32 %8, 5                                                              ; inst 10
  store i32 %9, i32* %7                                                            ; inst 11
  %10 = add i64 %5, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 14
_4.while.cond.1:
  %11 = phi i64 [0, %_3.while.exit.0], [%16, %_5.while.body.1]                     ; inst 15
  %12 = icmp ult i64 %11, %3                                                       ; inst 16
  br i1 %12, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 17
_5.while.body.1:
  call void @update(i32* %4)                                                       ; inst 18
  %13 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %11                   ; inst 19
  %14 = load i32, i32* %4                                                          ; inst 20
  %15 = srem i32 %14, 5                                                            ; inst 21
  store i32 %15, i32* %13                                                          ; inst 22
  %16 = add i64 %11, 1                                                             ; inst 23
  br label %_4.while.cond.1                                                        ; inst 24
_6.while.exit.1:
  ret void                                                                         ; inst 25
}

define i32 @naivePatternMatching([200 x i32]* %0, [10 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i64 [0, %_0.entry.0], [%21, %_11.if.exit.1]                             ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%20, %_11.if.exit.1]                             ; inst 3
  %6 = sub i64 %2, %3                                                              ; inst 4
  %7 = icmp ule i64 %4, %6                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %8 = phi i64 [0, %_2.while.body.0], [%16, %_7.if.exit.0]                         ; inst 8
  %9 = icmp ult i64 %8, %3                                                         ; inst 9
  br i1 %9, label %_4.while.body.1, label %_13.critical_edge.0                     ; inst 10
_4.while.body.1:
  %10 = add i64 %4, %8                                                             ; inst 11
  %11 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %10                 ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  %13 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %8                    ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = icmp ne i32 %12, %14                                                       ; inst 16
  br i1 %15, label %_5.if.then.0, label %_6.if.else.0                              ; inst 17
_5.if.then.0:
  br label %_8.while.exit.1                                                        ; inst 18
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 19
_7.if.exit.0:
  %16 = add i64 %8, 1                                                              ; inst 20
  br label %_3.while.cond.1                                                        ; inst 21
_8.while.exit.1:
  %17 = phi i32 [1, %_13.critical_edge.0], [0, %_5.if.then.0]                      ; inst 22
  %18 = icmp eq i32 %17, 1                                                         ; inst 23
  br i1 %18, label %_9.if.then.1, label %_10.if.else.1                             ; inst 24
_9.if.then.1:
  %19 = add i32 %5, 1                                                              ; inst 25
  br label %_11.if.exit.1                                                          ; inst 26
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 27
_11.if.exit.1:
  %20 = phi i32 [%19, %_9.if.then.1], [%5, %_10.if.else.1]                         ; inst 28
  %21 = add i64 %4, 1                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_12.while.exit.0:
  ret i32 %5                                                                       ; inst 31
_13.critical_edge.0:
  br label %_8.while.exit.1                                                        ; inst 32
}

define i32 @kmpPatternMatching([200 x i32]* %0, [10 x i32]* %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = alloca [10 x i64]                                                           ; inst 1
  %5 = getelementptr [10 x i64], [10 x i64]* %4, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 10                                                         ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i64, i64* %5, i32 %6                                          ; inst 7
  store i64 0, i64* %8                                                             ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  call void @computeLPSArray([10 x i32]* %1, i64 %3, [10 x i64]* %4)               ; inst 11
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %10 = phi i64 [0, %_3.array.exit.0], [%44, %_20.if.exit.1]                       ; inst 13
  %11 = phi i64 [0, %_3.array.exit.0], [%45, %_20.if.exit.1]                       ; inst 14
  %12 = phi i32 [0, %_3.array.exit.0], [%46, %_20.if.exit.1]                       ; inst 15
  %13 = icmp ult i64 %11, %2                                                       ; inst 16
  br i1 %13, label %_5.while.body.0, label %_21.while.exit.0                       ; inst 17
_5.while.body.0:
  %14 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %10                   ; inst 18
  %15 = load i32, i32* %14                                                         ; inst 19
  %16 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %11                 ; inst 20
  %17 = load i32, i32* %16                                                         ; inst 21
  %18 = icmp eq i32 %15, %17                                                       ; inst 22
  br i1 %18, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  %19 = add i64 %11, 1                                                             ; inst 24
  %20 = add i64 %10, 1                                                             ; inst 25
  br label %_8.if.exit.0                                                           ; inst 26
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 27
_8.if.exit.0:
  %21 = phi i64 [%20, %_6.if.then.0], [%10, %_7.if.else.0]                         ; inst 28
  %22 = phi i64 [%19, %_6.if.then.0], [%11, %_7.if.else.0]                         ; inst 29
  %23 = icmp eq i64 %21, %3                                                        ; inst 30
  br i1 %23, label %_9.if.then.1, label %_10.if.else.1                             ; inst 31
_9.if.then.1:
  %24 = add i32 %12, 1                                                             ; inst 32
  %25 = sub i64 %21, 1                                                             ; inst 33
  %26 = getelementptr [10 x i64], [10 x i64]* %4, i32 0, i64 %25                   ; inst 34
  %27 = load i64, i64* %26                                                         ; inst 35
  br label %_20.if.exit.1                                                          ; inst 36
_10.if.else.1:
  %28 = icmp ult i64 %22, %2                                                       ; inst 37
  br i1 %28, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 38
_11.lazy.then.0:
  %29 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i64 %21                   ; inst 39
  %30 = load i32, i32* %29                                                         ; inst 40
  %31 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %22                 ; inst 41
  %32 = load i32, i32* %31                                                         ; inst 42
  %33 = icmp ne i32 %30, %32                                                       ; inst 43
  br label %_13.lazy.exit.0                                                        ; inst 44
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 45
_13.lazy.exit.0:
  %34 = phi i1 [%33, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 46
  br i1 %34, label %_14.if.then.2, label %_18.if.else.2                            ; inst 47
_14.if.then.2:
  %35 = icmp ne i64 %21, 0                                                         ; inst 48
  br i1 %35, label %_15.if.then.3, label %_16.if.else.3                            ; inst 49
_15.if.then.3:
  %36 = sub i64 %21, 1                                                             ; inst 50
  %37 = getelementptr [10 x i64], [10 x i64]* %4, i32 0, i64 %36                   ; inst 51
  %38 = load i64, i64* %37                                                         ; inst 52
  br label %_17.if.exit.3                                                          ; inst 53
_16.if.else.3:
  %39 = add i64 %22, 1                                                             ; inst 54
  br label %_17.if.exit.3                                                          ; inst 55
_17.if.exit.3:
  %40 = phi i64 [%38, %_15.if.then.3], [%21, %_16.if.else.3]                       ; inst 56
  %41 = phi i64 [%22, %_15.if.then.3], [%39, %_16.if.else.3]                       ; inst 57
  br label %_19.if.exit.2                                                          ; inst 58
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 59
_19.if.exit.2:
  %42 = phi i64 [%40, %_17.if.exit.3], [%21, %_18.if.else.2]                       ; inst 60
  %43 = phi i64 [%41, %_17.if.exit.3], [%22, %_18.if.else.2]                       ; inst 61
  br label %_20.if.exit.1                                                          ; inst 62
_20.if.exit.1:
  %44 = phi i64 [%27, %_9.if.then.1], [%42, %_19.if.exit.2]                        ; inst 63
  %45 = phi i64 [%22, %_9.if.then.1], [%43, %_19.if.exit.2]                        ; inst 64
  %46 = phi i32 [%24, %_9.if.then.1], [%12, %_19.if.exit.2]                        ; inst 65
  br label %_4.while.cond.0                                                        ; inst 66
_21.while.exit.0:
  ret i32 %12                                                                      ; inst 67
}

define void @computeLPSArray([10 x i32]* %0, i64 %1, [10 x i64]* %2) {
_0.entry.0:
  %3 = getelementptr [10 x i64], [10 x i64]* %2, i32 0, i64 0                      ; inst 1
  store i64 0, i64* %3                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i64 [1, %_0.entry.0], [%23, %_8.if.exit.0]                              ; inst 4
  %5 = phi i64 [0, %_0.entry.0], [%24, %_8.if.exit.0]                              ; inst 5
  %6 = icmp ult i64 %4, %1                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 %4                     ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = getelementptr [10 x i32], [10 x i32]* %0, i32 0, i64 %5                     ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  %11 = icmp eq i32 %8, %10                                                        ; inst 12
  br i1 %11, label %_3.if.then.0, label %_4.if.else.0                              ; inst 13
_3.if.then.0:
  %12 = add i64 %5, 1                                                              ; inst 14
  %13 = getelementptr [10 x i64], [10 x i64]* %2, i32 0, i64 %4                    ; inst 15
  store i64 %12, i64* %13                                                          ; inst 16
  %14 = add i64 %4, 1                                                              ; inst 17
  br label %_8.if.exit.0                                                           ; inst 18
_4.if.else.0:
  %15 = icmp ne i64 %5, 0                                                          ; inst 19
  br i1 %15, label %_5.if.then.1, label %_6.if.else.1                              ; inst 20
_5.if.then.1:
  %16 = sub i64 %5, 1                                                              ; inst 21
  %17 = getelementptr [10 x i64], [10 x i64]* %2, i32 0, i64 %16                   ; inst 22
  %18 = load i64, i64* %17                                                         ; inst 23
  br label %_7.if.exit.1                                                           ; inst 24
_6.if.else.1:
  %19 = getelementptr [10 x i64], [10 x i64]* %2, i32 0, i64 %4                    ; inst 25
  store i64 0, i64* %19                                                            ; inst 26
  %20 = add i64 %4, 1                                                              ; inst 27
  br label %_7.if.exit.1                                                           ; inst 28
_7.if.exit.1:
  %21 = phi i64 [%4, %_5.if.then.1], [%20, %_6.if.else.1]                          ; inst 29
  %22 = phi i64 [%18, %_5.if.then.1], [%5, %_6.if.else.1]                          ; inst 30
  br label %_8.if.exit.0                                                           ; inst 31
_8.if.exit.0:
  %23 = phi i64 [%14, %_3.if.then.0], [%21, %_7.if.exit.1]                         ; inst 32
  %24 = phi i64 [%12, %_3.if.then.0], [%22, %_7.if.exit.1]                         ; inst 33
  br label %_1.while.cond.0                                                        ; inst 34
_9.while.exit.0:
  ret void                                                                         ; inst 35
}

define void @update(i32* %0) {
_0.entry.0:
  %1 = load i32, i32* %0                                                           ; inst 1
  %2 = mul i32 %1, 1103                                                            ; inst 2
  %3 = add i32 %2, 4721                                                            ; inst 3
  %4 = srem i32 %3, 1048583                                                        ; inst 4
  store i32 %4, i32* %0                                                            ; inst 5
  %5 = load i32, i32* %0                                                           ; inst 6
  %6 = icmp slt i32 %5, 0                                                          ; inst 7
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 8
_1.if.then.0:
  %7 = load i32, i32* %0                                                           ; inst 9
  %8 = sub i32 0, %7                                                               ; inst 10
  store i32 %8, i32* %0                                                            ; inst 11
  br label %_3.if.exit.0                                                           ; inst 12
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 13
_3.if.exit.0:
  ret void                                                                         ; inst 14
}

