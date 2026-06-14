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
  call void @printlnInt(i32 25000)                                                 ; inst 1
  call void @performBasicConsensusTest(i32 7)                                      ; inst 2
  call void @performByzantineFaultToleranceTest(i32 7, i32 2)                      ; inst 3
  call void @performNetworkPartitionTest(i32 7)                                    ; inst 4
  call void @performLeaderElectionTest(i32 7)                                      ; inst 5
  call void @performAsynchronousConsensusTest(i32 7, i32 100)                      ; inst 6
  call void @printlnInt(i32 25999)                                                 ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @performBasicConsensusTest(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 25001)                                                 ; inst 1
  %1 = alloca [7 x i32]                                                            ; inst 2
  %2 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i32 0                        ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 7                                                          ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [7 x i32]                                                            ; inst 12
  %8 = getelementptr [7 x i32], [7 x i32]* %7, i32 0, i32 0                        ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 7                                                         ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 18
  store i32 0, i32* %11                                                            ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [7 x i32]                                                           ; inst 22
  %14 = getelementptr [7 x i32], [7 x i32]* %13, i32 0, i32 0                      ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 25
  %16 = icmp slt i32 %15, 7                                                        ; inst 26
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 28
  store i32 -1, i32* %17                                                           ; inst 29
  %18 = add i32 %15, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %19 = alloca [7 x [100 x i32]]                                                   ; inst 32
  %20 = alloca [100 x i32]                                                         ; inst 33
  %21 = getelementptr [100 x i32], [100 x i32]* %20, i32 0, i32 0                  ; inst 34
  br label %_10.array.cond.3                                                       ; inst 35
_10.array.cond.3:
  %22 = phi i32 [0, %_9.array.exit.2], [%25, %_11.array.body.3]                    ; inst 36
  %23 = icmp slt i32 %22, 100                                                      ; inst 37
  br i1 %23, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 38
_11.array.body.3:
  %24 = getelementptr i32, i32* %21, i32 %22                                       ; inst 39
  store i32 0, i32* %24                                                            ; inst 40
  %25 = add i32 %22, 1                                                             ; inst 41
  br label %_10.array.cond.3                                                       ; inst 42
_12.array.exit.3:
  %26 = getelementptr [7 x [100 x i32]], [7 x [100 x i32]]* %19, i32 0, i32 0      ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 45
  %28 = icmp slt i32 %27, 7                                                        ; inst 46
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %29 = getelementptr [100 x i32], [100 x i32]* %26, i32 %27                       ; inst 48
  call void @memcpy([100 x i32]* %29, [100 x i32]* %20, i64 400)                   ; inst 49
  %30 = add i32 %27, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %31 = alloca [7 x i32]                                                           ; inst 52
  %32 = getelementptr [7 x i32], [7 x i32]* %31, i32 0, i32 0                      ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %33 = phi i32 [0, %_15.array.exit.4], [%36, %_17.array.body.5]                   ; inst 55
  %34 = icmp slt i32 %33, 7                                                        ; inst 56
  br i1 %34, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %35 = getelementptr i32, i32* %32, i32 %33                                       ; inst 58
  store i32 0, i32* %35                                                            ; inst 59
  %36 = add i32 %33, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  br label %_19.while.cond.0                                                       ; inst 62
_19.while.cond.0:
  %37 = phi i32 [0, %_18.array.exit.5], [%45, %_29.if.exit.0]                      ; inst 63
  %38 = icmp slt i32 %37, 50                                                       ; inst 64
  br i1 %38, label %_20.while.body.0, label %_30.while.exit.0                      ; inst 65
_20.while.body.0:
  %39 = call i32 @conductLeaderElection(i32 %0, [7 x i32]* %1, [7 x i32]* %7, [7 x i32]* %13) ; inst 66
  %40 = icmp sge i32 %39, 0                                                        ; inst 67
  br i1 %40, label %_21.if.then.0, label %_28.if.else.0                            ; inst 68
_21.if.then.0:
  %41 = call i1 @performLogReplication(i32 %39, i32 %0, [7 x [100 x i32]]* %19, [7 x i32]* %31) ; inst 69
  br i1 %41, label %_22.if.then.1, label %_26.if.else.1                            ; inst 70
_22.if.then.1:
  %42 = add i32 25000, %37                                                         ; inst 71
  call void @printlnInt(i32 %42)                                                   ; inst 72
  %43 = call i1 @verifyLogConsistency(i32 %0, [7 x [100 x i32]]* %19, [7 x i32]* %31) ; inst 73
  br i1 %43, label %_23.if.then.2, label %_24.if.else.2                            ; inst 74
_23.if.then.2:
  %44 = add i32 25100, %37                                                         ; inst 75
  call void @printlnInt(i32 %44)                                                   ; inst 76
  br label %_25.if.exit.2                                                          ; inst 77
_24.if.else.2:
  br label %_25.if.exit.2                                                          ; inst 78
_25.if.exit.2:
  br label %_27.if.exit.1                                                          ; inst 79
_26.if.else.1:
  br label %_27.if.exit.1                                                          ; inst 80
_27.if.exit.1:
  br label %_29.if.exit.0                                                          ; inst 81
_28.if.else.0:
  br label %_29.if.exit.0                                                          ; inst 82
_29.if.exit.0:
  %45 = add i32 %37, 1                                                             ; inst 83
  br label %_19.while.cond.0                                                       ; inst 84
_30.while.exit.0:
  call void @printlnInt(i32 25099)                                                 ; inst 85
  ret void                                                                         ; inst 86
}

define i32 @conductLeaderElection(i32 %0, [7 x i32]* %1, [7 x i32]* %2, [7 x i32]* %3) {
_0.entry.0:
  %4 = call i32 @findMaxTerm([7 x i32]* %2, i32 %0)                                ; inst 1
  %5 = add i32 %4, 1                                                               ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 4
  %7 = icmp slt i32 %6, %0                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 7
  %9 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %8                       ; inst 8
  store i32 -1, i32* %9                                                            ; inst 9
  %10 = add i32 %6, 1                                                              ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  %11 = alloca [7 x i1]                                                            ; inst 12
  %12 = getelementptr [7 x i1], [7 x i1]* %11, i32 0, i32 0                        ; inst 13
  br label %_4.array.cond.0                                                        ; inst 14
_4.array.cond.0:
  %13 = phi i32 [0, %_3.while.exit.0], [%16, %_5.array.body.0]                     ; inst 15
  %14 = icmp slt i32 %13, 7                                                        ; inst 16
  br i1 %14, label %_5.array.body.0, label %_6.array.exit.0                        ; inst 17
_5.array.body.0:
  %15 = getelementptr i1, i1* %12, i32 %13                                         ; inst 18
  store i1 0, i1* %15                                                              ; inst 19
  %16 = add i32 %13, 1                                                             ; inst 20
  br label %_4.array.cond.0                                                        ; inst 21
_6.array.exit.0:
  br label %_7.while.cond.1                                                        ; inst 22
_7.while.cond.1:
  %17 = phi i32 [0, %_6.array.exit.0], [%32, %_11.if.exit.0]                       ; inst 23
  %18 = icmp slt i32 %17, %0                                                       ; inst 24
  br i1 %18, label %_8.while.body.1, label %_12.while.exit.1                       ; inst 25
_8.while.body.1:
  %19 = sext i32 %17 to i64                                                        ; inst 26
  %20 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %19                     ; inst 27
  %21 = load i32, i32* %20                                                         ; inst 28
  %22 = sext i32 %17 to i64                                                        ; inst 29
  %23 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %22                     ; inst 30
  %24 = load i32, i32* %23                                                         ; inst 31
  %25 = call i1 @shouldBecomeCandidate(i32 %17, i32 %21, i32 %24, i32 %5)          ; inst 32
  br i1 %25, label %_9.if.then.0, label %_10.if.else.0                             ; inst 33
_9.if.then.0:
  %26 = sext i32 %17 to i64                                                        ; inst 34
  %27 = getelementptr [7 x i1], [7 x i1]* %11, i32 0, i64 %26                      ; inst 35
  store i1 1, i1* %27                                                              ; inst 36
  %28 = sext i32 %17 to i64                                                        ; inst 37
  %29 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %28                     ; inst 38
  store i32 1, i32* %29                                                            ; inst 39
  %30 = sext i32 %17 to i64                                                        ; inst 40
  %31 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %30                     ; inst 41
  store i32 %5, i32* %31                                                           ; inst 42
  br label %_11.if.exit.0                                                          ; inst 43
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 44
_11.if.exit.0:
  %32 = add i32 %17, 1                                                             ; inst 45
  br label %_7.while.cond.1                                                        ; inst 46
_12.while.exit.1:
  %33 = alloca [7 x i32]                                                           ; inst 47
  %34 = getelementptr [7 x i32], [7 x i32]* %33, i32 0, i32 0                      ; inst 48
  br label %_13.array.cond.1                                                       ; inst 49
_13.array.cond.1:
  %35 = phi i32 [0, %_12.while.exit.1], [%38, %_14.array.body.1]                   ; inst 50
  %36 = icmp slt i32 %35, 7                                                        ; inst 51
  br i1 %36, label %_14.array.body.1, label %_15.array.exit.1                      ; inst 52
_14.array.body.1:
  %37 = getelementptr i32, i32* %34, i32 %35                                       ; inst 53
  store i32 0, i32* %37                                                            ; inst 54
  %38 = add i32 %35, 1                                                             ; inst 55
  br label %_13.array.cond.1                                                       ; inst 56
_15.array.exit.1:
  br label %_16.while.cond.2                                                       ; inst 57
_16.while.cond.2:
  %39 = phi i32 [0, %_15.array.exit.1], [%57, %_26.if.exit.1]                      ; inst 58
  %40 = icmp slt i32 %39, %0                                                       ; inst 59
  br i1 %40, label %_17.while.body.2, label %_27.while.exit.2                      ; inst 60
_17.while.body.2:
  %41 = sext i32 %39 to i64                                                        ; inst 61
  %42 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %41                     ; inst 62
  %43 = load i32, i32* %42                                                         ; inst 63
  %44 = icmp ne i32 %43, 1                                                         ; inst 64
  br i1 %44, label %_18.if.then.1, label %_25.if.else.1                            ; inst 65
_18.if.then.1:
  %45 = call i32 @decideVote(i32 %39, i32 %0, [7 x i1]* %11, [7 x i32]* %2, i32 %5) ; inst 66
  %46 = icmp sge i32 %45, 0                                                        ; inst 67
  br i1 %46, label %_19.lazy.then.0, label %_20.lazy.else.0                        ; inst 68
_19.lazy.then.0:
  %47 = icmp slt i32 %45, %0                                                       ; inst 69
  br label %_21.lazy.exit.0                                                        ; inst 70
_20.lazy.else.0:
  br label %_21.lazy.exit.0                                                        ; inst 71
_21.lazy.exit.0:
  %48 = phi i1 [%47, %_19.lazy.then.0], [0, %_20.lazy.else.0]                      ; inst 72
  br i1 %48, label %_22.if.then.2, label %_23.if.else.2                            ; inst 73
_22.if.then.2:
  %49 = sext i32 %39 to i64                                                        ; inst 74
  %50 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %49                     ; inst 75
  store i32 %45, i32* %50                                                          ; inst 76
  %51 = sext i32 %45 to i64                                                        ; inst 77
  %52 = getelementptr [7 x i32], [7 x i32]* %33, i32 0, i64 %51                    ; inst 78
  %53 = sext i32 %45 to i64                                                        ; inst 79
  %54 = getelementptr [7 x i32], [7 x i32]* %33, i32 0, i64 %53                    ; inst 80
  %55 = load i32, i32* %54                                                         ; inst 81
  %56 = add i32 %55, 1                                                             ; inst 82
  store i32 %56, i32* %52                                                          ; inst 83
  br label %_24.if.exit.2                                                          ; inst 84
_23.if.else.2:
  br label %_24.if.exit.2                                                          ; inst 85
_24.if.exit.2:
  br label %_26.if.exit.1                                                          ; inst 86
_25.if.else.1:
  br label %_26.if.exit.1                                                          ; inst 87
_26.if.exit.1:
  %57 = add i32 %39, 1                                                             ; inst 88
  br label %_16.while.cond.2                                                       ; inst 89
_27.while.exit.2:
  br label %_28.while.cond.3                                                       ; inst 90
_28.while.cond.3:
  %58 = phi i32 [0, %_27.while.exit.2], [%71, %_32.if.exit.3]                      ; inst 91
  %59 = icmp slt i32 %58, %0                                                       ; inst 92
  br i1 %59, label %_29.while.body.3, label %_33.while.exit.3                      ; inst 93
_29.while.body.3:
  %60 = sext i32 %58 to i64                                                        ; inst 94
  %61 = getelementptr [7 x i1], [7 x i1]* %11, i32 0, i64 %60                      ; inst 95
  %62 = load i1, i1* %61                                                           ; inst 96
  br i1 %62, label %_30.if.then.3, label %_31.if.else.3                            ; inst 97
_30.if.then.3:
  %63 = sext i32 %58 to i64                                                        ; inst 98
  %64 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %63                     ; inst 99
  store i32 %58, i32* %64                                                          ; inst 100
  %65 = sext i32 %58 to i64                                                        ; inst 101
  %66 = getelementptr [7 x i32], [7 x i32]* %33, i32 0, i64 %65                    ; inst 102
  %67 = sext i32 %58 to i64                                                        ; inst 103
  %68 = getelementptr [7 x i32], [7 x i32]* %33, i32 0, i64 %67                    ; inst 104
  %69 = load i32, i32* %68                                                         ; inst 105
  %70 = add i32 %69, 1                                                             ; inst 106
  store i32 %70, i32* %66                                                          ; inst 107
  br label %_32.if.exit.3                                                          ; inst 108
_31.if.else.3:
  br label %_32.if.exit.3                                                          ; inst 109
_32.if.exit.3:
  %71 = add i32 %58, 1                                                             ; inst 110
  br label %_28.while.cond.3                                                       ; inst 111
_33.while.exit.3:
  %72 = sdiv i32 %0, 2                                                             ; inst 112
  %73 = add i32 %72, 1                                                             ; inst 113
  br label %_34.while.cond.4                                                       ; inst 114
_34.while.cond.4:
  %74 = phi i32 [0, %_33.while.exit.3], [%82, %_38.if.exit.4]                      ; inst 115
  %75 = icmp slt i32 %74, %0                                                       ; inst 116
  br i1 %75, label %_35.while.body.4, label %_40.critical_edge.0                   ; inst 117
_35.while.body.4:
  %76 = sext i32 %74 to i64                                                        ; inst 118
  %77 = getelementptr [7 x i32], [7 x i32]* %33, i32 0, i64 %76                    ; inst 119
  %78 = load i32, i32* %77                                                         ; inst 120
  %79 = icmp sge i32 %78, %73                                                      ; inst 121
  br i1 %79, label %_36.if.then.4, label %_37.if.else.4                            ; inst 122
_36.if.then.4:
  %80 = sext i32 %74 to i64                                                        ; inst 123
  %81 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %80                     ; inst 124
  store i32 2, i32* %81                                                            ; inst 125
  br label %_39.while.exit.4                                                       ; inst 126
_37.if.else.4:
  br label %_38.if.exit.4                                                          ; inst 127
_38.if.exit.4:
  %82 = add i32 %74, 1                                                             ; inst 128
  br label %_34.while.cond.4                                                       ; inst 129
_39.while.exit.4:
  %83 = phi i32 [-1, %_40.critical_edge.0], [%74, %_36.if.then.4]                  ; inst 130
  ret i32 %83                                                                      ; inst 131
_40.critical_edge.0:
  br label %_39.while.exit.4                                                       ; inst 132
}

