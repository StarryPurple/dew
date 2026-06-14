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
  %6 = alloca i32                                                                  ; inst 11
  store i32 0, i32* %6                                                             ; inst 12
  call void @init_heap([1024 x i32]* %0, i32* %6)                                  ; inst 13
  %7 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 100)                     ; inst 14
  %8 = icmp sgt i32 %7, 0                                                          ; inst 15
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 16
_4.if.then.0:
  call void @printlnInt(i32 1001)                                                  ; inst 17
  call void @fill_memory([1024 x i32]* %0, i32 %7, i32 100, i32 1)                 ; inst 18
  call void @verify_memory([1024 x i32]* %0, i32 %7, i32 100, i32 1)               ; inst 19
  br label %_6.if.exit.0                                                           ; inst 20
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 21
_6.if.exit.0:
  %9 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 200)                     ; inst 22
  %10 = icmp sgt i32 %9, 0                                                         ; inst 23
  br i1 %10, label %_7.if.then.1, label %_8.if.else.1                              ; inst 24
_7.if.then.1:
  call void @printlnInt(i32 1002)                                                  ; inst 25
  call void @fill_memory([1024 x i32]* %0, i32 %9, i32 200, i32 2)                 ; inst 26
  call void @verify_memory([1024 x i32]* %0, i32 %9, i32 200, i32 2)               ; inst 27
  br label %_9.if.exit.1                                                           ; inst 28
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 29
_9.if.exit.1:
  %11 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 150)                    ; inst 30
  %12 = icmp sgt i32 %11, 0                                                        ; inst 31
  br i1 %12, label %_10.if.then.2, label %_11.if.else.2                            ; inst 32
_10.if.then.2:
  call void @printlnInt(i32 1003)                                                  ; inst 33
  call void @fill_memory([1024 x i32]* %0, i32 %11, i32 150, i32 3)                ; inst 34
  call void @verify_memory([1024 x i32]* %0, i32 %11, i32 150, i32 3)              ; inst 35
  br label %_12.if.exit.2                                                          ; inst 36
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 37
_12.if.exit.2:
  call void @my_free([1024 x i32]* %0, i32* %6, i32 %9)                            ; inst 38
  call void @verify_memory([1024 x i32]* %0, i32 %9, i32 200, i32 2)               ; inst 39
  call void @printlnInt(i32 1004)                                                  ; inst 40
  %13 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 50)                     ; inst 41
  %14 = icmp sgt i32 %13, 0                                                        ; inst 42
  br i1 %14, label %_13.if.then.3, label %_14.if.else.3                            ; inst 43
_13.if.then.3:
  call void @printlnInt(i32 1005)                                                  ; inst 44
  call void @fill_memory([1024 x i32]* %0, i32 %13, i32 50, i32 4)                 ; inst 45
  call void @verify_memory([1024 x i32]* %0, i32 %13, i32 50, i32 2)               ; inst 46
  br label %_15.if.exit.3                                                          ; inst 47
_14.if.else.3:
  br label %_15.if.exit.3                                                          ; inst 48
_15.if.exit.3:
  %15 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 250)                    ; inst 49
  %16 = icmp slt i32 %15, 0                                                        ; inst 50
  br i1 %16, label %_16.if.then.4, label %_17.if.else.4                            ; inst 51
_16.if.then.4:
  call void @printlnInt(i32 1006)                                                  ; inst 52
  br label %_18.if.exit.4                                                          ; inst 53
_17.if.else.4:
  br label %_18.if.exit.4                                                          ; inst 54
_18.if.exit.4:
  call void @my_free([1024 x i32]* %0, i32* %6, i32 %7)                            ; inst 55
  call void @my_free([1024 x i32]* %0, i32* %6, i32 %11)                           ; inst 56
  call void @my_free([1024 x i32]* %0, i32* %6, i32 %13)                           ; inst 57
  call void @printlnInt(i32 1007)                                                  ; inst 58
  %17 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 800)                    ; inst 59
  %18 = icmp sgt i32 %17, 0                                                        ; inst 60
  br i1 %18, label %_19.if.then.5, label %_20.if.else.5                            ; inst 61
_19.if.then.5:
  call void @printlnInt(i32 1008)                                                  ; inst 62
  call void @fill_memory([1024 x i32]* %0, i32 %17, i32 800, i32 5)                ; inst 63
  call void @verify_memory([1024 x i32]* %0, i32 %17, i32 800, i32 5)              ; inst 64
  br label %_21.if.exit.5                                                          ; inst 65
_20.if.else.5:
  br label %_21.if.exit.5                                                          ; inst 66
