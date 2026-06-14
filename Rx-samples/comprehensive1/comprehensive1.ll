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


%Food = type { i32, i32 }
%SegT = type { i32, i32, i64, i64, %Food }
%Node = type { [201 x i64], i64, i32, [11 x i64], i64, i32 }

define void @_anpJvSCOn26_better(%Food* sret(%Food) %0, %Food* %1, %Food* %2) {
_0.entry.0:
  %3 = getelementptr %Food, %Food* %1, i32 0, i32 0                                ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  %5 = getelementptr %Food, %Food* %2, i32 0, i32 0                                ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  %7 = icmp eq i32 %4, %6                                                          ; inst 5
  br i1 %7, label %_1.if.then.0, label %_5.if.else.0                               ; inst 6
_1.if.then.0:
  %8 = getelementptr %Food, %Food* %1, i32 0, i32 1                                ; inst 7
  %9 = load i32, i32* %8                                                           ; inst 8
  %10 = getelementptr %Food, %Food* %2, i32 0, i32 1                               ; inst 9
  %11 = load i32, i32* %10                                                         ; inst 10
  %12 = icmp slt i32 %9, %11                                                       ; inst 11
  br i1 %12, label %_2.if.then.1, label %_3.if.else.1                              ; inst 12
_2.if.then.1:
  %13 = load %Food, %Food* %1                                                      ; inst 13
  br label %_4.if.exit.1                                                           ; inst 14
_3.if.else.1:
  %14 = load %Food, %Food* %2                                                      ; inst 15
  br label %_4.if.exit.1                                                           ; inst 16
_4.if.exit.1:
  %15 = phi %Food [%13, %_2.if.then.1], [%14, %_3.if.else.1]                       ; inst 17
  br label %_9.if.exit.0                                                           ; inst 18
_5.if.else.0:
  %16 = getelementptr %Food, %Food* %1, i32 0, i32 0                               ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = getelementptr %Food, %Food* %2, i32 0, i32 0                               ; inst 21
  %19 = load i32, i32* %18                                                         ; inst 22
  %20 = icmp sgt i32 %17, %19                                                      ; inst 23
  br i1 %20, label %_6.if.then.2, label %_7.if.else.2                              ; inst 24
_6.if.then.2:
  %21 = load %Food, %Food* %1                                                      ; inst 25
  br label %_8.if.exit.2                                                           ; inst 26
_7.if.else.2:
  %22 = load %Food, %Food* %2                                                      ; inst 27
  br label %_8.if.exit.2                                                           ; inst 28
_8.if.exit.2:
  %23 = phi %Food [%21, %_6.if.then.2], [%22, %_7.if.else.2]                       ; inst 29
  br label %_9.if.exit.0                                                           ; inst 30
_9.if.exit.0:
  %24 = phi %Food [%15, %_4.if.exit.1], [%23, %_8.if.exit.2]                       ; inst 31
  store %Food %24, %Food* %0                                                       ; inst 32
  ret void                                                                         ; inst 33
}

define i64 @new_segt([2000 x %SegT]* %0, i64* %1, i32 %2, i32 %3, %Food* %4) {
_0.entry.0:
  %5 = load i64, i64* %1                                                           ; inst 1
  %6 = add i64 %5, 1                                                               ; inst 2
  store i64 %6, i64* %1                                                            ; inst 3
  %7 = load i64, i64* %1                                                           ; inst 4
  %8 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %7             ; inst 5
  %9 = alloca %SegT                                                                ; inst 6
  %10 = getelementptr %SegT, %SegT* %9, i32 0, i32 0                               ; inst 7
  store i32 %2, i32* %10                                                           ; inst 8
  %11 = getelementptr %SegT, %SegT* %9, i32 0, i32 1                               ; inst 9
  store i32 %3, i32* %11                                                           ; inst 10
  %12 = getelementptr %SegT, %SegT* %9, i32 0, i32 2                               ; inst 11
  store i64 0, i64* %12                                                            ; inst 12
  %13 = getelementptr %SegT, %SegT* %9, i32 0, i32 3                               ; inst 13
  store i64 0, i64* %13                                                            ; inst 14
  %14 = getelementptr %SegT, %SegT* %9, i32 0, i32 4                               ; inst 15
  call void @memcpy(%Food* %14, %Food* %4, i64 8)                                  ; inst 16
  call void @memcpy(%SegT* %8, %SegT* %9, i64 32)                                  ; inst 17
  %15 = load i64, i64* %1                                                          ; inst 18
  ret i64 %15                                                                      ; inst 19
}

define i64 @build([2000 x %SegT]* %0, i64* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca %Food                                                                ; inst 1
  %5 = alloca %Food                                                                ; inst 2
  %6 = icmp sgt i32 %2, %3                                                         ; inst 3
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i64 0                                                                        ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %7 = icmp eq i32 %2, %3                                                          ; inst 7
  br i1 %7, label %_4.if.then.1, label %_5.if.else.1                               ; inst 8
_4.if.then.1:
  %8 = alloca %Food                                                                ; inst 9
  %9 = getelementptr %Food, %Food* %8, i32 0, i32 0                                ; inst 10
  store i32 0, i32* %9                                                             ; inst 11
  %10 = getelementptr %Food, %Food* %8, i32 0, i32 1                               ; inst 12
  store i32 %2, i32* %10                                                           ; inst 13
  call void @memcpy(%Food* %4, %Food* %8, i64 8)                                   ; inst 14
  %11 = call i64 @new_segt([2000 x %SegT]* %0, i64* %1, i32 %2, i32 %3, %Food* %4) ; inst 15
  ret i64 %11                                                                      ; inst 16
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 17
_6.if.exit.1:
  %12 = alloca %Food                                                               ; inst 18
  %13 = getelementptr %Food, %Food* %12, i32 0, i32 0                              ; inst 19
  store i32 0, i32* %13                                                            ; inst 20
  %14 = getelementptr %Food, %Food* %12, i32 0, i32 1                              ; inst 21
  store i32 0, i32* %14                                                            ; inst 22
  call void @memcpy(%Food* %5, %Food* %12, i64 8)                                  ; inst 23
  %15 = call i64 @new_segt([2000 x %SegT]* %0, i64* %1, i32 %2, i32 %3, %Food* %5) ; inst 24
  ret i64 %15                                                                      ; inst 25
}