define i32 @decideVote(i32 %0, i32 %1, [7 x i1]* %2, [7 x i32]* %3, i32 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.0]                              ; inst 2
  %6 = phi i32 [-1, %_0.entry.0], [%19, %_8.if.exit.0]                             ; inst 3
  %7 = phi i32 [-1, %_0.entry.0], [%20, %_8.if.exit.0]                             ; inst 4
  %8 = icmp slt i32 %5, %1                                                         ; inst 5
  br i1 %8, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %9 = sext i32 %5 to i64                                                          ; inst 7
  %10 = getelementptr [7 x i1], [7 x i1]* %2, i32 0, i64 %9                        ; inst 8
  %11 = load i1, i1* %10                                                           ; inst 9
  br i1 %11, label %_3.if.then.0, label %_7.if.else.0                              ; inst 10
_3.if.then.0:
  %12 = sext i32 %5 to i64                                                         ; inst 11
  %13 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %12                     ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = call i32 @calculateCandidateScore(i32 %5, i32 %0, i32 %14, i32 %4)         ; inst 14
  %16 = icmp sgt i32 %15, %6                                                       ; inst 15
  br i1 %16, label %_4.if.then.1, label %_5.if.else.1                              ; inst 16
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 17
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 18
_6.if.exit.1:
  %17 = phi i32 [%15, %_4.if.then.1], [%6, %_5.if.else.1]                          ; inst 19
  %18 = phi i32 [%5, %_4.if.then.1], [%7, %_5.if.else.1]                           ; inst 20
  br label %_8.if.exit.0                                                           ; inst 21
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 22
_8.if.exit.0:
  %19 = phi i32 [%17, %_6.if.exit.1], [%6, %_7.if.else.0]                          ; inst 23
  %20 = phi i32 [%18, %_6.if.exit.1], [%7, %_7.if.else.0]                          ; inst 24
  %21 = add i32 %5, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_9.while.exit.0:
  ret i32 %7                                                                       ; inst 27
}

define i32 @calculateCandidateScore(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = mul i32 %2, 100                                                             ; inst 1
  %5 = sub i32 %4, %0                                                              ; inst 2
  %6 = mul i32 %1, 7                                                               ; inst 3
  %7 = mul i32 %0, 11                                                              ; inst 4
  %8 = add i32 %6, %7                                                              ; inst 5
  %9 = srem i32 %8, 50                                                             ; inst 6
  %10 = add i32 %5, %9                                                             ; inst 7
  %11 = sub i32 %1, %0                                                             ; inst 8
  %12 = call i32 @abs(i32 %11)                                                     ; inst 9
  %13 = mul i32 %12, 5                                                             ; inst 10
  %14 = sub i32 %10, %13                                                           ; inst 11
  ret i32 %14                                                                      ; inst 12
}

define i1 @performLogReplication(i32 %0, i32 %1, [7 x [100 x i32]]* %2, [7 x i32]* %3) {
_0.entry.0:
  %4 = sext i32 %0 to i64                                                          ; inst 1
  %5 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %4                       ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = call i32 @generateLogEntry(i32 %0, i32 %6)                                  ; inst 4
  %8 = sext i32 %0 to i64                                                          ; inst 5
  %9 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %8                       ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = icmp slt i32 %10, 100                                                      ; inst 8
  br i1 %11, label %_1.if.then.0, label %_2.if.else.0                              ; inst 9
_1.if.then.0:
  %12 = sext i32 %0 to i64                                                         ; inst 10
  %13 = getelementptr [7 x [100 x i32]], [7 x [100 x i32]]* %2, i32 0, i64 %12     ; inst 11
  %14 = sext i32 %0 to i64                                                         ; inst 12
  %15 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %14                     ; inst 13
  %16 = load i32, i32* %15                                                         ; inst 14
  %17 = sext i32 %16 to i64                                                        ; inst 15
  %18 = getelementptr [100 x i32], [100 x i32]* %13, i32 0, i64 %17                ; inst 16
  store i32 %7, i32* %18                                                           ; inst 17
  %19 = sext i32 %0 to i64                                                         ; inst 18
  %20 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %19                     ; inst 19
  %21 = sext i32 %0 to i64                                                         ; inst 20
  %22 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %21                     ; inst 21
  %23 = load i32, i32* %22                                                         ; inst 22
  %24 = add i32 %23, 1                                                             ; inst 23
  store i32 %24, i32* %20                                                          ; inst 24
  br label %_3.if.exit.0                                                           ; inst 25
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 26
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 27
_4.while.cond.0:
  %25 = phi i32 [0, %_3.if.exit.0], [%33, %_11.if.exit.1]                          ; inst 28
  %26 = phi i32 [1, %_3.if.exit.0], [%32, %_11.if.exit.1]                          ; inst 29
  %27 = icmp slt i32 %25, %1                                                       ; inst 30
  br i1 %27, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 31
_5.while.body.0:
  %28 = icmp ne i32 %25, %0                                                        ; inst 32
  br i1 %28, label %_6.if.then.1, label %_10.if.else.1                             ; inst 33
_6.if.then.1:
  %29 = call i1 @replicateToFollower(i32 %0, i32 %25, i32 %7, [7 x [100 x i32]]* %2, [7 x i32]* %3) ; inst 34
  br i1 %29, label %_7.if.then.2, label %_8.if.else.2                              ; inst 35
_7.if.then.2:
  %30 = add i32 %26, 1                                                             ; inst 36
  br label %_9.if.exit.2                                                           ; inst 37
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 38
_9.if.exit.2:
  %31 = phi i32 [%30, %_7.if.then.2], [%26, %_8.if.else.2]                         ; inst 39
  br label %_11.if.exit.1                                                          ; inst 40
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 41
_11.if.exit.1:
  %32 = phi i32 [%31, %_9.if.exit.2], [%26, %_10.if.else.1]                        ; inst 42
  %33 = add i32 %25, 1                                                             ; inst 43
  br label %_4.while.cond.0                                                        ; inst 44
_12.while.exit.0:
  %34 = sdiv i32 %1, 2                                                             ; inst 45
  %35 = add i32 %34, 1                                                             ; inst 46
  %36 = icmp sge i32 %26, %35                                                      ; inst 47
  ret i1 %36                                                                       ; inst 48
}

define i1 @replicateToFollower(i32 %0, i32 %1, i32 %2, [7 x [100 x i32]]* %3, [7 x i32]* %4) {
_0.entry.0:
  %5 = call i1 @simulateNetworkReliability(i32 %0, i32 %1)                         ; inst 1
  %6 = icmp eq i1 %5, 0                                                            ; inst 2
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i1 0                                                                         ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %7 = call i1 @checkLogConsistency(i32 %0, i32 %1, [7 x [100 x i32]]* %3, [7 x i32]* %4) ; inst 6
  br i1 %7, label %_4.lazy.then.0, label %_5.lazy.else.0                           ; inst 7
_4.lazy.then.0:
  %8 = sext i32 %1 to i64                                                          ; inst 8
  %9 = getelementptr [7 x i32], [7 x i32]* %4, i32 0, i64 %8                       ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = icmp slt i32 %10, 100                                                      ; inst 11
  br label %_6.lazy.exit.0                                                         ; inst 12
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 13
_6.lazy.exit.0:
  %12 = phi i1 [%11, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 14
  br i1 %12, label %_7.if.then.1, label %_8.if.else.1                              ; inst 15
_7.if.then.1:
  %13 = sext i32 %1 to i64                                                         ; inst 16
  %14 = getelementptr [7 x [100 x i32]], [7 x [100 x i32]]* %3, i32 0, i64 %13     ; inst 17
  %15 = sext i32 %1 to i64                                                         ; inst 18
  %16 = getelementptr [7 x i32], [7 x i32]* %4, i32 0, i64 %15                     ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = sext i32 %17 to i64                                                        ; inst 21
  %19 = getelementptr [100 x i32], [100 x i32]* %14, i32 0, i64 %18                ; inst 22
  store i32 %2, i32* %19                                                           ; inst 23
  %20 = sext i32 %1 to i64                                                         ; inst 24
  %21 = getelementptr [7 x i32], [7 x i32]* %4, i32 0, i64 %20                     ; inst 25
  %22 = sext i32 %1 to i64                                                         ; inst 26
  %23 = getelementptr [7 x i32], [7 x i32]* %4, i32 0, i64 %22                     ; inst 27
  %24 = load i32, i32* %23                                                         ; inst 28
  %25 = add i32 %24, 1                                                             ; inst 29
  store i32 %25, i32* %21                                                          ; inst 30
  ret i1 1                                                                         ; inst 31
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 32
_9.if.exit.1:
  ret i1 0                                                                         ; inst 33
}

define void @performByzantineFaultToleranceTest(i32 %0, i32 %1) {
_0.entry.0:
  call void @printlnInt(i32 25201)                                                 ; inst 1
  %2 = alloca [7 x i1]                                                             ; inst 2
  %3 = getelementptr [7 x i1], [7 x i1]* %2, i32 0, i32 0                          ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 7                                                          ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 8
  store i1 0, i1* %6                                                               ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%18, %_11.if.exit.0]                        ; inst 13
  %9 = phi i32 [0, %_3.array.exit.0], [%17, %_11.if.exit.0]                        ; inst 14
  %10 = icmp slt i32 %8, %0                                                        ; inst 15
  br i1 %10, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 16
_5.lazy.then.0:
  %11 = icmp slt i32 %9, %1                                                        ; inst 17
  br label %_7.lazy.exit.0                                                         ; inst 18
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 19
_7.lazy.exit.0:
  %12 = phi i1 [%11, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 20
  br i1 %12, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 21
_8.while.body.0:
  %13 = call i1 @shouldBeByzantine(i32 %8)                                         ; inst 22
  br i1 %13, label %_9.if.then.0, label %_10.if.else.0                             ; inst 23
_9.if.then.0:
  %14 = sext i32 %8 to i64                                                         ; inst 24
  %15 = getelementptr [7 x i1], [7 x i1]* %2, i32 0, i64 %14                       ; inst 25
  store i1 1, i1* %15                                                              ; inst 26
  %16 = add i32 %9, 1                                                              ; inst 27
  br label %_11.if.exit.0                                                          ; inst 28
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 29
_11.if.exit.0:
  %17 = phi i32 [%16, %_9.if.then.0], [%9, %_10.if.else.0]                         ; inst 30
  %18 = add i32 %8, 1                                                              ; inst 31
  br label %_4.while.cond.0                                                        ; inst 32
_12.while.exit.0:
  %19 = alloca [7 x i32]                                                           ; inst 33
  %20 = getelementptr [7 x i32], [7 x i32]* %19, i32 0, i32 0                      ; inst 34
  br label %_13.array.cond.1                                                       ; inst 35
_13.array.cond.1:
  %21 = phi i32 [0, %_12.while.exit.0], [%24, %_14.array.body.1]                   ; inst 36
  %22 = icmp slt i32 %21, 7                                                        ; inst 37
  br i1 %22, label %_14.array.body.1, label %_15.array.exit.1                      ; inst 38
_14.array.body.1:
  %23 = getelementptr i32, i32* %20, i32 %21                                       ; inst 39
  store i32 0, i32* %23                                                            ; inst 40
  %24 = add i32 %21, 1                                                             ; inst 41
  br label %_13.array.cond.1                                                       ; inst 42
_15.array.exit.1:
  %25 = alloca [7 x [10 x i32]]                                                    ; inst 43
  %26 = alloca [10 x i32]                                                          ; inst 44
  %27 = getelementptr [10 x i32], [10 x i32]* %26, i32 0, i32 0                    ; inst 45
  br label %_16.array.cond.2                                                       ; inst 46
_16.array.cond.2:
  %28 = phi i32 [0, %_15.array.exit.1], [%31, %_17.array.body.2]                   ; inst 47
  %29 = icmp slt i32 %28, 10                                                       ; inst 48
  br i1 %29, label %_17.array.body.2, label %_18.array.exit.2                      ; inst 49
_17.array.body.2:
  %30 = getelementptr i32, i32* %27, i32 %28                                       ; inst 50
  store i32 0, i32* %30                                                            ; inst 51
  %31 = add i32 %28, 1                                                             ; inst 52
  br label %_16.array.cond.2                                                       ; inst 53
_18.array.exit.2:
  %32 = getelementptr [7 x [10 x i32]], [7 x [10 x i32]]* %25, i32 0, i32 0        ; inst 54
  br label %_19.array.cond.3                                                       ; inst 55
_19.array.cond.3:
  %33 = phi i32 [0, %_18.array.exit.2], [%36, %_20.array.body.3]                   ; inst 56
  %34 = icmp slt i32 %33, 7                                                        ; inst 57
  br i1 %34, label %_20.array.body.3, label %_21.array.exit.3                      ; inst 58
_20.array.body.3:
  %35 = getelementptr [10 x i32], [10 x i32]* %32, i32 %33                         ; inst 59
  call void @memcpy([10 x i32]* %35, [10 x i32]* %26, i64 40)                      ; inst 60
  %36 = add i32 %33, 1                                                             ; inst 61
  br label %_19.array.cond.3                                                       ; inst 62
_21.array.exit.3:
  %37 = alloca [100 x i32]                                                         ; inst 63
  %38 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i32 0                  ; inst 64
  br label %_22.array.cond.4                                                       ; inst 65
_22.array.cond.4:
  %39 = phi i32 [0, %_21.array.exit.3], [%42, %_23.array.body.4]                   ; inst 66
  %40 = icmp slt i32 %39, 100                                                      ; inst 67
  br i1 %40, label %_23.array.body.4, label %_24.array.exit.4                      ; inst 68
_23.array.body.4:
  %41 = getelementptr i32, i32* %38, i32 %39                                       ; inst 69
  store i32 0, i32* %41                                                            ; inst 70
  %42 = add i32 %39, 1                                                             ; inst 71
  br label %_22.array.cond.4                                                       ; inst 72
_24.array.exit.4:
  %43 = alloca [7 x [3 x i32]]                                                     ; inst 73
  %44 = alloca [3 x i32]                                                           ; inst 74
  %45 = getelementptr [3 x i32], [3 x i32]* %44, i32 0, i32 0                      ; inst 75
  br label %_25.array.cond.5                                                       ; inst 76
_25.array.cond.5:
  %46 = phi i32 [0, %_24.array.exit.4], [%49, %_26.array.body.5]                   ; inst 77
  %47 = icmp slt i32 %46, 3                                                        ; inst 78
  br i1 %47, label %_26.array.body.5, label %_27.array.exit.5                      ; inst 79
_26.array.body.5:
  %48 = getelementptr i32, i32* %45, i32 %46                                       ; inst 80
  store i32 0, i32* %48                                                            ; inst 81
  %49 = add i32 %46, 1                                                             ; inst 82
  br label %_25.array.cond.5                                                       ; inst 83
_27.array.exit.5:
  %50 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %43, i32 0, i32 0          ; inst 84
  br label %_28.array.cond.6                                                       ; inst 85
_28.array.cond.6:
  %51 = phi i32 [0, %_27.array.exit.5], [%54, %_29.array.body.6]                   ; inst 86
  %52 = icmp slt i32 %51, 7                                                        ; inst 87
  br i1 %52, label %_29.array.body.6, label %_30.array.exit.6                      ; inst 88
_29.array.body.6:
  %53 = getelementptr [3 x i32], [3 x i32]* %50, i32 %51                           ; inst 89
  call void @memcpy([3 x i32]* %53, [3 x i32]* %44, i64 12)                        ; inst 90
  %54 = add i32 %51, 1                                                             ; inst 91
  br label %_28.array.cond.6                                                       ; inst 92
_30.array.exit.6:
  br label %_31.while.cond.1                                                       ; inst 93
_31.while.cond.1:
  %55 = phi i32 [0, %_30.array.exit.6], [%62, %_41.if.exit.1]                      ; inst 94
  %56 = icmp slt i32 %55, 20                                                       ; inst 95
  br i1 %56, label %_32.while.body.1, label %_42.while.exit.1                      ; inst 96
_32.while.body.1:
  %57 = call i1 @conductByzantineValueProposal(i32 %0, [7 x i1]* %2, [7 x i32]* %19, [7 x [3 x i32]]* %43, i32 %55) ; inst 97
  br i1 %57, label %_33.if.then.1, label %_40.if.else.1                            ; inst 98
_33.if.then.1:
  %58 = call i1 @performByzantineAgreement(i32 %0, [7 x i1]* %2, [7 x [3 x i32]]* %43, [7 x [10 x i32]]* %25, i32 %55) ; inst 99
  br i1 %58, label %_34.if.then.2, label %_38.if.else.2                            ; inst 100
_34.if.then.2:
  %59 = add i32 25200, %55                                                         ; inst 101
  call void @printlnInt(i32 %59)                                                   ; inst 102
  %60 = call i1 @verifyHonestNodeAgreement(i32 %0, [7 x i1]* %2, [7 x [3 x i32]]* %43) ; inst 103
  br i1 %60, label %_35.if.then.3, label %_36.if.else.3                            ; inst 104
_35.if.then.3:
  %61 = add i32 25220, %55                                                         ; inst 105
  call void @printlnInt(i32 %61)                                                   ; inst 106
  br label %_37.if.exit.3                                                          ; inst 107
_36.if.else.3:
  br label %_37.if.exit.3                                                          ; inst 108
_37.if.exit.3:
  br label %_39.if.exit.2                                                          ; inst 109
_38.if.else.2:
  br label %_39.if.exit.2                                                          ; inst 110
_39.if.exit.2:
  br label %_41.if.exit.1                                                          ; inst 111
_40.if.else.1:
  br label %_41.if.exit.1                                                          ; inst 112
_41.if.exit.1:
  %62 = add i32 %55, 1                                                             ; inst 113
  br label %_31.while.cond.1                                                       ; inst 114
_42.while.exit.1:
  call void @printlnInt(i32 25299)                                                 ; inst 115
  ret void                                                                         ; inst 116
}

define i1 @conductByzantineValueProposal(i32 %0, [7 x i1]* %1, [7 x i32]* %2, [7 x [3 x i32]]* %3, i32 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%38, %_5.if.exit.0]                              ; inst 2
  %6 = phi i32 [0, %_0.entry.0], [%37, %_5.if.exit.0]                              ; inst 3
  %7 = icmp slt i32 %5, %0                                                         ; inst 4
  br i1 %7, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %8 = sext i32 %5 to i64                                                          ; inst 6
  %9 = getelementptr [7 x i1], [7 x i1]* %1, i32 0, i64 %8                         ; inst 7
  %10 = load i1, i1* %9                                                            ; inst 8
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 9
_3.if.then.0:
  %11 = call i32 @generateMaliciousValue(i32 %5, i32 %4, i32 1)                    ; inst 10
  %12 = call i32 @generateMaliciousValue(i32 %5, i32 %4, i32 2)                    ; inst 11
  %13 = call i32 @generateMaliciousValue(i32 %5, i32 %4, i32 3)                    ; inst 12
  %14 = sext i32 %5 to i64                                                         ; inst 13
  %15 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %3, i32 0, i64 %14         ; inst 14
  %16 = getelementptr [3 x i32], [3 x i32]* %15, i32 0, i64 0                      ; inst 15
  store i32 %11, i32* %16                                                          ; inst 16
  %17 = sext i32 %5 to i64                                                         ; inst 17
  %18 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %3, i32 0, i64 %17         ; inst 18
  %19 = getelementptr [3 x i32], [3 x i32]* %18, i32 0, i64 1                      ; inst 19
  store i32 %12, i32* %19                                                          ; inst 20
  %20 = sext i32 %5 to i64                                                         ; inst 21
  %21 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %3, i32 0, i64 %20         ; inst 22
  %22 = getelementptr [3 x i32], [3 x i32]* %21, i32 0, i64 2                      ; inst 23
  store i32 %13, i32* %22                                                          ; inst 24
  %23 = sext i32 %5 to i64                                                         ; inst 25
  %24 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %23                     ; inst 26
  store i32 %11, i32* %24                                                          ; inst 27
  br label %_5.if.exit.0                                                           ; inst 28
_4.if.else.0:
  %25 = call i32 @generateHonestValue(i32 %5, i32 %4)                              ; inst 29
  %26 = sext i32 %5 to i64                                                         ; inst 30
  %27 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %3, i32 0, i64 %26         ; inst 31
  %28 = getelementptr [3 x i32], [3 x i32]* %27, i32 0, i64 0                      ; inst 32
  store i32 %25, i32* %28                                                          ; inst 33
  %29 = sext i32 %5 to i64                                                         ; inst 34
  %30 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %3, i32 0, i64 %29         ; inst 35
  %31 = getelementptr [3 x i32], [3 x i32]* %30, i32 0, i64 1                      ; inst 36
  store i32 %25, i32* %31                                                          ; inst 37
  %32 = sext i32 %5 to i64                                                         ; inst 38
  %33 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %3, i32 0, i64 %32         ; inst 39
  %34 = getelementptr [3 x i32], [3 x i32]* %33, i32 0, i64 2                      ; inst 40
  store i32 %25, i32* %34                                                          ; inst 41
  %35 = sext i32 %5 to i64                                                         ; inst 42
  %36 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %35                     ; inst 43
  store i32 %25, i32* %36                                                          ; inst 44
  br label %_5.if.exit.0                                                           ; inst 45
_5.if.exit.0:
  %37 = add i32 %6, 1                                                              ; inst 46
  %38 = add i32 %5, 1                                                              ; inst 47
  br label %_1.while.cond.0                                                        ; inst 48
_6.while.exit.0:
  %39 = icmp sge i32 %6, %0                                                        ; inst 49
  ret i1 %39                                                                       ; inst 50
}