_21.if.exit.5:
  call void @printlnInt(i32 9999)                                                  ; inst 67
  call void @exit(i32 0)                                                           ; inst 68
  ret void                                                                         ; inst 69
}

define void @init_heap([1024 x i32]* %0, i32* %1) {
_0.entry.0:
  %2 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 0                  ; inst 1
  %3 = trunc i64 1024 to i32                                                       ; inst 2
  %4 = sub i32 %3, 2                                                               ; inst 3
  store i32 %4, i32* %2                                                            ; inst 4
  %5 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 1                  ; inst 5
  store i32 0, i32* %5                                                             ; inst 6
  %6 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 2                  ; inst 7
  store i32 -1, i32* %6                                                            ; inst 8
  store i32 0, i32* %1                                                             ; inst 9
  ret void                                                                         ; inst 10
}

define i32 @my_malloc([1024 x i32]* %0, i32* %1, i32 %2) {
_0.entry.0:
  %3 = load i32, i32* %1                                                           ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [-1, %_0.entry.0], [%5, %_20.if.exit.0]                             ; inst 3
  %5 = phi i32 [%3, %_0.entry.0], [%70, %_20.if.exit.0]                            ; inst 4
  %6 = icmp ne i32 %5, -1                                                          ; inst 5
  br i1 %6, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 6
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 7
  %8 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %7                 ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = sext i32 %5 to i64                                                         ; inst 10
  %11 = add i64 %10, 1                                                             ; inst 11
  %12 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %11               ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = icmp eq i32 %13, 0                                                         ; inst 14
  br i1 %14, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 15
_3.lazy.then.0:
  %15 = icmp sge i32 %9, %2                                                        ; inst 16
  br label %_5.lazy.exit.0                                                         ; inst 17
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 18
_5.lazy.exit.0:
  %16 = phi i1 [%15, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 19
  br i1 %16, label %_6.if.then.0, label %_19.if.else.0                             ; inst 20
_6.if.then.0:
  %17 = sub i32 %9, %2                                                             ; inst 21
  %18 = sub i32 %17, 2                                                             ; inst 22
  %19 = icmp sgt i32 %18, 2                                                        ; inst 23
  br i1 %19, label %_7.if.then.1, label %_8.if.else.1                              ; inst 24
_7.if.then.1:
  %20 = add i32 %5, 2                                                              ; inst 25
  %21 = add i32 %20, %2                                                            ; inst 26
  %22 = sext i32 %21 to i64                                                        ; inst 27
  %23 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %22               ; inst 28
  store i32 %18, i32* %23                                                          ; inst 29
  %24 = sext i32 %21 to i64                                                        ; inst 30
  %25 = add i64 %24, 1                                                             ; inst 31
  %26 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %25               ; inst 32
  store i32 0, i32* %26                                                            ; inst 33
  %27 = sext i32 %21 to i64                                                        ; inst 34
  %28 = add i64 %27, 2                                                             ; inst 35
  %29 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %28               ; inst 36
  %30 = sext i32 %5 to i64                                                         ; inst 37
  %31 = add i64 %30, 2                                                             ; inst 38
  %32 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %31               ; inst 39
  %33 = load i32, i32* %32                                                         ; inst 40
  store i32 %33, i32* %29                                                          ; inst 41
  %34 = sext i32 %5 to i64                                                         ; inst 42
  %35 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %34               ; inst 43
  store i32 %2, i32* %35                                                           ; inst 44
  %36 = sext i32 %5 to i64                                                         ; inst 45
  %37 = add i64 %36, 1                                                             ; inst 46
  %38 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %37               ; inst 47
  store i32 1, i32* %38                                                            ; inst 48
  %39 = sext i32 %5 to i64                                                         ; inst 49
  %40 = add i64 %39, 2                                                             ; inst 50
  %41 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %40               ; inst 51
  store i32 %21, i32* %41                                                          ; inst 52
  br label %_9.if.exit.1                                                           ; inst 53
_8.if.else.1:
  %42 = sext i32 %5 to i64                                                         ; inst 54
  %43 = add i64 %42, 1                                                             ; inst 55
  %44 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %43               ; inst 56
  store i32 1, i32* %44                                                            ; inst 57
  br label %_9.if.exit.1                                                           ; inst 58
_9.if.exit.1:
  %45 = icmp eq i32 %4, -1                                                         ; inst 59
  br i1 %45, label %_10.if.then.2, label %_14.if.else.2                            ; inst 60
_10.if.then.2:
  %46 = icmp sgt i32 %18, 2                                                        ; inst 61
  br i1 %46, label %_11.if.then.3, label %_12.if.else.3                            ; inst 62
_11.if.then.3:
  %47 = add i32 %5, 2                                                              ; inst 63
  %48 = add i32 %47, %2                                                            ; inst 64
  store i32 %48, i32* %1                                                           ; inst 65
  br label %_13.if.exit.3                                                          ; inst 66
_12.if.else.3:
  %49 = sext i32 %5 to i64                                                         ; inst 67
  %50 = add i64 %49, 2                                                             ; inst 68
  %51 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %50               ; inst 69
  %52 = load i32, i32* %51                                                         ; inst 70
  store i32 %52, i32* %1                                                           ; inst 71
  br label %_13.if.exit.3                                                          ; inst 72
_13.if.exit.3:
  br label %_18.if.exit.2                                                          ; inst 73
_14.if.else.2:
  %53 = icmp sgt i32 %18, 2                                                        ; inst 74
  br i1 %53, label %_15.if.then.4, label %_16.if.else.4                            ; inst 75
_15.if.then.4:
  %54 = sext i32 %4 to i64                                                         ; inst 76
  %55 = add i64 %54, 2                                                             ; inst 77
  %56 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %55               ; inst 78
  %57 = add i32 %5, 2                                                              ; inst 79
  %58 = add i32 %57, %2                                                            ; inst 80
  store i32 %58, i32* %56                                                          ; inst 81
  br label %_17.if.exit.4                                                          ; inst 82
_16.if.else.4:
  %59 = sext i32 %4 to i64                                                         ; inst 83
  %60 = add i64 %59, 2                                                             ; inst 84
  %61 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %60               ; inst 85
  %62 = sext i32 %5 to i64                                                         ; inst 86
  %63 = add i64 %62, 2                                                             ; inst 87
  %64 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %63               ; inst 88
  %65 = load i32, i32* %64                                                         ; inst 89
  store i32 %65, i32* %61                                                          ; inst 90
  br label %_17.if.exit.4                                                          ; inst 91
_17.if.exit.4:
  br label %_18.if.exit.2                                                          ; inst 92
_18.if.exit.2:
  %66 = add i32 %5, 2                                                              ; inst 93
  ret i32 %66                                                                      ; inst 94
_19.if.else.0:
  br label %_20.if.exit.0                                                          ; inst 95
_20.if.exit.0:
  %67 = sext i32 %5 to i64                                                         ; inst 96
  %68 = add i64 %67, 2                                                             ; inst 97
  %69 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %68               ; inst 98
  %70 = load i32, i32* %69                                                         ; inst 99
  br label %_1.while.cond.0                                                        ; inst 100
_21.while.exit.0:
  ret i32 -1                                                                       ; inst 101
}

define void @my_free([1024 x i32]* %0, i32* %1, i32 %2) {
_0.entry.0:
  %3 = icmp sle i32 %2, 2                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = sub i32 %2, 2                                                               ; inst 5
  %5 = sext i32 %4 to i64                                                          ; inst 6
  %6 = add i64 %5, 1                                                               ; inst 7
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 8
  store i32 0, i32* %7                                                             ; inst 9
  %8 = load i32, i32* %1                                                           ; inst 10
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %9 = phi i32 [-1, %_3.if.exit.0], [%10, %_8.while.body.0]                        ; inst 12
  %10 = phi i32 [%8, %_3.if.exit.0], [%17, %_8.while.body.0]                       ; inst 13
  %11 = icmp ne i32 %10, -1                                                        ; inst 14
  br i1 %11, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 15
_5.lazy.then.0:
  %12 = icmp slt i32 %10, %4                                                       ; inst 16
  br label %_7.lazy.exit.0                                                         ; inst 17
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 18
_7.lazy.exit.0:
  %13 = phi i1 [%12, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 19
  br i1 %13, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 20
_8.while.body.0:
  %14 = sext i32 %10 to i64                                                        ; inst 21
  %15 = add i64 %14, 2                                                             ; inst 22
  %16 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %15               ; inst 23
  %17 = load i32, i32* %16                                                         ; inst 24
  br label %_4.while.cond.0                                                        ; inst 25
_9.while.exit.0:
  %18 = icmp eq i32 %9, -1                                                         ; inst 26
  br i1 %18, label %_10.if.then.1, label %_11.if.else.1                            ; inst 27
_10.if.then.1:
  %19 = sext i32 %4 to i64                                                         ; inst 28
  %20 = add i64 %19, 2                                                             ; inst 29
  %21 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %20               ; inst 30
  %22 = load i32, i32* %1                                                          ; inst 31
  store i32 %22, i32* %21                                                          ; inst 32
  store i32 %4, i32* %1                                                            ; inst 33
  br label %_12.if.exit.1                                                          ; inst 34
_11.if.else.1:
  %23 = sext i32 %4 to i64                                                         ; inst 35
  %24 = add i64 %23, 2                                                             ; inst 36
  %25 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %24               ; inst 37
  %26 = sext i32 %9 to i64                                                         ; inst 38
  %27 = add i64 %26, 2                                                             ; inst 39
  %28 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %27               ; inst 40
  %29 = load i32, i32* %28                                                         ; inst 41
  store i32 %29, i32* %25                                                          ; inst 42
  %30 = sext i32 %9 to i64                                                         ; inst 43
  %31 = add i64 %30, 2                                                             ; inst 44
  %32 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %31               ; inst 45
  store i32 %4, i32* %32                                                           ; inst 46
  br label %_12.if.exit.1                                                          ; inst 47
_12.if.exit.1:
  %33 = load i32, i32* %1                                                          ; inst 48
  call void @coalesce([1024 x i32]* %0, i32 %33)                                   ; inst 49
  ret void                                                                         ; inst 50
}

define void @coalesce([1024 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [%1, %_0.entry.0], [%32, %_5.if.exit.0]                             ; inst 2
  %3 = icmp ne i32 %2, -1                                                          ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = add i64 %4, 2                                                               ; inst 6
  %6 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = sext i32 %2 to i64                                                          ; inst 9
  %9 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %8                 ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  %11 = add i32 %2, 2                                                              ; inst 12
  %12 = add i32 %11, %10                                                           ; inst 13
  %13 = icmp eq i32 %12, %7                                                        ; inst 14
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 15
_3.if.then.0:
  %14 = sext i32 %7 to i64                                                         ; inst 16
  %15 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %14               ; inst 17
  %16 = load i32, i32* %15                                                         ; inst 18
  %17 = add i32 %10, 2                                                             ; inst 19
  %18 = add i32 %17, %16                                                           ; inst 20
  %19 = sext i32 %2 to i64                                                         ; inst 21
  %20 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %19               ; inst 22
  store i32 %18, i32* %20                                                          ; inst 23
  %21 = sext i32 %2 to i64                                                         ; inst 24
  %22 = add i64 %21, 2                                                             ; inst 25
  %23 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %22               ; inst 26
  %24 = sext i32 %7 to i64                                                         ; inst 27
  %25 = add i64 %24, 2                                                             ; inst 28
  %26 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %25               ; inst 29
  %27 = load i32, i32* %26                                                         ; inst 30
  store i32 %27, i32* %23                                                          ; inst 31
  br label %_5.if.exit.0                                                           ; inst 32
_4.if.else.0:
  %28 = sext i32 %2 to i64                                                         ; inst 33
  %29 = add i64 %28, 2                                                             ; inst 34
  %30 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %29               ; inst 35
  %31 = load i32, i32* %30                                                         ; inst 36
  br label %_5.if.exit.0                                                           ; inst 37
_5.if.exit.0:
  %32 = phi i32 [%2, %_3.if.then.0], [%31, %_4.if.else.0]                          ; inst 38
  br label %_1.while.cond.0                                                        ; inst 39
_6.while.exit.0:
  ret void                                                                         ; inst 40
}

define void @fill_memory([1024 x i32]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %5 = icmp slt i32 %4, %2                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %6 = add i32 %1, %4                                                              ; inst 5
  %7 = sext i32 %6 to i64                                                          ; inst 6
  %8 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %7                 ; inst 7
  %9 = mul i32 %3, 10000                                                           ; inst 8
  %10 = add i32 %9, %4                                                             ; inst 9
  store i32 %10, i32* %8                                                           ; inst 10
  %11 = add i32 %4, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  ret void                                                                         ; inst 13
}

define void @verify_memory([1024 x i32]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%15, %_5.if.exit.0]                              ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%16, %_5.if.exit.0]                              ; inst 3
  %6 = icmp slt i32 %5, %2                                                         ; inst 4
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %7 = add i32 %1, %5                                                              ; inst 6
  %8 = sext i32 %7 to i64                                                          ; inst 7
  %9 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %8                 ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = mul i32 %3, 10000                                                          ; inst 10
  %12 = add i32 %11, %5                                                            ; inst 11
  %13 = icmp ne i32 %10, %12                                                       ; inst 12
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 13
_3.if.then.0:
  %14 = add i32 %4, 1                                                              ; inst 14
  br label %_5.if.exit.0                                                           ; inst 15
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 16
_5.if.exit.0:
  %15 = phi i32 [%14, %_3.if.then.0], [%4, %_4.if.else.0]                          ; inst 17
  %16 = add i32 %5, 1                                                              ; inst 18
  br label %_1.while.cond.0                                                        ; inst 19
_6.while.exit.0:
  %17 = icmp sgt i32 %4, 0                                                         ; inst 20
  br i1 %17, label %_7.if.then.1, label %_8.if.else.1                              ; inst 21
_7.if.then.1:
  call void @printlnInt(i32 -999)                                                  ; inst 22
  br label %_9.if.exit.1                                                           ; inst 23
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 24
_9.if.exit.1:
  ret void                                                                         ; inst 25
}

define void @complex_memory_churn([1024 x i32]* %0, i32* %1) {
_0.entry.0:
  %2 = alloca [20 x i32]                                                           ; inst 1
  %3 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 20                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %8 = phi i32 [0, %_3.array.exit.0], [%25, %_8.if.exit.0]                         ; inst 12
  %9 = icmp slt i32 %8, 20                                                         ; inst 13
  br i1 %9, label %_5.while.body.0, label %_9.while.exit.0                         ; inst 14
_5.while.body.0:
  %10 = sext i32 %8 to i64                                                         ; inst 15
  %11 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %10                   ; inst 16
  %12 = mul i32 %8, 2                                                              ; inst 17
  %13 = add i32 20, %12                                                            ; inst 18
  %14 = call i32 @my_malloc([1024 x i32]* %0, i32* %1, i32 %13)                    ; inst 19
  store i32 %14, i32* %11                                                          ; inst 20
  %15 = sext i32 %8 to i64                                                         ; inst 21
  %16 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %15                   ; inst 22
  %17 = load i32, i32* %16                                                         ; inst 23
  %18 = icmp sgt i32 %17, 0                                                        ; inst 24
  br i1 %18, label %_6.if.then.0, label %_7.if.else.0                              ; inst 25
_6.if.then.0:
  %19 = sext i32 %8 to i64                                                         ; inst 26
  %20 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %19                   ; inst 27
  %21 = load i32, i32* %20                                                         ; inst 28
  %22 = mul i32 %8, 2                                                              ; inst 29
  %23 = add i32 20, %22                                                            ; inst 30
  %24 = add i32 10, %8                                                             ; inst 31
  call void @fill_memory([1024 x i32]* %0, i32 %21, i32 %23, i32 %24)              ; inst 32
  br label %_8.if.exit.0                                                           ; inst 33
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 34
_8.if.exit.0:
  %25 = add i32 %8, 1                                                              ; inst 35
  br label %_4.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 37
_10.while.cond.1:
  %26 = phi i32 [0, %_9.while.exit.0], [%33, %_14.if.exit.1]                       ; inst 38
  %27 = icmp slt i32 %26, 20                                                       ; inst 39
  br i1 %27, label %_11.while.body.1, label %_15.while.exit.1                      ; inst 40
_11.while.body.1:
  %28 = srem i32 %26, 2                                                            ; inst 41
  %29 = icmp eq i32 %28, 0                                                         ; inst 42
  br i1 %29, label %_12.if.then.1, label %_13.if.else.1                            ; inst 43
_12.if.then.1:
  %30 = sext i32 %26 to i64                                                        ; inst 44
  %31 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %30                   ; inst 45
  %32 = load i32, i32* %31                                                         ; inst 46
  call void @my_free([1024 x i32]* %0, i32* %1, i32 %32)                           ; inst 47
  br label %_14.if.exit.1                                                          ; inst 48
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 49
_14.if.exit.1:
  %33 = add i32 %26, 1                                                             ; inst 50
  br label %_10.while.cond.1                                                       ; inst 51
_15.while.exit.1:
  br label %_16.while.cond.2                                                       ; inst 52
_16.while.cond.2:
  %34 = phi i32 [1, %_15.while.exit.1], [%44, %_20.if.exit.2]                      ; inst 53
  %35 = icmp slt i32 %34, 20                                                       ; inst 54
  br i1 %35, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 55
_17.while.body.2:
  %36 = srem i32 %34, 2                                                            ; inst 56
  %37 = icmp ne i32 %36, 0                                                         ; inst 57
  br i1 %37, label %_18.if.then.2, label %_19.if.else.2                            ; inst 58
_18.if.then.2:
  %38 = sext i32 %34 to i64                                                        ; inst 59
  %39 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %38                   ; inst 60
  %40 = load i32, i32* %39                                                         ; inst 61
  %41 = mul i32 %34, 2                                                             ; inst 62
  %42 = add i32 20, %41                                                            ; inst 63
  %43 = add i32 10, %34                                                            ; inst 64
  call void @verify_memory([1024 x i32]* %0, i32 %40, i32 %42, i32 %43)            ; inst 65
  br label %_20.if.exit.2                                                          ; inst 66
_19.if.else.2:
  br label %_20.if.exit.2                                                          ; inst 67
_20.if.exit.2:
  %44 = add i32 %34, 1                                                             ; inst 68
  br label %_16.while.cond.2                                                       ; inst 69
_21.while.exit.2:
  %45 = call i32 @my_malloc([1024 x i32]* %0, i32* %1, i32 300)                    ; inst 70
  %46 = icmp sgt i32 %45, 0                                                        ; inst 71
  br i1 %46, label %_22.if.then.3, label %_23.if.else.3                            ; inst 72
_22.if.then.3:
  call void @fill_memory([1024 x i32]* %0, i32 %45, i32 300, i32 100)              ; inst 73
  br label %_24.if.exit.3                                                          ; inst 74
_23.if.else.3:
  br label %_24.if.exit.3                                                          ; inst 75
_24.if.exit.3:
  br label %_25.while.cond.3                                                       ; inst 76
_25.while.cond.3:
  %47 = phi i32 [1, %_24.if.exit.3], [%54, %_29.if.exit.4]                         ; inst 77
  %48 = icmp slt i32 %47, 20                                                       ; inst 78
  br i1 %48, label %_26.while.body.3, label %_30.while.exit.3                      ; inst 79
_26.while.body.3:
  %49 = srem i32 %47, 2                                                            ; inst 80
  %50 = icmp ne i32 %49, 0                                                         ; inst 81
  br i1 %50, label %_27.if.then.4, label %_28.if.else.4                            ; inst 82
_27.if.then.4:
  %51 = sext i32 %47 to i64                                                        ; inst 83
  %52 = getelementptr [20 x i32], [20 x i32]* %2, i32 0, i64 %51                   ; inst 84
  %53 = load i32, i32* %52                                                         ; inst 85
  call void @my_free([1024 x i32]* %0, i32* %1, i32 %53)                           ; inst 86
  br label %_29.if.exit.4                                                          ; inst 87
_28.if.else.4:
  br label %_29.if.exit.4                                                          ; inst 88
_29.if.exit.4:
  %54 = add i32 %47, 1                                                             ; inst 89
  br label %_25.while.cond.3                                                       ; inst 90
_30.while.exit.3:
  call void @my_free([1024 x i32]* %0, i32* %1, i32 %45)                           ; inst 91
  %55 = trunc i64 1024 to i32                                                      ; inst 92
  %56 = sub i32 %55, 100                                                           ; inst 93
  %57 = call i32 @my_malloc([1024 x i32]* %0, i32* %1, i32 %56)                    ; inst 94
  %58 = icmp sgt i32 %57, 0                                                        ; inst 95
  br i1 %58, label %_31.if.then.5, label %_32.if.else.5                            ; inst 96
_31.if.then.5:
  call void @printlnInt(i32 8888)                                                  ; inst 97
  br label %_33.if.exit.5                                                          ; inst 98
_32.if.else.5:
  br label %_33.if.exit.5                                                          ; inst 99
_33.if.exit.5:
  ret void                                                                         ; inst 100
}

define void @another_level_of_scope() {
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
  %6 = alloca i32                                                                  ; inst 11
  store i32 0, i32* %6                                                             ; inst 12
  call void @init_heap([1024 x i32]* %0, i32* %6)                                  ; inst 13
  call void @complex_memory_churn([1024 x i32]* %0, i32* %6)                       ; inst 14
  %7 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 50)                      ; inst 15
  %8 = icmp sgt i32 %7, 0                                                          ; inst 16
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 17
_4.if.then.0:
  call void @fill_memory([1024 x i32]* %0, i32 %7, i32 50, i32 50)                 ; inst 18
  br label %_6.if.exit.0                                                           ; inst 19
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 20
_6.if.exit.0:
  %9 = phi i32 [%7, %_4.if.then.0], [0, %_5.if.else.0]                             ; inst 21
  %10 = icmp sgt i32 %9, 0                                                         ; inst 22
  br i1 %10, label %_7.if.then.1, label %_8.if.else.1                              ; inst 23
_7.if.then.1:
  call void @verify_memory([1024 x i32]* %0, i32 %9, i32 50, i32 50)               ; inst 24
  br label %_9.if.exit.1                                                           ; inst 25
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 26
_9.if.exit.1:
  %11 = icmp eq i32 1, 1                                                           ; inst 27
  br i1 %11, label %_10.if.then.2, label %_17.if.else.2                            ; inst 28
_10.if.then.2:
  br label %_11.while.cond.0                                                       ; inst 29
_11.while.cond.0:
  %12 = phi i32 [0, %_10.if.then.2], [%16, %_15.if.exit.3]                         ; inst 30
  %13 = icmp slt i32 %12, 10                                                       ; inst 31
  br i1 %13, label %_12.while.body.0, label %_16.while.exit.0                      ; inst 32
_12.while.body.0:
  %14 = icmp eq i32 %12, 5                                                         ; inst 33
  br i1 %14, label %_13.if.then.3, label %_14.if.else.3                            ; inst 34
_13.if.then.3:
  %15 = add i32 5, %12                                                             ; inst 35
  call void @printlnInt(i32 %15)                                                   ; inst 36
  br label %_15.if.exit.3                                                          ; inst 37
_14.if.else.3:
  br label %_15.if.exit.3                                                          ; inst 38
_15.if.exit.3:
  %16 = add i32 %12, 1                                                             ; inst 39
  br label %_11.while.cond.0                                                       ; inst 40
_16.while.exit.0:
  br label %_18.if.exit.2                                                          ; inst 41
_17.if.else.2:
  br label %_18.if.exit.2                                                          ; inst 42
_18.if.exit.2:
  %17 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 10)                     ; inst 43
  %18 = icmp sgt i32 %17, 0                                                        ; inst 44
  br i1 %18, label %_19.if.then.4, label %_20.if.else.4                            ; inst 45
