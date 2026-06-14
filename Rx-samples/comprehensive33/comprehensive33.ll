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


%Agent = type { i32, i32, i32, i32, i32, i32, i1 }
%World = type { [50 x [50 x i32]], [20 x %Agent] }

define i32 @pm_rand_update(i32 %0) {
_0.entry.0:
  %1 = sdiv i32 %0, 127773                                                         ; inst 1
  %2 = mul i32 %1, 127773                                                          ; inst 2
  %3 = sub i32 %0, %2                                                              ; inst 3
  %4 = mul i32 16807, %3                                                           ; inst 4
  %5 = mul i32 2836, %1                                                            ; inst 5
  %6 = sub i32 %4, %5                                                              ; inst 6
  %7 = icmp sle i32 %6, 0                                                          ; inst 7
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 8
_1.if.then.0:
  %8 = add i32 %6, 2147483647                                                      ; inst 9
  br label %_3.if.exit.0                                                           ; inst 10
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 11
_3.if.exit.0:
  %9 = phi i32 [%8, %_1.if.then.0], [%6, %_2.if.else.0]                            ; inst 12
  ret i32 %9                                                                       ; inst 13
}

define void @main() {
_0.entry.0:
  %0 = alloca %World                                                               ; inst 1
  %1 = getelementptr %World, %World* %0, i32 0, i32 0                              ; inst 2
  %2 = alloca [50 x i32]                                                           ; inst 3
  %3 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i32 0                      ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 50                                                         ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %1, i32 0, i32 0        ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 50                                                        ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr [50 x i32], [50 x i32]* %8, i32 %9                           ; inst 18
  call void @memcpy([50 x i32]* %11, [50 x i32]* %2, i64 200)                      ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 22
  %14 = alloca %Agent                                                              ; inst 23
  %15 = getelementptr %Agent, %Agent* %14, i32 0, i32 0                            ; inst 24
  store i32 0, i32* %15                                                            ; inst 25
  %16 = getelementptr %Agent, %Agent* %14, i32 0, i32 1                            ; inst 26
  store i32 0, i32* %16                                                            ; inst 27
  %17 = getelementptr %Agent, %Agent* %14, i32 0, i32 2                            ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = getelementptr %Agent, %Agent* %14, i32 0, i32 3                            ; inst 30
  store i32 0, i32* %18                                                            ; inst 31
  %19 = getelementptr %Agent, %Agent* %14, i32 0, i32 4                            ; inst 32
  store i32 0, i32* %19                                                            ; inst 33
  %20 = getelementptr %Agent, %Agent* %14, i32 0, i32 5                            ; inst 34
  store i32 0, i32* %20                                                            ; inst 35
  %21 = getelementptr %Agent, %Agent* %14, i32 0, i32 6                            ; inst 36
  store i1 0, i1* %21                                                              ; inst 37
  %22 = getelementptr [20 x %Agent], [20 x %Agent]* %13, i32 0, i32 0              ; inst 38
  br label %_7.array.cond.2                                                        ; inst 39
_7.array.cond.2:
  %23 = phi i32 [0, %_6.array.exit.1], [%26, %_8.array.body.2]                     ; inst 40
  %24 = icmp slt i32 %23, 20                                                       ; inst 41
  br i1 %24, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 42
_8.array.body.2:
  %25 = getelementptr %Agent, %Agent* %22, i32 %23                                 ; inst 43
  call void @memcpy(%Agent* %25, %Agent* %14, i64 28)                              ; inst 44
  %26 = add i32 %23, 1                                                             ; inst 45
  br label %_7.array.cond.2                                                        ; inst 46
_9.array.exit.2:
  call void @initialize_world(%World* %0, i32 98765)                               ; inst 47
  br label %_10.while.cond.0                                                       ; inst 48
_10.while.cond.0:
  %27 = phi i32 [0, %_9.array.exit.2], [%31, %_14.if.exit.0]                       ; inst 49
  %28 = icmp slt i32 %27, 100                                                      ; inst 50
  br i1 %28, label %_11.while.body.0, label %_15.while.exit.0                      ; inst 51
_11.while.body.0:
  call void @update_world(%World* %0)                                              ; inst 52
  call void @process_interactions(%World* %0)                                      ; inst 53
  %29 = srem i32 %27, 10                                                           ; inst 54
  %30 = icmp eq i32 %29, 0                                                         ; inst 55
  br i1 %30, label %_12.if.then.0, label %_13.if.else.0                            ; inst 56
_12.if.then.0:
  call void @run_diagnostics(%World* %0)                                           ; inst 57
  br label %_14.if.exit.0                                                          ; inst 58
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 59
_14.if.exit.0:
  %31 = add i32 %27, 1                                                             ; inst 60
  br label %_10.while.cond.0                                                       ; inst 61
_15.while.exit.0:
  call void @final_report(%World* %0)                                              ; inst 62
  call void @printlnInt(i32 9999)                                                  ; inst 63
  call void @exit(i32 0)                                                           ; inst 64
  ret void                                                                         ; inst 65
}

