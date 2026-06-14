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


%Node = type { i32, i32, i32, i32 }
%Tree = type { [512 x %Node], i32, i32 }

define void @main() {
_0.entry.0:
  %0 = alloca %Tree                                                                ; inst 1
  %1 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 2
  %2 = alloca %Node                                                                ; inst 3
  %3 = getelementptr %Node, %Node* %2, i32 0, i32 0                                ; inst 4
  store i32 0, i32* %3                                                             ; inst 5
  %4 = getelementptr %Node, %Node* %2, i32 0, i32 1                                ; inst 6
  store i32 0, i32* %4                                                             ; inst 7
  %5 = getelementptr %Node, %Node* %2, i32 0, i32 2                                ; inst 8
  store i32 -1, i32* %5                                                            ; inst 9
  %6 = getelementptr %Node, %Node* %2, i32 0, i32 3                                ; inst 10
  store i32 -1, i32* %6                                                            ; inst 11
  %7 = getelementptr [512 x %Node], [512 x %Node]* %1, i32 0, i32 0                ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 14
  %9 = icmp slt i32 %8, 512                                                        ; inst 15
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 16
_2.array.body.0:
  %10 = getelementptr %Node, %Node* %7, i32 %8                                     ; inst 17
  call void @memcpy(%Node* %10, %Node* %2, i64 16)                                 ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_1.array.cond.0                                                        ; inst 20
_3.array.exit.0:
  %12 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 21
  store i32 -1, i32* %12                                                           ; inst 22
  %13 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                               ; inst 23
  store i32 0, i32* %13                                                            ; inst 24
  call void @initialize_pool(%Tree* %0)                                            ; inst 25
  %14 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 26
  %15 = call i32 @build_complex_tree(%Tree* %0, i32 4, i32 100)                    ; inst 27
  store i32 %15, i32* %14                                                          ; inst 28
  %16 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 29
  %17 = load i32, i32* %16                                                         ; inst 30
  %18 = call i32 @sum_tree(%Tree* %0, i32 %17)                                     ; inst 31
  call void @printlnInt(i32 %18)                                                   ; inst 32
  %19 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 33
  %20 = load i32, i32* %19                                                         ; inst 34
  %21 = call i32 @find_height(%Tree* %0, i32 %20)                                  ; inst 35
  call void @printlnInt(i32 %21)                                                   ; inst 36
  %22 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 37
  %23 = load i32, i32* %22                                                         ; inst 38
  %24 = call i1 @find_value(%Tree* %0, i32 %23, i32 125)                           ; inst 39
  br i1 %24, label %_4.if.then.0, label %_5.if.else.0                              ; inst 40
_4.if.then.0:
  call void @printlnInt(i32 125)                                                   ; inst 41
  br label %_6.if.exit.0                                                           ; inst 42
_5.if.else.0:
  call void @printlnInt(i32 -1)                                                    ; inst 43
  br label %_6.if.exit.0                                                           ; inst 44
_6.if.exit.0:
  %25 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 45
  %26 = load i32, i32* %25                                                         ; inst 46
  call void @mirror_tree(%Tree* %0, i32 %26)                                       ; inst 47
  %27 = call i32 @sum_tree(%Tree* %0, i32 %26)                                     ; inst 48
  call void @printlnInt(i32 %27)                                                   ; inst 49
  %28 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 50
  %29 = load i32, i32* %28                                                         ; inst 51
  %30 = call i32 @process_with_shadow_error(%Tree* %0, i32 %29, i32 10)            ; inst 52
  call void @printlnInt(i32 %30)                                                   ; inst 53
  call void @printlnInt(i32 9999)                                                  ; inst 54
  call void @exit(i32 0)                                                           ; inst 55
  ret void                                                                         ; inst 56
}