_19.if.then.4:
  call void @fill_memory([1024 x i32]* %0, i32 %17, i32 10, i32 99)                ; inst 46
  br label %_21.if.exit.4                                                          ; inst 47
_20.if.else.4:
  br label %_21.if.exit.4                                                          ; inst 48
_21.if.exit.4:
  br i1 1, label %_22.if.then.5, label %_26.if.else.5                              ; inst 49
_22.if.then.5:
  %19 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 20)                     ; inst 50
  %20 = icmp sgt i32 %19, 0                                                        ; inst 51
  br i1 %20, label %_23.if.then.6, label %_24.if.else.6                            ; inst 52
_23.if.then.6:
  call void @fill_memory([1024 x i32]* %0, i32 %19, i32 20, i32 88)                ; inst 53
  br label %_25.if.exit.6                                                          ; inst 54
_24.if.else.6:
  br label %_25.if.exit.6                                                          ; inst 55
_25.if.exit.6:
  %21 = phi i32 [%19, %_23.if.then.6], [0, %_24.if.else.6]                         ; inst 56
  br label %_27.if.exit.5                                                          ; inst 57
_26.if.else.5:
  br label %_27.if.exit.5                                                          ; inst 58
_27.if.exit.5:
  %22 = phi i32 [%21, %_25.if.exit.6], [0, %_26.if.else.5]                         ; inst 59
  %23 = icmp sgt i32 %22, 0                                                        ; inst 60
  br i1 %23, label %_28.if.then.7, label %_29.if.else.7                            ; inst 61
