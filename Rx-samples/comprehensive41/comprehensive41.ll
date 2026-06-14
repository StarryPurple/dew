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


%FS = type { [16384 x i32], [128 x i32], [128 x i32], [128 x [6 x i32]], [256 x i1], [128 x i1] }

define void @new_fs(%FS* sret(%FS) %0) {
_0.entry.0:
  %1 = alloca %FS                                                                  ; inst 1
  %2 = getelementptr %FS, %FS* %1, i32 0, i32 0                                    ; inst 2
  %3 = getelementptr [16384 x i32], [16384 x i32]* %2, i32 0, i32 0                ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 16384                                                      ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 8
  store i32 0, i32* %6                                                             ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %8 = getelementptr %FS, %FS* %1, i32 0, i32 1                                    ; inst 12
  %9 = getelementptr [128 x i32], [128 x i32]* %8, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 15
  %11 = icmp slt i32 %10, 128                                                      ; inst 16
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %12 = getelementptr i32, i32* %9, i32 %10                                        ; inst 18
  store i32 0, i32* %12                                                            ; inst 19
  %13 = add i32 %10, 1                                                             ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %14 = getelementptr %FS, %FS* %1, i32 0, i32 2                                   ; inst 22
  %15 = getelementptr [128 x i32], [128 x i32]* %14, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 25
  %17 = icmp slt i32 %16, 128                                                      ; inst 26
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 28
  store i32 0, i32* %18                                                            ; inst 29
  %19 = add i32 %16, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %20 = getelementptr %FS, %FS* %1, i32 0, i32 3                                   ; inst 32
  %21 = alloca [6 x i32]                                                           ; inst 33
  %22 = getelementptr [6 x i32], [6 x i32]* %21, i32 0, i32 0                      ; inst 34
  br label %_10.array.cond.3                                                       ; inst 35
_10.array.cond.3:
  %23 = phi i32 [0, %_9.array.exit.2], [%26, %_11.array.body.3]                    ; inst 36
  %24 = icmp slt i32 %23, 6                                                        ; inst 37
  br i1 %24, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 38
_11.array.body.3:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 39
  store i32 0, i32* %25                                                            ; inst 40
  %26 = add i32 %23, 1                                                             ; inst 41
  br label %_10.array.cond.3                                                       ; inst 42
_12.array.exit.3:
  %27 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %20, i32 0, i32 0      ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %28 = phi i32 [0, %_12.array.exit.3], [%31, %_14.array.body.4]                   ; inst 45
  %29 = icmp slt i32 %28, 128                                                      ; inst 46
  br i1 %29, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %30 = getelementptr [6 x i32], [6 x i32]* %27, i32 %28                           ; inst 48
  call void @memcpy([6 x i32]* %30, [6 x i32]* %21, i64 24)                        ; inst 49
  %31 = add i32 %28, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %32 = getelementptr %FS, %FS* %1, i32 0, i32 4                                   ; inst 52
  %33 = getelementptr [256 x i1], [256 x i1]* %32, i32 0, i32 0                    ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %34 = phi i32 [0, %_15.array.exit.4], [%37, %_17.array.body.5]                   ; inst 55
  %35 = icmp slt i32 %34, 256                                                      ; inst 56
  br i1 %35, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %36 = getelementptr i1, i1* %33, i32 %34                                         ; inst 58
  store i1 0, i1* %36                                                              ; inst 59
  %37 = add i32 %34, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  %38 = getelementptr %FS, %FS* %1, i32 0, i32 5                                   ; inst 62
  %39 = getelementptr [128 x i1], [128 x i1]* %38, i32 0, i32 0                    ; inst 63
  br label %_19.array.cond.6                                                       ; inst 64
_19.array.cond.6:
  %40 = phi i32 [0, %_18.array.exit.5], [%43, %_20.array.body.6]                   ; inst 65
  %41 = icmp slt i32 %40, 128                                                      ; inst 66
  br i1 %41, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 67
_20.array.body.6:
  %42 = getelementptr i1, i1* %39, i32 %40                                         ; inst 68
  store i1 0, i1* %42                                                              ; inst 69
  %43 = add i32 %40, 1                                                             ; inst 70
  br label %_19.array.cond.6                                                       ; inst 71
_21.array.exit.6:
  call void @memcpy(%FS* %0, %FS* %1, i64 70016)                                   ; inst 72
  ret void                                                                         ; inst 73
}