define void @update([2000 x %SegT]* %0, i64* %1, i64 %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = alloca %Food                                                                ; inst 1
  %6 = alloca %Food                                                                ; inst 2
  %7 = alloca %Food                                                                ; inst 3
  %8 = alloca %Food                                                                ; inst 4
  %9 = icmp eq i64 %2, 0                                                           ; inst 5
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 6
_1.if.then.0:
  ret void                                                                         ; inst 7
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 8
_3.if.exit.0:
  %10 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 9
  %11 = getelementptr %SegT, %SegT* %10, i32 0, i32 0                              ; inst 10
  %12 = load i32, i32* %11                                                         ; inst 11
  %13 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 12
  %14 = getelementptr %SegT, %SegT* %13, i32 0, i32 1                              ; inst 13
  %15 = load i32, i32* %14                                                         ; inst 14
  %16 = icmp slt i32 %3, %12                                                       ; inst 15
  br i1 %16, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 16
_4.lazy.then.0:
  br label %_6.lazy.exit.0                                                         ; inst 17
_5.lazy.else.0:
  %17 = icmp sgt i32 %3, %15                                                       ; inst 18
  br label %_6.lazy.exit.0                                                         ; inst 19
_6.lazy.exit.0:
  %18 = phi i1 [1, %_4.lazy.then.0], [%17, %_5.lazy.else.0]                        ; inst 20
  br i1 %18, label %_7.if.then.1, label %_8.if.else.1                              ; inst 21
_7.if.then.1:
  ret void                                                                         ; inst 22
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 23
_9.if.exit.1:
  %19 = icmp eq i32 %12, %15                                                       ; inst 24
  br i1 %19, label %_10.if.then.2, label %_11.if.else.2                            ; inst 25
_10.if.then.2:
  %20 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 26
  %21 = getelementptr %SegT, %SegT* %20, i32 0, i32 4                              ; inst 27
  %22 = getelementptr %Food, %Food* %21, i32 0, i32 0                              ; inst 28
  %23 = load i32, i32* %22                                                         ; inst 29
  %24 = add i32 %23, %4                                                            ; inst 30
  store i32 %24, i32* %22                                                          ; inst 31
  ret void                                                                         ; inst 32
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 33
_12.if.exit.2:
  %25 = add i32 %12, %15                                                           ; inst 34
  %26 = sdiv i32 %25, 2                                                            ; inst 35
  %27 = icmp sle i32 %3, %26                                                       ; inst 36
  br i1 %27, label %_13.if.then.3, label %_17.if.else.3                            ; inst 37
_13.if.then.3:
  %28 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 38
  %29 = getelementptr %SegT, %SegT* %28, i32 0, i32 2                              ; inst 39
  %30 = load i64, i64* %29                                                         ; inst 40
  %31 = icmp eq i64 %30, 0                                                         ; inst 41
  br i1 %31, label %_14.if.then.4, label %_15.if.else.4                            ; inst 42
_14.if.then.4:
  %32 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 43
  %33 = getelementptr %SegT, %SegT* %32, i32 0, i32 2                              ; inst 44
  %34 = call i64 @build([2000 x %SegT]* %0, i64* %1, i32 %12, i32 %26)             ; inst 45
  store i64 %34, i64* %33                                                          ; inst 46
  br label %_16.if.exit.4                                                          ; inst 47
_15.if.else.4:
  br label %_16.if.exit.4                                                          ; inst 48
_16.if.exit.4:
  %35 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 49
  %36 = getelementptr %SegT, %SegT* %35, i32 0, i32 2                              ; inst 50
  %37 = load i64, i64* %36                                                         ; inst 51
  call void @update([2000 x %SegT]* %0, i64* %1, i64 %37, i32 %3, i32 %4)          ; inst 52
  br label %_21.if.exit.3                                                          ; inst 53
_17.if.else.3:
  %38 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 54
  %39 = getelementptr %SegT, %SegT* %38, i32 0, i32 3                              ; inst 55
  %40 = load i64, i64* %39                                                         ; inst 56
  %41 = icmp eq i64 %40, 0                                                         ; inst 57
  br i1 %41, label %_18.if.then.5, label %_19.if.else.5                            ; inst 58
_18.if.then.5:
  %42 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 59
  %43 = getelementptr %SegT, %SegT* %42, i32 0, i32 3                              ; inst 60
  %44 = add i32 %26, 1                                                             ; inst 61
  %45 = call i64 @build([2000 x %SegT]* %0, i64* %1, i32 %44, i32 %15)             ; inst 62
  store i64 %45, i64* %43                                                          ; inst 63
  br label %_20.if.exit.5                                                          ; inst 64
_19.if.else.5:
  br label %_20.if.exit.5                                                          ; inst 65
_20.if.exit.5:
  %46 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 66
  %47 = getelementptr %SegT, %SegT* %46, i32 0, i32 3                              ; inst 67
  %48 = load i64, i64* %47                                                         ; inst 68
  call void @update([2000 x %SegT]* %0, i64* %1, i64 %48, i32 %3, i32 %4)          ; inst 69
  br label %_21.if.exit.3                                                          ; inst 70
_21.if.exit.3:
  %49 = alloca %Food                                                               ; inst 71
  %50 = getelementptr %Food, %Food* %49, i32 0, i32 0                              ; inst 72
  store i32 0, i32* %50                                                            ; inst 73
  %51 = getelementptr %Food, %Food* %49, i32 0, i32 1                              ; inst 74
  store i32 0, i32* %51                                                            ; inst 75
  %52 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 76
  %53 = getelementptr %SegT, %SegT* %52, i32 0, i32 2                              ; inst 77
  %54 = load i64, i64* %53                                                         ; inst 78
  %55 = icmp ne i64 %54, 0                                                         ; inst 79
  br i1 %55, label %_22.if.then.6, label %_23.if.else.6                            ; inst 80
_22.if.then.6:
  %56 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 81
  %57 = alloca %Food                                                               ; inst 82
  call void @_5760lXTxXwm_lc_val(%Food* %57, %SegT* %56, [2000 x %SegT]* %0)       ; inst 83
  %58 = alloca %Food                                                               ; inst 84
  call void @memcpy(%Food* %5, %Food* %57, i64 8)                                  ; inst 85
  call void @memcpy(%Food* %6, %Food* %49, i64 8)                                  ; inst 86
  call void @_anpJvSCOn26_better(%Food* %58, %Food* %5, %Food* %6)                 ; inst 87
  call void @memcpy(%Food* %49, %Food* %58, i64 8)                                 ; inst 88
  br label %_24.if.exit.6                                                          ; inst 89
_23.if.else.6:
  br label %_24.if.exit.6                                                          ; inst 90
_24.if.exit.6:
  %59 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 91
  %60 = getelementptr %SegT, %SegT* %59, i32 0, i32 3                              ; inst 92
  %61 = load i64, i64* %60                                                         ; inst 93
  %62 = icmp ne i64 %61, 0                                                         ; inst 94
  br i1 %62, label %_25.if.then.7, label %_26.if.else.7                            ; inst 95
_25.if.then.7:
  %63 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 96
  %64 = alloca %Food                                                               ; inst 97
  call void @_5760lXTxXwm_rc_val(%Food* %64, %SegT* %63, [2000 x %SegT]* %0)       ; inst 98
  %65 = alloca %Food                                                               ; inst 99
  call void @memcpy(%Food* %7, %Food* %64, i64 8)                                  ; inst 100
  call void @memcpy(%Food* %8, %Food* %49, i64 8)                                  ; inst 101
  call void @_anpJvSCOn26_better(%Food* %65, %Food* %7, %Food* %8)                 ; inst 102
  call void @memcpy(%Food* %49, %Food* %65, i64 8)                                 ; inst 103
  br label %_27.if.exit.7                                                          ; inst 104
_26.if.else.7:
  br label %_27.if.exit.7                                                          ; inst 105
_27.if.exit.7:
  %66 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 106
  %67 = getelementptr %SegT, %SegT* %66, i32 0, i32 4                              ; inst 107
  call void @memcpy(%Food* %67, %Food* %49, i64 8)                                 ; inst 108
  ret void                                                                         ; inst 109
}

