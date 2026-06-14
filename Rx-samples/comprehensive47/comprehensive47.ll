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


%Chromosome = type { [16 x i32], i32 }

define i32 @pseudo_rand(i32* %0) {
_0.entry.0:
  %1 = load i32, i32* %0                                                           ; inst 1
  %2 = mul i32 %1, 127                                                             ; inst 2
  %3 = add i32 %2, 16777337                                                        ; inst 3
  %4 = and i32 %3, 16777215                                                        ; inst 4
  store i32 %4, i32* %0                                                            ; inst 5
  %5 = load i32, i32* %0                                                           ; inst 6
  ret i32 %5                                                                       ; inst 7
}

define void @init_population([64 x %Chromosome]* %0, i32* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%13, %_5.while.exit.1]                           ; inst 2
  %3 = icmp ult i64 %2, 64                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 5
_3.while.cond.1:
  %4 = phi i64 [0, %_2.while.body.0], [%12, %_4.while.body.1]                      ; inst 6
  %5 = icmp ult i64 %4, 16                                                         ; inst 7
  br i1 %5, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 8
_4.while.body.1:
  %6 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %2     ; inst 9
  %7 = getelementptr %Chromosome, %Chromosome* %6, i32 0, i32 0                    ; inst 10
  %8 = getelementptr [16 x i32], [16 x i32]* %7, i32 0, i64 %4                     ; inst 11
  %9 = call i32 @pseudo_rand(i32* %1)                                              ; inst 12
  %10 = srem i32 %9, 200                                                           ; inst 13
  %11 = sub i32 %10, 100                                                           ; inst 14
  store i32 %11, i32* %8                                                           ; inst 15
  %12 = add i64 %4, 1                                                              ; inst 16
  br label %_3.while.cond.1                                                        ; inst 17
_5.while.exit.1:
  %13 = add i64 %2, 1                                                              ; inst 18
  br label %_1.while.cond.0                                                        ; inst 19
_6.while.exit.0:
  ret void                                                                         ; inst 20
}

define void @calculate_fitness(%Chromosome* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i64 [0, %_0.entry.0], [%27, %_8.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%26, %_8.if.exit.0]                              ; inst 3
  %3 = phi i32 [0, %_0.entry.0], [%8, %_8.if.exit.0]                               ; inst 4
  %4 = icmp ult i64 %1, 16                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                    ; inst 7
  %6 = getelementptr [16 x i32], [16 x i32]* %5, i32 0, i64 %1                     ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = add i32 %3, %7                                                              ; inst 10
  %9 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                    ; inst 11
  %10 = getelementptr [16 x i32], [16 x i32]* %9, i32 0, i64 %1                    ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = icmp sgt i32 %11, 90                                                       ; inst 14
  br i1 %12, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 15
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  %13 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                   ; inst 17
  %14 = getelementptr [16 x i32], [16 x i32]* %13, i32 0, i64 %1                   ; inst 18
  %15 = load i32, i32* %14                                                         ; inst 19
  %16 = icmp slt i32 %15, -90                                                      ; inst 20
  br label %_5.lazy.exit.0                                                         ; inst 21
_5.lazy.exit.0:
  %17 = phi i1 [1, %_3.lazy.then.0], [%16, %_4.lazy.else.0]                        ; inst 22
  br i1 %17, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  %18 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                   ; inst 24
  %19 = getelementptr [16 x i32], [16 x i32]* %18, i32 0, i64 %1                   ; inst 25
  %20 = load i32, i32* %19                                                         ; inst 26
  %21 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                   ; inst 27
  %22 = getelementptr [16 x i32], [16 x i32]* %21, i32 0, i64 %1                   ; inst 28
  %23 = load i32, i32* %22                                                         ; inst 29
  %24 = mul i32 %20, %23                                                           ; inst 30
  %25 = add i32 %2, %24                                                            ; inst 31
  br label %_8.if.exit.0                                                           ; inst 32
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 33
_8.if.exit.0:
  %26 = phi i32 [%25, %_6.if.then.0], [%2, %_7.if.else.0]                          ; inst 34
  %27 = add i64 %1, 1                                                              ; inst 35
  br label %_1.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  %28 = sub i32 500, %3                                                            ; inst 37
  %29 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 1                   ; inst 38
  %30 = mul i32 %28, %28                                                           ; inst 39
  %31 = sub i32 0, %30                                                             ; inst 40
  %32 = sub i32 %31, %2                                                            ; inst 41
  store i32 %32, i32* %29                                                          ; inst 42
  ret void                                                                         ; inst 43
}

