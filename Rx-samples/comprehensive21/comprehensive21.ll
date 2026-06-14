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


%DataSet = type { [10000 x i32], i32, i1, i32, i32, i32, i32 }
%Matrix = type { [100 x [100 x i32]], i32, i32 }
%PerformanceCounter = type { i32, i32, i32, i32, i32 }
%SortingResults = type { i32, i32, i32, i32, i32, i32 }

define void @init_dataset_pattern(%DataSet* sret(%DataSet) %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca %DataSet                                                             ; inst 1
  %4 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 0                          ; inst 2
  %5 = getelementptr [10000 x i32], [10000 x i32]* %4, i32 0, i32 0                ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 5
  %7 = icmp slt i32 %6, 10000                                                      ; inst 6
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 8
  store i32 0, i32* %8                                                             ; inst 9
  %9 = add i32 %6, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %10 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 1                         ; inst 12
  store i32 %2, i32* %10                                                           ; inst 13
  %11 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 2                         ; inst 14
  store i1 0, i1* %11                                                              ; inst 15
  %12 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 3                         ; inst 16
  store i32 999999, i32* %12                                                       ; inst 17
  %13 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 4                         ; inst 18
  store i32 -999999, i32* %13                                                      ; inst 19
  %14 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 5                         ; inst 20
  store i32 0, i32* %14                                                            ; inst 21
  %15 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 6                         ; inst 22
  store i32 0, i32* %15                                                            ; inst 23
  br label %_4.while.cond.0                                                        ; inst 24
_4.while.cond.0:
  %16 = phi i32 [0, %_3.array.exit.0], [%90, %_44.if.exit.12]                      ; inst 25
  %17 = icmp slt i32 %16, %2                                                       ; inst 26
  br i1 %17, label %_5.while.body.0, label %_45.while.exit.0                       ; inst 27
_5.while.body.0:
  %18 = icmp eq i32 %1, 0                                                          ; inst 28
  br i1 %18, label %_6.if.then.0, label %_7.if.else.0                              ; inst 29
_6.if.then.0:
  %19 = mul i32 %16, 11047                                                         ; inst 30
  %20 = add i32 %19, 12345                                                         ; inst 31
  %21 = srem i32 %20, 100000                                                       ; inst 32
  br label %_38.if.exit.0                                                          ; inst 33
_7.if.else.0:
  %22 = icmp eq i32 %1, 1                                                          ; inst 34
  br i1 %22, label %_8.if.then.1, label %_9.if.else.1                              ; inst 35
_8.if.then.1:
  %23 = mul i32 %16, 3                                                             ; inst 36
  %24 = add i32 %23, 7                                                             ; inst 37
  br label %_37.if.exit.1                                                          ; inst 38
_9.if.else.1:
  %25 = icmp eq i32 %1, 2                                                          ; inst 39
  br i1 %25, label %_10.if.then.2, label %_11.if.else.2                            ; inst 40
_10.if.then.2:
  %26 = sub i32 %2, %16                                                            ; inst 41
  %27 = mul i32 %26, 5                                                             ; inst 42
  %28 = add i32 %27, 13                                                            ; inst 43
  br label %_36.if.exit.2                                                          ; inst 44
_11.if.else.2:
  %29 = icmp eq i32 %1, 3                                                          ; inst 45
  br i1 %29, label %_12.if.then.3, label %_16.if.else.3                            ; inst 46
_12.if.then.3:
  %30 = sdiv i32 %2, 2                                                             ; inst 47
  %31 = icmp slt i32 %16, %30                                                      ; inst 48
  br i1 %31, label %_13.if.then.4, label %_14.if.else.4                            ; inst 49
_13.if.then.4:
  %32 = mul i32 %16, 4                                                             ; inst 50
  br label %_15.if.exit.4                                                          ; inst 51
_14.if.else.4:
  %33 = sub i32 %2, %16                                                            ; inst 52
  %34 = mul i32 %33, 4                                                             ; inst 53
  br label %_15.if.exit.4                                                          ; inst 54
_15.if.exit.4:
  %35 = phi i32 [%32, %_13.if.then.4], [%34, %_14.if.else.4]                       ; inst 55
  br label %_35.if.exit.3                                                          ; inst 56
_16.if.else.3:
  %36 = icmp eq i32 %1, 4                                                          ; inst 57
  br i1 %36, label %_17.if.then.5, label %_21.if.else.5                            ; inst 58
_17.if.then.5:
  %37 = sdiv i32 %2, 2                                                             ; inst 59
  %38 = icmp slt i32 %16, %37                                                      ; inst 60
  br i1 %38, label %_18.if.then.6, label %_19.if.else.6                            ; inst 61
_18.if.then.6:
  %39 = sdiv i32 %2, 2                                                             ; inst 62
  %40 = sub i32 %39, %16                                                           ; inst 63
  %41 = mul i32 %40, 3                                                             ; inst 64
  br label %_20.if.exit.6                                                          ; inst 65
_19.if.else.6:
  %42 = sdiv i32 %2, 2                                                             ; inst 66
  %43 = sub i32 %16, %42                                                           ; inst 67
  %44 = mul i32 %43, 3                                                             ; inst 68
  br label %_20.if.exit.6                                                          ; inst 69
_20.if.exit.6:
  %45 = phi i32 [%41, %_18.if.then.6], [%44, %_19.if.else.6]                       ; inst 70
  br label %_34.if.exit.5                                                          ; inst 71
_21.if.else.5:
  %46 = icmp eq i32 %1, 5                                                          ; inst 72
  br i1 %46, label %_22.if.then.7, label %_23.if.else.7                            ; inst 73
_22.if.then.7:
  %47 = mul i32 %16, 2                                                             ; inst 74
  %48 = srem i32 %16, 10                                                           ; inst 75
  %49 = icmp eq i32 %48, 5                                                         ; inst 76
  %50 = zext i1 %49 to i32                                                         ; inst 77
  %51 = mul i32 %50, 100                                                           ; inst 78
  %52 = add i32 %47, %51                                                           ; inst 79
  br label %_33.if.exit.7                                                          ; inst 80
_23.if.else.7:
  %53 = icmp eq i32 %1, 6                                                          ; inst 81
  br i1 %53, label %_24.if.then.8, label %_25.if.else.8                            ; inst 82
_24.if.then.8:
  %54 = sdiv i32 %16, 10                                                           ; inst 83
  %55 = mul i32 %54, 7                                                             ; inst 84
  %56 = add i32 %55, 23                                                            ; inst 85
  br label %_32.if.exit.8                                                          ; inst 86
_25.if.else.8:
  %57 = icmp eq i32 %1, 7                                                          ; inst 87
  br i1 %57, label %_26.if.then.9, label %_30.if.else.9                            ; inst 88
_26.if.then.9:
  %58 = srem i32 %16, 2                                                            ; inst 89
  %59 = icmp eq i32 %58, 0                                                         ; inst 90
  br i1 %59, label %_27.if.then.10, label %_28.if.else.10                          ; inst 91
_27.if.then.10:
  br label %_29.if.exit.10                                                         ; inst 92
_28.if.else.10:
  %60 = sub i32 %2, %16                                                            ; inst 93
  br label %_29.if.exit.10                                                         ; inst 94
_29.if.exit.10:
  %61 = phi i32 [%16, %_27.if.then.10], [%60, %_28.if.else.10]                     ; inst 95
  br label %_31.if.exit.9                                                          ; inst 96
_30.if.else.9:
  %62 = mul i32 %16, %16                                                           ; inst 97
  %63 = mul i32 %16, 7                                                             ; inst 98
  %64 = add i32 %62, %63                                                           ; inst 99
  %65 = add i32 %64, 17                                                            ; inst 100
  %66 = srem i32 %65, 1000                                                         ; inst 101
  br label %_31.if.exit.9                                                          ; inst 102
_31.if.exit.9:
  %67 = phi i32 [%61, %_29.if.exit.10], [%66, %_30.if.else.9]                      ; inst 103
  br label %_32.if.exit.8                                                          ; inst 104
_32.if.exit.8:
  %68 = phi i32 [%56, %_24.if.then.8], [%67, %_31.if.exit.9]                       ; inst 105
  br label %_33.if.exit.7                                                          ; inst 106
_33.if.exit.7:
  %69 = phi i32 [%52, %_22.if.then.7], [%68, %_32.if.exit.8]                       ; inst 107
  br label %_34.if.exit.5                                                          ; inst 108
_34.if.exit.5:
  %70 = phi i32 [%45, %_20.if.exit.6], [%69, %_33.if.exit.7]                       ; inst 109
  br label %_35.if.exit.3                                                          ; inst 110
_35.if.exit.3:
  %71 = phi i32 [%35, %_15.if.exit.4], [%70, %_34.if.exit.5]                       ; inst 111
  br label %_36.if.exit.2                                                          ; inst 112
_36.if.exit.2:
  %72 = phi i32 [%28, %_10.if.then.2], [%71, %_35.if.exit.3]                       ; inst 113
  br label %_37.if.exit.1                                                          ; inst 114
_37.if.exit.1:
  %73 = phi i32 [%24, %_8.if.then.1], [%72, %_36.if.exit.2]                        ; inst 115
  br label %_38.if.exit.0                                                          ; inst 116
_38.if.exit.0:
  %74 = phi i32 [%21, %_6.if.then.0], [%73, %_37.if.exit.1]                        ; inst 117
  %75 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 0                         ; inst 118
  %76 = sext i32 %16 to i64                                                        ; inst 119
  %77 = getelementptr [10000 x i32], [10000 x i32]* %75, i32 0, i64 %76            ; inst 120
  store i32 %74, i32* %77                                                          ; inst 121
  %78 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 5                         ; inst 122
  %79 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 5                         ; inst 123
  %80 = load i32, i32* %79                                                         ; inst 124
  %81 = add i32 %80, %74                                                           ; inst 125
  store i32 %81, i32* %78                                                          ; inst 126
  %82 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 3                         ; inst 127
  %83 = load i32, i32* %82                                                         ; inst 128
  %84 = icmp slt i32 %74, %83                                                      ; inst 129
  br i1 %84, label %_39.if.then.11, label %_40.if.else.11                          ; inst 130
_39.if.then.11:
  %85 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 3                         ; inst 131
  store i32 %74, i32* %85                                                          ; inst 132
  br label %_41.if.exit.11                                                         ; inst 133
_40.if.else.11:
  br label %_41.if.exit.11                                                         ; inst 134
_41.if.exit.11:
  %86 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 4                         ; inst 135
  %87 = load i32, i32* %86                                                         ; inst 136
  %88 = icmp sgt i32 %74, %87                                                      ; inst 137
  br i1 %88, label %_42.if.then.12, label %_43.if.else.12                          ; inst 138
_42.if.then.12:
  %89 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 4                         ; inst 139
  store i32 %74, i32* %89                                                          ; inst 140
  br label %_44.if.exit.12                                                         ; inst 141
_43.if.else.12:
  br label %_44.if.exit.12                                                         ; inst 142
_44.if.exit.12:
  %90 = add i32 %16, 1                                                             ; inst 143
  br label %_4.while.cond.0                                                        ; inst 144
_45.while.exit.0:
  %91 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 6                         ; inst 145
  %92 = getelementptr %DataSet, %DataSet* %3, i32 0, i32 5                         ; inst 146
  %93 = load i32, i32* %92                                                         ; inst 147
  %94 = sdiv i32 %93, %2                                                           ; inst 148
  store i32 %94, i32* %91                                                          ; inst 149
  call void @memcpy(%DataSet* %0, %DataSet* %3, i64 40024)                         ; inst 150
  ret void                                                                         ; inst 151
}

define void @init_performance_counter(%PerformanceCounter* sret(%PerformanceCounter) %0) {
_0.entry.0:
  %1 = getelementptr %PerformanceCounter, %PerformanceCounter* %0, i32 0, i32 0    ; inst 1
  store i32 0, i32* %1                                                             ; inst 2
  %2 = getelementptr %PerformanceCounter, %PerformanceCounter* %0, i32 0, i32 1    ; inst 3
  store i32 0, i32* %2                                                             ; inst 4
  %3 = getelementptr %PerformanceCounter, %PerformanceCounter* %0, i32 0, i32 2    ; inst 5
  store i32 0, i32* %3                                                             ; inst 6
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %0, i32 0, i32 3    ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = getelementptr %PerformanceCounter, %PerformanceCounter* %0, i32 0, i32 4    ; inst 9
  store i32 0, i32* %5                                                             ; inst 10
  ret void                                                                         ; inst 11
}

