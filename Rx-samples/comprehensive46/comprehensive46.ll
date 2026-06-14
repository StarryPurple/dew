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


%Vec3 = type { i32, i32, i32 }
%Ray = type { %Vec3, %Vec3 }
%Sphere = type { %Vec3, i32, %Vec3 }
%Light = type { %Vec3, i32 }

define void @setup_scene([4 x %Sphere]* %0, [2 x %Light]* %1) {
_0.entry.0:
  %2 = getelementptr [4 x %Sphere], [4 x %Sphere]* %0, i32 0, i64 0                ; inst 1
  %3 = alloca %Sphere                                                              ; inst 2
  %4 = getelementptr %Sphere, %Sphere* %3, i32 0, i32 0                            ; inst 3
  %5 = getelementptr %Vec3, %Vec3* %4, i32 0, i32 0                                ; inst 4
  store i32 0, i32* %5                                                             ; inst 5
  %6 = getelementptr %Vec3, %Vec3* %4, i32 0, i32 1                                ; inst 6
  store i32 -80, i32* %6                                                           ; inst 7
  %7 = getelementptr %Vec3, %Vec3* %4, i32 0, i32 2                                ; inst 8
  store i32 240, i32* %7                                                           ; inst 9
  %8 = getelementptr %Sphere, %Sphere* %3, i32 0, i32 1                            ; inst 10
  store i32 80, i32* %8                                                            ; inst 11
  %9 = getelementptr %Sphere, %Sphere* %3, i32 0, i32 2                            ; inst 12
  %10 = getelementptr %Vec3, %Vec3* %9, i32 0, i32 0                               ; inst 13
  store i32 255, i32* %10                                                          ; inst 14
  %11 = getelementptr %Vec3, %Vec3* %9, i32 0, i32 1                               ; inst 15
  store i32 0, i32* %11                                                            ; inst 16
  %12 = getelementptr %Vec3, %Vec3* %9, i32 0, i32 2                               ; inst 17
  store i32 0, i32* %12                                                            ; inst 18
  call void @memcpy(%Sphere* %2, %Sphere* %3, i64 28)                              ; inst 19
  %13 = getelementptr [4 x %Sphere], [4 x %Sphere]* %0, i32 0, i64 1               ; inst 20
  %14 = alloca %Sphere                                                             ; inst 21
  %15 = getelementptr %Sphere, %Sphere* %14, i32 0, i32 0                          ; inst 22
  %16 = getelementptr %Vec3, %Vec3* %15, i32 0, i32 0                              ; inst 23
  store i32 160, i32* %16                                                          ; inst 24
  %17 = getelementptr %Vec3, %Vec3* %15, i32 0, i32 1                              ; inst 25
  store i32 0, i32* %17                                                            ; inst 26
  %18 = getelementptr %Vec3, %Vec3* %15, i32 0, i32 2                              ; inst 27
  store i32 320, i32* %18                                                          ; inst 28
  %19 = getelementptr %Sphere, %Sphere* %14, i32 0, i32 1                          ; inst 29
  store i32 80, i32* %19                                                           ; inst 30
  %20 = getelementptr %Sphere, %Sphere* %14, i32 0, i32 2                          ; inst 31
  %21 = getelementptr %Vec3, %Vec3* %20, i32 0, i32 0                              ; inst 32
  store i32 0, i32* %21                                                            ; inst 33
  %22 = getelementptr %Vec3, %Vec3* %20, i32 0, i32 1                              ; inst 34
  store i32 0, i32* %22                                                            ; inst 35
  %23 = getelementptr %Vec3, %Vec3* %20, i32 0, i32 2                              ; inst 36
  store i32 255, i32* %23                                                          ; inst 37
  call void @memcpy(%Sphere* %13, %Sphere* %14, i64 28)                            ; inst 38
  %24 = getelementptr [4 x %Sphere], [4 x %Sphere]* %0, i32 0, i64 2               ; inst 39
  %25 = alloca %Sphere                                                             ; inst 40
  %26 = getelementptr %Sphere, %Sphere* %25, i32 0, i32 0                          ; inst 41
  %27 = getelementptr %Vec3, %Vec3* %26, i32 0, i32 0                              ; inst 42
  store i32 -160, i32* %27                                                         ; inst 43
  %28 = getelementptr %Vec3, %Vec3* %26, i32 0, i32 1                              ; inst 44
  store i32 0, i32* %28                                                            ; inst 45
  %29 = getelementptr %Vec3, %Vec3* %26, i32 0, i32 2                              ; inst 46
  store i32 320, i32* %29                                                          ; inst 47
  %30 = getelementptr %Sphere, %Sphere* %25, i32 0, i32 1                          ; inst 48
  store i32 80, i32* %30                                                           ; inst 49
  %31 = getelementptr %Sphere, %Sphere* %25, i32 0, i32 2                          ; inst 50
  %32 = getelementptr %Vec3, %Vec3* %31, i32 0, i32 0                              ; inst 51
  store i32 0, i32* %32                                                            ; inst 52
  %33 = getelementptr %Vec3, %Vec3* %31, i32 0, i32 1                              ; inst 53
  store i32 255, i32* %33                                                          ; inst 54
  %34 = getelementptr %Vec3, %Vec3* %31, i32 0, i32 2                              ; inst 55
  store i32 0, i32* %34                                                            ; inst 56
  call void @memcpy(%Sphere* %24, %Sphere* %25, i64 28)                            ; inst 57
  %35 = getelementptr [4 x %Sphere], [4 x %Sphere]* %0, i32 0, i64 3               ; inst 58
  %36 = alloca %Sphere                                                             ; inst 59
  %37 = getelementptr %Sphere, %Sphere* %36, i32 0, i32 0                          ; inst 60
  %38 = getelementptr %Vec3, %Vec3* %37, i32 0, i32 0                              ; inst 61
  store i32 0, i32* %38                                                            ; inst 62
  %39 = getelementptr %Vec3, %Vec3* %37, i32 0, i32 1                              ; inst 63
  store i32 -16080, i32* %39                                                       ; inst 64
  %40 = getelementptr %Vec3, %Vec3* %37, i32 0, i32 2                              ; inst 65
  store i32 0, i32* %40                                                            ; inst 66
  %41 = getelementptr %Sphere, %Sphere* %36, i32 0, i32 1                          ; inst 67
  store i32 16000, i32* %41                                                        ; inst 68
  %42 = getelementptr %Sphere, %Sphere* %36, i32 0, i32 2                          ; inst 69
  %43 = getelementptr %Vec3, %Vec3* %42, i32 0, i32 0                              ; inst 70
  store i32 200, i32* %43                                                          ; inst 71
  %44 = getelementptr %Vec3, %Vec3* %42, i32 0, i32 1                              ; inst 72
  store i32 200, i32* %44                                                          ; inst 73
  %45 = getelementptr %Vec3, %Vec3* %42, i32 0, i32 2                              ; inst 74
  store i32 0, i32* %45                                                            ; inst 75
  call void @memcpy(%Sphere* %35, %Sphere* %36, i64 28)                            ; inst 76
  %46 = getelementptr [2 x %Light], [2 x %Light]* %1, i32 0, i64 0                 ; inst 77
  %47 = alloca %Light                                                              ; inst 78
  %48 = getelementptr %Light, %Light* %47, i32 0, i32 0                            ; inst 79
  %49 = getelementptr %Vec3, %Vec3* %48, i32 0, i32 0                              ; inst 80
  store i32 -1600, i32* %49                                                        ; inst 81
  %50 = getelementptr %Vec3, %Vec3* %48, i32 0, i32 1                              ; inst 82
  store i32 1600, i32* %50                                                         ; inst 83
  %51 = getelementptr %Vec3, %Vec3* %48, i32 0, i32 2                              ; inst 84
  store i32 -1600, i32* %51                                                        ; inst 85
  %52 = getelementptr %Light, %Light* %47, i32 0, i32 1                            ; inst 86
  store i32 150, i32* %52                                                          ; inst 87
  call void @memcpy(%Light* %46, %Light* %47, i64 16)                              ; inst 88
  %53 = getelementptr [2 x %Light], [2 x %Light]* %1, i32 0, i64 1                 ; inst 89
  %54 = alloca %Light                                                              ; inst 90
  %55 = getelementptr %Light, %Light* %54, i32 0, i32 0                            ; inst 91
  %56 = getelementptr %Vec3, %Vec3* %55, i32 0, i32 0                              ; inst 92
  store i32 1600, i32* %56                                                         ; inst 93
  %57 = getelementptr %Vec3, %Vec3* %55, i32 0, i32 1                              ; inst 94
  store i32 2400, i32* %57                                                         ; inst 95
  %58 = getelementptr %Vec3, %Vec3* %55, i32 0, i32 2                              ; inst 96
  store i32 -800, i32* %58                                                         ; inst 97
  %59 = getelementptr %Light, %Light* %54, i32 0, i32 1                            ; inst 98
  store i32 120, i32* %59                                                          ; inst 99
  call void @memcpy(%Light* %53, %Light* %54, i64 16)                              ; inst 100
  ret void                                                                         ; inst 101
}