define void @evaluate_population([64 x %Chromosome]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i64 [0, %_0.entry.0], [%4, %_2.while.body.0]                            ; inst 2
  %2 = icmp ult i64 %1, 64                                                         ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %1     ; inst 5
  call void @calculate_fitness(%Chromosome* %3)                                    ; inst 6
  %4 = add i64 %1, 1                                                               ; inst 7
  br label %_1.while.cond.0                                                        ; inst 8
_3.while.exit.0:
  ret void                                                                         ; inst 9
}

define i32 @selection([64 x %Chromosome]* %0, i32* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%19, %_5.if.exit.0]                              ; inst 2
  %3 = phi i32 [-99999999, %_0.entry.0], [%17, %_5.if.exit.0]                      ; inst 3
  %4 = phi i32 [-1, %_0.entry.0], [%18, %_5.if.exit.0]                             ; inst 4
  %5 = icmp slt i32 %2, 5                                                          ; inst 5
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = call i32 @pseudo_rand(i32* %1)                                              ; inst 7
  %7 = sext i32 %6 to i64                                                          ; inst 8
  %8 = urem i64 %7, 64                                                             ; inst 9
  %9 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %8     ; inst 10
  %10 = getelementptr %Chromosome, %Chromosome* %9, i32 0, i32 1                   ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = icmp sgt i32 %11, %3                                                       ; inst 13
  br i1 %12, label %_3.if.then.0, label %_4.if.else.0                              ; inst 14
_3.if.then.0:
  %13 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %8    ; inst 15
  %14 = getelementptr %Chromosome, %Chromosome* %13, i32 0, i32 1                  ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  %16 = trunc i64 %8 to i32                                                        ; inst 18
  br label %_5.if.exit.0                                                           ; inst 19
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 20
_5.if.exit.0:
  %17 = phi i32 [%15, %_3.if.then.0], [%3, %_4.if.else.0]                          ; inst 21
  %18 = phi i32 [%16, %_3.if.then.0], [%4, %_4.if.else.0]                          ; inst 22
  %19 = add i32 %2, 1                                                              ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_6.while.exit.0:
  ret i32 %4                                                                       ; inst 25
}

define void @crossover(%Chromosome* %0, %Chromosome* %1, %Chromosome* %2, i32* %3) {
_0.entry.0:
  %4 = call i32 @pseudo_rand(i32* %3)                                              ; inst 1
  %5 = srem i32 %4, 16                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %6 = phi i64 [0, %_0.entry.0], [%20, %_5.if.exit.0]                              ; inst 4
  %7 = icmp ult i64 %6, 16                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %8 = sext i32 %5 to i64                                                          ; inst 7
  %9 = icmp ult i64 %6, %8                                                         ; inst 8
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 9
_3.if.then.0:
  %10 = getelementptr %Chromosome, %Chromosome* %2, i32 0, i32 0                   ; inst 10
  %11 = getelementptr [16 x i32], [16 x i32]* %10, i32 0, i64 %6                   ; inst 11
  %12 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                   ; inst 12
  %13 = getelementptr [16 x i32], [16 x i32]* %12, i32 0, i64 %6                   ; inst 13
  %14 = load i32, i32* %13                                                         ; inst 14
  store i32 %14, i32* %11                                                          ; inst 15
  br label %_5.if.exit.0                                                           ; inst 16
_4.if.else.0:
  %15 = getelementptr %Chromosome, %Chromosome* %2, i32 0, i32 0                   ; inst 17
  %16 = getelementptr [16 x i32], [16 x i32]* %15, i32 0, i64 %6                   ; inst 18
  %17 = getelementptr %Chromosome, %Chromosome* %1, i32 0, i32 0                   ; inst 19
  %18 = getelementptr [16 x i32], [16 x i32]* %17, i32 0, i64 %6                   ; inst 20
  %19 = load i32, i32* %18                                                         ; inst 21
  store i32 %19, i32* %16                                                          ; inst 22
  br label %_5.if.exit.0                                                           ; inst 23
_5.if.exit.0:
  %20 = add i64 %6, 1                                                              ; inst 24
  br label %_1.while.cond.0                                                        ; inst 25
_6.while.exit.0:
  ret void                                                                         ; inst 26
}