define void @initialize_world(%World* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [%1, %_0.entry.0], [%15, %_2.while.body.0]                          ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%47, %_2.while.body.0]                           ; inst 3
  %4 = icmp slt i32 %3, 20                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = call i32 @pm_rand_update(i32 %2)                                            ; inst 6
  %6 = sdiv i32 %5, 65536                                                          ; inst 7
  %7 = srem i32 %6, 32768                                                          ; inst 8
  %8 = srem i32 %7, 50                                                             ; inst 9
  %9 = call i32 @pm_rand_update(i32 %7)                                            ; inst 10
  %10 = sdiv i32 %9, 65536                                                         ; inst 11
  %11 = srem i32 %10, 32768                                                        ; inst 12
  %12 = srem i32 %11, 50                                                           ; inst 13
  %13 = call i32 @pm_rand_update(i32 %11)                                          ; inst 14
  %14 = sdiv i32 %13, 65536                                                        ; inst 15
  %15 = srem i32 %14, 32768                                                        ; inst 16
  %16 = srem i32 %15, 100                                                          ; inst 17
  %17 = add i32 100, %16                                                           ; inst 18
  %18 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 19
  %19 = sext i32 %3 to i64                                                         ; inst 20
  %20 = getelementptr [20 x %Agent], [20 x %Agent]* %18, i32 0, i64 %19            ; inst 21
  %21 = getelementptr %Agent, %Agent* %20, i32 0, i32 0                            ; inst 22
  store i32 %3, i32* %21                                                           ; inst 23
  %22 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 24
  %23 = sext i32 %3 to i64                                                         ; inst 25
  %24 = getelementptr [20 x %Agent], [20 x %Agent]* %22, i32 0, i64 %23            ; inst 26
  %25 = getelementptr %Agent, %Agent* %24, i32 0, i32 1                            ; inst 27
  store i32 %8, i32* %25                                                           ; inst 28
  %26 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 29
  %27 = sext i32 %3 to i64                                                         ; inst 30
  %28 = getelementptr [20 x %Agent], [20 x %Agent]* %26, i32 0, i64 %27            ; inst 31
  %29 = getelementptr %Agent, %Agent* %28, i32 0, i32 2                            ; inst 32
  store i32 %12, i32* %29                                                          ; inst 33
  %30 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 34
  %31 = sext i32 %3 to i64                                                         ; inst 35
  %32 = getelementptr [20 x %Agent], [20 x %Agent]* %30, i32 0, i64 %31            ; inst 36
  %33 = getelementptr %Agent, %Agent* %32, i32 0, i32 3                            ; inst 37
  store i32 %17, i32* %33                                                          ; inst 38
  %34 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 39
  %35 = sext i32 %3 to i64                                                         ; inst 40
  %36 = getelementptr [20 x %Agent], [20 x %Agent]* %34, i32 0, i64 %35            ; inst 41
  %37 = getelementptr %Agent, %Agent* %36, i32 0, i32 6                            ; inst 42
  store i1 1, i1* %37                                                              ; inst 43
  %38 = getelementptr %World, %World* %0, i32 0, i32 0                             ; inst 44
  %39 = sext i32 %12 to i64                                                        ; inst 45
  %40 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %38, i32 0, i64 %39    ; inst 46
  %41 = sext i32 %8 to i64                                                         ; inst 47
  %42 = getelementptr [50 x i32], [50 x i32]* %40, i32 0, i64 %41                  ; inst 48
  %43 = add i32 %3, 1                                                              ; inst 49
  store i32 %43, i32* %42                                                          ; inst 50
  %44 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 51
  %45 = sext i32 %3 to i64                                                         ; inst 52
  %46 = getelementptr [20 x %Agent], [20 x %Agent]* %44, i32 0, i64 %45            ; inst 53
  call void @update_agent_target(%Agent* %46, i32 %15)                             ; inst 54
  %47 = add i32 %3, 1                                                              ; inst 55
  br label %_1.while.cond.0                                                        ; inst 56
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 57
_4.while.cond.1:
  %48 = phi i32 [%2, %_3.while.exit.0], [%52, %_14.while.exit.2]                   ; inst 58
  %49 = phi i32 [0, %_3.while.exit.0], [%76, %_14.while.exit.2]                    ; inst 59
  %50 = icmp slt i32 %49, 50                                                       ; inst 60
  br i1 %50, label %_5.while.body.1, label %_15.while.exit.1                       ; inst 61
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 62
_6.while.cond.2:
  %51 = phi i32 [0, %_5.while.body.1], [%75, %_13.if.exit.0]                       ; inst 63
  %52 = phi i32 [%48, %_5.while.body.1], [%74, %_13.if.exit.0]                     ; inst 64
  %53 = icmp slt i32 %51, 50                                                       ; inst 65
  br i1 %53, label %_7.while.body.2, label %_14.while.exit.2                       ; inst 66
_7.while.body.2:
  %54 = getelementptr %World, %World* %0, i32 0, i32 0                             ; inst 67
  %55 = sext i32 %49 to i64                                                        ; inst 68
  %56 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %54, i32 0, i64 %55    ; inst 69
  %57 = sext i32 %51 to i64                                                        ; inst 70
  %58 = getelementptr [50 x i32], [50 x i32]* %56, i32 0, i64 %57                  ; inst 71
  %59 = load i32, i32* %58                                                         ; inst 72
  %60 = icmp eq i32 %59, 0                                                         ; inst 73
  br i1 %60, label %_8.if.then.0, label %_12.if.else.0                             ; inst 74
_8.if.then.0:
  %61 = call i32 @pm_rand_update(i32 %52)                                          ; inst 75
  %62 = sdiv i32 %61, 65536                                                        ; inst 76
  %63 = srem i32 %62, 32768                                                        ; inst 77
  %64 = srem i32 %63, 10                                                           ; inst 78
  %65 = icmp eq i32 %64, 0                                                         ; inst 79
  br i1 %65, label %_9.if.then.1, label %_10.if.else.1                             ; inst 80
_9.if.then.1:
  %66 = getelementptr %World, %World* %0, i32 0, i32 0                             ; inst 81
  %67 = sext i32 %49 to i64                                                        ; inst 82
  %68 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %66, i32 0, i64 %67    ; inst 83
  %69 = sext i32 %51 to i64                                                        ; inst 84
  %70 = getelementptr [50 x i32], [50 x i32]* %68, i32 0, i64 %69                  ; inst 85
  %71 = srem i32 %63, 5                                                            ; inst 86
  %72 = add i32 %71, 1                                                             ; inst 87
  %73 = mul i32 -1, %72                                                            ; inst 88
  store i32 %73, i32* %70                                                          ; inst 89
  br label %_11.if.exit.1                                                          ; inst 90
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 91
_11.if.exit.1:
  br label %_13.if.exit.0                                                          ; inst 92
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 93
_13.if.exit.0:
  %74 = phi i32 [%63, %_11.if.exit.1], [%52, %_12.if.else.0]                       ; inst 94
  %75 = add i32 %51, 1                                                             ; inst 95
  br label %_6.while.cond.2                                                        ; inst 96
_14.while.exit.2:
  %76 = add i32 %49, 1                                                             ; inst 97
  br label %_4.while.cond.1                                                        ; inst 98
_15.while.exit.1:
  ret void                                                                         ; inst 99
}

define void @update_agent_target(%Agent* %0, i32 %1) {
_0.entry.0:
  %2 = call i32 @pm_rand_update(i32 %1)                                            ; inst 1
  %3 = sdiv i32 %2, 65536                                                          ; inst 2
  %4 = srem i32 %3, 32768                                                          ; inst 3
  %5 = getelementptr %Agent, %Agent* %0, i32 0, i32 4                              ; inst 4
  %6 = srem i32 %4, 50                                                             ; inst 5
  store i32 %6, i32* %5                                                            ; inst 6
  %7 = call i32 @pm_rand_update(i32 %4)                                            ; inst 7
  %8 = sdiv i32 %7, 65536                                                          ; inst 8
  %9 = srem i32 %8, 32768                                                          ; inst 9
  %10 = getelementptr %Agent, %Agent* %0, i32 0, i32 5                             ; inst 10
  %11 = srem i32 %9, 50                                                            ; inst 11
  store i32 %11, i32* %10                                                          ; inst 12
  ret void                                                                         ; inst 13
}

