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


%Pools = type { [200 x [5 x i32]], [200 x [6 x i32]], [200 x i1], [200 x i32], i32, i32 }

define i32 @create_node(%Pools* %0, i1 %1) {
_0.entry.0:
  %2 = getelementptr %Pools, %Pools* %0, i32 0, i32 4                              ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = getelementptr %Pools, %Pools* %0, i32 0, i32 4                              ; inst 3
  %5 = getelementptr %Pools, %Pools* %0, i32 0, i32 4                              ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  %7 = add i32 %6, 1                                                               ; inst 6
  store i32 %7, i32* %4                                                            ; inst 7
  %8 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                              ; inst 8
  %9 = sext i32 %3 to i64                                                          ; inst 9
  %10 = getelementptr [200 x i1], [200 x i1]* %8, i32 0, i64 %9                    ; inst 10
  store i1 %1, i1* %10                                                             ; inst 11
  %11 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 12
  %12 = sext i32 %3 to i64                                                         ; inst 13
  %13 = getelementptr [200 x i32], [200 x i32]* %11, i32 0, i64 %12                ; inst 14
  store i32 0, i32* %13                                                            ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_1.while.cond.0:
  %14 = phi i32 [0, %_0.entry.0], [%21, %_2.while.body.0]                          ; inst 17
  %15 = icmp slt i32 %14, 4                                                        ; inst 18
  br i1 %15, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 19
_2.while.body.0:
  %16 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 20
  %17 = sext i32 %3 to i64                                                         ; inst 21
  %18 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %16, i32 0, i64 %17    ; inst 22
  %19 = sext i32 %14 to i64                                                        ; inst 23
  %20 = getelementptr [5 x i32], [5 x i32]* %18, i32 0, i64 %19                    ; inst 24
  store i32 0, i32* %20                                                            ; inst 25
  %21 = add i32 %14, 1                                                             ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 28
_4.while.cond.1:
  %22 = phi i32 [0, %_3.while.exit.0], [%29, %_5.while.body.1]                     ; inst 29
  %23 = icmp slt i32 %22, 5                                                        ; inst 30
  br i1 %23, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 31
_5.while.body.1:
  %24 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 32
  %25 = sext i32 %3 to i64                                                         ; inst 33
  %26 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %24, i32 0, i64 %25    ; inst 34
  %27 = sext i32 %22 to i64                                                        ; inst 35
  %28 = getelementptr [6 x i32], [6 x i32]* %26, i32 0, i64 %27                    ; inst 36
  store i32 -1, i32* %28                                                           ; inst 37
  %29 = add i32 %22, 1                                                             ; inst 38
  br label %_4.while.cond.1                                                        ; inst 39
_6.while.exit.1:
  ret i32 %3                                                                       ; inst 40
}

