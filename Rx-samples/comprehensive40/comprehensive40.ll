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



define void @init_matrix([40 x [40 x i32]]* sret([40 x [40 x i32]]) %0, [40 x [40 x i32]]* %1, i32 %2) {
_0.entry.0:
  %3 = alloca [40 x [40 x i32]]                                                    ; inst 1
  call void @memcpy([40 x [40 x i32]]* %3, [40 x [40 x i32]]* %1, i64 6400)        ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%17, %_5.while.exit.1]                           ; inst 4
  %5 = icmp slt i32 %4, 40                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%16, %_4.while.body.1]                      ; inst 8
  %7 = icmp slt i32 %6, 40                                                         ; inst 9
  br i1 %7, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %8 = sext i32 %4 to i64                                                          ; inst 11
  %9 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %3, i32 0, i64 %8       ; inst 12
  %10 = sext i32 %6 to i64                                                         ; inst 13
  %11 = getelementptr [40 x i32], [40 x i32]* %9, i32 0, i64 %10                   ; inst 14
  %12 = mul i32 %4, 40                                                             ; inst 15
  %13 = add i32 %12, %6                                                            ; inst 16
  %14 = add i32 %13, %2                                                            ; inst 17
  %15 = srem i32 %14, 100                                                          ; inst 18
  store i32 %15, i32* %11                                                          ; inst 19
  %16 = add i32 %6, 1                                                              ; inst 20
  br label %_3.while.cond.1                                                        ; inst 21
_5.while.exit.1:
  %17 = add i32 %4, 1                                                              ; inst 22
  br label %_1.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  call void @memcpy([40 x [40 x i32]]* %0, [40 x [40 x i32]]* %3, i64 6400)        ; inst 24
  ret void                                                                         ; inst 25
}

define void @matrix_multiply([40 x [40 x i32]]* sret([40 x [40 x i32]]) %0, [40 x [40 x i32]]* %1, [40 x [40 x i32]]* %2) {
_0.entry.0:
  %3 = alloca [40 x [40 x i32]]                                                    ; inst 1
  %4 = alloca [40 x i32]                                                           ; inst 2
  %5 = getelementptr [40 x i32], [40 x i32]* %4, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 5
  %7 = icmp slt i32 %6, 40                                                         ; inst 6
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %8 = getelementptr i32, i32* %5, i32 %6                                          ; inst 8
  store i32 0, i32* %8                                                             ; inst 9
  %9 = add i32 %6, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %10 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %3, i32 0, i32 0       ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 14
  %12 = icmp slt i32 %11, 40                                                       ; inst 15
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %13 = getelementptr [40 x i32], [40 x i32]* %10, i32 %11                         ; inst 17
  call void @memcpy([40 x i32]* %13, [40 x i32]* %4, i64 160)                      ; inst 18
  %14 = add i32 %11, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %15 = phi i32 [0, %_6.array.exit.1], [%40, %_14.while.exit.1]                    ; inst 22
  %16 = icmp slt i32 %15, 40                                                       ; inst 23
  br i1 %16, label %_8.while.body.0, label %_15.while.exit.0                       ; inst 24
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 25
_9.while.cond.1:
  %17 = phi i32 [0, %_8.while.body.0], [%39, %_13.while.exit.2]                    ; inst 26
  %18 = icmp slt i32 %17, 40                                                       ; inst 27
  br i1 %18, label %_10.while.body.1, label %_14.while.exit.1                      ; inst 28
_10.while.body.1:
  br label %_11.while.cond.2                                                       ; inst 29
_11.while.cond.2:
  %19 = phi i32 [0, %_10.while.body.1], [%33, %_12.while.body.2]                   ; inst 30
  %20 = phi i32 [0, %_10.while.body.1], [%34, %_12.while.body.2]                   ; inst 31
  %21 = icmp slt i32 %20, 40                                                       ; inst 32
  br i1 %21, label %_12.while.body.2, label %_13.while.exit.2                      ; inst 33
_12.while.body.2:
  %22 = sext i32 %15 to i64                                                        ; inst 34
  %23 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %22     ; inst 35
  %24 = sext i32 %20 to i64                                                        ; inst 36
  %25 = getelementptr [40 x i32], [40 x i32]* %23, i32 0, i64 %24                  ; inst 37
  %26 = load i32, i32* %25                                                         ; inst 38
  %27 = sext i32 %20 to i64                                                        ; inst 39
  %28 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i64 %27     ; inst 40
  %29 = sext i32 %17 to i64                                                        ; inst 41
  %30 = getelementptr [40 x i32], [40 x i32]* %28, i32 0, i64 %29                  ; inst 42
  %31 = load i32, i32* %30                                                         ; inst 43
  %32 = mul i32 %26, %31                                                           ; inst 44
  %33 = add i32 %19, %32                                                           ; inst 45
  %34 = add i32 %20, 1                                                             ; inst 46
  br label %_11.while.cond.2                                                       ; inst 47
_13.while.exit.2:
  %35 = sext i32 %15 to i64                                                        ; inst 48
  %36 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %3, i32 0, i64 %35     ; inst 49
  %37 = sext i32 %17 to i64                                                        ; inst 50
  %38 = getelementptr [40 x i32], [40 x i32]* %36, i32 0, i64 %37                  ; inst 51
  store i32 %19, i32* %38                                                          ; inst 52
  %39 = add i32 %17, 1                                                             ; inst 53
  br label %_9.while.cond.1                                                        ; inst 54
_14.while.exit.1:
  %40 = add i32 %15, 1                                                             ; inst 55
  br label %_7.while.cond.0                                                        ; inst 56
_15.while.exit.0:
  call void @memcpy([40 x [40 x i32]]* %0, [40 x [40 x i32]]* %3, i64 6400)        ; inst 57
  ret void                                                                         ; inst 58
}