define void @fs_format(%FS* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 256                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %FS, %FS* %0, i32 0, i32 4                                    ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [256 x i1], [256 x i1]* %3, i32 0, i64 %4                     ; inst 7
  store i1 1, i1* %5                                                               ; inst 8
  %6 = add i32 %1, 1                                                               ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 11
_4.while.cond.1:
  %7 = phi i32 [0, %_3.while.exit.0], [%12, %_5.while.body.1]                      ; inst 12
  %8 = icmp slt i32 %7, 128                                                        ; inst 13
  br i1 %8, label %_5.while.body.1, label %_6.while.exit.1                         ; inst 14
_5.while.body.1:
  %9 = getelementptr %FS, %FS* %0, i32 0, i32 5                                    ; inst 15
  %10 = sext i32 %7 to i64                                                         ; inst 16
  %11 = getelementptr [128 x i1], [128 x i1]* %9, i32 0, i64 %10                   ; inst 17
  store i1 1, i1* %11                                                              ; inst 18
  %12 = add i32 %7, 1                                                              ; inst 19
  br label %_4.while.cond.1                                                        ; inst 20
_6.while.exit.1:
  %13 = call i32 @allocate_inode(%FS* %0)                                          ; inst 21
  %14 = call i32 @allocate_block(%FS* %0)                                          ; inst 22
  %15 = getelementptr %FS, %FS* %0, i32 0, i32 1                                   ; inst 23
  %16 = sext i32 %13 to i64                                                        ; inst 24
  %17 = getelementptr [128 x i32], [128 x i32]* %15, i32 0, i64 %16                ; inst 25
  store i32 2, i32* %17                                                            ; inst 26
  %18 = getelementptr %FS, %FS* %0, i32 0, i32 2                                   ; inst 27
  %19 = sext i32 %13 to i64                                                        ; inst 28
  %20 = getelementptr [128 x i32], [128 x i32]* %18, i32 0, i64 %19                ; inst 29
  store i32 0, i32* %20                                                            ; inst 30
  %21 = getelementptr %FS, %FS* %0, i32 0, i32 3                                   ; inst 31
  %22 = sext i32 %13 to i64                                                        ; inst 32
  %23 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %21, i32 0, i64 %22    ; inst 33
  %24 = getelementptr [6 x i32], [6 x i32]* %23, i32 0, i64 0                      ; inst 34
  store i32 %14, i32* %24                                                          ; inst 35
  ret void                                                                         ; inst 36
}

define i32 @allocate_inode(%FS* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%24, %_8.if.exit.0]                              ; inst 2
  %2 = icmp slt i32 %1, 128                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %FS, %FS* %0, i32 0, i32 5                                    ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [128 x i1], [128 x i1]* %3, i32 0, i64 %4                     ; inst 7
  %6 = load i1, i1* %5                                                             ; inst 8
  br i1 %6, label %_3.if.then.0, label %_7.if.else.0                               ; inst 9
_3.if.then.0:
  %7 = getelementptr %FS, %FS* %0, i32 0, i32 5                                    ; inst 10
  %8 = sext i32 %1 to i64                                                          ; inst 11
  %9 = getelementptr [128 x i1], [128 x i1]* %7, i32 0, i64 %8                     ; inst 12
  store i1 0, i1* %9                                                               ; inst 13
  %10 = getelementptr %FS, %FS* %0, i32 0, i32 1                                   ; inst 14
  %11 = sext i32 %1 to i64                                                         ; inst 15
  %12 = getelementptr [128 x i32], [128 x i32]* %10, i32 0, i64 %11                ; inst 16
  store i32 0, i32* %12                                                            ; inst 17
  %13 = getelementptr %FS, %FS* %0, i32 0, i32 2                                   ; inst 18
  %14 = sext i32 %1 to i64                                                         ; inst 19
  %15 = getelementptr [128 x i32], [128 x i32]* %13, i32 0, i64 %14                ; inst 20
  store i32 0, i32* %15                                                            ; inst 21
  br label %_4.while.cond.1                                                        ; inst 22
_4.while.cond.1:
  %16 = phi i32 [0, %_3.if.then.0], [%23, %_5.while.body.1]                        ; inst 23
  %17 = icmp slt i32 %16, 6                                                        ; inst 24
  br i1 %17, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 25
_5.while.body.1:
  %18 = getelementptr %FS, %FS* %0, i32 0, i32 3                                   ; inst 26
  %19 = sext i32 %1 to i64                                                         ; inst 27
  %20 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %18, i32 0, i64 %19    ; inst 28
  %21 = sext i32 %16 to i64                                                        ; inst 29
  %22 = getelementptr [6 x i32], [6 x i32]* %20, i32 0, i64 %21                    ; inst 30
  store i32 0, i32* %22                                                            ; inst 31
  %23 = add i32 %16, 1                                                             ; inst 32
  br label %_4.while.cond.1                                                        ; inst 33
_6.while.exit.1:
  ret i32 %1                                                                       ; inst 34
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 35
_8.if.exit.0:
  %24 = add i32 %1, 1                                                              ; inst 36
  br label %_1.while.cond.0                                                        ; inst 37
_9.while.exit.0:
  ret i32 -1                                                                       ; inst 38
}

define i32 @allocate_block(%FS* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%10, %_5.if.exit.0]                              ; inst 2
  %2 = icmp slt i32 %1, 256                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %FS, %FS* %0, i32 0, i32 4                                    ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [256 x i1], [256 x i1]* %3, i32 0, i64 %4                     ; inst 7
  %6 = load i1, i1* %5                                                             ; inst 8
  br i1 %6, label %_3.if.then.0, label %_4.if.else.0                               ; inst 9
_3.if.then.0:
  %7 = getelementptr %FS, %FS* %0, i32 0, i32 4                                    ; inst 10
  %8 = sext i32 %1 to i64                                                          ; inst 11
  %9 = getelementptr [256 x i1], [256 x i1]* %7, i32 0, i64 %8                     ; inst 12
  store i1 0, i1* %9                                                               ; inst 13
  ret i32 %1                                                                       ; inst 14
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %10 = add i32 %1, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_6.while.exit.0:
  ret i32 -1                                                                       ; inst 18
}