define i1 @performByzantineAgreement(i32 %0, [7 x i1]* %1, [7 x [3 x i32]]* %2, [7 x [10 x i32]]* %3, i32 %4) {
_0.entry.0:
  %5 = alloca [7 x [7 x i32]]                                                      ; inst 1
  %6 = alloca [7 x i32]                                                            ; inst 2
  %7 = getelementptr [7 x i32], [7 x i32]* %6, i32 0, i32 0                        ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 5
  %9 = icmp slt i32 %8, 7                                                          ; inst 6
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 8
  store i32 0, i32* %10                                                            ; inst 9
  %11 = add i32 %8, 1                                                              ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %12 = getelementptr [7 x [7 x i32]], [7 x [7 x i32]]* %5, i32 0, i32 0           ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %13 = phi i32 [0, %_3.array.exit.0], [%16, %_5.array.body.1]                     ; inst 14
  %14 = icmp slt i32 %13, 7                                                        ; inst 15
  br i1 %14, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %15 = getelementptr [7 x i32], [7 x i32]* %12, i32 %13                           ; inst 17
  call void @memcpy([7 x i32]* %15, [7 x i32]* %6, i64 28)                         ; inst 18
  %16 = add i32 %13, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %17 = phi i32 [0, %_6.array.exit.1], [%39, %_14.while.exit.1]                    ; inst 22
  %18 = icmp slt i32 %17, %0                                                       ; inst 23
  br i1 %18, label %_8.while.body.0, label %_15.while.exit.0                       ; inst 24
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 25
_9.while.cond.1:
  %19 = phi i32 [0, %_8.while.body.0], [%38, %_13.if.exit.0]                       ; inst 26
  %20 = icmp slt i32 %19, %0                                                       ; inst 27
  br i1 %20, label %_10.while.body.1, label %_14.while.exit.1                      ; inst 28
_10.while.body.1:
  %21 = sext i32 %19 to i64                                                        ; inst 29
  %22 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %2, i32 0, i64 %21         ; inst 30
  %23 = getelementptr [3 x i32], [3 x i32]* %22, i32 0, i64 0                      ; inst 31
  %24 = load i32, i32* %23                                                         ; inst 32
  %25 = call i32 @generateSignature(i32 %17, i32 %19, i32 %24, i32 %4)             ; inst 33
  %26 = sext i32 %17 to i64                                                        ; inst 34
  %27 = getelementptr [7 x i1], [7 x i1]* %1, i32 0, i64 %26                       ; inst 35
  %28 = load i1, i1* %27                                                           ; inst 36
  br i1 %28, label %_11.if.then.0, label %_12.if.else.0                            ; inst 37
_11.if.then.0:
  %29 = sext i32 %17 to i64                                                        ; inst 38
  %30 = getelementptr [7 x [7 x i32]], [7 x [7 x i32]]* %5, i32 0, i64 %29         ; inst 39
  %31 = sext i32 %19 to i64                                                        ; inst 40
  %32 = getelementptr [7 x i32], [7 x i32]* %30, i32 0, i64 %31                    ; inst 41
  %33 = call i32 @corruptSignature(i32 %25, i32 %17, i32 %19)                      ; inst 42
  store i32 %33, i32* %32                                                          ; inst 43
  br label %_13.if.exit.0                                                          ; inst 44
_12.if.else.0:
  %34 = sext i32 %17 to i64                                                        ; inst 45
  %35 = getelementptr [7 x [7 x i32]], [7 x [7 x i32]]* %5, i32 0, i64 %34         ; inst 46
  %36 = sext i32 %19 to i64                                                        ; inst 47
  %37 = getelementptr [7 x i32], [7 x i32]* %35, i32 0, i64 %36                    ; inst 48
  store i32 %25, i32* %37                                                          ; inst 49
  br label %_13.if.exit.0                                                          ; inst 50
_13.if.exit.0:
  %38 = add i32 %19, 1                                                             ; inst 51
  br label %_9.while.cond.1                                                        ; inst 52
_14.while.exit.1:
  %39 = add i32 %17, 1                                                             ; inst 53
  br label %_7.while.cond.0                                                        ; inst 54
_15.while.exit.0:
  %40 = alloca [7 x i1]                                                            ; inst 55
  %41 = getelementptr [7 x i1], [7 x i1]* %40, i32 0, i32 0                        ; inst 56
  br label %_16.array.cond.2                                                       ; inst 57
_16.array.cond.2:
  %42 = phi i32 [0, %_15.while.exit.0], [%45, %_17.array.body.2]                   ; inst 58
  %43 = icmp slt i32 %42, 7                                                        ; inst 59
  br i1 %43, label %_17.array.body.2, label %_18.array.exit.2                      ; inst 60
_17.array.body.2:
  %44 = getelementptr i1, i1* %41, i32 %42                                         ; inst 61
  store i1 0, i1* %44                                                              ; inst 62
  %45 = add i32 %42, 1                                                             ; inst 63
  br label %_16.array.cond.2                                                       ; inst 64
_18.array.exit.2:
  br label %_19.while.cond.2                                                       ; inst 65
_19.while.cond.2:
  %46 = phi i32 [0, %_18.array.exit.2], [%55, %_23.if.exit.1]                      ; inst 66
  %47 = icmp slt i32 %46, %0                                                       ; inst 67
  br i1 %47, label %_20.while.body.2, label %_24.while.exit.2                      ; inst 68
_20.while.body.2:
  %48 = call i32 @countValidSignatures(i32 %46, i32 %0, [7 x [7 x i32]]* %5, [7 x [3 x i32]]* %2, [7 x i1]* %1) ; inst 69
  %49 = sub i32 %0, 1                                                              ; inst 70
  %50 = sdiv i32 %49, 3                                                            ; inst 71
  %51 = sub i32 %0, %50                                                            ; inst 72
  %52 = icmp sge i32 %48, %51                                                      ; inst 73
  br i1 %52, label %_21.if.then.1, label %_22.if.else.1                            ; inst 74
_21.if.then.1:
  %53 = sext i32 %46 to i64                                                        ; inst 75
  %54 = getelementptr [7 x i1], [7 x i1]* %40, i32 0, i64 %53                      ; inst 76
  store i1 1, i1* %54                                                              ; inst 77
  br label %_23.if.exit.1                                                          ; inst 78
_22.if.else.1:
  br label %_23.if.exit.1                                                          ; inst 79
_23.if.exit.1:
  %55 = add i32 %46, 1                                                             ; inst 80
  br label %_19.while.cond.2                                                       ; inst 81
_24.while.exit.2:
  %56 = call i1 @checkProposalAgreement(i32 %0, [7 x i1]* %40, [7 x [3 x i32]]* %2) ; inst 82
  ret i1 %56                                                                       ; inst 83
}

