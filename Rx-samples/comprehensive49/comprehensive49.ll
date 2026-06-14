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
  %0 = alloca [1024 x i32]                                                         ; inst 1
  %1 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 1024                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 0                  ; inst 11
  store i32 1, i32* %6                                                             ; inst 12
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 1                  ; inst 13
  store i32 1020, i32* %7                                                          ; inst 14
  %8 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 2                  ; inst 15
  store i32 -1, i32* %8                                                            ; inst 16
  %9 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 3                  ; inst 17
  store i32 -1, i32* %9                                                            ; inst 18
  %10 = call i32 @allocate([1024 x i32]* %0, i32 256)                              ; inst 19
  call void @printlnInt(i32 %10)                                                   ; inst 20
  %11 = call i32 @allocate([1024 x i32]* %0, i32 128)                              ; inst 21
  call void @printlnInt(i32 %11)                                                   ; inst 22
  %12 = call i32 @allocate([1024 x i32]* %0, i32 512)                              ; inst 23
  call void @printlnInt(i32 %12)                                                   ; inst 24
  call void @deallocate([1024 x i32]* %0, i32 %11)                                 ; inst 25
  %13 = call i32 @allocate([1024 x i32]* %0, i32 64)                               ; inst 26
  call void @printlnInt(i32 %13)                                                   ; inst 27
  call void @deallocate([1024 x i32]* %0, i32 %10)                                 ; inst 28
  call void @deallocate([1024 x i32]* %0, i32 %12)                                 ; inst 29
  %14 = call i32 @allocate([1024 x i32]* %0, i32 768)                              ; inst 30
  call void @printlnInt(i32 %14)                                                   ; inst 31
  br label %_4.while.cond.0                                                        ; inst 32
_4.while.cond.0:
  %15 = phi i32 [0, %_3.array.exit.0], [%19, %_8.if.exit.0]                        ; inst 33
  %16 = icmp slt i32 %15, 10                                                       ; inst 34
  br i1 %16, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 35
_5.while.body.0:
  %17 = call i32 @allocate([1024 x i32]* %0, i32 10)                               ; inst 36
  %18 = icmp eq i32 %17, -1                                                        ; inst 37
  br i1 %18, label %_6.if.then.0, label %_7.if.else.0                              ; inst 38
_6.if.then.0:
  call void @deallocate([1024 x i32]* %0, i32 %13)                                 ; inst 39
  br label %_8.if.exit.0                                                           ; inst 40
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 41
_8.if.exit.0:
  %19 = add i32 %15, 1                                                             ; inst 42
  br label %_4.while.cond.0                                                        ; inst 43
_9.while.exit.0:
  call void @print_memory_state([1024 x i32]* %0)                                  ; inst 44
  call void @exit(i32 0)                                                           ; inst 45
  ret void                                                                         ; inst 46
}