define void @apply_stencil([40 x [40 x i32]]* sret([40 x [40 x i32]]) %0, [40 x [40 x i32]]* %1) {
_0.entry.0:
  %2 = alloca [40 x [40 x i32]]                                                    ; inst 1
  %3 = alloca [40 x i32]                                                           ; inst 2
  %4 = getelementptr [40 x i32], [40 x i32]* %3, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 5
  %6 = icmp slt i32 %5, 40                                                         ; inst 6
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 8
  store i32 0, i32* %7                                                             ; inst 9
  %8 = add i32 %5, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %9 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i32 0        ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 40                                                       ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr [40 x i32], [40 x i32]* %9, i32 %10                          ; inst 17
  call void @memcpy([40 x i32]* %12, [40 x i32]* %3, i64 160)                      ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %14 = phi i32 [1, %_6.array.exit.1], [%90, %_11.while.exit.1]                    ; inst 22
  %15 = icmp slt i32 %14, 39                                                       ; inst 23
  br i1 %15, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 24
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 25
_9.while.cond.1:
  %16 = phi i32 [1, %_8.while.body.0], [%89, %_10.while.body.1]                    ; inst 26
  %17 = icmp slt i32 %16, 39                                                       ; inst 27
  br i1 %17, label %_10.while.body.1, label %_11.while.exit.1                      ; inst 28
_10.while.body.1:
  %18 = sext i32 %14 to i64                                                        ; inst 29
  %19 = sub i64 %18, 1                                                             ; inst 30
  %20 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %19     ; inst 31
  %21 = sext i32 %16 to i64                                                        ; inst 32
  %22 = sub i64 %21, 1                                                             ; inst 33
  %23 = getelementptr [40 x i32], [40 x i32]* %20, i32 0, i64 %22                  ; inst 34
  %24 = load i32, i32* %23                                                         ; inst 35
  %25 = sext i32 %14 to i64                                                        ; inst 36
  %26 = sub i64 %25, 1                                                             ; inst 37
  %27 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %26     ; inst 38
  %28 = sext i32 %16 to i64                                                        ; inst 39
  %29 = getelementptr [40 x i32], [40 x i32]* %27, i32 0, i64 %28                  ; inst 40
  %30 = load i32, i32* %29                                                         ; inst 41
  %31 = add i32 %24, %30                                                           ; inst 42
  %32 = sext i32 %14 to i64                                                        ; inst 43
  %33 = sub i64 %32, 1                                                             ; inst 44
  %34 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %33     ; inst 45
  %35 = sext i32 %16 to i64                                                        ; inst 46
  %36 = add i64 %35, 1                                                             ; inst 47
  %37 = getelementptr [40 x i32], [40 x i32]* %34, i32 0, i64 %36                  ; inst 48
  %38 = load i32, i32* %37                                                         ; inst 49
  %39 = add i32 %31, %38                                                           ; inst 50
  %40 = sext i32 %14 to i64                                                        ; inst 51
  %41 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %40     ; inst 52
  %42 = sext i32 %16 to i64                                                        ; inst 53
  %43 = sub i64 %42, 1                                                             ; inst 54
  %44 = getelementptr [40 x i32], [40 x i32]* %41, i32 0, i64 %43                  ; inst 55
  %45 = load i32, i32* %44                                                         ; inst 56
  %46 = add i32 %39, %45                                                           ; inst 57
  %47 = sext i32 %14 to i64                                                        ; inst 58
  %48 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %47     ; inst 59
  %49 = sext i32 %16 to i64                                                        ; inst 60
  %50 = getelementptr [40 x i32], [40 x i32]* %48, i32 0, i64 %49                  ; inst 61
  %51 = load i32, i32* %50                                                         ; inst 62
  %52 = mul i32 %51, -8                                                            ; inst 63
  %53 = add i32 %46, %52                                                           ; inst 64
  %54 = sext i32 %14 to i64                                                        ; inst 65
  %55 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %54     ; inst 66
  %56 = sext i32 %16 to i64                                                        ; inst 67
  %57 = add i64 %56, 1                                                             ; inst 68
  %58 = getelementptr [40 x i32], [40 x i32]* %55, i32 0, i64 %57                  ; inst 69
  %59 = load i32, i32* %58                                                         ; inst 70
  %60 = add i32 %53, %59                                                           ; inst 71
  %61 = sext i32 %14 to i64                                                        ; inst 72
  %62 = add i64 %61, 1                                                             ; inst 73
  %63 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %62     ; inst 74
  %64 = sext i32 %16 to i64                                                        ; inst 75
  %65 = sub i64 %64, 1                                                             ; inst 76
  %66 = getelementptr [40 x i32], [40 x i32]* %63, i32 0, i64 %65                  ; inst 77
  %67 = load i32, i32* %66                                                         ; inst 78
  %68 = add i32 %60, %67                                                           ; inst 79
  %69 = sext i32 %14 to i64                                                        ; inst 80
  %70 = add i64 %69, 1                                                             ; inst 81
  %71 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %70     ; inst 82
  %72 = sext i32 %16 to i64                                                        ; inst 83
  %73 = getelementptr [40 x i32], [40 x i32]* %71, i32 0, i64 %72                  ; inst 84
  %74 = load i32, i32* %73                                                         ; inst 85
  %75 = add i32 %68, %74                                                           ; inst 86
  %76 = sext i32 %14 to i64                                                        ; inst 87
  %77 = add i64 %76, 1                                                             ; inst 88
  %78 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %1, i32 0, i64 %77     ; inst 89
  %79 = sext i32 %16 to i64                                                        ; inst 90
  %80 = add i64 %79, 1                                                             ; inst 91
  %81 = getelementptr [40 x i32], [40 x i32]* %78, i32 0, i64 %80                  ; inst 92
  %82 = load i32, i32* %81                                                         ; inst 93
  %83 = add i32 %75, %82                                                           ; inst 94
  %84 = sext i32 %14 to i64                                                        ; inst 95
  %85 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i64 %84     ; inst 96
  %86 = sext i32 %16 to i64                                                        ; inst 97
  %87 = getelementptr [40 x i32], [40 x i32]* %85, i32 0, i64 %86                  ; inst 98
  %88 = sdiv i32 %83, 3                                                            ; inst 99
  store i32 %88, i32* %87                                                          ; inst 100
  %89 = add i32 %16, 1                                                             ; inst 101
  br label %_9.while.cond.1                                                        ; inst 102
_11.while.exit.1:
  %90 = add i32 %14, 1                                                             ; inst 103
  br label %_7.while.cond.0                                                        ; inst 104
_12.while.exit.0:
  call void @memcpy([40 x [40 x i32]]* %0, [40 x [40 x i32]]* %2, i64 6400)        ; inst 105
  ret void                                                                         ; inst 106
}