define void @update_world(%World* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%126, %_29.if.exit.0]                            ; inst 2
  %2 = icmp slt i32 %1, 20                                                         ; inst 3
  br i1 %2, label %_2.while.body.0, label %_30.while.exit.0                        ; inst 4
_2.while.body.0:
  %3 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [20 x %Agent], [20 x %Agent]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Agent, %Agent* %5, i32 0, i32 6                              ; inst 8
  %7 = load i1, i1* %6                                                             ; inst 9
  br i1 %7, label %_3.if.then.0, label %_28.if.else.0                              ; inst 10
_3.if.then.0:
  %8 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 11
  %9 = sext i32 %1 to i64                                                          ; inst 12
  %10 = getelementptr [20 x %Agent], [20 x %Agent]* %8, i32 0, i64 %9              ; inst 13
  %11 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 18
  %16 = load i32, i32* %15                                                         ; inst 19
  %17 = getelementptr %Agent, %Agent* %10, i32 0, i32 4                            ; inst 20
  %18 = load i32, i32* %17                                                         ; inst 21
  %19 = icmp slt i32 %16, %18                                                      ; inst 22
  br i1 %19, label %_4.if.then.1, label %_5.if.else.1                              ; inst 23
_4.if.then.1:
  %20 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 24
  %21 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 25
  %22 = load i32, i32* %21                                                         ; inst 26
  %23 = add i32 %22, 1                                                             ; inst 27
  store i32 %23, i32* %20                                                          ; inst 28
  br label %_9.if.exit.1                                                           ; inst 29
_5.if.else.1:
  %24 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 30
  %25 = load i32, i32* %24                                                         ; inst 31
  %26 = getelementptr %Agent, %Agent* %10, i32 0, i32 4                            ; inst 32
  %27 = load i32, i32* %26                                                         ; inst 33
  %28 = icmp sgt i32 %25, %27                                                      ; inst 34
  br i1 %28, label %_6.if.then.2, label %_7.if.else.2                              ; inst 35
_6.if.then.2:
  %29 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 36
  %30 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 37
  %31 = load i32, i32* %30                                                         ; inst 38
  %32 = sub i32 %31, 1                                                             ; inst 39
  store i32 %32, i32* %29                                                          ; inst 40
  br label %_8.if.exit.2                                                           ; inst 41
_7.if.else.2:
  br label %_8.if.exit.2                                                           ; inst 42
_8.if.exit.2:
  br label %_9.if.exit.1                                                           ; inst 43
_9.if.exit.1:
  %33 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 44
  %34 = load i32, i32* %33                                                         ; inst 45
  %35 = getelementptr %Agent, %Agent* %10, i32 0, i32 5                            ; inst 46
  %36 = load i32, i32* %35                                                         ; inst 47
  %37 = icmp slt i32 %34, %36                                                      ; inst 48
  br i1 %37, label %_10.if.then.3, label %_11.if.else.3                            ; inst 49
_10.if.then.3:
  %38 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 50
  %39 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 51
  %40 = load i32, i32* %39                                                         ; inst 52
  %41 = add i32 %40, 1                                                             ; inst 53
  store i32 %41, i32* %38                                                          ; inst 54
  br label %_15.if.exit.3                                                          ; inst 55
_11.if.else.3:
  %42 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 56
  %43 = load i32, i32* %42                                                         ; inst 57
  %44 = getelementptr %Agent, %Agent* %10, i32 0, i32 5                            ; inst 58
  %45 = load i32, i32* %44                                                         ; inst 59
  %46 = icmp sgt i32 %43, %45                                                      ; inst 60
  br i1 %46, label %_12.if.then.4, label %_13.if.else.4                            ; inst 61
_12.if.then.4:
  %47 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 62
  %48 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 63
  %49 = load i32, i32* %48                                                         ; inst 64
  %50 = sub i32 %49, 1                                                             ; inst 65
  store i32 %50, i32* %47                                                          ; inst 66
  br label %_14.if.exit.4                                                          ; inst 67
_13.if.else.4:
  br label %_14.if.exit.4                                                          ; inst 68
_14.if.exit.4:
  br label %_15.if.exit.3                                                          ; inst 69
_15.if.exit.3:
  %51 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 70
  %52 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 71
  %53 = load i32, i32* %52                                                         ; inst 72
  %54 = call i32 @clamp(i32 %53, i32 0, i32 49)                                    ; inst 73
  store i32 %54, i32* %51                                                          ; inst 74
  %55 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 75
  %56 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 76
  %57 = load i32, i32* %56                                                         ; inst 77
  %58 = call i32 @clamp(i32 %57, i32 0, i32 49)                                    ; inst 78
  store i32 %58, i32* %55                                                          ; inst 79
  %59 = getelementptr %Agent, %Agent* %10, i32 0, i32 3                            ; inst 80
  %60 = getelementptr %Agent, %Agent* %10, i32 0, i32 3                            ; inst 81
  %61 = load i32, i32* %60                                                         ; inst 82
  %62 = sub i32 %61, 1                                                             ; inst 83
  store i32 %62, i32* %59                                                          ; inst 84
  %63 = getelementptr %World, %World* %0, i32 0, i32 0                             ; inst 85
  %64 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 86
  %65 = load i32, i32* %64                                                         ; inst 87
  %66 = sext i32 %65 to i64                                                        ; inst 88
  %67 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %63, i32 0, i64 %66    ; inst 89
  %68 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 90
  %69 = load i32, i32* %68                                                         ; inst 91
  %70 = sext i32 %69 to i64                                                        ; inst 92
  %71 = getelementptr [50 x i32], [50 x i32]* %67, i32 0, i64 %70                  ; inst 93
  %72 = load i32, i32* %71                                                         ; inst 94
  %73 = icmp eq i32 %72, 0                                                         ; inst 95
  br i1 %73, label %_16.if.then.5, label %_17.if.else.5                            ; inst 96