define void @performNetworkPartitionTest(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 25301)                                                 ; inst 1
  %1 = alloca [7 x [7 x i1]]                                                       ; inst 2
  %2 = alloca [7 x i1]                                                             ; inst 3
  %3 = getelementptr [7 x i1], [7 x i1]* %2, i32 0, i32 0                          ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 7                                                          ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 9
  store i1 1, i1* %6                                                               ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %1, i32 0, i32 0              ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 7                                                         ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr [7 x i1], [7 x i1]* %8, i32 %9                               ; inst 18
  call void @memcpy([7 x i1]* %11, [7 x i1]* %2, i64 7)                            ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [7 x i32]                                                           ; inst 22
  %14 = getelementptr [7 x i32], [7 x i32]* %13, i32 0, i32 0                      ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 25
  %16 = icmp slt i32 %15, 7                                                        ; inst 26
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = add i32 %15, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  br label %_10.while.cond.0                                                       ; inst 32
_10.while.cond.0:
  %19 = phi i32 [0, %_9.array.exit.2], [%25, %_17.if.exit.1]                       ; inst 33
  %20 = icmp slt i32 %19, 10                                                       ; inst 34
  br i1 %20, label %_11.while.body.0, label %_18.while.exit.0                      ; inst 35
_11.while.body.0:
  call void @createNetworkPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %13, i32 %19) ; inst 36
  %21 = call i1 @testConsensusUnderPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %13) ; inst 37
  br i1 %21, label %_12.if.then.0, label %_13.if.else.0                            ; inst 38
_12.if.then.0:
  %22 = add i32 25300, %19                                                         ; inst 39
  call void @printlnInt(i32 %22)                                                   ; inst 40
  br label %_14.if.exit.0                                                          ; inst 41
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 42
_14.if.exit.0:
  call void @healNetworkPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %13)      ; inst 43
  %23 = call i1 @testPartitionRecovery(i32 %0, [7 x [7 x i1]]* %1)                 ; inst 44
  br i1 %23, label %_15.if.then.1, label %_16.if.else.1                            ; inst 45
_15.if.then.1:
  %24 = add i32 25310, %19                                                         ; inst 46
  call void @printlnInt(i32 %24)                                                   ; inst 47
  br label %_17.if.exit.1                                                          ; inst 48
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 49
_17.if.exit.1:
  %25 = add i32 %19, 1                                                             ; inst 50
  br label %_10.while.cond.0                                                       ; inst 51
_18.while.exit.0:
  call void @printlnInt(i32 25399)                                                 ; inst 52
  ret void                                                                         ; inst 53
}

define void @createNetworkPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%13, %_5.while.exit.1]                           ; inst 2
  %5 = icmp slt i32 %4, %0                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%12, %_4.while.body.1]                      ; inst 6
  %7 = icmp slt i32 %6, %0                                                         ; inst 7
  br i1 %7, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %8 = sext i32 %4 to i64                                                          ; inst 9
  %9 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %1, i32 0, i64 %8             ; inst 10
  %10 = sext i32 %6 to i64                                                         ; inst 11
  %11 = getelementptr [7 x i1], [7 x i1]* %9, i32 0, i64 %10                       ; inst 12
  store i1 0, i1* %11                                                              ; inst 13
  %12 = add i32 %6, 1                                                              ; inst 14
  br label %_3.while.cond.1                                                        ; inst 15
_5.while.exit.1:
  %13 = add i32 %4, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_6.while.exit.0:
  %14 = srem i32 %3, 3                                                             ; inst 18
  %15 = icmp eq i32 %14, 0                                                         ; inst 19
  br i1 %15, label %_7.if.then.0, label %_8.if.else.0                              ; inst 20
_7.if.then.0:
  call void @createBinaryPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2)      ; inst 21
  br label %_12.if.exit.0                                                          ; inst 22
_8.if.else.0:
  %16 = srem i32 %3, 3                                                             ; inst 23
  %17 = icmp eq i32 %16, 1                                                         ; inst 24
  br i1 %17, label %_9.if.then.1, label %_10.if.else.1                             ; inst 25
_9.if.then.1:
  call void @createAsymmetricPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2)  ; inst 26
  br label %_11.if.exit.1                                                          ; inst 27
_10.if.else.1:
  call void @createMultiwayPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2)    ; inst 28
  br label %_11.if.exit.1                                                          ; inst 29
_11.if.exit.1:
  br label %_12.if.exit.0                                                          ; inst 30
_12.if.exit.0:
  ret void                                                                         ; inst 31
}

define void @performLeaderElectionTest(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 25401)                                                 ; inst 1
  %1 = alloca [7 x i32]                                                            ; inst 2
  %2 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i32 0                        ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 7                                                          ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [7 x i32]                                                            ; inst 12
  %8 = getelementptr [7 x i32], [7 x i32]* %7, i32 0, i32 0                        ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 7                                                         ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 18
  store i32 100, i32* %11                                                          ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [7 x i32]                                                           ; inst 22
  %14 = getelementptr [7 x i32], [7 x i32]* %13, i32 0, i32 0                      ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 25
  %16 = icmp slt i32 %15, 7                                                        ; inst 26
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = add i32 %15, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %19 = alloca [7 x [7 x i1]]                                                      ; inst 32
  %20 = alloca [7 x i1]                                                            ; inst 33
  %21 = getelementptr [7 x i1], [7 x i1]* %20, i32 0, i32 0                        ; inst 34
  br label %_10.array.cond.3                                                       ; inst 35
_10.array.cond.3:
  %22 = phi i32 [0, %_9.array.exit.2], [%25, %_11.array.body.3]                    ; inst 36
  %23 = icmp slt i32 %22, 7                                                        ; inst 37
  br i1 %23, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 38
_11.array.body.3:
  %24 = getelementptr i1, i1* %21, i32 %22                                         ; inst 39
  store i1 0, i1* %24                                                              ; inst 40
  %25 = add i32 %22, 1                                                             ; inst 41
  br label %_10.array.cond.3                                                       ; inst 42
_12.array.exit.3:
  %26 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %19, i32 0, i32 0            ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 45
  %28 = icmp slt i32 %27, 7                                                        ; inst 46
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %29 = getelementptr [7 x i1], [7 x i1]* %26, i32 %27                             ; inst 48
  call void @memcpy([7 x i1]* %29, [7 x i1]* %20, i64 7)                           ; inst 49
  %30 = add i32 %27, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  br label %_16.while.cond.0                                                       ; inst 52
_16.while.cond.0:
  %31 = phi i32 [0, %_15.array.exit.4], [%36, %_17.while.body.0]                   ; inst 53
  %32 = icmp slt i32 %31, %0                                                       ; inst 54
  br i1 %32, label %_17.while.body.0, label %_18.while.exit.0                      ; inst 55
_17.while.body.0:
  %33 = sext i32 %31 to i64                                                        ; inst 56
  %34 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %33                     ; inst 57
  %35 = call i32 @generateNodePriority(i32 %31)                                    ; inst 58
  store i32 %35, i32* %34                                                          ; inst 59
  %36 = add i32 %31, 1                                                             ; inst 60
  br label %_16.while.cond.0                                                       ; inst 61
_18.while.exit.0:
  br label %_19.while.cond.1                                                       ; inst 62
_19.while.cond.1:
  %37 = phi i32 [0, %_18.while.exit.0], [%44, %_26.if.exit.0]                      ; inst 63
  %38 = icmp slt i32 %37, 15                                                       ; inst 64
  br i1 %38, label %_20.while.body.1, label %_27.while.exit.1                      ; inst 65
_20.while.body.1:
  call void @simulateNodeFailures(i32 %0, [7 x i32]* %7, i32 %37)                  ; inst 66
  call void @updateFailureDetectors(i32 %0, [7 x i32]* %7, [7 x [7 x i1]]* %19)    ; inst 67
  %39 = call i32 @conductFailureAwareElection(i32 %0, [7 x i32]* %1, [7 x i32]* %7, [7 x [7 x i1]]* %19, [7 x i32]* %13) ; inst 68
  %40 = icmp sge i32 %39, 0                                                        ; inst 69
  br i1 %40, label %_21.if.then.0, label %_25.if.else.0                            ; inst 70
_21.if.then.0:
  %41 = add i32 25400, %39                                                         ; inst 71
  call void @printlnInt(i32 %41)                                                   ; inst 72
  %42 = call i1 @testLeadershipStability(i32 %39, i32 %0, [7 x i32]* %7, [7 x [7 x i1]]* %19) ; inst 73
  br i1 %42, label %_22.if.then.1, label %_23.if.else.1                            ; inst 74
_22.if.then.1:
  %43 = add i32 25410, %37                                                         ; inst 75
  call void @printlnInt(i32 %43)                                                   ; inst 76
  br label %_24.if.exit.1                                                          ; inst 77
_23.if.else.1:
  br label %_24.if.exit.1                                                          ; inst 78
_24.if.exit.1:
  br label %_26.if.exit.0                                                          ; inst 79
_25.if.else.0:
  br label %_26.if.exit.0                                                          ; inst 80
_26.if.exit.0:
  call void @simulateNodeRecovery(i32 %0, [7 x i32]* %7)                           ; inst 81
  %44 = add i32 %37, 1                                                             ; inst 82
  br label %_19.while.cond.1                                                       ; inst 83
_27.while.exit.1:
  call void @printlnInt(i32 25499)                                                 ; inst 84
  ret void                                                                         ; inst 85
}

define void @performAsynchronousConsensusTest(i32 %0, i32 %1) {
_0.entry.0:
  call void @printlnInt(i32 25501)                                                 ; inst 1
  %2 = alloca [1000 x i32]                                                         ; inst 2
  %3 = getelementptr [1000 x i32], [1000 x i32]* %2, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 1000                                                       ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 8
  store i32 0, i32* %6                                                             ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %8 = alloca i32                                                                  ; inst 12
  store i32 0, i32* %8                                                             ; inst 13
  %9 = alloca i32                                                                  ; inst 14
  store i32 0, i32* %9                                                             ; inst 15
  %10 = alloca i32                                                                 ; inst 16
  store i32 0, i32* %10                                                            ; inst 17
  %11 = alloca [1000 x i32]                                                        ; inst 18
  %12 = getelementptr [1000 x i32], [1000 x i32]* %11, i32 0, i32 0                ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_4.array.cond.1:
  %13 = phi i32 [0, %_3.array.exit.0], [%16, %_5.array.body.1]                     ; inst 21
  %14 = icmp slt i32 %13, 1000                                                     ; inst 22
  br i1 %14, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 23
_5.array.body.1:
  %15 = getelementptr i32, i32* %12, i32 %13                                       ; inst 24
  store i32 0, i32* %15                                                            ; inst 25
  %16 = add i32 %13, 1                                                             ; inst 26
  br label %_4.array.cond.1                                                        ; inst 27
_6.array.exit.1:
  %17 = alloca [1000 x i32]                                                        ; inst 28
  %18 = getelementptr [1000 x i32], [1000 x i32]* %17, i32 0, i32 0                ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_7.array.cond.2:
  %19 = phi i32 [0, %_6.array.exit.1], [%22, %_8.array.body.2]                     ; inst 31
  %20 = icmp slt i32 %19, 1000                                                     ; inst 32
  br i1 %20, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 33
_8.array.body.2:
  %21 = getelementptr i32, i32* %18, i32 %19                                       ; inst 34
  store i32 0, i32* %21                                                            ; inst 35
  %22 = add i32 %19, 1                                                             ; inst 36
  br label %_7.array.cond.2                                                        ; inst 37
_9.array.exit.2:
  %23 = alloca [7 x i32]                                                           ; inst 38
  %24 = getelementptr [7 x i32], [7 x i32]* %23, i32 0, i32 0                      ; inst 39
  br label %_10.array.cond.3                                                       ; inst 40
_10.array.cond.3:
  %25 = phi i32 [0, %_9.array.exit.2], [%28, %_11.array.body.3]                    ; inst 41
  %26 = icmp slt i32 %25, 7                                                        ; inst 42
  br i1 %26, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 43
_11.array.body.3:
  %27 = getelementptr i32, i32* %24, i32 %25                                       ; inst 44
  store i32 0, i32* %27                                                            ; inst 45
  %28 = add i32 %25, 1                                                             ; inst 46
  br label %_10.array.cond.3                                                       ; inst 47
_12.array.exit.3:
  %29 = alloca [7 x i32]                                                           ; inst 48
  %30 = getelementptr [7 x i32], [7 x i32]* %29, i32 0, i32 0                      ; inst 49
  br label %_13.array.cond.4                                                       ; inst 50
_13.array.cond.4:
  %31 = phi i32 [0, %_12.array.exit.3], [%34, %_14.array.body.4]                   ; inst 51
  %32 = icmp slt i32 %31, 7                                                        ; inst 52
  br i1 %32, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 53
_14.array.body.4:
  %33 = getelementptr i32, i32* %30, i32 %31                                       ; inst 54
  store i32 -1, i32* %33                                                           ; inst 55
  %34 = add i32 %31, 1                                                             ; inst 56
  br label %_13.array.cond.4                                                       ; inst 57
_15.array.exit.4:
  %35 = alloca [100 x i32]                                                         ; inst 58
  %36 = getelementptr [100 x i32], [100 x i32]* %35, i32 0, i32 0                  ; inst 59
  br label %_16.array.cond.5                                                       ; inst 60
_16.array.cond.5:
  %37 = phi i32 [0, %_15.array.exit.4], [%40, %_17.array.body.5]                   ; inst 61
  %38 = icmp slt i32 %37, 100                                                      ; inst 62
  br i1 %38, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 63
_17.array.body.5:
  %39 = getelementptr i32, i32* %36, i32 %37                                       ; inst 64
  store i32 0, i32* %39                                                            ; inst 65
  %40 = add i32 %37, 1                                                             ; inst 66
  br label %_16.array.cond.5                                                       ; inst 67
_18.array.exit.5:
  br label %_19.while.cond.0                                                       ; inst 68
_19.while.cond.0:
  %41 = phi i32 [0, %_18.array.exit.5], [%55, %_29.if.exit.0]                      ; inst 69
  %42 = phi i32 [0, %_18.array.exit.5], [%56, %_29.if.exit.0]                      ; inst 70
  %43 = icmp slt i32 %42, %1                                                       ; inst 71
  br i1 %43, label %_20.lazy.then.0, label %_21.lazy.else.0                        ; inst 72
_20.lazy.then.0:
  %44 = icmp slt i32 %41, 50                                                       ; inst 73
  br label %_22.lazy.exit.0                                                        ; inst 74
_21.lazy.else.0:
  br label %_22.lazy.exit.0                                                        ; inst 75
_22.lazy.exit.0:
  %45 = phi i1 [%44, %_20.lazy.then.0], [0, %_21.lazy.else.0]                      ; inst 76
  br i1 %45, label %_23.while.body.0, label %_30.while.exit.0                      ; inst 77
_23.while.body.0:
  call void @generateAsyncProposals(i32 %0, [7 x i32]* %23, i32 %42)               ; inst 78
  call void @enqueueProposalsWithDelays(i32 %0, [7 x i32]* %23, [1000 x i32]* %2, [1000 x i32]* %11, [1000 x i32]* %17, i32* %8, i32* %9, i32* %10, i32 %42) ; inst 79
  %46 = call i32 @processAsyncMessages([1000 x i32]* %2, [1000 x i32]* %11, [1000 x i32]* %17, i32* %8, i32* %9, i32* %10, [7 x i32]* %29, i32 %42) ; inst 80
  %47 = icmp sgt i32 %46, 0                                                        ; inst 81
  br i1 %47, label %_24.if.then.0, label %_28.if.else.0                            ; inst 82
_24.if.then.0:
  %48 = call i1 @checkAsyncConsensus(i32 %0, [7 x i32]* %29)                       ; inst 83
  br i1 %48, label %_25.if.then.1, label %_26.if.else.1                            ; inst 84
_25.if.then.1:
  %49 = call i32 @extractConsensusValue(i32 %0, [7 x i32]* %29)                    ; inst 85
  %50 = sext i32 %41 to i64                                                        ; inst 86
  %51 = getelementptr [100 x i32], [100 x i32]* %35, i32 0, i64 %50                ; inst 87
  store i32 %49, i32* %51                                                          ; inst 88
  %52 = add i32 %41, 1                                                             ; inst 89
  %53 = add i32 25500, %52                                                         ; inst 90
  call void @printlnInt(i32 %53)                                                   ; inst 91
  call void @resetNodeDecisions(i32 %0, [7 x i32]* %29)                            ; inst 92
  br label %_27.if.exit.1                                                          ; inst 93
_26.if.else.1:
  br label %_27.if.exit.1                                                          ; inst 94
_27.if.exit.1:
  %54 = phi i32 [%52, %_25.if.then.1], [%41, %_26.if.else.1]                       ; inst 95
  br label %_29.if.exit.0                                                          ; inst 96
_28.if.else.0:
  br label %_29.if.exit.0                                                          ; inst 97
_29.if.exit.0:
  %55 = phi i32 [%54, %_27.if.exit.1], [%41, %_28.if.else.0]                       ; inst 98
  %56 = add i32 %42, 1                                                             ; inst 99
  br label %_19.while.cond.0                                                       ; inst 100
_30.while.exit.0:
  %57 = call i1 @verifyConsensusHistory([100 x i32]* %35, i32 %41)                 ; inst 101
  br i1 %57, label %_31.if.then.2, label %_32.if.else.2                            ; inst 102
_31.if.then.2:
  call void @printlnInt(i32 25550)                                                 ; inst 103
  br label %_33.if.exit.2                                                          ; inst 104
_32.if.else.2:
  br label %_33.if.exit.2                                                          ; inst 105
_33.if.exit.2:
  call void @printlnInt(i32 25599)                                                 ; inst 106
  ret void                                                                         ; inst 107
}

