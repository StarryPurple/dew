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



define void @generate_input([512 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%14, %_5.if.exit.0]                              ; inst 2
  %2 = icmp slt i32 %1, 512                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = srem i32 %1, 20                                                             ; inst 5
  %4 = icmp slt i32 %3, 10                                                         ; inst 6
  br i1 %4, label %_3.if.then.0, label %_4.if.else.0                               ; inst 7
_3.if.then.0:
  %5 = sext i32 %1 to i64                                                          ; inst 8
  %6 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %5                   ; inst 9
  %7 = srem i32 %1, 10                                                             ; inst 10
  %8 = add i32 %7, 65                                                              ; inst 11
  store i32 %8, i32* %6                                                            ; inst 12
  br label %_5.if.exit.0                                                           ; inst 13
_4.if.else.0:
  %9 = sext i32 %1 to i64                                                          ; inst 14
  %10 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %9                  ; inst 15
  %11 = mul i32 %1, 17                                                             ; inst 16
  %12 = srem i32 %11, 15                                                           ; inst 17
  %13 = add i32 %12, 97                                                            ; inst 18
  store i32 %13, i32* %10                                                          ; inst 19
  br label %_5.if.exit.0                                                           ; inst 20
_5.if.exit.0:
  %14 = add i32 %1, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 23
_7.while.cond.1:
  %15 = phi i32 [100, %_6.while.exit.0], [%23, %_8.while.body.1]                   ; inst 24
  %16 = icmp slt i32 %15, 120                                                      ; inst 25
  br i1 %16, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 26
_8.while.body.1:
  %17 = sext i32 %15 to i64                                                        ; inst 27
  %18 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %17                 ; inst 28
  %19 = sext i32 %15 to i64                                                        ; inst 29
  %20 = sub i64 %19, 20                                                            ; inst 30
  %21 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %20                 ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  store i32 %22, i32* %18                                                          ; inst 33
  %23 = add i32 %15, 1                                                             ; inst 34
  br label %_7.while.cond.1                                                        ; inst 35
_9.while.exit.1:
  br label %_10.while.cond.2                                                       ; inst 36
_10.while.cond.2:
  %24 = phi i32 [300, %_9.while.exit.1], [%32, %_11.while.body.2]                  ; inst 37
  %25 = icmp slt i32 %24, 330                                                      ; inst 38
  br i1 %25, label %_11.while.body.2, label %_12.while.exit.2                      ; inst 39
_11.while.body.2:
  %26 = sext i32 %24 to i64                                                        ; inst 40
  %27 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %26                 ; inst 41
  %28 = sext i32 %24 to i64                                                        ; inst 42
  %29 = sub i64 %28, 30                                                            ; inst 43
  %30 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %29                 ; inst 44
  %31 = load i32, i32* %30                                                         ; inst 45
  store i32 %31, i32* %27                                                          ; inst 46
  %32 = add i32 %24, 1                                                             ; inst 47
  br label %_10.while.cond.2                                                       ; inst 48
_12.while.exit.2:
  ret void                                                                         ; inst 49
}