_16.if.then.5:
  %74 = getelementptr %World, %World* %0, i32 0, i32 0                             ; inst 97
  %75 = sext i32 %14 to i64                                                        ; inst 98
  %76 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %74, i32 0, i64 %75    ; inst 99
  %77 = sext i32 %12 to i64                                                        ; inst 100
  %78 = getelementptr [50 x i32], [50 x i32]* %76, i32 0, i64 %77                  ; inst 101
  store i32 0, i32* %78                                                            ; inst 102
  %79 = getelementptr %World, %World* %0, i32 0, i32 0                             ; inst 103
  %80 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 104
  %81 = load i32, i32* %80                                                         ; inst 105
  %82 = sext i32 %81 to i64                                                        ; inst 106
  %83 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %79, i32 0, i64 %82    ; inst 107
  %84 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 108
  %85 = load i32, i32* %84                                                         ; inst 109
  %86 = sext i32 %85 to i64                                                        ; inst 110
  %87 = getelementptr [50 x i32], [50 x i32]* %83, i32 0, i64 %86                  ; inst 111
  %88 = getelementptr %Agent, %Agent* %10, i32 0, i32 0                            ; inst 112
  %89 = load i32, i32* %88                                                         ; inst 113
  %90 = add i32 %89, 1                                                             ; inst 114
  store i32 %90, i32* %87                                                          ; inst 115
  br label %_18.if.exit.5                                                          ; inst 116
_17.if.else.5:
  %91 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 117
  store i32 %12, i32* %91                                                          ; inst 118
  %92 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                            ; inst 119
  store i32 %14, i32* %92                                                          ; inst 120
  %93 = getelementptr %Agent, %Agent* %10, i32 0, i32 3                            ; inst 121
  %94 = getelementptr %Agent, %Agent* %10, i32 0, i32 3                            ; inst 122
  %95 = load i32, i32* %94                                                         ; inst 123
  %96 = sub i32 %95, 5                                                             ; inst 124
  store i32 %96, i32* %93                                                          ; inst 125
  br label %_18.if.exit.5                                                          ; inst 126
_18.if.exit.5:
  %97 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                            ; inst 127
  %98 = load i32, i32* %97                                                         ; inst 128
  %99 = getelementptr %Agent, %Agent* %10, i32 0, i32 4                            ; inst 129
  %100 = load i32, i32* %99                                                        ; inst 130
  %101 = icmp eq i32 %98, %100                                                     ; inst 131
  br i1 %101, label %_19.lazy.then.0, label %_20.lazy.else.0                       ; inst 132
_19.lazy.then.0:
  %102 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                           ; inst 133
  %103 = load i32, i32* %102                                                       ; inst 134
  %104 = getelementptr %Agent, %Agent* %10, i32 0, i32 5                           ; inst 135
  %105 = load i32, i32* %104                                                       ; inst 136
  %106 = icmp eq i32 %103, %105                                                    ; inst 137
  br label %_21.lazy.exit.0                                                        ; inst 138
_20.lazy.else.0:
  br label %_21.lazy.exit.0                                                        ; inst 139
_21.lazy.exit.0:
  %107 = phi i1 [%106, %_19.lazy.then.0], [0, %_20.lazy.else.0]                    ; inst 140
  br i1 %107, label %_22.if.then.6, label %_23.if.else.6                           ; inst 141
_22.if.then.6:
  %108 = getelementptr %Agent, %Agent* %10, i32 0, i32 0                           ; inst 142
  %109 = load i32, i32* %108                                                       ; inst 143
  %110 = getelementptr %Agent, %Agent* %10, i32 0, i32 3                           ; inst 144
  %111 = load i32, i32* %110                                                       ; inst 145
  %112 = add i32 %109, %111                                                        ; inst 146
  call void @update_agent_target(%Agent* %10, i32 %112)                            ; inst 147
  br label %_24.if.exit.6                                                          ; inst 148
_23.if.else.6:
  br label %_24.if.exit.6                                                          ; inst 149
_24.if.exit.6:
  %113 = getelementptr %Agent, %Agent* %10, i32 0, i32 3                           ; inst 150
  %114 = load i32, i32* %113                                                       ; inst 151
  %115 = icmp sle i32 %114, 0                                                      ; inst 152
  br i1 %115, label %_25.if.then.7, label %_26.if.else.7                           ; inst 153
_25.if.then.7:
  %116 = getelementptr %Agent, %Agent* %10, i32 0, i32 6                           ; inst 154
  store i1 0, i1* %116                                                             ; inst 155
  %117 = getelementptr %World, %World* %0, i32 0, i32 0                            ; inst 156
  %118 = getelementptr %Agent, %Agent* %10, i32 0, i32 2                           ; inst 157
  %119 = load i32, i32* %118                                                       ; inst 158
  %120 = sext i32 %119 to i64                                                      ; inst 159
  %121 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %117, i32 0, i64 %120 ; inst 160
  %122 = getelementptr %Agent, %Agent* %10, i32 0, i32 1                           ; inst 161
  %123 = load i32, i32* %122                                                       ; inst 162
  %124 = sext i32 %123 to i64                                                      ; inst 163
  %125 = getelementptr [50 x i32], [50 x i32]* %121, i32 0, i64 %124               ; inst 164
  store i32 0, i32* %125                                                           ; inst 165
  br label %_27.if.exit.7                                                          ; inst 166
_26.if.else.7:
  br label %_27.if.exit.7                                                          ; inst 167
_27.if.exit.7:
  br label %_29.if.exit.0                                                          ; inst 168
_28.if.else.0:
  br label %_29.if.exit.0                                                          ; inst 169
_29.if.exit.0:
  %126 = add i32 %1, 1                                                             ; inst 170
  br label %_1.while.cond.0                                                        ; inst 171
_30.while.exit.0:
  ret void                                                                         ; inst 172
}

define void @process_interactions(%World* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%9, %_3.if.then.0], [%131, %_20.if.exit.4]       ; inst 2
  %2 = icmp slt i32 %1, 20                                                         ; inst 3
  br i1 %2, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 4
_2.while.body.0:
  %3 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [20 x %Agent], [20 x %Agent]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Agent, %Agent* %5, i32 0, i32 6                              ; inst 8
  %7 = load i1, i1* %6                                                             ; inst 9
  %8 = icmp eq i1 %7, 0                                                            ; inst 10
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 11
_3.if.then.0:
  %9 = add i32 %1, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 14
_5.if.exit.0:
  %10 = add i32 %1, 1                                                              ; inst 15
  br label %_6.while.cond.1                                                        ; inst 16
_6.while.cond.1:
  %11 = phi i32 [%10, %_5.if.exit.0], [%19, %_8.if.then.1], [%85, %_16.if.exit.2]  ; inst 17
  %12 = icmp slt i32 %11, 20                                                       ; inst 18
  br i1 %12, label %_7.while.body.1, label %_17.while.exit.1                       ; inst 19
