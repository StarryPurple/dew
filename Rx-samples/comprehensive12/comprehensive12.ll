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


%SortingAnalyzer = type { [2000 x i32], [2000 x i32], i32, i32, i32, i32, [2000 x i32], i32, [10 x [200 x i32]], [10 x i32], [100 x i32], [100 x [50 x i32]], [100 x i32], i32, [10 x i32], [10 x i32] }
%DataProcessor = type { [1000 x i32], [1000 x i32], [2000 x i32], i32, [100 x [100 x i32]], i32, [10000 x i32], [20 x i32] }

define void @_9YlBKTdVw0B_new(%SortingAnalyzer* sret(%SortingAnalyzer) %0) {
_0.entry.0:
  %1 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 1
  %2 = getelementptr [2000 x i32], [2000 x i32]* %1, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 2000                                                       ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 1          ; inst 11
  %8 = getelementptr [2000 x i32], [2000 x i32]* %7, i32 0, i32 0                  ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 14
  %10 = icmp slt i32 %9, 2000                                                      ; inst 15
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 17
  store i32 0, i32* %11                                                            ; inst 18
  %12 = add i32 %9, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %13 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 21
  store i32 0, i32* %13                                                            ; inst 22
  %14 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 23
  store i32 0, i32* %14                                                            ; inst 24
  %15 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 4         ; inst 25
  store i32 0, i32* %15                                                            ; inst 26
  %16 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 6         ; inst 29
  %18 = getelementptr [2000 x i32], [2000 x i32]* %17, i32 0, i32 0                ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_7.array.cond.2:
  %19 = phi i32 [0, %_6.array.exit.1], [%22, %_8.array.body.2]                     ; inst 32
  %20 = icmp slt i32 %19, 2000                                                     ; inst 33
  br i1 %20, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 34
_8.array.body.2:
  %21 = getelementptr i32, i32* %18, i32 %19                                       ; inst 35
  store i32 0, i32* %21                                                            ; inst 36
  %22 = add i32 %19, 1                                                             ; inst 37
  br label %_7.array.cond.2                                                        ; inst 38
_9.array.exit.2:
  %23 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 7         ; inst 39
  store i32 0, i32* %23                                                            ; inst 40
  %24 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 8         ; inst 41
  %25 = alloca [200 x i32]                                                         ; inst 42
  %26 = getelementptr [200 x i32], [200 x i32]* %25, i32 0, i32 0                  ; inst 43
  br label %_10.array.cond.3                                                       ; inst 44
_10.array.cond.3:
  %27 = phi i32 [0, %_9.array.exit.2], [%30, %_11.array.body.3]                    ; inst 45
  %28 = icmp slt i32 %27, 200                                                      ; inst 46
  br i1 %28, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 47
_11.array.body.3:
  %29 = getelementptr i32, i32* %26, i32 %27                                       ; inst 48
  store i32 0, i32* %29                                                            ; inst 49
  %30 = add i32 %27, 1                                                             ; inst 50
  br label %_10.array.cond.3                                                       ; inst 51
_12.array.exit.3:
  %31 = getelementptr [10 x [200 x i32]], [10 x [200 x i32]]* %24, i32 0, i32 0    ; inst 52
  br label %_13.array.cond.4                                                       ; inst 53
_13.array.cond.4:
  %32 = phi i32 [0, %_12.array.exit.3], [%35, %_14.array.body.4]                   ; inst 54
  %33 = icmp slt i32 %32, 10                                                       ; inst 55
  br i1 %33, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 56
_14.array.body.4:
  %34 = getelementptr [200 x i32], [200 x i32]* %31, i32 %32                       ; inst 57
  call void @memcpy([200 x i32]* %34, [200 x i32]* %25, i64 800)                   ; inst 58
  %35 = add i32 %32, 1                                                             ; inst 59
  br label %_13.array.cond.4                                                       ; inst 60
_15.array.exit.4:
  %36 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 9         ; inst 61
  %37 = getelementptr [10 x i32], [10 x i32]* %36, i32 0, i32 0                    ; inst 62
  br label %_16.array.cond.5                                                       ; inst 63
_16.array.cond.5:
  %38 = phi i32 [0, %_15.array.exit.4], [%41, %_17.array.body.5]                   ; inst 64
  %39 = icmp slt i32 %38, 10                                                       ; inst 65
  br i1 %39, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 66
_17.array.body.5:
  %40 = getelementptr i32, i32* %37, i32 %38                                       ; inst 67
  store i32 0, i32* %40                                                            ; inst 68
  %41 = add i32 %38, 1                                                             ; inst 69
  br label %_16.array.cond.5                                                       ; inst 70
_18.array.exit.5:
  %42 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 10        ; inst 71
  %43 = getelementptr [100 x i32], [100 x i32]* %42, i32 0, i32 0                  ; inst 72
  br label %_19.array.cond.6                                                       ; inst 73
_19.array.cond.6:
  %44 = phi i32 [0, %_18.array.exit.5], [%47, %_20.array.body.6]                   ; inst 74
  %45 = icmp slt i32 %44, 100                                                      ; inst 75
  br i1 %45, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 76
_20.array.body.6:
  %46 = getelementptr i32, i32* %43, i32 %44                                       ; inst 77
  store i32 0, i32* %46                                                            ; inst 78
  %47 = add i32 %44, 1                                                             ; inst 79
  br label %_19.array.cond.6                                                       ; inst 80
_21.array.exit.6:
  %48 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11        ; inst 81
  %49 = alloca [50 x i32]                                                          ; inst 82
  %50 = getelementptr [50 x i32], [50 x i32]* %49, i32 0, i32 0                    ; inst 83
  br label %_22.array.cond.7                                                       ; inst 84
_22.array.cond.7:
  %51 = phi i32 [0, %_21.array.exit.6], [%54, %_23.array.body.7]                   ; inst 85
  %52 = icmp slt i32 %51, 50                                                       ; inst 86
  br i1 %52, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 87
_23.array.body.7:
  %53 = getelementptr i32, i32* %50, i32 %51                                       ; inst 88
  store i32 0, i32* %53                                                            ; inst 89
  %54 = add i32 %51, 1                                                             ; inst 90
  br label %_22.array.cond.7                                                       ; inst 91
_24.array.exit.7:
  %55 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %48, i32 0, i32 0    ; inst 92
  br label %_25.array.cond.8                                                       ; inst 93
_25.array.cond.8:
  %56 = phi i32 [0, %_24.array.exit.7], [%59, %_26.array.body.8]                   ; inst 94
  %57 = icmp slt i32 %56, 100                                                      ; inst 95
  br i1 %57, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 96
_26.array.body.8:
  %58 = getelementptr [50 x i32], [50 x i32]* %55, i32 %56                         ; inst 97
  call void @memcpy([50 x i32]* %58, [50 x i32]* %49, i64 200)                     ; inst 98
  %59 = add i32 %56, 1                                                             ; inst 99
  br label %_25.array.cond.8                                                       ; inst 100
_27.array.exit.8:
  %60 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12        ; inst 101
  %61 = getelementptr [100 x i32], [100 x i32]* %60, i32 0, i32 0                  ; inst 102
  br label %_28.array.cond.9                                                       ; inst 103
_28.array.cond.9:
  %62 = phi i32 [0, %_27.array.exit.8], [%65, %_29.array.body.9]                   ; inst 104
  %63 = icmp slt i32 %62, 100                                                      ; inst 105
  br i1 %63, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 106
_29.array.body.9:
  %64 = getelementptr i32, i32* %61, i32 %62                                       ; inst 107
  store i32 0, i32* %64                                                            ; inst 108
  %65 = add i32 %62, 1                                                             ; inst 109
  br label %_28.array.cond.9                                                       ; inst 110
_30.array.exit.9:
  %66 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 111
  store i32 0, i32* %66                                                            ; inst 112
  %67 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 14        ; inst 113
  %68 = getelementptr [10 x i32], [10 x i32]* %67, i32 0, i32 0                    ; inst 114
  br label %_31.array.cond.10                                                      ; inst 115
_31.array.cond.10:
  %69 = phi i32 [0, %_30.array.exit.9], [%72, %_32.array.body.10]                  ; inst 116
  %70 = icmp slt i32 %69, 10                                                       ; inst 117
  br i1 %70, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 118
_32.array.body.10:
  %71 = getelementptr i32, i32* %68, i32 %69                                       ; inst 119
  store i32 0, i32* %71                                                            ; inst 120
  %72 = add i32 %69, 1                                                             ; inst 121
  br label %_31.array.cond.10                                                      ; inst 122
_33.array.exit.10:
  %73 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 123
  %74 = getelementptr [10 x i32], [10 x i32]* %73, i32 0, i32 0                    ; inst 124
  br label %_34.array.cond.11                                                      ; inst 125
_34.array.cond.11:
  %75 = phi i32 [0, %_33.array.exit.10], [%78, %_35.array.body.11]                 ; inst 126
  %76 = icmp slt i32 %75, 10                                                       ; inst 127
  br i1 %76, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 128
_35.array.body.11:
  %77 = getelementptr i32, i32* %74, i32 %75                                       ; inst 129
  store i32 0, i32* %77                                                            ; inst 130
  %78 = add i32 %75, 1                                                             ; inst 131
  br label %_34.array.cond.11                                                      ; inst 132
_36.array.exit.11:
  ret void                                                                         ; inst 133
}

define void @_9YlBKTdVw0B_initialize_data(%SortingAnalyzer* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 7
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [2000 x i32], [2000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = call i32 @getInt()                                                          ; inst 10
  store i32 %8, i32* %7                                                            ; inst 11
  %9 = add i32 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  call void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %0)                   ; inst 14
  ret void                                                                         ; inst 15
}

define void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %0) {
_0.entry.0:
  %1 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3          ; inst 1
  store i32 0, i32* %1                                                             ; inst 2
  %2 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 4          ; inst 3
  store i32 0, i32* %2                                                             ; inst 4
  %3 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5          ; inst 5
  store i32 0, i32* %3                                                             ; inst 6
  ret void                                                                         ; inst 7
}