_28.if.then.7:
  call void @verify_memory([1024 x i32]* %0, i32 %22, i32 20, i32 88)              ; inst 62
  br label %_30.if.exit.7                                                          ; inst 63
_29.if.else.7:
  br label %_30.if.exit.7                                                          ; inst 64
_30.if.exit.7:
  br label %_31.while.cond.1                                                       ; inst 65
_31.while.cond.1:
  %24 = phi i32 [0, %_30.if.exit.7], [%60, %_47.while.exit.3]                      ; inst 66
  %25 = icmp slt i32 %24, 5                                                        ; inst 67
  br i1 %25, label %_32.while.body.1, label %_48.while.exit.1                      ; inst 68
_32.while.body.1:
  %26 = alloca [5 x i32]                                                           ; inst 69
  %27 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i32 0                      ; inst 70
  br label %_33.array.cond.1                                                       ; inst 71
_33.array.cond.1:
  %28 = phi i32 [0, %_32.while.body.1], [%31, %_34.array.body.1]                   ; inst 72
  %29 = icmp slt i32 %28, 5                                                        ; inst 73
  br i1 %29, label %_34.array.body.1, label %_35.array.exit.1                      ; inst 74
_34.array.body.1:
  %30 = getelementptr i32, i32* %27, i32 %28                                       ; inst 75
  store i32 0, i32* %30                                                            ; inst 76
  %31 = add i32 %28, 1                                                             ; inst 77
  br label %_33.array.cond.1                                                       ; inst 78