define i32 @find_in_dir(%FS* %0, i32 %1, [16 x i32]* %2) {
_0.entry.0:
  %3 = getelementptr %FS, %FS* %0, i32 0, i32 2                                    ; inst 1
  %4 = sext i32 %1 to i64                                                          ; inst 2
  %5 = getelementptr [128 x i32], [128 x i32]* %3, i32 0, i64 %4                   ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  %7 = sdiv i32 %6, 24                                                             ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%40, %_11.if.exit.1]                             ; inst 7
  %9 = icmp slt i32 %8, %7                                                         ; inst 8
  br i1 %9, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 9
_2.while.body.0:
  %10 = mul i32 %8, 24                                                             ; inst 10
  %11 = sdiv i32 %10, 64                                                           ; inst 11
  %12 = mul i32 %8, 24                                                             ; inst 12
  %13 = srem i32 %12, 64                                                           ; inst 13
  %14 = getelementptr %FS, %FS* %0, i32 0, i32 3                                   ; inst 14
  %15 = sext i32 %1 to i64                                                         ; inst 15
  %16 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %14, i32 0, i64 %15    ; inst 16
  %17 = sext i32 %11 to i64                                                        ; inst 17
  %18 = getelementptr [6 x i32], [6 x i32]* %16, i32 0, i64 %17                    ; inst 18
  %19 = load i32, i32* %18                                                         ; inst 19
  %20 = mul i32 %19, 64                                                            ; inst 20
  %21 = add i32 %20, %13                                                           ; inst 21
  br label %_3.while.cond.1                                                        ; inst 22
_3.while.cond.1:
  %22 = phi i32 [0, %_2.while.body.0], [%33, %_7.if.exit.0]                        ; inst 23
  %23 = icmp slt i32 %22, 16                                                       ; inst 24
  br i1 %23, label %_4.while.body.1, label %_13.critical_edge.0                    ; inst 25
_4.while.body.1:
  %24 = getelementptr %FS, %FS* %0, i32 0, i32 0                                   ; inst 26
  %25 = add i32 %21, %22                                                           ; inst 27
  %26 = sext i32 %25 to i64                                                        ; inst 28
  %27 = getelementptr [16384 x i32], [16384 x i32]* %24, i32 0, i64 %26            ; inst 29
  %28 = load i32, i32* %27                                                         ; inst 30
  %29 = sext i32 %22 to i64                                                        ; inst 31
  %30 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 %29                   ; inst 32
  %31 = load i32, i32* %30                                                         ; inst 33
  %32 = icmp ne i32 %28, %31                                                       ; inst 34
  br i1 %32, label %_5.if.then.0, label %_6.if.else.0                              ; inst 35
_5.if.then.0:
  br label %_8.while.exit.1                                                        ; inst 36
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 37
_7.if.exit.0:
  %33 = add i32 %22, 1                                                             ; inst 38
  br label %_3.while.cond.1                                                        ; inst 39
_8.while.exit.1:
  %34 = phi i1 [1, %_13.critical_edge.0], [0, %_5.if.then.0]                       ; inst 40
  br i1 %34, label %_9.if.then.1, label %_10.if.else.1                             ; inst 41
_9.if.then.1:
  %35 = getelementptr %FS, %FS* %0, i32 0, i32 0                                   ; inst 42
  %36 = add i32 %21, 16                                                            ; inst 43
  %37 = sext i32 %36 to i64                                                        ; inst 44
  %38 = getelementptr [16384 x i32], [16384 x i32]* %35, i32 0, i64 %37            ; inst 45
  %39 = load i32, i32* %38                                                         ; inst 46
  ret i32 %39                                                                      ; inst 47
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 48
_11.if.exit.1:
  %40 = add i32 %8, 1                                                              ; inst 49
  br label %_1.while.cond.0                                                        ; inst 50
_12.while.exit.0:
  ret i32 -1                                                                       ; inst 51
_13.critical_edge.0:
  br label %_8.while.exit.1                                                        ; inst 52
}