_7.while.body.1:
  %13 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 20
  %14 = sext i32 %11 to i64                                                        ; inst 21
  %15 = getelementptr [20 x %Agent], [20 x %Agent]* %13, i32 0, i64 %14            ; inst 22
  %16 = getelementptr %Agent, %Agent* %15, i32 0, i32 6                            ; inst 23
  %17 = load i1, i1* %16                                                           ; inst 24
  %18 = icmp eq i1 %17, 0                                                          ; inst 25
  br i1 %18, label %_8.if.then.1, label %_9.if.else.1                              ; inst 26
_8.if.then.1:
  %19 = add i32 %11, 1                                                             ; inst 27
  br label %_6.while.cond.1                                                        ; inst 28
_9.if.else.1:
  br label %_10.if.exit.1                                                          ; inst 29
_10.if.exit.1:
  %20 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 30
  %21 = sext i32 %1 to i64                                                         ; inst 31
  %22 = getelementptr [20 x %Agent], [20 x %Agent]* %20, i32 0, i64 %21            ; inst 32
  %23 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 33
  %24 = sext i32 %11 to i64                                                        ; inst 34
  %25 = getelementptr [20 x %Agent], [20 x %Agent]* %23, i32 0, i64 %24            ; inst 35
  %26 = getelementptr %Agent, %Agent* %22, i32 0, i32 1                            ; inst 36
  %27 = load i32, i32* %26                                                         ; inst 37
  %28 = getelementptr %Agent, %Agent* %25, i32 0, i32 1                            ; inst 38
  %29 = load i32, i32* %28                                                         ; inst 39
  %30 = sub i32 %27, %29                                                           ; inst 40
  %31 = getelementptr %Agent, %Agent* %22, i32 0, i32 2                            ; inst 41
  %32 = load i32, i32* %31                                                         ; inst 42
  %33 = getelementptr %Agent, %Agent* %25, i32 0, i32 2                            ; inst 43
  %34 = load i32, i32* %33                                                         ; inst 44
  %35 = sub i32 %32, %34                                                           ; inst 45
  %36 = mul i32 %30, %30                                                           ; inst 46
  %37 = mul i32 %35, %35                                                           ; inst 47
  %38 = add i32 %36, %37                                                           ; inst 48
  %39 = icmp slt i32 %38, 4                                                        ; inst 49
  br i1 %39, label %_11.if.then.2, label %_15.if.else.2                            ; inst 50
_11.if.then.2:
  %40 = getelementptr %Agent, %Agent* %22, i32 0, i32 3                            ; inst 51
  %41 = load i32, i32* %40                                                         ; inst 52
  %42 = getelementptr %Agent, %Agent* %25, i32 0, i32 3                            ; inst 53
  %43 = load i32, i32* %42                                                         ; inst 54
  %44 = icmp sgt i32 %41, %43                                                      ; inst 55
  br i1 %44, label %_12.if.then.3, label %_13.if.else.3                            ; inst 56
_12.if.then.3:
  %45 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 57
  %46 = sext i32 %1 to i64                                                         ; inst 58
  %47 = getelementptr [20 x %Agent], [20 x %Agent]* %45, i32 0, i64 %46            ; inst 59
  %48 = getelementptr %Agent, %Agent* %47, i32 0, i32 3                            ; inst 60
  %49 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 61
  %50 = sext i32 %1 to i64                                                         ; inst 62
  %51 = getelementptr [20 x %Agent], [20 x %Agent]* %49, i32 0, i64 %50            ; inst 63
  %52 = getelementptr %Agent, %Agent* %51, i32 0, i32 3                            ; inst 64
  %53 = load i32, i32* %52                                                         ; inst 65
  %54 = add i32 %53, 10                                                            ; inst 66
  store i32 %54, i32* %48                                                          ; inst 67
  %55 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 68
  %56 = sext i32 %11 to i64                                                        ; inst 69
  %57 = getelementptr [20 x %Agent], [20 x %Agent]* %55, i32 0, i64 %56            ; inst 70
  %58 = getelementptr %Agent, %Agent* %57, i32 0, i32 3                            ; inst 71
  %59 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 72
  %60 = sext i32 %11 to i64                                                        ; inst 73
  %61 = getelementptr [20 x %Agent], [20 x %Agent]* %59, i32 0, i64 %60            ; inst 74
  %62 = getelementptr %Agent, %Agent* %61, i32 0, i32 3                            ; inst 75
  %63 = load i32, i32* %62                                                         ; inst 76
  %64 = sub i32 %63, 10                                                            ; inst 77
  store i32 %64, i32* %58                                                          ; inst 78
  br label %_14.if.exit.3                                                          ; inst 79
_13.if.else.3:
  %65 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 80
  %66 = sext i32 %1 to i64                                                         ; inst 81
  %67 = getelementptr [20 x %Agent], [20 x %Agent]* %65, i32 0, i64 %66            ; inst 82
  %68 = getelementptr %Agent, %Agent* %67, i32 0, i32 3                            ; inst 83
  %69 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 84
  %70 = sext i32 %1 to i64                                                         ; inst 85
  %71 = getelementptr [20 x %Agent], [20 x %Agent]* %69, i32 0, i64 %70            ; inst 86
  %72 = getelementptr %Agent, %Agent* %71, i32 0, i32 3                            ; inst 87
  %73 = load i32, i32* %72                                                         ; inst 88
  %74 = sub i32 %73, 10                                                            ; inst 89
  store i32 %74, i32* %68                                                          ; inst 90
  %75 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 91
  %76 = sext i32 %11 to i64                                                        ; inst 92
  %77 = getelementptr [20 x %Agent], [20 x %Agent]* %75, i32 0, i64 %76            ; inst 93
  %78 = getelementptr %Agent, %Agent* %77, i32 0, i32 3                            ; inst 94
  %79 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 95
  %80 = sext i32 %11 to i64                                                        ; inst 96
  %81 = getelementptr [20 x %Agent], [20 x %Agent]* %79, i32 0, i64 %80            ; inst 97
  %82 = getelementptr %Agent, %Agent* %81, i32 0, i32 3                            ; inst 98
  %83 = load i32, i32* %82                                                         ; inst 99
  %84 = add i32 %83, 10                                                            ; inst 100
  store i32 %84, i32* %78                                                          ; inst 101
  br label %_14.if.exit.3                                                          ; inst 102
_14.if.exit.3:
  br label %_16.if.exit.2                                                          ; inst 103
_15.if.else.2:
  br label %_16.if.exit.2                                                          ; inst 104