define void @initialize_pool(%Tree* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 512                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [512 x %Node], [512 x %Node]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 2                                ; inst 8
  %7 = add i32 %1, 1                                                               ; inst 9
  store i32 %7, i32* %6                                                            ; inst 10
  %8 = add i32 %1, 1                                                               ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %9 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 13
  %10 = getelementptr [512 x %Node], [512 x %Node]* %9, i32 0, i64 511             ; inst 14
  %11 = getelementptr %Node, %Node* %10, i32 0, i32 2                              ; inst 15
  store i32 -1, i32* %11                                                           ; inst 16
  %12 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                               ; inst 17
  store i32 0, i32* %12                                                            ; inst 18
  ret void                                                                         ; inst 19
}

define i32 @alloc_node(%Tree* %0) {
_0.entry.0:
  %1 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                                ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp eq i32 %2, -1                                                          ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 -1                                                                       ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                                ; inst 7
  %5 = load i32, i32* %4                                                           ; inst 8
  %6 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                                ; inst 9
  %7 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 10
  %8 = sext i32 %5 to i64                                                          ; inst 11
  %9 = getelementptr [512 x %Node], [512 x %Node]* %7, i32 0, i64 %8               ; inst 12
  %10 = getelementptr %Node, %Node* %9, i32 0, i32 2                               ; inst 13
  %11 = load i32, i32* %10                                                         ; inst 14
  store i32 %11, i32* %6                                                           ; inst 15
  %12 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 16
  %13 = sext i32 %5 to i64                                                         ; inst 17
  %14 = getelementptr [512 x %Node], [512 x %Node]* %12, i32 0, i64 %13            ; inst 18
  %15 = getelementptr %Node, %Node* %14, i32 0, i32 2                              ; inst 19
  store i32 -1, i32* %15                                                           ; inst 20
  %16 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 21
  %17 = sext i32 %5 to i64                                                         ; inst 22
  %18 = getelementptr [512 x %Node], [512 x %Node]* %16, i32 0, i64 %17            ; inst 23
  %19 = getelementptr %Node, %Node* %18, i32 0, i32 3                              ; inst 24
  store i32 -1, i32* %19                                                           ; inst 25
  ret i32 %5                                                                       ; inst 26
}