define void @split_child(%Pools* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                              ; inst 1
  %5 = sext i32 %3 to i64                                                          ; inst 2
  %6 = getelementptr [200 x i1], [200 x i1]* %4, i32 0, i64 %5                     ; inst 3
  %7 = load i1, i1* %6                                                             ; inst 4
  %8 = call i32 @create_node(%Pools* %0, i1 %7)                                    ; inst 5
  %9 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                              ; inst 6
  %10 = sext i32 %8 to i64                                                         ; inst 7
  %11 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i64 %10                 ; inst 8
  store i32 2, i32* %11                                                            ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_1.while.cond.0:
  %12 = phi i32 [0, %_0.entry.0], [%27, %_2.while.body.0]                          ; inst 11
  %13 = icmp slt i32 %12, 2                                                        ; inst 12
  br i1 %13, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 13
_2.while.body.0:
  %14 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 14
  %15 = sext i32 %8 to i64                                                         ; inst 15
  %16 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %14, i32 0, i64 %15    ; inst 16
  %17 = sext i32 %12 to i64                                                        ; inst 17
  %18 = getelementptr [5 x i32], [5 x i32]* %16, i32 0, i64 %17                    ; inst 18
  %19 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 19
  %20 = sext i32 %3 to i64                                                         ; inst 20
  %21 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %19, i32 0, i64 %20    ; inst 21
  %22 = add i32 %12, 2                                                             ; inst 22
  %23 = add i32 %22, 1                                                             ; inst 23
  %24 = sext i32 %23 to i64                                                        ; inst 24
  %25 = getelementptr [5 x i32], [5 x i32]* %21, i32 0, i64 %24                    ; inst 25
  %26 = load i32, i32* %25                                                         ; inst 26
  store i32 %26, i32* %18                                                          ; inst 27
  %27 = add i32 %12, 1                                                             ; inst 28
  br label %_1.while.cond.0                                                        ; inst 29
_3.while.exit.0:
  %28 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                             ; inst 30
  %29 = sext i32 %3 to i64                                                         ; inst 31
  %30 = getelementptr [200 x i1], [200 x i1]* %28, i32 0, i64 %29                  ; inst 32
  %31 = load i1, i1* %30                                                           ; inst 33
  %32 = icmp eq i1 %31, 0                                                          ; inst 34
  br i1 %32, label %_4.if.then.0, label %_8.if.else.0                              ; inst 35
_4.if.then.0:
  br label %_5.while.cond.1                                                        ; inst 36
_5.while.cond.1:
  %33 = phi i32 [0, %_4.if.then.0], [%48, %_6.while.body.1]                        ; inst 37
  %34 = icmp slt i32 %33, 3                                                        ; inst 38
  br i1 %34, label %_6.while.body.1, label %_7.while.exit.1                        ; inst 39
_6.while.body.1:
  %35 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 40
  %36 = sext i32 %8 to i64                                                         ; inst 41
  %37 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %35, i32 0, i64 %36    ; inst 42
  %38 = sext i32 %33 to i64                                                        ; inst 43
  %39 = getelementptr [6 x i32], [6 x i32]* %37, i32 0, i64 %38                    ; inst 44
  %40 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 45
  %41 = sext i32 %3 to i64                                                         ; inst 46
  %42 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %40, i32 0, i64 %41    ; inst 47
  %43 = add i32 %33, 2                                                             ; inst 48
  %44 = add i32 %43, 1                                                             ; inst 49
  %45 = sext i32 %44 to i64                                                        ; inst 50
  %46 = getelementptr [6 x i32], [6 x i32]* %42, i32 0, i64 %45                    ; inst 51
  %47 = load i32, i32* %46                                                         ; inst 52
  store i32 %47, i32* %39                                                          ; inst 53
  %48 = add i32 %33, 1                                                             ; inst 54
  br label %_5.while.cond.1                                                        ; inst 55
_7.while.exit.1:
  br label %_9.if.exit.0                                                           ; inst 56
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 57
_9.if.exit.0:
  %49 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 58
  %50 = sext i32 %3 to i64                                                         ; inst 59
  %51 = getelementptr [200 x i32], [200 x i32]* %49, i32 0, i64 %50                ; inst 60
  store i32 2, i32* %51                                                            ; inst 61
  %52 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 62
  %53 = sext i32 %1 to i64                                                         ; inst 63
  %54 = getelementptr [200 x i32], [200 x i32]* %52, i32 0, i64 %53                ; inst 64
  %55 = load i32, i32* %54                                                         ; inst 65
  br label %_10.while.cond.2                                                       ; inst 66
_10.while.cond.2:
  %56 = phi i32 [%55, %_9.if.exit.0], [%70, %_11.while.body.2]                     ; inst 67
  %57 = icmp sgt i32 %56, %2                                                       ; inst 68
  br i1 %57, label %_11.while.body.2, label %_12.while.exit.2                      ; inst 69
_11.while.body.2:
  %58 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 70
  %59 = sext i32 %1 to i64                                                         ; inst 71
  %60 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %58, i32 0, i64 %59    ; inst 72
  %61 = sext i32 %56 to i64                                                        ; inst 73
  %62 = add i64 %61, 1                                                             ; inst 74
  %63 = getelementptr [6 x i32], [6 x i32]* %60, i32 0, i64 %62                    ; inst 75
  %64 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 76
  %65 = sext i32 %1 to i64                                                         ; inst 77
  %66 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %64, i32 0, i64 %65    ; inst 78
  %67 = sext i32 %56 to i64                                                        ; inst 79
  %68 = getelementptr [6 x i32], [6 x i32]* %66, i32 0, i64 %67                    ; inst 80
  %69 = load i32, i32* %68                                                         ; inst 81
  store i32 %69, i32* %63                                                          ; inst 82
  %70 = sub i32 %56, 1                                                             ; inst 83
  br label %_10.while.cond.2                                                       ; inst 84
_12.while.exit.2:
  %71 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 85
  %72 = sext i32 %1 to i64                                                         ; inst 86
  %73 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %71, i32 0, i64 %72    ; inst 87
  %74 = sext i32 %2 to i64                                                         ; inst 88
  %75 = add i64 %74, 1                                                             ; inst 89
  %76 = getelementptr [6 x i32], [6 x i32]* %73, i32 0, i64 %75                    ; inst 90
  store i32 %8, i32* %76                                                           ; inst 91
  %77 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 92
  %78 = sext i32 %1 to i64                                                         ; inst 93
  %79 = getelementptr [200 x i32], [200 x i32]* %77, i32 0, i64 %78                ; inst 94
  %80 = load i32, i32* %79                                                         ; inst 95
  %81 = sub i32 %80, 1                                                             ; inst 96
  br label %_13.while.cond.3                                                       ; inst 97
_13.while.cond.3:
  %82 = phi i32 [%81, %_12.while.exit.2], [%96, %_14.while.body.3]                 ; inst 98
  %83 = icmp sge i32 %82, %2                                                       ; inst 99
  br i1 %83, label %_14.while.body.3, label %_15.while.exit.3                      ; inst 100
_14.while.body.3:
  %84 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 101
  %85 = sext i32 %1 to i64                                                         ; inst 102
  %86 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %84, i32 0, i64 %85    ; inst 103
  %87 = sext i32 %82 to i64                                                        ; inst 104
  %88 = add i64 %87, 1                                                             ; inst 105
  %89 = getelementptr [5 x i32], [5 x i32]* %86, i32 0, i64 %88                    ; inst 106
  %90 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 107
  %91 = sext i32 %1 to i64                                                         ; inst 108
  %92 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %90, i32 0, i64 %91    ; inst 109
  %93 = sext i32 %82 to i64                                                        ; inst 110
  %94 = getelementptr [5 x i32], [5 x i32]* %92, i32 0, i64 %93                    ; inst 111
  %95 = load i32, i32* %94                                                         ; inst 112
  store i32 %95, i32* %89                                                          ; inst 113
  %96 = sub i32 %82, 1                                                             ; inst 114
  br label %_13.while.cond.3                                                       ; inst 115
_15.while.exit.3:
  %97 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 116
  %98 = sext i32 %1 to i64                                                         ; inst 117
  %99 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %97, i32 0, i64 %98    ; inst 118
  %100 = sext i32 %2 to i64                                                        ; inst 119
  %101 = getelementptr [5 x i32], [5 x i32]* %99, i32 0, i64 %100                  ; inst 120
  %102 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                            ; inst 121
  %103 = sext i32 %3 to i64                                                        ; inst 122
  %104 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %102, i32 0, i64 %103 ; inst 123
  %105 = sext i32 2 to i64                                                         ; inst 124
  %106 = getelementptr [5 x i32], [5 x i32]* %104, i32 0, i64 %105                 ; inst 125
  %107 = load i32, i32* %106                                                       ; inst 126
  store i32 %107, i32* %101                                                        ; inst 127
  %108 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                            ; inst 128
  %109 = sext i32 %1 to i64                                                        ; inst 129
  %110 = getelementptr [200 x i32], [200 x i32]* %108, i32 0, i64 %109             ; inst 130
  %111 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                            ; inst 131
  %112 = sext i32 %1 to i64                                                        ; inst 132
  %113 = getelementptr [200 x i32], [200 x i32]* %111, i32 0, i64 %112             ; inst 133
  %114 = load i32, i32* %113                                                       ; inst 134
  %115 = add i32 %114, 1                                                           ; inst 135
  store i32 %115, i32* %110                                                        ; inst 136
  ret void                                                                         ; inst 137
}