_35.array.exit.1:
  br label %_36.while.cond.2                                                       ; inst 79
_36.while.cond.2:
  %32 = phi i32 [0, %_35.array.exit.1], [%49, %_40.if.exit.8]                      ; inst 80
  %33 = icmp slt i32 %32, 5                                                        ; inst 81
  br i1 %33, label %_37.while.body.2, label %_41.while.exit.2                      ; inst 82
_37.while.body.2:
  %34 = add i32 %24, %32                                                           ; inst 83
  %35 = add i32 %34, 1                                                             ; inst 84
  %36 = mul i32 %35, 2                                                             ; inst 85
  %37 = sext i32 %32 to i64                                                        ; inst 86
  %38 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i64 %37                    ; inst 87
  %39 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 %36)                    ; inst 88
  store i32 %39, i32* %38                                                          ; inst 89
  %40 = sext i32 %32 to i64                                                        ; inst 90
  %41 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i64 %40                    ; inst 91
  %42 = load i32, i32* %41                                                         ; inst 92
  %43 = icmp sgt i32 %42, 0                                                        ; inst 93
  br i1 %43, label %_38.if.then.8, label %_39.if.else.8                            ; inst 94
_38.if.then.8:
  %44 = sext i32 %32 to i64                                                        ; inst 95
  %45 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i64 %44                    ; inst 96
  %46 = load i32, i32* %45                                                         ; inst 97
  %47 = mul i32 %24, 10                                                            ; inst 98
  %48 = add i32 %47, %32                                                           ; inst 99
  call void @fill_memory([1024 x i32]* %0, i32 %46, i32 %36, i32 %48)              ; inst 100
  br label %_40.if.exit.8                                                          ; inst 101