define i32 @create_file(%FS* %0, i32 %1, [16 x i32]* %2) {
_0.entry.0:
  %3 = alloca [16 x i32]                                                           ; inst 1
  call void @memcpy([16 x i32]* %3, [16 x i32]* %2, i64 64)                        ; inst 2
  %4 = call i32 @find_in_dir(%FS* %0, i32 %1, [16 x i32]* %3)                      ; inst 3
  %5 = icmp ne i32 %4, -1                                                          ; inst 4
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  ret i32 -1                                                                       ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %6 = call i32 @allocate_inode(%FS* %0)                                           ; inst 8
  %7 = icmp eq i32 %6, -1                                                          ; inst 9
  br i1 %7, label %_4.if.then.1, label %_5.if.else.1                               ; inst 10
_4.if.then.1:
  ret i32 -1                                                                       ; inst 11
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 12
_6.if.exit.1:
  %8 = getelementptr %FS, %FS* %0, i32 0, i32 1                                    ; inst 13
  %9 = sext i32 %6 to i64                                                          ; inst 14
  %10 = getelementptr [128 x i32], [128 x i32]* %8, i32 0, i64 %9                  ; inst 15
  store i32 1, i32* %10                                                            ; inst 16
  %11 = getelementptr %FS, %FS* %0, i32 0, i32 2                                   ; inst 17
  %12 = sext i32 %1 to i64                                                         ; inst 18
  %13 = getelementptr [128 x i32], [128 x i32]* %11, i32 0, i64 %12                ; inst 19
  %14 = load i32, i32* %13                                                         ; inst 20
  %15 = sdiv i32 %14, 64                                                           ; inst 21
  %16 = srem i32 %14, 64                                                           ; inst 22
  %17 = getelementptr %FS, %FS* %0, i32 0, i32 3                                   ; inst 23
  %18 = sext i32 %1 to i64                                                         ; inst 24
  %19 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %17, i32 0, i64 %18    ; inst 25
  %20 = sext i32 %15 to i64                                                        ; inst 26
  %21 = getelementptr [6 x i32], [6 x i32]* %19, i32 0, i64 %20                    ; inst 27
  %22 = load i32, i32* %21                                                         ; inst 28
  %23 = mul i32 %22, 64                                                            ; inst 29
  %24 = add i32 %23, %16                                                           ; inst 30
  br label %_7.while.cond.0                                                        ; inst 31
_7.while.cond.0:
  %25 = phi i32 [0, %_6.if.exit.1], [%34, %_8.while.body.0]                        ; inst 32
  %26 = icmp slt i32 %25, 16                                                       ; inst 33
  br i1 %26, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 34
_8.while.body.0:
  %27 = getelementptr %FS, %FS* %0, i32 0, i32 0                                   ; inst 35
  %28 = add i32 %24, %25                                                           ; inst 36
  %29 = sext i32 %28 to i64                                                        ; inst 37
  %30 = getelementptr [16384 x i32], [16384 x i32]* %27, i32 0, i64 %29            ; inst 38
  %31 = sext i32 %25 to i64                                                        ; inst 39
  %32 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 %31                   ; inst 40
  %33 = load i32, i32* %32                                                         ; inst 41
  store i32 %33, i32* %30                                                          ; inst 42
  %34 = add i32 %25, 1                                                             ; inst 43
  br label %_7.while.cond.0                                                        ; inst 44
_9.while.exit.0:
  %35 = getelementptr %FS, %FS* %0, i32 0, i32 0                                   ; inst 45
  %36 = add i32 %24, 16                                                            ; inst 46
  %37 = sext i32 %36 to i64                                                        ; inst 47
  %38 = getelementptr [16384 x i32], [16384 x i32]* %35, i32 0, i64 %37            ; inst 48
  store i32 %6, i32* %38                                                           ; inst 49
  %39 = getelementptr %FS, %FS* %0, i32 0, i32 2                                   ; inst 50
  %40 = sext i32 %1 to i64                                                         ; inst 51
  %41 = getelementptr [128 x i32], [128 x i32]* %39, i32 0, i64 %40                ; inst 52
  %42 = add i32 %14, 24                                                            ; inst 53
  store i32 %42, i32* %41                                                          ; inst 54
  ret i32 %6                                                                       ; inst 55
}