define void @_5760lXTxXwm_lc_val(%Food* sret(%Food) %0, %SegT* %1, [2000 x %SegT]* %2) {
_0.entry.0:
  %3 = getelementptr %SegT, %SegT* %1, i32 0, i32 2                                ; inst 1
  %4 = load i64, i64* %3                                                           ; inst 2
  %5 = getelementptr [2000 x %SegT], [2000 x %SegT]* %2, i32 0, i64 %4             ; inst 3
  %6 = getelementptr %SegT, %SegT* %5, i32 0, i32 4                                ; inst 4
  call void @memcpy(%Food* %0, %Food* %6, i64 8)                                   ; inst 5
  ret void                                                                         ; inst 6
}

define void @_5760lXTxXwm_rc_val(%Food* sret(%Food) %0, %SegT* %1, [2000 x %SegT]* %2) {
_0.entry.0:
  %3 = getelementptr %SegT, %SegT* %1, i32 0, i32 3                                ; inst 1
  %4 = load i64, i64* %3                                                           ; inst 2
  %5 = getelementptr [2000 x %SegT], [2000 x %SegT]* %2, i32 0, i64 %4             ; inst 3
  %6 = getelementptr %SegT, %SegT* %5, i32 0, i32 4                                ; inst 4
  call void @memcpy(%Food* %0, %Food* %6, i64 8)                                   ; inst 5
  ret void                                                                         ; inst 6
}