define i32 @findMaxTerm([7 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%12, %_5.if.exit.0]                              ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [7 x i32], [7 x i32]* %0, i32 0, i64 %5                       ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp sgt i32 %7, %3                                                         ; inst 9
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %9 = sext i32 %2 to i64                                                          ; inst 11
  %10 = getelementptr [7 x i32], [7 x i32]* %0, i32 0, i64 %9                      ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  br label %_5.if.exit.0                                                           ; inst 14
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %12 = phi i32 [%11, %_3.if.then.0], [%3, %_4.if.else.0]                          ; inst 16
  %13 = add i32 %2, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 19
}

define i1 @shouldBecomeCandidate(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp eq i32 %1, 2                                                           ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i1 0                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %5 = mul i32 %0, 17                                                              ; inst 5
  %6 = mul i32 %3, 7                                                               ; inst 6
  %7 = add i32 %5, %6                                                              ; inst 7
  %8 = srem i32 %7, 100                                                            ; inst 8
  %9 = icmp slt i32 %8, 30                                                         ; inst 9
  ret i1 %9                                                                        ; inst 10
}

define i32 @abs(i32 %0) {
_0.entry.0:
  %1 = icmp slt i32 %0, 0                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %2 = sub i32 0, %0                                                               ; inst 3
  ret i32 %2                                                                       ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  ret i32 %0                                                                       ; inst 6
}

define i32 @generateLogEntry(i32 %0, i32 %1) {
_0.entry.0:
  %2 = mul i32 %0, 1000                                                            ; inst 1
  %3 = mul i32 %1, 10                                                              ; inst 2
  %4 = add i32 %2, %3                                                              ; inst 3
  %5 = add i32 %0, %1                                                              ; inst 4
  %6 = srem i32 %5, 7                                                              ; inst 5
  %7 = add i32 %4, %6                                                              ; inst 6
  ret i32 %7                                                                       ; inst 7
}

define i1 @simulateNetworkReliability(i32 %0, i32 %1) {
_0.entry.0:
  %2 = mul i32 %0, 13                                                              ; inst 1
  %3 = mul i32 %1, 19                                                              ; inst 2
  %4 = add i32 %2, %3                                                              ; inst 3
  %5 = srem i32 %4, 100                                                            ; inst 4
  %6 = icmp sgt i32 %5, 15                                                         ; inst 5
  ret i1 %6                                                                        ; inst 6
}

define i1 @checkLogConsistency(i32 %0, i32 %1, [7 x [100 x i32]]* %2, [7 x i32]* %3) {
_0.entry.0:
  %4 = sext i32 %1 to i64                                                          ; inst 1
  %5 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %4                       ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = sext i32 %0 to i64                                                          ; inst 4
  %8 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %7                       ; inst 5
  %9 = load i32, i32* %8                                                           ; inst 6
  %10 = icmp sgt i32 %6, %9                                                        ; inst 7
  br i1 %10, label %_1.if.then.0, label %_2.if.else.0                              ; inst 8
_1.if.then.0:
  ret i1 0                                                                         ; inst 9
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 10
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %11 = phi i32 [0, %_3.if.exit.0], [%27, %_8.if.exit.1]                           ; inst 12
  %12 = sext i32 %1 to i64                                                         ; inst 13
  %13 = getelementptr [7 x i32], [7 x i32]* %3, i32 0, i64 %12                     ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = icmp slt i32 %11, %14                                                      ; inst 16
  br i1 %15, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 17
_5.while.body.0:
  %16 = sext i32 %0 to i64                                                         ; inst 18
  %17 = getelementptr [7 x [100 x i32]], [7 x [100 x i32]]* %2, i32 0, i64 %16     ; inst 19
  %18 = sext i32 %11 to i64                                                        ; inst 20
  %19 = getelementptr [100 x i32], [100 x i32]* %17, i32 0, i64 %18                ; inst 21
  %20 = load i32, i32* %19                                                         ; inst 22
  %21 = sext i32 %1 to i64                                                         ; inst 23
  %22 = getelementptr [7 x [100 x i32]], [7 x [100 x i32]]* %2, i32 0, i64 %21     ; inst 24
  %23 = sext i32 %11 to i64                                                        ; inst 25
  %24 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %23                ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = icmp ne i32 %20, %25                                                       ; inst 28
  br i1 %26, label %_6.if.then.1, label %_7.if.else.1                              ; inst 29
_6.if.then.1:
  ret i1 0                                                                         ; inst 30
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 31
_8.if.exit.1:
  %27 = add i32 %11, 1                                                             ; inst 32
  br label %_4.while.cond.0                                                        ; inst 33
_9.while.exit.0:
  ret i1 1                                                                         ; inst 34
}

define i1 @verifyLogConsistency(i32 %0, [7 x [100 x i32]]* %1, [7 x i32]* %2) {
_0.entry.0:
  %3 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i1 1                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 0                        ; inst 5
  %5 = load i32, i32* %4                                                           ; inst 6
  br label %_4.while.cond.0                                                        ; inst 7
_4.while.cond.0:
  %6 = phi i32 [1, %_3.if.exit.0], [%12, %_8.if.exit.1]                            ; inst 8
  %7 = icmp slt i32 %6, %0                                                         ; inst 9
  br i1 %7, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 10
_5.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 11
  %9 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %8                       ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  %11 = icmp ne i32 %10, %5                                                        ; inst 14
  br i1 %11, label %_6.if.then.1, label %_7.if.else.1                              ; inst 15
_6.if.then.1:
  ret i1 0                                                                         ; inst 16
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 17
_8.if.exit.1:
  %12 = add i32 %6, 1                                                              ; inst 18
  br label %_4.while.cond.0                                                        ; inst 19
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 20
_10.while.cond.1:
  %13 = phi i32 [0, %_9.while.exit.0], [%28, %_17.while.exit.2]                    ; inst 21
  %14 = icmp slt i32 %13, %5                                                       ; inst 22
  br i1 %14, label %_11.while.body.1, label %_18.while.exit.1                      ; inst 23
_11.while.body.1:
  %15 = getelementptr [7 x [100 x i32]], [7 x [100 x i32]]* %1, i32 0, i64 0       ; inst 24
  %16 = sext i32 %13 to i64                                                        ; inst 25
  %17 = getelementptr [100 x i32], [100 x i32]* %15, i32 0, i64 %16                ; inst 26
  %18 = load i32, i32* %17                                                         ; inst 27
  br label %_12.while.cond.2                                                       ; inst 28
_12.while.cond.2:
  %19 = phi i32 [1, %_11.while.body.1], [%27, %_16.if.exit.2]                      ; inst 29
  %20 = icmp slt i32 %19, %0                                                       ; inst 30
  br i1 %20, label %_13.while.body.2, label %_17.while.exit.2                      ; inst 31
_13.while.body.2:
  %21 = sext i32 %19 to i64                                                        ; inst 32
  %22 = getelementptr [7 x [100 x i32]], [7 x [100 x i32]]* %1, i32 0, i64 %21     ; inst 33
  %23 = sext i32 %13 to i64                                                        ; inst 34
  %24 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %23                ; inst 35
  %25 = load i32, i32* %24                                                         ; inst 36
  %26 = icmp ne i32 %25, %18                                                       ; inst 37
  br i1 %26, label %_14.if.then.2, label %_15.if.else.2                            ; inst 38
_14.if.then.2:
  ret i1 0                                                                         ; inst 39
_15.if.else.2:
  br label %_16.if.exit.2                                                          ; inst 40
_16.if.exit.2:
  %27 = add i32 %19, 1                                                             ; inst 41
  br label %_12.while.cond.2                                                       ; inst 42
_17.while.exit.2:
  %28 = add i32 %13, 1                                                             ; inst 43
  br label %_10.while.cond.1                                                       ; inst 44
_18.while.exit.1:
  ret i1 1                                                                         ; inst 45
}

define i1 @shouldBeByzantine(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 23                                                              ; inst 1
  %2 = srem i32 %1, 7                                                              ; inst 2
  %3 = icmp slt i32 %2, 2                                                          ; inst 3
  ret i1 %3                                                                        ; inst 4
}

define i32 @generateMaliciousValue(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = mul i32 %0, 100                                                             ; inst 1
  %4 = mul i32 %1, 10                                                              ; inst 2
  %5 = add i32 %3, %4                                                              ; inst 3
  %6 = add i32 %5, %2                                                              ; inst 4
  %7 = add i32 %6, 9999                                                            ; inst 5
  ret i32 %7                                                                       ; inst 6
}

define i32 @generateHonestValue(i32 %0, i32 %1) {
_0.entry.0:
  %2 = mul i32 %1, 42                                                              ; inst 1
  %3 = add i32 %2, 1000                                                            ; inst 2
  ret i32 %3                                                                       ; inst 3
}

define i32 @generateSignature(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = mul i32 %0, 1000                                                            ; inst 1
  %5 = mul i32 %1, 100                                                             ; inst 2
  %6 = add i32 %4, %5                                                              ; inst 3
  %7 = srem i32 %2, 100                                                            ; inst 4
  %8 = add i32 %6, %7                                                              ; inst 5
  %9 = srem i32 %3, 10                                                             ; inst 6
  %10 = add i32 %8, %9                                                             ; inst 7
  ret i32 %10                                                                      ; inst 8
}

define i32 @corruptSignature(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = mul i32 %1, 7                                                               ; inst 1
  %4 = mul i32 %2, 11                                                              ; inst 2
  %5 = add i32 %3, %4                                                              ; inst 3
  %6 = srem i32 %5, 1000                                                           ; inst 4
  %7 = add i32 %0, %6                                                              ; inst 5
  ret i32 %7                                                                       ; inst 6
}

define i32 @countValidSignatures(i32 %0, i32 %1, [7 x [7 x i32]]* %2, [7 x [3 x i32]]* %3, [7 x i1]* %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%26, %_8.if.exit.0]                              ; inst 2
  %6 = phi i32 [0, %_0.entry.0], [%25, %_8.if.exit.0]                              ; inst 3
  %7 = icmp slt i32 %5, %1                                                         ; inst 4
  br i1 %7, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %8 = sext i32 %5 to i64                                                          ; inst 6
  %9 = getelementptr [7 x i1], [7 x i1]* %4, i32 0, i64 %8                         ; inst 7
  %10 = load i1, i1* %9                                                            ; inst 8
  %11 = icmp eq i1 %10, 0                                                          ; inst 9
  br i1 %11, label %_3.if.then.0, label %_7.if.else.0                              ; inst 10
_3.if.then.0:
  %12 = sext i32 %0 to i64                                                         ; inst 11
  %13 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %3, i32 0, i64 %12         ; inst 12
  %14 = getelementptr [3 x i32], [3 x i32]* %13, i32 0, i64 0                      ; inst 13
  %15 = load i32, i32* %14                                                         ; inst 14
  %16 = call i32 @generateSignature(i32 %5, i32 %0, i32 %15, i32 0)                ; inst 15
  %17 = sext i32 %5 to i64                                                         ; inst 16
  %18 = getelementptr [7 x [7 x i32]], [7 x [7 x i32]]* %2, i32 0, i64 %17         ; inst 17
  %19 = sext i32 %0 to i64                                                         ; inst 18
  %20 = getelementptr [7 x i32], [7 x i32]* %18, i32 0, i64 %19                    ; inst 19
  %21 = load i32, i32* %20                                                         ; inst 20
  %22 = call i1 @verifySignature(i32 %21, i32 %16)                                 ; inst 21
  br i1 %22, label %_4.if.then.1, label %_5.if.else.1                              ; inst 22
_4.if.then.1:
  %23 = add i32 %6, 1                                                              ; inst 23
  br label %_6.if.exit.1                                                           ; inst 24
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 25
_6.if.exit.1:
  %24 = phi i32 [%23, %_4.if.then.1], [%6, %_5.if.else.1]                          ; inst 26
  br label %_8.if.exit.0                                                           ; inst 27
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 28
_8.if.exit.0:
  %25 = phi i32 [%24, %_6.if.exit.1], [%6, %_7.if.else.0]                          ; inst 29
  %26 = add i32 %5, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  ret i32 %6                                                                       ; inst 32
}

define i1 @verifySignature(i32 %0, i32 %1) {
_0.entry.0:
  %2 = sub i32 %0, %1                                                              ; inst 1
  %3 = call i32 @abs(i32 %2)                                                       ; inst 2
  %4 = icmp slt i32 %3, 100                                                        ; inst 3
  ret i1 %4                                                                        ; inst 4
}