define void @transpose_and_add([40 x [40 x i32]]* sret([40 x [40 x i32]]) %0, [40 x [40 x i32]]* %1) {
_0.entry.0:
  %2 = alloca [40 x [40 x i32]]                                                    ; inst 1
  call void @memcpy([40 x [40 x i32]]* %2, [40 x [40 x i32]]* %1, i64 6400)        ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%33, %_5.while.exit.1]                           ; inst 4
  %4 = icmp slt i32 %3, 40                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %5 = phi i32 [%3, %_2.while.body.0], [%32, %_4.while.body.1]                     ; inst 8
  %6 = icmp slt i32 %5, 40                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = sext i32 %3 to i64                                                          ; inst 11
  %8 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i64 %7       ; inst 12
  %9 = sext i32 %5 to i64                                                          ; inst 13
  %10 = getelementptr [40 x i32], [40 x i32]* %8, i32 0, i64 %9                    ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = sext i32 %3 to i64                                                         ; inst 16
  %13 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i64 %12     ; inst 17
  %14 = sext i32 %5 to i64                                                         ; inst 18
  %15 = getelementptr [40 x i32], [40 x i32]* %13, i32 0, i64 %14                  ; inst 19
  %16 = sext i32 %5 to i64                                                         ; inst 20
  %17 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i64 %16     ; inst 21
  %18 = sext i32 %3 to i64                                                         ; inst 22
  %19 = getelementptr [40 x i32], [40 x i32]* %17, i32 0, i64 %18                  ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = add i32 %20, %11                                                           ; inst 25
  store i32 %21, i32* %15                                                          ; inst 26
  %22 = sext i32 %5 to i64                                                         ; inst 27
  %23 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i64 %22     ; inst 28
  %24 = sext i32 %3 to i64                                                         ; inst 29
  %25 = getelementptr [40 x i32], [40 x i32]* %23, i32 0, i64 %24                  ; inst 30
  %26 = sext i32 %5 to i64                                                         ; inst 31
  %27 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %2, i32 0, i64 %26     ; inst 32
  %28 = sext i32 %3 to i64                                                         ; inst 33
  %29 = getelementptr [40 x i32], [40 x i32]* %27, i32 0, i64 %28                  ; inst 34
  %30 = load i32, i32* %29                                                         ; inst 35
  %31 = add i32 %11, %30                                                           ; inst 36
  store i32 %31, i32* %25                                                          ; inst 37
  %32 = add i32 %5, 1                                                              ; inst 38
  br label %_3.while.cond.1                                                        ; inst 39
_5.while.exit.1:
  %33 = add i32 %3, 1                                                              ; inst 40
  br label %_1.while.cond.0                                                        ; inst 41
_6.while.exit.0:
  call void @memcpy([40 x [40 x i32]]* %0, [40 x [40 x i32]]* %2, i64 6400)        ; inst 42
  ret void                                                                         ; inst 43
}