define void @bubble_sort([10000 x i32]* %0, i32 %1, %PerformanceCounter* %2) {
_0.entry.0:
  %3 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 1
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = add i32 %5, 1                                                               ; inst 4
  store i32 %6, i32* %3                                                            ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%54, %_11.if.exit.1]                             ; inst 7
  %8 = sub i32 %1, 1                                                               ; inst 8
  %9 = icmp slt i32 %7, %8                                                         ; inst 9
  br i1 %9, label %_2.while.body.0, label %_13.critical_edge.0                     ; inst 10
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 11
_3.while.cond.1:
  %10 = phi i32 [0, %_2.while.body.0], [%52, %_7.if.exit.0]                        ; inst 12
  %11 = phi i1 [0, %_2.while.body.0], [%51, %_7.if.exit.0]                         ; inst 13
  %12 = sub i32 %1, %7                                                             ; inst 14
  %13 = sub i32 %12, 1                                                             ; inst 15
  %14 = icmp slt i32 %10, %13                                                      ; inst 16
  br i1 %14, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 17
_4.while.body.1:
  %15 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 1   ; inst 18
  %16 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 1   ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = add i32 %17, 1                                                             ; inst 21
  store i32 %18, i32* %15                                                          ; inst 22
  %19 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 23
  %20 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 24
  %21 = load i32, i32* %20                                                         ; inst 25
  %22 = add i32 %21, 2                                                             ; inst 26
  store i32 %22, i32* %19                                                          ; inst 27
  %23 = sext i32 %10 to i64                                                        ; inst 28
  %24 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %23             ; inst 29
  %25 = load i32, i32* %24                                                         ; inst 30
  %26 = sext i32 %10 to i64                                                        ; inst 31
  %27 = add i64 %26, 1                                                             ; inst 32
  %28 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %27             ; inst 33
  %29 = load i32, i32* %28                                                         ; inst 34
  %30 = icmp sgt i32 %25, %29                                                      ; inst 35
  br i1 %30, label %_5.if.then.0, label %_6.if.else.0                              ; inst 36
_5.if.then.0:
  %31 = sext i32 %10 to i64                                                        ; inst 37
  %32 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %31             ; inst 38
  %33 = load i32, i32* %32                                                         ; inst 39
  %34 = sext i32 %10 to i64                                                        ; inst 40
  %35 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %34             ; inst 41
  %36 = sext i32 %10 to i64                                                        ; inst 42
  %37 = add i64 %36, 1                                                             ; inst 43
  %38 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %37             ; inst 44
  %39 = load i32, i32* %38                                                         ; inst 45
  store i32 %39, i32* %35                                                          ; inst 46
  %40 = sext i32 %10 to i64                                                        ; inst 47
  %41 = add i64 %40, 1                                                             ; inst 48
  %42 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %41             ; inst 49
  store i32 %33, i32* %42                                                          ; inst 50
  %43 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 2   ; inst 51
  %44 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 2   ; inst 52
  %45 = load i32, i32* %44                                                         ; inst 53
  %46 = add i32 %45, 1                                                             ; inst 54
  store i32 %46, i32* %43                                                          ; inst 55
  %47 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 56
  %48 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 57
  %49 = load i32, i32* %48                                                         ; inst 58
  %50 = add i32 %49, 4                                                             ; inst 59
  store i32 %50, i32* %47                                                          ; inst 60
  br label %_7.if.exit.0                                                           ; inst 61
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 62
_7.if.exit.0:
  %51 = phi i1 [1, %_5.if.then.0], [%11, %_6.if.else.0]                            ; inst 63
  %52 = add i32 %10, 1                                                             ; inst 64
  br label %_3.while.cond.1                                                        ; inst 65
_8.while.exit.1:
  %53 = icmp eq i1 %11, 0                                                          ; inst 66
  br i1 %53, label %_9.if.then.1, label %_10.if.else.1                             ; inst 67
_9.if.then.1:
  br label %_12.while.exit.0                                                       ; inst 68
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 69
_11.if.exit.1:
  %54 = add i32 %7, 1                                                              ; inst 70
  br label %_1.while.cond.0                                                        ; inst 71
_12.while.exit.0:
  %55 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 72
  %56 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 73
  %57 = load i32, i32* %56                                                         ; inst 74
  %58 = mul i32 %1, %1                                                             ; inst 75
  %59 = add i32 %57, %58                                                           ; inst 76
  store i32 %59, i32* %55                                                          ; inst 77
  ret void                                                                         ; inst 78
_13.critical_edge.0:
  br label %_12.while.exit.0                                                       ; inst 79
}

define void @selection_sort([10000 x i32]* %0, i32 %1, %PerformanceCounter* %2) {
_0.entry.0:
  %3 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 1
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = add i32 %5, 1                                                               ; inst 4
  store i32 %6, i32* %3                                                            ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%50, %_11.if.exit.1]                             ; inst 7
  %8 = sub i32 %1, 1                                                               ; inst 8
  %9 = icmp slt i32 %7, %8                                                         ; inst 9
  br i1 %9, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 10
_2.while.body.0:
  %10 = add i32 %7, 1                                                              ; inst 11
  br label %_3.while.cond.1                                                        ; inst 12
_3.while.cond.1:
  %11 = phi i32 [%7, %_2.while.body.0], [%29, %_7.if.exit.0]                       ; inst 13
  %12 = phi i32 [%10, %_2.while.body.0], [%30, %_7.if.exit.0]                      ; inst 14
  %13 = icmp slt i32 %12, %1                                                       ; inst 15
  br i1 %13, label %_4.while.body.1, label %_8.while.exit.1                        ; inst 16
_4.while.body.1:
  %14 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 1   ; inst 17
  %15 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 1   ; inst 18
  %16 = load i32, i32* %15                                                         ; inst 19
  %17 = add i32 %16, 1                                                             ; inst 20
  store i32 %17, i32* %14                                                          ; inst 21
  %18 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 22
  %19 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = add i32 %20, 2                                                             ; inst 25
  store i32 %21, i32* %18                                                          ; inst 26
  %22 = sext i32 %12 to i64                                                        ; inst 27
  %23 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %22             ; inst 28
  %24 = load i32, i32* %23                                                         ; inst 29
  %25 = sext i32 %11 to i64                                                        ; inst 30
  %26 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %25             ; inst 31
  %27 = load i32, i32* %26                                                         ; inst 32
  %28 = icmp slt i32 %24, %27                                                      ; inst 33
  br i1 %28, label %_5.if.then.0, label %_6.if.else.0                              ; inst 34
_5.if.then.0:
  br label %_7.if.exit.0                                                           ; inst 35
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 36
_7.if.exit.0:
  %29 = phi i32 [%12, %_5.if.then.0], [%11, %_6.if.else.0]                         ; inst 37
  %30 = add i32 %12, 1                                                             ; inst 38
  br label %_3.while.cond.1                                                        ; inst 39
_8.while.exit.1:
  %31 = icmp ne i32 %11, %7                                                        ; inst 40
  br i1 %31, label %_9.if.then.1, label %_10.if.else.1                             ; inst 41
_9.if.then.1:
  %32 = sext i32 %7 to i64                                                         ; inst 42
  %33 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %32             ; inst 43
  %34 = load i32, i32* %33                                                         ; inst 44
  %35 = sext i32 %7 to i64                                                         ; inst 45
  %36 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %35             ; inst 46
  %37 = sext i32 %11 to i64                                                        ; inst 47
  %38 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %37             ; inst 48
  %39 = load i32, i32* %38                                                         ; inst 49
  store i32 %39, i32* %36                                                          ; inst 50
  %40 = sext i32 %11 to i64                                                        ; inst 51
  %41 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %40             ; inst 52
  store i32 %34, i32* %41                                                          ; inst 53
  %42 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 2   ; inst 54
  %43 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 2   ; inst 55
  %44 = load i32, i32* %43                                                         ; inst 56
  %45 = add i32 %44, 1                                                             ; inst 57
  store i32 %45, i32* %42                                                          ; inst 58
  %46 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 59
  %47 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 60
  %48 = load i32, i32* %47                                                         ; inst 61
  %49 = add i32 %48, 4                                                             ; inst 62
  store i32 %49, i32* %46                                                          ; inst 63
  br label %_11.if.exit.1                                                          ; inst 64
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 65
_11.if.exit.1:
  %50 = add i32 %7, 1                                                              ; inst 66
  br label %_1.while.cond.0                                                        ; inst 67
_12.while.exit.0:
  %51 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 68
  %52 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 69
  %53 = load i32, i32* %52                                                         ; inst 70
  %54 = mul i32 %1, %1                                                             ; inst 71
  %55 = add i32 %53, %54                                                           ; inst 72
  store i32 %55, i32* %51                                                          ; inst 73
  ret void                                                                         ; inst 74
}