define i32 @allocate([1024 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 2
  %3 = phi i32 [-1, %_0.entry.0], [%20, %_11.if.exit.0]                            ; inst 3
  %4 = phi i32 [1025, %_0.entry.0], [%21, %_11.if.exit.0]                          ; inst 4
  %5 = icmp ne i32 %2, -1                                                          ; inst 5
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = add i64 %9, 1                                                              ; inst 11
  %11 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %10               ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  %13 = icmp eq i32 %8, 1                                                          ; inst 14
  br i1 %13, label %_3.if.then.0, label %_10.if.else.0                             ; inst 15
_3.if.then.0:
  %14 = icmp sge i32 %12, %1                                                       ; inst 16
  br i1 %14, label %_4.if.then.1, label %_8.if.else.1                              ; inst 17
_4.if.then.1:
  %15 = icmp slt i32 %12, %4                                                       ; inst 18
  br i1 %15, label %_5.if.then.2, label %_6.if.else.2                              ; inst 19
_5.if.then.2:
  br label %_7.if.exit.2                                                           ; inst 20
_6.if.else.2:
  br label %_7.if.exit.2                                                           ; inst 21
_7.if.exit.2:
  %16 = phi i32 [%2, %_5.if.then.2], [%3, %_6.if.else.2]                           ; inst 22
  %17 = phi i32 [%12, %_5.if.then.2], [%4, %_6.if.else.2]                          ; inst 23
  br label %_9.if.exit.1                                                           ; inst 24
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 25
_9.if.exit.1:
  %18 = phi i32 [%16, %_7.if.exit.2], [%3, %_8.if.else.1]                          ; inst 26
  %19 = phi i32 [%17, %_7.if.exit.2], [%4, %_8.if.else.1]                          ; inst 27
  br label %_11.if.exit.0                                                          ; inst 28
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 29
_11.if.exit.0:
  %20 = phi i32 [%18, %_9.if.exit.1], [%3, %_10.if.else.0]                         ; inst 30
  %21 = phi i32 [%19, %_9.if.exit.1], [%4, %_10.if.else.0]                         ; inst 31
  %22 = sext i32 %2 to i64                                                         ; inst 32
  %23 = add i64 %22, 3                                                             ; inst 33
  %24 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %23               ; inst 34
  %25 = load i32, i32* %24                                                         ; inst 35
  br label %_1.while.cond.0                                                        ; inst 36
_12.while.exit.0:
  %26 = icmp ne i32 %3, -1                                                         ; inst 37
  br i1 %26, label %_13.if.then.3, label %_20.if.else.3                            ; inst 38
_13.if.then.3:
  %27 = sext i32 %3 to i64                                                         ; inst 39
  %28 = add i64 %27, 1                                                             ; inst 40
  %29 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %28               ; inst 41
  %30 = load i32, i32* %29                                                         ; inst 42
  %31 = sub i32 %30, %1                                                            ; inst 43
  %32 = sub i32 %31, 4                                                             ; inst 44
  %33 = icmp sgt i32 %32, 8                                                        ; inst 45
  br i1 %33, label %_14.if.then.4, label %_18.if.else.4                            ; inst 46
_14.if.then.4:
  %34 = sext i32 %3 to i64                                                         ; inst 47
  %35 = add i64 %34, 1                                                             ; inst 48
  %36 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %35               ; inst 49
  store i32 %1, i32* %36                                                           ; inst 50
  %37 = sext i32 %3 to i64                                                         ; inst 51
  %38 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %37               ; inst 52
  store i32 0, i32* %38                                                            ; inst 53
  %39 = add i32 %3, %1                                                             ; inst 54
  %40 = add i32 %39, 4                                                             ; inst 55
  %41 = sext i32 %40 to i64                                                        ; inst 56
  %42 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %41               ; inst 57
  store i32 1, i32* %42                                                            ; inst 58
  %43 = sext i32 %40 to i64                                                        ; inst 59
  %44 = add i64 %43, 1                                                             ; inst 60
  %45 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %44               ; inst 61
  store i32 %32, i32* %45                                                          ; inst 62
  %46 = sext i32 %40 to i64                                                        ; inst 63
  %47 = add i64 %46, 2                                                             ; inst 64
  %48 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %47               ; inst 65
  store i32 %3, i32* %48                                                           ; inst 66
  %49 = sext i32 %40 to i64                                                        ; inst 67
  %50 = add i64 %49, 3                                                             ; inst 68
  %51 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %50               ; inst 69
  %52 = sext i32 %3 to i64                                                         ; inst 70
  %53 = add i64 %52, 3                                                             ; inst 71
  %54 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %53               ; inst 72
  %55 = load i32, i32* %54                                                         ; inst 73
  store i32 %55, i32* %51                                                          ; inst 74
  %56 = sext i32 %3 to i64                                                         ; inst 75
  %57 = add i64 %56, 3                                                             ; inst 76
  %58 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %57               ; inst 77
  %59 = load i32, i32* %58                                                         ; inst 78
  %60 = icmp ne i32 %59, -1                                                        ; inst 79
  br i1 %60, label %_15.if.then.5, label %_16.if.else.5                            ; inst 80
_15.if.then.5:
  %61 = sext i32 %59 to i64                                                        ; inst 81
  %62 = add i64 %61, 2                                                             ; inst 82
  %63 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %62               ; inst 83
  store i32 %40, i32* %63                                                          ; inst 84
  br label %_17.if.exit.5                                                          ; inst 85
_16.if.else.5:
  br label %_17.if.exit.5                                                          ; inst 86
_17.if.exit.5:
  %64 = sext i32 %3 to i64                                                         ; inst 87
  %65 = add i64 %64, 3                                                             ; inst 88
  %66 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %65               ; inst 89
  store i32 %40, i32* %66                                                          ; inst 90
  br label %_19.if.exit.4                                                          ; inst 91
_18.if.else.4:
  %67 = sext i32 %3 to i64                                                         ; inst 92
  %68 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %67               ; inst 93
  store i32 0, i32* %68                                                            ; inst 94
  br label %_19.if.exit.4                                                          ; inst 95
_19.if.exit.4:
  %69 = add i32 %3, 4                                                              ; inst 96
  ret i32 %69                                                                      ; inst 97
_20.if.else.3:
  br label %_21.if.exit.3                                                          ; inst 98
_21.if.exit.3:
  ret i32 -1                                                                       ; inst 99
}

define void @deallocate([1024 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp slt i32 %1, 4                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = sub i32 %1, 4                                                               ; inst 5
  %4 = sext i32 %3 to i64                                                          ; inst 6
  %5 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %4                 ; inst 7
  store i32 1, i32* %5                                                             ; inst 8
  %6 = sext i32 %3 to i64                                                          ; inst 9
  %7 = add i64 %6, 3                                                               ; inst 10
  %8 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %7                 ; inst 11
  %9 = load i32, i32* %8                                                           ; inst 12
  %10 = icmp ne i32 %9, -1                                                         ; inst 13
  br i1 %10, label %_4.if.then.1, label %_11.if.else.1                             ; inst 14
_4.if.then.1:
  %11 = sext i32 %9 to i64                                                         ; inst 15
  %12 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %11               ; inst 16
  %13 = load i32, i32* %12                                                         ; inst 17
  %14 = icmp eq i32 %13, 1                                                         ; inst 18
  br i1 %14, label %_5.if.then.2, label %_9.if.else.2                              ; inst 19
_5.if.then.2:
  %15 = sext i32 %9 to i64                                                         ; inst 20
  %16 = add i64 %15, 1                                                             ; inst 21
  %17 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %16               ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = sext i32 %3 to i64                                                         ; inst 24
  %20 = add i64 %19, 1                                                             ; inst 25
  %21 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %20               ; inst 26
  %22 = sext i32 %3 to i64                                                         ; inst 27
  %23 = add i64 %22, 1                                                             ; inst 28
  %24 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %23               ; inst 29
  %25 = load i32, i32* %24                                                         ; inst 30
  %26 = add i32 %25, %18                                                           ; inst 31
  %27 = add i32 %26, 4                                                             ; inst 32
  store i32 %27, i32* %21                                                          ; inst 33
  %28 = sext i32 %9 to i64                                                         ; inst 34
  %29 = add i64 %28, 3                                                             ; inst 35
  %30 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %29               ; inst 36
  %31 = load i32, i32* %30                                                         ; inst 37
  %32 = sext i32 %3 to i64                                                         ; inst 38
  %33 = add i64 %32, 3                                                             ; inst 39
  %34 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %33               ; inst 40
  store i32 %31, i32* %34                                                          ; inst 41
  %35 = icmp ne i32 %31, -1                                                        ; inst 42
  br i1 %35, label %_6.if.then.3, label %_7.if.else.3                              ; inst 43
_6.if.then.3:
  %36 = sext i32 %31 to i64                                                        ; inst 44
  %37 = add i64 %36, 2                                                             ; inst 45
  %38 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %37               ; inst 46
  store i32 %3, i32* %38                                                           ; inst 47
  br label %_8.if.exit.3                                                           ; inst 48
_7.if.else.3:
  br label %_8.if.exit.3                                                           ; inst 49
_8.if.exit.3:
  br label %_10.if.exit.2                                                          ; inst 50
_9.if.else.2:
  br label %_10.if.exit.2                                                          ; inst 51
_10.if.exit.2:
  br label %_12.if.exit.1                                                          ; inst 52
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 53
_12.if.exit.1:
  %39 = sext i32 %3 to i64                                                         ; inst 54
  %40 = add i64 %39, 2                                                             ; inst 55
  %41 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %40               ; inst 56
  %42 = load i32, i32* %41                                                         ; inst 57
  %43 = icmp ne i32 %42, -1                                                        ; inst 58
  br i1 %43, label %_13.if.then.4, label %_20.if.else.4                            ; inst 59
_13.if.then.4:
  %44 = sext i32 %42 to i64                                                        ; inst 60
  %45 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %44               ; inst 61
  %46 = load i32, i32* %45                                                         ; inst 62
  %47 = icmp eq i32 %46, 1                                                         ; inst 63
  br i1 %47, label %_14.if.then.5, label %_18.if.else.5                            ; inst 64
_14.if.then.5:
  %48 = sext i32 %3 to i64                                                         ; inst 65
  %49 = add i64 %48, 1                                                             ; inst 66
  %50 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %49               ; inst 67
  %51 = load i32, i32* %50                                                         ; inst 68
  %52 = sext i32 %42 to i64                                                        ; inst 69
  %53 = add i64 %52, 1                                                             ; inst 70
  %54 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %53               ; inst 71
  %55 = sext i32 %42 to i64                                                        ; inst 72
  %56 = add i64 %55, 1                                                             ; inst 73
  %57 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %56               ; inst 74
  %58 = load i32, i32* %57                                                         ; inst 75
  %59 = add i32 %58, %51                                                           ; inst 76
  %60 = add i32 %59, 4                                                             ; inst 77
  store i32 %60, i32* %54                                                          ; inst 78
  %61 = sext i32 %3 to i64                                                         ; inst 79
  %62 = add i64 %61, 3                                                             ; inst 80
  %63 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %62               ; inst 81
  %64 = load i32, i32* %63                                                         ; inst 82
  %65 = sext i32 %42 to i64                                                        ; inst 83
  %66 = add i64 %65, 3                                                             ; inst 84
  %67 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %66               ; inst 85
  store i32 %64, i32* %67                                                          ; inst 86
  %68 = icmp ne i32 %64, -1                                                        ; inst 87
  br i1 %68, label %_15.if.then.6, label %_16.if.else.6                            ; inst 88
_15.if.then.6:
  %69 = sext i32 %64 to i64                                                        ; inst 89
  %70 = add i64 %69, 2                                                             ; inst 90
  %71 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %70               ; inst 91
  store i32 %42, i32* %71                                                          ; inst 92
  br label %_17.if.exit.6                                                          ; inst 93
_16.if.else.6:
  br label %_17.if.exit.6                                                          ; inst 94
_17.if.exit.6:
  br label %_19.if.exit.5                                                          ; inst 95
_18.if.else.5:
  br label %_19.if.exit.5                                                          ; inst 96
_19.if.exit.5:
  br label %_21.if.exit.4                                                          ; inst 97
_20.if.else.4:
  br label %_21.if.exit.4                                                          ; inst 98
_21.if.exit.4:
  ret void                                                                         ; inst 99
}

define void @print_memory_state([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%17, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%18, %_5.if.exit.0]                              ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%19, %_5.if.exit.0]                              ; inst 4
  %4 = phi i32 [0, %_0.entry.0], [%23, %_5.if.exit.0]                              ; inst 5
  %5 = icmp ne i32 %4, -1                                                          ; inst 6
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 7
_2.while.body.0:
  %6 = sext i32 %4 to i64                                                          ; inst 8
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = sext i32 %4 to i64                                                          ; inst 11
  %10 = add i64 %9, 1                                                              ; inst 12
  %11 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %10               ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = icmp eq i32 %8, 1                                                          ; inst 15
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 16
_3.if.then.0:
  %14 = add i32 %3, %12                                                            ; inst 17
  %15 = add i32 %1, 1                                                              ; inst 18
  br label %_5.if.exit.0                                                           ; inst 19
_4.if.else.0:
  %16 = add i32 %2, %12                                                            ; inst 20
  br label %_5.if.exit.0                                                           ; inst 21
_5.if.exit.0:
  %17 = phi i32 [%15, %_3.if.then.0], [%1, %_4.if.else.0]                          ; inst 22
  %18 = phi i32 [%2, %_3.if.then.0], [%16, %_4.if.else.0]                          ; inst 23
  %19 = phi i32 [%14, %_3.if.then.0], [%3, %_4.if.else.0]                          ; inst 24
  %20 = sext i32 %4 to i64                                                         ; inst 25
  %21 = add i64 %20, 3                                                             ; inst 26
  %22 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %21               ; inst 27
  %23 = load i32, i32* %22                                                         ; inst 28
  br label %_1.while.cond.0                                                        ; inst 29
_6.while.exit.0:
  call void @printlnInt(i32 %3)                                                    ; inst 30
  call void @printlnInt(i32 %2)                                                    ; inst 31
  call void @printlnInt(i32 %1)                                                    ; inst 32
  ret void                                                                         ; inst 33
}

define i32 @deep_recursive_check([1024 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sle i32 %1, 0                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = icmp eq i32 %2, -1                                                          ; inst 5
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 0                                                                        ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  %5 = sext i32 %2 to i64                                                          ; inst 9
  %6 = add i64 %5, 1                                                               ; inst 10
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 11
  %8 = load i32, i32* %7                                                           ; inst 12
  %9 = icmp sgt i32 %8, 100                                                        ; inst 13
  br i1 %9, label %_7.if.then.2, label %_8.if.else.2                               ; inst 14
_7.if.then.2:
  %10 = sub i32 %1, 1                                                              ; inst 15
  %11 = sext i32 %2 to i64                                                         ; inst 16
  %12 = add i64 %11, 3                                                             ; inst 17
  %13 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %12               ; inst 18
  %14 = load i32, i32* %13                                                         ; inst 19
  %15 = call i32 @deep_recursive_check([1024 x i32]* %0, i32 %10, i32 %14)         ; inst 20
  br label %_9.if.exit.2                                                           ; inst 21
_8.if.else.2:
  %16 = sub i32 %1, 1                                                              ; inst 22
  %17 = sext i32 %2 to i64                                                         ; inst 23
  %18 = add i64 %17, 2                                                             ; inst 24
  %19 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %18               ; inst 25
  %20 = load i32, i32* %19                                                         ; inst 26
  %21 = call i32 @deep_recursive_check([1024 x i32]* %0, i32 %16, i32 %20)         ; inst 27
  br label %_9.if.exit.2                                                           ; inst 28
_9.if.exit.2:
  %22 = phi i32 [%15, %_7.if.then.2], [%21, %_8.if.else.2]                         ; inst 29
  ret i32 %22                                                                      ; inst 30
}

define i32 @another_utility_function([1024 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%26, %_8.if.exit.0]                              ; inst 2
  %3 = phi i32 [%1, %_0.entry.0], [%30, %_8.if.exit.0]                             ; inst 3
  %4 = icmp ne i32 %3, -1                                                          ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 6
  %6 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = icmp eq i32 %7, 0                                                           ; inst 9
  br i1 %8, label %_3.if.then.0, label %_7.if.else.0                               ; inst 10
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 11
_4.while.cond.1:
  %9 = phi i32 [0, %_3.if.then.0], [%25, %_5.while.body.1]                         ; inst 12
  %10 = phi i32 [%2, %_3.if.then.0], [%24, %_5.while.body.1]                       ; inst 13
  %11 = sext i32 %3 to i64                                                         ; inst 14
  %12 = add i64 %11, 1                                                             ; inst 15
  %13 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %12               ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = icmp slt i32 %9, %14                                                       ; inst 18
  br i1 %15, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 19
_5.while.body.1:
  %16 = add i32 %3, 4                                                              ; inst 20
  %17 = add i32 %16, %9                                                            ; inst 21
  %18 = sext i32 %17 to i64                                                        ; inst 22
  %19 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %18               ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = srem i32 %9, 3                                                             ; inst 25
  %22 = sub i32 %21, 1                                                             ; inst 26
  %23 = mul i32 %20, %22                                                           ; inst 27
  %24 = add i32 %10, %23                                                           ; inst 28
  %25 = add i32 %9, 1                                                              ; inst 29
  br label %_4.while.cond.1                                                        ; inst 30
_6.while.exit.1:
  br label %_8.if.exit.0                                                           ; inst 31
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 32
_8.if.exit.0:
  %26 = phi i32 [%10, %_6.while.exit.1], [%2, %_7.if.else.0]                       ; inst 33
  %27 = sext i32 %3 to i64                                                         ; inst 34
  %28 = add i64 %27, 3                                                             ; inst 35
  %29 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %28               ; inst 36
  %30 = load i32, i32* %29                                                         ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_9.while.exit.0:
  ret i32 %2                                                                       ; inst 39
}

define i32 @complex_memory_scan([1024 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 3
  %3 = icmp slt i32 %1, 5                                                          ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = mul i32 %1, 10                                                              ; inst 6
  %5 = call i32 @another_utility_function([1024 x i32]* %0, i32 %4)                ; inst 7
  %6 = add i32 %2, %5                                                              ; inst 8
  %7 = add i32 %1, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  ret i32 %2                                                                       ; inst 11
}