define i32 @build_complex_tree(%Tree* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sle i32 %1, 0                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = call i32 @alloc_node(%Tree* %0)                                             ; inst 3
  %5 = icmp ne i32 %4, -1                                                          ; inst 4
  br i1 %5, label %_2.if.then.1, label %_3.if.else.1                               ; inst 5
_2.if.then.1:
  %6 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 6
  %7 = sext i32 %4 to i64                                                          ; inst 7
  %8 = getelementptr [512 x %Node], [512 x %Node]* %6, i32 0, i64 %7               ; inst 8
  %9 = getelementptr %Node, %Node* %8, i32 0, i32 0                                ; inst 9
  store i32 2, i32* %9                                                             ; inst 10
  %10 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 11
  %11 = sext i32 %4 to i64                                                         ; inst 12
  %12 = getelementptr [512 x %Node], [512 x %Node]* %10, i32 0, i64 %11            ; inst 13
  %13 = getelementptr %Node, %Node* %12, i32 0, i32 1                              ; inst 14
  %14 = srem i32 %2, 256                                                           ; inst 15
  store i32 %14, i32* %13                                                          ; inst 16
  br label %_4.if.exit.1                                                           ; inst 17
_3.if.else.1:
  br label %_4.if.exit.1                                                           ; inst 18
_4.if.exit.1:
  ret i32 %4                                                                       ; inst 19
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 20
_6.if.exit.0:
  %15 = call i32 @alloc_node(%Tree* %0)                                            ; inst 21
  %16 = icmp eq i32 %15, -1                                                        ; inst 22
  br i1 %16, label %_7.if.then.2, label %_8.if.else.2                              ; inst 23
_7.if.then.2:
  ret i32 -1                                                                       ; inst 24
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 25
_9.if.exit.2:
  %17 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 26
  %18 = sext i32 %15 to i64                                                        ; inst 27
  %19 = getelementptr [512 x %Node], [512 x %Node]* %17, i32 0, i64 %18            ; inst 28
  %20 = getelementptr %Node, %Node* %19, i32 0, i32 0                              ; inst 29
  store i32 1, i32* %20                                                            ; inst 30
  %21 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 31
  %22 = sext i32 %15 to i64                                                        ; inst 32
  %23 = getelementptr [512 x %Node], [512 x %Node]* %21, i32 0, i64 %22            ; inst 33
  %24 = getelementptr %Node, %Node* %23, i32 0, i32 1                              ; inst 34
  store i32 %2, i32* %24                                                           ; inst 35
  %25 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 36
  %26 = sext i32 %15 to i64                                                        ; inst 37
  %27 = getelementptr [512 x %Node], [512 x %Node]* %25, i32 0, i64 %26            ; inst 38
  %28 = getelementptr %Node, %Node* %27, i32 0, i32 2                              ; inst 39
  %29 = sub i32 %1, 1                                                              ; inst 40
  %30 = mul i32 %2, 2                                                              ; inst 41
  %31 = add i32 %30, 1                                                             ; inst 42
  %32 = call i32 @build_complex_tree(%Tree* %0, i32 %29, i32 %31)                  ; inst 43
  store i32 %32, i32* %28                                                          ; inst 44
  %33 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 45
  %34 = sext i32 %15 to i64                                                        ; inst 46
  %35 = getelementptr [512 x %Node], [512 x %Node]* %33, i32 0, i64 %34            ; inst 47
  %36 = getelementptr %Node, %Node* %35, i32 0, i32 3                              ; inst 48
  %37 = sub i32 %1, 1                                                              ; inst 49
  %38 = mul i32 %2, 3                                                              ; inst 50
  %39 = sub i32 %38, 1                                                             ; inst 51
  %40 = call i32 @build_complex_tree(%Tree* %0, i32 %37, i32 %39)                  ; inst 52
  store i32 %40, i32* %36                                                          ; inst 53
  ret i32 %15                                                                      ; inst 54
}

define i32 @sum_tree(%Tree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [512 x %Node], [512 x %Node]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 0                                ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = icmp eq i32 %7, 2                                                           ; inst 10
  br i1 %8, label %_4.if.then.1, label %_5.if.else.1                               ; inst 11
_4.if.then.1:
  %9 = getelementptr %Node, %Node* %5, i32 0, i32 1                                ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  ret i32 %10                                                                      ; inst 14
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 15
_6.if.exit.1:
  %11 = getelementptr %Node, %Node* %5, i32 0, i32 2                               ; inst 16
  %12 = load i32, i32* %11                                                         ; inst 17
  %13 = call i32 @sum_tree(%Tree* %0, i32 %12)                                     ; inst 18
  %14 = getelementptr %Node, %Node* %5, i32 0, i32 3                               ; inst 19
  %15 = load i32, i32* %14                                                         ; inst 20
  %16 = call i32 @sum_tree(%Tree* %0, i32 %15)                                     ; inst 21
  %17 = getelementptr %Node, %Node* %5, i32 0, i32 1                               ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = add i32 %18, %13                                                           ; inst 24
  %20 = add i32 %19, %16                                                           ; inst 25
  ret i32 %20                                                                      ; inst 26
}

define i32 @find_height(%Tree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [512 x %Node], [512 x %Node]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 2                                ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = call i32 @find_height(%Tree* %0, i32 %7)                                    ; inst 10
  %9 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 11
  %10 = sext i32 %1 to i64                                                         ; inst 12
  %11 = getelementptr [512 x %Node], [512 x %Node]* %9, i32 0, i64 %10             ; inst 13
  %12 = getelementptr %Node, %Node* %11, i32 0, i32 3                              ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = call i32 @find_height(%Tree* %0, i32 %13)                                  ; inst 16
  %15 = icmp sgt i32 %8, %14                                                       ; inst 17
  br i1 %15, label %_4.if.then.1, label %_5.if.else.1                              ; inst 18
_4.if.then.1:
  %16 = add i32 %8, 1                                                              ; inst 19
  ret i32 %16                                                                      ; inst 20
_5.if.else.1:
  %17 = add i32 %14, 1                                                             ; inst 21
  ret i32 %17                                                                      ; inst 22
_6.if.exit.1:
  unreachable                                                                      ; inst 23
}