_16.if.exit.2:
  %85 = add i32 %11, 1                                                             ; inst 105
  br label %_6.while.cond.1                                                        ; inst 106
_17.while.exit.1:
  %86 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 107
  %87 = sext i32 %1 to i64                                                         ; inst 108
  %88 = getelementptr [20 x %Agent], [20 x %Agent]* %86, i32 0, i64 %87            ; inst 109
  %89 = getelementptr %Agent, %Agent* %88, i32 0, i32 1                            ; inst 110
  %90 = load i32, i32* %89                                                         ; inst 111
  %91 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 112
  %92 = sext i32 %1 to i64                                                         ; inst 113
  %93 = getelementptr [20 x %Agent], [20 x %Agent]* %91, i32 0, i64 %92            ; inst 114
  %94 = getelementptr %Agent, %Agent* %93, i32 0, i32 2                            ; inst 115
  %95 = load i32, i32* %94                                                         ; inst 116
  %96 = getelementptr %World, %World* %0, i32 0, i32 0                             ; inst 117
  %97 = sext i32 %95 to i64                                                        ; inst 118
  %98 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %96, i32 0, i64 %97    ; inst 119
  %99 = sext i32 %90 to i64                                                        ; inst 120
  %100 = getelementptr [50 x i32], [50 x i32]* %98, i32 0, i64 %99                 ; inst 121
  %101 = load i32, i32* %100                                                       ; inst 122
  %102 = icmp slt i32 %101, 0                                                      ; inst 123
  br i1 %102, label %_18.if.then.4, label %_19.if.else.4                           ; inst 124
_18.if.then.4:
  %103 = getelementptr %World, %World* %0, i32 0, i32 1                            ; inst 125
  %104 = sext i32 %1 to i64                                                        ; inst 126
  %105 = getelementptr [20 x %Agent], [20 x %Agent]* %103, i32 0, i64 %104         ; inst 127
  %106 = getelementptr %Agent, %Agent* %105, i32 0, i32 3                          ; inst 128
  %107 = getelementptr %World, %World* %0, i32 0, i32 1                            ; inst 129
  %108 = sext i32 %1 to i64                                                        ; inst 130
  %109 = getelementptr [20 x %Agent], [20 x %Agent]* %107, i32 0, i64 %108         ; inst 131
  %110 = getelementptr %Agent, %Agent* %109, i32 0, i32 3                          ; inst 132
  %111 = load i32, i32* %110                                                       ; inst 133
  %112 = getelementptr %World, %World* %0, i32 0, i32 0                            ; inst 134
  %113 = sext i32 %95 to i64                                                       ; inst 135
  %114 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %112, i32 0, i64 %113 ; inst 136
  %115 = sext i32 %90 to i64                                                       ; inst 137
  %116 = getelementptr [50 x i32], [50 x i32]* %114, i32 0, i64 %115               ; inst 138
  %117 = load i32, i32* %116                                                       ; inst 139
  %118 = mul i32 %117, -10                                                         ; inst 140
  %119 = add i32 %111, %118                                                        ; inst 141
  store i32 %119, i32* %106                                                        ; inst 142
  %120 = getelementptr %World, %World* %0, i32 0, i32 0                            ; inst 143
  %121 = sext i32 %95 to i64                                                       ; inst 144
  %122 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %120, i32 0, i64 %121 ; inst 145
  %123 = sext i32 %90 to i64                                                       ; inst 146
  %124 = getelementptr [50 x i32], [50 x i32]* %122, i32 0, i64 %123               ; inst 147
  %125 = getelementptr %World, %World* %0, i32 0, i32 1                            ; inst 148
  %126 = sext i32 %1 to i64                                                        ; inst 149
  %127 = getelementptr [20 x %Agent], [20 x %Agent]* %125, i32 0, i64 %126         ; inst 150
  %128 = getelementptr %Agent, %Agent* %127, i32 0, i32 0                          ; inst 151
  %129 = load i32, i32* %128                                                       ; inst 152
  %130 = add i32 %129, 1                                                           ; inst 153
  store i32 %130, i32* %124                                                        ; inst 154
  br label %_20.if.exit.4                                                          ; inst 155
_19.if.else.4:
  br label %_20.if.exit.4                                                          ; inst 156
_20.if.exit.4:
  %131 = add i32 %1, 1                                                             ; inst 157
  br label %_1.while.cond.0                                                        ; inst 158
_21.while.exit.0:
  ret void                                                                         ; inst 159
}

define void @run_diagnostics(%World* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%19, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%17, %_5.if.exit.0]                              ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%18, %_5.if.exit.0]                              ; inst 4
  %4 = icmp slt i32 %1, 20                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [20 x %Agent], [20 x %Agent]* %5, i32 0, i64 %6               ; inst 9
  %8 = getelementptr %Agent, %Agent* %7, i32 0, i32 6                              ; inst 10
  %9 = load i1, i1* %8                                                             ; inst 11
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 12
_3.if.then.0:
  %10 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 13
  %11 = sext i32 %1 to i64                                                         ; inst 14
  %12 = getelementptr [20 x %Agent], [20 x %Agent]* %10, i32 0, i64 %11            ; inst 15
  %13 = getelementptr %Agent, %Agent* %12, i32 0, i32 3                            ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = add i32 %3, %14                                                            ; inst 18
  %16 = add i32 %2, 1                                                              ; inst 19
  br label %_5.if.exit.0                                                           ; inst 20
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 21
_5.if.exit.0:
  %17 = phi i32 [%16, %_3.if.then.0], [%2, %_4.if.else.0]                          ; inst 22
  %18 = phi i32 [%15, %_3.if.then.0], [%3, %_4.if.else.0]                          ; inst 23
  %19 = add i32 %1, 1                                                              ; inst 24
  br label %_1.while.cond.0                                                        ; inst 25
_6.while.exit.0:
  %20 = add i32 100000, %2                                                         ; inst 26
  call void @printlnInt(i32 %20)                                                   ; inst 27
  %21 = add i32 200000, %3                                                         ; inst 28
  call void @printlnInt(i32 %21)                                                   ; inst 29
  call void @provoke_error(%World* %0)                                             ; inst 30
  ret void                                                                         ; inst 31
}