define void @insert_non_full(%Pools* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %1, 0                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                              ; inst 5
  %5 = sext i32 %1 to i64                                                          ; inst 6
  %6 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %5                   ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = sub i32 %7, 1                                                               ; inst 9
  %9 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                              ; inst 10
  %10 = sext i32 %1 to i64                                                         ; inst 11
  %11 = getelementptr [200 x i1], [200 x i1]* %9, i32 0, i64 %10                   ; inst 12
  %12 = load i1, i1* %11                                                           ; inst 13
  br i1 %12, label %_4.if.then.1, label %_11.if.else.1                             ; inst 14
_4.if.then.1:
  br label %_5.while.cond.0                                                        ; inst 15
_5.while.cond.0:
  %13 = phi i32 [%8, %_4.if.then.1], [%34, %_9.if.exit.2]                          ; inst 16
  %14 = icmp sge i32 %13, 0                                                        ; inst 17
  br i1 %14, label %_6.while.body.0, label %_28.critical_edge.0                    ; inst 18
_6.while.body.0:
  %15 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 19
  %16 = sext i32 %1 to i64                                                         ; inst 20
  %17 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %15, i32 0, i64 %16    ; inst 21
  %18 = sext i32 %13 to i64                                                        ; inst 22
  %19 = getelementptr [5 x i32], [5 x i32]* %17, i32 0, i64 %18                    ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = icmp sle i32 %20, %2                                                       ; inst 25
  br i1 %21, label %_7.if.then.2, label %_8.if.else.2                              ; inst 26
_7.if.then.2:
  br label %_10.while.exit.0                                                       ; inst 27
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 28
_9.if.exit.2:
  %22 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 29
  %23 = sext i32 %1 to i64                                                         ; inst 30
  %24 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %22, i32 0, i64 %23    ; inst 31
  %25 = sext i32 %13 to i64                                                        ; inst 32
  %26 = add i64 %25, 1                                                             ; inst 33
  %27 = getelementptr [5 x i32], [5 x i32]* %24, i32 0, i64 %26                    ; inst 34
  %28 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 35
  %29 = sext i32 %1 to i64                                                         ; inst 36
  %30 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %28, i32 0, i64 %29    ; inst 37
  %31 = sext i32 %13 to i64                                                        ; inst 38
  %32 = getelementptr [5 x i32], [5 x i32]* %30, i32 0, i64 %31                    ; inst 39
  %33 = load i32, i32* %32                                                         ; inst 40
  store i32 %33, i32* %27                                                          ; inst 41
  %34 = sub i32 %13, 1                                                             ; inst 42
  br label %_5.while.cond.0                                                        ; inst 43
_10.while.exit.0:
  %35 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 44
  %36 = sext i32 %1 to i64                                                         ; inst 45
  %37 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %35, i32 0, i64 %36    ; inst 46
  %38 = add i32 %13, 1                                                             ; inst 47
  %39 = sext i32 %38 to i64                                                        ; inst 48
  %40 = getelementptr [5 x i32], [5 x i32]* %37, i32 0, i64 %39                    ; inst 49
  store i32 %2, i32* %40                                                           ; inst 50
  %41 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 51
  %42 = sext i32 %1 to i64                                                         ; inst 52
  %43 = getelementptr [200 x i32], [200 x i32]* %41, i32 0, i64 %42                ; inst 53
  %44 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 54
  %45 = sext i32 %1 to i64                                                         ; inst 55
  %46 = getelementptr [200 x i32], [200 x i32]* %44, i32 0, i64 %45                ; inst 56
  %47 = load i32, i32* %46                                                         ; inst 57
  %48 = add i32 %47, 1                                                             ; inst 58
  store i32 %48, i32* %43                                                          ; inst 59
  br label %_27.if.exit.1                                                          ; inst 60
_11.if.else.1:
  br label %_12.while.cond.1                                                       ; inst 61
_12.while.cond.1:
  %49 = phi i32 [%8, %_11.if.else.1], [%58, %_16.if.exit.3]                        ; inst 62
  %50 = icmp sge i32 %49, 0                                                        ; inst 63
  br i1 %50, label %_13.while.body.1, label %_29.critical_edge.1                   ; inst 64
_13.while.body.1:
  %51 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 65
  %52 = sext i32 %1 to i64                                                         ; inst 66
  %53 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %51, i32 0, i64 %52    ; inst 67
  %54 = sext i32 %49 to i64                                                        ; inst 68
  %55 = getelementptr [5 x i32], [5 x i32]* %53, i32 0, i64 %54                    ; inst 69
  %56 = load i32, i32* %55                                                         ; inst 70
  %57 = icmp sle i32 %56, %2                                                       ; inst 71
  br i1 %57, label %_14.if.then.3, label %_15.if.else.3                            ; inst 72
_14.if.then.3:
  br label %_17.while.exit.1                                                       ; inst 73
_15.if.else.3:
  br label %_16.if.exit.3                                                          ; inst 74
_16.if.exit.3:
  %58 = sub i32 %49, 1                                                             ; inst 75
  br label %_12.while.cond.1                                                       ; inst 76
_17.while.exit.1:
  %59 = add i32 %49, 1                                                             ; inst 77
  %60 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 78
  %61 = sext i32 %1 to i64                                                         ; inst 79
  %62 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %60, i32 0, i64 %61    ; inst 80
  %63 = sext i32 %59 to i64                                                        ; inst 81
  %64 = getelementptr [6 x i32], [6 x i32]* %62, i32 0, i64 %63                    ; inst 82
  %65 = load i32, i32* %64                                                         ; inst 83
  %66 = icmp sge i32 %65, 0                                                        ; inst 84
  br i1 %66, label %_18.lazy.then.0, label %_19.lazy.else.0                        ; inst 85
_18.lazy.then.0:
  %67 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 86
  %68 = sext i32 %65 to i64                                                        ; inst 87
  %69 = getelementptr [200 x i32], [200 x i32]* %67, i32 0, i64 %68                ; inst 88
  %70 = load i32, i32* %69                                                         ; inst 89
  %71 = icmp eq i32 %70, 4                                                         ; inst 90
  br label %_20.lazy.exit.0                                                        ; inst 91
_19.lazy.else.0:
  br label %_20.lazy.exit.0                                                        ; inst 92
_20.lazy.exit.0:
  %72 = phi i1 [%71, %_18.lazy.then.0], [0, %_19.lazy.else.0]                      ; inst 93
  br i1 %72, label %_21.if.then.4, label %_25.if.else.4                            ; inst 94
_21.if.then.4:
  call void @split_child(%Pools* %0, i32 %1, i32 %59, i32 %65)                     ; inst 95
  %73 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 96
  %74 = sext i32 %1 to i64                                                         ; inst 97
  %75 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %73, i32 0, i64 %74    ; inst 98
  %76 = sext i32 %59 to i64                                                        ; inst 99
  %77 = getelementptr [5 x i32], [5 x i32]* %75, i32 0, i64 %76                    ; inst 100
  %78 = load i32, i32* %77                                                         ; inst 101
  %79 = icmp sgt i32 %2, %78                                                       ; inst 102
  br i1 %79, label %_22.if.then.5, label %_23.if.else.5                            ; inst 103
_22.if.then.5:
  %80 = add i32 %59, 1                                                             ; inst 104
  br label %_24.if.exit.5                                                          ; inst 105
_23.if.else.5:
  br label %_24.if.exit.5                                                          ; inst 106
_24.if.exit.5:
  %81 = phi i32 [%80, %_22.if.then.5], [%59, %_23.if.else.5]                       ; inst 107
  br label %_26.if.exit.4                                                          ; inst 108
_25.if.else.4:
  br label %_26.if.exit.4                                                          ; inst 109
_26.if.exit.4:
  %82 = phi i32 [%81, %_24.if.exit.5], [%59, %_25.if.else.4]                       ; inst 110
  %83 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 111
  %84 = sext i32 %1 to i64                                                         ; inst 112
  %85 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %83, i32 0, i64 %84    ; inst 113
  %86 = sext i32 %82 to i64                                                        ; inst 114
  %87 = getelementptr [6 x i32], [6 x i32]* %85, i32 0, i64 %86                    ; inst 115
  %88 = load i32, i32* %87                                                         ; inst 116
  call void @insert_non_full(%Pools* %0, i32 %88, i32 %2)                          ; inst 117
  br label %_27.if.exit.1                                                          ; inst 118
_27.if.exit.1:
  ret void                                                                         ; inst 119
_28.critical_edge.0:
  br label %_10.while.exit.0                                                       ; inst 120
_29.critical_edge.1:
  br label %_17.while.exit.1                                                       ; inst 121
}