define i1 @find_value(%Tree* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i1 0                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 5
  %5 = sext i32 %1 to i64                                                          ; inst 6
  %6 = getelementptr [512 x %Node], [512 x %Node]* %4, i32 0, i64 %5               ; inst 7
  %7 = getelementptr %Node, %Node* %6, i32 0, i32 1                                ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp eq i32 %8, %2                                                          ; inst 10
  br i1 %9, label %_4.if.then.1, label %_5.if.else.1                               ; inst 11
_4.if.then.1:
  ret i1 1                                                                         ; inst 12
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 13
_6.if.exit.1:
  %10 = getelementptr %Node, %Node* %6, i32 0, i32 2                               ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = call i1 @find_value(%Tree* %0, i32 %11, i32 %2)                            ; inst 16
  br i1 %12, label %_7.if.then.2, label %_8.if.else.2                              ; inst 17
_7.if.then.2:
  ret i1 1                                                                         ; inst 18
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 19
_9.if.exit.2:
  %13 = getelementptr %Node, %Node* %6, i32 0, i32 3                               ; inst 20
  %14 = load i32, i32* %13                                                         ; inst 21
  %15 = call i1 @find_value(%Tree* %0, i32 %14, i32 %2)                            ; inst 22
  br i1 %15, label %_10.if.then.3, label %_11.if.else.3                            ; inst 23
_10.if.then.3:
  ret i1 1                                                                         ; inst 24
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 25
_12.if.exit.3:
  ret i1 0                                                                         ; inst 26
}

define void @mirror_tree(%Tree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [512 x %Node], [512 x %Node]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 2                                ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = getelementptr %Node, %Node* %5, i32 0, i32 2                                ; inst 10
  %9 = getelementptr %Node, %Node* %5, i32 0, i32 3                                ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  store i32 %10, i32* %8                                                           ; inst 13
  %11 = getelementptr %Node, %Node* %5, i32 0, i32 3                               ; inst 14
  store i32 %7, i32* %11                                                           ; inst 15
  %12 = getelementptr %Node, %Node* %5, i32 0, i32 2                               ; inst 16
  %13 = load i32, i32* %12                                                         ; inst 17
  %14 = getelementptr %Node, %Node* %5, i32 0, i32 3                               ; inst 18
  %15 = load i32, i32* %14                                                         ; inst 19
  call void @mirror_tree(%Tree* %0, i32 %13)                                       ; inst 20
  call void @mirror_tree(%Tree* %0, i32 %15)                                       ; inst 21
  ret void                                                                         ; inst 22
}