define void @final_report(%World* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%27, %_5.if.exit.0]                              ; inst 2
  %2 = icmp slt i32 %1, 20                                                         ; inst 3
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [20 x %Agent], [20 x %Agent]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Agent, %Agent* %5, i32 0, i32 6                              ; inst 8
  %7 = load i1, i1* %6                                                             ; inst 9
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %8 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 11
  %9 = sext i32 %1 to i64                                                          ; inst 12
  %10 = getelementptr [20 x %Agent], [20 x %Agent]* %8, i32 0, i64 %9              ; inst 13
  %11 = getelementptr %Agent, %Agent* %10, i32 0, i32 0                            ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = mul i32 %12, 10000                                                         ; inst 16
  %14 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 17
  %15 = sext i32 %1 to i64                                                         ; inst 18
  %16 = getelementptr [20 x %Agent], [20 x %Agent]* %14, i32 0, i64 %15            ; inst 19
  %17 = getelementptr %Agent, %Agent* %16, i32 0, i32 3                            ; inst 20
  %18 = load i32, i32* %17                                                         ; inst 21
  %19 = add i32 %13, %18                                                           ; inst 22
  call void @printlnInt(i32 %19)                                                   ; inst 23
  br label %_5.if.exit.0                                                           ; inst 24
_4.if.else.0:
  %20 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 25
  %21 = sext i32 %1 to i64                                                         ; inst 26
  %22 = getelementptr [20 x %Agent], [20 x %Agent]* %20, i32 0, i64 %21            ; inst 27
  %23 = getelementptr %Agent, %Agent* %22, i32 0, i32 0                            ; inst 28
  %24 = load i32, i32* %23                                                         ; inst 29
  %25 = mul i32 %24, 10000                                                         ; inst 30
  %26 = add i32 %25, -1                                                            ; inst 31
  call void @printlnInt(i32 %26)                                                   ; inst 32
  br label %_5.if.exit.0                                                           ; inst 33
_5.if.exit.0:
  %27 = add i32 %1, 1                                                              ; inst 34
  br label %_1.while.cond.0                                                        ; inst 35
_6.while.exit.0:
  ret void                                                                         ; inst 36
}

define i32 @clamp(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %0, %1                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = icmp sgt i32 %0, %2                                                         ; inst 5
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 %2                                                                       ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  ret i32 %0                                                                       ; inst 9
}

define void @provoke_error(%World* %0) {
_0.entry.0:
  %1 = alloca %Agent                                                               ; inst 1
  %2 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 2
  %3 = getelementptr [20 x %Agent], [20 x %Agent]* %2, i32 0, i64 0                ; inst 3
  call void @memcpy(%Agent* %1, %Agent* %3, i64 28)                                ; inst 4
  %4 = getelementptr %Agent, %Agent* %1, i32 0, i32 3                              ; inst 5
  store i32 -100, i32* %4                                                          ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%32, %_11.if.exit.0]                             ; inst 8
  %6 = icmp slt i32 %5, 20                                                         ; inst 9
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 10
_2.while.body.0:
  %7 = getelementptr %World, %World* %0, i32 0, i32 1                              ; inst 11
  %8 = sext i32 %5 to i64                                                          ; inst 12
  %9 = getelementptr [20 x %Agent], [20 x %Agent]* %7, i32 0, i64 %8               ; inst 13
  %10 = getelementptr %Agent, %Agent* %9, i32 0, i32 6                             ; inst 14
  %11 = load i1, i1* %10                                                           ; inst 15
  br i1 %11, label %_3.if.then.0, label %_10.if.else.0                             ; inst 16
_3.if.then.0:
  %12 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 17
  %13 = sext i32 %5 to i64                                                         ; inst 18
  %14 = getelementptr [20 x %Agent], [20 x %Agent]* %12, i32 0, i64 %13            ; inst 19
  %15 = getelementptr %Agent, %Agent* %14, i32 0, i32 3                            ; inst 20
  %16 = load i32, i32* %15                                                         ; inst 21
  %17 = icmp sgt i32 %16, 150                                                      ; inst 22
  br i1 %17, label %_4.if.then.1, label %_8.if.else.1                              ; inst 23
_4.if.then.1:
  %18 = alloca %Agent                                                              ; inst 24
  %19 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 25
  %20 = sext i32 %5 to i64                                                         ; inst 26
  %21 = getelementptr [20 x %Agent], [20 x %Agent]* %19, i32 0, i64 %20            ; inst 27
  call void @memcpy(%Agent* %18, %Agent* %21, i64 28)                              ; inst 28
  %22 = getelementptr %Agent, %Agent* %18, i32 0, i32 3                            ; inst 29
  %23 = getelementptr %Agent, %Agent* %18, i32 0, i32 3                            ; inst 30
  %24 = load i32, i32* %23                                                         ; inst 31
  %25 = sdiv i32 %24, 2                                                            ; inst 32
  store i32 %25, i32* %22                                                          ; inst 33
  %26 = getelementptr %Agent, %Agent* %18, i32 0, i32 3                            ; inst 34
  %27 = load i32, i32* %26                                                         ; inst 35
  %28 = icmp sgt i32 %27, 100                                                      ; inst 36
  br i1 %28, label %_5.if.then.2, label %_6.if.else.2                              ; inst 37
_5.if.then.2:
  %29 = getelementptr %Agent, %Agent* %18, i32 0, i32 0                            ; inst 38
  %30 = load i32, i32* %29                                                         ; inst 39
  %31 = add i32 %30, 5000                                                          ; inst 40
  call void @printlnInt(i32 %31)                                                   ; inst 41
  br label %_7.if.exit.2                                                           ; inst 42
_6.if.else.2:
  br label %_7.if.exit.2                                                           ; inst 43
_7.if.exit.2:
  br label %_9.if.exit.1                                                           ; inst 44
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 45
_9.if.exit.1:
  br label %_11.if.exit.0                                                          ; inst 46
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 47
_11.if.exit.0:
  %32 = add i32 %5, 1                                                              ; inst 48
  br label %_1.while.cond.0                                                        ; inst 49
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 50
_13.while.cond.1:
  %33 = phi i32 [-1, %_12.while.exit.0], [%60, %_20.if.exit.3]                     ; inst 51
  %34 = phi i32 [-1, %_12.while.exit.0], [%61, %_20.if.exit.3]                     ; inst 52
  %35 = phi i32 [0, %_12.while.exit.0], [%62, %_20.if.exit.3]                      ; inst 53
  %36 = icmp slt i32 %35, 20                                                       ; inst 54
  br i1 %36, label %_14.while.body.1, label %_21.while.exit.1                      ; inst 55
_14.while.body.1:
  %37 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 56
  %38 = sext i32 %35 to i64                                                        ; inst 57
  %39 = getelementptr [20 x %Agent], [20 x %Agent]* %37, i32 0, i64 %38            ; inst 58
  %40 = getelementptr %Agent, %Agent* %39, i32 0, i32 6                            ; inst 59
  %41 = load i1, i1* %40                                                           ; inst 60
  br i1 %41, label %_15.if.then.3, label %_19.if.else.3                            ; inst 61