define void @insert(%Pools* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                              ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = icmp eq i32 %3, -1                                                          ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  %5 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                              ; inst 5
  %6 = call i32 @create_node(%Pools* %0, i1 1)                                     ; inst 6
  store i32 %6, i32* %5                                                            ; inst 7
  %7 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                              ; inst 8
  %8 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                              ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = sext i32 %9 to i64                                                         ; inst 11
  %11 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %7, i32 0, i64 %10     ; inst 12
  %12 = getelementptr [5 x i32], [5 x i32]* %11, i32 0, i64 0                      ; inst 13
  store i32 %1, i32* %12                                                           ; inst 14
  %13 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 15
  %14 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  %16 = sext i32 %15 to i64                                                        ; inst 18
  %17 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %16                ; inst 19
  store i32 1, i32* %17                                                            ; inst 20
  ret void                                                                         ; inst 21
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 22
_3.if.exit.0:
  %18 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 25
  %21 = sext i32 %19 to i64                                                        ; inst 26
  %22 = getelementptr [200 x i32], [200 x i32]* %20, i32 0, i64 %21                ; inst 27
  %23 = load i32, i32* %22                                                         ; inst 28
  %24 = icmp eq i32 %23, 4                                                         ; inst 29
  br i1 %24, label %_4.if.then.1, label %_5.if.else.1                              ; inst 30
_4.if.then.1:
  %25 = call i32 @create_node(%Pools* %0, i1 0)                                    ; inst 31
  %26 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 32
  store i32 %25, i32* %26                                                          ; inst 33
  %27 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 34
  %28 = sext i32 %25 to i64                                                        ; inst 35
  %29 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %27, i32 0, i64 %28    ; inst 36
  %30 = getelementptr [6 x i32], [6 x i32]* %29, i32 0, i64 0                      ; inst 37
  store i32 %19, i32* %30                                                          ; inst 38
  call void @split_child(%Pools* %0, i32 %25, i32 0, i32 %19)                      ; inst 39
  call void @insert_non_full(%Pools* %0, i32 %25, i32 %1)                          ; inst 40
  br label %_6.if.exit.1                                                           ; inst 41
_5.if.else.1:
  call void @insert_non_full(%Pools* %0, i32 %19, i32 %1)                          ; inst 42
  br label %_6.if.exit.1                                                           ; inst 43
_6.if.exit.1:
  ret void                                                                         ; inst 44
}

define i1 @search_recursive(%Pools* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%23, %_8.if.exit.1]                              ; inst 2
  %4 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                              ; inst 3
  %5 = sext i32 %1 to i64                                                          ; inst 4
  %6 = getelementptr [200 x i32], [200 x i32]* %4, i32 0, i64 %5                   ; inst 5
  %7 = load i32, i32* %6                                                           ; inst 6
  %8 = icmp slt i32 %3, %7                                                         ; inst 7
  br i1 %8, label %_2.while.body.0, label %_16.critical_edge.0                     ; inst 8