define i32 @vec_dot(%Vec3* %0, %Vec3* %1) {
_0.entry.0:
  %2 = getelementptr %Vec3, %Vec3* %0, i32 0, i32 0                                ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = getelementptr %Vec3, %Vec3* %1, i32 0, i32 0                                ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = mul i32 %3, %5                                                              ; inst 5
  %7 = getelementptr %Vec3, %Vec3* %0, i32 0, i32 1                                ; inst 6
  %8 = load i32, i32* %7                                                           ; inst 7
  %9 = getelementptr %Vec3, %Vec3* %1, i32 0, i32 1                                ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = mul i32 %8, %10                                                            ; inst 10
  %12 = add i32 %6, %11                                                            ; inst 11
  %13 = getelementptr %Vec3, %Vec3* %0, i32 0, i32 2                               ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = getelementptr %Vec3, %Vec3* %1, i32 0, i32 2                               ; inst 14
  %16 = load i32, i32* %15                                                         ; inst 15
  %17 = mul i32 %14, %16                                                           ; inst 16
  %18 = add i32 %12, %17                                                           ; inst 17
  %19 = sdiv i32 %18, 80                                                           ; inst 18
  ret i32 %19                                                                      ; inst 19
}

define void @vec_sub(%Vec3* sret(%Vec3) %0, %Vec3* %1, %Vec3* %2) {
_0.entry.0:
  %3 = alloca %Vec3                                                                ; inst 1
  %4 = getelementptr %Vec3, %Vec3* %3, i32 0, i32 0                                ; inst 2
  %5 = getelementptr %Vec3, %Vec3* %1, i32 0, i32 0                                ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  %7 = getelementptr %Vec3, %Vec3* %2, i32 0, i32 0                                ; inst 5
  %8 = load i32, i32* %7                                                           ; inst 6
  %9 = sub i32 %6, %8                                                              ; inst 7
  store i32 %9, i32* %4                                                            ; inst 8
  %10 = getelementptr %Vec3, %Vec3* %3, i32 0, i32 1                               ; inst 9
  %11 = getelementptr %Vec3, %Vec3* %1, i32 0, i32 1                               ; inst 10
  %12 = load i32, i32* %11                                                         ; inst 11
  %13 = getelementptr %Vec3, %Vec3* %2, i32 0, i32 1                               ; inst 12
  %14 = load i32, i32* %13                                                         ; inst 13
  %15 = sub i32 %12, %14                                                           ; inst 14
  store i32 %15, i32* %10                                                          ; inst 15
  %16 = getelementptr %Vec3, %Vec3* %3, i32 0, i32 2                               ; inst 16
  %17 = getelementptr %Vec3, %Vec3* %1, i32 0, i32 2                               ; inst 17
  %18 = load i32, i32* %17                                                         ; inst 18
  %19 = getelementptr %Vec3, %Vec3* %2, i32 0, i32 2                               ; inst 19
  %20 = load i32, i32* %19                                                         ; inst 20
  %21 = sub i32 %18, %20                                                           ; inst 21
  store i32 %21, i32* %16                                                          ; inst 22
  call void @memcpy(%Vec3* %0, %Vec3* %3, i64 12)                                  ; inst 23
  ret void                                                                         ; inst 24
}