define i32 @sub_matrix_sum([40 x [40 x i32]]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%14, %_5.while.exit.1]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%5, %_5.while.exit.1]                            ; inst 3
  %3 = icmp slt i32 %1, 20                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %4 = phi i32 [0, %_2.while.body.0], [%13, %_4.while.body.1]                      ; inst 7
  %5 = phi i32 [%2, %_2.while.body.0], [%12, %_4.while.body.1]                     ; inst 8
  %6 = icmp slt i32 %4, 20                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = sext i32 %1 to i64                                                          ; inst 11
  %8 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %0, i32 0, i64 %7       ; inst 12
  %9 = sext i32 %4 to i64                                                          ; inst 13
  %10 = getelementptr [40 x i32], [40 x i32]* %8, i32 0, i64 %9                    ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = add i32 %5, %11                                                            ; inst 16
  %13 = add i32 %4, 1                                                              ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_5.while.exit.1:
  %14 = add i32 %1, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  br label %_7.while.cond.2                                                        ; inst 21
_7.while.cond.2:
  %15 = phi i32 [20, %_6.while.exit.0], [%28, %_11.while.exit.3]                   ; inst 22
  %16 = phi i32 [%2, %_6.while.exit.0], [%19, %_11.while.exit.3]                   ; inst 23
  %17 = icmp slt i32 %15, 40                                                       ; inst 24
  br i1 %17, label %_8.while.body.2, label %_12.while.exit.2                       ; inst 25
_8.while.body.2:
  br label %_9.while.cond.3                                                        ; inst 26
_9.while.cond.3:
  %18 = phi i32 [20, %_8.while.body.2], [%27, %_10.while.body.3]                   ; inst 27
  %19 = phi i32 [%16, %_8.while.body.2], [%26, %_10.while.body.3]                  ; inst 28
  %20 = icmp slt i32 %18, 40                                                       ; inst 29
  br i1 %20, label %_10.while.body.3, label %_11.while.exit.3                      ; inst 30
_10.while.body.3:
  %21 = sext i32 %15 to i64                                                        ; inst 31
  %22 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %0, i32 0, i64 %21     ; inst 32
  %23 = sext i32 %18 to i64                                                        ; inst 33
  %24 = getelementptr [40 x i32], [40 x i32]* %22, i32 0, i64 %23                  ; inst 34
  %25 = load i32, i32* %24                                                         ; inst 35
  %26 = add i32 %19, %25                                                           ; inst 36
  %27 = add i32 %18, 1                                                             ; inst 37
  br label %_9.while.cond.3                                                        ; inst 38
_11.while.exit.3:
  %28 = add i32 %15, 1                                                             ; inst 39
  br label %_7.while.cond.2                                                        ; inst 40
_12.while.exit.2:
  ret i32 %16                                                                      ; inst 41
}

define i32 @diagonal_processing([40 x [40 x i32]]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%24, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%23, %_5.if.exit.0]                              ; inst 3
  %3 = icmp slt i32 %1, 40                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %0, i32 0, i64 %4       ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [40 x i32], [40 x i32]* %5, i32 0, i64 %6                     ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = icmp sgt i32 %8, 50                                                         ; inst 11
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 12
_3.if.then.0:
  %10 = sext i32 %1 to i64                                                         ; inst 13
  %11 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %0, i32 0, i64 %10     ; inst 14
  %12 = sub i32 39, %1                                                             ; inst 15
  %13 = sext i32 %12 to i64                                                        ; inst 16
  %14 = getelementptr [40 x i32], [40 x i32]* %11, i32 0, i64 %13                  ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  %16 = add i32 %2, %15                                                            ; inst 19
  br label %_5.if.exit.0                                                           ; inst 20
_4.if.else.0:
  %17 = sext i32 %1 to i64                                                         ; inst 21
  %18 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %0, i32 0, i64 %17     ; inst 22
  %19 = sext i32 %1 to i64                                                         ; inst 23
  %20 = getelementptr [40 x i32], [40 x i32]* %18, i32 0, i64 %19                  ; inst 24
  %21 = load i32, i32* %20                                                         ; inst 25
  %22 = sub i32 %2, %21                                                            ; inst 26
  br label %_5.if.exit.0                                                           ; inst 27
_5.if.exit.0:
  %23 = phi i32 [%16, %_3.if.then.0], [%22, %_4.if.else.0]                         ; inst 28
  %24 = add i32 %1, 1                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_6.while.exit.0:
  ret i32 %2                                                                       ; inst 31
}