define void @mutate(%Chromosome* %0, i32* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%16, %_5.if.exit.0]                              ; inst 2
  %3 = icmp ult i64 %2, 16                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = call i32 @pseudo_rand(i32* %1)                                              ; inst 5
  %5 = srem i32 %4, 100                                                            ; inst 6
  %6 = icmp slt i32 %5, 10                                                         ; inst 7
  br i1 %6, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %7 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                    ; inst 9
  %8 = getelementptr [16 x i32], [16 x i32]* %7, i32 0, i64 %2                     ; inst 10
  %9 = getelementptr %Chromosome, %Chromosome* %0, i32 0, i32 0                    ; inst 11
  %10 = getelementptr [16 x i32], [16 x i32]* %9, i32 0, i64 %2                    ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = call i32 @pseudo_rand(i32* %1)                                             ; inst 14
  %13 = srem i32 %12, 20                                                           ; inst 15
  %14 = sub i32 %13, 10                                                            ; inst 16
  %15 = add i32 %11, %14                                                           ; inst 17
  store i32 %15, i32* %8                                                           ; inst 18
  br label %_5.if.exit.0                                                           ; inst 19
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 20
_5.if.exit.0:
  %16 = add i64 %2, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  ret void                                                                         ; inst 23
}

define void @main() {
_0.entry.0:
  %0 = alloca [64 x %Chromosome]                                                   ; inst 1
  %1 = alloca %Chromosome                                                          ; inst 2
  %2 = getelementptr %Chromosome, %Chromosome* %1, i32 0, i32 0                    ; inst 3
  %3 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i32 0                      ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 16                                                         ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr %Chromosome, %Chromosome* %1, i32 0, i32 1                    ; inst 13
  store i32 0, i32* %8                                                             ; inst 14
  %9 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i32 0      ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 17
  %11 = icmp slt i32 %10, 64                                                       ; inst 18
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %12 = getelementptr %Chromosome, %Chromosome* %9, i32 %10                        ; inst 20
  call void @memcpy(%Chromosome* %12, %Chromosome* %1, i64 68)                     ; inst 21
  %13 = add i32 %10, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  %14 = alloca i32                                                                 ; inst 24
  store i32 12345, i32* %14                                                        ; inst 25
  call void @init_population([64 x %Chromosome]* %0, i32* %14)                     ; inst 26
  br label %_7.while.cond.0                                                        ; inst 27
_7.while.cond.0:
  %15 = phi i32 [0, %_6.array.exit.1], [%47, %_20.while.exit.2]                    ; inst 28
  %16 = icmp slt i32 %15, 50                                                       ; inst 29
  br i1 %16, label %_8.while.body.0, label %_21.while.exit.0                       ; inst 30
_8.while.body.0:
  call void @evaluate_population([64 x %Chromosome]* %0)                           ; inst 31
  %17 = alloca [64 x %Chromosome]                                                  ; inst 32
  %18 = alloca %Chromosome                                                         ; inst 33
  %19 = getelementptr %Chromosome, %Chromosome* %18, i32 0, i32 0                  ; inst 34
  %20 = getelementptr [16 x i32], [16 x i32]* %19, i32 0, i32 0                    ; inst 35
  br label %_9.array.cond.2                                                        ; inst 36
_9.array.cond.2:
  %21 = phi i32 [0, %_8.while.body.0], [%24, %_10.array.body.2]                    ; inst 37
  %22 = icmp slt i32 %21, 16                                                       ; inst 38
  br i1 %22, label %_10.array.body.2, label %_11.array.exit.2                      ; inst 39
_10.array.body.2:
  %23 = getelementptr i32, i32* %20, i32 %21                                       ; inst 40
  store i32 0, i32* %23                                                            ; inst 41
  %24 = add i32 %21, 1                                                             ; inst 42
  br label %_9.array.cond.2                                                        ; inst 43
_11.array.exit.2:
  %25 = getelementptr %Chromosome, %Chromosome* %18, i32 0, i32 1                  ; inst 44
  store i32 0, i32* %25                                                            ; inst 45
  %26 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %17, i32 0, i32 0    ; inst 46
  br label %_12.array.cond.3                                                       ; inst 47
_12.array.cond.3:
  %27 = phi i32 [0, %_11.array.exit.2], [%30, %_13.array.body.3]                   ; inst 48
  %28 = icmp slt i32 %27, 64                                                       ; inst 49
  br i1 %28, label %_13.array.body.3, label %_14.array.exit.3                      ; inst 50
_13.array.body.3:
  %29 = getelementptr %Chromosome, %Chromosome* %26, i32 %27                       ; inst 51
  call void @memcpy(%Chromosome* %29, %Chromosome* %18, i64 68)                    ; inst 52
  %30 = add i32 %27, 1                                                             ; inst 53
  br label %_12.array.cond.3                                                       ; inst 54
_14.array.exit.3:
  br label %_15.while.cond.1                                                       ; inst 55
_15.while.cond.1:
  %31 = phi i64 [0, %_14.array.exit.3], [%41, %_16.while.body.1]                   ; inst 56
  %32 = icmp ult i64 %31, 64                                                       ; inst 57
  br i1 %32, label %_16.while.body.1, label %_17.while.exit.1                      ; inst 58
_16.while.body.1:
  %33 = call i32 @selection([64 x %Chromosome]* %0, i32* %14)                      ; inst 59
  %34 = sext i32 %33 to i64                                                        ; inst 60
  %35 = call i32 @selection([64 x %Chromosome]* %0, i32* %14)                      ; inst 61
  %36 = sext i32 %35 to i64                                                        ; inst 62
  %37 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %34   ; inst 63
  %38 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %36   ; inst 64
  %39 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %17, i32 0, i64 %31  ; inst 65
  call void @crossover(%Chromosome* %37, %Chromosome* %38, %Chromosome* %39, i32* %14) ; inst 66
  %40 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %17, i32 0, i64 %31  ; inst 67
  call void @mutate(%Chromosome* %40, i32* %14)                                    ; inst 68
  %41 = add i64 %31, 1                                                             ; inst 69
  br label %_15.while.cond.1                                                       ; inst 70
_17.while.exit.1:
  br label %_18.while.cond.2                                                       ; inst 71
_18.while.cond.2:
  %42 = phi i64 [0, %_17.while.exit.1], [%46, %_19.while.body.2]                   ; inst 72
  %43 = icmp ult i64 %42, 64                                                       ; inst 73
  br i1 %43, label %_19.while.body.2, label %_20.while.exit.2                      ; inst 74
_19.while.body.2:
  %44 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %42   ; inst 75
  %45 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %17, i32 0, i64 %42  ; inst 76
  call void @memcpy(%Chromosome* %44, %Chromosome* %45, i64 68)                    ; inst 77
  %46 = add i64 %42, 1                                                             ; inst 78
  br label %_18.while.cond.2                                                       ; inst 79
_20.while.exit.2:
  %47 = add i32 %15, 1                                                             ; inst 80
  br label %_7.while.cond.0                                                        ; inst 81
_21.while.exit.0:
  call void @evaluate_population([64 x %Chromosome]* %0)                           ; inst 82
  br label %_22.while.cond.3                                                       ; inst 83
_22.while.cond.3:
  %48 = phi i64 [0, %_21.while.exit.0], [%59, %_26.if.exit.0]                      ; inst 84
  %49 = phi i32 [-99999999, %_21.while.exit.0], [%58, %_26.if.exit.0]              ; inst 85
  %50 = icmp ult i64 %48, 64                                                       ; inst 86
  br i1 %50, label %_23.while.body.3, label %_27.while.exit.3                      ; inst 87
_23.while.body.3:
  %51 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %48   ; inst 88
  %52 = getelementptr %Chromosome, %Chromosome* %51, i32 0, i32 1                  ; inst 89
  %53 = load i32, i32* %52                                                         ; inst 90
  %54 = icmp sgt i32 %53, %49                                                      ; inst 91
  br i1 %54, label %_24.if.then.0, label %_25.if.else.0                            ; inst 92
_24.if.then.0:
  %55 = getelementptr [64 x %Chromosome], [64 x %Chromosome]* %0, i32 0, i64 %48   ; inst 93
  %56 = getelementptr %Chromosome, %Chromosome* %55, i32 0, i32 1                  ; inst 94
  %57 = load i32, i32* %56                                                         ; inst 95
  br label %_26.if.exit.0                                                          ; inst 96
_25.if.else.0:
  br label %_26.if.exit.0                                                          ; inst 97
_26.if.exit.0:
  %58 = phi i32 [%57, %_24.if.then.0], [%49, %_25.if.else.0]                       ; inst 98
  %59 = add i64 %48, 1                                                             ; inst 99
  br label %_22.while.cond.3                                                       ; inst 100
_27.while.exit.3:
  call void @printlnInt(i32 %49)                                                   ; inst 101
  call void @exit(i32 0)                                                           ; inst 102
  ret void                                                                         ; inst 103
}