define i32 @intersect(%Ray* %0, %Sphere* %1) {
_0.entry.0:
  %2 = alloca %Vec3                                                                ; inst 1
  %3 = getelementptr %Ray, %Ray* %0, i32 0, i32 0                                  ; inst 2
  %4 = getelementptr %Sphere, %Sphere* %1, i32 0, i32 0                            ; inst 3
  call void @vec_sub(%Vec3* %2, %Vec3* %3, %Vec3* %4)                              ; inst 4
  %5 = getelementptr %Ray, %Ray* %0, i32 0, i32 1                                  ; inst 5
  %6 = getelementptr %Ray, %Ray* %0, i32 0, i32 1                                  ; inst 6
  %7 = call i32 @vec_dot(%Vec3* %5, %Vec3* %6)                                     ; inst 7
  %8 = getelementptr %Ray, %Ray* %0, i32 0, i32 1                                  ; inst 8
  %9 = call i32 @vec_dot(%Vec3* %2, %Vec3* %8)                                     ; inst 9
  %10 = mul i32 2, %9                                                              ; inst 10
  %11 = call i32 @vec_dot(%Vec3* %2, %Vec3* %2)                                    ; inst 11
  %12 = getelementptr %Sphere, %Sphere* %1, i32 0, i32 1                           ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = getelementptr %Sphere, %Sphere* %1, i32 0, i32 1                           ; inst 14
  %15 = load i32, i32* %14                                                         ; inst 15
  %16 = mul i32 %13, %15                                                           ; inst 16
  %17 = sdiv i32 %16, 80                                                           ; inst 17
  %18 = sub i32 %11, %17                                                           ; inst 18
  %19 = mul i32 %10, %10                                                           ; inst 19
  %20 = mul i32 4, %7                                                              ; inst 20
  %21 = mul i32 %20, %18                                                           ; inst 21
  %22 = sdiv i32 %21, 80                                                           ; inst 22
  %23 = sub i32 %19, %22                                                           ; inst 23
  %24 = icmp slt i32 %23, 0                                                        ; inst 24
  br i1 %24, label %_1.if.then.0, label %_2.if.else.0                              ; inst 25
_1.if.then.0:
  ret i32 -1                                                                       ; inst 26
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 27
_3.if.exit.0:
  %25 = sub i32 0, %10                                                             ; inst 28
  %26 = call i32 @isqrt(i32 %23)                                                   ; inst 29
  %27 = sub i32 %25, %26                                                           ; inst 30
  %28 = mul i32 2, %7                                                              ; inst 31
  %29 = sdiv i32 %28, 80                                                           ; inst 32
  %30 = sdiv i32 %27, %29                                                          ; inst 33
  ret i32 %30                                                                      ; inst 34
}