define i32 @process_with_shadow_error(%Tree* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 5
  %5 = sext i32 %1 to i64                                                          ; inst 6
  %6 = getelementptr [512 x %Node], [512 x %Node]* %4, i32 0, i64 %5               ; inst 7
  %7 = getelementptr %Node, %Node* %6, i32 0, i32 1                                ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp sgt i32 %8, %2                                                         ; inst 10
  br i1 %9, label %_4.if.then.1, label %_8.if.else.1                               ; inst 11
_4.if.then.1:
  %10 = getelementptr %Node, %Node* %6, i32 0, i32 1                               ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = add i32 %2, 10                                                             ; inst 14
  %13 = getelementptr %Node, %Node* %6, i32 0, i32 0                               ; inst 15
  %14 = load i32, i32* %13                                                         ; inst 16
  %15 = icmp eq i32 %14, 1                                                         ; inst 17
  br i1 %15, label %_5.if.then.2, label %_6.if.else.2                              ; inst 18
_5.if.then.2:
  %16 = getelementptr %Node, %Node* %6, i32 0, i32 2                               ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = call i32 @process_with_shadow_error(%Tree* %0, i32 %17, i32 %12)           ; inst 21
  %19 = add i32 %11, %18                                                           ; inst 22
  %20 = getelementptr %Node, %Node* %6, i32 0, i32 3                               ; inst 23
  %21 = load i32, i32* %20                                                         ; inst 24
  %22 = call i32 @process_with_shadow_error(%Tree* %0, i32 %21, i32 %12)           ; inst 25
  %23 = add i32 %19, %22                                                           ; inst 26
  br label %_7.if.exit.2                                                           ; inst 27
_6.if.else.2:
  br label %_7.if.exit.2                                                           ; inst 28
_7.if.exit.2:
  %24 = phi i32 [%23, %_5.if.then.2], [%11, %_6.if.else.2]                         ; inst 29
  br label %_12.if.exit.1                                                          ; inst 30
_8.if.else.1:
  %25 = getelementptr %Node, %Node* %6, i32 0, i32 0                               ; inst 31
  %26 = load i32, i32* %25                                                         ; inst 32
  %27 = icmp eq i32 %26, 1                                                         ; inst 33
  br i1 %27, label %_9.if.then.3, label %_10.if.else.3                             ; inst 34
_9.if.then.3:
  %28 = sub i32 %2, 2                                                              ; inst 35
  %29 = getelementptr %Node, %Node* %6, i32 0, i32 2                               ; inst 36
  %30 = load i32, i32* %29                                                         ; inst 37
  %31 = call i32 @process_with_shadow_error(%Tree* %0, i32 %30, i32 %28)           ; inst 38
  %32 = getelementptr %Node, %Node* %6, i32 0, i32 3                               ; inst 39
  %33 = load i32, i32* %32                                                         ; inst 40
  %34 = call i32 @process_with_shadow_error(%Tree* %0, i32 %33, i32 %28)           ; inst 41
  %35 = add i32 %31, %34                                                           ; inst 42
  br label %_11.if.exit.3                                                          ; inst 43
_10.if.else.3:
  br label %_11.if.exit.3                                                          ; inst 44
_11.if.exit.3:
  %36 = phi i32 [%35, %_9.if.then.3], [0, %_10.if.else.3]                          ; inst 45
  br label %_12.if.exit.1                                                          ; inst 46
_12.if.exit.1:
  %37 = phi i32 [%24, %_7.if.exit.2], [%36, %_11.if.exit.3]                        ; inst 47
  ret i32 %37                                                                      ; inst 48
}