define i1 @checkProposalAgreement(i32 %0, [7 x i1]* %1, [7 x [3 x i32]]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%24, %_11.if.exit.0]                             ; inst 2
  %4 = phi i1 [0, %_0.entry.0], [%22, %_11.if.exit.0]                              ; inst 3
  %5 = phi i32 [-1, %_0.entry.0], [%23, %_11.if.exit.0]                            ; inst 4
  %6 = icmp slt i32 %3, %0                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  %7 = sext i32 %3 to i64                                                          ; inst 7
  %8 = getelementptr [7 x i1], [7 x i1]* %1, i32 0, i64 %7                         ; inst 8
  %9 = load i1, i1* %8                                                             ; inst 9
  br i1 %9, label %_3.if.then.0, label %_10.if.else.0                              ; inst 10
_3.if.then.0:
  %10 = icmp eq i1 %4, 0                                                           ; inst 11
  br i1 %10, label %_4.if.then.1, label %_5.if.else.1                              ; inst 12
_4.if.then.1:
  %11 = sext i32 %3 to i64                                                         ; inst 13
  %12 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %2, i32 0, i64 %11         ; inst 14
  %13 = getelementptr [3 x i32], [3 x i32]* %12, i32 0, i64 0                      ; inst 15
  %14 = load i32, i32* %13                                                         ; inst 16
  br label %_9.if.exit.1                                                           ; inst 17
_5.if.else.1:
  %15 = sext i32 %3 to i64                                                         ; inst 18
  %16 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %2, i32 0, i64 %15         ; inst 19
  %17 = getelementptr [3 x i32], [3 x i32]* %16, i32 0, i64 0                      ; inst 20
  %18 = load i32, i32* %17                                                         ; inst 21
  %19 = icmp ne i32 %18, %5                                                        ; inst 22
  br i1 %19, label %_6.if.then.2, label %_7.if.else.2                              ; inst 23
_6.if.then.2:
  ret i1 0                                                                         ; inst 24
_7.if.else.2:
  br label %_8.if.exit.2                                                           ; inst 25
_8.if.exit.2:
  br label %_9.if.exit.1                                                           ; inst 26
_9.if.exit.1:
  %20 = phi i1 [1, %_4.if.then.1], [%4, %_8.if.exit.2]                             ; inst 27
  %21 = phi i32 [%14, %_4.if.then.1], [%5, %_8.if.exit.2]                          ; inst 28
  br label %_11.if.exit.0                                                          ; inst 29
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 30
_11.if.exit.0:
  %22 = phi i1 [%20, %_9.if.exit.1], [%4, %_10.if.else.0]                          ; inst 31
  %23 = phi i32 [%21, %_9.if.exit.1], [%5, %_10.if.else.0]                         ; inst 32
  %24 = add i32 %3, 1                                                              ; inst 33
  br label %_1.while.cond.0                                                        ; inst 34
_12.while.exit.0:
  ret i1 %4                                                                        ; inst 35
}

define i1 @verifyHonestNodeAgreement(i32 %0, [7 x i1]* %1, [7 x [3 x i32]]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 2
  %4 = phi i1 [0, %_0.entry.0], [%23, %_11.if.exit.0]                              ; inst 3
  %5 = phi i32 [-1, %_0.entry.0], [%24, %_11.if.exit.0]                            ; inst 4
  %6 = icmp slt i32 %3, %0                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  %7 = sext i32 %3 to i64                                                          ; inst 7
  %8 = getelementptr [7 x i1], [7 x i1]* %1, i32 0, i64 %7                         ; inst 8
  %9 = load i1, i1* %8                                                             ; inst 9
  %10 = icmp eq i1 %9, 0                                                           ; inst 10
  br i1 %10, label %_3.if.then.0, label %_10.if.else.0                             ; inst 11
_3.if.then.0:
  %11 = icmp eq i1 %4, 0                                                           ; inst 12
  br i1 %11, label %_4.if.then.1, label %_5.if.else.1                              ; inst 13
_4.if.then.1:
  %12 = sext i32 %3 to i64                                                         ; inst 14
  %13 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %2, i32 0, i64 %12         ; inst 15
  %14 = getelementptr [3 x i32], [3 x i32]* %13, i32 0, i64 0                      ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  br label %_9.if.exit.1                                                           ; inst 18
_5.if.else.1:
  %16 = sext i32 %3 to i64                                                         ; inst 19
  %17 = getelementptr [7 x [3 x i32]], [7 x [3 x i32]]* %2, i32 0, i64 %16         ; inst 20
  %18 = getelementptr [3 x i32], [3 x i32]* %17, i32 0, i64 0                      ; inst 21
  %19 = load i32, i32* %18                                                         ; inst 22
  %20 = icmp ne i32 %19, %5                                                        ; inst 23
  br i1 %20, label %_6.if.then.2, label %_7.if.else.2                              ; inst 24
_6.if.then.2:
  ret i1 0                                                                         ; inst 25
_7.if.else.2:
  br label %_8.if.exit.2                                                           ; inst 26
_8.if.exit.2:
  br label %_9.if.exit.1                                                           ; inst 27
_9.if.exit.1:
  %21 = phi i1 [1, %_4.if.then.1], [%4, %_8.if.exit.2]                             ; inst 28
  %22 = phi i32 [%15, %_4.if.then.1], [%5, %_8.if.exit.2]                          ; inst 29
  br label %_11.if.exit.0                                                          ; inst 30
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 31
_11.if.exit.0:
  %23 = phi i1 [%21, %_9.if.exit.1], [%4, %_10.if.else.0]                          ; inst 32
  %24 = phi i32 [%22, %_9.if.exit.1], [%5, %_10.if.else.0]                         ; inst 33
  %25 = add i32 %3, 1                                                              ; inst 34
  br label %_1.while.cond.0                                                        ; inst 35
_12.while.exit.0:
  ret i1 %4                                                                        ; inst 36
}

define void @createBinaryPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2) {
_0.entry.0:
  %3 = sdiv i32 %0, 2                                                              ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%11, %_5.if.exit.0]                              ; inst 3
  %5 = icmp slt i32 %4, %0                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = icmp slt i32 %4, %3                                                         ; inst 6
  br i1 %6, label %_3.if.then.0, label %_4.if.else.0                               ; inst 7
_3.if.then.0:
  %7 = sext i32 %4 to i64                                                          ; inst 8
  %8 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %7                       ; inst 9
  store i32 0, i32* %8                                                             ; inst 10
  br label %_5.if.exit.0                                                           ; inst 11
_4.if.else.0:
  %9 = sext i32 %4 to i64                                                          ; inst 12
  %10 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %9                      ; inst 13
  store i32 1, i32* %10                                                            ; inst 14
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %11 = add i32 %4, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_6.while.exit.0:
  call void @updateConnectivityMatrix(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2)   ; inst 18
  ret void                                                                         ; inst 19
}

define void @createAsymmetricPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2) {
_0.entry.0:
  %3 = mul i32 %0, 2                                                               ; inst 1
  %4 = sdiv i32 %3, 3                                                              ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%12, %_5.if.exit.0]                              ; inst 4
  %6 = icmp slt i32 %5, %0                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %7 = icmp slt i32 %5, %4                                                         ; inst 7
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %8 = sext i32 %5 to i64                                                          ; inst 9
  %9 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %8                       ; inst 10
  store i32 0, i32* %9                                                             ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  %10 = sext i32 %5 to i64                                                         ; inst 13
  %11 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %10                     ; inst 14
  store i32 1, i32* %11                                                            ; inst 15
  br label %_5.if.exit.0                                                           ; inst 16
_5.if.exit.0:
  %12 = add i32 %5, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  call void @updateConnectivityMatrix(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2)   ; inst 19
  ret void                                                                         ; inst 20
}

define void @createMultiwayPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %4 = icmp slt i32 %3, %0                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 5
  %6 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %5                       ; inst 6
  %7 = srem i32 %3, 3                                                              ; inst 7
  store i32 %7, i32* %6                                                            ; inst 8
  %8 = add i32 %3, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  call void @updateConnectivityMatrix(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2)   ; inst 11
  ret void                                                                         ; inst 12
}

define void @updateConnectivityMatrix(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%24, %_8.while.exit.1]                           ; inst 2
  %4 = icmp slt i32 %3, %0                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%23, %_7.if.exit.0]                         ; inst 6
  %6 = icmp slt i32 %5, %0                                                         ; inst 7
  br i1 %6, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 8
_4.while.body.1:
  %7 = icmp eq i32 %3, %5                                                          ; inst 9
  br i1 %7, label %_5.if.then.0, label %_6.if.else.0                               ; inst 10
_5.if.then.0:
  %8 = sext i32 %3 to i64                                                          ; inst 11
  %9 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %1, i32 0, i64 %8             ; inst 12
  %10 = sext i32 %5 to i64                                                         ; inst 13
  %11 = getelementptr [7 x i1], [7 x i1]* %9, i32 0, i64 %10                       ; inst 14
  store i1 1, i1* %11                                                              ; inst 15
  br label %_7.if.exit.0                                                           ; inst 16
_6.if.else.0:
  %12 = sext i32 %3 to i64                                                         ; inst 17
  %13 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %1, i32 0, i64 %12           ; inst 18
  %14 = sext i32 %5 to i64                                                         ; inst 19
  %15 = getelementptr [7 x i1], [7 x i1]* %13, i32 0, i64 %14                      ; inst 20
  %16 = sext i32 %3 to i64                                                         ; inst 21
  %17 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %16                     ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = sext i32 %5 to i64                                                         ; inst 24
  %20 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %19                     ; inst 25
  %21 = load i32, i32* %20                                                         ; inst 26
  %22 = icmp eq i32 %18, %21                                                       ; inst 27
  store i1 %22, i1* %15                                                            ; inst 28
  br label %_7.if.exit.0                                                           ; inst 29
_7.if.exit.0:
  %23 = add i32 %5, 1                                                              ; inst 30
  br label %_3.while.cond.1                                                        ; inst 31
_8.while.exit.1:
  %24 = add i32 %3, 1                                                              ; inst 32
  br label %_1.while.cond.0                                                        ; inst 33
_9.while.exit.0:
  ret void                                                                         ; inst 34
}

define i1 @testConsensusUnderPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2) {
_0.entry.0:
  %3 = call i32 @findMaxPartitionId(i32 %0, [7 x i32]* %2)                         ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%10, %_8.if.exit.0]                              ; inst 3
  %5 = icmp sle i32 %4, %3                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = call i32 @countPartitionSize(i32 %0, [7 x i32]* %2, i32 %4)                 ; inst 6
  %7 = icmp sgt i32 %6, 0                                                          ; inst 7
  br i1 %7, label %_3.if.then.0, label %_7.if.else.0                               ; inst 8
_3.if.then.0:
  %8 = call i1 @testPartitionInternalConsensus(i32 %0, [7 x i32]* %2, i32 %4, [7 x [7 x i1]]* %1) ; inst 9
  %9 = icmp eq i1 %8, 0                                                            ; inst 10
  br i1 %9, label %_4.if.then.1, label %_5.if.else.1                               ; inst 11
_4.if.then.1:
  ret i1 0                                                                         ; inst 12
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 13
_6.if.exit.1:
  br label %_8.if.exit.0                                                           ; inst 14
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 15
_8.if.exit.0:
  %10 = add i32 %4, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_9.while.exit.0:
  ret i1 1                                                                         ; inst 18
}

define void @healNetworkPartition(i32 %0, [7 x [7 x i1]]* %1, [7 x i32]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%14, %_5.while.exit.1]                           ; inst 2
  %4 = icmp slt i32 %3, %0                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 5
  %6 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %5                       ; inst 6
  store i32 0, i32* %6                                                             ; inst 7
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %7 = phi i32 [0, %_2.while.body.0], [%13, %_4.while.body.1]                      ; inst 9
  %8 = icmp slt i32 %7, %0                                                         ; inst 10
  br i1 %8, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 11
_4.while.body.1:
  %9 = sext i32 %3 to i64                                                          ; inst 12
  %10 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %1, i32 0, i64 %9            ; inst 13
  %11 = sext i32 %7 to i64                                                         ; inst 14
  %12 = getelementptr [7 x i1], [7 x i1]* %10, i32 0, i64 %11                      ; inst 15
  store i1 1, i1* %12                                                              ; inst 16
  %13 = add i32 %7, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %14 = add i32 %3, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define i1 @testPartitionRecovery(i32 %0, [7 x [7 x i1]]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%13, %_8.while.exit.1]                           ; inst 2
  %3 = icmp slt i32 %2, %0                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%12, %_7.if.exit.0]                         ; inst 6
  %5 = icmp slt i32 %4, %0                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 8
_4.while.body.1:
  %6 = sext i32 %2 to i64                                                          ; inst 9
  %7 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %1, i32 0, i64 %6             ; inst 10
  %8 = sext i32 %4 to i64                                                          ; inst 11
  %9 = getelementptr [7 x i1], [7 x i1]* %7, i32 0, i64 %8                         ; inst 12
  %10 = load i1, i1* %9                                                            ; inst 13
  %11 = icmp eq i1 %10, 0                                                          ; inst 14
  br i1 %11, label %_5.if.then.0, label %_6.if.else.0                              ; inst 15
_5.if.then.0:
  ret i1 0                                                                         ; inst 16
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 17
_7.if.exit.0:
  %12 = add i32 %4, 1                                                              ; inst 18
  br label %_3.while.cond.1                                                        ; inst 19
_8.while.exit.1:
  %13 = add i32 %2, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_9.while.exit.0:
  ret i1 1                                                                         ; inst 22
}

define i32 @generateNodePriority(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 147                                                             ; inst 1
  %2 = add i32 %1, 73                                                              ; inst 2
  %3 = srem i32 %2, 1000                                                           ; inst 3
  ret i32 %3                                                                       ; inst 4
}

define void @simulateNodeFailures(i32 %0, [7 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%22, %_8.if.exit.0]                              ; inst 2
  %4 = icmp slt i32 %3, %0                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = mul i32 %3, 19                                                              ; inst 5
  %6 = mul i32 %2, 7                                                               ; inst 6
  %7 = add i32 %5, %6                                                              ; inst 7
  %8 = srem i32 %7, 100                                                            ; inst 8
  %9 = icmp slt i32 %8, 20                                                         ; inst 9
  br i1 %9, label %_3.if.then.0, label %_7.if.else.0                               ; inst 10
_3.if.then.0:
  %10 = sext i32 %3 to i64                                                         ; inst 11
  %11 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %10                     ; inst 12
  %12 = sext i32 %3 to i64                                                         ; inst 13
  %13 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %12                     ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = sub i32 %14, 25                                                            ; inst 16
  store i32 %15, i32* %11                                                          ; inst 17
  %16 = sext i32 %3 to i64                                                         ; inst 18
  %17 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %16                     ; inst 19
  %18 = load i32, i32* %17                                                         ; inst 20
  %19 = icmp slt i32 %18, 0                                                        ; inst 21
  br i1 %19, label %_4.if.then.1, label %_5.if.else.1                              ; inst 22
_4.if.then.1:
  %20 = sext i32 %3 to i64                                                         ; inst 23
  %21 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %20                     ; inst 24
  store i32 0, i32* %21                                                            ; inst 25
  br label %_6.if.exit.1                                                           ; inst 26
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 27
_6.if.exit.1:
  br label %_8.if.exit.0                                                           ; inst 28
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 29
_8.if.exit.0:
  %22 = add i32 %3, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  ret void                                                                         ; inst 32
}