define i32 @write_file(%FS* %0, i32 %1, [100 x i32]* %2, i32 %3) {
_0.entry.0:
  %4 = icmp sgt i32 %3, 100                                                        ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %5 = phi i32 [100, %_1.if.then.0], [%3, %_2.if.else.0]                           ; inst 5
  br label %_4.while.cond.0                                                        ; inst 6
_4.while.cond.0:
  %6 = phi i32 [0, %_3.if.exit.0], [%52, %_14.if.exit.2]                           ; inst 7
  %7 = phi i32 [0, %_3.if.exit.0], [%51, %_14.if.exit.2]                           ; inst 8
  %8 = icmp slt i32 %7, %5                                                         ; inst 9
  br i1 %8, label %_5.while.body.0, label %_15.while.exit.0                        ; inst 10
_5.while.body.0:
  %9 = getelementptr %FS, %FS* %0, i32 0, i32 2                                    ; inst 11
  %10 = sext i32 %1 to i64                                                         ; inst 12
  %11 = getelementptr [128 x i32], [128 x i32]* %9, i32 0, i64 %10                 ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = sdiv i32 %12, 64                                                           ; inst 15
  %14 = icmp sge i32 %13, 6                                                        ; inst 16
  br i1 %14, label %_6.if.then.1, label %_7.if.else.1                              ; inst 17
_6.if.then.1:
  ret i32 -1                                                                       ; inst 18
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 19
_8.if.exit.1:
  %15 = getelementptr %FS, %FS* %0, i32 0, i32 3                                   ; inst 20
  %16 = sext i32 %1 to i64                                                         ; inst 21
  %17 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %15, i32 0, i64 %16    ; inst 22
  %18 = sext i32 %13 to i64                                                        ; inst 23
  %19 = getelementptr [6 x i32], [6 x i32]* %17, i32 0, i64 %18                    ; inst 24
  %20 = load i32, i32* %19                                                         ; inst 25
  %21 = icmp eq i32 %20, 0                                                         ; inst 26
  br i1 %21, label %_9.if.then.2, label %_13.if.else.2                             ; inst 27
_9.if.then.2:
  %22 = call i32 @allocate_block(%FS* %0)                                          ; inst 28
  %23 = icmp eq i32 %22, -1                                                        ; inst 29
  br i1 %23, label %_10.if.then.3, label %_11.if.else.3                            ; inst 30
_10.if.then.3:
  ret i32 -1                                                                       ; inst 31
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 32
_12.if.exit.3:
  %24 = getelementptr %FS, %FS* %0, i32 0, i32 3                                   ; inst 33
  %25 = sext i32 %1 to i64                                                         ; inst 34
  %26 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %24, i32 0, i64 %25    ; inst 35
  %27 = sext i32 %13 to i64                                                        ; inst 36
  %28 = getelementptr [6 x i32], [6 x i32]* %26, i32 0, i64 %27                    ; inst 37
  store i32 %22, i32* %28                                                          ; inst 38
  br label %_14.if.exit.2                                                          ; inst 39
_13.if.else.2:
  br label %_14.if.exit.2                                                          ; inst 40
_14.if.exit.2:
  %29 = phi i32 [%22, %_12.if.exit.3], [%20, %_13.if.else.2]                       ; inst 41
  %30 = getelementptr %FS, %FS* %0, i32 0, i32 2                                   ; inst 42
  %31 = sext i32 %1 to i64                                                         ; inst 43
  %32 = getelementptr [128 x i32], [128 x i32]* %30, i32 0, i64 %31                ; inst 44
  %33 = load i32, i32* %32                                                         ; inst 45
  %34 = srem i32 %33, 64                                                           ; inst 46
  %35 = mul i32 %29, 64                                                            ; inst 47
  %36 = add i32 %35, %34                                                           ; inst 48
  %37 = getelementptr %FS, %FS* %0, i32 0, i32 0                                   ; inst 49
  %38 = sext i32 %36 to i64                                                        ; inst 50
  %39 = getelementptr [16384 x i32], [16384 x i32]* %37, i32 0, i64 %38            ; inst 51
  %40 = sext i32 %7 to i64                                                         ; inst 52
  %41 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %40                 ; inst 53
  %42 = load i32, i32* %41                                                         ; inst 54
  store i32 %42, i32* %39                                                          ; inst 55
  %43 = getelementptr %FS, %FS* %0, i32 0, i32 2                                   ; inst 56
  %44 = sext i32 %1 to i64                                                         ; inst 57
  %45 = getelementptr [128 x i32], [128 x i32]* %43, i32 0, i64 %44                ; inst 58
  %46 = getelementptr %FS, %FS* %0, i32 0, i32 2                                   ; inst 59
  %47 = sext i32 %1 to i64                                                         ; inst 60
  %48 = getelementptr [128 x i32], [128 x i32]* %46, i32 0, i64 %47                ; inst 61
  %49 = load i32, i32* %48                                                         ; inst 62
  %50 = add i32 %49, 1                                                             ; inst 63
  store i32 %50, i32* %45                                                          ; inst 64
  %51 = add i32 %7, 1                                                              ; inst 65
  %52 = add i32 %6, 1                                                              ; inst 66
  br label %_4.while.cond.0                                                        ; inst 67
_15.while.exit.0:
  ret i32 %6                                                                       ; inst 68
}

define i32 @read_file(%FS* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %FS, %FS* %0, i32 0, i32 2                                    ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [128 x i32], [128 x i32]* %2, i32 0, i64 %3                   ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%24, %_2.while.body.0]                           ; inst 6
  %7 = phi i32 [0, %_0.entry.0], [%23, %_2.while.body.0]                           ; inst 7
  %8 = icmp slt i32 %6, %5                                                         ; inst 8
  br i1 %8, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 9
_2.while.body.0:
  %9 = sdiv i32 %6, 64                                                             ; inst 10
  %10 = srem i32 %6, 64                                                            ; inst 11
  %11 = getelementptr %FS, %FS* %0, i32 0, i32 3                                   ; inst 12
  %12 = sext i32 %1 to i64                                                         ; inst 13
  %13 = getelementptr [128 x [6 x i32]], [128 x [6 x i32]]* %11, i32 0, i64 %12    ; inst 14
  %14 = sext i32 %9 to i64                                                         ; inst 15
  %15 = getelementptr [6 x i32], [6 x i32]* %13, i32 0, i64 %14                    ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = mul i32 %16, 64                                                            ; inst 18
  %18 = add i32 %17, %10                                                           ; inst 19
  %19 = getelementptr %FS, %FS* %0, i32 0, i32 0                                   ; inst 20
  %20 = sext i32 %18 to i64                                                        ; inst 21
  %21 = getelementptr [16384 x i32], [16384 x i32]* %19, i32 0, i64 %20            ; inst 22
  %22 = load i32, i32* %21                                                         ; inst 23
  %23 = add i32 %7, %22                                                            ; inst 24
  %24 = add i32 %6, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_3.while.exit.0:
  ret i32 %7                                                                       ; inst 27
}