define i64 @merge([2000 x %SegT]* %0, i64* %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = alloca %Food                                                                ; inst 1
  %5 = alloca %Food                                                                ; inst 2
  %6 = alloca %Food                                                                ; inst 3
  %7 = alloca %Food                                                                ; inst 4
  %8 = icmp eq i64 %2, 0                                                           ; inst 5
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 6
_1.if.then.0:
  ret i64 %3                                                                       ; inst 7
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 8
_3.if.exit.0:
  %9 = icmp eq i64 %3, 0                                                           ; inst 9
  br i1 %9, label %_4.if.then.1, label %_5.if.else.1                               ; inst 10
_4.if.then.1:
  ret i64 %2                                                                       ; inst 11
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 12
_6.if.exit.1:
  %10 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 13
  %11 = getelementptr %SegT, %SegT* %10, i32 0, i32 0                              ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 16
  %14 = getelementptr %SegT, %SegT* %13, i32 0, i32 1                              ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  %16 = icmp eq i32 %12, %15                                                       ; inst 19
  br i1 %16, label %_7.if.then.2, label %_8.if.else.2                              ; inst 20
_7.if.then.2:
  %17 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 21
  %18 = getelementptr %SegT, %SegT* %17, i32 0, i32 4                              ; inst 22
  %19 = getelementptr %Food, %Food* %18, i32 0, i32 0                              ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %3            ; inst 25
  %22 = getelementptr %SegT, %SegT* %21, i32 0, i32 4                              ; inst 26
  %23 = getelementptr %Food, %Food* %22, i32 0, i32 0                              ; inst 27
  %24 = load i32, i32* %23                                                         ; inst 28
  %25 = add i32 %20, %24                                                           ; inst 29
  store i32 %25, i32* %19                                                          ; inst 30
  ret i64 %2                                                                       ; inst 31
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 32
_9.if.exit.2:
  %26 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 33
  %27 = getelementptr %SegT, %SegT* %26, i32 0, i32 2                              ; inst 34
  %28 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 35
  %29 = getelementptr %SegT, %SegT* %28, i32 0, i32 2                              ; inst 36
  %30 = load i64, i64* %29                                                         ; inst 37
  %31 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %3            ; inst 38
  %32 = getelementptr %SegT, %SegT* %31, i32 0, i32 2                              ; inst 39
  %33 = load i64, i64* %32                                                         ; inst 40
  %34 = call i64 @merge([2000 x %SegT]* %0, i64* %1, i64 %30, i64 %33)             ; inst 41
  store i64 %34, i64* %27                                                          ; inst 42
  %35 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 43
  %36 = getelementptr %SegT, %SegT* %35, i32 0, i32 3                              ; inst 44
  %37 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 45
  %38 = getelementptr %SegT, %SegT* %37, i32 0, i32 3                              ; inst 46
  %39 = load i64, i64* %38                                                         ; inst 47
  %40 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %3            ; inst 48
  %41 = getelementptr %SegT, %SegT* %40, i32 0, i32 3                              ; inst 49
  %42 = load i64, i64* %41                                                         ; inst 50
  %43 = call i64 @merge([2000 x %SegT]* %0, i64* %1, i64 %39, i64 %42)             ; inst 51
  store i64 %43, i64* %36                                                          ; inst 52
  %44 = alloca %Food                                                               ; inst 53
  %45 = getelementptr %Food, %Food* %44, i32 0, i32 0                              ; inst 54
  store i32 0, i32* %45                                                            ; inst 55
  %46 = getelementptr %Food, %Food* %44, i32 0, i32 1                              ; inst 56
  store i32 0, i32* %46                                                            ; inst 57
  %47 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 58
  %48 = getelementptr %SegT, %SegT* %47, i32 0, i32 2                              ; inst 59
  %49 = load i64, i64* %48                                                         ; inst 60
  %50 = icmp ne i64 %49, 0                                                         ; inst 61
  br i1 %50, label %_10.if.then.3, label %_11.if.else.3                            ; inst 62
_10.if.then.3:
  %51 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 63
  %52 = alloca %Food                                                               ; inst 64
  call void @_5760lXTxXwm_lc_val(%Food* %52, %SegT* %51, [2000 x %SegT]* %0)       ; inst 65
  %53 = alloca %Food                                                               ; inst 66
  call void @memcpy(%Food* %4, %Food* %52, i64 8)                                  ; inst 67
  call void @memcpy(%Food* %5, %Food* %44, i64 8)                                  ; inst 68
  call void @_anpJvSCOn26_better(%Food* %53, %Food* %4, %Food* %5)                 ; inst 69
  call void @memcpy(%Food* %44, %Food* %53, i64 8)                                 ; inst 70
  br label %_12.if.exit.3                                                          ; inst 71
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 72
_12.if.exit.3:
  %54 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 73
  %55 = getelementptr %SegT, %SegT* %54, i32 0, i32 3                              ; inst 74
  %56 = load i64, i64* %55                                                         ; inst 75
  %57 = icmp ne i64 %56, 0                                                         ; inst 76
  br i1 %57, label %_13.if.then.4, label %_14.if.else.4                            ; inst 77
_13.if.then.4:
  %58 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 78
  %59 = alloca %Food                                                               ; inst 79
  call void @_5760lXTxXwm_rc_val(%Food* %59, %SegT* %58, [2000 x %SegT]* %0)       ; inst 80
  %60 = alloca %Food                                                               ; inst 81
  call void @memcpy(%Food* %6, %Food* %59, i64 8)                                  ; inst 82
  call void @memcpy(%Food* %7, %Food* %44, i64 8)                                  ; inst 83
  call void @_anpJvSCOn26_better(%Food* %60, %Food* %6, %Food* %7)                 ; inst 84
  call void @memcpy(%Food* %44, %Food* %60, i64 8)                                 ; inst 85
  br label %_15.if.exit.4                                                          ; inst 86
_14.if.else.4:
  br label %_15.if.exit.4                                                          ; inst 87
_15.if.exit.4:
  %61 = getelementptr [2000 x %SegT], [2000 x %SegT]* %0, i32 0, i64 %2            ; inst 88
  %62 = getelementptr %SegT, %SegT* %61, i32 0, i32 4                              ; inst 89
  call void @memcpy(%Food* %62, %Food* %44, i64 8)                                 ; inst 90
  ret i64 %2                                                                       ; inst 91
}

define void @_250uMAnM4NY_push(%Node* %0, i64 %1) {
_0.entry.0:
  %2 = getelementptr %Node, %Node* %0, i32 0, i32 0                                ; inst 1
  %3 = getelementptr %Node, %Node* %0, i32 0, i32 1                                ; inst 2
  %4 = load i64, i64* %3                                                           ; inst 3
  %5 = getelementptr [201 x i64], [201 x i64]* %2, i32 0, i64 %4                   ; inst 4
  store i64 %1, i64* %5                                                            ; inst 5
  %6 = getelementptr %Node, %Node* %0, i32 0, i32 1                                ; inst 6
  %7 = load i64, i64* %6                                                           ; inst 7
  %8 = add i64 %7, 1                                                               ; inst 8
  store i64 %8, i64* %6                                                            ; inst 9
  ret void                                                                         ; inst 10
}

define void @_250uMAnM4NY_clear(%Node* %0) {
_0.entry.0:
  %1 = getelementptr %Node, %Node* %0, i32 0, i32 1                                ; inst 1
  store i64 0, i64* %1                                                             ; inst 2
  ret void                                                                         ; inst 3
}