define void @insertion_sort([10000 x i32]* %0, i32 %1, %PerformanceCounter* %2) {
_0.entry.0:
  %3 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 1
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = add i32 %5, 1                                                               ; inst 4
  store i32 %6, i32* %3                                                            ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %7 = phi i32 [1, %_0.entry.0], [%50, %_8.while.exit.1]                           ; inst 7
  %8 = icmp slt i32 %7, %1                                                         ; inst 8
  br i1 %8, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 9
_2.while.body.0:
  %9 = sext i32 %7 to i64                                                          ; inst 10
  %10 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %9              ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = sub i32 %7, 1                                                              ; inst 13
  %13 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 14
  %14 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 15
  %15 = load i32, i32* %14                                                         ; inst 16
  %16 = add i32 %15, 1                                                             ; inst 17
  store i32 %16, i32* %13                                                          ; inst 18
  br label %_3.while.cond.1                                                        ; inst 19
_3.while.cond.1:
  %17 = phi i32 [%12, %_2.while.body.0], [%42, %_7.while.body.1]                   ; inst 20
  %18 = icmp sge i32 %17, 0                                                        ; inst 21
  br i1 %18, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 22
_4.lazy.then.0:
  %19 = sext i32 %17 to i64                                                        ; inst 23
  %20 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %19             ; inst 24
  %21 = load i32, i32* %20                                                         ; inst 25
  %22 = icmp sgt i32 %21, %11                                                      ; inst 26
  br label %_6.lazy.exit.0                                                         ; inst 27
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 28
_6.lazy.exit.0:
  %23 = phi i1 [%22, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 29
  br i1 %23, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 30
_7.while.body.1:
  %24 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 1   ; inst 31
  %25 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 1   ; inst 32
  %26 = load i32, i32* %25                                                         ; inst 33
  %27 = add i32 %26, 1                                                             ; inst 34
  store i32 %27, i32* %24                                                          ; inst 35
  %28 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 36
  %29 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 37
  %30 = load i32, i32* %29                                                         ; inst 38
  %31 = add i32 %30, 2                                                             ; inst 39
  store i32 %31, i32* %28                                                          ; inst 40
  %32 = sext i32 %17 to i64                                                        ; inst 41
  %33 = add i64 %32, 1                                                             ; inst 42
  %34 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %33             ; inst 43
  %35 = sext i32 %17 to i64                                                        ; inst 44
  %36 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %35             ; inst 45
  %37 = load i32, i32* %36                                                         ; inst 46
  store i32 %37, i32* %34                                                          ; inst 47
  %38 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 48
  %39 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 49
  %40 = load i32, i32* %39                                                         ; inst 50
  %41 = add i32 %40, 2                                                             ; inst 51
  store i32 %41, i32* %38                                                          ; inst 52
  %42 = sub i32 %17, 1                                                             ; inst 53
  br label %_3.while.cond.1                                                        ; inst 54
_8.while.exit.1:
  %43 = sext i32 %17 to i64                                                        ; inst 55
  %44 = add i64 %43, 1                                                             ; inst 56
  %45 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %44             ; inst 57
  store i32 %11, i32* %45                                                          ; inst 58
  %46 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 59
  %47 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 60
  %48 = load i32, i32* %47                                                         ; inst 61
  %49 = add i32 %48, 1                                                             ; inst 62
  store i32 %49, i32* %46                                                          ; inst 63
  %50 = add i32 %7, 1                                                              ; inst 64
  br label %_1.while.cond.0                                                        ; inst 65
_9.while.exit.0:
  %51 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 66
  %52 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 67
  %53 = load i32, i32* %52                                                         ; inst 68
  %54 = mul i32 %1, %1                                                             ; inst 69
  %55 = add i32 %53, %54                                                           ; inst 70
  store i32 %55, i32* %51                                                          ; inst 71
  ret void                                                                         ; inst 72
}

define i32 @partition([10000 x i32]* %0, i32 %1, i32 %2, %PerformanceCounter* %3) {
_0.entry.0:
  %4 = sext i32 %2 to i64                                                          ; inst 1
  %5 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %4               ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = sub i32 %1, 1                                                               ; inst 4
  %8 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3    ; inst 5
  %9 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3    ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = add i32 %10, 1                                                             ; inst 8
  store i32 %11, i32* %8                                                           ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_1.while.cond.0:
  %12 = phi i32 [%7, %_0.entry.0], [%46, %_5.if.exit.0]                            ; inst 11
  %13 = phi i32 [%1, %_0.entry.0], [%47, %_5.if.exit.0]                            ; inst 12
  %14 = icmp slt i32 %13, %2                                                       ; inst 13
  br i1 %14, label %_2.while.body.0, label %_6.while.exit.0                        ; inst 14
_2.while.body.0:
  %15 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 15
  %16 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 16
  %17 = load i32, i32* %16                                                         ; inst 17
  %18 = add i32 %17, 1                                                             ; inst 18
  store i32 %18, i32* %15                                                          ; inst 19
  %19 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 20
  %20 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 21
  %21 = load i32, i32* %20                                                         ; inst 22
  %22 = add i32 %21, 1                                                             ; inst 23
  store i32 %22, i32* %19                                                          ; inst 24
  %23 = sext i32 %13 to i64                                                        ; inst 25
  %24 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %23             ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = icmp sle i32 %25, %6                                                       ; inst 28
  br i1 %26, label %_3.if.then.0, label %_4.if.else.0                              ; inst 29
_3.if.then.0:
  %27 = add i32 %12, 1                                                             ; inst 30
  %28 = sext i32 %27 to i64                                                        ; inst 31
  %29 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %28             ; inst 32
  %30 = load i32, i32* %29                                                         ; inst 33
  %31 = sext i32 %27 to i64                                                        ; inst 34
  %32 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %31             ; inst 35
  %33 = sext i32 %13 to i64                                                        ; inst 36
  %34 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %33             ; inst 37
  %35 = load i32, i32* %34                                                         ; inst 38
  store i32 %35, i32* %32                                                          ; inst 39
  %36 = sext i32 %13 to i64                                                        ; inst 40
  %37 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %36             ; inst 41
  store i32 %30, i32* %37                                                          ; inst 42
  %38 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 2   ; inst 43
  %39 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 2   ; inst 44
  %40 = load i32, i32* %39                                                         ; inst 45
  %41 = add i32 %40, 1                                                             ; inst 46
  store i32 %41, i32* %38                                                          ; inst 47
  %42 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 48
  %43 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 49
  %44 = load i32, i32* %43                                                         ; inst 50
  %45 = add i32 %44, 4                                                             ; inst 51
  store i32 %45, i32* %42                                                          ; inst 52
  br label %_5.if.exit.0                                                           ; inst 53
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 54
_5.if.exit.0:
  %46 = phi i32 [%27, %_3.if.then.0], [%12, %_4.if.else.0]                         ; inst 55
  %47 = add i32 %13, 1                                                             ; inst 56
  br label %_1.while.cond.0                                                        ; inst 57
_6.while.exit.0:
  %48 = add i32 %12, 1                                                             ; inst 58
  %49 = sext i32 %48 to i64                                                        ; inst 59
  %50 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %49             ; inst 60
  %51 = load i32, i32* %50                                                         ; inst 61
  %52 = add i32 %12, 1                                                             ; inst 62
  %53 = sext i32 %52 to i64                                                        ; inst 63
  %54 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %53             ; inst 64
  %55 = sext i32 %2 to i64                                                         ; inst 65
  %56 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %55             ; inst 66
  %57 = load i32, i32* %56                                                         ; inst 67
  store i32 %57, i32* %54                                                          ; inst 68
  %58 = sext i32 %2 to i64                                                         ; inst 69
  %59 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %58             ; inst 70
  store i32 %51, i32* %59                                                          ; inst 71
  %60 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 2   ; inst 72
  %61 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 2   ; inst 73
  %62 = load i32, i32* %61                                                         ; inst 74
  %63 = add i32 %62, 1                                                             ; inst 75
  store i32 %63, i32* %60                                                          ; inst 76
  %64 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 77
  %65 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 78
  %66 = load i32, i32* %65                                                         ; inst 79
  %67 = add i32 %66, 4                                                             ; inst 80
  store i32 %67, i32* %64                                                          ; inst 81
  %68 = add i32 %12, 1                                                             ; inst 82
  ret i32 %68                                                                      ; inst 83
}

define void @quick_sort_range([10000 x i32]* %0, i32 %1, i32 %2, %PerformanceCounter* %3) {
_0.entry.0:
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 1
  %5 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = add i32 %6, 1                                                               ; inst 4
  store i32 %7, i32* %4                                                            ; inst 5
  %8 = icmp slt i32 %1, %2                                                         ; inst 6
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 7
_1.if.then.0:
  %9 = call i32 @partition([10000 x i32]* %0, i32 %1, i32 %2, %PerformanceCounter* %3) ; inst 8
  %10 = sub i32 %9, 1                                                              ; inst 9
  call void @quick_sort_range([10000 x i32]* %0, i32 %1, i32 %10, %PerformanceCounter* %3) ; inst 10
  %11 = add i32 %9, 1                                                              ; inst 11
  call void @quick_sort_range([10000 x i32]* %0, i32 %11, i32 %2, %PerformanceCounter* %3) ; inst 12
  br label %_3.if.exit.0                                                           ; inst 13
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 14
_3.if.exit.0:
  %12 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 15
  %13 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = sub i32 %2, %1                                                             ; inst 18
  %16 = add i32 %15, 1                                                             ; inst 19
  %17 = add i32 %14, %16                                                           ; inst 20
  store i32 %17, i32* %12                                                          ; inst 21
  ret void                                                                         ; inst 22
}

define void @quick_sort([10000 x i32]* %0, i32 %1, %PerformanceCounter* %2) {
_0.entry.0:
  %3 = icmp sgt i32 %1, 1                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = sub i32 %1, 1                                                               ; inst 3
  call void @quick_sort_range([10000 x i32]* %0, i32 0, i32 %4, %PerformanceCounter* %2) ; inst 4
  br label %_3.if.exit.0                                                           ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  ret void                                                                         ; inst 7
}

define void @merge([10000 x i32]* %0, i32 %1, i32 %2, i32 %3, %PerformanceCounter* %4) {
_0.entry.0:
  %5 = sub i32 %2, %1                                                              ; inst 1
  %6 = add i32 %5, 1                                                               ; inst 2
  %7 = sub i32 %3, %2                                                              ; inst 3
  %8 = trunc i64 10000 to i32                                                      ; inst 4
  %9 = sub i32 %8, %6                                                              ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %10 = phi i32 [0, %_0.entry.0], [%23, %_2.while.body.0]                          ; inst 7
  %11 = icmp slt i32 %10, %6                                                       ; inst 8
  br i1 %11, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 9
_2.while.body.0:
  %12 = add i32 %9, %10                                                            ; inst 10
  %13 = sext i32 %12 to i64                                                        ; inst 11
  %14 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %13             ; inst 12
  %15 = add i32 %1, %10                                                            ; inst 13
  %16 = sext i32 %15 to i64                                                        ; inst 14
  %17 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %16             ; inst 15
  %18 = load i32, i32* %17                                                         ; inst 16
  store i32 %18, i32* %14                                                          ; inst 17
  %19 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 18
  %20 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 19
  %21 = load i32, i32* %20                                                         ; inst 20
  %22 = add i32 %21, 2                                                             ; inst 21
  store i32 %22, i32* %19                                                          ; inst 22
  %23 = add i32 %10, 1                                                             ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 25
_4.while.cond.1:
  %24 = phi i32 [0, %_3.while.exit.0], [%63, %_11.if.exit.0]                       ; inst 26
  %25 = phi i32 [0, %_3.while.exit.0], [%64, %_11.if.exit.0]                       ; inst 27
  %26 = phi i32 [%1, %_3.while.exit.0], [%69, %_11.if.exit.0]                      ; inst 28
  %27 = icmp slt i32 %24, %6                                                       ; inst 29
  br i1 %27, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 30
_5.lazy.then.0:
  %28 = icmp slt i32 %25, %7                                                       ; inst 31
  br label %_7.lazy.exit.0                                                         ; inst 32
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 33
_7.lazy.exit.0:
  %29 = phi i1 [%28, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 34
  br i1 %29, label %_8.while.body.1, label %_12.while.exit.1                       ; inst 35
_8.while.body.1:
  %30 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 1   ; inst 36
  %31 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 1   ; inst 37
  %32 = load i32, i32* %31                                                         ; inst 38
  %33 = add i32 %32, 1                                                             ; inst 39
  store i32 %33, i32* %30                                                          ; inst 40
  %34 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 41
  %35 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 42
  %36 = load i32, i32* %35                                                         ; inst 43
  %37 = add i32 %36, 2                                                             ; inst 44
  store i32 %37, i32* %34                                                          ; inst 45
  %38 = add i32 %9, %24                                                            ; inst 46
  %39 = sext i32 %38 to i64                                                        ; inst 47
  %40 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %39             ; inst 48
  %41 = load i32, i32* %40                                                         ; inst 49
  %42 = add i32 %2, 1                                                              ; inst 50
  %43 = add i32 %42, %25                                                           ; inst 51
  %44 = sext i32 %43 to i64                                                        ; inst 52
  %45 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %44             ; inst 53
  %46 = load i32, i32* %45                                                         ; inst 54
  %47 = icmp sle i32 %41, %46                                                      ; inst 55
  br i1 %47, label %_9.if.then.0, label %_10.if.else.0                             ; inst 56
_9.if.then.0:
  %48 = sext i32 %26 to i64                                                        ; inst 57
  %49 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %48             ; inst 58
  %50 = add i32 %9, %24                                                            ; inst 59
  %51 = sext i32 %50 to i64                                                        ; inst 60
  %52 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %51             ; inst 61
  %53 = load i32, i32* %52                                                         ; inst 62
  store i32 %53, i32* %49                                                          ; inst 63
  %54 = add i32 %24, 1                                                             ; inst 64
  br label %_11.if.exit.0                                                          ; inst 65
_10.if.else.0:
  %55 = sext i32 %26 to i64                                                        ; inst 66
  %56 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %55             ; inst 67
  %57 = add i32 %2, 1                                                              ; inst 68
  %58 = add i32 %57, %25                                                           ; inst 69
  %59 = sext i32 %58 to i64                                                        ; inst 70
  %60 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %59             ; inst 71
  %61 = load i32, i32* %60                                                         ; inst 72
  store i32 %61, i32* %56                                                          ; inst 73
  %62 = add i32 %25, 1                                                             ; inst 74
  br label %_11.if.exit.0                                                          ; inst 75
_11.if.exit.0:
  %63 = phi i32 [%54, %_9.if.then.0], [%24, %_10.if.else.0]                        ; inst 76
  %64 = phi i32 [%25, %_9.if.then.0], [%62, %_10.if.else.0]                        ; inst 77
  %65 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 78
  %66 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 79
  %67 = load i32, i32* %66                                                         ; inst 80
  %68 = add i32 %67, 1                                                             ; inst 81
  store i32 %68, i32* %65                                                          ; inst 82
  %69 = add i32 %26, 1                                                             ; inst 83
  br label %_4.while.cond.1                                                        ; inst 84
_12.while.exit.1:
  br label %_13.while.cond.2                                                       ; inst 85
_13.while.cond.2:
  %70 = phi i32 [%24, %_12.while.exit.1], [%83, %_14.while.body.2]                 ; inst 86
  %71 = phi i32 [%26, %_12.while.exit.1], [%84, %_14.while.body.2]                 ; inst 87
  %72 = icmp slt i32 %70, %6                                                       ; inst 88
  br i1 %72, label %_14.while.body.2, label %_15.while.exit.2                      ; inst 89
_14.while.body.2:
  %73 = sext i32 %71 to i64                                                        ; inst 90
  %74 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %73             ; inst 91
  %75 = add i32 %9, %70                                                            ; inst 92
  %76 = sext i32 %75 to i64                                                        ; inst 93
  %77 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %76             ; inst 94
  %78 = load i32, i32* %77                                                         ; inst 95
  store i32 %78, i32* %74                                                          ; inst 96
  %79 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 97
  %80 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 98
  %81 = load i32, i32* %80                                                         ; inst 99
  %82 = add i32 %81, 2                                                             ; inst 100
  store i32 %82, i32* %79                                                          ; inst 101
  %83 = add i32 %70, 1                                                             ; inst 102
  %84 = add i32 %71, 1                                                             ; inst 103
  br label %_13.while.cond.2                                                       ; inst 104
_15.while.exit.2:
  br label %_16.while.cond.3                                                       ; inst 105
_16.while.cond.3:
  %85 = phi i32 [%25, %_15.while.exit.2], [%99, %_17.while.body.3]                 ; inst 106
  %86 = phi i32 [%71, %_15.while.exit.2], [%100, %_17.while.body.3]                ; inst 107
  %87 = icmp slt i32 %85, %7                                                       ; inst 108
  br i1 %87, label %_17.while.body.3, label %_18.while.exit.3                      ; inst 109
_17.while.body.3:
  %88 = sext i32 %86 to i64                                                        ; inst 110
  %89 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %88             ; inst 111
  %90 = add i32 %2, 1                                                              ; inst 112
  %91 = add i32 %90, %85                                                           ; inst 113
  %92 = sext i32 %91 to i64                                                        ; inst 114
  %93 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %92             ; inst 115
  %94 = load i32, i32* %93                                                         ; inst 116
  store i32 %94, i32* %89                                                          ; inst 117
  %95 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 118
  %96 = getelementptr %PerformanceCounter, %PerformanceCounter* %4, i32 0, i32 3   ; inst 119
  %97 = load i32, i32* %96                                                         ; inst 120
  %98 = add i32 %97, 2                                                             ; inst 121
  store i32 %98, i32* %95                                                          ; inst 122
  %99 = add i32 %85, 1                                                             ; inst 123
  %100 = add i32 %86, 1                                                            ; inst 124
  br label %_16.while.cond.3                                                       ; inst 125
_18.while.exit.3:
  ret void                                                                         ; inst 126
}

define void @merge_sort_range([10000 x i32]* %0, i32 %1, i32 %2, %PerformanceCounter* %3) {
_0.entry.0:
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 1
  %5 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = add i32 %6, 1                                                               ; inst 4
  store i32 %7, i32* %4                                                            ; inst 5
  %8 = icmp slt i32 %1, %2                                                         ; inst 6
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 7
_1.if.then.0:
  %9 = sub i32 %2, %1                                                              ; inst 8
  %10 = sdiv i32 %9, 2                                                             ; inst 9
  %11 = add i32 %1, %10                                                            ; inst 10
  call void @merge_sort_range([10000 x i32]* %0, i32 %1, i32 %11, %PerformanceCounter* %3) ; inst 11
  %12 = add i32 %11, 1                                                             ; inst 12
  call void @merge_sort_range([10000 x i32]* %0, i32 %12, i32 %2, %PerformanceCounter* %3) ; inst 13
  call void @merge([10000 x i32]* %0, i32 %1, i32 %11, i32 %2, %PerformanceCounter* %3) ; inst 14
  br label %_3.if.exit.0                                                           ; inst 15
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 16
_3.if.exit.0:
  %13 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 17
  %14 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 18
  %15 = load i32, i32* %14                                                         ; inst 19
  %16 = sub i32 %2, %1                                                             ; inst 20
  %17 = add i32 %16, 1                                                             ; inst 21
  %18 = add i32 %15, %17                                                           ; inst 22
  store i32 %18, i32* %13                                                          ; inst 23
  ret void                                                                         ; inst 24
}

define void @merge_sort([10000 x i32]* %0, i32 %1, %PerformanceCounter* %2) {
_0.entry.0:
  %3 = icmp sgt i32 %1, 1                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = sub i32 %1, 1                                                               ; inst 3
  call void @merge_sort_range([10000 x i32]* %0, i32 0, i32 %4, %PerformanceCounter* %2) ; inst 4
  br label %_3.if.exit.0                                                           ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  ret void                                                                         ; inst 7
}

define void @heapify([10000 x i32]* %0, i32 %1, i32 %2, %PerformanceCounter* %3) {
_0.entry.0:
  %4 = mul i32 2, %2                                                               ; inst 1
  %5 = add i32 %4, 1                                                               ; inst 2
  %6 = mul i32 2, %2                                                               ; inst 3
  %7 = add i32 %6, 2                                                               ; inst 4
  %8 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3    ; inst 5
  %9 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3    ; inst 6
  %10 = load i32, i32* %9                                                          ; inst 7
  %11 = add i32 %10, 1                                                             ; inst 8
  store i32 %11, i32* %8                                                           ; inst 9
  %12 = icmp slt i32 %5, %1                                                        ; inst 10
  br i1 %12, label %_1.if.then.0, label %_5.if.else.0                              ; inst 11
_1.if.then.0:
  %13 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 12
  %14 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 13
  %15 = load i32, i32* %14                                                         ; inst 14
  %16 = add i32 %15, 1                                                             ; inst 15
  store i32 %16, i32* %13                                                          ; inst 16
  %17 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 17
  %18 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 18
  %19 = load i32, i32* %18                                                         ; inst 19
  %20 = add i32 %19, 2                                                             ; inst 20
  store i32 %20, i32* %17                                                          ; inst 21
  %21 = sext i32 %5 to i64                                                         ; inst 22
  %22 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %21             ; inst 23
  %23 = load i32, i32* %22                                                         ; inst 24
  %24 = sext i32 %2 to i64                                                         ; inst 25
  %25 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %24             ; inst 26
  %26 = load i32, i32* %25                                                         ; inst 27
  %27 = icmp sgt i32 %23, %26                                                      ; inst 28
  br i1 %27, label %_2.if.then.1, label %_3.if.else.1                              ; inst 29
_2.if.then.1:
  br label %_4.if.exit.1                                                           ; inst 30
_3.if.else.1:
  br label %_4.if.exit.1                                                           ; inst 31
_4.if.exit.1:
  %28 = phi i32 [%5, %_2.if.then.1], [%2, %_3.if.else.1]                           ; inst 32
  br label %_6.if.exit.0                                                           ; inst 33
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 34
_6.if.exit.0:
  %29 = phi i32 [%28, %_4.if.exit.1], [%2, %_5.if.else.0]                          ; inst 35
  %30 = icmp slt i32 %7, %1                                                        ; inst 36
  br i1 %30, label %_7.if.then.2, label %_11.if.else.2                             ; inst 37
_7.if.then.2:
  %31 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 38
  %32 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 39
  %33 = load i32, i32* %32                                                         ; inst 40
  %34 = add i32 %33, 1                                                             ; inst 41
  store i32 %34, i32* %31                                                          ; inst 42
  %35 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 43
  %36 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 44
  %37 = load i32, i32* %36                                                         ; inst 45
  %38 = add i32 %37, 2                                                             ; inst 46
  store i32 %38, i32* %35                                                          ; inst 47
  %39 = sext i32 %7 to i64                                                         ; inst 48
  %40 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %39             ; inst 49
  %41 = load i32, i32* %40                                                         ; inst 50
  %42 = sext i32 %29 to i64                                                        ; inst 51
  %43 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %42             ; inst 52
  %44 = load i32, i32* %43                                                         ; inst 53
  %45 = icmp sgt i32 %41, %44                                                      ; inst 54
  br i1 %45, label %_8.if.then.3, label %_9.if.else.3                              ; inst 55
_8.if.then.3:
  br label %_10.if.exit.3                                                          ; inst 56
_9.if.else.3:
  br label %_10.if.exit.3                                                          ; inst 57
_10.if.exit.3:
  %46 = phi i32 [%7, %_8.if.then.3], [%29, %_9.if.else.3]                          ; inst 58
  br label %_12.if.exit.2                                                          ; inst 59
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 60
_12.if.exit.2:
  %47 = phi i32 [%46, %_10.if.exit.3], [%29, %_11.if.else.2]                       ; inst 61
  %48 = icmp ne i32 %47, %2                                                        ; inst 62
  br i1 %48, label %_13.if.then.4, label %_14.if.else.4                            ; inst 63
_13.if.then.4:
  %49 = sext i32 %2 to i64                                                         ; inst 64
  %50 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %49             ; inst 65
  %51 = load i32, i32* %50                                                         ; inst 66
  %52 = sext i32 %2 to i64                                                         ; inst 67
  %53 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %52             ; inst 68
  %54 = sext i32 %47 to i64                                                        ; inst 69
  %55 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %54             ; inst 70
  %56 = load i32, i32* %55                                                         ; inst 71
  store i32 %56, i32* %53                                                          ; inst 72
  %57 = sext i32 %47 to i64                                                        ; inst 73
  %58 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %57             ; inst 74
  store i32 %51, i32* %58                                                          ; inst 75
  %59 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 2   ; inst 76
  %60 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 2   ; inst 77
  %61 = load i32, i32* %60                                                         ; inst 78
  %62 = add i32 %61, 1                                                             ; inst 79
  store i32 %62, i32* %59                                                          ; inst 80
  %63 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 81
  %64 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 82
  %65 = load i32, i32* %64                                                         ; inst 83
  %66 = add i32 %65, 4                                                             ; inst 84
  store i32 %66, i32* %63                                                          ; inst 85
  call void @heapify([10000 x i32]* %0, i32 %1, i32 %47, %PerformanceCounter* %3)  ; inst 86
  br label %_15.if.exit.4                                                          ; inst 87
_14.if.else.4:
  br label %_15.if.exit.4                                                          ; inst 88
_15.if.exit.4:
  ret void                                                                         ; inst 89
}

define void @heap_sort([10000 x i32]* %0, i32 %1, %PerformanceCounter* %2) {
_0.entry.0:
  %3 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 1
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 4    ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = add i32 %5, 1                                                               ; inst 4
  store i32 %6, i32* %3                                                            ; inst 5
  %7 = sdiv i32 %1, 2                                                              ; inst 6
  %8 = sub i32 %7, 1                                                               ; inst 7
  br label %_1.while.cond.0                                                        ; inst 8
_1.while.cond.0:
  %9 = phi i32 [%8, %_0.entry.0], [%11, %_2.while.body.0]                          ; inst 9
  %10 = icmp sge i32 %9, 0                                                         ; inst 10
  br i1 %10, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 11
_2.while.body.0:
  call void @heapify([10000 x i32]* %0, i32 %1, i32 %9, %PerformanceCounter* %2)   ; inst 12
  %11 = sub i32 %9, 1                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  %12 = sub i32 %1, 1                                                              ; inst 15
  br label %_4.while.cond.1                                                        ; inst 16
_4.while.cond.1:
  %13 = phi i32 [%12, %_3.while.exit.0], [%31, %_5.while.body.1]                   ; inst 17
  %14 = icmp sgt i32 %13, 0                                                        ; inst 18
  br i1 %14, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 19
_5.while.body.1:
  %15 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 0               ; inst 20
  %16 = load i32, i32* %15                                                         ; inst 21
  %17 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 0               ; inst 22
  %18 = sext i32 %13 to i64                                                        ; inst 23
  %19 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %18             ; inst 24
  %20 = load i32, i32* %19                                                         ; inst 25
  store i32 %20, i32* %17                                                          ; inst 26
  %21 = sext i32 %13 to i64                                                        ; inst 27
  %22 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %21             ; inst 28
  store i32 %16, i32* %22                                                          ; inst 29
  %23 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 2   ; inst 30
  %24 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 2   ; inst 31
  %25 = load i32, i32* %24                                                         ; inst 32
  %26 = add i32 %25, 1                                                             ; inst 33
  store i32 %26, i32* %23                                                          ; inst 34
  %27 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 35
  %28 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 3   ; inst 36
  %29 = load i32, i32* %28                                                         ; inst 37
  %30 = add i32 %29, 4                                                             ; inst 38
  store i32 %30, i32* %27                                                          ; inst 39
  call void @heapify([10000 x i32]* %0, i32 %13, i32 0, %PerformanceCounter* %2)   ; inst 40
  %31 = sub i32 %13, 1                                                             ; inst 41
  br label %_4.while.cond.1                                                        ; inst 42
_6.while.exit.1:
  %32 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 43
  %33 = getelementptr %PerformanceCounter, %PerformanceCounter* %2, i32 0, i32 0   ; inst 44
  %34 = load i32, i32* %33                                                         ; inst 45
  %35 = mul i32 %1, %1                                                             ; inst 46
  %36 = add i32 %34, %35                                                           ; inst 47
  store i32 %36, i32* %32                                                          ; inst 48
  ret void                                                                         ; inst 49
}

define i32 @binary_search([10000 x i32]* %0, i32 %1, i32 %2, %PerformanceCounter* %3) {
_0.entry.0:
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 1
  %5 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = add i32 %6, 1                                                               ; inst 4
  store i32 %7, i32* %4                                                            ; inst 5
  %8 = sub i32 %1, 1                                                               ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%37, %_8.if.exit.0]                              ; inst 8
  %10 = phi i32 [%8, %_0.entry.0], [%38, %_8.if.exit.0]                            ; inst 9
  %11 = icmp sle i32 %9, %10                                                       ; inst 10
  br i1 %11, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 11
_2.while.body.0:
  %12 = sub i32 %10, %9                                                            ; inst 12
  %13 = sdiv i32 %12, 2                                                            ; inst 13
  %14 = add i32 %9, %13                                                            ; inst 14
  %15 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 15
  %16 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 16
  %17 = load i32, i32* %16                                                         ; inst 17
  %18 = add i32 %17, 1                                                             ; inst 18
  store i32 %18, i32* %15                                                          ; inst 19
  %19 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 20
  %20 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 21
  %21 = load i32, i32* %20                                                         ; inst 22
  %22 = add i32 %21, 1                                                             ; inst 23
  store i32 %22, i32* %19                                                          ; inst 24
  %23 = sext i32 %14 to i64                                                        ; inst 25
  %24 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %23             ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = icmp eq i32 %25, %2                                                        ; inst 28
  br i1 %26, label %_3.if.then.0, label %_4.if.else.0                              ; inst 29
_3.if.then.0:
  %27 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 30
  %28 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 31
  %29 = load i32, i32* %28                                                         ; inst 32
  %30 = add i32 %29, 1                                                             ; inst 33
  store i32 %30, i32* %27                                                          ; inst 34
  ret i32 %14                                                                      ; inst 35
_4.if.else.0:
  %31 = sext i32 %14 to i64                                                        ; inst 36
  %32 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %31             ; inst 37
  %33 = load i32, i32* %32                                                         ; inst 38
  %34 = icmp slt i32 %33, %2                                                       ; inst 39
  br i1 %34, label %_5.if.then.1, label %_6.if.else.1                              ; inst 40
_5.if.then.1:
  %35 = add i32 %14, 1                                                             ; inst 41
  br label %_7.if.exit.1                                                           ; inst 42
_6.if.else.1:
  %36 = sub i32 %14, 1                                                             ; inst 43
  br label %_7.if.exit.1                                                           ; inst 44
_7.if.exit.1:
  %37 = phi i32 [%35, %_5.if.then.1], [%9, %_6.if.else.1]                          ; inst 45
  %38 = phi i32 [%10, %_5.if.then.1], [%36, %_6.if.else.1]                         ; inst 46
  br label %_8.if.exit.0                                                           ; inst 47
_8.if.exit.0:
  %39 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 48
  %40 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 49
  %41 = load i32, i32* %40                                                         ; inst 50
  %42 = add i32 %41, 1                                                             ; inst 51
  store i32 %42, i32* %39                                                          ; inst 52
  br label %_1.while.cond.0                                                        ; inst 53
_9.while.exit.0:
  ret i32 -1                                                                       ; inst 54
}

define i32 @linear_search([10000 x i32]* %0, i32 %1, i32 %2, %PerformanceCounter* %3) {
_0.entry.0:
  %4 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 1
  %5 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 4    ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = add i32 %6, 1                                                               ; inst 4
  store i32 %7, i32* %4                                                            ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%27, %_5.if.exit.0]                              ; inst 7
  %9 = icmp slt i32 %8, %1                                                         ; inst 8
  br i1 %9, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 9
_2.while.body.0:
  %10 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 10
  %11 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 1   ; inst 11
  %12 = load i32, i32* %11                                                         ; inst 12
  %13 = add i32 %12, 1                                                             ; inst 13
  store i32 %13, i32* %10                                                          ; inst 14
  %14 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 15
  %15 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 3   ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = add i32 %16, 1                                                             ; inst 18
  store i32 %17, i32* %14                                                          ; inst 19
  %18 = sext i32 %8 to i64                                                         ; inst 20
  %19 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %18             ; inst 21
  %20 = load i32, i32* %19                                                         ; inst 22
  %21 = icmp eq i32 %20, %2                                                        ; inst 23
  br i1 %21, label %_3.if.then.0, label %_4.if.else.0                              ; inst 24
_3.if.then.0:
  %22 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 25
  %23 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 26
  %24 = load i32, i32* %23                                                         ; inst 27
  %25 = add i32 %24, %8                                                            ; inst 28
  %26 = add i32 %25, 1                                                             ; inst 29
  store i32 %26, i32* %22                                                          ; inst 30
  ret i32 %8                                                                       ; inst 31
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 32
_5.if.exit.0:
  %27 = add i32 %8, 1                                                              ; inst 33
  br label %_1.while.cond.0                                                        ; inst 34
_6.while.exit.0:
  %28 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 35
  %29 = getelementptr %PerformanceCounter, %PerformanceCounter* %3, i32 0, i32 0   ; inst 36
  %30 = load i32, i32* %29                                                         ; inst 37
  %31 = add i32 %30, %1                                                            ; inst 38
  store i32 %31, i32* %28                                                          ; inst 39
  ret i32 -1                                                                       ; inst 40
}