_15.if.then.3:
  %42 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 62
  %43 = sext i32 %35 to i64                                                        ; inst 63
  %44 = getelementptr [20 x %Agent], [20 x %Agent]* %42, i32 0, i64 %43            ; inst 64
  %45 = getelementptr %Agent, %Agent* %44, i32 0, i32 3                            ; inst 65
  %46 = load i32, i32* %45                                                         ; inst 66
  %47 = icmp sgt i32 %46, %34                                                      ; inst 67
  br i1 %47, label %_16.if.then.4, label %_17.if.else.4                            ; inst 68
_16.if.then.4:
  %48 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 69
  %49 = sext i32 %35 to i64                                                        ; inst 70
  %50 = getelementptr [20 x %Agent], [20 x %Agent]* %48, i32 0, i64 %49            ; inst 71
  %51 = getelementptr %Agent, %Agent* %50, i32 0, i32 3                            ; inst 72
  %52 = load i32, i32* %51                                                         ; inst 73
  %53 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 74
  %54 = sext i32 %35 to i64                                                        ; inst 75
  %55 = getelementptr [20 x %Agent], [20 x %Agent]* %53, i32 0, i64 %54            ; inst 76
  %56 = getelementptr %Agent, %Agent* %55, i32 0, i32 0                            ; inst 77
  %57 = load i32, i32* %56                                                         ; inst 78
  br label %_18.if.exit.4                                                          ; inst 79
_17.if.else.4:
  br label %_18.if.exit.4                                                          ; inst 80
_18.if.exit.4:
  %58 = phi i32 [%57, %_16.if.then.4], [%33, %_17.if.else.4]                       ; inst 81
  %59 = phi i32 [%52, %_16.if.then.4], [%34, %_17.if.else.4]                       ; inst 82
  br label %_20.if.exit.3                                                          ; inst 83
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 84
_20.if.exit.3:
  %60 = phi i32 [%58, %_18.if.exit.4], [%33, %_19.if.else.3]                       ; inst 85
  %61 = phi i32 [%59, %_18.if.exit.4], [%34, %_19.if.else.3]                       ; inst 86
  %62 = add i32 %35, 1                                                             ; inst 87
  br label %_13.while.cond.1                                                       ; inst 88
_21.while.exit.1:
  %63 = icmp ne i32 %33, -1                                                        ; inst 89
  br i1 %63, label %_22.if.then.5, label %_23.if.else.5                            ; inst 90
_22.if.then.5:
  %64 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 91
  %65 = sext i32 %33 to i64                                                        ; inst 92
  %66 = getelementptr [20 x %Agent], [20 x %Agent]* %64, i32 0, i64 %65            ; inst 93
  %67 = getelementptr %Agent, %Agent* %66, i32 0, i32 3                            ; inst 94
  store i32 0, i32* %67                                                            ; inst 95
  br label %_24.if.exit.5                                                          ; inst 96
_23.if.else.5:
  br label %_24.if.exit.5                                                          ; inst 97
_24.if.exit.5:
  ret void                                                                         ; inst 98
}

define void @another_simulation_scenario() {
_0.entry.0:
  %0 = alloca %World                                                               ; inst 1
  %1 = getelementptr %World, %World* %0, i32 0, i32 0                              ; inst 2
  %2 = alloca [50 x i32]                                                           ; inst 3
  %3 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i32 0                      ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 50                                                         ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr [50 x [50 x i32]], [50 x [50 x i32]]* %1, i32 0, i32 0        ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 50                                                        ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr [50 x i32], [50 x i32]* %8, i32 %9                           ; inst 18
  call void @memcpy([50 x i32]* %11, [50 x i32]* %2, i64 200)                      ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = getelementptr %World, %World* %0, i32 0, i32 1                             ; inst 22
  %14 = alloca %Agent                                                              ; inst 23
  %15 = getelementptr %Agent, %Agent* %14, i32 0, i32 0                            ; inst 24
  store i32 0, i32* %15                                                            ; inst 25
  %16 = getelementptr %Agent, %Agent* %14, i32 0, i32 1                            ; inst 26
  store i32 0, i32* %16                                                            ; inst 27
  %17 = getelementptr %Agent, %Agent* %14, i32 0, i32 2                            ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = getelementptr %Agent, %Agent* %14, i32 0, i32 3                            ; inst 30
  store i32 0, i32* %18                                                            ; inst 31
  %19 = getelementptr %Agent, %Agent* %14, i32 0, i32 4                            ; inst 32
  store i32 0, i32* %19                                                            ; inst 33
  %20 = getelementptr %Agent, %Agent* %14, i32 0, i32 5                            ; inst 34
  store i32 0, i32* %20                                                            ; inst 35
  %21 = getelementptr %Agent, %Agent* %14, i32 0, i32 6                            ; inst 36
  store i1 0, i1* %21                                                              ; inst 37
  %22 = getelementptr [20 x %Agent], [20 x %Agent]* %13, i32 0, i32 0              ; inst 38
  br label %_7.array.cond.2                                                        ; inst 39
_7.array.cond.2:
  %23 = phi i32 [0, %_6.array.exit.1], [%26, %_8.array.body.2]                     ; inst 40
  %24 = icmp slt i32 %23, 20                                                       ; inst 41
  br i1 %24, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 42
_8.array.body.2:
  %25 = getelementptr %Agent, %Agent* %22, i32 %23                                 ; inst 43
  call void @memcpy(%Agent* %25, %Agent* %14, i64 28)                              ; inst 44
  %26 = add i32 %23, 1                                                             ; inst 45
  br label %_7.array.cond.2                                                        ; inst 46
_9.array.exit.2:
  call void @initialize_world(%World* %0, i32 11223)                               ; inst 47
  br label %_10.while.cond.0                                                       ; inst 48
_10.while.cond.0:
  %27 = phi i32 [0, %_9.array.exit.2], [%29, %_11.while.body.0]                    ; inst 49
  %28 = icmp slt i32 %27, 50                                                       ; inst 50
  br i1 %28, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 51
_11.while.body.0:
  call void @update_world(%World* %0)                                              ; inst 52
  %29 = add i32 %27, 1                                                             ; inst 53
  br label %_10.while.cond.0                                                       ; inst 54
_12.while.exit.0:
  call void @process_interactions(%World* %0)                                      ; inst 55
  call void @final_report(%World* %0)                                              ; inst 56
  ret void                                                                         ; inst 57
}