define void @updateFailureDetectors(i32 %0, [7 x i32]* %1, [7 x [7 x i1]]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%17, %_8.while.exit.1]                           ; inst 2
  %4 = icmp slt i32 %3, %0                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%16, %_7.if.exit.0]                         ; inst 6
  %6 = icmp slt i32 %5, %0                                                         ; inst 7
  br i1 %6, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 8
_4.while.body.1:
  %7 = icmp ne i32 %3, %5                                                          ; inst 9
  br i1 %7, label %_5.if.then.0, label %_6.if.else.0                               ; inst 10
_5.if.then.0:
  %8 = sext i32 %3 to i64                                                          ; inst 11
  %9 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %2, i32 0, i64 %8             ; inst 12
  %10 = sext i32 %5 to i64                                                         ; inst 13
  %11 = getelementptr [7 x i1], [7 x i1]* %9, i32 0, i64 %10                       ; inst 14
  %12 = sext i32 %5 to i64                                                         ; inst 15
  %13 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %12                     ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = icmp slt i32 %14, 30                                                       ; inst 18
  store i1 %15, i1* %11                                                            ; inst 19
  br label %_7.if.exit.0                                                           ; inst 20
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 21
_7.if.exit.0:
  %16 = add i32 %5, 1                                                              ; inst 22
  br label %_3.while.cond.1                                                        ; inst 23
_8.while.exit.1:
  %17 = add i32 %3, 1                                                              ; inst 24
  br label %_1.while.cond.0                                                        ; inst 25
_9.while.exit.0:
  ret void                                                                         ; inst 26
}

define i32 @conductFailureAwareElection(i32 %0, [7 x i32]* %1, [7 x i32]* %2, [7 x [7 x i1]]* %3, [7 x i32]* %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [-1, %_0.entry.0], [%28, %_8.if.exit.0]                             ; inst 2
  %6 = phi i32 [-1, %_0.entry.0], [%29, %_8.if.exit.0]                             ; inst 3
  %7 = phi i32 [0, %_0.entry.0], [%30, %_8.if.exit.0]                              ; inst 4
  %8 = icmp slt i32 %7, %0                                                         ; inst 5
  br i1 %8, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %9 = sext i32 %7 to i64                                                          ; inst 7
  %10 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %9                      ; inst 8
  %11 = load i32, i32* %10                                                         ; inst 9
  %12 = icmp sgt i32 %11, 30                                                       ; inst 10
  br i1 %12, label %_3.if.then.0, label %_7.if.else.0                              ; inst 11
_3.if.then.0:
  %13 = call i32 @countDetectedFailures(i32 %7, i32 %0, [7 x [7 x i1]]* %3)        ; inst 12
  %14 = sext i32 %7 to i64                                                         ; inst 13
  %15 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %14                     ; inst 14
  %16 = load i32, i32* %15                                                         ; inst 15
  %17 = mul i32 %16, 10                                                            ; inst 16
  %18 = sext i32 %7 to i64                                                         ; inst 17
  %19 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %18                     ; inst 18
  %20 = load i32, i32* %19                                                         ; inst 19
  %21 = sub i32 %0, %13                                                            ; inst 20
  %22 = mul i32 %21, 100                                                           ; inst 21
  %23 = add i32 %17, %20                                                           ; inst 22
  %24 = add i32 %23, %22                                                           ; inst 23
  %25 = icmp sgt i32 %24, %6                                                       ; inst 24
  br i1 %25, label %_4.if.then.1, label %_5.if.else.1                              ; inst 25
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 26
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 27
_6.if.exit.1:
  %26 = phi i32 [%7, %_4.if.then.1], [%5, %_5.if.else.1]                           ; inst 28
  %27 = phi i32 [%24, %_4.if.then.1], [%6, %_5.if.else.1]                          ; inst 29
  br label %_8.if.exit.0                                                           ; inst 30
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 31
_8.if.exit.0:
  %28 = phi i32 [%26, %_6.if.exit.1], [%5, %_7.if.else.0]                          ; inst 32
  %29 = phi i32 [%27, %_6.if.exit.1], [%6, %_7.if.else.0]                          ; inst 33
  %30 = add i32 %7, 1                                                              ; inst 34
  br label %_1.while.cond.0                                                        ; inst 35
_9.while.exit.0:
  ret i32 %5                                                                       ; inst 36
}

define i1 @testLeadershipStability(i32 %0, i32 %1, [7 x i32]* %2, [7 x [7 x i1]]* %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%22, %_11.if.exit.0]                             ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%21, %_11.if.exit.0]                             ; inst 3
  %6 = icmp slt i32 %4, %1                                                         ; inst 4
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %7 = icmp ne i32 %4, %0                                                          ; inst 6
  br i1 %7, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 7
_3.lazy.then.0:
  %8 = sext i32 %4 to i64                                                          ; inst 8
  %9 = getelementptr [7 x i32], [7 x i32]* %2, i32 0, i64 %8                       ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = icmp sgt i32 %10, 30                                                       ; inst 11
  br label %_5.lazy.exit.0                                                         ; inst 12
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 13
_5.lazy.exit.0:
  %12 = phi i1 [%11, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 14
  br i1 %12, label %_6.if.then.0, label %_10.if.else.0                             ; inst 15
_6.if.then.0:
  %13 = sext i32 %4 to i64                                                         ; inst 16
  %14 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %3, i32 0, i64 %13           ; inst 17
  %15 = sext i32 %0 to i64                                                         ; inst 18
  %16 = getelementptr [7 x i1], [7 x i1]* %14, i32 0, i64 %15                      ; inst 19
  %17 = load i1, i1* %16                                                           ; inst 20
  %18 = icmp eq i1 %17, 0                                                          ; inst 21
  br i1 %18, label %_7.if.then.1, label %_8.if.else.1                              ; inst 22
_7.if.then.1:
  %19 = add i32 %5, 1                                                              ; inst 23
  br label %_9.if.exit.1                                                           ; inst 24
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 25
_9.if.exit.1:
  %20 = phi i32 [%19, %_7.if.then.1], [%5, %_8.if.else.1]                          ; inst 26
  br label %_11.if.exit.0                                                          ; inst 27
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 28
_11.if.exit.0:
  %21 = phi i32 [%20, %_9.if.exit.1], [%5, %_10.if.else.0]                         ; inst 29
  %22 = add i32 %4, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_12.while.exit.0:
  %23 = sub i32 %1, 1                                                              ; inst 32
  %24 = sdiv i32 %23, 2                                                            ; inst 33
  %25 = icmp sge i32 %5, %24                                                       ; inst 34
  ret i1 %25                                                                       ; inst 35
}

define void @simulateNodeRecovery(i32 %0, [7 x i32]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%20, %_8.if.exit.0]                              ; inst 2
  %3 = icmp slt i32 %2, %0                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %4                       ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp slt i32 %6, 100                                                        ; inst 8
  br i1 %7, label %_3.if.then.0, label %_7.if.else.0                               ; inst 9
_3.if.then.0:
  %8 = sext i32 %2 to i64                                                          ; inst 10
  %9 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %8                       ; inst 11
  %10 = sext i32 %2 to i64                                                         ; inst 12
  %11 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %10                     ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = add i32 %12, 15                                                            ; inst 15
  store i32 %13, i32* %9                                                           ; inst 16
  %14 = sext i32 %2 to i64                                                         ; inst 17
  %15 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %14                     ; inst 18
  %16 = load i32, i32* %15                                                         ; inst 19
  %17 = icmp sgt i32 %16, 100                                                      ; inst 20
  br i1 %17, label %_4.if.then.1, label %_5.if.else.1                              ; inst 21
_4.if.then.1:
  %18 = sext i32 %2 to i64                                                         ; inst 22
  %19 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %18                     ; inst 23
  store i32 100, i32* %19                                                          ; inst 24
  br label %_6.if.exit.1                                                           ; inst 25
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 26
_6.if.exit.1:
  br label %_8.if.exit.0                                                           ; inst 27
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 28
_8.if.exit.0:
  %20 = add i32 %2, 1                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_9.while.exit.0:
  ret void                                                                         ; inst 31
}

define void @generateAsyncProposals(i32 %0, [7 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%13, %_2.while.body.0]                           ; inst 2
  %4 = icmp slt i32 %3, %0                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 5
  %6 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %5                       ; inst 6
  %7 = mul i32 %2, 100                                                             ; inst 7
  %8 = mul i32 %3, 10                                                              ; inst 8
  %9 = add i32 %7, %8                                                              ; inst 9
  %10 = add i32 %2, %3                                                             ; inst 10
  %11 = srem i32 %10, 7                                                            ; inst 11
  %12 = add i32 %9, %11                                                            ; inst 12
  store i32 %12, i32* %6                                                           ; inst 13
  %13 = add i32 %3, 1                                                              ; inst 14
  br label %_1.while.cond.0                                                        ; inst 15
_3.while.exit.0:
  ret void                                                                         ; inst 16
}

define void @enqueueProposalsWithDelays(i32 %0, [7 x i32]* %1, [1000 x i32]* %2, [1000 x i32]* %3, [1000 x i32]* %4, i32* %5, i32* %6, i32* %7, i32 %8) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%35, %_5.while.body.0]                           ; inst 2
  %10 = icmp slt i32 %9, %0                                                        ; inst 3
  br i1 %10, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 4
_2.lazy.then.0:
  %11 = load i32, i32* %7                                                          ; inst 5
  %12 = icmp slt i32 %11, 1000                                                     ; inst 6
  br label %_4.lazy.exit.0                                                         ; inst 7
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 8
_4.lazy.exit.0:
  %13 = phi i1 [%12, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 9
  br i1 %13, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 10
_5.while.body.0:
  %14 = mul i32 %9, 13                                                             ; inst 11
  %15 = mul i32 %8, 7                                                              ; inst 12
  %16 = add i32 %14, %15                                                           ; inst 13
  %17 = srem i32 %16, 20                                                           ; inst 14
  %18 = load i32, i32* %6                                                          ; inst 15
  %19 = sext i32 %18 to i64                                                        ; inst 16
  %20 = getelementptr [1000 x i32], [1000 x i32]* %2, i32 0, i64 %19               ; inst 17
  %21 = sext i32 %9 to i64                                                         ; inst 18
  %22 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %21                     ; inst 19
  %23 = load i32, i32* %22                                                         ; inst 20
  store i32 %23, i32* %20                                                          ; inst 21
  %24 = load i32, i32* %6                                                          ; inst 22
  %25 = sext i32 %24 to i64                                                        ; inst 23
  %26 = getelementptr [1000 x i32], [1000 x i32]* %3, i32 0, i64 %25               ; inst 24
  store i32 %17, i32* %26                                                          ; inst 25
  %27 = load i32, i32* %6                                                          ; inst 26
  %28 = sext i32 %27 to i64                                                        ; inst 27
  %29 = getelementptr [1000 x i32], [1000 x i32]* %4, i32 0, i64 %28               ; inst 28
  store i32 %8, i32* %29                                                           ; inst 29
  %30 = load i32, i32* %6                                                          ; inst 30
  %31 = add i32 %30, 1                                                             ; inst 31
  %32 = srem i32 %31, 1000                                                         ; inst 32
  store i32 %32, i32* %6                                                           ; inst 33
  %33 = load i32, i32* %7                                                          ; inst 34
  %34 = add i32 %33, 1                                                             ; inst 35
  store i32 %34, i32* %7                                                           ; inst 36
  %35 = add i32 %9, 1                                                              ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_6.while.exit.0:
  ret void                                                                         ; inst 39
}

define i32 @processAsyncMessages([1000 x i32]* %0, [1000 x i32]* %1, [1000 x i32]* %2, i32* %3, i32* %4, i32* %5, [7 x i32]* %6, i32 %7) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%64, %_8.if.exit.0]                              ; inst 2
  %9 = phi i32 [0, %_0.entry.0], [%65, %_8.if.exit.0]                              ; inst 3
  %10 = load i32, i32* %5                                                          ; inst 4
  %11 = icmp slt i32 %9, %10                                                       ; inst 5
  br i1 %11, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 6