define void @main() {
_0.entry.0:
  %0 = alloca [40 x [40 x i32]]                                                    ; inst 1
  %1 = alloca [40 x [40 x i32]]                                                    ; inst 2
  %2 = alloca [40 x [40 x i32]]                                                    ; inst 3
  %3 = alloca [40 x [40 x i32]]                                                    ; inst 4
  %4 = alloca [40 x [40 x i32]]                                                    ; inst 5
  %5 = alloca [40 x [40 x i32]]                                                    ; inst 6
  %6 = alloca [40 x [40 x i32]]                                                    ; inst 7
  %7 = alloca [40 x [40 x i32]]                                                    ; inst 8
  %8 = alloca [40 x [40 x i32]]                                                    ; inst 9
  %9 = alloca [40 x [40 x i32]]                                                    ; inst 10
  %10 = alloca [40 x [40 x i32]]                                                   ; inst 11
  %11 = alloca [40 x [40 x i32]]                                                   ; inst 12
  %12 = alloca [40 x [40 x i32]]                                                   ; inst 13
  %13 = alloca [40 x [40 x i32]]                                                   ; inst 14
  %14 = alloca [40 x i32]                                                          ; inst 15
  %15 = getelementptr [40 x i32], [40 x i32]* %14, i32 0, i32 0                    ; inst 16
  br label %_1.array.cond.0                                                        ; inst 17
_1.array.cond.0:
  %16 = phi i32 [0, %_0.entry.0], [%19, %_2.array.body.0]                          ; inst 18
  %17 = icmp slt i32 %16, 40                                                       ; inst 19
  br i1 %17, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 20
_2.array.body.0:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 21
  store i32 0, i32* %18                                                            ; inst 22
  %19 = add i32 %16, 1                                                             ; inst 23
  br label %_1.array.cond.0                                                        ; inst 24
_3.array.exit.0:
  %20 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %13, i32 0, i32 0      ; inst 25
  br label %_4.array.cond.1                                                        ; inst 26
_4.array.cond.1:
  %21 = phi i32 [0, %_3.array.exit.0], [%24, %_5.array.body.1]                     ; inst 27
  %22 = icmp slt i32 %21, 40                                                       ; inst 28
  br i1 %22, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 29
_5.array.body.1:
  %23 = getelementptr [40 x i32], [40 x i32]* %20, i32 %21                         ; inst 30
  call void @memcpy([40 x i32]* %23, [40 x i32]* %14, i64 160)                     ; inst 31
  %24 = add i32 %21, 1                                                             ; inst 32
  br label %_4.array.cond.1                                                        ; inst 33
_6.array.exit.1:
  %25 = alloca [40 x [40 x i32]]                                                   ; inst 34
  %26 = alloca [40 x i32]                                                          ; inst 35
  %27 = getelementptr [40 x i32], [40 x i32]* %26, i32 0, i32 0                    ; inst 36
  br label %_7.array.cond.2                                                        ; inst 37
_7.array.cond.2:
  %28 = phi i32 [0, %_6.array.exit.1], [%31, %_8.array.body.2]                     ; inst 38
  %29 = icmp slt i32 %28, 40                                                       ; inst 39
  br i1 %29, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 40
_8.array.body.2:
  %30 = getelementptr i32, i32* %27, i32 %28                                       ; inst 41
  store i32 0, i32* %30                                                            ; inst 42
  %31 = add i32 %28, 1                                                             ; inst 43
  br label %_7.array.cond.2                                                        ; inst 44
_9.array.exit.2:
  %32 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %25, i32 0, i32 0      ; inst 45
  br label %_10.array.cond.3                                                       ; inst 46
_10.array.cond.3:
  %33 = phi i32 [0, %_9.array.exit.2], [%36, %_11.array.body.3]                    ; inst 47
  %34 = icmp slt i32 %33, 40                                                       ; inst 48
  br i1 %34, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 49
_11.array.body.3:
  %35 = getelementptr [40 x i32], [40 x i32]* %32, i32 %33                         ; inst 50
  call void @memcpy([40 x i32]* %35, [40 x i32]* %26, i64 160)                     ; inst 51
  %36 = add i32 %33, 1                                                             ; inst 52
  br label %_10.array.cond.3                                                       ; inst 53
_12.array.exit.3:
  %37 = alloca [40 x [40 x i32]]                                                   ; inst 54
  call void @memcpy([40 x [40 x i32]]* %0, [40 x [40 x i32]]* %13, i64 6400)       ; inst 55
  call void @init_matrix([40 x [40 x i32]]* %37, [40 x [40 x i32]]* %0, i32 123)   ; inst 56
  call void @memcpy([40 x [40 x i32]]* %13, [40 x [40 x i32]]* %37, i64 6400)      ; inst 57
  %38 = alloca [40 x [40 x i32]]                                                   ; inst 58
  call void @memcpy([40 x [40 x i32]]* %1, [40 x [40 x i32]]* %25, i64 6400)       ; inst 59
  call void @init_matrix([40 x [40 x i32]]* %38, [40 x [40 x i32]]* %1, i32 456)   ; inst 60
  call void @memcpy([40 x [40 x i32]]* %25, [40 x [40 x i32]]* %38, i64 6400)      ; inst 61
  %39 = alloca [40 x [40 x i32]]                                                   ; inst 62
  call void @memcpy([40 x [40 x i32]]* %2, [40 x [40 x i32]]* %13, i64 6400)       ; inst 63
  call void @memcpy([40 x [40 x i32]]* %3, [40 x [40 x i32]]* %25, i64 6400)       ; inst 64
  call void @matrix_multiply([40 x [40 x i32]]* %39, [40 x [40 x i32]]* %2, [40 x [40 x i32]]* %3) ; inst 65
  br label %_13.while.cond.0                                                       ; inst 66
_13.while.cond.0:
  %40 = phi i32 [0, %_12.array.exit.3], [%43, %_14.while.body.0]                   ; inst 67
  %41 = icmp slt i32 %40, 5                                                        ; inst 68
  br i1 %41, label %_14.while.body.0, label %_15.while.exit.0                      ; inst 69
_14.while.body.0:
  %42 = alloca [40 x [40 x i32]]                                                   ; inst 70
  call void @memcpy([40 x [40 x i32]]* %4, [40 x [40 x i32]]* %39, i64 6400)       ; inst 71
  call void @apply_stencil([40 x [40 x i32]]* %42, [40 x [40 x i32]]* %4)          ; inst 72
  call void @memcpy([40 x [40 x i32]]* %39, [40 x [40 x i32]]* %42, i64 6400)      ; inst 73
  %43 = add i32 %40, 1                                                             ; inst 74
  br label %_13.while.cond.0                                                       ; inst 75
_15.while.exit.0:
  call void @memcpy([40 x [40 x i32]]* %5, [40 x [40 x i32]]* %39, i64 6400)       ; inst 76
  %44 = call i32 @sub_matrix_sum([40 x [40 x i32]]* %5)                            ; inst 77
  call void @printlnInt(i32 %44)                                                   ; inst 78
  call void @memcpy([40 x [40 x i32]]* %6, [40 x [40 x i32]]* %39, i64 6400)       ; inst 79
  %45 = call i32 @diagonal_processing([40 x [40 x i32]]* %6)                       ; inst 80
  call void @printlnInt(i32 %45)                                                   ; inst 81
  %46 = alloca [40 x [40 x i32]]                                                   ; inst 82
  call void @memcpy([40 x [40 x i32]]* %7, [40 x [40 x i32]]* %39, i64 6400)       ; inst 83
  call void @transpose_and_add([40 x [40 x i32]]* %46, [40 x [40 x i32]]* %7)      ; inst 84
  call void @memcpy([40 x [40 x i32]]* %8, [40 x [40 x i32]]* %46, i64 6400)       ; inst 85
  %47 = call i32 @sub_matrix_sum([40 x [40 x i32]]* %8)                            ; inst 86
  call void @printlnInt(i32 %47)                                                   ; inst 87
  call void @memcpy([40 x [40 x i32]]* %9, [40 x [40 x i32]]* %46, i64 6400)       ; inst 88
  %48 = call i32 @diagonal_processing([40 x [40 x i32]]* %9)                       ; inst 89
  call void @printlnInt(i32 %48)                                                   ; inst 90
  %49 = alloca [40 x [40 x i32]]                                                   ; inst 91
  call void @memcpy([40 x [40 x i32]]* %10, [40 x [40 x i32]]* %46, i64 6400)      ; inst 92
  call void @memcpy([40 x [40 x i32]]* %11, [40 x [40 x i32]]* %13, i64 6400)      ; inst 93
  call void @matrix_multiply([40 x [40 x i32]]* %49, [40 x [40 x i32]]* %10, [40 x [40 x i32]]* %11) ; inst 94
  call void @memcpy([40 x [40 x i32]]* %12, [40 x [40 x i32]]* %49, i64 6400)      ; inst 95
  %50 = call i32 @sub_matrix_sum([40 x [40 x i32]]* %12)                           ; inst 96
  call void @printlnInt(i32 %50)                                                   ; inst 97
  br label %_16.while.cond.1                                                       ; inst 98
_16.while.cond.1:
  %51 = phi i32 [0, %_15.while.exit.0], [%74, %_23.while.exit.2]                   ; inst 99
  %52 = phi i32 [0, %_15.while.exit.0], [%54, %_23.while.exit.2]                   ; inst 100
  %53 = icmp slt i32 %51, 40                                                       ; inst 101
  br i1 %53, label %_17.while.body.1, label %_24.while.exit.1                      ; inst 102
_17.while.body.1:
  br label %_18.while.cond.2                                                       ; inst 103
_18.while.cond.2:
  %54 = phi i32 [%52, %_17.while.body.1], [%72, %_22.if.exit.0]                    ; inst 104
  %55 = phi i32 [0, %_17.while.body.1], [%73, %_22.if.exit.0]                      ; inst 105
  %56 = icmp slt i32 %55, 40                                                       ; inst 106
  br i1 %56, label %_19.while.body.2, label %_23.while.exit.2                      ; inst 107
_19.while.body.2:
  %57 = add i32 %51, %55                                                           ; inst 108
  %58 = srem i32 %57, 2                                                            ; inst 109
  %59 = icmp eq i32 %58, 0                                                         ; inst 110
  br i1 %59, label %_20.if.then.0, label %_21.if.else.0                            ; inst 111
_20.if.then.0:
  %60 = sext i32 %51 to i64                                                        ; inst 112
  %61 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %49, i32 0, i64 %60    ; inst 113
  %62 = sext i32 %55 to i64                                                        ; inst 114
  %63 = getelementptr [40 x i32], [40 x i32]* %61, i32 0, i64 %62                  ; inst 115
  %64 = load i32, i32* %63                                                         ; inst 116
  %65 = add i32 %54, %64                                                           ; inst 117
  br label %_22.if.exit.0                                                          ; inst 118
_21.if.else.0:
  %66 = sext i32 %51 to i64                                                        ; inst 119
  %67 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %49, i32 0, i64 %66    ; inst 120
  %68 = sext i32 %55 to i64                                                        ; inst 121
  %69 = getelementptr [40 x i32], [40 x i32]* %67, i32 0, i64 %68                  ; inst 122
  %70 = load i32, i32* %69                                                         ; inst 123
  %71 = sub i32 %54, %70                                                           ; inst 124
  br label %_22.if.exit.0                                                          ; inst 125
_22.if.exit.0:
  %72 = phi i32 [%65, %_20.if.then.0], [%71, %_21.if.else.0]                       ; inst 126
  %73 = add i32 %55, 1                                                             ; inst 127
  br label %_18.while.cond.2                                                       ; inst 128
_23.while.exit.2:
  %74 = add i32 %51, 1                                                             ; inst 129
  br label %_16.while.cond.1                                                       ; inst 130
_24.while.exit.1:
  call void @printlnInt(i32 %52)                                                   ; inst 131
  br label %_25.while.cond.3                                                       ; inst 132
_25.while.cond.3:
  %75 = phi i32 [0, %_24.while.exit.1], [%93, %_32.while.exit.4]                   ; inst 133
  %76 = icmp slt i32 %75, 40                                                       ; inst 134
  br i1 %76, label %_26.while.body.3, label %_33.while.exit.3                      ; inst 135
_26.while.body.3:
  br label %_27.while.cond.4                                                       ; inst 136
_27.while.cond.4:
  %77 = phi i32 [0, %_26.while.body.3], [%92, %_31.if.exit.1]                      ; inst 137
  %78 = phi i32 [-999999, %_26.while.body.3], [%91, %_31.if.exit.1]                ; inst 138
  %79 = icmp slt i32 %77, 40                                                       ; inst 139
  br i1 %79, label %_28.while.body.4, label %_32.while.exit.4                      ; inst 140
_28.while.body.4:
  %80 = sext i32 %75 to i64                                                        ; inst 141
  %81 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %49, i32 0, i64 %80    ; inst 142
  %82 = sext i32 %77 to i64                                                        ; inst 143
  %83 = getelementptr [40 x i32], [40 x i32]* %81, i32 0, i64 %82                  ; inst 144
  %84 = load i32, i32* %83                                                         ; inst 145
  %85 = icmp sgt i32 %84, %78                                                      ; inst 146
  br i1 %85, label %_29.if.then.1, label %_30.if.else.1                            ; inst 147
_29.if.then.1:
  %86 = sext i32 %75 to i64                                                        ; inst 148
  %87 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %49, i32 0, i64 %86    ; inst 149
  %88 = sext i32 %77 to i64                                                        ; inst 150
  %89 = getelementptr [40 x i32], [40 x i32]* %87, i32 0, i64 %88                  ; inst 151
  %90 = load i32, i32* %89                                                         ; inst 152
  br label %_31.if.exit.1                                                          ; inst 153
_30.if.else.1:
  br label %_31.if.exit.1                                                          ; inst 154
_31.if.exit.1:
  %91 = phi i32 [%90, %_29.if.then.1], [%78, %_30.if.else.1]                       ; inst 155
  %92 = add i32 %77, 1                                                             ; inst 156
  br label %_27.while.cond.4                                                       ; inst 157
_32.while.exit.4:
  call void @printlnInt(i32 %78)                                                   ; inst 158
  %93 = add i32 %75, 1                                                             ; inst 159
  br label %_25.while.cond.3                                                       ; inst 160
_33.while.exit.3:
  br label %_34.while.cond.5                                                       ; inst 161
_34.while.cond.5:
  %94 = phi i32 [0, %_33.while.exit.3], [%112, %_41.while.exit.6]                  ; inst 162
  %95 = icmp slt i32 %94, 40                                                       ; inst 163
  br i1 %95, label %_35.while.body.5, label %_42.while.exit.5                      ; inst 164
_35.while.body.5:
  br label %_36.while.cond.6                                                       ; inst 165
_36.while.cond.6:
  %96 = phi i32 [0, %_35.while.body.5], [%111, %_40.if.exit.2]                     ; inst 166
  %97 = phi i32 [999999, %_35.while.body.5], [%110, %_40.if.exit.2]                ; inst 167
  %98 = icmp slt i32 %96, 40                                                       ; inst 168
  br i1 %98, label %_37.while.body.6, label %_41.while.exit.6                      ; inst 169
_37.while.body.6:
  %99 = sext i32 %96 to i64                                                        ; inst 170
  %100 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %49, i32 0, i64 %99   ; inst 171
  %101 = sext i32 %94 to i64                                                       ; inst 172
  %102 = getelementptr [40 x i32], [40 x i32]* %100, i32 0, i64 %101               ; inst 173
  %103 = load i32, i32* %102                                                       ; inst 174
  %104 = icmp slt i32 %103, %97                                                    ; inst 175
  br i1 %104, label %_38.if.then.2, label %_39.if.else.2                           ; inst 176
_38.if.then.2:
  %105 = sext i32 %96 to i64                                                       ; inst 177
  %106 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %49, i32 0, i64 %105  ; inst 178
  %107 = sext i32 %94 to i64                                                       ; inst 179
  %108 = getelementptr [40 x i32], [40 x i32]* %106, i32 0, i64 %107               ; inst 180
  %109 = load i32, i32* %108                                                       ; inst 181
  br label %_40.if.exit.2                                                          ; inst 182
_39.if.else.2:
  br label %_40.if.exit.2                                                          ; inst 183
_40.if.exit.2:
  %110 = phi i32 [%109, %_38.if.then.2], [%97, %_39.if.else.2]                     ; inst 184
  %111 = add i32 %96, 1                                                            ; inst 185
  br label %_36.while.cond.6                                                       ; inst 186
_41.while.exit.6:
  call void @printlnInt(i32 %97)                                                   ; inst 187
  %112 = add i32 %94, 1                                                            ; inst 188
  br label %_34.while.cond.5                                                       ; inst 189
_42.while.exit.5:
  %113 = alloca [40 x [40 x i32]]                                                  ; inst 190
  call void @memcpy([40 x [40 x i32]]* %113, [40 x [40 x i32]]* %13, i64 6400)     ; inst 191
  br label %_43.while.cond.7                                                       ; inst 192
_43.while.cond.7:
  %114 = phi i32 [0, %_42.while.exit.5], [%137, %_47.while.exit.8]                 ; inst 193
  %115 = icmp slt i32 %114, 40                                                     ; inst 194
  br i1 %115, label %_44.while.body.7, label %_48.while.exit.7                     ; inst 195
_44.while.body.7:
  br label %_45.while.cond.8                                                       ; inst 196
_45.while.cond.8:
  %116 = phi i32 [0, %_44.while.body.7], [%136, %_46.while.body.8]                 ; inst 197
  %117 = icmp slt i32 %116, 40                                                     ; inst 198
  br i1 %117, label %_46.while.body.8, label %_47.while.exit.8                     ; inst 199
_46.while.body.8:
  %118 = sext i32 %114 to i64                                                      ; inst 200
  %119 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %113, i32 0, i64 %118 ; inst 201
  %120 = sext i32 %116 to i64                                                      ; inst 202
  %121 = getelementptr [40 x i32], [40 x i32]* %119, i32 0, i64 %120               ; inst 203
  %122 = load i32, i32* %121                                                       ; inst 204
  %123 = sext i32 %114 to i64                                                      ; inst 205
  %124 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %113, i32 0, i64 %123 ; inst 206
  %125 = sext i32 %116 to i64                                                      ; inst 207
  %126 = getelementptr [40 x i32], [40 x i32]* %124, i32 0, i64 %125               ; inst 208
  %127 = sext i32 %116 to i64                                                      ; inst 209
  %128 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %113, i32 0, i64 %127 ; inst 210
  %129 = sext i32 %114 to i64                                                      ; inst 211
  %130 = getelementptr [40 x i32], [40 x i32]* %128, i32 0, i64 %129               ; inst 212
  %131 = load i32, i32* %130                                                       ; inst 213
  store i32 %131, i32* %126                                                        ; inst 214
  %132 = sext i32 %116 to i64                                                      ; inst 215
  %133 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %113, i32 0, i64 %132 ; inst 216
  %134 = sext i32 %114 to i64                                                      ; inst 217
  %135 = getelementptr [40 x i32], [40 x i32]* %133, i32 0, i64 %134               ; inst 218
  store i32 %122, i32* %135                                                        ; inst 219
  %136 = add i32 %116, 1                                                           ; inst 220
  br label %_45.while.cond.8                                                       ; inst 221
_47.while.exit.8:
  %137 = add i32 %114, 1                                                           ; inst 222
  br label %_43.while.cond.7                                                       ; inst 223
_48.while.exit.7:
  br label %_49.while.cond.9                                                       ; inst 224
_49.while.cond.9:
  %138 = phi i32 [0, %_48.while.exit.7], [%141, %_53.while.exit.10]                ; inst 225
  %139 = phi i32 [0, %_48.while.exit.7], [%151, %_53.while.exit.10]                ; inst 226
  %140 = icmp slt i32 %139, 40                                                     ; inst 227
  br i1 %140, label %_50.while.body.9, label %_54.while.exit.9                     ; inst 228
_50.while.body.9:
  br label %_51.while.cond.10                                                      ; inst 229
_51.while.cond.10:
  %141 = phi i32 [%138, %_50.while.body.9], [%149, %_52.while.body.10]             ; inst 230
  %142 = phi i32 [0, %_50.while.body.9], [%150, %_52.while.body.10]                ; inst 231
  %143 = icmp slt i32 %142, 40                                                     ; inst 232
  br i1 %143, label %_52.while.body.10, label %_53.while.exit.10                   ; inst 233
_52.while.body.10:
  %144 = sext i32 %139 to i64                                                      ; inst 234
  %145 = getelementptr [40 x [40 x i32]], [40 x [40 x i32]]* %113, i32 0, i64 %144 ; inst 235
  %146 = sext i32 %142 to i64                                                      ; inst 236
  %147 = getelementptr [40 x i32], [40 x i32]* %145, i32 0, i64 %146               ; inst 237
  %148 = load i32, i32* %147                                                       ; inst 238
  %149 = add i32 %141, %148                                                        ; inst 239
  %150 = add i32 %142, 1                                                           ; inst 240
  br label %_51.while.cond.10                                                      ; inst 241
_53.while.exit.10:
  %151 = add i32 %139, 1                                                           ; inst 242
  br label %_49.while.cond.9                                                       ; inst 243
_54.while.exit.9:
  call void @printlnInt(i32 %138)                                                  ; inst 244
  call void @exit(i32 0)                                                           ; inst 245
  ret void                                                                         ; inst 246
}