define void @prune_tree(%Tree* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %5 = icmp sge i32 %3, %2                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %6 = phi i1 [1, %_1.lazy.then.0], [%5, %_2.lazy.else.0]                          ; inst 6
  br i1 %6, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret void                                                                         ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %7 = sub i32 %2, 1                                                               ; inst 10
  %8 = icmp eq i32 %3, %7                                                          ; inst 11
  br i1 %8, label %_7.if.then.1, label %_8.if.else.1                               ; inst 12
_7.if.then.1:
  %9 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 13
  %10 = sext i32 %1 to i64                                                         ; inst 14
  %11 = getelementptr [512 x %Node], [512 x %Node]* %9, i32 0, i64 %10             ; inst 15
  %12 = getelementptr %Node, %Node* %11, i32 0, i32 2                              ; inst 16
  %13 = load i32, i32* %12                                                         ; inst 17
  %14 = getelementptr %Node, %Node* %11, i32 0, i32 3                              ; inst 18
  %15 = load i32, i32* %14                                                         ; inst 19
  call void @free_tree(%Tree* %0, i32 %13)                                         ; inst 20
  call void @free_tree(%Tree* %0, i32 %15)                                         ; inst 21
  %16 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 22
  %17 = sext i32 %1 to i64                                                         ; inst 23
  %18 = getelementptr [512 x %Node], [512 x %Node]* %16, i32 0, i64 %17            ; inst 24
  %19 = getelementptr %Node, %Node* %18, i32 0, i32 2                              ; inst 25
  store i32 -1, i32* %19                                                           ; inst 26
  %20 = getelementptr %Node, %Node* %18, i32 0, i32 3                              ; inst 27
  store i32 -1, i32* %20                                                           ; inst 28
  %21 = getelementptr %Node, %Node* %18, i32 0, i32 0                              ; inst 29
  store i32 2, i32* %21                                                            ; inst 30
  br label %_9.if.exit.1                                                           ; inst 31
_8.if.else.1:
  %22 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 32
  %23 = sext i32 %1 to i64                                                         ; inst 33
  %24 = getelementptr [512 x %Node], [512 x %Node]* %22, i32 0, i64 %23            ; inst 34
  %25 = getelementptr %Node, %Node* %24, i32 0, i32 2                              ; inst 35
  %26 = load i32, i32* %25                                                         ; inst 36
  %27 = getelementptr %Node, %Node* %24, i32 0, i32 3                              ; inst 37
  %28 = load i32, i32* %27                                                         ; inst 38
  %29 = add i32 %3, 1                                                              ; inst 39
  call void @prune_tree(%Tree* %0, i32 %26, i32 %2, i32 %29)                       ; inst 40
  %30 = add i32 %3, 1                                                              ; inst 41
  call void @prune_tree(%Tree* %0, i32 %28, i32 %2, i32 %30)                       ; inst 42
  br label %_9.if.exit.1                                                           ; inst 43
_9.if.exit.1:
  ret void                                                                         ; inst 44
}

define void @free_tree(%Tree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [512 x %Node], [512 x %Node]* %3, i32 0, i64 %4               ; inst 7
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 2                                ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  call void @free_tree(%Tree* %0, i32 %7)                                          ; inst 10
  %8 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 11
  %9 = sext i32 %1 to i64                                                          ; inst 12
  %10 = getelementptr [512 x %Node], [512 x %Node]* %8, i32 0, i64 %9              ; inst 13
  %11 = getelementptr %Node, %Node* %10, i32 0, i32 3                              ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  call void @free_tree(%Tree* %0, i32 %12)                                         ; inst 16
  %13 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                               ; inst 17
  %14 = sext i32 %1 to i64                                                         ; inst 18
  %15 = getelementptr [512 x %Node], [512 x %Node]* %13, i32 0, i64 %14            ; inst 19
  %16 = getelementptr %Node, %Node* %15, i32 0, i32 2                              ; inst 20
  %17 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                               ; inst 21
  %18 = load i32, i32* %17                                                         ; inst 22
  store i32 %18, i32* %16                                                          ; inst 23
  %19 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                               ; inst 24
  store i32 %1, i32* %19                                                           ; inst 25
  ret void                                                                         ; inst 26
}

define void @another_tree_operation() {
_0.entry.0:
  %0 = alloca %Tree                                                                ; inst 1
  %1 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 2
  %2 = alloca %Node                                                                ; inst 3
  %3 = getelementptr %Node, %Node* %2, i32 0, i32 0                                ; inst 4
  store i32 0, i32* %3                                                             ; inst 5
  %4 = getelementptr %Node, %Node* %2, i32 0, i32 1                                ; inst 6
  store i32 0, i32* %4                                                             ; inst 7
  %5 = getelementptr %Node, %Node* %2, i32 0, i32 2                                ; inst 8
  store i32 -1, i32* %5                                                            ; inst 9
  %6 = getelementptr %Node, %Node* %2, i32 0, i32 3                                ; inst 10
  store i32 -1, i32* %6                                                            ; inst 11
  %7 = getelementptr [512 x %Node], [512 x %Node]* %1, i32 0, i32 0                ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 14
  %9 = icmp slt i32 %8, 512                                                        ; inst 15
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 16
_2.array.body.0:
  %10 = getelementptr %Node, %Node* %7, i32 %8                                     ; inst 17
  call void @memcpy(%Node* %10, %Node* %2, i64 16)                                 ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_1.array.cond.0                                                        ; inst 20
_3.array.exit.0:
  %12 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 21
  store i32 -1, i32* %12                                                           ; inst 22
  %13 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                               ; inst 23
  store i32 0, i32* %13                                                            ; inst 24
  call void @initialize_pool(%Tree* %0)                                            ; inst 25
  %14 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 26
  %15 = call i32 @build_complex_tree(%Tree* %0, i32 5, i32 50)                     ; inst 27
  store i32 %15, i32* %14                                                          ; inst 28
  %16 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 29
  %17 = load i32, i32* %16                                                         ; inst 30
  call void @prune_tree(%Tree* %0, i32 %17, i32 3, i32 0)                          ; inst 31
  %18 = call i32 @sum_tree(%Tree* %0, i32 %17)                                     ; inst 32
  call void @printlnInt(i32 %18)                                                   ; inst 33
  ret void                                                                         ; inst 34
}