_2.lazy.then.0:
  %12 = load i32, i32* %5                                                          ; inst 7
  %13 = icmp sgt i32 %12, 0                                                        ; inst 8
  br label %_4.lazy.exit.0                                                         ; inst 9
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 10
_4.lazy.exit.0:
  %14 = phi i1 [%13, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 11
  br i1 %14, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 12
_5.while.body.0:
  %15 = load i32, i32* %3                                                          ; inst 13
  %16 = sext i32 %15 to i64                                                        ; inst 14
  %17 = getelementptr [1000 x i32], [1000 x i32]* %2, i32 0, i64 %16               ; inst 15
  %18 = load i32, i32* %17                                                         ; inst 16
  %19 = load i32, i32* %3                                                          ; inst 17
  %20 = sext i32 %19 to i64                                                        ; inst 18
  %21 = getelementptr [1000 x i32], [1000 x i32]* %1, i32 0, i64 %20               ; inst 19
  %22 = load i32, i32* %21                                                         ; inst 20
  %23 = add i32 %18, %22                                                           ; inst 21
  %24 = icmp sge i32 %7, %23                                                       ; inst 22
  br i1 %24, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  %25 = load i32, i32* %3                                                          ; inst 24
  %26 = sext i32 %25 to i64                                                        ; inst 25
  %27 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %26               ; inst 26
  %28 = load i32, i32* %27                                                         ; inst 27
  call void @processAsyncMessage(i32 %28, [7 x i32]* %6, i32 %7)                   ; inst 28
  %29 = load i32, i32* %3                                                          ; inst 29
  %30 = add i32 %29, 1                                                             ; inst 30
  %31 = srem i32 %30, 1000                                                         ; inst 31
  store i32 %31, i32* %3                                                           ; inst 32
  %32 = load i32, i32* %5                                                          ; inst 33
  %33 = sub i32 %32, 1                                                             ; inst 34
  store i32 %33, i32* %5                                                           ; inst 35
  %34 = add i32 %8, 1                                                              ; inst 36
  br label %_8.if.exit.0                                                           ; inst 37
_7.if.else.0:
  %35 = load i32, i32* %3                                                          ; inst 38
  %36 = load i32, i32* %3                                                          ; inst 39
  %37 = add i32 %36, 1                                                             ; inst 40
  %38 = srem i32 %37, 1000                                                         ; inst 41
  store i32 %38, i32* %3                                                           ; inst 42
  %39 = load i32, i32* %5                                                          ; inst 43
  %40 = sub i32 %39, 1                                                             ; inst 44
  store i32 %40, i32* %5                                                           ; inst 45
  %41 = load i32, i32* %4                                                          ; inst 46
  %42 = sext i32 %41 to i64                                                        ; inst 47
  %43 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %42               ; inst 48
  %44 = sext i32 %35 to i64                                                        ; inst 49
  %45 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %44               ; inst 50
  %46 = load i32, i32* %45                                                         ; inst 51
  store i32 %46, i32* %43                                                          ; inst 52
  %47 = load i32, i32* %4                                                          ; inst 53
  %48 = sext i32 %47 to i64                                                        ; inst 54
  %49 = getelementptr [1000 x i32], [1000 x i32]* %1, i32 0, i64 %48               ; inst 55
  %50 = sext i32 %35 to i64                                                        ; inst 56
  %51 = getelementptr [1000 x i32], [1000 x i32]* %1, i32 0, i64 %50               ; inst 57
  %52 = load i32, i32* %51                                                         ; inst 58
  store i32 %52, i32* %49                                                          ; inst 59
  %53 = load i32, i32* %4                                                          ; inst 60
  %54 = sext i32 %53 to i64                                                        ; inst 61
  %55 = getelementptr [1000 x i32], [1000 x i32]* %2, i32 0, i64 %54               ; inst 62
  %56 = sext i32 %35 to i64                                                        ; inst 63
  %57 = getelementptr [1000 x i32], [1000 x i32]* %2, i32 0, i64 %56               ; inst 64
  %58 = load i32, i32* %57                                                         ; inst 65
  store i32 %58, i32* %55                                                          ; inst 66
  %59 = load i32, i32* %4                                                          ; inst 67
  %60 = add i32 %59, 1                                                             ; inst 68
  %61 = srem i32 %60, 1000                                                         ; inst 69
  store i32 %61, i32* %4                                                           ; inst 70
  %62 = load i32, i32* %5                                                          ; inst 71
  %63 = add i32 %62, 1                                                             ; inst 72
  store i32 %63, i32* %5                                                           ; inst 73
  br label %_8.if.exit.0                                                           ; inst 74
_8.if.exit.0:
  %64 = phi i32 [%34, %_6.if.then.0], [%8, %_7.if.else.0]                          ; inst 75
  %65 = add i32 %9, 1                                                              ; inst 76
  br label %_1.while.cond.0                                                        ; inst 77
_9.while.exit.0:
  ret i32 %8                                                                       ; inst 78
}

define void @processAsyncMessage(i32 %0, [7 x i32]* %1, i32 %2) {
_0.entry.0:
  %3 = sdiv i32 %0, 10                                                             ; inst 1
  %4 = srem i32 %3, 7                                                              ; inst 2
  %5 = icmp sge i32 %4, 0                                                          ; inst 3
  br i1 %5, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 4
_1.lazy.then.0:
  %6 = icmp slt i32 %4, 7                                                          ; inst 5
  br label %_3.lazy.exit.0                                                         ; inst 6
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 7
_3.lazy.exit.0:
  %7 = phi i1 [%6, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 8
  br i1 %7, label %_4.if.then.0, label %_8.if.else.0                               ; inst 9
_4.if.then.0:
  %8 = sext i32 %4 to i64                                                          ; inst 10
  %9 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %8                       ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  %11 = icmp eq i32 %10, -1                                                        ; inst 13
  br i1 %11, label %_5.if.then.1, label %_6.if.else.1                              ; inst 14
_5.if.then.1:
  %12 = sext i32 %4 to i64                                                         ; inst 15
  %13 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %12                     ; inst 16
  store i32 %0, i32* %13                                                           ; inst 17
  br label %_7.if.exit.1                                                           ; inst 18
_6.if.else.1:
  br label %_7.if.exit.1                                                           ; inst 19
_7.if.exit.1:
  br label %_9.if.exit.0                                                           ; inst 20
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 21
_9.if.exit.0:
  ret void                                                                         ; inst 22
}

define i1 @checkAsyncConsensus(i32 %0, [7 x i32]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%26, %_11.if.exit.0]                             ; inst 2
  %3 = phi i1 [1, %_0.entry.0], [%23, %_11.if.exit.0]                              ; inst 3
  %4 = phi i32 [-1, %_0.entry.0], [%24, %_11.if.exit.0]                            ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 5
  %6 = icmp slt i32 %2, %0                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 7
_2.while.body.0:
  %7 = sext i32 %2 to i64                                                          ; inst 8
  %8 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %7                       ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = icmp ne i32 %9, -1                                                         ; inst 11
  br i1 %10, label %_3.if.then.0, label %_10.if.else.0                             ; inst 12
_3.if.then.0:
  %11 = add i32 %5, 1                                                              ; inst 13
  %12 = icmp eq i32 %4, -1                                                         ; inst 14
  br i1 %12, label %_4.if.then.1, label %_5.if.else.1                              ; inst 15
_4.if.then.1:
  %13 = sext i32 %2 to i64                                                         ; inst 16
  %14 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %13                     ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  br label %_9.if.exit.1                                                           ; inst 19
_5.if.else.1:
  %16 = sext i32 %2 to i64                                                         ; inst 20
  %17 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %16                     ; inst 21
  %18 = load i32, i32* %17                                                         ; inst 22
  %19 = icmp ne i32 %18, %4                                                        ; inst 23
  br i1 %19, label %_6.if.then.2, label %_7.if.else.2                              ; inst 24
_6.if.then.2:
  br label %_8.if.exit.2                                                           ; inst 25
_7.if.else.2:
  br label %_8.if.exit.2                                                           ; inst 26
_8.if.exit.2:
  %20 = phi i1 [0, %_6.if.then.2], [%3, %_7.if.else.2]                             ; inst 27
  br label %_9.if.exit.1                                                           ; inst 28
_9.if.exit.1:
  %21 = phi i1 [%3, %_4.if.then.1], [%20, %_8.if.exit.2]                           ; inst 29
  %22 = phi i32 [%15, %_4.if.then.1], [%4, %_8.if.exit.2]                          ; inst 30
  br label %_11.if.exit.0                                                          ; inst 31
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 32
_11.if.exit.0:
  %23 = phi i1 [%21, %_9.if.exit.1], [%3, %_10.if.else.0]                          ; inst 33
  %24 = phi i32 [%22, %_9.if.exit.1], [%4, %_10.if.else.0]                         ; inst 34
  %25 = phi i32 [%11, %_9.if.exit.1], [%5, %_10.if.else.0]                         ; inst 35
  %26 = add i32 %2, 1                                                              ; inst 36
  br label %_1.while.cond.0                                                        ; inst 37
_12.while.exit.0:
  %27 = sdiv i32 %0, 2                                                             ; inst 38
  %28 = add i32 %27, 1                                                             ; inst 39
  %29 = icmp sge i32 %5, %28                                                       ; inst 40
  br i1 %29, label %_13.lazy.then.0, label %_14.lazy.else.0                        ; inst 41
_13.lazy.then.0:
  br label %_15.lazy.exit.0                                                        ; inst 42
_14.lazy.else.0:
  br label %_15.lazy.exit.0                                                        ; inst 43
_15.lazy.exit.0:
  %30 = phi i1 [%3, %_13.lazy.then.0], [0, %_14.lazy.else.0]                       ; inst 44
  ret i1 %30                                                                       ; inst 45
}

define i32 @extractConsensusValue(i32 %0, [7 x i32]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%11, %_5.if.exit.0]                              ; inst 2
  %3 = icmp slt i32 %2, %0                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %4                       ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp ne i32 %6, -1                                                          ; inst 8
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 9
_3.if.then.0:
  %8 = sext i32 %2 to i64                                                          ; inst 10
  %9 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %8                       ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  ret i32 %10                                                                      ; inst 13
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 14
_5.if.exit.0:
  %11 = add i32 %2, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  ret i32 -1                                                                       ; inst 17
}

define void @resetNodeDecisions(i32 %0, [7 x i32]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 2
  %3 = icmp slt i32 %2, %0                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %4                       ; inst 6
  store i32 -1, i32* %5                                                            ; inst 7
  %6 = add i32 %2, 1                                                               ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  ret void                                                                         ; inst 10
}

define i1 @verifyConsensusHistory([100 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %1, 1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i1 1                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %3 = phi i32 [1, %_3.if.exit.0], [%13, %_8.if.exit.1]                            ; inst 6
  %4 = icmp slt i32 %3, %1                                                         ; inst 7
  br i1 %4, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 8
_5.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 9
  %6 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %5                   ; inst 10
  %7 = load i32, i32* %6                                                           ; inst 11
  %8 = sext i32 %3 to i64                                                          ; inst 12
  %9 = sub i64 %8, 1                                                               ; inst 13
  %10 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %9                  ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = icmp sle i32 %7, %11                                                       ; inst 16
  br i1 %12, label %_6.if.then.1, label %_7.if.else.1                              ; inst 17
_6.if.then.1:
  ret i1 0                                                                         ; inst 18
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 19
_8.if.exit.1:
  %13 = add i32 %3, 1                                                              ; inst 20
  br label %_4.while.cond.0                                                        ; inst 21
_9.while.exit.0:
  ret i1 1                                                                         ; inst 22
}

define i32 @findMaxPartitionId(i32 %0, [7 x i32]* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%12, %_5.if.exit.0]                              ; inst 3
  %4 = icmp slt i32 %2, %0                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %5                       ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp sgt i32 %7, %3                                                         ; inst 9
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %9 = sext i32 %2 to i64                                                          ; inst 11
  %10 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %9                      ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  br label %_5.if.exit.0                                                           ; inst 14
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %12 = phi i32 [%11, %_3.if.then.0], [%3, %_4.if.else.0]                          ; inst 16
  %13 = add i32 %2, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 19
}

define i32 @countPartitionSize(i32 %0, [7 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%12, %_5.if.exit.0]                              ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%11, %_5.if.exit.0]                              ; inst 3
  %5 = icmp slt i32 %3, %0                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 6
  %7 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %6                       ; inst 7
  %8 = load i32, i32* %7                                                           ; inst 8
  %9 = icmp eq i32 %8, %2                                                          ; inst 9
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %10 = add i32 %4, 1                                                              ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %11 = phi i32 [%10, %_3.if.then.0], [%4, %_4.if.else.0]                          ; inst 14
  %12 = add i32 %3, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  ret i32 %4                                                                       ; inst 17
}

define i1 @testPartitionInternalConsensus(i32 %0, [7 x i32]* %1, i32 %2, [7 x [7 x i1]]* %3) {
_0.entry.0:
  %4 = call i32 @countPartitionSize(i32 %0, [7 x i32]* %1, i32 %2)                 ; inst 1
  %5 = icmp sle i32 %4, 1                                                          ; inst 2
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i1 1                                                                         ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 6
_4.while.cond.0:
  %6 = phi i32 [0, %_3.if.exit.0], [%22, %_14.if.exit.1]                           ; inst 7
  %7 = phi i32 [-1, %_3.if.exit.0], [%21, %_14.if.exit.1]                          ; inst 8
  %8 = icmp slt i32 %6, %0                                                         ; inst 9
  br i1 %8, label %_5.while.body.0, label %_15.while.exit.0                        ; inst 10
_5.while.body.0:
  %9 = sext i32 %6 to i64                                                          ; inst 11
  %10 = getelementptr [7 x i32], [7 x i32]* %1, i32 0, i64 %9                      ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = icmp eq i32 %11, %2                                                        ; inst 14
  br i1 %12, label %_6.if.then.1, label %_13.if.else.1                             ; inst 15
_6.if.then.1:
  %13 = icmp eq i32 %7, -1                                                         ; inst 16
  br i1 %13, label %_7.if.then.2, label %_8.if.else.2                              ; inst 17
_7.if.then.2:
  br label %_12.if.exit.2                                                          ; inst 18
_8.if.else.2:
  %14 = sext i32 %7 to i64                                                         ; inst 19
  %15 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %3, i32 0, i64 %14           ; inst 20
  %16 = sext i32 %6 to i64                                                         ; inst 21
  %17 = getelementptr [7 x i1], [7 x i1]* %15, i32 0, i64 %16                      ; inst 22
  %18 = load i1, i1* %17                                                           ; inst 23
  %19 = icmp eq i1 %18, 0                                                          ; inst 24
  br i1 %19, label %_9.if.then.3, label %_10.if.else.3                             ; inst 25
_9.if.then.3:
  ret i1 0                                                                         ; inst 26
_10.if.else.3:
  br label %_11.if.exit.3                                                          ; inst 27
_11.if.exit.3:
  br label %_12.if.exit.2                                                          ; inst 28
_12.if.exit.2:
  %20 = phi i32 [%6, %_7.if.then.2], [%7, %_11.if.exit.3]                          ; inst 29
  br label %_14.if.exit.1                                                          ; inst 30
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 31
_14.if.exit.1:
  %21 = phi i32 [%20, %_12.if.exit.2], [%7, %_13.if.else.1]                        ; inst 32
  %22 = add i32 %6, 1                                                              ; inst 33
  br label %_4.while.cond.0                                                        ; inst 34
_15.while.exit.0:
  ret i1 1                                                                         ; inst 35
}

define i32 @countDetectedFailures(i32 %0, i32 %1, [7 x [7 x i1]]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%15, %_8.if.exit.0]                              ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%14, %_8.if.exit.0]                              ; inst 3
  %5 = icmp slt i32 %3, %1                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = icmp ne i32 %3, %0                                                          ; inst 6
  br i1 %6, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 7
_3.lazy.then.0:
  %7 = sext i32 %0 to i64                                                          ; inst 8
  %8 = getelementptr [7 x [7 x i1]], [7 x [7 x i1]]* %2, i32 0, i64 %7             ; inst 9
  %9 = sext i32 %3 to i64                                                          ; inst 10
  %10 = getelementptr [7 x i1], [7 x i1]* %8, i32 0, i64 %9                        ; inst 11
  %11 = load i1, i1* %10                                                           ; inst 12
  br label %_5.lazy.exit.0                                                         ; inst 13
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 14
_5.lazy.exit.0:
  %12 = phi i1 [%11, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 15
  br i1 %12, label %_6.if.then.0, label %_7.if.else.0                              ; inst 16
_6.if.then.0:
  %13 = add i32 %4, 1                                                              ; inst 17
  br label %_8.if.exit.0                                                           ; inst 18
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 19
_8.if.exit.0:
  %14 = phi i32 [%13, %_6.if.then.0], [%4, %_7.if.else.0]                          ; inst 20
  %15 = add i32 %3, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_9.while.exit.0:
  ret i32 %4                                                                       ; inst 23
}