define i32 @compute_variance([10000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 3
  %5 = icmp slt i32 %3, %1                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 6
  %7 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %6               ; inst 7
  %8 = load i32, i32* %7                                                           ; inst 8
  %9 = sub i32 %8, %2                                                              ; inst 9
  %10 = mul i32 %9, %9                                                             ; inst 10
  %11 = add i32 %4, %10                                                            ; inst 11
  %12 = add i32 %3, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  %13 = sdiv i32 %4, %1                                                            ; inst 14
  ret i32 %13                                                                      ; inst 15
}

define i32 @compute_median([10000 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = alloca %PerformanceCounter                                                  ; inst 1
  call void @init_performance_counter(%PerformanceCounter* %2)                     ; inst 2
  call void @quick_sort([10000 x i32]* %0, i32 %1, %PerformanceCounter* %2)        ; inst 3
  %3 = srem i32 %1, 2                                                              ; inst 4
  %4 = icmp eq i32 %3, 0                                                           ; inst 5
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 6
_1.if.then.0:
  %5 = sext i32 %1 to i64                                                          ; inst 7
  %6 = udiv i64 %5, 2                                                              ; inst 8
  %7 = sub i64 %6, 1                                                               ; inst 9
  %8 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %7               ; inst 10
  %9 = load i32, i32* %8                                                           ; inst 11
  %10 = sext i32 %1 to i64                                                         ; inst 12
  %11 = udiv i64 %10, 2                                                            ; inst 13
  %12 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %11             ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = add i32 %9, %13                                                            ; inst 16
  %15 = sdiv i32 %14, 2                                                            ; inst 17
  br label %_3.if.exit.0                                                           ; inst 18
_2.if.else.0:
  %16 = sext i32 %1 to i64                                                         ; inst 19
  %17 = udiv i64 %16, 2                                                            ; inst 20
  %18 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %17             ; inst 21
  %19 = load i32, i32* %18                                                         ; inst 22
  br label %_3.if.exit.0                                                           ; inst 23
_3.if.exit.0:
  %20 = phi i32 [%15, %_1.if.then.0], [%19, %_2.if.else.0]                         ; inst 24
  ret i32 %20                                                                      ; inst 25
}

define void @init_matrix(%Matrix* sret(%Matrix) %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca %Matrix                                                              ; inst 1
  %5 = getelementptr %Matrix, %Matrix* %4, i32 0, i32 0                            ; inst 2
  %6 = alloca [100 x i32]                                                          ; inst 3
  %7 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i32 0                    ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 6
  %9 = icmp slt i32 %8, 100                                                        ; inst 7
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 9
  store i32 0, i32* %10                                                            ; inst 10
  %11 = add i32 %8, 1                                                              ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %12 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %5, i32 0, i32 0   ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %13 = phi i32 [0, %_3.array.exit.0], [%16, %_5.array.body.1]                     ; inst 15
  %14 = icmp slt i32 %13, 100                                                      ; inst 16
  br i1 %14, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %15 = getelementptr [100 x i32], [100 x i32]* %12, i32 %13                       ; inst 18
  call void @memcpy([100 x i32]* %15, [100 x i32]* %6, i64 400)                    ; inst 19
  %16 = add i32 %13, 1                                                             ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %17 = getelementptr %Matrix, %Matrix* %4, i32 0, i32 1                           ; inst 22
  store i32 %1, i32* %17                                                           ; inst 23
  %18 = getelementptr %Matrix, %Matrix* %4, i32 0, i32 2                           ; inst 24
  store i32 %2, i32* %18                                                           ; inst 25
  br label %_7.while.cond.0                                                        ; inst 26
_7.while.cond.0:
  %19 = phi i32 [0, %_6.array.exit.1], [%63, %_23.while.exit.1]                    ; inst 27
  %20 = icmp slt i32 %19, %1                                                       ; inst 28
  br i1 %20, label %_8.while.body.0, label %_24.while.exit.0                       ; inst 29
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 30
_9.while.cond.1:
  %21 = phi i32 [0, %_8.while.body.0], [%62, %_22.if.exit.0]                       ; inst 31
  %22 = icmp slt i32 %21, %2                                                       ; inst 32
  br i1 %22, label %_10.while.body.1, label %_23.while.exit.1                      ; inst 33
_10.while.body.1:
  %23 = icmp eq i32 %3, 0                                                          ; inst 34
  br i1 %23, label %_11.if.then.0, label %_15.if.else.0                            ; inst 35
_11.if.then.0:
  %24 = getelementptr %Matrix, %Matrix* %4, i32 0, i32 0                           ; inst 36
  %25 = sext i32 %19 to i64                                                        ; inst 37
  %26 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %24, i32 0, i64 %25 ; inst 38
  %27 = sext i32 %21 to i64                                                        ; inst 39
  %28 = getelementptr [100 x i32], [100 x i32]* %26, i32 0, i64 %27                ; inst 40
  %29 = icmp eq i32 %19, %21                                                       ; inst 41
  br i1 %29, label %_12.if.then.1, label %_13.if.else.1                            ; inst 42
_12.if.then.1:
  br label %_14.if.exit.1                                                          ; inst 43
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 44
_14.if.exit.1:
  %30 = phi i32 [1, %_12.if.then.1], [0, %_13.if.else.1]                           ; inst 45
  store i32 %30, i32* %28                                                          ; inst 46
  br label %_22.if.exit.0                                                          ; inst 47
_15.if.else.0:
  %31 = icmp eq i32 %3, 1                                                          ; inst 48
  br i1 %31, label %_16.if.then.2, label %_17.if.else.2                            ; inst 49
_16.if.then.2:
  %32 = getelementptr %Matrix, %Matrix* %4, i32 0, i32 0                           ; inst 50
  %33 = sext i32 %19 to i64                                                        ; inst 51
  %34 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %32, i32 0, i64 %33 ; inst 52
  %35 = sext i32 %21 to i64                                                        ; inst 53
  %36 = getelementptr [100 x i32], [100 x i32]* %34, i32 0, i64 %35                ; inst 54
  %37 = mul i32 %19, 17                                                            ; inst 55
  %38 = mul i32 %21, 23                                                            ; inst 56
  %39 = add i32 %37, %38                                                           ; inst 57
  %40 = add i32 %39, 13                                                            ; inst 58
  %41 = srem i32 %40, 100                                                          ; inst 59
  store i32 %41, i32* %36                                                          ; inst 60
  br label %_21.if.exit.2                                                          ; inst 61
_17.if.else.2:
  %42 = icmp eq i32 %3, 2                                                          ; inst 62
  br i1 %42, label %_18.if.then.3, label %_19.if.else.3                            ; inst 63
_18.if.then.3:
  %43 = getelementptr %Matrix, %Matrix* %4, i32 0, i32 0                           ; inst 64
  %44 = sext i32 %19 to i64                                                        ; inst 65
  %45 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %43, i32 0, i64 %44 ; inst 66
  %46 = sext i32 %21 to i64                                                        ; inst 67
  %47 = getelementptr [100 x i32], [100 x i32]* %45, i32 0, i64 %46                ; inst 68
  %48 = mul i32 %19, %2                                                            ; inst 69
  %49 = add i32 %48, %21                                                           ; inst 70
  %50 = add i32 %49, 1                                                             ; inst 71
  store i32 %50, i32* %47                                                          ; inst 72
  br label %_20.if.exit.3                                                          ; inst 73
_19.if.else.3:
  %51 = getelementptr %Matrix, %Matrix* %4, i32 0, i32 0                           ; inst 74
  %52 = sext i32 %19 to i64                                                        ; inst 75
  %53 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %51, i32 0, i64 %52 ; inst 76
  %54 = sext i32 %21 to i64                                                        ; inst 77
  %55 = getelementptr [100 x i32], [100 x i32]* %53, i32 0, i64 %54                ; inst 78
  %56 = mul i32 %19, %19                                                           ; inst 79
  %57 = mul i32 %21, %21                                                           ; inst 80
  %58 = add i32 %56, %57                                                           ; inst 81
  %59 = mul i32 %19, %21                                                           ; inst 82
  %60 = add i32 %58, %59                                                           ; inst 83
  %61 = srem i32 %60, 50                                                           ; inst 84
  store i32 %61, i32* %55                                                          ; inst 85
  br label %_20.if.exit.3                                                          ; inst 86
_20.if.exit.3:
  br label %_21.if.exit.2                                                          ; inst 87
_21.if.exit.2:
  br label %_22.if.exit.0                                                          ; inst 88
_22.if.exit.0:
  %62 = add i32 %21, 1                                                             ; inst 89
  br label %_9.while.cond.1                                                        ; inst 90
_23.while.exit.1:
  %63 = add i32 %19, 1                                                             ; inst 91
  br label %_7.while.cond.0                                                        ; inst 92
_24.while.exit.0:
  call void @memcpy(%Matrix* %0, %Matrix* %4, i64 40008)                           ; inst 93
  ret void                                                                         ; inst 94
}

define i1 @matrix_multiply(%Matrix* %0, %Matrix* %1, %Matrix* %2) {
_0.entry.0:
  %3 = getelementptr %Matrix, %Matrix* %0, i32 0, i32 2                            ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  %5 = getelementptr %Matrix, %Matrix* %1, i32 0, i32 1                            ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  %7 = icmp ne i32 %4, %6                                                          ; inst 5
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 6
_1.if.then.0:
  ret i1 0                                                                         ; inst 7
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 8
_3.if.exit.0:
  %8 = getelementptr %Matrix, %Matrix* %2, i32 0, i32 1                            ; inst 9
  %9 = getelementptr %Matrix, %Matrix* %0, i32 0, i32 1                            ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  store i32 %10, i32* %8                                                           ; inst 12
  %11 = getelementptr %Matrix, %Matrix* %2, i32 0, i32 2                           ; inst 13
  %12 = getelementptr %Matrix, %Matrix* %1, i32 0, i32 2                           ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  store i32 %13, i32* %11                                                          ; inst 16
  br label %_4.while.cond.0                                                        ; inst 17
_4.while.cond.0:
  %14 = phi i32 [0, %_3.if.exit.0], [%58, %_11.while.exit.1]                       ; inst 18
  %15 = getelementptr %Matrix, %Matrix* %0, i32 0, i32 1                           ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = icmp slt i32 %14, %16                                                      ; inst 21
  br i1 %17, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 22
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 23
_6.while.cond.1:
  %18 = phi i32 [0, %_5.while.body.0], [%57, %_10.while.exit.2]                    ; inst 24
  %19 = getelementptr %Matrix, %Matrix* %1, i32 0, i32 2                           ; inst 25
  %20 = load i32, i32* %19                                                         ; inst 26
  %21 = icmp slt i32 %18, %20                                                      ; inst 27
  br i1 %21, label %_7.while.body.1, label %_11.while.exit.1                       ; inst 28
_7.while.body.1:
  %22 = getelementptr %Matrix, %Matrix* %2, i32 0, i32 0                           ; inst 29
  %23 = sext i32 %14 to i64                                                        ; inst 30
  %24 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %22, i32 0, i64 %23 ; inst 31
  %25 = sext i32 %18 to i64                                                        ; inst 32
  %26 = getelementptr [100 x i32], [100 x i32]* %24, i32 0, i64 %25                ; inst 33
  store i32 0, i32* %26                                                            ; inst 34
  br label %_8.while.cond.2                                                        ; inst 35
_8.while.cond.2:
  %27 = phi i32 [0, %_7.while.body.1], [%56, %_9.while.body.2]                     ; inst 36
  %28 = getelementptr %Matrix, %Matrix* %0, i32 0, i32 2                           ; inst 37
  %29 = load i32, i32* %28                                                         ; inst 38
  %30 = icmp slt i32 %27, %29                                                      ; inst 39
  br i1 %30, label %_9.while.body.2, label %_10.while.exit.2                       ; inst 40
_9.while.body.2:
  %31 = getelementptr %Matrix, %Matrix* %2, i32 0, i32 0                           ; inst 41
  %32 = sext i32 %14 to i64                                                        ; inst 42
  %33 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %31, i32 0, i64 %32 ; inst 43
  %34 = sext i32 %18 to i64                                                        ; inst 44
  %35 = getelementptr [100 x i32], [100 x i32]* %33, i32 0, i64 %34                ; inst 45
  %36 = getelementptr %Matrix, %Matrix* %2, i32 0, i32 0                           ; inst 46
  %37 = sext i32 %14 to i64                                                        ; inst 47
  %38 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %36, i32 0, i64 %37 ; inst 48
  %39 = sext i32 %18 to i64                                                        ; inst 49
  %40 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %39                ; inst 50
  %41 = load i32, i32* %40                                                         ; inst 51
  %42 = getelementptr %Matrix, %Matrix* %0, i32 0, i32 0                           ; inst 52
  %43 = sext i32 %14 to i64                                                        ; inst 53
  %44 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %42, i32 0, i64 %43 ; inst 54
  %45 = sext i32 %27 to i64                                                        ; inst 55
  %46 = getelementptr [100 x i32], [100 x i32]* %44, i32 0, i64 %45                ; inst 56
  %47 = load i32, i32* %46                                                         ; inst 57
  %48 = getelementptr %Matrix, %Matrix* %1, i32 0, i32 0                           ; inst 58
  %49 = sext i32 %27 to i64                                                        ; inst 59
  %50 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %48, i32 0, i64 %49 ; inst 60
  %51 = sext i32 %18 to i64                                                        ; inst 61
  %52 = getelementptr [100 x i32], [100 x i32]* %50, i32 0, i64 %51                ; inst 62
  %53 = load i32, i32* %52                                                         ; inst 63
  %54 = mul i32 %47, %53                                                           ; inst 64
  %55 = add i32 %41, %54                                                           ; inst 65
  store i32 %55, i32* %35                                                          ; inst 66
  %56 = add i32 %27, 1                                                             ; inst 67
  br label %_8.while.cond.2                                                        ; inst 68
_10.while.exit.2:
  %57 = add i32 %18, 1                                                             ; inst 69
  br label %_6.while.cond.1                                                        ; inst 70
_11.while.exit.1:
  %58 = add i32 %14, 1                                                             ; inst 71
  br label %_4.while.cond.0                                                        ; inst 72
_12.while.exit.0:
  ret i1 1                                                                         ; inst 73
}

define void @copy_array([10000 x i32]* %0, [10000 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %4 = icmp slt i32 %3, %2                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 5
  %6 = getelementptr [10000 x i32], [10000 x i32]* %1, i32 0, i64 %5               ; inst 6
  %7 = sext i32 %3 to i64                                                          ; inst 7
  %8 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %7               ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  store i32 %9, i32* %6                                                            ; inst 10
  %10 = add i32 %3, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  ret void                                                                         ; inst 13
}

define i1 @is_sorted([10000 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 2
  %3 = sub i32 %1, 1                                                               ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %5               ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = add i32 %2, 1                                                               ; inst 9
  %9 = sext i32 %8 to i64                                                          ; inst 10
  %10 = getelementptr [10000 x i32], [10000 x i32]* %0, i32 0, i64 %9              ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = icmp sgt i32 %7, %11                                                       ; inst 13
  br i1 %12, label %_3.if.then.0, label %_4.if.else.0                              ; inst 14
_3.if.then.0:
  ret i1 0                                                                         ; inst 15
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 16
_5.if.exit.0:
  %13 = add i32 %2, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  ret i1 1                                                                         ; inst 19
}

define void @test_large_scale_performance() {
_0.entry.0:
  call void @printlnInt(i32 21001)                                                 ; inst 1
  %0 = alloca [4 x i32]                                                            ; inst 2
  %1 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 0                        ; inst 3
  store i32 100, i32* %1                                                           ; inst 4
  %2 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 1                        ; inst 5
  store i32 500, i32* %2                                                           ; inst 6
  %3 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 2                        ; inst 7
  store i32 1000, i32* %3                                                          ; inst 8
  %4 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 3                        ; inst 9
  store i32 2000, i32* %4                                                          ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%44, %_17.while.exit.1]                          ; inst 12
  %6 = icmp slt i32 %5, 4                                                          ; inst 13
  br i1 %6, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 14
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 15
  %8 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i64 %7                       ; inst 16
  %9 = load i32, i32* %8                                                           ; inst 17
  %10 = mul i32 %5, 100                                                            ; inst 18
  %11 = add i32 21000, %10                                                         ; inst 19
  %12 = add i32 %11, 10                                                            ; inst 20
  call void @printlnInt(i32 %12)                                                   ; inst 21
  br label %_3.while.cond.1                                                        ; inst 22
_3.while.cond.1:
  %13 = phi i32 [0, %_2.while.body.0], [%43, %_16.if.exit.2]                       ; inst 23
  %14 = icmp slt i32 %13, 8                                                        ; inst 24
  br i1 %14, label %_4.while.body.1, label %_17.while.exit.1                       ; inst 25
_4.while.body.1:
  %15 = alloca %DataSet                                                            ; inst 26
  call void @init_dataset_pattern(%DataSet* %15, i32 %13, i32 %9)                  ; inst 27
  %16 = alloca [10000 x i32]                                                       ; inst 28
  %17 = getelementptr [10000 x i32], [10000 x i32]* %16, i32 0, i32 0              ; inst 29
  br label %_5.array.cond.0                                                        ; inst 30
_5.array.cond.0:
  %18 = phi i32 [0, %_4.while.body.1], [%21, %_6.array.body.0]                     ; inst 31
  %19 = icmp slt i32 %18, 10000                                                    ; inst 32
  br i1 %19, label %_6.array.body.0, label %_7.array.exit.0                        ; inst 33
_6.array.body.0:
  %20 = getelementptr i32, i32* %17, i32 %18                                       ; inst 34
  store i32 0, i32* %20                                                            ; inst 35
  %21 = add i32 %18, 1                                                             ; inst 36
  br label %_5.array.cond.0                                                        ; inst 37
_7.array.exit.0:
  %22 = getelementptr %DataSet, %DataSet* %15, i32 0, i32 0                        ; inst 38
  call void @copy_array([10000 x i32]* %22, [10000 x i32]* %16, i32 %9)            ; inst 39
  %23 = alloca %PerformanceCounter                                                 ; inst 40
  call void @init_performance_counter(%PerformanceCounter* %23)                    ; inst 41
  call void @bubble_sort([10000 x i32]* %16, i32 %9, %PerformanceCounter* %23)     ; inst 42
  %24 = call i1 @is_sorted([10000 x i32]* %16, i32 %9)                             ; inst 43
  %25 = icmp eq i1 %24, 0                                                          ; inst 44
  br i1 %25, label %_8.if.then.0, label %_9.if.else.0                              ; inst 45
_8.if.then.0:
  call void @printlnInt(i32 21901)                                                 ; inst 46
  br label %_10.if.exit.0                                                          ; inst 47
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 48
_10.if.exit.0:
  %26 = getelementptr %DataSet, %DataSet* %15, i32 0, i32 0                        ; inst 49
  call void @copy_array([10000 x i32]* %26, [10000 x i32]* %16, i32 %9)            ; inst 50
  %27 = alloca %PerformanceCounter                                                 ; inst 51
  call void @init_performance_counter(%PerformanceCounter* %27)                    ; inst 52
  call void @quick_sort([10000 x i32]* %16, i32 %9, %PerformanceCounter* %27)      ; inst 53
  %28 = call i1 @is_sorted([10000 x i32]* %16, i32 %9)                             ; inst 54
  %29 = icmp eq i1 %28, 0                                                          ; inst 55
  br i1 %29, label %_11.if.then.1, label %_12.if.else.1                            ; inst 56
_11.if.then.1:
  call void @printlnInt(i32 21902)                                                 ; inst 57
  br label %_13.if.exit.1                                                          ; inst 58
_12.if.else.1:
  br label %_13.if.exit.1                                                          ; inst 59
_13.if.exit.1:
  %30 = getelementptr %DataSet, %DataSet* %15, i32 0, i32 0                        ; inst 60
  call void @copy_array([10000 x i32]* %30, [10000 x i32]* %16, i32 %9)            ; inst 61
  %31 = alloca %PerformanceCounter                                                 ; inst 62
  call void @init_performance_counter(%PerformanceCounter* %31)                    ; inst 63
  call void @merge_sort([10000 x i32]* %16, i32 %9, %PerformanceCounter* %31)      ; inst 64
  %32 = call i1 @is_sorted([10000 x i32]* %16, i32 %9)                             ; inst 65
  %33 = icmp eq i1 %32, 0                                                          ; inst 66
  br i1 %33, label %_14.if.then.2, label %_15.if.else.2                            ; inst 67
_14.if.then.2:
  call void @printlnInt(i32 21903)                                                 ; inst 68
  br label %_16.if.exit.2                                                          ; inst 69
_15.if.else.2:
  br label %_16.if.exit.2                                                          ; inst 70
_16.if.exit.2:
  %34 = getelementptr %PerformanceCounter, %PerformanceCounter* %23, i32 0, i32 1  ; inst 71
  %35 = load i32, i32* %34                                                         ; inst 72
  %36 = sdiv i32 %35, 100                                                          ; inst 73
  call void @printlnInt(i32 %36)                                                   ; inst 74
  %37 = getelementptr %PerformanceCounter, %PerformanceCounter* %27, i32 0, i32 1  ; inst 75
  %38 = load i32, i32* %37                                                         ; inst 76
  %39 = sdiv i32 %38, 100                                                          ; inst 77
  call void @printlnInt(i32 %39)                                                   ; inst 78
  %40 = getelementptr %PerformanceCounter, %PerformanceCounter* %31, i32 0, i32 1  ; inst 79
  %41 = load i32, i32* %40                                                         ; inst 80
  %42 = sdiv i32 %41, 100                                                          ; inst 81
  call void @printlnInt(i32 %42)                                                   ; inst 82
  %43 = add i32 %13, 1                                                             ; inst 83
  br label %_3.while.cond.1                                                        ; inst 84
_17.while.exit.1:
  %44 = add i32 %5, 1                                                              ; inst 85
  br label %_1.while.cond.0                                                        ; inst 86
_18.while.exit.0:
  %45 = alloca %DataSet                                                            ; inst 87
  call void @init_dataset_pattern(%DataSet* %45, i32 0, i32 5000)                  ; inst 88
  %46 = alloca [10000 x i32]                                                       ; inst 89
  %47 = getelementptr [10000 x i32], [10000 x i32]* %46, i32 0, i32 0              ; inst 90
  br label %_19.array.cond.1                                                       ; inst 91
_19.array.cond.1:
  %48 = phi i32 [0, %_18.while.exit.0], [%51, %_20.array.body.1]                   ; inst 92
  %49 = icmp slt i32 %48, 10000                                                    ; inst 93
  br i1 %49, label %_20.array.body.1, label %_21.array.exit.1                      ; inst 94
_20.array.body.1:
  %50 = getelementptr i32, i32* %47, i32 %48                                       ; inst 95
  store i32 0, i32* %50                                                            ; inst 96
  %51 = add i32 %48, 1                                                             ; inst 97
  br label %_19.array.cond.1                                                       ; inst 98
_21.array.exit.1:
  %52 = getelementptr %DataSet, %DataSet* %45, i32 0, i32 0                        ; inst 99
  call void @copy_array([10000 x i32]* %52, [10000 x i32]* %46, i32 5000)          ; inst 100
  %53 = alloca %PerformanceCounter                                                 ; inst 101
  call void @init_performance_counter(%PerformanceCounter* %53)                    ; inst 102
  call void @quick_sort([10000 x i32]* %46, i32 5000, %PerformanceCounter* %53)    ; inst 103
  br label %_22.while.cond.2                                                       ; inst 104
_22.while.cond.2:
  %54 = phi i32 [0, %_21.array.exit.1], [%77, %_29.if.exit.3]                      ; inst 105
  %55 = phi i32 [0, %_21.array.exit.1], [%71, %_29.if.exit.3]                      ; inst 106
  %56 = phi i32 [0, %_21.array.exit.1], [%74, %_29.if.exit.3]                      ; inst 107
  %57 = phi i32 [0, %_21.array.exit.1], [%78, %_29.if.exit.3]                      ; inst 108
  %58 = icmp slt i32 %57, 1000                                                     ; inst 109
  br i1 %58, label %_23.while.body.2, label %_30.while.exit.2                      ; inst 110
_23.while.body.2:
  %59 = mul i32 %57, 73                                                            ; inst 111
  %60 = add i32 %59, 29                                                            ; inst 112
  %61 = srem i32 %60, 100000                                                       ; inst 113
  %62 = alloca %PerformanceCounter                                                 ; inst 114
  call void @init_performance_counter(%PerformanceCounter* %62)                    ; inst 115
  %63 = getelementptr %DataSet, %DataSet* %45, i32 0, i32 0                        ; inst 116
  %64 = call i32 @linear_search([10000 x i32]* %63, i32 5000, i32 %61, %PerformanceCounter* %62) ; inst 117
  %65 = alloca %PerformanceCounter                                                 ; inst 118
  call void @init_performance_counter(%PerformanceCounter* %65)                    ; inst 119
  %66 = call i32 @binary_search([10000 x i32]* %46, i32 5000, i32 %61, %PerformanceCounter* %65) ; inst 120
  %67 = icmp ne i32 %64, -1                                                        ; inst 121
  br i1 %67, label %_24.lazy.then.0, label %_25.lazy.else.0                        ; inst 122
_24.lazy.then.0:
  %68 = icmp ne i32 %66, -1                                                        ; inst 123
  br label %_26.lazy.exit.0                                                        ; inst 124
_25.lazy.else.0:
  br label %_26.lazy.exit.0                                                        ; inst 125
_26.lazy.exit.0:
  %69 = phi i1 [%68, %_24.lazy.then.0], [0, %_25.lazy.else.0]                      ; inst 126
  br i1 %69, label %_27.if.then.3, label %_28.if.else.3                            ; inst 127
_27.if.then.3:
  %70 = add i32 %55, 1                                                             ; inst 128
  br label %_29.if.exit.3                                                          ; inst 129
_28.if.else.3:
  br label %_29.if.exit.3                                                          ; inst 130
_29.if.exit.3:
  %71 = phi i32 [%70, %_27.if.then.3], [%55, %_28.if.else.3]                       ; inst 131
  %72 = getelementptr %PerformanceCounter, %PerformanceCounter* %62, i32 0, i32 0  ; inst 132
  %73 = load i32, i32* %72                                                         ; inst 133
  %74 = add i32 %56, %73                                                           ; inst 134
  %75 = getelementptr %PerformanceCounter, %PerformanceCounter* %65, i32 0, i32 0  ; inst 135
  %76 = load i32, i32* %75                                                         ; inst 136
  %77 = add i32 %54, %76                                                           ; inst 137
  %78 = add i32 %57, 1                                                             ; inst 138
  br label %_22.while.cond.2                                                       ; inst 139
_30.while.exit.2:
  call void @printlnInt(i32 %55)                                                   ; inst 140
  %79 = sdiv i32 %56, 1000                                                         ; inst 141
  call void @printlnInt(i32 %79)                                                   ; inst 142
  %80 = sdiv i32 %54, 1000                                                         ; inst 143
  call void @printlnInt(i32 %80)                                                   ; inst 144
  %81 = alloca %DataSet                                                            ; inst 145
  call void @init_dataset_pattern(%DataSet* %81, i32 1, i32 300)                   ; inst 146
  %82 = getelementptr %DataSet, %DataSet* %81, i32 0, i32 0                        ; inst 147
  %83 = getelementptr %DataSet, %DataSet* %81, i32 0, i32 6                        ; inst 148
  %84 = load i32, i32* %83                                                         ; inst 149
  %85 = call i32 @compute_variance([10000 x i32]* %82, i32 300, i32 %84)           ; inst 150
  %86 = alloca [10000 x i32]                                                       ; inst 151
  %87 = getelementptr [10000 x i32], [10000 x i32]* %86, i32 0, i32 0              ; inst 152
  br label %_31.array.cond.2                                                       ; inst 153
_31.array.cond.2:
  %88 = phi i32 [0, %_30.while.exit.2], [%91, %_32.array.body.2]                   ; inst 154
  %89 = icmp slt i32 %88, 10000                                                    ; inst 155
  br i1 %89, label %_32.array.body.2, label %_33.array.exit.2                      ; inst 156
_32.array.body.2:
  %90 = getelementptr i32, i32* %87, i32 %88                                       ; inst 157
  store i32 0, i32* %90                                                            ; inst 158
  %91 = add i32 %88, 1                                                             ; inst 159
  br label %_31.array.cond.2                                                       ; inst 160
_33.array.exit.2:
  %92 = getelementptr %DataSet, %DataSet* %81, i32 0, i32 0                        ; inst 161
  call void @copy_array([10000 x i32]* %92, [10000 x i32]* %86, i32 300)           ; inst 162
  %93 = call i32 @compute_median([10000 x i32]* %86, i32 300)                      ; inst 163
  %94 = getelementptr %DataSet, %DataSet* %81, i32 0, i32 6                        ; inst 164
  %95 = load i32, i32* %94                                                         ; inst 165
  call void @printlnInt(i32 %95)                                                   ; inst 166
  %96 = sdiv i32 %85, 1000                                                         ; inst 167
  call void @printlnInt(i32 %96)                                                   ; inst 168
  call void @printlnInt(i32 %93)                                                   ; inst 169
  %97 = alloca %Matrix                                                             ; inst 170
  call void @init_matrix(%Matrix* %97, i32 50, i32 50, i32 1)                      ; inst 171
  %98 = alloca %Matrix                                                             ; inst 172
  call void @init_matrix(%Matrix* %98, i32 50, i32 50, i32 2)                      ; inst 173
  %99 = alloca %Matrix                                                             ; inst 174
  %100 = getelementptr %Matrix, %Matrix* %99, i32 0, i32 0                         ; inst 175
  %101 = alloca [100 x i32]                                                        ; inst 176
  %102 = getelementptr [100 x i32], [100 x i32]* %101, i32 0, i32 0                ; inst 177
  br label %_34.array.cond.3                                                       ; inst 178
_34.array.cond.3:
  %103 = phi i32 [0, %_33.array.exit.2], [%106, %_35.array.body.3]                 ; inst 179
  %104 = icmp slt i32 %103, 100                                                    ; inst 180
  br i1 %104, label %_35.array.body.3, label %_36.array.exit.3                     ; inst 181
_35.array.body.3:
  %105 = getelementptr i32, i32* %102, i32 %103                                    ; inst 182
  store i32 0, i32* %105                                                           ; inst 183
  %106 = add i32 %103, 1                                                           ; inst 184
  br label %_34.array.cond.3                                                       ; inst 185
_36.array.exit.3:
  %107 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %100, i32 0, i32 0 ; inst 186
  br label %_37.array.cond.4                                                       ; inst 187
_37.array.cond.4:
  %108 = phi i32 [0, %_36.array.exit.3], [%111, %_38.array.body.4]                 ; inst 188
  %109 = icmp slt i32 %108, 100                                                    ; inst 189
  br i1 %109, label %_38.array.body.4, label %_39.array.exit.4                     ; inst 190
_38.array.body.4:
  %110 = getelementptr [100 x i32], [100 x i32]* %107, i32 %108                    ; inst 191
  call void @memcpy([100 x i32]* %110, [100 x i32]* %101, i64 400)                 ; inst 192
  %111 = add i32 %108, 1                                                           ; inst 193
  br label %_37.array.cond.4                                                       ; inst 194
_39.array.exit.4:
  %112 = getelementptr %Matrix, %Matrix* %99, i32 0, i32 1                         ; inst 195
  store i32 0, i32* %112                                                           ; inst 196
  %113 = getelementptr %Matrix, %Matrix* %99, i32 0, i32 2                         ; inst 197
  store i32 0, i32* %113                                                           ; inst 198
  %114 = call i1 @matrix_multiply(%Matrix* %97, %Matrix* %98, %Matrix* %99)        ; inst 199
  br i1 %114, label %_40.if.then.4, label %_47.if.else.4                           ; inst 200
_40.if.then.4:
  br label %_41.while.cond.3                                                       ; inst 201
_41.while.cond.3:
  %115 = phi i32 [0, %_40.if.then.4], [%118, %_45.while.exit.4]                    ; inst 202
  %116 = phi i32 [0, %_40.if.then.4], [%130, %_45.while.exit.4]                    ; inst 203
  %117 = icmp slt i32 %116, 50                                                     ; inst 204
  br i1 %117, label %_42.while.body.3, label %_46.while.exit.3                     ; inst 205
_42.while.body.3:
  br label %_43.while.cond.4                                                       ; inst 206
_43.while.cond.4:
  %118 = phi i32 [%115, %_42.while.body.3], [%128, %_44.while.body.4]              ; inst 207
  %119 = phi i32 [0, %_42.while.body.3], [%129, %_44.while.body.4]                 ; inst 208
  %120 = icmp slt i32 %119, 50                                                     ; inst 209
  br i1 %120, label %_44.while.body.4, label %_45.while.exit.4                     ; inst 210
_44.while.body.4:
  %121 = getelementptr %Matrix, %Matrix* %99, i32 0, i32 0                         ; inst 211
  %122 = sext i32 %116 to i64                                                      ; inst 212
  %123 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %121, i32 0, i64 %122 ; inst 213
  %124 = sext i32 %119 to i64                                                      ; inst 214
  %125 = getelementptr [100 x i32], [100 x i32]* %123, i32 0, i64 %124             ; inst 215
  %126 = load i32, i32* %125                                                       ; inst 216
  %127 = add i32 %118, %126                                                        ; inst 217
  %128 = and i32 %127, 1000000000                                                  ; inst 218
  %129 = add i32 %119, 1                                                           ; inst 219
  br label %_43.while.cond.4                                                       ; inst 220
_45.while.exit.4:
  %130 = add i32 %116, 1                                                           ; inst 221
  br label %_41.while.cond.3                                                       ; inst 222
_46.while.exit.3:
  %131 = srem i32 %115, 1000000000                                                 ; inst 223
  call void @printlnInt(i32 %131)                                                  ; inst 224
  br label %_48.if.exit.4                                                          ; inst 225
_47.if.else.4:
  br label %_48.if.exit.4                                                          ; inst 226
_48.if.exit.4:
  %132 = alloca %PerformanceCounter                                                ; inst 227
  call void @init_performance_counter(%PerformanceCounter* %132)                   ; inst 228
  br label %_49.while.cond.5                                                       ; inst 229
_49.while.cond.5:
  %133 = phi i32 [0, %_48.if.exit.4], [%145, %_50.while.body.5]                    ; inst 230
  %134 = phi i32 [0, %_48.if.exit.4], [%140, %_50.while.body.5]                    ; inst 231
  %135 = icmp slt i32 %133, 5000                                                   ; inst 232
  br i1 %135, label %_50.while.body.5, label %_51.while.exit.5                     ; inst 233
_50.while.body.5:
  %136 = getelementptr %DataSet, %DataSet* %45, i32 0, i32 0                       ; inst 234
  %137 = sext i32 %133 to i64                                                      ; inst 235
  %138 = getelementptr [10000 x i32], [10000 x i32]* %136, i32 0, i64 %137         ; inst 236
  %139 = load i32, i32* %138                                                       ; inst 237
  %140 = add i32 %134, %139                                                        ; inst 238
  %141 = getelementptr %PerformanceCounter, %PerformanceCounter* %132, i32 0, i32 3 ; inst 239
  %142 = getelementptr %PerformanceCounter, %PerformanceCounter* %132, i32 0, i32 3 ; inst 240
  %143 = load i32, i32* %142                                                       ; inst 241
  %144 = add i32 %143, 1                                                           ; inst 242
  store i32 %144, i32* %141                                                        ; inst 243
  %145 = add i32 %133, 1                                                           ; inst 244
  br label %_49.while.cond.5                                                       ; inst 245
_51.while.exit.5:
  br label %_52.while.cond.6                                                       ; inst 246
_52.while.cond.6:
  %146 = phi i32 [0, %_51.while.exit.5], [%161, %_53.while.body.6]                 ; inst 247
  %147 = phi i32 [0, %_51.while.exit.5], [%156, %_53.while.body.6]                 ; inst 248
  %148 = icmp slt i32 %146, 5000                                                   ; inst 249
  br i1 %148, label %_53.while.body.6, label %_54.while.exit.6                     ; inst 250
_53.while.body.6:
  %149 = mul i32 %146, 11241                                                       ; inst 251
  %150 = add i32 %149, 12345                                                       ; inst 252
  %151 = srem i32 %150, 5000                                                       ; inst 253
  %152 = getelementptr %DataSet, %DataSet* %45, i32 0, i32 0                       ; inst 254
  %153 = sext i32 %151 to i64                                                      ; inst 255
  %154 = getelementptr [10000 x i32], [10000 x i32]* %152, i32 0, i64 %153         ; inst 256
  %155 = load i32, i32* %154                                                       ; inst 257
  %156 = add i32 %147, %155                                                        ; inst 258
  %157 = getelementptr %PerformanceCounter, %PerformanceCounter* %132, i32 0, i32 3 ; inst 259
  %158 = getelementptr %PerformanceCounter, %PerformanceCounter* %132, i32 0, i32 3 ; inst 260
  %159 = load i32, i32* %158                                                       ; inst 261
  %160 = add i32 %159, 1                                                           ; inst 262
  store i32 %160, i32* %157                                                        ; inst 263
  %161 = add i32 %146, 1                                                           ; inst 264
  br label %_52.while.cond.6                                                       ; inst 265
_54.while.exit.6:
  br label %_55.while.cond.7                                                       ; inst 266
_55.while.cond.7:
  %162 = phi i32 [0, %_54.while.exit.6], [%171, %_56.while.body.7]                 ; inst 267
  %163 = phi i32 [0, %_54.while.exit.6], [%176, %_56.while.body.7]                 ; inst 268
  %164 = icmp slt i32 %163, 1000                                                   ; inst 269
  br i1 %164, label %_56.while.body.7, label %_57.while.exit.7                     ; inst 270
_56.while.body.7:
  %165 = mul i32 %163, 5                                                           ; inst 271
  %166 = srem i32 %165, 5000                                                       ; inst 272
  %167 = getelementptr %DataSet, %DataSet* %45, i32 0, i32 0                       ; inst 273
  %168 = sext i32 %166 to i64                                                      ; inst 274
  %169 = getelementptr [10000 x i32], [10000 x i32]* %167, i32 0, i64 %168         ; inst 275
  %170 = load i32, i32* %169                                                       ; inst 276
  %171 = add i32 %162, %170                                                        ; inst 277
  %172 = getelementptr %PerformanceCounter, %PerformanceCounter* %132, i32 0, i32 3 ; inst 278
  %173 = getelementptr %PerformanceCounter, %PerformanceCounter* %132, i32 0, i32 3 ; inst 279
  %174 = load i32, i32* %173                                                       ; inst 280
  %175 = add i32 %174, 1                                                           ; inst 281
  store i32 %175, i32* %172                                                        ; inst 282
  %176 = add i32 %163, 1                                                           ; inst 283
  br label %_55.while.cond.7                                                       ; inst 284
_57.while.exit.7:
  %177 = sdiv i32 %134, 1000                                                       ; inst 285
  call void @printlnInt(i32 %177)                                                  ; inst 286
  %178 = sdiv i32 %147, 1000                                                       ; inst 287
  call void @printlnInt(i32 %178)                                                  ; inst 288
  %179 = sdiv i32 %162, 100                                                        ; inst 289
  call void @printlnInt(i32 %179)                                                  ; inst 290
  %180 = getelementptr %PerformanceCounter, %PerformanceCounter* %132, i32 0, i32 3 ; inst 291
  %181 = load i32, i32* %180                                                       ; inst 292
  %182 = sdiv i32 %181, 1000                                                       ; inst 293
  call void @printlnInt(i32 %182)                                                  ; inst 294
  %183 = alloca [10000 x i32]                                                      ; inst 295
  %184 = getelementptr [10000 x i32], [10000 x i32]* %183, i32 0, i32 0            ; inst 296
  br label %_58.array.cond.5                                                       ; inst 297
_58.array.cond.5:
  %185 = phi i32 [0, %_57.while.exit.7], [%188, %_59.array.body.5]                 ; inst 298
  %186 = icmp slt i32 %185, 10000                                                  ; inst 299
  br i1 %186, label %_59.array.body.5, label %_60.array.exit.5                     ; inst 300
_59.array.body.5:
  %187 = getelementptr i32, i32* %184, i32 %185                                    ; inst 301
  store i32 42, i32* %187                                                          ; inst 302
  %188 = add i32 %185, 1                                                           ; inst 303
  br label %_58.array.cond.5                                                       ; inst 304
_60.array.exit.5:
  %189 = alloca %PerformanceCounter                                                ; inst 305
  call void @init_performance_counter(%PerformanceCounter* %189)                   ; inst 306
  call void @quick_sort([10000 x i32]* %183, i32 1000, %PerformanceCounter* %189)  ; inst 307
  %190 = getelementptr %PerformanceCounter, %PerformanceCounter* %189, i32 0, i32 1 ; inst 308
  %191 = load i32, i32* %190                                                       ; inst 309
  %192 = sdiv i32 %191, 100                                                        ; inst 310
  call void @printlnInt(i32 %192)                                                  ; inst 311
  %193 = alloca [10000 x i32]                                                      ; inst 312
  %194 = getelementptr [10000 x i32], [10000 x i32]* %193, i32 0, i32 0            ; inst 313
  br label %_61.array.cond.6                                                       ; inst 314
_61.array.cond.6:
  %195 = phi i32 [0, %_60.array.exit.5], [%198, %_62.array.body.6]                 ; inst 315
  %196 = icmp slt i32 %195, 10000                                                  ; inst 316
  br i1 %196, label %_62.array.body.6, label %_63.array.exit.6                     ; inst 317
_62.array.body.6:
  %197 = getelementptr i32, i32* %194, i32 %195                                    ; inst 318
  store i32 0, i32* %197                                                           ; inst 319
  %198 = add i32 %195, 1                                                           ; inst 320
  br label %_61.array.cond.6                                                       ; inst 321
_63.array.exit.6:
  br label %_64.while.cond.8                                                       ; inst 322
_64.while.cond.8:
  %199 = phi i32 [0, %_63.array.exit.6], [%206, %_68.if.exit.5]                    ; inst 323
  %200 = icmp slt i32 %199, 1000                                                   ; inst 324
  br i1 %200, label %_65.while.body.8, label %_69.while.exit.8                     ; inst 325
_65.while.body.8:
  %201 = sext i32 %199 to i64                                                      ; inst 326
  %202 = getelementptr [10000 x i32], [10000 x i32]* %193, i32 0, i64 %201         ; inst 327
  %203 = srem i32 %199, 2                                                          ; inst 328
  %204 = icmp eq i32 %203, 0                                                       ; inst 329
  br i1 %204, label %_66.if.then.5, label %_67.if.else.5                           ; inst 330
_66.if.then.5:
  br label %_68.if.exit.5                                                          ; inst 331
_67.if.else.5:
  br label %_68.if.exit.5                                                          ; inst 332
_68.if.exit.5:
  %205 = phi i32 [1, %_66.if.then.5], [2, %_67.if.else.5]                          ; inst 333
  store i32 %205, i32* %202                                                        ; inst 334
  %206 = add i32 %199, 1                                                           ; inst 335
  br label %_64.while.cond.8                                                       ; inst 336
_69.while.exit.8:
  %207 = alloca %PerformanceCounter                                                ; inst 337
  call void @init_performance_counter(%PerformanceCounter* %207)                   ; inst 338
  call void @merge_sort([10000 x i32]* %193, i32 1000, %PerformanceCounter* %207)  ; inst 339
  %208 = getelementptr %PerformanceCounter, %PerformanceCounter* %207, i32 0, i32 1 ; inst 340
  %209 = load i32, i32* %208                                                       ; inst 341
  %210 = sdiv i32 %209, 100                                                        ; inst 342
  call void @printlnInt(i32 %210)                                                  ; inst 343
  %211 = alloca [10000 x i32]                                                      ; inst 344
  %212 = getelementptr [10000 x i32], [10000 x i32]* %211, i32 0, i32 0            ; inst 345
  br label %_70.array.cond.7                                                       ; inst 346
_70.array.cond.7:
  %213 = phi i32 [0, %_69.while.exit.8], [%216, %_71.array.body.7]                 ; inst 347
  %214 = icmp slt i32 %213, 10000                                                  ; inst 348
  br i1 %214, label %_71.array.body.7, label %_72.array.exit.7                     ; inst 349
_71.array.body.7:
  %215 = getelementptr i32, i32* %212, i32 %213                                    ; inst 350
  store i32 0, i32* %215                                                           ; inst 351
  %216 = add i32 %213, 1                                                           ; inst 352
  br label %_70.array.cond.7                                                       ; inst 353
_72.array.exit.7:
  %217 = getelementptr [10000 x i32], [10000 x i32]* %211, i32 0, i64 0            ; inst 354
  store i32 123, i32* %217                                                         ; inst 355
  %218 = alloca %PerformanceCounter                                                ; inst 356
  call void @init_performance_counter(%PerformanceCounter* %218)                   ; inst 357
  call void @heap_sort([10000 x i32]* %211, i32 1, %PerformanceCounter* %218)      ; inst 358
  %219 = getelementptr [10000 x i32], [10000 x i32]* %211, i32 0, i64 0            ; inst 359
  %220 = load i32, i32* %219                                                       ; inst 360
  call void @printlnInt(i32 %220)                                                  ; inst 361
  call void @printlnInt(i32 21999)                                                 ; inst 362
  ret void                                                                         ; inst 363
}

define void @main() {
_0.entry.0:
  call void @test_large_scale_performance()                                        ; inst 1
  call void @exit(i32 0)                                                           ; inst 2
  ret void                                                                         ; inst 3
}