define void @str_to_arr([16 x i32]* sret([16 x i32]) %0, i32 %1) {
_0.entry.0:
  %2 = alloca [16 x i32]                                                           ; inst 1
  %3 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 16                                                         ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = icmp eq i32 %1, 1                                                           ; inst 11
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 12
_4.if.then.0:
  %9 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 0                      ; inst 13
  store i32 102, i32* %9                                                           ; inst 14
  %10 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 1                     ; inst 15
  store i32 105, i32* %10                                                          ; inst 16
  %11 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 2                     ; inst 17
  store i32 108, i32* %11                                                          ; inst 18
  %12 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 3                     ; inst 19
  store i32 101, i32* %12                                                          ; inst 20
  %13 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 4                     ; inst 21
  store i32 49, i32* %13                                                           ; inst 22
  br label %_12.if.exit.0                                                          ; inst 23
_5.if.else.0:
  %14 = icmp eq i32 %1, 2                                                          ; inst 24
  br i1 %14, label %_6.if.then.1, label %_7.if.else.1                              ; inst 25
_6.if.then.1:
  %15 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 0                     ; inst 26
  store i32 100, i32* %15                                                          ; inst 27
  %16 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 1                     ; inst 28
  store i32 97, i32* %16                                                           ; inst 29
  %17 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 2                     ; inst 30
  store i32 116, i32* %17                                                          ; inst 31
  %18 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 3                     ; inst 32
  store i32 97, i32* %18                                                           ; inst 33
  br label %_11.if.exit.1                                                          ; inst 34
_7.if.else.1:
  %19 = icmp eq i32 %1, 3                                                          ; inst 35
  br i1 %19, label %_8.if.then.2, label %_9.if.else.2                              ; inst 36
_8.if.then.2:
  %20 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 0                     ; inst 37
  store i32 116, i32* %20                                                          ; inst 38
  %21 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 1                     ; inst 39
  store i32 101, i32* %21                                                          ; inst 40
  %22 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 2                     ; inst 41
  store i32 109, i32* %22                                                          ; inst 42
  %23 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 3                     ; inst 43
  store i32 112, i32* %23                                                          ; inst 44
  br label %_10.if.exit.2                                                          ; inst 45
_9.if.else.2:
  br label %_10.if.exit.2                                                          ; inst 46
_10.if.exit.2:
  br label %_11.if.exit.1                                                          ; inst 47
_11.if.exit.1:
  br label %_12.if.exit.0                                                          ; inst 48
_12.if.exit.0:
  call void @memcpy([16 x i32]* %0, [16 x i32]* %2, i64 64)                        ; inst 49
  ret void                                                                         ; inst 50
}