_2.while.body.0:
  %9 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                              ; inst 9
  %10 = sext i32 %1 to i64                                                         ; inst 10
  %11 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %9, i32 0, i64 %10     ; inst 11
  %12 = sext i32 %3 to i64                                                         ; inst 12
  %13 = getelementptr [5 x i32], [5 x i32]* %11, i32 0, i64 %12                    ; inst 13
  %14 = load i32, i32* %13                                                         ; inst 14
  %15 = icmp slt i32 %2, %14                                                       ; inst 15
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 16
_3.if.then.0:
  br label %_9.while.exit.0                                                        ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %16 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 19
  %17 = sext i32 %1 to i64                                                         ; inst 20
  %18 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %16, i32 0, i64 %17    ; inst 21
  %19 = sext i32 %3 to i64                                                         ; inst 22
  %20 = getelementptr [5 x i32], [5 x i32]* %18, i32 0, i64 %19                    ; inst 23
  %21 = load i32, i32* %20                                                         ; inst 24
  %22 = icmp eq i32 %2, %21                                                        ; inst 25
  br i1 %22, label %_6.if.then.1, label %_7.if.else.1                              ; inst 26
_6.if.then.1:
  ret i1 1                                                                         ; inst 27
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 28
_8.if.exit.1:
  %23 = add i32 %3, 1                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_9.while.exit.0:
  %24 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                             ; inst 31
  %25 = sext i32 %1 to i64                                                         ; inst 32
  %26 = getelementptr [200 x i1], [200 x i1]* %24, i32 0, i64 %25                  ; inst 33
  %27 = load i1, i1* %26                                                           ; inst 34
  br i1 %27, label %_10.if.then.2, label %_11.if.else.2                            ; inst 35
_10.if.then.2:
  ret i1 0                                                                         ; inst 36
_11.if.else.2:
  %28 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 37
  %29 = sext i32 %1 to i64                                                         ; inst 38
  %30 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %28, i32 0, i64 %29    ; inst 39
  %31 = sext i32 %3 to i64                                                         ; inst 40
  %32 = getelementptr [6 x i32], [6 x i32]* %30, i32 0, i64 %31                    ; inst 41
  %33 = load i32, i32* %32                                                         ; inst 42
  %34 = icmp eq i32 %33, -1                                                        ; inst 43
  br i1 %34, label %_12.if.then.3, label %_13.if.else.3                            ; inst 44
_12.if.then.3:
  ret i1 0                                                                         ; inst 45
_13.if.else.3:
  br label %_14.if.exit.3                                                          ; inst 46
_14.if.exit.3:
  %35 = call i1 @search_recursive(%Pools* %0, i32 %33, i32 %2)                     ; inst 47
  ret i1 %35                                                                       ; inst 48
_15.if.exit.2:
  unreachable                                                                      ; inst 49
_16.critical_edge.0:
  br label %_9.while.exit.0                                                        ; inst 50
}

define i32 @traverse_and_sum(%Pools* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [200 x i1], [200 x i1]* %3, i32 0, i64 %4                     ; inst 7
  %6 = load i1, i1* %5                                                             ; inst 8
  br label %_4.while.cond.0                                                        ; inst 9
_4.while.cond.0:
  %7 = phi i32 [0, %_3.if.exit.0], [%31, %_8.if.exit.1]                            ; inst 10
  %8 = phi i32 [0, %_3.if.exit.0], [%30, %_8.if.exit.1]                            ; inst 11
  %9 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                              ; inst 12
  %10 = sext i32 %1 to i64                                                         ; inst 13
  %11 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i64 %10                 ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = icmp slt i32 %7, %12                                                       ; inst 16
  br i1 %13, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 17
_5.while.body.0:
  %14 = icmp eq i1 %6, 0                                                           ; inst 18
  br i1 %14, label %_6.if.then.1, label %_7.if.else.1                              ; inst 19
_6.if.then.1:
  %15 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 20
  %16 = sext i32 %1 to i64                                                         ; inst 21
  %17 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %15, i32 0, i64 %16    ; inst 22
  %18 = sext i32 %7 to i64                                                         ; inst 23
  %19 = getelementptr [6 x i32], [6 x i32]* %17, i32 0, i64 %18                    ; inst 24
  %20 = load i32, i32* %19                                                         ; inst 25
  %21 = call i32 @traverse_and_sum(%Pools* %0, i32 %20)                            ; inst 26
  %22 = add i32 %8, %21                                                            ; inst 27
  br label %_8.if.exit.1                                                           ; inst 28
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 29
_8.if.exit.1:
  %23 = phi i32 [%22, %_6.if.then.1], [%8, %_7.if.else.1]                          ; inst 30
  %24 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                             ; inst 31
  %25 = sext i32 %1 to i64                                                         ; inst 32
  %26 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %24, i32 0, i64 %25    ; inst 33
  %27 = sext i32 %7 to i64                                                         ; inst 34
  %28 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i64 %27                    ; inst 35
  %29 = load i32, i32* %28                                                         ; inst 36
  %30 = add i32 %23, %29                                                           ; inst 37
  %31 = add i32 %7, 1                                                              ; inst 38
  br label %_4.while.cond.0                                                        ; inst 39
_9.while.exit.0:
  %32 = icmp eq i1 %6, 0                                                           ; inst 40
  br i1 %32, label %_10.if.then.2, label %_11.if.else.2                            ; inst 41
_10.if.then.2:
  %33 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 42
  %34 = sext i32 %1 to i64                                                         ; inst 43
  %35 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %33, i32 0, i64 %34    ; inst 44
  %36 = sext i32 %7 to i64                                                         ; inst 45
  %37 = getelementptr [6 x i32], [6 x i32]* %35, i32 0, i64 %36                    ; inst 46
  %38 = load i32, i32* %37                                                         ; inst 47
  %39 = call i32 @traverse_and_sum(%Pools* %0, i32 %38)                            ; inst 48
  %40 = add i32 %8, %39                                                            ; inst 49
  br label %_12.if.exit.2                                                          ; inst 50
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 51
_12.if.exit.2:
  %41 = phi i32 [%40, %_10.if.then.2], [%8, %_11.if.else.2]                        ; inst 52
  ret i32 %41                                                                      ; inst 53
}