define i32 @find_longest_match([512 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = sub i32 %1, 1                                                               ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [%3, %_0.entry.0], [%28, %_14.if.exit.0]                            ; inst 3
  %5 = phi i32 [0, %_0.entry.0], [%26, %_14.if.exit.0]                             ; inst 4
  %6 = phi i32 [0, %_0.entry.0], [%27, %_14.if.exit.0]                             ; inst 5
  %7 = icmp sge i32 %4, %2                                                         ; inst 6
  br i1 %7, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %8 = phi i32 [0, %_2.while.body.0], [%23, %_10.while.body.1]                     ; inst 9
  %9 = add i32 %1, %8                                                              ; inst 10
  %10 = icmp slt i32 %9, 512                                                       ; inst 11
  br i1 %10, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 12
_4.lazy.then.0:
  %11 = icmp slt i32 %8, 18                                                        ; inst 13
  br label %_6.lazy.exit.0                                                         ; inst 14
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 15
_6.lazy.exit.0:
  %12 = phi i1 [%11, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 16
  br i1 %12, label %_7.lazy.then.1, label %_8.lazy.else.1                          ; inst 17
_7.lazy.then.1:
  %13 = add i32 %4, %8                                                             ; inst 18
  %14 = sext i32 %13 to i64                                                        ; inst 19
  %15 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %14                 ; inst 20
  %16 = load i32, i32* %15                                                         ; inst 21
  %17 = add i32 %1, %8                                                             ; inst 22
  %18 = sext i32 %17 to i64                                                        ; inst 23
  %19 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %18                 ; inst 24
  %20 = load i32, i32* %19                                                         ; inst 25
  %21 = icmp eq i32 %16, %20                                                       ; inst 26
  br label %_9.lazy.exit.1                                                         ; inst 27
_8.lazy.else.1:
  br label %_9.lazy.exit.1                                                         ; inst 28
_9.lazy.exit.1:
  %22 = phi i1 [%21, %_7.lazy.then.1], [0, %_8.lazy.else.1]                        ; inst 29
  br i1 %22, label %_10.while.body.1, label %_11.while.exit.1                      ; inst 30
_10.while.body.1:
  %23 = add i32 %8, 1                                                              ; inst 31
  br label %_3.while.cond.1                                                        ; inst 32
_11.while.exit.1:
  %24 = icmp sgt i32 %8, %6                                                        ; inst 33
  br i1 %24, label %_12.if.then.0, label %_13.if.else.0                            ; inst 34
_12.if.then.0:
  %25 = sub i32 %1, %4                                                             ; inst 35
  br label %_14.if.exit.0                                                          ; inst 36
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 37
_14.if.exit.0:
  %26 = phi i32 [%25, %_12.if.then.0], [%5, %_13.if.else.0]                        ; inst 38
  %27 = phi i32 [%8, %_12.if.then.0], [%6, %_13.if.else.0]                         ; inst 39
  %28 = sub i32 %4, 1                                                              ; inst 40
  br label %_1.while.cond.0                                                        ; inst 41
_15.while.exit.0:
  %29 = icmp sge i32 %6, 3                                                         ; inst 42
  br i1 %29, label %_16.if.then.1, label %_17.if.else.1                            ; inst 43
_16.if.then.1:
  %30 = mul i32 %5, 1000                                                           ; inst 44
  %31 = add i32 %30, %6                                                            ; inst 45
  ret i32 %31                                                                      ; inst 46
_17.if.else.1:
  br label %_18.if.exit.1                                                          ; inst 47
_18.if.exit.1:
  ret i32 0                                                                        ; inst 48
}

define void @main() {
_0.entry.0:
  %0 = alloca [512 x i32]                                                          ; inst 1
  %1 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 512                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [512 x i32]                                                          ; inst 11
  %7 = getelementptr [512 x i32], [512 x i32]* %6, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 512                                                        ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  call void @generate_input([512 x i32]* %0)                                       ; inst 21
  br label %_7.while.cond.0                                                        ; inst 22
_7.while.cond.0:
  %12 = phi i32 [0, %_6.array.exit.1], [%44, %_17.if.exit.1]                       ; inst 23
  %13 = phi i32 [0, %_6.array.exit.1], [%45, %_17.if.exit.1]                       ; inst 24
  %14 = icmp slt i32 %13, 512                                                      ; inst 25
  br i1 %14, label %_8.while.body.0, label %_18.while.exit.0                       ; inst 26
_8.while.body.0:
  %15 = icmp sgt i32 %13, 128                                                      ; inst 27
  br i1 %15, label %_9.if.then.0, label %_10.if.else.0                             ; inst 28
_9.if.then.0:
  %16 = sub i32 %13, 128                                                           ; inst 29
  br label %_11.if.exit.0                                                          ; inst 30
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 31
_11.if.exit.0:
  %17 = phi i32 [%16, %_9.if.then.0], [0, %_10.if.else.0]                          ; inst 32
  %18 = call i32 @find_longest_match([512 x i32]* %0, i32 %13, i32 %17)            ; inst 33
  %19 = icmp sgt i32 %18, 0                                                        ; inst 34
  br i1 %19, label %_12.if.then.1, label %_13.if.else.1                            ; inst 35
_12.if.then.1:
  %20 = sdiv i32 %18, 1000                                                         ; inst 36
  %21 = srem i32 %18, 1000                                                         ; inst 37
  %22 = sext i32 %12 to i64                                                        ; inst 38
  %23 = getelementptr [512 x i32], [512 x i32]* %6, i32 0, i64 %22                 ; inst 39
  store i32 1, i32* %23                                                            ; inst 40
  %24 = add i32 %12, 1                                                             ; inst 41
  %25 = sext i32 %24 to i64                                                        ; inst 42
  %26 = getelementptr [512 x i32], [512 x i32]* %6, i32 0, i64 %25                 ; inst 43
  store i32 %20, i32* %26                                                          ; inst 44
  %27 = add i32 %24, 1                                                             ; inst 45
  %28 = sext i32 %27 to i64                                                        ; inst 46
  %29 = getelementptr [512 x i32], [512 x i32]* %6, i32 0, i64 %28                 ; inst 47
  store i32 %21, i32* %29                                                          ; inst 48
  %30 = add i32 %27, 1                                                             ; inst 49
  %31 = add i32 %13, %21                                                           ; inst 50
  br label %_17.if.exit.1                                                          ; inst 51
_13.if.else.1:
  %32 = sext i32 %13 to i64                                                        ; inst 52
  %33 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %32                 ; inst 53
  %34 = load i32, i32* %33                                                         ; inst 54
  %35 = icmp slt i32 %12, 510                                                      ; inst 55
  br i1 %35, label %_14.if.then.2, label %_15.if.else.2                            ; inst 56
_14.if.then.2:
  %36 = sext i32 %12 to i64                                                        ; inst 57
  %37 = getelementptr [512 x i32], [512 x i32]* %6, i32 0, i64 %36                 ; inst 58
  store i32 0, i32* %37                                                            ; inst 59
  %38 = add i32 %12, 1                                                             ; inst 60
  br label %_16.if.exit.2                                                          ; inst 61
_15.if.else.2:
  br label %_16.if.exit.2                                                          ; inst 62
_16.if.exit.2:
  %39 = phi i32 [%38, %_14.if.then.2], [%12, %_15.if.else.2]                       ; inst 63
  %40 = sext i32 %39 to i64                                                        ; inst 64
  %41 = getelementptr [512 x i32], [512 x i32]* %6, i32 0, i64 %40                 ; inst 65
  store i32 %34, i32* %41                                                          ; inst 66
  %42 = add i32 %39, 1                                                             ; inst 67
  %43 = add i32 %13, 1                                                             ; inst 68
  br label %_17.if.exit.1                                                          ; inst 69
_17.if.exit.1:
  %44 = phi i32 [%30, %_12.if.then.1], [%42, %_16.if.exit.2]                       ; inst 70
  %45 = phi i32 [%31, %_12.if.then.1], [%43, %_16.if.exit.2]                       ; inst 71
  br label %_7.while.cond.0                                                        ; inst 72
_18.while.exit.0:
  br label %_19.while.cond.1                                                       ; inst 73
_19.while.cond.1:
  %46 = phi i32 [0, %_18.while.exit.0], [%55, %_20.while.body.1]                   ; inst 74
  %47 = phi i32 [0, %_18.while.exit.0], [%54, %_20.while.body.1]                   ; inst 75
  %48 = icmp slt i32 %46, %12                                                      ; inst 76
  br i1 %48, label %_20.while.body.1, label %_21.while.exit.1                      ; inst 77
_20.while.body.1:
  %49 = sext i32 %46 to i64                                                        ; inst 78
  %50 = getelementptr [512 x i32], [512 x i32]* %6, i32 0, i64 %49                 ; inst 79
  %51 = load i32, i32* %50                                                         ; inst 80
  %52 = add i32 %46, 1                                                             ; inst 81
  %53 = mul i32 %51, %52                                                           ; inst 82
  %54 = add i32 %47, %53                                                           ; inst 83
  %55 = add i32 %46, 1                                                             ; inst 84
  br label %_19.while.cond.1                                                       ; inst 85
_21.while.exit.1:
  call void @printlnInt(i32 %47)                                                   ; inst 86
  call void @printlnInt(i32 %12)                                                   ; inst 87
  call void @exit(i32 0)                                                           ; inst 88
  ret void                                                                         ; inst 89
}