_39.if.else.8:
  br label %_40.if.exit.8                                                          ; inst 102
_40.if.exit.8:
  %49 = add i32 %32, 1                                                             ; inst 103
  br label %_36.while.cond.2                                                       ; inst 104
_41.while.exit.2:
  br label %_42.while.cond.3                                                       ; inst 105
_42.while.cond.3:
  %50 = phi i32 [0, %_41.while.exit.2], [%59, %_46.if.exit.9]                      ; inst 106
  %51 = icmp slt i32 %50, 5                                                        ; inst 107
  br i1 %51, label %_43.while.body.3, label %_47.while.exit.3                      ; inst 108
_43.while.body.3:
  %52 = sext i32 %50 to i64                                                        ; inst 109
  %53 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i64 %52                    ; inst 110
  %54 = load i32, i32* %53                                                         ; inst 111
  %55 = icmp sgt i32 %54, 0                                                        ; inst 112
  br i1 %55, label %_44.if.then.9, label %_45.if.else.9                            ; inst 113
_44.if.then.9:
  %56 = sext i32 %50 to i64                                                        ; inst 114
  %57 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i64 %56                    ; inst 115
  %58 = load i32, i32* %57                                                         ; inst 116
  call void @my_free([1024 x i32]* %0, i32* %6, i32 %58)                           ; inst 117
  br label %_46.if.exit.9                                                          ; inst 118