define void @yet_another_scenario() {
_0.entry.0:
  %0 = alloca %Tree                                                                ; inst 1
  %1 = getelementptr %Tree, %Tree* %0, i32 0, i32 0                                ; inst 2
  %2 = alloca %Node                                                                ; inst 3
  %3 = getelementptr %Node, %Node* %2, i32 0, i32 0                                ; inst 4
  store i32 0, i32* %3                                                             ; inst 5
  %4 = getelementptr %Node, %Node* %2, i32 0, i32 1                                ; inst 6
  store i32 0, i32* %4                                                             ; inst 7
  %5 = getelementptr %Node, %Node* %2, i32 0, i32 2                                ; inst 8
  store i32 -1, i32* %5                                                            ; inst 9
  %6 = getelementptr %Node, %Node* %2, i32 0, i32 3                                ; inst 10
  store i32 -1, i32* %6                                                            ; inst 11
  %7 = getelementptr [512 x %Node], [512 x %Node]* %1, i32 0, i32 0                ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 14
  %9 = icmp slt i32 %8, 512                                                        ; inst 15
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 16
_2.array.body.0:
  %10 = getelementptr %Node, %Node* %7, i32 %8                                     ; inst 17
  call void @memcpy(%Node* %10, %Node* %2, i64 16)                                 ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_1.array.cond.0                                                        ; inst 20
_3.array.exit.0:
  %12 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 21
  store i32 -1, i32* %12                                                           ; inst 22
  %13 = getelementptr %Tree, %Tree* %0, i32 0, i32 2                               ; inst 23
  store i32 0, i32* %13                                                            ; inst 24
  call void @initialize_pool(%Tree* %0)                                            ; inst 25
  %14 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 26
  %15 = call i32 @build_complex_tree(%Tree* %0, i32 6, i32 20)                     ; inst 27
  store i32 %15, i32* %14                                                          ; inst 28
  br label %_4.while.cond.0                                                        ; inst 29
_4.while.cond.0:
  %16 = phi i32 [0, %_3.array.exit.0], [%20, %_5.while.body.0]                     ; inst 30
  %17 = icmp slt i32 %16, 10                                                       ; inst 31
  br i1 %17, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 32
_5.while.body.0:
  %18 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 33
  %19 = load i32, i32* %18                                                         ; inst 34
  call void @mirror_tree(%Tree* %0, i32 %19)                                       ; inst 35
  %20 = add i32 %16, 1                                                             ; inst 36
  br label %_4.while.cond.0                                                        ; inst 37
_6.while.exit.0:
  %21 = getelementptr %Tree, %Tree* %0, i32 0, i32 1                               ; inst 38
  %22 = load i32, i32* %21                                                         ; inst 39
  %23 = call i32 @find_height(%Tree* %0, i32 %22)                                  ; inst 40
  call void @printlnInt(i32 %23)                                                   ; inst 41
  call void @another_tree_operation()                                              ; inst 42
  ret void                                                                         ; inst 43
}