define void @prepare([201 x %Node]* %0, i64 %1, i64 %2) {
_0.entry.0:
  %3 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %1               ; inst 1
  %4 = getelementptr %Node, %Node* %3, i32 0, i32 3                                ; inst 2
  %5 = getelementptr [11 x i64], [11 x i64]* %4, i32 0, i64 0                      ; inst 3
  store i64 %2, i64* %5                                                            ; inst 4
  %6 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %1               ; inst 5
  %7 = getelementptr %Node, %Node* %6, i32 0, i32 2                                ; inst 6
  %8 = icmp eq i64 %2, 0                                                           ; inst 7
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 8
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 9
_2.if.else.0:
  %9 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %2               ; inst 10
  %10 = getelementptr %Node, %Node* %9, i32 0, i32 2                               ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = add i32 %11, 1                                                             ; inst 13
  br label %_3.if.exit.0                                                           ; inst 14
_3.if.exit.0:
  %13 = phi i32 [1, %_1.if.then.0], [%12, %_2.if.else.0]                           ; inst 15
  store i32 %13, i32* %7                                                           ; inst 16
  br label %_4.while.cond.0                                                        ; inst 17
_4.while.cond.0:
  %14 = phi i64 [1, %_3.if.exit.0], [%30, %_8.if.exit.1]                           ; inst 18
  %15 = icmp ule i64 %14, 10                                                       ; inst 19
  br i1 %15, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 20
_5.while.body.0:
  %16 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %1              ; inst 21
  %17 = getelementptr %Node, %Node* %16, i32 0, i32 3                              ; inst 22
  %18 = sub i64 %14, 1                                                             ; inst 23
  %19 = getelementptr [11 x i64], [11 x i64]* %17, i32 0, i64 %18                  ; inst 24
  %20 = load i64, i64* %19                                                         ; inst 25
  %21 = icmp ne i64 %20, 0                                                         ; inst 26
  br i1 %21, label %_6.if.then.1, label %_7.if.else.1                              ; inst 27
_6.if.then.1:
  %22 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %1              ; inst 28
  %23 = getelementptr %Node, %Node* %22, i32 0, i32 3                              ; inst 29
  %24 = getelementptr [11 x i64], [11 x i64]* %23, i32 0, i64 %14                  ; inst 30
  %25 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %20             ; inst 31
  %26 = getelementptr %Node, %Node* %25, i32 0, i32 3                              ; inst 32
  %27 = sub i64 %14, 1                                                             ; inst 33
  %28 = getelementptr [11 x i64], [11 x i64]* %26, i32 0, i64 %27                  ; inst 34
  %29 = load i64, i64* %28                                                         ; inst 35
  store i64 %29, i64* %24                                                          ; inst 36
  br label %_8.if.exit.1                                                           ; inst 37
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 38
_8.if.exit.1:
  %30 = add i64 %14, 1                                                             ; inst 39
  br label %_4.while.cond.0                                                        ; inst 40
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 41
_10.while.cond.1:
  %31 = phi i64 [0, %_9.while.exit.0], [%40, %_12.if.then.2], [%40, %_14.if.exit.2] ; inst 42
  %32 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %1              ; inst 43
  %33 = getelementptr %Node, %Node* %32, i32 0, i32 1                              ; inst 44
  %34 = load i64, i64* %33                                                         ; inst 45
  %35 = icmp ult i64 %31, %34                                                      ; inst 46
  br i1 %35, label %_11.while.body.1, label %_15.while.exit.1                      ; inst 47
_11.while.body.1:
  %36 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %1              ; inst 48
  %37 = getelementptr %Node, %Node* %36, i32 0, i32 0                              ; inst 49
  %38 = getelementptr [201 x i64], [201 x i64]* %37, i32 0, i64 %31                ; inst 50
  %39 = load i64, i64* %38                                                         ; inst 51
  %40 = add i64 %31, 1                                                             ; inst 52
  %41 = icmp eq i64 %39, %2                                                        ; inst 53
  br i1 %41, label %_12.if.then.2, label %_13.if.else.2                            ; inst 54
_12.if.then.2:
  br label %_10.while.cond.1                                                       ; inst 55
_13.if.else.2:
  br label %_14.if.exit.2                                                          ; inst 56
_14.if.exit.2:
  call void @prepare([201 x %Node]* %0, i64 %39, i64 %1)                           ; inst 57
  br label %_10.while.cond.1                                                       ; inst 58
_15.while.exit.1:
  ret void                                                                         ; inst 59
}