define i32 @isqrt(i32 %0) {
_0.entry.0:
  %1 = icmp slt i32 %0, 0                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = add i32 %0, 1                                                               ; inst 5
  %3 = sdiv i32 %2, 2                                                              ; inst 6
  br label %_4.while.cond.0                                                        ; inst 7
_4.while.cond.0:
  %4 = phi i32 [%3, %_3.if.exit.0], [%9, %_5.while.body.0]                         ; inst 8
  %5 = phi i32 [%0, %_3.if.exit.0], [%4, %_5.while.body.0]                         ; inst 9
  %6 = icmp slt i32 %4, %5                                                         ; inst 10
  br i1 %6, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 11
_5.while.body.0:
  %7 = sdiv i32 %0, %4                                                             ; inst 12
  %8 = add i32 %4, %7                                                              ; inst 13
  %9 = sdiv i32 %8, 2                                                              ; inst 14
  br label %_4.while.cond.0                                                        ; inst 15
_6.while.exit.0:
  ret i32 %5                                                                       ; inst 16
}

define void @main() {
_0.entry.0:
  %0 = alloca [64 x [64 x i32]]                                                    ; inst 1
  %1 = alloca [64 x i32]                                                           ; inst 2
  %2 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 64                                                         ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %0, i32 0, i32 0        ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 64                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr [64 x i32], [64 x i32]* %7, i32 %8                           ; inst 17
  call void @memcpy([64 x i32]* %10, [64 x i32]* %1, i64 256)                      ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [4 x %Sphere]                                                       ; inst 21
  %13 = alloca %Sphere                                                             ; inst 22
  %14 = getelementptr %Sphere, %Sphere* %13, i32 0, i32 0                          ; inst 23
  %15 = getelementptr %Vec3, %Vec3* %14, i32 0, i32 0                              ; inst 24
  store i32 0, i32* %15                                                            ; inst 25
  %16 = getelementptr %Vec3, %Vec3* %14, i32 0, i32 1                              ; inst 26
  store i32 0, i32* %16                                                            ; inst 27
  %17 = getelementptr %Vec3, %Vec3* %14, i32 0, i32 2                              ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = getelementptr %Sphere, %Sphere* %13, i32 0, i32 1                          ; inst 30
  store i32 0, i32* %18                                                            ; inst 31
  %19 = getelementptr %Sphere, %Sphere* %13, i32 0, i32 2                          ; inst 32
  %20 = getelementptr %Vec3, %Vec3* %19, i32 0, i32 0                              ; inst 33
  store i32 0, i32* %20                                                            ; inst 34
  %21 = getelementptr %Vec3, %Vec3* %19, i32 0, i32 1                              ; inst 35
  store i32 0, i32* %21                                                            ; inst 36
  %22 = getelementptr %Vec3, %Vec3* %19, i32 0, i32 2                              ; inst 37
  store i32 0, i32* %22                                                            ; inst 38
  %23 = getelementptr [4 x %Sphere], [4 x %Sphere]* %12, i32 0, i32 0              ; inst 39
  br label %_7.array.cond.2                                                        ; inst 40
_7.array.cond.2:
  %24 = phi i32 [0, %_6.array.exit.1], [%27, %_8.array.body.2]                     ; inst 41
  %25 = icmp slt i32 %24, 4                                                        ; inst 42
  br i1 %25, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 43
_8.array.body.2:
  %26 = getelementptr %Sphere, %Sphere* %23, i32 %24                               ; inst 44
  call void @memcpy(%Sphere* %26, %Sphere* %13, i64 28)                            ; inst 45
  %27 = add i32 %24, 1                                                             ; inst 46
  br label %_7.array.cond.2                                                        ; inst 47
_9.array.exit.2:
  %28 = alloca [2 x %Light]                                                        ; inst 48
  %29 = alloca %Light                                                              ; inst 49
  %30 = getelementptr %Light, %Light* %29, i32 0, i32 0                            ; inst 50
  %31 = getelementptr %Vec3, %Vec3* %30, i32 0, i32 0                              ; inst 51
  store i32 0, i32* %31                                                            ; inst 52
  %32 = getelementptr %Vec3, %Vec3* %30, i32 0, i32 1                              ; inst 53
  store i32 0, i32* %32                                                            ; inst 54
  %33 = getelementptr %Vec3, %Vec3* %30, i32 0, i32 2                              ; inst 55
  store i32 0, i32* %33                                                            ; inst 56
  %34 = getelementptr %Light, %Light* %29, i32 0, i32 1                            ; inst 57
  store i32 0, i32* %34                                                            ; inst 58
  %35 = getelementptr [2 x %Light], [2 x %Light]* %28, i32 0, i32 0                ; inst 59
  br label %_10.array.cond.3                                                       ; inst 60
_10.array.cond.3:
  %36 = phi i32 [0, %_9.array.exit.2], [%39, %_11.array.body.3]                    ; inst 61
  %37 = icmp slt i32 %36, 2                                                        ; inst 62
  br i1 %37, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 63
_11.array.body.3:
  %38 = getelementptr %Light, %Light* %35, i32 %36                                 ; inst 64
  call void @memcpy(%Light* %38, %Light* %29, i64 16)                              ; inst 65
  %39 = add i32 %36, 1                                                             ; inst 66
  br label %_10.array.cond.3                                                       ; inst 67
_12.array.exit.3:
  call void @setup_scene([4 x %Sphere]* %12, [2 x %Light]* %28)                    ; inst 68
  br label %_13.while.cond.0                                                       ; inst 69
_13.while.cond.0:
  %40 = phi i32 [0, %_12.array.exit.3], [%92, %_26.while.exit.1]                   ; inst 70
  %41 = icmp slt i32 %40, 64                                                       ; inst 71
  br i1 %41, label %_14.while.body.0, label %_27.while.exit.0                      ; inst 72
_14.while.body.0:
  br label %_15.while.cond.1                                                       ; inst 73
_15.while.cond.1:
  %42 = phi i32 [0, %_14.while.body.0], [%91, %_25.while.exit.2]                   ; inst 74
  %43 = icmp slt i32 %42, 64                                                       ; inst 75
  br i1 %43, label %_16.while.body.1, label %_26.while.exit.1                      ; inst 76
_16.while.body.1:
  %44 = alloca %Vec3                                                               ; inst 77
  %45 = getelementptr %Vec3, %Vec3* %44, i32 0, i32 0                              ; inst 78
  %46 = sub i32 %42, 32                                                            ; inst 79
  %47 = mul i32 %46, 80                                                            ; inst 80
  %48 = sdiv i32 %47, 64                                                           ; inst 81
  store i32 %48, i32* %45                                                          ; inst 82
  %49 = getelementptr %Vec3, %Vec3* %44, i32 0, i32 1                              ; inst 83
  %50 = sub i32 %40, 32                                                            ; inst 84
  %51 = mul i32 %50, 80                                                            ; inst 85
  %52 = sdiv i32 %51, 64                                                           ; inst 86
  store i32 %52, i32* %49                                                          ; inst 87
  %53 = getelementptr %Vec3, %Vec3* %44, i32 0, i32 2                              ; inst 88
  store i32 80, i32* %53                                                           ; inst 89
  %54 = alloca %Ray                                                                ; inst 90
  %55 = getelementptr %Ray, %Ray* %54, i32 0, i32 0                                ; inst 91
  %56 = getelementptr %Vec3, %Vec3* %55, i32 0, i32 0                              ; inst 92
  store i32 0, i32* %56                                                            ; inst 93
  %57 = getelementptr %Vec3, %Vec3* %55, i32 0, i32 1                              ; inst 94
  store i32 0, i32* %57                                                            ; inst 95
  %58 = getelementptr %Vec3, %Vec3* %55, i32 0, i32 2                              ; inst 96
  store i32 -80, i32* %58                                                          ; inst 97
  %59 = getelementptr %Ray, %Ray* %54, i32 0, i32 1                                ; inst 98
  call void @memcpy(%Vec3* %59, %Vec3* %44, i64 12)                                ; inst 99
  %60 = alloca %Vec3                                                               ; inst 100
  %61 = getelementptr %Vec3, %Vec3* %60, i32 0, i32 0                              ; inst 101
  store i32 20, i32* %61                                                           ; inst 102
  %62 = getelementptr %Vec3, %Vec3* %60, i32 0, i32 1                              ; inst 103
  store i32 20, i32* %62                                                           ; inst 104
  %63 = getelementptr %Vec3, %Vec3* %60, i32 0, i32 2                              ; inst 105
  store i32 40, i32* %63                                                           ; inst 106
  br label %_17.while.cond.2                                                       ; inst 107
_17.while.cond.2:
  %64 = phi i32 [0, %_16.while.body.1], [%77, %_24.if.exit.0]                      ; inst 108
  %65 = phi i32 [800000, %_16.while.body.1], [%76, %_24.if.exit.0]                 ; inst 109
  %66 = icmp slt i32 %64, 4                                                        ; inst 110
  br i1 %66, label %_18.while.body.2, label %_25.while.exit.2                      ; inst 111
_18.while.body.2:
  %67 = sext i32 %64 to i64                                                        ; inst 112
  %68 = getelementptr [4 x %Sphere], [4 x %Sphere]* %12, i32 0, i64 %67            ; inst 113
  %69 = call i32 @intersect(%Ray* %54, %Sphere* %68)                               ; inst 114
  %70 = icmp sgt i32 %69, 0                                                        ; inst 115
  br i1 %70, label %_19.lazy.then.0, label %_20.lazy.else.0                        ; inst 116
_19.lazy.then.0:
  %71 = icmp slt i32 %69, %65                                                      ; inst 117
  br label %_21.lazy.exit.0                                                        ; inst 118
_20.lazy.else.0:
  br label %_21.lazy.exit.0                                                        ; inst 119
_21.lazy.exit.0:
  %72 = phi i1 [%71, %_19.lazy.then.0], [0, %_20.lazy.else.0]                      ; inst 120
  br i1 %72, label %_22.if.then.0, label %_23.if.else.0                            ; inst 121
_22.if.then.0:
  %73 = sext i32 %64 to i64                                                        ; inst 122
  %74 = getelementptr [4 x %Sphere], [4 x %Sphere]* %12, i32 0, i64 %73            ; inst 123
  %75 = getelementptr %Sphere, %Sphere* %74, i32 0, i32 2                          ; inst 124
  call void @memcpy(%Vec3* %60, %Vec3* %75, i64 12)                                ; inst 125
  br label %_24.if.exit.0                                                          ; inst 126
_23.if.else.0:
  br label %_24.if.exit.0                                                          ; inst 127
_24.if.exit.0:
  %76 = phi i32 [%69, %_22.if.then.0], [%65, %_23.if.else.0]                       ; inst 128
  %77 = add i32 %64, 1                                                             ; inst 129
  br label %_17.while.cond.2                                                       ; inst 130
_25.while.exit.2:
  %78 = sext i32 %42 to i64                                                        ; inst 131
  %79 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %0, i32 0, i64 %78     ; inst 132
  %80 = sext i32 %40 to i64                                                        ; inst 133
  %81 = getelementptr [64 x i32], [64 x i32]* %79, i32 0, i64 %80                  ; inst 134
  %82 = getelementptr %Vec3, %Vec3* %60, i32 0, i32 0                              ; inst 135
  %83 = load i32, i32* %82                                                         ; inst 136
  %84 = getelementptr %Vec3, %Vec3* %60, i32 0, i32 1                              ; inst 137
  %85 = load i32, i32* %84                                                         ; inst 138
  %86 = add i32 %83, %85                                                           ; inst 139
  %87 = getelementptr %Vec3, %Vec3* %60, i32 0, i32 2                              ; inst 140
  %88 = load i32, i32* %87                                                         ; inst 141
  %89 = add i32 %86, %88                                                           ; inst 142
  %90 = sdiv i32 %89, 3                                                            ; inst 143
  store i32 %90, i32* %81                                                          ; inst 144
  %91 = add i32 %42, 1                                                             ; inst 145
  br label %_15.while.cond.1                                                       ; inst 146
_26.while.exit.1:
  %92 = add i32 %40, 1                                                             ; inst 147
  br label %_13.while.cond.0                                                       ; inst 148
_27.while.exit.0:
  br label %_28.while.cond.3                                                       ; inst 149
_28.while.cond.3:
  %93 = phi i32 [0, %_27.while.exit.0], [%109, %_32.while.exit.4]                  ; inst 150
  %94 = phi i32 [0, %_27.while.exit.0], [%96, %_32.while.exit.4]                   ; inst 151
  %95 = icmp slt i32 %93, 64                                                       ; inst 152
  br i1 %95, label %_29.while.body.3, label %_33.while.exit.3                      ; inst 153
_29.while.body.3:
  br label %_30.while.cond.4                                                       ; inst 154
_30.while.cond.4:
  %96 = phi i32 [%94, %_29.while.body.3], [%107, %_31.while.body.4]                ; inst 155
  %97 = phi i32 [0, %_29.while.body.3], [%108, %_31.while.body.4]                  ; inst 156
  %98 = icmp slt i32 %97, 64                                                       ; inst 157
  br i1 %98, label %_31.while.body.4, label %_32.while.exit.4                      ; inst 158
_31.while.body.4:
  %99 = sext i32 %97 to i64                                                        ; inst 159
  %100 = getelementptr [64 x [64 x i32]], [64 x [64 x i32]]* %0, i32 0, i64 %99    ; inst 160
  %101 = sext i32 %93 to i64                                                       ; inst 161
  %102 = getelementptr [64 x i32], [64 x i32]* %100, i32 0, i64 %101               ; inst 162
  %103 = load i32, i32* %102                                                       ; inst 163
  %104 = mul i32 %93, 64                                                           ; inst 164
  %105 = add i32 %97, %104                                                         ; inst 165
  %106 = mul i32 %103, %105                                                        ; inst 166
  %107 = add i32 %96, %106                                                         ; inst 167
  %108 = add i32 %97, 1                                                            ; inst 168
  br label %_30.while.cond.4                                                       ; inst 169
_32.while.exit.4:
  %109 = add i32 %93, 1                                                            ; inst 170
  br label %_28.while.cond.3                                                       ; inst 171
_33.while.exit.3:
  call void @printlnInt(i32 %94)                                                   ; inst 172
  call void @exit(i32 0)                                                           ; inst 173
  ret void                                                                         ; inst 174
}