define i32 @get_height(%Pools* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [200 x i1], [200 x i1]* %3, i32 0, i64 %4                     ; inst 7
  %6 = load i1, i1* %5                                                             ; inst 8
  br i1 %6, label %_4.if.then.1, label %_5.if.else.1                               ; inst 9
_4.if.then.1:
  ret i32 1                                                                        ; inst 10
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 11
_6.if.exit.1:
  %7 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                              ; inst 12
  %8 = sext i32 %1 to i64                                                          ; inst 13
  %9 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %7, i32 0, i64 %8       ; inst 14
  %10 = getelementptr [6 x i32], [6 x i32]* %9, i32 0, i64 0                       ; inst 15
  %11 = load i32, i32* %10                                                         ; inst 16
  %12 = call i32 @get_height(%Pools* %0, i32 %11)                                  ; inst 17
  %13 = add i32 1, %12                                                             ; inst 18
  ret i32 %13                                                                      ; inst 19
}

define void @main() {
_0.entry.0:
  %0 = alloca %Pools                                                               ; inst 1
  %1 = getelementptr %Pools, %Pools* %0, i32 0, i32 0                              ; inst 2
  %2 = alloca [5 x i32]                                                            ; inst 3
  %3 = getelementptr [5 x i32], [5 x i32]* %2, i32 0, i32 0                        ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 5                                                          ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr [200 x [5 x i32]], [200 x [5 x i32]]* %1, i32 0, i32 0        ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 200                                                       ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr [5 x i32], [5 x i32]* %8, i32 %9                             ; inst 18
  call void @memcpy([5 x i32]* %11, [5 x i32]* %2, i64 20)                         ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = getelementptr %Pools, %Pools* %0, i32 0, i32 1                             ; inst 22
  %14 = alloca [6 x i32]                                                           ; inst 23
  %15 = getelementptr [6 x i32], [6 x i32]* %14, i32 0, i32 0                      ; inst 24
  br label %_7.array.cond.2                                                        ; inst 25
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 26
  %17 = icmp slt i32 %16, 6                                                        ; inst 27
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 28
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 29
  store i32 -1, i32* %18                                                           ; inst 30
  %19 = add i32 %16, 1                                                             ; inst 31
  br label %_7.array.cond.2                                                        ; inst 32
_9.array.exit.2:
  %20 = getelementptr [200 x [6 x i32]], [200 x [6 x i32]]* %13, i32 0, i32 0      ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %21 = phi i32 [0, %_9.array.exit.2], [%24, %_11.array.body.3]                    ; inst 35
  %22 = icmp slt i32 %21, 200                                                      ; inst 36
  br i1 %22, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %23 = getelementptr [6 x i32], [6 x i32]* %20, i32 %21                           ; inst 38
  call void @memcpy([6 x i32]* %23, [6 x i32]* %14, i64 24)                        ; inst 39
  %24 = add i32 %21, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %25 = getelementptr %Pools, %Pools* %0, i32 0, i32 2                             ; inst 42
  %26 = getelementptr [200 x i1], [200 x i1]* %25, i32 0, i32 0                    ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 45
  %28 = icmp slt i32 %27, 200                                                      ; inst 46
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %29 = getelementptr i1, i1* %26, i32 %27                                         ; inst 48
  store i1 0, i1* %29                                                              ; inst 49
  %30 = add i32 %27, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %31 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                             ; inst 52
  %32 = getelementptr [200 x i32], [200 x i32]* %31, i32 0, i32 0                  ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %33 = phi i32 [0, %_15.array.exit.4], [%36, %_17.array.body.5]                   ; inst 55
  %34 = icmp slt i32 %33, 200                                                      ; inst 56
  br i1 %34, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %35 = getelementptr i32, i32* %32, i32 %33                                       ; inst 58
  store i32 0, i32* %35                                                            ; inst 59
  %36 = add i32 %33, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  %37 = getelementptr %Pools, %Pools* %0, i32 0, i32 4                             ; inst 62
  store i32 0, i32* %37                                                            ; inst 63
  %38 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 64
  store i32 -1, i32* %38                                                           ; inst 65
  %39 = alloca [100 x i32]                                                         ; inst 66
  %40 = getelementptr [100 x i32], [100 x i32]* %39, i32 0, i32 0                  ; inst 67
  br label %_19.array.cond.6                                                       ; inst 68
_19.array.cond.6:
  %41 = phi i32 [0, %_18.array.exit.5], [%44, %_20.array.body.6]                   ; inst 69
  %42 = icmp slt i32 %41, 100                                                      ; inst 70
  br i1 %42, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 71
_20.array.body.6:
  %43 = getelementptr i32, i32* %40, i32 %41                                       ; inst 72
  store i32 0, i32* %43                                                            ; inst 73
  %44 = add i32 %41, 1                                                             ; inst 74
  br label %_19.array.cond.6                                                       ; inst 75
_21.array.exit.6:
  br label %_22.while.cond.0                                                       ; inst 76
_22.while.cond.0:
  %45 = phi i32 [0, %_21.array.exit.6], [%52, %_23.while.body.0]                   ; inst 77
  %46 = phi i32 [100, %_21.array.exit.6], [%49, %_23.while.body.0]                 ; inst 78
  %47 = icmp slt i32 %45, 100                                                      ; inst 79
  br i1 %47, label %_23.while.body.0, label %_24.while.exit.0                      ; inst 80
_23.while.body.0:
  %48 = add i32 %46, 37                                                            ; inst 81
  %49 = srem i32 %48, 251                                                          ; inst 82
  %50 = sext i32 %45 to i64                                                        ; inst 83
  %51 = getelementptr [100 x i32], [100 x i32]* %39, i32 0, i64 %50                ; inst 84
  store i32 %49, i32* %51                                                          ; inst 85
  %52 = add i32 %45, 1                                                             ; inst 86
  br label %_22.while.cond.0                                                       ; inst 87
_24.while.exit.0:
  br label %_25.while.cond.1                                                       ; inst 88
_25.while.cond.1:
  %53 = phi i32 [0, %_24.while.exit.0], [%58, %_26.while.body.1]                   ; inst 89
  %54 = icmp slt i32 %53, 100                                                      ; inst 90
  br i1 %54, label %_26.while.body.1, label %_27.while.exit.1                      ; inst 91
_26.while.body.1:
  %55 = sext i32 %53 to i64                                                        ; inst 92
  %56 = getelementptr [100 x i32], [100 x i32]* %39, i32 0, i64 %55                ; inst 93
  %57 = load i32, i32* %56                                                         ; inst 94
  call void @insert(%Pools* %0, i32 %57)                                           ; inst 95
  %58 = add i32 %53, 1                                                             ; inst 96
  br label %_25.while.cond.1                                                       ; inst 97
_27.while.exit.1:
  br label %_28.while.cond.2                                                       ; inst 98
_28.while.cond.2:
  %59 = phi i32 [0, %_27.while.exit.1], [%69, %_32.if.exit.0]                      ; inst 99
  %60 = phi i32 [0, %_27.while.exit.1], [%70, %_32.if.exit.0]                      ; inst 100
  %61 = icmp slt i32 %60, 100                                                      ; inst 101
  br i1 %61, label %_29.while.body.2, label %_33.while.exit.2                      ; inst 102
_29.while.body.2:
  %62 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 103
  %63 = load i32, i32* %62                                                         ; inst 104
  %64 = sext i32 %60 to i64                                                        ; inst 105
  %65 = getelementptr [100 x i32], [100 x i32]* %39, i32 0, i64 %64                ; inst 106
  %66 = load i32, i32* %65                                                         ; inst 107
  %67 = call i1 @search_recursive(%Pools* %0, i32 %63, i32 %66)                    ; inst 108
  br i1 %67, label %_30.if.then.0, label %_31.if.else.0                            ; inst 109
_30.if.then.0:
  %68 = add i32 %59, 1                                                             ; inst 110
  br label %_32.if.exit.0                                                          ; inst 111
_31.if.else.0:
  br label %_32.if.exit.0                                                          ; inst 112
_32.if.exit.0:
  %69 = phi i32 [%68, %_30.if.then.0], [%59, %_31.if.else.0]                       ; inst 113
  %70 = add i32 %60, 1                                                             ; inst 114
  br label %_28.while.cond.2                                                       ; inst 115
_33.while.exit.2:
  call void @printlnInt(i32 %59)                                                   ; inst 116
  br label %_34.while.cond.3                                                       ; inst 117
_34.while.cond.3:
  %71 = phi i32 [0, %_33.while.exit.2], [%80, %_38.if.exit.1]                      ; inst 118
  %72 = phi i32 [0, %_33.while.exit.2], [%81, %_38.if.exit.1]                      ; inst 119
  %73 = icmp slt i32 %72, 50                                                       ; inst 120
  br i1 %73, label %_35.while.body.3, label %_39.while.exit.3                      ; inst 121
_35.while.body.3:
  %74 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 122
  %75 = load i32, i32* %74                                                         ; inst 123
  %76 = add i32 300, %72                                                           ; inst 124
  %77 = call i1 @search_recursive(%Pools* %0, i32 %75, i32 %76)                    ; inst 125
  %78 = icmp eq i1 %77, 0                                                          ; inst 126
  br i1 %78, label %_36.if.then.1, label %_37.if.else.1                            ; inst 127
_36.if.then.1:
  %79 = add i32 %71, 1                                                             ; inst 128
  br label %_38.if.exit.1                                                          ; inst 129
_37.if.else.1:
  br label %_38.if.exit.1                                                          ; inst 130
_38.if.exit.1:
  %80 = phi i32 [%79, %_36.if.then.1], [%71, %_37.if.else.1]                       ; inst 131
  %81 = add i32 %72, 1                                                             ; inst 132
  br label %_34.while.cond.3                                                       ; inst 133
_39.while.exit.3:
  call void @printlnInt(i32 %71)                                                   ; inst 134
  %82 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 135
  %83 = load i32, i32* %82                                                         ; inst 136
  %84 = call i32 @traverse_and_sum(%Pools* %0, i32 %83)                            ; inst 137
  call void @printlnInt(i32 %84)                                                   ; inst 138
  %85 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 139
  %86 = load i32, i32* %85                                                         ; inst 140
  %87 = call i32 @get_height(%Pools* %0, i32 %86)                                  ; inst 141
  call void @printlnInt(i32 %87)                                                   ; inst 142
  call void @insert(%Pools* %0, i32 500)                                           ; inst 143
  call void @insert(%Pools* %0, i32 501)                                           ; inst 144
  call void @insert(%Pools* %0, i32 502)                                           ; inst 145
  call void @insert(%Pools* %0, i32 503)                                           ; inst 146
  call void @insert(%Pools* %0, i32 504)                                           ; inst 147
  call void @insert(%Pools* %0, i32 505)                                           ; inst 148
  %88 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 149
  %89 = load i32, i32* %88                                                         ; inst 150
  %90 = call i32 @traverse_and_sum(%Pools* %0, i32 %89)                            ; inst 151
  call void @printlnInt(i32 %90)                                                   ; inst 152
  %91 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 153
  %92 = load i32, i32* %91                                                         ; inst 154
  %93 = call i32 @get_height(%Pools* %0, i32 %92)                                  ; inst 155
  call void @printlnInt(i32 %93)                                                   ; inst 156
  %94 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 157
  %95 = load i32, i32* %94                                                         ; inst 158
  %96 = call i1 @search_recursive(%Pools* %0, i32 %95, i32 503)                    ; inst 159
  br i1 %96, label %_40.if.then.2, label %_41.if.else.2                            ; inst 160
_40.if.then.2:
  br label %_42.if.exit.2                                                          ; inst 161
_41.if.else.2:
  br label %_42.if.exit.2                                                          ; inst 162
_42.if.exit.2:
  %97 = phi i32 [1, %_40.if.then.2], [0, %_41.if.else.2]                           ; inst 163
  call void @printlnInt(i32 %97)                                                   ; inst 164
  %98 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                             ; inst 165
  %99 = load i32, i32* %98                                                         ; inst 166
  %100 = call i1 @search_recursive(%Pools* %0, i32 %99, i32 999)                   ; inst 167
  %101 = icmp eq i1 %100, 0                                                        ; inst 168
  br i1 %101, label %_43.if.then.3, label %_44.if.else.3                           ; inst 169
_43.if.then.3:
  br label %_45.if.exit.3                                                          ; inst 170
_44.if.else.3:
  br label %_45.if.exit.3                                                          ; inst 171
_45.if.exit.3:
  %102 = phi i32 [2, %_43.if.then.3], [%97, %_44.if.else.3]                        ; inst 172
  call void @printlnInt(i32 %102)                                                  ; inst 173
  br label %_46.while.cond.4                                                       ; inst 174
_46.while.cond.4:
  %103 = phi i32 [100, %_45.if.exit.3], [%106, %_47.while.body.4]                  ; inst 175
  %104 = icmp slt i32 %103, 150                                                    ; inst 176
  br i1 %104, label %_47.while.body.4, label %_48.while.exit.4                     ; inst 177
_47.while.body.4:
  %105 = mul i32 %103, 3                                                           ; inst 178
  call void @insert(%Pools* %0, i32 %105)                                          ; inst 179
  %106 = add i32 %103, 1                                                           ; inst 180
  br label %_46.while.cond.4                                                       ; inst 181
_48.while.exit.4:
  %107 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                            ; inst 182
  %108 = load i32, i32* %107                                                       ; inst 183
  %109 = call i32 @traverse_and_sum(%Pools* %0, i32 %108)                          ; inst 184
  call void @printlnInt(i32 %109)                                                  ; inst 185
  %110 = getelementptr %Pools, %Pools* %0, i32 0, i32 5                            ; inst 186
  %111 = load i32, i32* %110                                                       ; inst 187
  %112 = call i32 @get_height(%Pools* %0, i32 %111)                                ; inst 188
  call void @printlnInt(i32 %112)                                                  ; inst 189
  br label %_49.while.cond.5                                                       ; inst 190
_49.while.cond.5:
  %113 = phi i32 [0, %_48.while.exit.4], [%124, %_53.if.exit.4]                    ; inst 191
  %114 = phi i32 [0, %_48.while.exit.4], [%125, %_53.if.exit.4]                    ; inst 192
  %115 = getelementptr %Pools, %Pools* %0, i32 0, i32 4                            ; inst 193
  %116 = load i32, i32* %115                                                       ; inst 194
  %117 = icmp slt i32 %114, %116                                                   ; inst 195
  br i1 %117, label %_50.while.body.5, label %_54.while.exit.5                     ; inst 196
_50.while.body.5:
  %118 = getelementptr %Pools, %Pools* %0, i32 0, i32 3                            ; inst 197
  %119 = sext i32 %114 to i64                                                      ; inst 198
  %120 = getelementptr [200 x i32], [200 x i32]* %118, i32 0, i64 %119             ; inst 199
  %121 = load i32, i32* %120                                                       ; inst 200
  %122 = icmp sgt i32 %121, 0                                                      ; inst 201
  br i1 %122, label %_51.if.then.4, label %_52.if.else.4                           ; inst 202
_51.if.then.4:
  %123 = add i32 %113, 1                                                           ; inst 203
  br label %_53.if.exit.4                                                          ; inst 204
_52.if.else.4:
  br label %_53.if.exit.4                                                          ; inst 205
_53.if.exit.4:
  %124 = phi i32 [%123, %_51.if.then.4], [%113, %_52.if.else.4]                    ; inst 206
  %125 = add i32 %114, 1                                                           ; inst 207
  br label %_49.while.cond.5                                                       ; inst 208
_54.while.exit.5:
  call void @printlnInt(i32 %113)                                                  ; inst 209
  br label %_55.while.cond.6                                                       ; inst 210
_55.while.cond.6:
  %126 = phi i32 [0, %_54.while.exit.5], [%129, %_59.if.exit.5]                    ; inst 211
  %127 = icmp slt i32 %126, 10                                                     ; inst 212
  br i1 %127, label %_56.while.body.6, label %_60.while.exit.6                     ; inst 213
_56.while.body.6:
  %128 = icmp sgt i32 %126, 5                                                      ; inst 214
  br i1 %128, label %_57.if.then.5, label %_58.if.else.5                           ; inst 215
_57.if.then.5:
  br label %_59.if.exit.5                                                          ; inst 216
_58.if.else.5:
  br label %_59.if.exit.5                                                          ; inst 217
_59.if.exit.5:
  %129 = add i32 %126, 1                                                           ; inst 218
  br label %_55.while.cond.6                                                       ; inst 219
_60.while.exit.6:
  br i1 0, label %_61.if.then.6, label %_62.if.else.6                              ; inst 220
_61.if.then.6:
  call void @printlnInt(i32 999)                                                   ; inst 221
  br label %_63.if.exit.6                                                          ; inst 222
_62.if.else.6:
  call void @printlnInt(i32 888)                                                   ; inst 223
  br label %_63.if.exit.6                                                          ; inst 224
_63.if.exit.6:
  call void @exit(i32 0)                                                           ; inst 225
  ret void                                                                         ; inst 226
}