define void @main() {
_0.entry.0:
  %0 = alloca [16 x i32]                                                           ; inst 1
  %1 = alloca [100 x i32]                                                          ; inst 2
  %2 = alloca [16 x i32]                                                           ; inst 3
  %3 = alloca [100 x i32]                                                          ; inst 4
  %4 = alloca [16 x i32]                                                           ; inst 5
  %5 = alloca [16 x i32]                                                           ; inst 6
  %6 = alloca [100 x i32]                                                          ; inst 7
  %7 = alloca %FS                                                                  ; inst 8
  call void @new_fs(%FS* %7)                                                       ; inst 9
  call void @fs_format(%FS* %7)                                                    ; inst 10
  %8 = alloca [16 x i32]                                                           ; inst 11
  call void @str_to_arr([16 x i32]* %8, i32 1)                                     ; inst 12
  call void @memcpy([16 x i32]* %0, [16 x i32]* %8, i64 64)                        ; inst 13
  %9 = call i32 @create_file(%FS* %7, i32 0, [16 x i32]* %0)                       ; inst 14
  call void @printlnInt(i32 %9)                                                    ; inst 15
  %10 = alloca [100 x i32]                                                         ; inst 16
  %11 = getelementptr [100 x i32], [100 x i32]* %10, i32 0, i32 0                  ; inst 17
  br label %_1.array.cond.0                                                        ; inst 18
_1.array.cond.0:
  %12 = phi i32 [0, %_0.entry.0], [%15, %_2.array.body.0]                          ; inst 19
  %13 = icmp slt i32 %12, 100                                                      ; inst 20
  br i1 %13, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 21
_2.array.body.0:
  %14 = getelementptr i32, i32* %11, i32 %12                                       ; inst 22
  store i32 0, i32* %14                                                            ; inst 23
  %15 = add i32 %12, 1                                                             ; inst 24
  br label %_1.array.cond.0                                                        ; inst 25
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 26
_4.while.cond.0:
  %16 = phi i32 [0, %_3.array.exit.0], [%21, %_5.while.body.0]                     ; inst 27
  %17 = icmp slt i32 %16, 100                                                      ; inst 28
  br i1 %17, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 29
_5.while.body.0:
  %18 = sext i32 %16 to i64                                                        ; inst 30
  %19 = getelementptr [100 x i32], [100 x i32]* %10, i32 0, i64 %18                ; inst 31
  %20 = mul i32 %16, 3                                                             ; inst 32
  store i32 %20, i32* %19                                                          ; inst 33
  %21 = add i32 %16, 1                                                             ; inst 34
  br label %_4.while.cond.0                                                        ; inst 35
_6.while.exit.0:
  call void @memcpy([100 x i32]* %1, [100 x i32]* %10, i64 400)                    ; inst 36
  %22 = call i32 @write_file(%FS* %7, i32 %9, [100 x i32]* %1, i32 80)             ; inst 37
  call void @printlnInt(i32 %22)                                                   ; inst 38
  %23 = call i32 @read_file(%FS* %7, i32 %9)                                       ; inst 39
  call void @printlnInt(i32 %23)                                                   ; inst 40
  %24 = alloca [16 x i32]                                                          ; inst 41
  call void @str_to_arr([16 x i32]* %24, i32 2)                                    ; inst 42
  call void @memcpy([16 x i32]* %2, [16 x i32]* %24, i64 64)                       ; inst 43
  %25 = call i32 @create_file(%FS* %7, i32 0, [16 x i32]* %2)                      ; inst 44
  call void @printlnInt(i32 %25)                                                   ; inst 45
  %26 = alloca [100 x i32]                                                         ; inst 46
  %27 = getelementptr [100 x i32], [100 x i32]* %26, i32 0, i32 0                  ; inst 47
  br label %_7.array.cond.1                                                        ; inst 48
_7.array.cond.1:
  %28 = phi i32 [0, %_6.while.exit.0], [%31, %_8.array.body.1]                     ; inst 49
  %29 = icmp slt i32 %28, 100                                                      ; inst 50
  br i1 %29, label %_8.array.body.1, label %_9.array.exit.1                        ; inst 51
_8.array.body.1:
  %30 = getelementptr i32, i32* %27, i32 %28                                       ; inst 52
  store i32 0, i32* %30                                                            ; inst 53
  %31 = add i32 %28, 1                                                             ; inst 54
  br label %_7.array.cond.1                                                        ; inst 55
_9.array.exit.1:
  br label %_10.while.cond.1                                                       ; inst 56
_10.while.cond.1:
  %32 = phi i32 [0, %_9.array.exit.1], [%37, %_11.while.body.1]                    ; inst 57
  %33 = icmp slt i32 %32, 100                                                      ; inst 58
  br i1 %33, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 59
_11.while.body.1:
  %34 = sext i32 %32 to i64                                                        ; inst 60
  %35 = getelementptr [100 x i32], [100 x i32]* %26, i32 0, i64 %34                ; inst 61
  %36 = sub i32 100, %32                                                           ; inst 62
  store i32 %36, i32* %35                                                          ; inst 63
  %37 = add i32 %32, 1                                                             ; inst 64
  br label %_10.while.cond.1                                                       ; inst 65
_12.while.exit.1:
  call void @memcpy([100 x i32]* %3, [100 x i32]* %26, i64 400)                    ; inst 66
  %38 = call i32 @write_file(%FS* %7, i32 %25, [100 x i32]* %3, i32 150)           ; inst 67
  call void @printlnInt(i32 %38)                                                   ; inst 68
  %39 = call i32 @read_file(%FS* %7, i32 %25)                                      ; inst 69
  call void @printlnInt(i32 %39)                                                   ; inst 70
  call void @memcpy([16 x i32]* %4, [16 x i32]* %8, i64 64)                        ; inst 71
  %40 = call i32 @find_in_dir(%FS* %7, i32 0, [16 x i32]* %4)                      ; inst 72
  call void @printlnInt(i32 %40)                                                   ; inst 73
  %41 = alloca [16 x i32]                                                          ; inst 74
  call void @str_to_arr([16 x i32]* %41, i32 3)                                    ; inst 75
  call void @memcpy([16 x i32]* %5, [16 x i32]* %41, i64 64)                       ; inst 76
  %42 = call i32 @find_in_dir(%FS* %7, i32 0, [16 x i32]* %5)                      ; inst 77
  call void @printlnInt(i32 %42)                                                   ; inst 78
  br label %_13.while.cond.2                                                       ; inst 79
_13.while.cond.2:
  %43 = phi i32 [0, %_12.while.exit.1], [%51, %_17.if.exit.0]                      ; inst 80
  %44 = phi i32 [0, %_12.while.exit.1], [%52, %_17.if.exit.0]                      ; inst 81
  %45 = icmp slt i32 %44, 256                                                      ; inst 82
  br i1 %45, label %_14.while.body.2, label %_18.while.exit.2                      ; inst 83
_14.while.body.2:
  %46 = getelementptr %FS, %FS* %7, i32 0, i32 4                                   ; inst 84
  %47 = sext i32 %44 to i64                                                        ; inst 85
  %48 = getelementptr [256 x i1], [256 x i1]* %46, i32 0, i64 %47                  ; inst 86
  %49 = load i1, i1* %48                                                           ; inst 87
  br i1 %49, label %_15.if.then.0, label %_16.if.else.0                            ; inst 88
_15.if.then.0:
  %50 = add i32 %43, 1                                                             ; inst 89
  br label %_17.if.exit.0                                                          ; inst 90
_16.if.else.0:
  br label %_17.if.exit.0                                                          ; inst 91
_17.if.exit.0:
  %51 = phi i32 [%50, %_15.if.then.0], [%43, %_16.if.else.0]                       ; inst 92
  %52 = add i32 %44, 1                                                             ; inst 93
  br label %_13.while.cond.2                                                       ; inst 94
_18.while.exit.2:
  call void @printlnInt(i32 %43)                                                   ; inst 95
  br label %_19.while.cond.3                                                       ; inst 96
_19.while.cond.3:
  %53 = phi i32 [0, %_18.while.exit.2], [%61, %_23.if.exit.1]                      ; inst 97
  %54 = phi i32 [0, %_18.while.exit.2], [%62, %_23.if.exit.1]                      ; inst 98
  %55 = icmp slt i32 %54, 128                                                      ; inst 99
  br i1 %55, label %_20.while.body.3, label %_24.while.exit.3                      ; inst 100
_20.while.body.3:
  %56 = getelementptr %FS, %FS* %7, i32 0, i32 5                                   ; inst 101
  %57 = sext i32 %54 to i64                                                        ; inst 102
  %58 = getelementptr [128 x i1], [128 x i1]* %56, i32 0, i64 %57                  ; inst 103
  %59 = load i1, i1* %58                                                           ; inst 104
  br i1 %59, label %_21.if.then.1, label %_22.if.else.1                            ; inst 105
_21.if.then.1:
  %60 = add i32 %53, 1                                                             ; inst 106
  br label %_23.if.exit.1                                                          ; inst 107
_22.if.else.1:
  br label %_23.if.exit.1                                                          ; inst 108
_23.if.exit.1:
  %61 = phi i32 [%60, %_21.if.then.1], [%53, %_22.if.else.1]                       ; inst 109
  %62 = add i32 %54, 1                                                             ; inst 110
  br label %_19.while.cond.3                                                       ; inst 111
_24.while.exit.3:
  call void @printlnInt(i32 %53)                                                   ; inst 112
  br label %_25.while.cond.4                                                       ; inst 113
_25.while.cond.4:
  %63 = phi i32 [0, %_24.while.exit.3], [%70, %_26.while.body.4]                   ; inst 114
  %64 = phi i32 [0, %_24.while.exit.3], [%71, %_26.while.body.4]                   ; inst 115
  %65 = icmp slt i32 %64, 16384                                                    ; inst 116
  br i1 %65, label %_26.while.body.4, label %_27.while.exit.4                      ; inst 117
_26.while.body.4:
  %66 = getelementptr %FS, %FS* %7, i32 0, i32 0                                   ; inst 118
  %67 = sext i32 %64 to i64                                                        ; inst 119
  %68 = getelementptr [16384 x i32], [16384 x i32]* %66, i32 0, i64 %67            ; inst 120
  %69 = load i32, i32* %68                                                         ; inst 121
  %70 = add i32 %63, %69                                                           ; inst 122
  %71 = add i32 %64, 1                                                             ; inst 123
  br label %_25.while.cond.4                                                       ; inst 124
_27.while.exit.4:
  %72 = srem i32 %63, 10000                                                        ; inst 125
  call void @printlnInt(i32 %72)                                                   ; inst 126
  br label %_28.while.cond.5                                                       ; inst 127
_28.while.cond.5:
  %73 = phi i32 [0, %_27.while.exit.4], [%89, %_35.while.exit.6]                   ; inst 128
  %74 = icmp slt i32 %73, 10                                                       ; inst 129
  br i1 %74, label %_29.while.body.5, label %_36.while.exit.5                      ; inst 130
_29.while.body.5:
  %75 = alloca [100 x i32]                                                         ; inst 131
  %76 = getelementptr [100 x i32], [100 x i32]* %75, i32 0, i32 0                  ; inst 132
  br label %_30.array.cond.2                                                       ; inst 133
_30.array.cond.2:
  %77 = phi i32 [0, %_29.while.body.5], [%80, %_31.array.body.2]                   ; inst 134
  %78 = icmp slt i32 %77, 100                                                      ; inst 135
  br i1 %78, label %_31.array.body.2, label %_32.array.exit.2                      ; inst 136
_31.array.body.2:
  %79 = getelementptr i32, i32* %76, i32 %77                                       ; inst 137
  store i32 0, i32* %79                                                            ; inst 138
  %80 = add i32 %77, 1                                                             ; inst 139
  br label %_30.array.cond.2                                                       ; inst 140
_32.array.exit.2:
  br label %_33.while.cond.6                                                       ; inst 141
_33.while.cond.6:
  %81 = phi i32 [0, %_32.array.exit.2], [%87, %_34.while.body.6]                   ; inst 142
  %82 = icmp slt i32 %81, 10                                                       ; inst 143
  br i1 %82, label %_34.while.body.6, label %_35.while.exit.6                      ; inst 144
_34.while.body.6:
  %83 = sext i32 %81 to i64                                                        ; inst 145
  %84 = getelementptr [100 x i32], [100 x i32]* %75, i32 0, i64 %83                ; inst 146
  %85 = mul i32 %73, 10                                                            ; inst 147
  %86 = add i32 %85, %81                                                           ; inst 148
  store i32 %86, i32* %84                                                          ; inst 149
  %87 = add i32 %81, 1                                                             ; inst 150
  br label %_33.while.cond.6                                                       ; inst 151
_35.while.exit.6:
  call void @memcpy([100 x i32]* %6, [100 x i32]* %75, i64 400)                    ; inst 152
  %88 = call i32 @write_file(%FS* %7, i32 %9, [100 x i32]* %6, i32 10)             ; inst 153
  %89 = add i32 %73, 1                                                             ; inst 154
  br label %_28.while.cond.5                                                       ; inst 155
_36.while.exit.5:
  %90 = call i32 @read_file(%FS* %7, i32 %9)                                       ; inst 156
  call void @printlnInt(i32 %90)                                                   ; inst 157
  br label %_37.while.cond.7                                                       ; inst 158
_37.while.cond.7:
  %91 = phi i32 [0, %_36.while.exit.5], [%93, %_38.while.body.7]                   ; inst 159
  %92 = icmp slt i32 %91, 5                                                        ; inst 160
  br i1 %92, label %_38.while.body.7, label %_39.while.exit.7                      ; inst 161
_38.while.body.7:
  %93 = add i32 %91, 1                                                             ; inst 162
  br label %_37.while.cond.7                                                       ; inst 163
_39.while.exit.7:
  call void @printlnInt(i32 1)                                                     ; inst 164
  call void @exit(i32 0)                                                           ; inst 165
  ret void                                                                         ; inst 166
}