define i64 @lca([201 x %Node]* %0, i64 %1, i64 %2) {
_0.entry.0:
  %3 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %1               ; inst 1
  %4 = getelementptr %Node, %Node* %3, i32 0, i32 2                                ; inst 2
  %5 = load i32, i32* %4                                                           ; inst 3
  %6 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %2               ; inst 4
  %7 = getelementptr %Node, %Node* %6, i32 0, i32 2                                ; inst 5
  %8 = load i32, i32* %7                                                           ; inst 6
  %9 = icmp slt i32 %5, %8                                                         ; inst 7
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 8
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 9
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 10
_3.if.exit.0:
  %10 = phi i64 [%1, %_1.if.then.0], [%2, %_2.if.else.0]                           ; inst 11
  %11 = phi i64 [%2, %_1.if.then.0], [%1, %_2.if.else.0]                           ; inst 12
  %12 = trunc i64 10 to i32                                                        ; inst 13
  br label %_4.while.cond.0                                                        ; inst 14
_4.while.cond.0:
  %13 = phi i32 [%12, %_3.if.exit.0], [%31, %_11.if.exit.1]                        ; inst 15
  %14 = phi i64 [%11, %_3.if.exit.0], [%30, %_11.if.exit.1]                        ; inst 16
  %15 = icmp sge i32 %13, 0                                                        ; inst 17
  br i1 %15, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 18
_5.while.body.0:
  %16 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %14             ; inst 19
  %17 = getelementptr %Node, %Node* %16, i32 0, i32 3                              ; inst 20
  %18 = sext i32 %13 to i64                                                        ; inst 21
  %19 = getelementptr [11 x i64], [11 x i64]* %17, i32 0, i64 %18                  ; inst 22
  %20 = load i64, i64* %19                                                         ; inst 23
  %21 = icmp ne i64 %20, 0                                                         ; inst 24
  br i1 %21, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 25
_6.lazy.then.0:
  %22 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %20             ; inst 26
  %23 = getelementptr %Node, %Node* %22, i32 0, i32 2                              ; inst 27
  %24 = load i32, i32* %23                                                         ; inst 28
  %25 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %10             ; inst 29
  %26 = getelementptr %Node, %Node* %25, i32 0, i32 2                              ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = icmp sge i32 %24, %27                                                      ; inst 32
  br label %_8.lazy.exit.0                                                         ; inst 33
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 34
_8.lazy.exit.0:
  %29 = phi i1 [%28, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 35
  br i1 %29, label %_9.if.then.1, label %_10.if.else.1                             ; inst 36
_9.if.then.1:
  br label %_11.if.exit.1                                                          ; inst 37
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 38
_11.if.exit.1:
  %30 = phi i64 [%20, %_9.if.then.1], [%14, %_10.if.else.1]                        ; inst 39
  %31 = sub i32 %13, 1                                                             ; inst 40
  br label %_4.while.cond.0                                                        ; inst 41
_12.while.exit.0:
  %32 = icmp eq i64 %14, %10                                                       ; inst 42
  br i1 %32, label %_13.if.then.2, label %_14.if.else.2                            ; inst 43
_13.if.then.2:
  ret i64 %14                                                                      ; inst 44
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 45
_15.if.exit.2:
  %33 = trunc i64 10 to i32                                                        ; inst 46
  br label %_16.while.cond.1                                                       ; inst 47
_16.while.cond.1:
  %34 = phi i32 [%33, %_15.if.exit.2], [%61, %_20.if.exit.3]                       ; inst 48
  %35 = phi i64 [%10, %_15.if.exit.2], [%59, %_20.if.exit.3]                       ; inst 49
  %36 = phi i64 [%14, %_15.if.exit.2], [%60, %_20.if.exit.3]                       ; inst 50
  %37 = icmp sge i32 %34, 0                                                        ; inst 51
  br i1 %37, label %_17.while.body.1, label %_21.while.exit.1                      ; inst 52
_17.while.body.1:
  %38 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %36             ; inst 53
  %39 = getelementptr %Node, %Node* %38, i32 0, i32 3                              ; inst 54
  %40 = sext i32 %34 to i64                                                        ; inst 55
  %41 = getelementptr [11 x i64], [11 x i64]* %39, i32 0, i64 %40                  ; inst 56
  %42 = load i64, i64* %41                                                         ; inst 57
  %43 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %35             ; inst 58
  %44 = getelementptr %Node, %Node* %43, i32 0, i32 3                              ; inst 59
  %45 = sext i32 %34 to i64                                                        ; inst 60
  %46 = getelementptr [11 x i64], [11 x i64]* %44, i32 0, i64 %45                  ; inst 61
  %47 = load i64, i64* %46                                                         ; inst 62
  %48 = icmp ne i64 %42, %47                                                       ; inst 63
  br i1 %48, label %_18.if.then.3, label %_19.if.else.3                            ; inst 64
_18.if.then.3:
  %49 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %36             ; inst 65
  %50 = getelementptr %Node, %Node* %49, i32 0, i32 3                              ; inst 66
  %51 = sext i32 %34 to i64                                                        ; inst 67
  %52 = getelementptr [11 x i64], [11 x i64]* %50, i32 0, i64 %51                  ; inst 68
  %53 = load i64, i64* %52                                                         ; inst 69
  %54 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %35             ; inst 70
  %55 = getelementptr %Node, %Node* %54, i32 0, i32 3                              ; inst 71
  %56 = sext i32 %34 to i64                                                        ; inst 72
  %57 = getelementptr [11 x i64], [11 x i64]* %55, i32 0, i64 %56                  ; inst 73
  %58 = load i64, i64* %57                                                         ; inst 74
  br label %_20.if.exit.3                                                          ; inst 75
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 76
_20.if.exit.3:
  %59 = phi i64 [%58, %_18.if.then.3], [%35, %_19.if.else.3]                       ; inst 77
  %60 = phi i64 [%53, %_18.if.then.3], [%36, %_19.if.else.3]                       ; inst 78
  %61 = sub i32 %34, 1                                                             ; inst 79
  br label %_16.while.cond.1                                                       ; inst 80
_21.while.exit.1:
  %62 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %36             ; inst 81
  %63 = getelementptr %Node, %Node* %62, i32 0, i32 3                              ; inst 82
  %64 = getelementptr [11 x i64], [11 x i64]* %63, i32 0, i64 0                    ; inst 83
  %65 = load i64, i64* %64                                                         ; inst 84
  ret i64 %65                                                                      ; inst 85
}

define void @dfs([201 x %Node]* %0, [2000 x %SegT]* %1, i64* %2, i64 %3, i64 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i64 [0, %_0.entry.0], [%14, %_3.if.then.0], [%14, %_5.if.exit.0]        ; inst 2
  %6 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %3               ; inst 3
  %7 = getelementptr %Node, %Node* %6, i32 0, i32 1                                ; inst 4
  %8 = load i64, i64* %7                                                           ; inst 5
  %9 = icmp ult i64 %5, %8                                                         ; inst 6
  br i1 %9, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 7
_2.while.body.0:
  %10 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %3              ; inst 8
  %11 = getelementptr %Node, %Node* %10, i32 0, i32 0                              ; inst 9
  %12 = getelementptr [201 x i64], [201 x i64]* %11, i32 0, i64 %5                 ; inst 10
  %13 = load i64, i64* %12                                                         ; inst 11
  %14 = add i64 %5, 1                                                              ; inst 12
  %15 = icmp eq i64 %13, %4                                                        ; inst 13
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 14
_3.if.then.0:
  br label %_1.while.cond.0                                                        ; inst 15
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 16
_5.if.exit.0:
  call void @dfs([201 x %Node]* %0, [2000 x %SegT]* %1, i64* %2, i64 %13, i64 %3)  ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  %16 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %3              ; inst 19
  %17 = getelementptr %Node, %Node* %16, i32 0, i32 5                              ; inst 20
  %18 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %3              ; inst 21
  %19 = getelementptr %Node, %Node* %18, i32 0, i32 4                              ; inst 22
  %20 = load i64, i64* %19                                                         ; inst 23
  %21 = getelementptr [2000 x %SegT], [2000 x %SegT]* %1, i32 0, i64 %20           ; inst 24
  %22 = getelementptr %SegT, %SegT* %21, i32 0, i32 4                              ; inst 25
  %23 = getelementptr %Food, %Food* %22, i32 0, i32 1                              ; inst 26
  %24 = load i32, i32* %23                                                         ; inst 27
  store i32 %24, i32* %17                                                          ; inst 28
  %25 = icmp ne i64 %4, 0                                                          ; inst 29
  br i1 %25, label %_7.if.then.1, label %_8.if.else.1                              ; inst 30
_7.if.then.1:
  %26 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %4              ; inst 31
  %27 = getelementptr %Node, %Node* %26, i32 0, i32 4                              ; inst 32
  %28 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %4              ; inst 33
  %29 = getelementptr %Node, %Node* %28, i32 0, i32 4                              ; inst 34
  %30 = load i64, i64* %29                                                         ; inst 35
  %31 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %3              ; inst 36
  %32 = getelementptr %Node, %Node* %31, i32 0, i32 4                              ; inst 37
  %33 = load i64, i64* %32                                                         ; inst 38
  %34 = call i64 @merge([2000 x %SegT]* %1, i64* %2, i64 %30, i64 %33)             ; inst 39
  store i64 %34, i64* %27                                                          ; inst 40
  br label %_9.if.exit.1                                                           ; inst 41
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 42
_9.if.exit.1:
  ret void                                                                         ; inst 43
}

define void @main() {
_0.entry.0:
  %0 = alloca [201 x %Node]                                                        ; inst 1
  %1 = alloca %Node                                                                ; inst 2
  %2 = getelementptr %Node, %Node* %1, i32 0, i32 0                                ; inst 3
  %3 = getelementptr [201 x i64], [201 x i64]* %2, i32 0, i32 0                    ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 201                                                        ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i64, i64* %3, i32 %4                                          ; inst 9
  store i64 0, i64* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr %Node, %Node* %1, i32 0, i32 1                                ; inst 13
  store i64 0, i64* %8                                                             ; inst 14
  %9 = getelementptr %Node, %Node* %1, i32 0, i32 2                                ; inst 15
  store i32 0, i32* %9                                                             ; inst 16
  %10 = getelementptr %Node, %Node* %1, i32 0, i32 3                               ; inst 17
  %11 = getelementptr [11 x i64], [11 x i64]* %10, i32 0, i32 0                    ; inst 18
  br label %_4.array.cond.1                                                        ; inst 19
_4.array.cond.1:
  %12 = phi i32 [0, %_3.array.exit.0], [%15, %_5.array.body.1]                     ; inst 20
  %13 = icmp slt i32 %12, 11                                                       ; inst 21
  br i1 %13, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 22
_5.array.body.1:
  %14 = getelementptr i64, i64* %11, i32 %12                                       ; inst 23
  store i64 0, i64* %14                                                            ; inst 24
  %15 = add i32 %12, 1                                                             ; inst 25
  br label %_4.array.cond.1                                                        ; inst 26
_6.array.exit.1:
  %16 = getelementptr %Node, %Node* %1, i32 0, i32 4                               ; inst 27
  store i64 0, i64* %16                                                            ; inst 28
  %17 = getelementptr %Node, %Node* %1, i32 0, i32 5                               ; inst 29
  store i32 0, i32* %17                                                            ; inst 30
  %18 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i32 0               ; inst 31
  br label %_7.array.cond.2                                                        ; inst 32
_7.array.cond.2:
  %19 = phi i32 [0, %_6.array.exit.1], [%22, %_8.array.body.2]                     ; inst 33
  %20 = icmp slt i32 %19, 201                                                      ; inst 34
  br i1 %20, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 35
_8.array.body.2:
  %21 = getelementptr %Node, %Node* %18, i32 %19                                   ; inst 36
  call void @memcpy(%Node* %21, %Node* %1, i64 1728)                               ; inst 37
  %22 = add i32 %19, 1                                                             ; inst 38
  br label %_7.array.cond.2                                                        ; inst 39
_9.array.exit.2:
  %23 = alloca [2000 x %SegT]                                                      ; inst 40
  %24 = alloca %SegT                                                               ; inst 41
  %25 = getelementptr %SegT, %SegT* %24, i32 0, i32 0                              ; inst 42
  store i32 0, i32* %25                                                            ; inst 43
  %26 = getelementptr %SegT, %SegT* %24, i32 0, i32 1                              ; inst 44
  store i32 0, i32* %26                                                            ; inst 45
  %27 = getelementptr %SegT, %SegT* %24, i32 0, i32 2                              ; inst 46
  store i64 0, i64* %27                                                            ; inst 47
  %28 = getelementptr %SegT, %SegT* %24, i32 0, i32 3                              ; inst 48
  store i64 0, i64* %28                                                            ; inst 49
  %29 = getelementptr %SegT, %SegT* %24, i32 0, i32 4                              ; inst 50
  %30 = getelementptr %Food, %Food* %29, i32 0, i32 0                              ; inst 51
  store i32 0, i32* %30                                                            ; inst 52
  %31 = getelementptr %Food, %Food* %29, i32 0, i32 1                              ; inst 53
  store i32 0, i32* %31                                                            ; inst 54
  %32 = getelementptr [2000 x %SegT], [2000 x %SegT]* %23, i32 0, i32 0            ; inst 55
  br label %_10.array.cond.3                                                       ; inst 56
_10.array.cond.3:
  %33 = phi i32 [0, %_9.array.exit.2], [%36, %_11.array.body.3]                    ; inst 57
  %34 = icmp slt i32 %33, 2000                                                     ; inst 58
  br i1 %34, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 59
_11.array.body.3:
  %35 = getelementptr %SegT, %SegT* %32, i32 %33                                   ; inst 60
  call void @memcpy(%SegT* %35, %SegT* %24, i64 32)                                ; inst 61
  %36 = add i32 %33, 1                                                             ; inst 62
  br label %_10.array.cond.3                                                       ; inst 63
_12.array.exit.3:
  %37 = alloca i64                                                                 ; inst 64
  store i64 0, i64* %37                                                            ; inst 65
  %38 = call i32 @getInt()                                                         ; inst 66
  %39 = sext i32 %38 to i64                                                        ; inst 67
  %40 = call i32 @getInt()                                                         ; inst 68
  %41 = sext i32 %40 to i64                                                        ; inst 69
  br label %_13.while.cond.0                                                       ; inst 70
_13.while.cond.0:
  %42 = phi i64 [1, %_12.array.exit.3], [%49, %_14.while.body.0]                   ; inst 71
  %43 = icmp ule i64 %42, %39                                                      ; inst 72
  br i1 %43, label %_14.while.body.0, label %_15.while.exit.0                      ; inst 73
_14.while.body.0:
  %44 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %42             ; inst 74
  call void @_250uMAnM4NY_clear(%Node* %44)                                        ; inst 75
  %45 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %42             ; inst 76
  %46 = getelementptr %Node, %Node* %45, i32 0, i32 4                              ; inst 77
  %47 = trunc i64 200 to i32                                                       ; inst 78
  %48 = call i64 @build([2000 x %SegT]* %23, i64* %37, i32 1, i32 %47)             ; inst 79
  store i64 %48, i64* %46                                                          ; inst 80
  %49 = add i64 %42, 1                                                             ; inst 81
  br label %_13.while.cond.0                                                       ; inst 82
_15.while.exit.0:
  br label %_16.while.cond.1                                                       ; inst 83
_16.while.cond.1:
  %50 = phi i64 [0, %_15.while.exit.0], [%59, %_17.while.body.1]                   ; inst 84
  %51 = sub i64 %39, 1                                                             ; inst 85
  %52 = icmp ult i64 %50, %51                                                      ; inst 86
  br i1 %52, label %_17.while.body.1, label %_18.while.exit.1                      ; inst 87
_17.while.body.1:
  %53 = call i32 @getInt()                                                         ; inst 88
  %54 = sext i32 %53 to i64                                                        ; inst 89
  %55 = call i32 @getInt()                                                         ; inst 90
  %56 = sext i32 %55 to i64                                                        ; inst 91
  %57 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %54             ; inst 92
  call void @_250uMAnM4NY_push(%Node* %57, i64 %56)                                ; inst 93
  %58 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %56             ; inst 94
  call void @_250uMAnM4NY_push(%Node* %58, i64 %54)                                ; inst 95
  %59 = add i64 %50, 1                                                             ; inst 96
  br label %_16.while.cond.1                                                       ; inst 97
_18.while.exit.1:
  call void @prepare([201 x %Node]* %0, i64 1, i64 0)                              ; inst 98
  br label %_19.while.cond.2                                                       ; inst 99
_19.while.cond.2:
  %60 = phi i64 [0, %_18.while.exit.1], [%89, %_23.if.exit.0]                      ; inst 100
  %61 = icmp ult i64 %60, %41                                                      ; inst 101
  br i1 %61, label %_20.while.body.2, label %_24.while.exit.2                      ; inst 102
_20.while.body.2:
  %62 = call i32 @getInt()                                                         ; inst 103
  %63 = sext i32 %62 to i64                                                        ; inst 104
  %64 = call i32 @getInt()                                                         ; inst 105
  %65 = sext i32 %64 to i64                                                        ; inst 106
  %66 = call i32 @getInt()                                                         ; inst 107
  %67 = call i64 @lca([201 x %Node]* %0, i64 %63, i64 %65)                         ; inst 108
  %68 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %63             ; inst 109
  %69 = getelementptr %Node, %Node* %68, i32 0, i32 4                              ; inst 110
  %70 = load i64, i64* %69                                                         ; inst 111
  call void @update([2000 x %SegT]* %23, i64* %37, i64 %70, i32 %66, i32 1)        ; inst 112
  %71 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %65             ; inst 113
  %72 = getelementptr %Node, %Node* %71, i32 0, i32 4                              ; inst 114
  %73 = load i64, i64* %72                                                         ; inst 115
  call void @update([2000 x %SegT]* %23, i64* %37, i64 %73, i32 %66, i32 1)        ; inst 116
  %74 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %67             ; inst 117
  %75 = getelementptr %Node, %Node* %74, i32 0, i32 4                              ; inst 118
  %76 = load i64, i64* %75                                                         ; inst 119
  call void @update([2000 x %SegT]* %23, i64* %37, i64 %76, i32 %66, i32 -1)       ; inst 120
  %77 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %67             ; inst 121
  %78 = getelementptr %Node, %Node* %77, i32 0, i32 3                              ; inst 122
  %79 = getelementptr [11 x i64], [11 x i64]* %78, i32 0, i64 0                    ; inst 123
  %80 = load i64, i64* %79                                                         ; inst 124
  %81 = icmp ne i64 %80, 0                                                         ; inst 125
  br i1 %81, label %_21.if.then.0, label %_22.if.else.0                            ; inst 126
_21.if.then.0:
  %82 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %67             ; inst 127
  %83 = getelementptr %Node, %Node* %82, i32 0, i32 3                              ; inst 128
  %84 = getelementptr [11 x i64], [11 x i64]* %83, i32 0, i64 0                    ; inst 129
  %85 = load i64, i64* %84                                                         ; inst 130
  %86 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %85             ; inst 131
  %87 = getelementptr %Node, %Node* %86, i32 0, i32 4                              ; inst 132
  %88 = load i64, i64* %87                                                         ; inst 133
  call void @update([2000 x %SegT]* %23, i64* %37, i64 %88, i32 %66, i32 -1)       ; inst 134
  br label %_23.if.exit.0                                                          ; inst 135
_22.if.else.0:
  br label %_23.if.exit.0                                                          ; inst 136
_23.if.exit.0:
  %89 = add i64 %60, 1                                                             ; inst 137
  br label %_19.while.cond.2                                                       ; inst 138
_24.while.exit.2:
  call void @dfs([201 x %Node]* %0, [2000 x %SegT]* %23, i64* %37, i64 1, i64 0)   ; inst 139
  br label %_25.while.cond.3                                                       ; inst 140
_25.while.cond.3:
  %90 = phi i64 [1, %_24.while.exit.2], [%95, %_26.while.body.3]                   ; inst 141
  %91 = icmp ule i64 %90, %39                                                      ; inst 142
  br i1 %91, label %_26.while.body.3, label %_27.while.exit.3                      ; inst 143
_26.while.body.3:
  %92 = getelementptr [201 x %Node], [201 x %Node]* %0, i32 0, i64 %90             ; inst 144
  %93 = getelementptr %Node, %Node* %92, i32 0, i32 5                              ; inst 145
  %94 = load i32, i32* %93                                                         ; inst 146
  call void @printlnInt(i32 %94)                                                   ; inst 147
  %95 = add i64 %90, 1                                                             ; inst 148
  br label %_25.while.cond.3                                                       ; inst 149
_27.while.exit.3:
  call void @exit(i32 0)                                                           ; inst 150
  ret void                                                                         ; inst 151
}