_45.if.else.9:
  br label %_46.if.exit.9                                                          ; inst 119
_46.if.exit.9:
  %59 = add i32 %50, 1                                                             ; inst 120
  br label %_42.while.cond.3                                                       ; inst 121
_47.while.exit.3:
  %60 = add i32 %24, 1                                                             ; inst 122
  br label %_31.while.cond.1                                                       ; inst 123
_48.while.exit.1:
  %61 = trunc i64 1024 to i32                                                      ; inst 124
  %62 = sub i32 %61, 50                                                            ; inst 125
  %63 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 %62)                    ; inst 126
  %64 = icmp sgt i32 %63, 0                                                        ; inst 127
  br i1 %64, label %_49.if.then.10, label %_50.if.else.10                          ; inst 128
_49.if.then.10:
  call void @printlnInt(i32 7777)                                                  ; inst 129
  br label %_51.if.exit.10                                                         ; inst 130
_50.if.else.10:
  call void @printlnInt(i32 -7777)                                                 ; inst 131
  br label %_51.if.exit.10                                                         ; inst 132
_51.if.exit.10:
  %65 = icmp sgt i32 10, 5                                                         ; inst 133
  br i1 %65, label %_52.if.then.11, label %_53.if.else.11                          ; inst 134
_52.if.then.11:
  call void @printlnInt(i32 21)                                                    ; inst 135
  br label %_54.if.exit.11                                                         ; inst 136
_53.if.else.11:
  br label %_54.if.exit.11                                                         ; inst 137
_54.if.exit.11:
  call void @printlnInt(i32 10)                                                    ; inst 138
  %66 = call i32 @my_malloc([1024 x i32]* %0, i32* %6, i32 1)                      ; inst 139
  call void @my_free([1024 x i32]* %0, i32* %6, i32 %66)                           ; inst 140
  ret void                                                                         ; inst 141
}