define void @_9YlBKTdVw0B_copy_to_temp(%SortingAnalyzer* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 2
  %2 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 1          ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [2000 x i32], [2000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 10
  %9 = sext i32 %1 to i64                                                          ; inst 11
  %10 = getelementptr [2000 x i32], [2000 x i32]* %8, i32 0, i64 %9                ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  store i32 %11, i32* %7                                                           ; inst 14
  %12 = add i32 %1, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_3.while.exit.0:
  %13 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 17
  %14 = load i32, i32* %13                                                         ; inst 18
  %15 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = add i32 %14, %16                                                           ; inst 21
  store i32 %17, i32* %13                                                          ; inst 22
  ret void                                                                         ; inst 23
}

define void @_9YlBKTdVw0B_restore_from_temp(%SortingAnalyzer* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 2
  %2 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [2000 x i32], [2000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 1          ; inst 10
  %9 = sext i32 %1 to i64                                                          ; inst 11
  %10 = getelementptr [2000 x i32], [2000 x i32]* %8, i32 0, i64 %9                ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  store i32 %11, i32* %7                                                           ; inst 14
  %12 = add i32 %1, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_3.while.exit.0:
  %13 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 17
  %14 = load i32, i32* %13                                                         ; inst 18
  %15 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = add i32 %14, %16                                                           ; inst 21
  store i32 %17, i32* %13                                                          ; inst 22
  ret void                                                                         ; inst 23
}

define void @_9YlBKTdVw0B_merge_sort(%SortingAnalyzer* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %1, %2                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = sub i32 %2, %1                                                              ; inst 3
  %5 = sdiv i32 %4, 2                                                              ; inst 4
  %6 = add i32 %1, %5                                                              ; inst 5
  call void @_9YlBKTdVw0B_merge_sort(%SortingAnalyzer* %0, i32 %1, i32 %6)         ; inst 6
  %7 = add i32 %6, 1                                                               ; inst 7
  call void @_9YlBKTdVw0B_merge_sort(%SortingAnalyzer* %0, i32 %7, i32 %2)         ; inst 8
  call void @_9YlBKTdVw0B_merge(%SortingAnalyzer* %0, i32 %1, i32 %6, i32 %2)      ; inst 9
  br label %_3.if.exit.0                                                           ; inst 10
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 11
_3.if.exit.0:
  ret void                                                                         ; inst 12
}

define void @_9YlBKTdVw0B_merge(%SortingAnalyzer* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = sub i32 %2, %1                                                              ; inst 1
  %5 = add i32 %4, 1                                                               ; inst 2
  %6 = sub i32 %3, %2                                                              ; inst 3
  %7 = alloca [1000 x i32]                                                         ; inst 4
  %8 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i32 0                  ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%12, %_2.array.body.0]                           ; inst 7
  %10 = icmp slt i32 %9, 1000                                                      ; inst 8
  br i1 %10, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 9
_2.array.body.0:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 10
  store i32 0, i32* %11                                                            ; inst 11
  %12 = add i32 %9, 1                                                              ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  %13 = alloca [1000 x i32]                                                        ; inst 14
  %14 = getelementptr [1000 x i32], [1000 x i32]* %13, i32 0, i32 0                ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %15 = phi i32 [0, %_3.array.exit.0], [%18, %_5.array.body.1]                     ; inst 17
  %16 = icmp slt i32 %15, 1000                                                     ; inst 18
  br i1 %16, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 20
  store i32 0, i32* %17                                                            ; inst 21
  %18 = add i32 %15, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %19 = phi i32 [0, %_6.array.exit.1], [%28, %_8.while.body.0]                     ; inst 25
  %20 = icmp slt i32 %19, %5                                                       ; inst 26
  br i1 %20, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 27
_8.while.body.0:
  %21 = sext i32 %19 to i64                                                        ; inst 28
  %22 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i64 %21               ; inst 29
  %23 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 30
  %24 = add i32 %1, %19                                                            ; inst 31
  %25 = sext i32 %24 to i64                                                        ; inst 32
  %26 = getelementptr [2000 x i32], [2000 x i32]* %23, i32 0, i64 %25              ; inst 33
  %27 = load i32, i32* %26                                                         ; inst 34
  store i32 %27, i32* %22                                                          ; inst 35
  %28 = add i32 %19, 1                                                             ; inst 36
  br label %_7.while.cond.0                                                        ; inst 37
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 38
_10.while.cond.1:
  %29 = phi i32 [0, %_9.while.exit.0], [%39, %_11.while.body.1]                    ; inst 39
  %30 = icmp slt i32 %29, %6                                                       ; inst 40
  br i1 %30, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 41
_11.while.body.1:
  %31 = sext i32 %29 to i64                                                        ; inst 42
  %32 = getelementptr [1000 x i32], [1000 x i32]* %13, i32 0, i64 %31              ; inst 43
  %33 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 44
  %34 = add i32 %2, 1                                                              ; inst 45
  %35 = add i32 %34, %29                                                           ; inst 46
  %36 = sext i32 %35 to i64                                                        ; inst 47
  %37 = getelementptr [2000 x i32], [2000 x i32]* %33, i32 0, i64 %36              ; inst 48
  %38 = load i32, i32* %37                                                         ; inst 49
  store i32 %38, i32* %32                                                          ; inst 50
  %39 = add i32 %29, 1                                                             ; inst 51
  br label %_10.while.cond.1                                                       ; inst 52
_12.while.exit.1:
  %40 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 53
  %41 = load i32, i32* %40                                                         ; inst 54
  %42 = add i32 %5, %6                                                             ; inst 55
  %43 = add i32 %41, %42                                                           ; inst 56
  store i32 %43, i32* %40                                                          ; inst 57
  br label %_13.while.cond.2                                                       ; inst 58
_13.while.cond.2:
  %44 = phi i32 [0, %_12.while.exit.1], [%74, %_20.if.exit.0]                      ; inst 59
  %45 = phi i32 [%1, %_12.while.exit.1], [%76, %_20.if.exit.0]                     ; inst 60
  %46 = phi i32 [0, %_12.while.exit.1], [%75, %_20.if.exit.0]                      ; inst 61
  %47 = icmp slt i32 %46, %5                                                       ; inst 62
  br i1 %47, label %_14.lazy.then.0, label %_15.lazy.else.0                        ; inst 63
_14.lazy.then.0:
  %48 = icmp slt i32 %44, %6                                                       ; inst 64
  br label %_16.lazy.exit.0                                                        ; inst 65
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 66
_16.lazy.exit.0:
  %49 = phi i1 [%48, %_14.lazy.then.0], [0, %_15.lazy.else.0]                      ; inst 67
  br i1 %49, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 68
_17.while.body.2:
  %50 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 69
  %51 = load i32, i32* %50                                                         ; inst 70
  %52 = add i32 %51, 1                                                             ; inst 71
  store i32 %52, i32* %50                                                          ; inst 72
  %53 = sext i32 %46 to i64                                                        ; inst 73
  %54 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i64 %53               ; inst 74
  %55 = load i32, i32* %54                                                         ; inst 75
  %56 = sext i32 %44 to i64                                                        ; inst 76
  %57 = getelementptr [1000 x i32], [1000 x i32]* %13, i32 0, i64 %56              ; inst 77
  %58 = load i32, i32* %57                                                         ; inst 78
  %59 = icmp sle i32 %55, %58                                                      ; inst 79
  br i1 %59, label %_18.if.then.0, label %_19.if.else.0                            ; inst 80
_18.if.then.0:
  %60 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 81
  %61 = sext i32 %45 to i64                                                        ; inst 82
  %62 = getelementptr [2000 x i32], [2000 x i32]* %60, i32 0, i64 %61              ; inst 83
  %63 = sext i32 %46 to i64                                                        ; inst 84
  %64 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i64 %63               ; inst 85
  %65 = load i32, i32* %64                                                         ; inst 86
  store i32 %65, i32* %62                                                          ; inst 87
  %66 = add i32 %46, 1                                                             ; inst 88
  br label %_20.if.exit.0                                                          ; inst 89
_19.if.else.0:
  %67 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 90
  %68 = sext i32 %45 to i64                                                        ; inst 91
  %69 = getelementptr [2000 x i32], [2000 x i32]* %67, i32 0, i64 %68              ; inst 92
  %70 = sext i32 %44 to i64                                                        ; inst 93
  %71 = getelementptr [1000 x i32], [1000 x i32]* %13, i32 0, i64 %70              ; inst 94
  %72 = load i32, i32* %71                                                         ; inst 95
  store i32 %72, i32* %69                                                          ; inst 96
  %73 = add i32 %44, 1                                                             ; inst 97
  br label %_20.if.exit.0                                                          ; inst 98
_20.if.exit.0:
  %74 = phi i32 [%44, %_18.if.then.0], [%73, %_19.if.else.0]                       ; inst 99
  %75 = phi i32 [%66, %_18.if.then.0], [%46, %_19.if.else.0]                       ; inst 100
  %76 = add i32 %45, 1                                                             ; inst 101
  %77 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 102
  %78 = load i32, i32* %77                                                         ; inst 103
  %79 = add i32 %78, 1                                                             ; inst 104
  store i32 %79, i32* %77                                                          ; inst 105
  br label %_13.while.cond.2                                                       ; inst 106
_21.while.exit.2:
  br label %_22.while.cond.3                                                       ; inst 107
_22.while.cond.3:
  %80 = phi i32 [%45, %_21.while.exit.2], [%90, %_23.while.body.3]                 ; inst 108
  %81 = phi i32 [%46, %_21.while.exit.2], [%89, %_23.while.body.3]                 ; inst 109
  %82 = icmp slt i32 %81, %5                                                       ; inst 110
  br i1 %82, label %_23.while.body.3, label %_24.while.exit.3                      ; inst 111
_23.while.body.3:
  %83 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 112
  %84 = sext i32 %80 to i64                                                        ; inst 113
  %85 = getelementptr [2000 x i32], [2000 x i32]* %83, i32 0, i64 %84              ; inst 114
  %86 = sext i32 %81 to i64                                                        ; inst 115
  %87 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i64 %86               ; inst 116
  %88 = load i32, i32* %87                                                         ; inst 117
  store i32 %88, i32* %85                                                          ; inst 118
  %89 = add i32 %81, 1                                                             ; inst 119
  %90 = add i32 %80, 1                                                             ; inst 120
  %91 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 121
  %92 = load i32, i32* %91                                                         ; inst 122
  %93 = add i32 %92, 1                                                             ; inst 123
  store i32 %93, i32* %91                                                          ; inst 124
  br label %_22.while.cond.3                                                       ; inst 125
_24.while.exit.3:
  br label %_25.while.cond.4                                                       ; inst 126
_25.while.cond.4:
  %94 = phi i32 [%44, %_24.while.exit.3], [%103, %_26.while.body.4]                ; inst 127
  %95 = phi i32 [%80, %_24.while.exit.3], [%104, %_26.while.body.4]                ; inst 128
  %96 = icmp slt i32 %94, %6                                                       ; inst 129
  br i1 %96, label %_26.while.body.4, label %_27.while.exit.4                      ; inst 130
_26.while.body.4:
  %97 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 131
  %98 = sext i32 %95 to i64                                                        ; inst 132
  %99 = getelementptr [2000 x i32], [2000 x i32]* %97, i32 0, i64 %98              ; inst 133
  %100 = sext i32 %94 to i64                                                       ; inst 134
  %101 = getelementptr [1000 x i32], [1000 x i32]* %13, i32 0, i64 %100            ; inst 135
  %102 = load i32, i32* %101                                                       ; inst 136
  store i32 %102, i32* %99                                                         ; inst 137
  %103 = add i32 %94, 1                                                            ; inst 138
  %104 = add i32 %95, 1                                                            ; inst 139
  %105 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5        ; inst 140
  %106 = load i32, i32* %105                                                       ; inst 141
  %107 = add i32 %106, 1                                                           ; inst 142
  store i32 %107, i32* %105                                                        ; inst 143
  br label %_25.while.cond.4                                                       ; inst 144
_27.while.exit.4:
  ret void                                                                         ; inst 145
}

define void @_9YlBKTdVw0B_quick_sort_3way(%SortingAnalyzer* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %1, %2                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_11.if.else.0                              ; inst 2
_1.if.then.0:
  %4 = add i32 %1, 1                                                               ; inst 3
  %5 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 4
  %6 = sext i32 %1 to i64                                                          ; inst 5
  %7 = getelementptr [2000 x i32], [2000 x i32]* %5, i32 0, i64 %6                 ; inst 6
  %8 = load i32, i32* %7                                                           ; inst 7
  br label %_2.while.cond.0                                                        ; inst 8
_2.while.cond.0:
  %9 = phi i32 [%4, %_1.if.then.0], [%32, %_9.if.exit.1]                           ; inst 9
  %10 = phi i32 [%2, %_1.if.then.0], [%33, %_9.if.exit.1]                          ; inst 10
  %11 = phi i32 [%1, %_1.if.then.0], [%34, %_9.if.exit.1]                          ; inst 11
  %12 = icmp sle i32 %9, %10                                                       ; inst 12
  br i1 %12, label %_3.while.body.0, label %_10.while.exit.0                       ; inst 13
_3.while.body.0:
  %13 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = add i32 %14, 1                                                             ; inst 16
  store i32 %15, i32* %13                                                          ; inst 17
  %16 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 18
  %17 = sext i32 %9 to i64                                                         ; inst 19
  %18 = getelementptr [2000 x i32], [2000 x i32]* %16, i32 0, i64 %17              ; inst 20
  %19 = load i32, i32* %18                                                         ; inst 21
  %20 = icmp slt i32 %19, %8                                                       ; inst 22
  br i1 %20, label %_4.if.then.1, label %_5.if.else.1                              ; inst 23
_4.if.then.1:
  call void @_9YlBKTdVw0B_swap_elements(%SortingAnalyzer* %0, i32 %11, i32 %9)     ; inst 24
  %21 = add i32 %11, 1                                                             ; inst 25
  %22 = add i32 %9, 1                                                              ; inst 26
  br label %_9.if.exit.1                                                           ; inst 27
_5.if.else.1:
  %23 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 28
  %24 = sext i32 %9 to i64                                                         ; inst 29
  %25 = getelementptr [2000 x i32], [2000 x i32]* %23, i32 0, i64 %24              ; inst 30
  %26 = load i32, i32* %25                                                         ; inst 31
  %27 = icmp sgt i32 %26, %8                                                       ; inst 32
  br i1 %27, label %_6.if.then.2, label %_7.if.else.2                              ; inst 33
_6.if.then.2:
  call void @_9YlBKTdVw0B_swap_elements(%SortingAnalyzer* %0, i32 %9, i32 %10)     ; inst 34
  %28 = sub i32 %10, 1                                                             ; inst 35
  br label %_8.if.exit.2                                                           ; inst 36
_7.if.else.2:
  %29 = add i32 %9, 1                                                              ; inst 37
  br label %_8.if.exit.2                                                           ; inst 38
_8.if.exit.2:
  %30 = phi i32 [%9, %_6.if.then.2], [%29, %_7.if.else.2]                          ; inst 39
  %31 = phi i32 [%28, %_6.if.then.2], [%10, %_7.if.else.2]                         ; inst 40
  br label %_9.if.exit.1                                                           ; inst 41
_9.if.exit.1:
  %32 = phi i32 [%22, %_4.if.then.1], [%30, %_8.if.exit.2]                         ; inst 42
  %33 = phi i32 [%10, %_4.if.then.1], [%31, %_8.if.exit.2]                         ; inst 43
  %34 = phi i32 [%21, %_4.if.then.1], [%11, %_8.if.exit.2]                         ; inst 44
  br label %_2.while.cond.0                                                        ; inst 45
_10.while.exit.0:
  %35 = sub i32 %11, 1                                                             ; inst 46
  call void @_9YlBKTdVw0B_quick_sort_3way(%SortingAnalyzer* %0, i32 %1, i32 %35)   ; inst 47
  %36 = add i32 %10, 1                                                             ; inst 48
  call void @_9YlBKTdVw0B_quick_sort_3way(%SortingAnalyzer* %0, i32 %36, i32 %2)   ; inst 49
  br label %_12.if.exit.0                                                          ; inst 50
_11.if.else.0:
  br label %_12.if.exit.0                                                          ; inst 51
_12.if.exit.0:
  ret void                                                                         ; inst 52
}

define void @_9YlBKTdVw0B_swap_elements(%SortingAnalyzer* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 1
  %4 = sext i32 %1 to i64                                                          ; inst 2
  %5 = getelementptr [2000 x i32], [2000 x i32]* %3, i32 0, i64 %4                 ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  %7 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 5
  %8 = sext i32 %1 to i64                                                          ; inst 6
  %9 = getelementptr [2000 x i32], [2000 x i32]* %7, i32 0, i64 %8                 ; inst 7
  %10 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 8
  %11 = sext i32 %2 to i64                                                         ; inst 9
  %12 = getelementptr [2000 x i32], [2000 x i32]* %10, i32 0, i64 %11              ; inst 10
  %13 = load i32, i32* %12                                                         ; inst 11
  store i32 %13, i32* %9                                                           ; inst 12
  %14 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 13
  %15 = sext i32 %2 to i64                                                         ; inst 14
  %16 = getelementptr [2000 x i32], [2000 x i32]* %14, i32 0, i64 %15              ; inst 15
  store i32 %6, i32* %16                                                           ; inst 16
  %17 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 4         ; inst 17
  %18 = load i32, i32* %17                                                         ; inst 18
  %19 = add i32 %18, 1                                                             ; inst 19
  store i32 %19, i32* %17                                                          ; inst 20
  %20 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 21
  %21 = load i32, i32* %20                                                         ; inst 22
  %22 = add i32 %21, 3                                                             ; inst 23
  store i32 %22, i32* %20                                                          ; inst 24
  ret void                                                                         ; inst 25
}

define void @_9YlBKTdVw0B_heap_sort(%SortingAnalyzer* %0) {
_0.entry.0:
  call void @_9YlBKTdVw0B_build_max_heap(%SortingAnalyzer* %0)                     ; inst 1
  %1 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 2
  %2 = load i32, i32* %1                                                           ; inst 3
  %3 = sub i32 %2, 1                                                               ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %4 = phi i32 [%3, %_0.entry.0], [%6, %_2.while.body.0]                           ; inst 6
  %5 = icmp sgt i32 %4, 0                                                          ; inst 7
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  call void @_9YlBKTdVw0B_swap_elements(%SortingAnalyzer* %0, i32 0, i32 %4)       ; inst 9
  %6 = sub i32 %4, 1                                                               ; inst 10
  %7 = add i32 %6, 1                                                               ; inst 11
  call void @_9YlBKTdVw0B_max_heapify(%SortingAnalyzer* %0, i32 0, i32 %7)         ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define void @_9YlBKTdVw0B_build_max_heap(%SortingAnalyzer* %0) {
_0.entry.0:
  %1 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = sdiv i32 %2, 2                                                              ; inst 3
  %4 = sub i32 %3, 1                                                               ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %5 = phi i32 [%4, %_0.entry.0], [%9, %_2.while.body.0]                           ; inst 6
  %6 = icmp sge i32 %5, 0                                                          ; inst 7
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  %7 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  call void @_9YlBKTdVw0B_max_heapify(%SortingAnalyzer* %0, i32 %5, i32 %8)        ; inst 11
  %9 = sub i32 %5, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define void @_9YlBKTdVw0B_max_heapify(%SortingAnalyzer* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = mul i32 2, %1                                                               ; inst 1
  %4 = add i32 %3, 1                                                               ; inst 2
  %5 = mul i32 2, %1                                                               ; inst 3
  %6 = add i32 %5, 2                                                               ; inst 4
  %7 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3          ; inst 5
  %8 = load i32, i32* %7                                                           ; inst 6
  %9 = add i32 %8, 1                                                               ; inst 7
  store i32 %9, i32* %7                                                            ; inst 8
  %10 = icmp slt i32 %4, %2                                                        ; inst 9
  br i1 %10, label %_1.lazy.then.0, label %_2.lazy.else.0                          ; inst 10
_1.lazy.then.0:
  %11 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 11
  %12 = sext i32 %4 to i64                                                         ; inst 12
  %13 = getelementptr [2000 x i32], [2000 x i32]* %11, i32 0, i64 %12              ; inst 13
  %14 = load i32, i32* %13                                                         ; inst 14
  %15 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 15
  %16 = sext i32 %1 to i64                                                         ; inst 16
  %17 = getelementptr [2000 x i32], [2000 x i32]* %15, i32 0, i64 %16              ; inst 17
  %18 = load i32, i32* %17                                                         ; inst 18
  %19 = icmp sgt i32 %14, %18                                                      ; inst 19
  br label %_3.lazy.exit.0                                                         ; inst 20
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 21
_3.lazy.exit.0:
  %20 = phi i1 [%19, %_1.lazy.then.0], [0, %_2.lazy.else.0]                        ; inst 22
  br i1 %20, label %_4.if.then.0, label %_5.if.else.0                              ; inst 23
_4.if.then.0:
  br label %_6.if.exit.0                                                           ; inst 24
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 25
_6.if.exit.0:
  %21 = phi i32 [%4, %_4.if.then.0], [%1, %_5.if.else.0]                           ; inst 26
  %22 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 27
  %23 = load i32, i32* %22                                                         ; inst 28
  %24 = add i32 %23, 1                                                             ; inst 29
  store i32 %24, i32* %22                                                          ; inst 30
  %25 = icmp slt i32 %6, %2                                                        ; inst 31
  br i1 %25, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 32
_7.lazy.then.1:
  %26 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 33
  %27 = sext i32 %6 to i64                                                         ; inst 34
  %28 = getelementptr [2000 x i32], [2000 x i32]* %26, i32 0, i64 %27              ; inst 35
  %29 = load i32, i32* %28                                                         ; inst 36
  %30 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 37
  %31 = sext i32 %21 to i64                                                        ; inst 38
  %32 = getelementptr [2000 x i32], [2000 x i32]* %30, i32 0, i64 %31              ; inst 39
  %33 = load i32, i32* %32                                                         ; inst 40
  %34 = icmp sgt i32 %29, %33                                                      ; inst 41
  br label %_9.lazy.exit.1                                                         ; inst 42
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 43
_9.lazy.exit.1:
  %35 = phi i1 [%34, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 44
  br i1 %35, label %_10.if.then.1, label %_11.if.else.1                            ; inst 45
_10.if.then.1:
  br label %_12.if.exit.1                                                          ; inst 46
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 47
_12.if.exit.1:
  %36 = phi i32 [%6, %_10.if.then.1], [%21, %_11.if.else.1]                        ; inst 48
  %37 = icmp ne i32 %36, %1                                                        ; inst 49
  br i1 %37, label %_13.if.then.2, label %_14.if.else.2                            ; inst 50
_13.if.then.2:
  call void @_9YlBKTdVw0B_swap_elements(%SortingAnalyzer* %0, i32 %1, i32 %36)     ; inst 51
  call void @_9YlBKTdVw0B_max_heapify(%SortingAnalyzer* %0, i32 %36, i32 %2)       ; inst 52
  br label %_15.if.exit.2                                                          ; inst 53
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 54
_15.if.exit.2:
  ret void                                                                         ; inst 55
}

define void @_9YlBKTdVw0B_radix_sort(%SortingAnalyzer* %0) {
_0.entry.0:
  %1 = call i32 @_9YlBKTdVw0B_find_maximum(%SortingAnalyzer* %0)                   ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %2 = phi i32 [1, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 3
  %3 = sdiv i32 %1, %2                                                             ; inst 4
  %4 = icmp sgt i32 %3, 0                                                          ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @_9YlBKTdVw0B_counting_sort_by_digit(%SortingAnalyzer* %0, i32 %2)     ; inst 7
  %5 = mul i32 %2, 10                                                              ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_3.while.exit.0:
  ret void                                                                         ; inst 10
}

define i32 @_9YlBKTdVw0B_find_maximum(%SortingAnalyzer* %0) {
_0.entry.0:
  %1 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 1
  %2 = getelementptr [2000 x i32], [2000 x i32]* %1, i32 0, i64 0                  ; inst 2
  %3 = load i32, i32* %2                                                           ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %4 = phi i32 [1, %_0.entry.0], [%19, %_5.if.exit.0]                              ; inst 5
  %5 = phi i32 [%3, %_0.entry.0], [%18, %_5.if.exit.0]                             ; inst 6
  %6 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp slt i32 %4, %7                                                         ; inst 9
  br i1 %8, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 10
_2.while.body.0:
  %9 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 11
  %10 = sext i32 %4 to i64                                                         ; inst 12
  %11 = getelementptr [2000 x i32], [2000 x i32]* %9, i32 0, i64 %10               ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = icmp sgt i32 %12, %5                                                       ; inst 15
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 16
_3.if.then.0:
  %14 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 17
  %15 = sext i32 %4 to i64                                                         ; inst 18
  %16 = getelementptr [2000 x i32], [2000 x i32]* %14, i32 0, i64 %15              ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  br label %_5.if.exit.0                                                           ; inst 21
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 22
_5.if.exit.0:
  %18 = phi i32 [%17, %_3.if.then.0], [%5, %_4.if.else.0]                          ; inst 23
  %19 = add i32 %4, 1                                                              ; inst 24
  br label %_1.while.cond.0                                                        ; inst 25
_6.while.exit.0:
  ret i32 %5                                                                       ; inst 26
}

define void @_9YlBKTdVw0B_counting_sort_by_digit(%SortingAnalyzer* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [2000 x i32]                                                         ; inst 1
  %3 = getelementptr [2000 x i32], [2000 x i32]* %2, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 2000                                                       ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = alloca [10 x i32]                                                           ; inst 11
  %9 = getelementptr [10 x i32], [10 x i32]* %8, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 10                                                       ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 17
  store i32 0, i32* %12                                                            ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %14 = phi i32 [0, %_6.array.exit.1], [%28, %_8.while.body.0]                     ; inst 22
  %15 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 23
  %16 = load i32, i32* %15                                                         ; inst 24
  %17 = icmp slt i32 %14, %16                                                      ; inst 25
  br i1 %17, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 26
_8.while.body.0:
  %18 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 27
  %19 = sext i32 %14 to i64                                                        ; inst 28
  %20 = getelementptr [2000 x i32], [2000 x i32]* %18, i32 0, i64 %19              ; inst 29
  %21 = load i32, i32* %20                                                         ; inst 30
  %22 = sdiv i32 %21, %1                                                           ; inst 31
  %23 = srem i32 %22, 10                                                           ; inst 32
  %24 = sext i32 %23 to i64                                                        ; inst 33
  %25 = getelementptr [10 x i32], [10 x i32]* %8, i32 0, i64 %24                   ; inst 34
  %26 = load i32, i32* %25                                                         ; inst 35
  %27 = add i32 %26, 1                                                             ; inst 36
  store i32 %27, i32* %25                                                          ; inst 37
  %28 = add i32 %14, 1                                                             ; inst 38
  br label %_7.while.cond.0                                                        ; inst 39
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 40
_10.while.cond.1:
  %29 = phi i32 [1, %_9.while.exit.0], [%39, %_11.while.body.1]                    ; inst 41
  %30 = icmp slt i32 %29, 10                                                       ; inst 42
  br i1 %30, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 43
_11.while.body.1:
  %31 = sext i32 %29 to i64                                                        ; inst 44
  %32 = getelementptr [10 x i32], [10 x i32]* %8, i32 0, i64 %31                   ; inst 45
  %33 = load i32, i32* %32                                                         ; inst 46
  %34 = sub i32 %29, 1                                                             ; inst 47
  %35 = sext i32 %34 to i64                                                        ; inst 48
  %36 = getelementptr [10 x i32], [10 x i32]* %8, i32 0, i64 %35                   ; inst 49
  %37 = load i32, i32* %36                                                         ; inst 50
  %38 = add i32 %33, %37                                                           ; inst 51
  store i32 %38, i32* %32                                                          ; inst 52
  %39 = add i32 %29, 1                                                             ; inst 53
  br label %_10.while.cond.1                                                       ; inst 54
_12.while.exit.1:
  %40 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 55
  %41 = load i32, i32* %40                                                         ; inst 56
  %42 = sub i32 %41, 1                                                             ; inst 57
  br label %_13.while.cond.2                                                       ; inst 58
_13.while.cond.2:
  %43 = phi i32 [%42, %_12.while.exit.1], [%64, %_14.while.body.2]                 ; inst 59
  %44 = icmp sge i32 %43, 0                                                        ; inst 60
  br i1 %44, label %_14.while.body.2, label %_15.while.exit.2                      ; inst 61
_14.while.body.2:
  %45 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 62
  %46 = sext i32 %43 to i64                                                        ; inst 63
  %47 = getelementptr [2000 x i32], [2000 x i32]* %45, i32 0, i64 %46              ; inst 64
  %48 = load i32, i32* %47                                                         ; inst 65
  %49 = sdiv i32 %48, %1                                                           ; inst 66
  %50 = srem i32 %49, 10                                                           ; inst 67
  %51 = sext i32 %50 to i64                                                        ; inst 68
  %52 = getelementptr [10 x i32], [10 x i32]* %8, i32 0, i64 %51                   ; inst 69
  %53 = load i32, i32* %52                                                         ; inst 70
  %54 = sub i32 %53, 1                                                             ; inst 71
  store i32 %54, i32* %52                                                          ; inst 72
  %55 = sext i32 %50 to i64                                                        ; inst 73
  %56 = getelementptr [10 x i32], [10 x i32]* %8, i32 0, i64 %55                   ; inst 74
  %57 = load i32, i32* %56                                                         ; inst 75
  %58 = sext i32 %57 to i64                                                        ; inst 76
  %59 = getelementptr [2000 x i32], [2000 x i32]* %2, i32 0, i64 %58               ; inst 77
  %60 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 78
  %61 = sext i32 %43 to i64                                                        ; inst 79
  %62 = getelementptr [2000 x i32], [2000 x i32]* %60, i32 0, i64 %61              ; inst 80
  %63 = load i32, i32* %62                                                         ; inst 81
  store i32 %63, i32* %59                                                          ; inst 82
  %64 = sub i32 %43, 1                                                             ; inst 83
  br label %_13.while.cond.2                                                       ; inst 84
_15.while.exit.2:
  br label %_16.while.cond.3                                                       ; inst 85
_16.while.cond.3:
  %65 = phi i32 [0, %_15.while.exit.2], [%75, %_17.while.body.3]                   ; inst 86
  %66 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 87
  %67 = load i32, i32* %66                                                         ; inst 88
  %68 = icmp slt i32 %65, %67                                                      ; inst 89
  br i1 %68, label %_17.while.body.3, label %_18.while.exit.3                      ; inst 90
_17.while.body.3:
  %69 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 91
  %70 = sext i32 %65 to i64                                                        ; inst 92
  %71 = getelementptr [2000 x i32], [2000 x i32]* %69, i32 0, i64 %70              ; inst 93
  %72 = sext i32 %65 to i64                                                        ; inst 94
  %73 = getelementptr [2000 x i32], [2000 x i32]* %2, i32 0, i64 %72               ; inst 95
  %74 = load i32, i32* %73                                                         ; inst 96
  store i32 %74, i32* %71                                                          ; inst 97
  %75 = add i32 %65, 1                                                             ; inst 98
  br label %_16.while.cond.3                                                       ; inst 99
_18.while.exit.3:
  %76 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 100
  %77 = load i32, i32* %76                                                         ; inst 101
  %78 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 102
  %79 = load i32, i32* %78                                                         ; inst 103
  %80 = mul i32 %79, 3                                                             ; inst 104
  %81 = add i32 %77, %80                                                           ; inst 105
  store i32 %81, i32* %76                                                          ; inst 106
  ret void                                                                         ; inst 107
}

define void @_9YlBKTdVw0B_bucket_sort(%SortingAnalyzer* %0) {
_0.entry.0:
  %1 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp sle i32 %2, 1                                                          ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret void                                                                         ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 7
  %5 = getelementptr [2000 x i32], [2000 x i32]* %4, i32 0, i64 0                  ; inst 8
  %6 = load i32, i32* %5                                                           ; inst 9
  %7 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 10
  %8 = getelementptr [2000 x i32], [2000 x i32]* %7, i32 0, i64 0                  ; inst 11
  %9 = load i32, i32* %8                                                           ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %10 = phi i32 [%6, %_3.if.exit.0], [%25, %_11.if.exit.2]                         ; inst 14
  %11 = phi i32 [%9, %_3.if.exit.0], [%35, %_11.if.exit.2]                         ; inst 15
  %12 = phi i32 [1, %_3.if.exit.0], [%36, %_11.if.exit.2]                          ; inst 16
  %13 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 17
  %14 = load i32, i32* %13                                                         ; inst 18
  %15 = icmp slt i32 %12, %14                                                      ; inst 19
  br i1 %15, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 20
_5.while.body.0:
  %16 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 21
  %17 = sext i32 %12 to i64                                                        ; inst 22
  %18 = getelementptr [2000 x i32], [2000 x i32]* %16, i32 0, i64 %17              ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = icmp slt i32 %19, %10                                                      ; inst 25
  br i1 %20, label %_6.if.then.1, label %_7.if.else.1                              ; inst 26
_6.if.then.1:
  %21 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 27
  %22 = sext i32 %12 to i64                                                        ; inst 28
  %23 = getelementptr [2000 x i32], [2000 x i32]* %21, i32 0, i64 %22              ; inst 29
  %24 = load i32, i32* %23                                                         ; inst 30
  br label %_8.if.exit.1                                                           ; inst 31
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 32
_8.if.exit.1:
  %25 = phi i32 [%24, %_6.if.then.1], [%10, %_7.if.else.1]                         ; inst 33
  %26 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 34
  %27 = sext i32 %12 to i64                                                        ; inst 35
  %28 = getelementptr [2000 x i32], [2000 x i32]* %26, i32 0, i64 %27              ; inst 36
  %29 = load i32, i32* %28                                                         ; inst 37
  %30 = icmp sgt i32 %29, %11                                                      ; inst 38
  br i1 %30, label %_9.if.then.2, label %_10.if.else.2                             ; inst 39
_9.if.then.2:
  %31 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 40
  %32 = sext i32 %12 to i64                                                        ; inst 41
  %33 = getelementptr [2000 x i32], [2000 x i32]* %31, i32 0, i64 %32              ; inst 42
  %34 = load i32, i32* %33                                                         ; inst 43
  br label %_11.if.exit.2                                                          ; inst 44
_10.if.else.2:
  br label %_11.if.exit.2                                                          ; inst 45
_11.if.exit.2:
  %35 = phi i32 [%34, %_9.if.then.2], [%11, %_10.if.else.2]                        ; inst 46
  %36 = add i32 %12, 1                                                             ; inst 47
  br label %_4.while.cond.0                                                        ; inst 48
_12.while.exit.0:
  %37 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 49
  %38 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 50
  %39 = load i32, i32* %38                                                         ; inst 51
  %40 = sdiv i32 %39, 4                                                            ; inst 52
  store i32 %40, i32* %37                                                          ; inst 53
  %41 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 54
  %42 = load i32, i32* %41                                                         ; inst 55
  %43 = icmp sgt i32 %42, 99                                                       ; inst 56
  br i1 %43, label %_13.if.then.3, label %_14.if.else.3                            ; inst 57
_13.if.then.3:
  %44 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 58
  store i32 99, i32* %44                                                           ; inst 59
  br label %_15.if.exit.3                                                          ; inst 60
_14.if.else.3:
  br label %_15.if.exit.3                                                          ; inst 61
_15.if.exit.3:
  %45 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 62
  %46 = load i32, i32* %45                                                         ; inst 63
  %47 = icmp slt i32 %46, 1                                                        ; inst 64
  br i1 %47, label %_16.if.then.4, label %_17.if.else.4                            ; inst 65
_16.if.then.4:
  %48 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 66
  store i32 1, i32* %48                                                            ; inst 67
  br label %_18.if.exit.4                                                          ; inst 68
_17.if.else.4:
  br label %_18.if.exit.4                                                          ; inst 69
_18.if.exit.4:
  %49 = sub i32 %11, %10                                                           ; inst 70
  %50 = add i32 %49, 1                                                             ; inst 71
  %51 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 72
  %52 = load i32, i32* %51                                                         ; inst 73
  %53 = sdiv i32 %50, %52                                                          ; inst 74
  %54 = add i32 %53, 1                                                             ; inst 75
  br label %_19.while.cond.1                                                       ; inst 76
_19.while.cond.1:
  %55 = phi i32 [0, %_18.if.exit.4], [%62, %_20.while.body.1]                      ; inst 77
  %56 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 78
  %57 = load i32, i32* %56                                                         ; inst 79
  %58 = icmp slt i32 %55, %57                                                      ; inst 80
  br i1 %58, label %_20.while.body.1, label %_21.while.exit.1                      ; inst 81
_20.while.body.1:
  %59 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12        ; inst 82
  %60 = sext i32 %55 to i64                                                        ; inst 83
  %61 = getelementptr [100 x i32], [100 x i32]* %59, i32 0, i64 %60                ; inst 84
  store i32 0, i32* %61                                                            ; inst 85
  %62 = add i32 %55, 1                                                             ; inst 86
  br label %_19.while.cond.1                                                       ; inst 87
_21.while.exit.1:
  br label %_22.while.cond.2                                                       ; inst 88
_22.while.cond.2:
  %63 = phi i32 [0, %_21.while.exit.1], [%115, %_26.if.exit.5]                     ; inst 89
  %64 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 90
  %65 = load i32, i32* %64                                                         ; inst 91
  %66 = icmp slt i32 %63, %65                                                      ; inst 92
  br i1 %66, label %_23.while.body.2, label %_27.while.exit.2                      ; inst 93
_23.while.body.2:
  %67 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 94
  %68 = sext i32 %63 to i64                                                        ; inst 95
  %69 = getelementptr [2000 x i32], [2000 x i32]* %67, i32 0, i64 %68              ; inst 96
  %70 = load i32, i32* %69                                                         ; inst 97
  %71 = sub i32 %70, %10                                                           ; inst 98
  %72 = sdiv i32 %71, %54                                                          ; inst 99
  %73 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 100
  %74 = load i32, i32* %73                                                         ; inst 101
  %75 = icmp sge i32 %72, %74                                                      ; inst 102
  br i1 %75, label %_24.if.then.5, label %_25.if.else.5                            ; inst 103
_24.if.then.5:
  %76 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13        ; inst 104
  %77 = load i32, i32* %76                                                         ; inst 105
  %78 = sub i32 %77, 1                                                             ; inst 106
  %79 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11        ; inst 107
  %80 = sext i32 %78 to i64                                                        ; inst 108
  %81 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %79, i32 0, i64 %80  ; inst 109
  %82 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12        ; inst 110
  %83 = sext i32 %78 to i64                                                        ; inst 111
  %84 = getelementptr [100 x i32], [100 x i32]* %82, i32 0, i64 %83                ; inst 112
  %85 = load i32, i32* %84                                                         ; inst 113
  %86 = sext i32 %85 to i64                                                        ; inst 114
  %87 = getelementptr [50 x i32], [50 x i32]* %81, i32 0, i64 %86                  ; inst 115
  %88 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 116
  %89 = sext i32 %63 to i64                                                        ; inst 117
  %90 = getelementptr [2000 x i32], [2000 x i32]* %88, i32 0, i64 %89              ; inst 118
  %91 = load i32, i32* %90                                                         ; inst 119
  store i32 %91, i32* %87                                                          ; inst 120
  %92 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12        ; inst 121
  %93 = sext i32 %78 to i64                                                        ; inst 122
  %94 = getelementptr [100 x i32], [100 x i32]* %92, i32 0, i64 %93                ; inst 123
  %95 = load i32, i32* %94                                                         ; inst 124
  %96 = add i32 %95, 1                                                             ; inst 125
  store i32 %96, i32* %94                                                          ; inst 126
  br label %_26.if.exit.5                                                          ; inst 127
_25.if.else.5:
  %97 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11        ; inst 128
  %98 = sext i32 %72 to i64                                                        ; inst 129
  %99 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %97, i32 0, i64 %98  ; inst 130
  %100 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12       ; inst 131
  %101 = sext i32 %72 to i64                                                       ; inst 132
  %102 = getelementptr [100 x i32], [100 x i32]* %100, i32 0, i64 %101             ; inst 133
  %103 = load i32, i32* %102                                                       ; inst 134
  %104 = sext i32 %103 to i64                                                      ; inst 135
  %105 = getelementptr [50 x i32], [50 x i32]* %99, i32 0, i64 %104                ; inst 136
  %106 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0        ; inst 137
  %107 = sext i32 %63 to i64                                                       ; inst 138
  %108 = getelementptr [2000 x i32], [2000 x i32]* %106, i32 0, i64 %107           ; inst 139
  %109 = load i32, i32* %108                                                       ; inst 140
  store i32 %109, i32* %105                                                        ; inst 141
  %110 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12       ; inst 142
  %111 = sext i32 %72 to i64                                                       ; inst 143
  %112 = getelementptr [100 x i32], [100 x i32]* %110, i32 0, i64 %111             ; inst 144
  %113 = load i32, i32* %112                                                       ; inst 145
  %114 = add i32 %113, 1                                                           ; inst 146
  store i32 %114, i32* %112                                                        ; inst 147
  br label %_26.if.exit.5                                                          ; inst 148
_26.if.exit.5:
  %115 = add i32 %63, 1                                                            ; inst 149
  br label %_22.while.cond.2                                                       ; inst 150
_27.while.exit.2:
  br label %_28.while.cond.3                                                       ; inst 151
_28.while.cond.3:
  %116 = phi i32 [0, %_27.while.exit.2], [%120, %_29.while.body.3]                 ; inst 152
  %117 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13       ; inst 153
  %118 = load i32, i32* %117                                                       ; inst 154
  %119 = icmp slt i32 %116, %118                                                   ; inst 155
  br i1 %119, label %_29.while.body.3, label %_30.while.exit.3                     ; inst 156
_29.while.body.3:
  call void @_9YlBKTdVw0B_insertion_sort_bucket(%SortingAnalyzer* %0, i32 %116)    ; inst 157
  %120 = add i32 %116, 1                                                           ; inst 158
  br label %_28.while.cond.3                                                       ; inst 159
_30.while.exit.3:
  br label %_31.while.cond.4                                                       ; inst 160
_31.while.cond.4:
  %121 = phi i32 [0, %_30.while.exit.3], [%144, %_35.while.exit.5]                 ; inst 161
  %122 = phi i32 [0, %_30.while.exit.3], [%127, %_35.while.exit.5]                 ; inst 162
  %123 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 13       ; inst 163
  %124 = load i32, i32* %123                                                       ; inst 164
  %125 = icmp slt i32 %121, %124                                                   ; inst 165
  br i1 %125, label %_32.while.body.4, label %_36.while.exit.4                     ; inst 166
_32.while.body.4:
  br label %_33.while.cond.5                                                       ; inst 167
_33.while.cond.5:
  %126 = phi i32 [0, %_32.while.body.4], [%143, %_34.while.body.5]                 ; inst 168
  %127 = phi i32 [%122, %_32.while.body.4], [%142, %_34.while.body.5]              ; inst 169
  %128 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12       ; inst 170
  %129 = sext i32 %121 to i64                                                      ; inst 171
  %130 = getelementptr [100 x i32], [100 x i32]* %128, i32 0, i64 %129             ; inst 172
  %131 = load i32, i32* %130                                                       ; inst 173
  %132 = icmp slt i32 %126, %131                                                   ; inst 174
  br i1 %132, label %_34.while.body.5, label %_35.while.exit.5                     ; inst 175
_34.while.body.5:
  %133 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0        ; inst 176
  %134 = sext i32 %127 to i64                                                      ; inst 177
  %135 = getelementptr [2000 x i32], [2000 x i32]* %133, i32 0, i64 %134           ; inst 178
  %136 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11       ; inst 179
  %137 = sext i32 %121 to i64                                                      ; inst 180
  %138 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %136, i32 0, i64 %137 ; inst 181
  %139 = sext i32 %126 to i64                                                      ; inst 182
  %140 = getelementptr [50 x i32], [50 x i32]* %138, i32 0, i64 %139               ; inst 183
  %141 = load i32, i32* %140                                                       ; inst 184
  store i32 %141, i32* %135                                                        ; inst 185
  %142 = add i32 %127, 1                                                           ; inst 186
  %143 = add i32 %126, 1                                                           ; inst 187
  br label %_33.while.cond.5                                                       ; inst 188
_35.while.exit.5:
  %144 = add i32 %121, 1                                                           ; inst 189
  br label %_31.while.cond.4                                                       ; inst 190
_36.while.exit.4:
  %145 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5        ; inst 191
  %146 = load i32, i32* %145                                                       ; inst 192
  %147 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2        ; inst 193
  %148 = load i32, i32* %147                                                       ; inst 194
  %149 = mul i32 %148, 2                                                           ; inst 195
  %150 = add i32 %146, %149                                                        ; inst 196
  store i32 %150, i32* %145                                                        ; inst 197
  ret void                                                                         ; inst 198
}

define void @_9YlBKTdVw0B_insertion_sort_bucket(%SortingAnalyzer* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 12         ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %3                   ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %6 = phi i32 [1, %_0.entry.0], [%50, %_8.while.exit.1]                           ; inst 6
  %7 = icmp slt i32 %6, %5                                                         ; inst 7
  br i1 %7, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 8
_2.while.body.0:
  %8 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11         ; inst 9
  %9 = sext i32 %1 to i64                                                          ; inst 10
  %10 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %8, i32 0, i64 %9    ; inst 11
  %11 = sext i32 %6 to i64                                                         ; inst 12
  %12 = getelementptr [50 x i32], [50 x i32]* %10, i32 0, i64 %11                  ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = sub i32 %6, 1                                                              ; inst 15
  br label %_3.while.cond.1                                                        ; inst 16
_3.while.cond.1:
  %15 = phi i32 [%14, %_2.while.body.0], [%37, %_7.while.body.1]                   ; inst 17
  %16 = icmp sge i32 %15, 0                                                        ; inst 18
  br i1 %16, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 19
_4.lazy.then.0:
  %17 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11        ; inst 20
  %18 = sext i32 %1 to i64                                                         ; inst 21
  %19 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %17, i32 0, i64 %18  ; inst 22
  %20 = sext i32 %15 to i64                                                        ; inst 23
  %21 = getelementptr [50 x i32], [50 x i32]* %19, i32 0, i64 %20                  ; inst 24
  %22 = load i32, i32* %21                                                         ; inst 25
  %23 = icmp sgt i32 %22, %13                                                      ; inst 26
  br label %_6.lazy.exit.0                                                         ; inst 27
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 28
_6.lazy.exit.0:
  %24 = phi i1 [%23, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 29
  br i1 %24, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 30
_7.while.body.1:
  %25 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11        ; inst 31
  %26 = sext i32 %1 to i64                                                         ; inst 32
  %27 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %25, i32 0, i64 %26  ; inst 33
  %28 = add i32 %15, 1                                                             ; inst 34
  %29 = sext i32 %28 to i64                                                        ; inst 35
  %30 = getelementptr [50 x i32], [50 x i32]* %27, i32 0, i64 %29                  ; inst 36
  %31 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11        ; inst 37
  %32 = sext i32 %1 to i64                                                         ; inst 38
  %33 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %31, i32 0, i64 %32  ; inst 39
  %34 = sext i32 %15 to i64                                                        ; inst 40
  %35 = getelementptr [50 x i32], [50 x i32]* %33, i32 0, i64 %34                  ; inst 41
  %36 = load i32, i32* %35                                                         ; inst 42
  store i32 %36, i32* %30                                                          ; inst 43
  %37 = sub i32 %15, 1                                                             ; inst 44
  %38 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 45
  %39 = load i32, i32* %38                                                         ; inst 46
  %40 = add i32 %39, 1                                                             ; inst 47
  store i32 %40, i32* %38                                                          ; inst 48
  %41 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 49
  %42 = load i32, i32* %41                                                         ; inst 50
  %43 = add i32 %42, 1                                                             ; inst 51
  store i32 %43, i32* %41                                                          ; inst 52
  br label %_3.while.cond.1                                                        ; inst 53
_8.while.exit.1:
  %44 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 11        ; inst 54
  %45 = sext i32 %1 to i64                                                         ; inst 55
  %46 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %44, i32 0, i64 %45  ; inst 56
  %47 = add i32 %15, 1                                                             ; inst 57
  %48 = sext i32 %47 to i64                                                        ; inst 58
  %49 = getelementptr [50 x i32], [50 x i32]* %46, i32 0, i64 %48                  ; inst 59
  store i32 %13, i32* %49                                                          ; inst 60
  %50 = add i32 %6, 1                                                              ; inst 61
  %51 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 62
  %52 = load i32, i32* %51                                                         ; inst 63
  %53 = add i32 %52, 1                                                             ; inst 64
  store i32 %53, i32* %51                                                          ; inst 65
  br label %_1.while.cond.0                                                        ; inst 66
_9.while.exit.0:
  ret void                                                                         ; inst 67
}

define i32 @_9YlBKTdVw0B_analyze_sorted_array(%SortingAnalyzer* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [1, %_0.entry.0], [%15, %_5.if.exit.0]                              ; inst 2
  %2 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_22.critical_edge.0                     ; inst 6
_2.while.body.0:
  %5 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [2000 x i32], [2000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0          ; inst 11
  %10 = sub i32 %1, 1                                                              ; inst 12
  %11 = sext i32 %10 to i64                                                        ; inst 13
  %12 = getelementptr [2000 x i32], [2000 x i32]* %9, i32 0, i64 %11               ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = icmp slt i32 %8, %13                                                       ; inst 16
  br i1 %14, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  br label %_6.while.exit.0                                                        ; inst 18
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 19
_5.if.exit.0:
  %15 = add i32 %1, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  %16 = phi i1 [1, %_22.critical_edge.0], [0, %_3.if.then.0]                       ; inst 22
  br i1 %16, label %_7.if.then.1, label %_8.if.else.1                              ; inst 23
_7.if.then.1:
  br label %_9.if.exit.1                                                           ; inst 24
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 25
_9.if.exit.1:
  %17 = phi i32 [1000, %_7.if.then.1], [0, %_8.if.else.1]                          ; inst 26
  br label %_10.while.cond.1                                                       ; inst 27
_10.while.cond.1:
  %18 = phi i32 [0, %_9.if.exit.1], [%38, %_17.if.exit.2]                          ; inst 28
  %19 = phi i32 [0, %_9.if.exit.1], [%39, %_17.if.exit.2]                          ; inst 29
  %20 = phi i32 [0, %_9.if.exit.1], [%40, %_17.if.exit.2]                          ; inst 30
  %21 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  %23 = icmp slt i32 %20, %22                                                      ; inst 33
  br i1 %23, label %_11.while.body.1, label %_18.while.exit.1                      ; inst 34
_11.while.body.1:
  %24 = icmp eq i32 %20, 0                                                         ; inst 35
  br i1 %24, label %_12.lazy.then.0, label %_13.lazy.else.0                        ; inst 36
_12.lazy.then.0:
  br label %_14.lazy.exit.0                                                        ; inst 37
_13.lazy.else.0:
  %25 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 38
  %26 = sext i32 %20 to i64                                                        ; inst 39
  %27 = getelementptr [2000 x i32], [2000 x i32]* %25, i32 0, i64 %26              ; inst 40
  %28 = load i32, i32* %27                                                         ; inst 41
  %29 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 42
  %30 = sub i32 %20, 1                                                             ; inst 43
  %31 = sext i32 %30 to i64                                                        ; inst 44
  %32 = getelementptr [2000 x i32], [2000 x i32]* %29, i32 0, i64 %31              ; inst 45
  %33 = load i32, i32* %32                                                         ; inst 46
  %34 = icmp ne i32 %28, %33                                                       ; inst 47
  br label %_14.lazy.exit.0                                                        ; inst 48
_14.lazy.exit.0:
  %35 = phi i1 [1, %_12.lazy.then.0], [%34, %_13.lazy.else.0]                      ; inst 49
  br i1 %35, label %_15.if.then.2, label %_16.if.else.2                            ; inst 50
_15.if.then.2:
  %36 = add i32 %19, 1                                                             ; inst 51
  br label %_17.if.exit.2                                                          ; inst 52
_16.if.else.2:
  %37 = add i32 %18, 1                                                             ; inst 53
  br label %_17.if.exit.2                                                          ; inst 54
_17.if.exit.2:
  %38 = phi i32 [%18, %_15.if.then.2], [%37, %_16.if.else.2]                       ; inst 55
  %39 = phi i32 [%36, %_15.if.then.2], [%19, %_16.if.else.2]                       ; inst 56
  %40 = add i32 %20, 1                                                             ; inst 57
  br label %_10.while.cond.1                                                       ; inst 58
_18.while.exit.1:
  %41 = mul i32 %19, 10                                                            ; inst 59
  %42 = mul i32 %18, 5                                                             ; inst 60
  %43 = add i32 %41, %42                                                           ; inst 61
  %44 = add i32 %17, %43                                                           ; inst 62
  %45 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 63
  %46 = load i32, i32* %45                                                         ; inst 64
  %47 = srem i32 %46, 2                                                            ; inst 65
  %48 = icmp eq i32 %47, 0                                                         ; inst 66
  br i1 %48, label %_19.if.then.3, label %_20.if.else.3                            ; inst 67
_19.if.then.3:
  %49 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 68
  %50 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 69
  %51 = load i32, i32* %50                                                         ; inst 70
  %52 = sdiv i32 %51, 2                                                            ; inst 71
  %53 = sub i32 %52, 1                                                             ; inst 72
  %54 = sext i32 %53 to i64                                                        ; inst 73
  %55 = getelementptr [2000 x i32], [2000 x i32]* %49, i32 0, i64 %54              ; inst 74
  %56 = load i32, i32* %55                                                         ; inst 75
  %57 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 76
  %58 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 77
  %59 = load i32, i32* %58                                                         ; inst 78
  %60 = sdiv i32 %59, 2                                                            ; inst 79
  %61 = sext i32 %60 to i64                                                        ; inst 80
  %62 = getelementptr [2000 x i32], [2000 x i32]* %57, i32 0, i64 %61              ; inst 81
  %63 = load i32, i32* %62                                                         ; inst 82
  %64 = add i32 %56, %63                                                           ; inst 83
  %65 = sdiv i32 %64, 2                                                            ; inst 84
  br label %_21.if.exit.3                                                          ; inst 85
_20.if.else.3:
  %66 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 0         ; inst 86
  %67 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 87
  %68 = load i32, i32* %67                                                         ; inst 88
  %69 = sdiv i32 %68, 2                                                            ; inst 89
  %70 = sext i32 %69 to i64                                                        ; inst 90
  %71 = getelementptr [2000 x i32], [2000 x i32]* %66, i32 0, i64 %70              ; inst 91
  %72 = load i32, i32* %71                                                         ; inst 92
  br label %_21.if.exit.3                                                          ; inst 93
_21.if.exit.3:
  %73 = phi i32 [%65, %_19.if.then.3], [%72, %_20.if.else.3]                       ; inst 94
  %74 = add i32 %44, %73                                                           ; inst 95
  ret i32 %74                                                                      ; inst 96
_22.critical_edge.0:
  br label %_6.while.exit.0                                                        ; inst 97
}

define void @_9YlBKTdVw0B_run_comprehensive_tests(%SortingAnalyzer* %0) {
_0.entry.0:
  %1 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  call void @printlnInt(i32 %2)                                                    ; inst 3
  call void @_9YlBKTdVw0B_copy_to_temp(%SortingAnalyzer* %0)                       ; inst 4
  call void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %0)                   ; inst 5
  %3 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2          ; inst 6
  %4 = load i32, i32* %3                                                           ; inst 7
  %5 = sub i32 %4, 1                                                               ; inst 8
  call void @_9YlBKTdVw0B_merge_sort(%SortingAnalyzer* %0, i32 0, i32 %5)          ; inst 9
  %6 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 14         ; inst 10
  %7 = getelementptr [10 x i32], [10 x i32]* %6, i32 0, i64 0                      ; inst 11
  %8 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3          ; inst 12
  %9 = load i32, i32* %8                                                           ; inst 13
  %10 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 4         ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = add i32 %9, %11                                                            ; inst 16
  store i32 %12, i32* %7                                                           ; inst 17
  %13 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 18
  %14 = getelementptr [10 x i32], [10 x i32]* %13, i32 0, i64 0                    ; inst 19
  %15 = call i32 @_9YlBKTdVw0B_analyze_sorted_array(%SortingAnalyzer* %0)          ; inst 20
  store i32 %15, i32* %14                                                          ; inst 21
  %16 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 22
  %17 = getelementptr [10 x i32], [10 x i32]* %16, i32 0, i64 0                    ; inst 23
  %18 = load i32, i32* %17                                                         ; inst 24
  call void @printlnInt(i32 %18)                                                   ; inst 25
  call void @_9YlBKTdVw0B_restore_from_temp(%SortingAnalyzer* %0)                  ; inst 26
  call void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %0)                   ; inst 27
  %19 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 2         ; inst 28
  %20 = load i32, i32* %19                                                         ; inst 29
  %21 = sub i32 %20, 1                                                             ; inst 30
  call void @_9YlBKTdVw0B_quick_sort_3way(%SortingAnalyzer* %0, i32 0, i32 %21)    ; inst 31
  %22 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 14        ; inst 32
  %23 = getelementptr [10 x i32], [10 x i32]* %22, i32 0, i64 1                    ; inst 33
  %24 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 34
  %25 = load i32, i32* %24                                                         ; inst 35
  %26 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 4         ; inst 36
  %27 = load i32, i32* %26                                                         ; inst 37
  %28 = add i32 %25, %27                                                           ; inst 38
  store i32 %28, i32* %23                                                          ; inst 39
  %29 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 40
  %30 = getelementptr [10 x i32], [10 x i32]* %29, i32 0, i64 1                    ; inst 41
  %31 = call i32 @_9YlBKTdVw0B_analyze_sorted_array(%SortingAnalyzer* %0)          ; inst 42
  store i32 %31, i32* %30                                                          ; inst 43
  %32 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 44
  %33 = getelementptr [10 x i32], [10 x i32]* %32, i32 0, i64 1                    ; inst 45
  %34 = load i32, i32* %33                                                         ; inst 46
  call void @printlnInt(i32 %34)                                                   ; inst 47
  call void @_9YlBKTdVw0B_restore_from_temp(%SortingAnalyzer* %0)                  ; inst 48
  call void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %0)                   ; inst 49
  call void @_9YlBKTdVw0B_heap_sort(%SortingAnalyzer* %0)                          ; inst 50
  %35 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 14        ; inst 51
  %36 = getelementptr [10 x i32], [10 x i32]* %35, i32 0, i64 2                    ; inst 52
  %37 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 53
  %38 = load i32, i32* %37                                                         ; inst 54
  %39 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 4         ; inst 55
  %40 = load i32, i32* %39                                                         ; inst 56
  %41 = add i32 %38, %40                                                           ; inst 57
  store i32 %41, i32* %36                                                          ; inst 58
  %42 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 59
  %43 = getelementptr [10 x i32], [10 x i32]* %42, i32 0, i64 2                    ; inst 60
  %44 = call i32 @_9YlBKTdVw0B_analyze_sorted_array(%SortingAnalyzer* %0)          ; inst 61
  store i32 %44, i32* %43                                                          ; inst 62
  %45 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 63
  %46 = getelementptr [10 x i32], [10 x i32]* %45, i32 0, i64 2                    ; inst 64
  %47 = load i32, i32* %46                                                         ; inst 65
  call void @printlnInt(i32 %47)                                                   ; inst 66
  call void @_9YlBKTdVw0B_restore_from_temp(%SortingAnalyzer* %0)                  ; inst 67
  call void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %0)                   ; inst 68
  call void @_9YlBKTdVw0B_radix_sort(%SortingAnalyzer* %0)                         ; inst 69
  %48 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 14        ; inst 70
  %49 = getelementptr [10 x i32], [10 x i32]* %48, i32 0, i64 3                    ; inst 71
  %50 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 72
  %51 = load i32, i32* %50                                                         ; inst 73
  store i32 %51, i32* %49                                                          ; inst 74
  %52 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 75
  %53 = getelementptr [10 x i32], [10 x i32]* %52, i32 0, i64 3                    ; inst 76
  %54 = call i32 @_9YlBKTdVw0B_analyze_sorted_array(%SortingAnalyzer* %0)          ; inst 77
  store i32 %54, i32* %53                                                          ; inst 78
  %55 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 79
  %56 = getelementptr [10 x i32], [10 x i32]* %55, i32 0, i64 3                    ; inst 80
  %57 = load i32, i32* %56                                                         ; inst 81
  call void @printlnInt(i32 %57)                                                   ; inst 82
  call void @_9YlBKTdVw0B_restore_from_temp(%SortingAnalyzer* %0)                  ; inst 83
  call void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %0)                   ; inst 84
  call void @_9YlBKTdVw0B_bucket_sort(%SortingAnalyzer* %0)                        ; inst 85
  %58 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 14        ; inst 86
  %59 = getelementptr [10 x i32], [10 x i32]* %58, i32 0, i64 4                    ; inst 87
  %60 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 5         ; inst 88
  %61 = load i32, i32* %60                                                         ; inst 89
  %62 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 3         ; inst 90
  %63 = load i32, i32* %62                                                         ; inst 91
  %64 = add i32 %61, %63                                                           ; inst 92
  store i32 %64, i32* %59                                                          ; inst 93
  %65 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 94
  %66 = getelementptr [10 x i32], [10 x i32]* %65, i32 0, i64 4                    ; inst 95
  %67 = call i32 @_9YlBKTdVw0B_analyze_sorted_array(%SortingAnalyzer* %0)          ; inst 96
  store i32 %67, i32* %66                                                          ; inst 97
  %68 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 98
  %69 = getelementptr [10 x i32], [10 x i32]* %68, i32 0, i64 4                    ; inst 99
  %70 = load i32, i32* %69                                                         ; inst 100
  call void @printlnInt(i32 %70)                                                   ; inst 101
  %71 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 102
  %72 = getelementptr [10 x i32], [10 x i32]* %71, i32 0, i64 0                    ; inst 103
  %73 = load i32, i32* %72                                                         ; inst 104
  br label %_1.while.cond.0                                                        ; inst 105
_1.while.cond.0:
  %74 = phi i32 [%73, %_0.entry.0], [%87, %_5.if.exit.0]                           ; inst 106
  %75 = phi i32 [1, %_0.entry.0], [%89, %_5.if.exit.0]                             ; inst 107
  %76 = phi i32 [0, %_0.entry.0], [%88, %_5.if.exit.0]                             ; inst 108
  %77 = icmp slt i32 %75, 5                                                        ; inst 109
  br i1 %77, label %_2.while.body.0, label %_6.while.exit.0                        ; inst 110
_2.while.body.0:
  %78 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 111
  %79 = sext i32 %75 to i64                                                        ; inst 112
  %80 = getelementptr [10 x i32], [10 x i32]* %78, i32 0, i64 %79                  ; inst 113
  %81 = load i32, i32* %80                                                         ; inst 114
  %82 = icmp sgt i32 %81, %74                                                      ; inst 115
  br i1 %82, label %_3.if.then.0, label %_4.if.else.0                              ; inst 116
_3.if.then.0:
  %83 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %0, i32 0, i32 15        ; inst 117
  %84 = sext i32 %75 to i64                                                        ; inst 118
  %85 = getelementptr [10 x i32], [10 x i32]* %83, i32 0, i64 %84                  ; inst 119
  %86 = load i32, i32* %85                                                         ; inst 120
  br label %_5.if.exit.0                                                           ; inst 121
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 122
_5.if.exit.0:
  %87 = phi i32 [%86, %_3.if.then.0], [%74, %_4.if.else.0]                         ; inst 123
  %88 = phi i32 [%75, %_3.if.then.0], [%76, %_4.if.else.0]                         ; inst 124
  %89 = add i32 %75, 1                                                             ; inst 125
  br label %_1.while.cond.0                                                        ; inst 126
_6.while.exit.0:
  call void @printlnInt(i32 %76)                                                   ; inst 127
  call void @printlnInt(i32 %74)                                                   ; inst 128
  ret void                                                                         ; inst 129
}

define void @_cVm90zWktlg_new(%DataProcessor* sret(%DataProcessor) %0) {
_0.entry.0:
  %1 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0              ; inst 1
  %2 = getelementptr [1000 x i32], [1000 x i32]* %1, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 1000                                                       ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 1              ; inst 11
  %8 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i32 0                  ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 14
  %10 = icmp slt i32 %9, 1000                                                      ; inst 15
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 17
  store i32 0, i32* %11                                                            ; inst 18
  %12 = add i32 %9, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %13 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 2             ; inst 21
  %14 = getelementptr [2000 x i32], [2000 x i32]* %13, i32 0, i32 0                ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 24
  %16 = icmp slt i32 %15, 2000                                                     ; inst 25
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 27
  store i32 0, i32* %17                                                            ; inst 28
  %18 = add i32 %15, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  %19 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 31
  store i32 0, i32* %19                                                            ; inst 32
  %20 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 4             ; inst 33
  %21 = alloca [100 x i32]                                                         ; inst 34
  %22 = getelementptr [100 x i32], [100 x i32]* %21, i32 0, i32 0                  ; inst 35
  br label %_10.array.cond.3                                                       ; inst 36
_10.array.cond.3:
  %23 = phi i32 [0, %_9.array.exit.2], [%26, %_11.array.body.3]                    ; inst 37
  %24 = icmp slt i32 %23, 100                                                      ; inst 38
  br i1 %24, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 39
_11.array.body.3:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 40
  store i32 0, i32* %25                                                            ; inst 41
  %26 = add i32 %23, 1                                                             ; inst 42
  br label %_10.array.cond.3                                                       ; inst 43
_12.array.exit.3:
  %27 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %20, i32 0, i32 0  ; inst 44
  br label %_13.array.cond.4                                                       ; inst 45
_13.array.cond.4:
  %28 = phi i32 [0, %_12.array.exit.3], [%31, %_14.array.body.4]                   ; inst 46
  %29 = icmp slt i32 %28, 100                                                      ; inst 47
  br i1 %29, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 48
_14.array.body.4:
  %30 = getelementptr [100 x i32], [100 x i32]* %27, i32 %28                       ; inst 49
  call void @memcpy([100 x i32]* %30, [100 x i32]* %21, i64 400)                   ; inst 50
  %31 = add i32 %28, 1                                                             ; inst 51
  br label %_13.array.cond.4                                                       ; inst 52
_15.array.exit.4:
  %32 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5             ; inst 53
  store i32 0, i32* %32                                                            ; inst 54
  %33 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 6             ; inst 55
  %34 = getelementptr [10000 x i32], [10000 x i32]* %33, i32 0, i32 0              ; inst 56
  br label %_16.array.cond.5                                                       ; inst 57
_16.array.cond.5:
  %35 = phi i32 [0, %_15.array.exit.4], [%38, %_17.array.body.5]                   ; inst 58
  %36 = icmp slt i32 %35, 10000                                                    ; inst 59
  br i1 %36, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 60
_17.array.body.5:
  %37 = getelementptr i32, i32* %34, i32 %35                                       ; inst 61
  store i32 0, i32* %37                                                            ; inst 62
  %38 = add i32 %35, 1                                                             ; inst 63
  br label %_16.array.cond.5                                                       ; inst 64
_18.array.exit.5:
  %39 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 65
  %40 = getelementptr [20 x i32], [20 x i32]* %39, i32 0, i32 0                    ; inst 66
  br label %_19.array.cond.6                                                       ; inst 67
_19.array.cond.6:
  %41 = phi i32 [0, %_18.array.exit.5], [%44, %_20.array.body.6]                   ; inst 68
  %42 = icmp slt i32 %41, 20                                                       ; inst 69
  br i1 %42, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 70
_20.array.body.6:
  %43 = getelementptr i32, i32* %40, i32 %41                                       ; inst 71
  store i32 0, i32* %43                                                            ; inst 72
  %44 = add i32 %41, 1                                                             ; inst 73
  br label %_19.array.cond.6                                                       ; inst 74
_21.array.exit.6:
  ret void                                                                         ; inst 75
}

define void @_cVm90zWktlg_perform_advanced_operations(%DataProcessor* %0, %SortingAnalyzer* %1) {
_0.entry.0:
  %2 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3              ; inst 1
  %3 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 2          ; inst 2
  %4 = load i32, i32* %3                                                           ; inst 3
  store i32 %4, i32* %2                                                            ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%16, %_2.while.body.0]                           ; inst 6
  %6 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3              ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp slt i32 %5, %7                                                         ; inst 9
  br i1 %8, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 10
_2.while.body.0:
  %9 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0              ; inst 11
  %10 = sext i32 %5 to i64                                                         ; inst 12
  %11 = getelementptr [1000 x i32], [1000 x i32]* %9, i32 0, i64 %10               ; inst 13
  %12 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 0         ; inst 14
  %13 = sext i32 %5 to i64                                                         ; inst 15
  %14 = getelementptr [2000 x i32], [2000 x i32]* %12, i32 0, i64 %13              ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  store i32 %15, i32* %11                                                          ; inst 18
  %16 = add i32 %5, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_3.while.exit.0:
  call void @_cVm90zWktlg_generate_fibonacci_transform(%DataProcessor* %0)         ; inst 21
  call void @_cVm90zWktlg_apply_mathematical_operations(%DataProcessor* %0)        ; inst 22
  call void @_cVm90zWktlg_perform_statistical_analysis(%DataProcessor* %0)         ; inst 23
  call void @_cVm90zWktlg_execute_matrix_operations(%DataProcessor* %0)            ; inst 24
  call void @_cVm90zWktlg_output_analysis_results(%DataProcessor* %0)              ; inst 25
  ret void                                                                         ; inst 26
}

define void @_cVm90zWktlg_generate_fibonacci_transform(%DataProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%20, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [1, %_0.entry.0], [%18, %_5.if.exit.0]                              ; inst 3
  %3 = phi i32 [1, %_0.entry.0], [%19, %_5.if.exit.0]                              ; inst 4
  %4 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3              ; inst 5
  %5 = load i32, i32* %4                                                           ; inst 6
  %6 = icmp slt i32 %1, %5                                                         ; inst 7
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 8
_2.while.body.0:
  %7 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 1              ; inst 9
  %8 = sext i32 %1 to i64                                                          ; inst 10
  %9 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i64 %8                 ; inst 11
  %10 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0             ; inst 12
  %11 = sext i32 %1 to i64                                                         ; inst 13
  %12 = getelementptr [1000 x i32], [1000 x i32]* %10, i32 0, i64 %11              ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = mul i32 %13, %2                                                            ; inst 16
  %15 = srem i32 %14, 1000000                                                      ; inst 17
  store i32 %15, i32* %9                                                           ; inst 18
  %16 = add i32 %3, %2                                                             ; inst 19
  %17 = icmp sgt i32 %16, 1000000                                                  ; inst 20
  br i1 %17, label %_3.if.then.0, label %_4.if.else.0                              ; inst 21
_3.if.then.0:
  br label %_5.if.exit.0                                                           ; inst 22
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 23
_5.if.exit.0:
  %18 = phi i32 [1, %_3.if.then.0], [%16, %_4.if.else.0]                           ; inst 24
  %19 = phi i32 [1, %_3.if.then.0], [%2, %_4.if.else.0]                            ; inst 25
  %20 = add i32 %1, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_6.while.exit.0:
  ret void                                                                         ; inst 28
}

define void @_cVm90zWktlg_apply_mathematical_operations(%DataProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%30, %_2.while.body.0]                           ; inst 2
  %2 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3              ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0              ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [1000 x i32], [1000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 1              ; inst 11
  %10 = sext i32 %1 to i64                                                         ; inst 12
  %11 = getelementptr [1000 x i32], [1000 x i32]* %9, i32 0, i64 %10               ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 2             ; inst 15
  %14 = sext i32 %1 to i64                                                         ; inst 16
  %15 = getelementptr [2000 x i32], [2000 x i32]* %13, i32 0, i64 %14              ; inst 17
  %16 = mul i32 %8, %8                                                             ; inst 18
  %17 = add i32 %16, %12                                                           ; inst 19
  %18 = srem i32 %17, 32768                                                        ; inst 20
  store i32 %18, i32* %15                                                          ; inst 21
  %19 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 2             ; inst 22
  %20 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 23
  %21 = load i32, i32* %20                                                         ; inst 24
  %22 = add i32 %21, %1                                                            ; inst 25
  %23 = sext i32 %22 to i64                                                        ; inst 26
  %24 = getelementptr [2000 x i32], [2000 x i32]* %19, i32 0, i64 %23              ; inst 27
  %25 = srem i32 %12, 32768                                                        ; inst 28
  %26 = srem i32 %12, 32768                                                        ; inst 29
  %27 = mul i32 %25, %26                                                           ; inst 30
  %28 = add i32 %8, %27                                                            ; inst 31
  %29 = srem i32 %28, 32768                                                        ; inst 32
  store i32 %29, i32* %24                                                          ; inst 33
  %30 = add i32 %1, 1                                                              ; inst 34
  br label %_1.while.cond.0                                                        ; inst 35
_3.while.exit.0:
  ret void                                                                         ; inst 36
}

define void @_cVm90zWktlg_perform_statistical_analysis(%DataProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 10000                                                      ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 6              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [10000 x i32], [10000 x i32]* %3, i32 0, i64 %4               ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %1, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  %7 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0              ; inst 11
  %8 = getelementptr [1000 x i32], [1000 x i32]* %7, i32 0, i64 0                  ; inst 12
  %9 = load i32, i32* %8                                                           ; inst 13
  %10 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0             ; inst 14
  %11 = getelementptr [1000 x i32], [1000 x i32]* %10, i32 0, i64 0                ; inst 15
  %12 = load i32, i32* %11                                                         ; inst 16
  br label %_4.while.cond.1                                                        ; inst 17
_4.while.cond.1:
  %13 = phi i32 [%12, %_3.while.exit.0], [%31, %_17.if.exit.2]                     ; inst 18
  %14 = phi i32 [0, %_3.while.exit.0], [%40, %_17.if.exit.2]                       ; inst 19
  %15 = phi i32 [0, %_3.while.exit.0], [%25, %_17.if.exit.2]                       ; inst 20
  %16 = phi i32 [0, %_3.while.exit.0], [%27, %_17.if.exit.2]                       ; inst 21
  %17 = phi i32 [%9, %_3.while.exit.0], [%29, %_17.if.exit.2]                      ; inst 22
  %18 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = icmp slt i32 %14, %19                                                      ; inst 25
  br i1 %20, label %_5.while.body.1, label %_18.while.exit.1                       ; inst 26
_5.while.body.1:
  %21 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0             ; inst 27
  %22 = sext i32 %14 to i64                                                        ; inst 28
  %23 = getelementptr [1000 x i32], [1000 x i32]* %21, i32 0, i64 %22              ; inst 29
  %24 = load i32, i32* %23                                                         ; inst 30
  %25 = add i32 %15, %24                                                           ; inst 31
  %26 = mul i32 %24, %24                                                           ; inst 32
  %27 = add i32 %16, %26                                                           ; inst 33
  %28 = icmp slt i32 %24, %17                                                      ; inst 34
  br i1 %28, label %_6.if.then.0, label %_7.if.else.0                              ; inst 35
_6.if.then.0:
  br label %_8.if.exit.0                                                           ; inst 36
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 37
_8.if.exit.0:
  %29 = phi i32 [%24, %_6.if.then.0], [%17, %_7.if.else.0]                         ; inst 38
  %30 = icmp sgt i32 %24, %13                                                      ; inst 39
  br i1 %30, label %_9.if.then.1, label %_10.if.else.1                             ; inst 40
_9.if.then.1:
  br label %_11.if.exit.1                                                          ; inst 41
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 42
_11.if.exit.1:
  %31 = phi i32 [%24, %_9.if.then.1], [%13, %_10.if.else.1]                        ; inst 43
  %32 = icmp sge i32 %24, 0                                                        ; inst 44
  br i1 %32, label %_12.lazy.then.0, label %_13.lazy.else.0                        ; inst 45
_12.lazy.then.0:
  %33 = icmp slt i32 %24, 10000                                                    ; inst 46
  br label %_14.lazy.exit.0                                                        ; inst 47
_13.lazy.else.0:
  br label %_14.lazy.exit.0                                                        ; inst 48
_14.lazy.exit.0:
  %34 = phi i1 [%33, %_12.lazy.then.0], [0, %_13.lazy.else.0]                      ; inst 49
  br i1 %34, label %_15.if.then.2, label %_16.if.else.2                            ; inst 50
_15.if.then.2:
  %35 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 6             ; inst 51
  %36 = sext i32 %24 to i64                                                        ; inst 52
  %37 = getelementptr [10000 x i32], [10000 x i32]* %35, i32 0, i64 %36            ; inst 53
  %38 = load i32, i32* %37                                                         ; inst 54
  %39 = add i32 %38, 1                                                             ; inst 55
  store i32 %39, i32* %37                                                          ; inst 56
  br label %_17.if.exit.2                                                          ; inst 57
_16.if.else.2:
  br label %_17.if.exit.2                                                          ; inst 58
_17.if.exit.2:
  %40 = add i32 %14, 1                                                             ; inst 59
  br label %_4.while.cond.1                                                        ; inst 60
_18.while.exit.1:
  %41 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 61
  %42 = getelementptr [20 x i32], [20 x i32]* %41, i32 0, i64 0                    ; inst 62
  store i32 %15, i32* %42                                                          ; inst 63
  %43 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 64
  %44 = getelementptr [20 x i32], [20 x i32]* %43, i32 0, i64 1                    ; inst 65
  store i32 %16, i32* %44                                                          ; inst 66
  %45 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 67
  %46 = getelementptr [20 x i32], [20 x i32]* %45, i32 0, i64 2                    ; inst 68
  store i32 %17, i32* %46                                                          ; inst 69
  %47 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 70
  %48 = getelementptr [20 x i32], [20 x i32]* %47, i32 0, i64 3                    ; inst 71
  store i32 %13, i32* %48                                                          ; inst 72
  %49 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 73
  %50 = getelementptr [20 x i32], [20 x i32]* %49, i32 0, i64 4                    ; inst 74
  %51 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 75
  %52 = load i32, i32* %51                                                         ; inst 76
  %53 = sdiv i32 %15, %52                                                          ; inst 77
  store i32 %53, i32* %50                                                          ; inst 78
  %54 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 79
  %55 = getelementptr [20 x i32], [20 x i32]* %54, i32 0, i64 5                    ; inst 80
  %56 = sub i32 %13, %17                                                           ; inst 81
  store i32 %56, i32* %55                                                          ; inst 82
  br label %_19.while.cond.2                                                       ; inst 83
_19.while.cond.2:
  %57 = phi i32 [0, %_18.while.exit.1], [%72, %_23.if.exit.3]                      ; inst 84
  %58 = phi i32 [%17, %_18.while.exit.1], [%70, %_23.if.exit.3]                    ; inst 85
  %59 = phi i32 [0, %_18.while.exit.1], [%71, %_23.if.exit.3]                      ; inst 86
  %60 = icmp slt i32 %57, 10000                                                    ; inst 87
  br i1 %60, label %_20.while.body.2, label %_24.while.exit.2                      ; inst 88
_20.while.body.2:
  %61 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 6             ; inst 89
  %62 = sext i32 %57 to i64                                                        ; inst 90
  %63 = getelementptr [10000 x i32], [10000 x i32]* %61, i32 0, i64 %62            ; inst 91
  %64 = load i32, i32* %63                                                         ; inst 92
  %65 = icmp sgt i32 %64, %59                                                      ; inst 93
  br i1 %65, label %_21.if.then.3, label %_22.if.else.3                            ; inst 94
_21.if.then.3:
  %66 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 6             ; inst 95
  %67 = sext i32 %57 to i64                                                        ; inst 96
  %68 = getelementptr [10000 x i32], [10000 x i32]* %66, i32 0, i64 %67            ; inst 97
  %69 = load i32, i32* %68                                                         ; inst 98
  br label %_23.if.exit.3                                                          ; inst 99
_22.if.else.3:
  br label %_23.if.exit.3                                                          ; inst 100
_23.if.exit.3:
  %70 = phi i32 [%57, %_21.if.then.3], [%58, %_22.if.else.3]                       ; inst 101
  %71 = phi i32 [%69, %_21.if.then.3], [%59, %_22.if.else.3]                       ; inst 102
  %72 = add i32 %57, 1                                                             ; inst 103
  br label %_19.while.cond.2                                                       ; inst 104
_24.while.exit.2:
  %73 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 105
  %74 = getelementptr [20 x i32], [20 x i32]* %73, i32 0, i64 6                    ; inst 106
  store i32 %58, i32* %74                                                          ; inst 107
  %75 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 108
  %76 = getelementptr [20 x i32], [20 x i32]* %75, i32 0, i64 7                    ; inst 109
  store i32 %59, i32* %76                                                          ; inst 110
  %77 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 111
  %78 = getelementptr [20 x i32], [20 x i32]* %77, i32 0, i64 8                    ; inst 112
  %79 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0             ; inst 113
  %80 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 114
  %81 = load i32, i32* %80                                                         ; inst 115
  %82 = sdiv i32 %81, 2                                                            ; inst 116
  %83 = sext i32 %82 to i64                                                        ; inst 117
  %84 = getelementptr [1000 x i32], [1000 x i32]* %79, i32 0, i64 %83              ; inst 118
  %85 = load i32, i32* %84                                                         ; inst 119
  store i32 %85, i32* %78                                                          ; inst 120
  ret void                                                                         ; inst 121
}

define void @_cVm90zWktlg_execute_matrix_operations(%DataProcessor* %0) {
_0.entry.0:
  %1 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5              ; inst 1
  %2 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3              ; inst 2
  %3 = load i32, i32* %2                                                           ; inst 3
  %4 = icmp slt i32 %3, 100                                                        ; inst 4
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  %5 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3              ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  br label %_3.if.exit.0                                                           ; inst 8
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 9
_3.if.exit.0:
  %7 = phi i32 [%6, %_1.if.then.0], [100, %_2.if.else.0]                           ; inst 10
  store i32 %7, i32* %1                                                            ; inst 11
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %8 = phi i32 [0, %_3.if.exit.0], [%53, %_14.while.exit.1]                        ; inst 13
  %9 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5              ; inst 14
  %10 = load i32, i32* %9                                                          ; inst 15
  %11 = icmp slt i32 %8, %10                                                       ; inst 16
  br i1 %11, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 17
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 18
_6.while.cond.1:
  %12 = phi i32 [0, %_5.while.body.0], [%52, %_13.if.exit.1]                       ; inst 19
  %13 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5             ; inst 20
  %14 = load i32, i32* %13                                                         ; inst 21
  %15 = icmp slt i32 %12, %14                                                      ; inst 22
  br i1 %15, label %_7.while.body.1, label %_14.while.exit.1                       ; inst 23
_7.while.body.1:
  %16 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 24
  %17 = load i32, i32* %16                                                         ; inst 25
  %18 = mul i32 %8, %17                                                            ; inst 26
  %19 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5             ; inst 27
  %20 = load i32, i32* %19                                                         ; inst 28
  %21 = sdiv i32 %18, %20                                                          ; inst 29
  %22 = sext i32 %21 to i64                                                        ; inst 30
  %23 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 31
  %24 = load i32, i32* %23                                                         ; inst 32
  %25 = mul i32 %12, %24                                                           ; inst 33
  %26 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5             ; inst 34
  %27 = load i32, i32* %26                                                         ; inst 35
  %28 = sdiv i32 %25, %27                                                          ; inst 36
  %29 = sext i32 %28 to i64                                                        ; inst 37
  %30 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 38
  %31 = load i32, i32* %30                                                         ; inst 39
  %32 = sext i32 %31 to i64                                                        ; inst 40
  %33 = icmp ult i64 %22, %32                                                      ; inst 41
  br i1 %33, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 42
_8.lazy.then.0:
  %34 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 43
  %35 = load i32, i32* %34                                                         ; inst 44
  %36 = sext i32 %35 to i64                                                        ; inst 45
  %37 = icmp ult i64 %29, %36                                                      ; inst 46
  br label %_10.lazy.exit.0                                                        ; inst 47
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 48
_10.lazy.exit.0:
  %38 = phi i1 [%37, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 49
  br i1 %38, label %_11.if.then.1, label %_12.if.else.1                            ; inst 50
_11.if.then.1:
  %39 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 4             ; inst 51
  %40 = sext i32 %8 to i64                                                         ; inst 52
  %41 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %39, i32 0, i64 %40 ; inst 53
  %42 = sext i32 %12 to i64                                                        ; inst 54
  %43 = getelementptr [100 x i32], [100 x i32]* %41, i32 0, i64 %42                ; inst 55
  %44 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 0             ; inst 56
  %45 = getelementptr [1000 x i32], [1000 x i32]* %44, i32 0, i64 %22              ; inst 57
  %46 = load i32, i32* %45                                                         ; inst 58
  %47 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 1             ; inst 59
  %48 = getelementptr [1000 x i32], [1000 x i32]* %47, i32 0, i64 %29              ; inst 60
  %49 = load i32, i32* %48                                                         ; inst 61
  %50 = add i32 %46, %49                                                           ; inst 62
  %51 = srem i32 %50, 1000                                                         ; inst 63
  store i32 %51, i32* %43                                                          ; inst 64
  br label %_13.if.exit.1                                                          ; inst 65
_12.if.else.1:
  br label %_13.if.exit.1                                                          ; inst 66
_13.if.exit.1:
  %52 = add i32 %12, 1                                                             ; inst 67
  br label %_6.while.cond.1                                                        ; inst 68
_14.while.exit.1:
  %53 = add i32 %8, 1                                                              ; inst 69
  br label %_4.while.cond.0                                                        ; inst 70
_15.while.exit.0:
  br label %_16.while.cond.2                                                       ; inst 71
_16.while.cond.2:
  %54 = phi i32 [0, %_15.while.exit.0], [%61, %_23.while.exit.3]                   ; inst 72
  %55 = phi i32 [0, %_15.while.exit.0], [%62, %_23.while.exit.3]                   ; inst 73
  %56 = phi i32 [0, %_15.while.exit.0], [%83, %_23.while.exit.3]                   ; inst 74
  %57 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5             ; inst 75
  %58 = load i32, i32* %57                                                         ; inst 76
  %59 = icmp slt i32 %56, %58                                                      ; inst 77
  br i1 %59, label %_17.while.body.2, label %_24.while.exit.2                      ; inst 78
_17.while.body.2:
  br label %_18.while.cond.3                                                       ; inst 79
_18.while.cond.3:
  %60 = phi i32 [0, %_17.while.body.2], [%82, %_22.if.exit.2]                      ; inst 80
  %61 = phi i32 [%54, %_17.while.body.2], [%72, %_22.if.exit.2]                    ; inst 81
  %62 = phi i32 [%55, %_17.while.body.2], [%81, %_22.if.exit.2]                    ; inst 82
  %63 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 5             ; inst 83
  %64 = load i32, i32* %63                                                         ; inst 84
  %65 = icmp slt i32 %60, %64                                                      ; inst 85
  br i1 %65, label %_19.while.body.3, label %_23.while.exit.3                      ; inst 86
_19.while.body.3:
  %66 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 4             ; inst 87
  %67 = sext i32 %56 to i64                                                        ; inst 88
  %68 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %66, i32 0, i64 %67 ; inst 89
  %69 = sext i32 %60 to i64                                                        ; inst 90
  %70 = getelementptr [100 x i32], [100 x i32]* %68, i32 0, i64 %69                ; inst 91
  %71 = load i32, i32* %70                                                         ; inst 92
  %72 = add i32 %61, %71                                                           ; inst 93
  %73 = icmp eq i32 %56, %60                                                       ; inst 94
  br i1 %73, label %_20.if.then.2, label %_21.if.else.2                            ; inst 95
_20.if.then.2:
  %74 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 4             ; inst 96
  %75 = sext i32 %56 to i64                                                        ; inst 97
  %76 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %74, i32 0, i64 %75 ; inst 98
  %77 = sext i32 %60 to i64                                                        ; inst 99
  %78 = getelementptr [100 x i32], [100 x i32]* %76, i32 0, i64 %77                ; inst 100
  %79 = load i32, i32* %78                                                         ; inst 101
  %80 = add i32 %62, %79                                                           ; inst 102
  br label %_22.if.exit.2                                                          ; inst 103
_21.if.else.2:
  br label %_22.if.exit.2                                                          ; inst 104
_22.if.exit.2:
  %81 = phi i32 [%80, %_20.if.then.2], [%62, %_21.if.else.2]                       ; inst 105
  %82 = add i32 %60, 1                                                             ; inst 106
  br label %_18.while.cond.3                                                       ; inst 107
_23.while.exit.3:
  %83 = add i32 %56, 1                                                             ; inst 108
  br label %_16.while.cond.2                                                       ; inst 109
_24.while.exit.2:
  %84 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 110
  %85 = getelementptr [20 x i32], [20 x i32]* %84, i32 0, i64 9                    ; inst 111
  store i32 %54, i32* %85                                                          ; inst 112
  %86 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 113
  %87 = getelementptr [20 x i32], [20 x i32]* %86, i32 0, i64 10                   ; inst 114
  store i32 %55, i32* %87                                                          ; inst 115
  ret void                                                                         ; inst 116
}

define void @_cVm90zWktlg_output_analysis_results(%DataProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 11                                                         ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [20 x i32], [20 x i32]* %3, i32 0, i64 %4                     ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  call void @printlnInt(i32 %6)                                                    ; inst 9
  %7 = add i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  %8 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7              ; inst 12
  %9 = getelementptr [20 x i32], [20 x i32]* %8, i32 0, i64 0                      ; inst 13
  %10 = load i32, i32* %9                                                          ; inst 14
  %11 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 15
  %12 = getelementptr [20 x i32], [20 x i32]* %11, i32 0, i64 9                    ; inst 16
  %13 = load i32, i32* %12                                                         ; inst 17
  %14 = add i32 %10, %13                                                           ; inst 18
  %15 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 3             ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = add i32 %16, 1                                                             ; inst 21
  %18 = sdiv i32 %14, %17                                                          ; inst 22
  %19 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 23
  %20 = getelementptr [20 x i32], [20 x i32]* %19, i32 0, i64 10                   ; inst 24
  %21 = load i32, i32* %20                                                         ; inst 25
  %22 = getelementptr %DataProcessor, %DataProcessor* %0, i32 0, i32 7             ; inst 26
  %23 = getelementptr [20 x i32], [20 x i32]* %22, i32 0, i64 4                    ; inst 27
  %24 = load i32, i32* %23                                                         ; inst 28
  %25 = mul i32 %21, %24                                                           ; inst 29
  %26 = sdiv i32 %25, 1000                                                         ; inst 30
  %27 = add i32 %18, %26                                                           ; inst 31
  call void @printlnInt(i32 %18)                                                   ; inst 32
  call void @printlnInt(i32 %26)                                                   ; inst 33
  call void @printlnInt(i32 %27)                                                   ; inst 34
  ret void                                                                         ; inst 35
}

define void @main() {
_0.entry.0:
  %0 = call i32 @getInt()                                                          ; inst 1
  %1 = alloca %SortingAnalyzer                                                     ; inst 2
  call void @_9YlBKTdVw0B_new(%SortingAnalyzer* %1)                                ; inst 3
  call void @_9YlBKTdVw0B_initialize_data(%SortingAnalyzer* %1, i32 %0)            ; inst 4
  call void @_9YlBKTdVw0B_run_comprehensive_tests(%SortingAnalyzer* %1)            ; inst 5
  %2 = alloca %DataProcessor                                                       ; inst 6
  call void @_cVm90zWktlg_new(%DataProcessor* %2)                                  ; inst 7
  call void @_cVm90zWktlg_perform_advanced_operations(%DataProcessor* %2, %SortingAnalyzer* %1) ; inst 8
  %3 = call i32 @getInt()                                                          ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%33, %_5.while.exit.1]                           ; inst 11
  %5 = phi i32 [0, %_0.entry.0], [%32, %_5.while.exit.1]                           ; inst 12
  %6 = icmp slt i32 %4, %3                                                         ; inst 13
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 14
_2.while.body.0:
  %7 = mul i32 %4, 17                                                              ; inst 15
  %8 = add i32 %7, 23                                                              ; inst 16
  %9 = srem i32 %8, 100                                                            ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_3.while.cond.1:
  %10 = phi i32 [0, %_2.while.body.0], [%23, %_4.while.body.1]                     ; inst 19
  %11 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 2         ; inst 20
  %12 = load i32, i32* %11                                                         ; inst 21
  %13 = icmp slt i32 %10, %12                                                      ; inst 22
  br i1 %13, label %_4.while.body.1, label %_5.while.exit.1                        ; inst 23
_4.while.body.1:
  %14 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 0         ; inst 24
  %15 = sext i32 %10 to i64                                                        ; inst 25
  %16 = getelementptr [2000 x i32], [2000 x i32]* %14, i32 0, i64 %15              ; inst 26
  %17 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 1         ; inst 27
  %18 = sext i32 %10 to i64                                                        ; inst 28
  %19 = getelementptr [2000 x i32], [2000 x i32]* %17, i32 0, i64 %18              ; inst 29
  %20 = load i32, i32* %19                                                         ; inst 30
  %21 = add i32 %20, %9                                                            ; inst 31
  %22 = srem i32 %21, 10000                                                        ; inst 32
  store i32 %22, i32* %16                                                          ; inst 33
  %23 = add i32 %10, 1                                                             ; inst 34
  br label %_3.while.cond.1                                                        ; inst 35
_5.while.exit.1:
  call void @_9YlBKTdVw0B_reset_statistics(%SortingAnalyzer* %1)                   ; inst 36
  %24 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 2         ; inst 37
  %25 = load i32, i32* %24                                                         ; inst 38
  %26 = sub i32 %25, 1                                                             ; inst 39
  call void @_9YlBKTdVw0B_quick_sort_3way(%SortingAnalyzer* %1, i32 0, i32 %26)    ; inst 40
  %27 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 3         ; inst 41
  %28 = load i32, i32* %27                                                         ; inst 42
  %29 = getelementptr %SortingAnalyzer, %SortingAnalyzer* %1, i32 0, i32 4         ; inst 43
  %30 = load i32, i32* %29                                                         ; inst 44
  %31 = add i32 %28, %30                                                           ; inst 45
  %32 = add i32 %5, %31                                                            ; inst 46
  %33 = add i32 %4, 1                                                              ; inst 47
  br label %_1.while.cond.0                                                        ; inst 48
_6.while.exit.0:
  call void @printlnInt(i32 %5)                                                    ; inst 49
  %34 = getelementptr %DataProcessor, %DataProcessor* %2, i32 0, i32 7             ; inst 50
  %35 = getelementptr [20 x i32], [20 x i32]* %34, i32 0, i64 4                    ; inst 51
  %36 = load i32, i32* %35                                                         ; inst 52
  %37 = mul i32 %5, %36                                                            ; inst 53
  %38 = add i32 %3, 1                                                              ; inst 54
  %39 = sdiv i32 %37, %38                                                          ; inst 55
  call void @printlnInt(i32 %39)                                                   ; inst 56
  call void @exit(i32 0)                                                           ; inst 57
  ret void                                                                         ; inst 58
}

