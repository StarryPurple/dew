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


%Node = type { i32, i32, i32, i32, i1, i32, i32, i32, i32, i32, i32, i32 }
%AVLTree = type { [2000 x %Node], i32, i32, [2000 x i32], i32, i32, i32, i32, i32, i32 }
%HashTable = type { [1000 x [20 x i32]], [1000 x i32], [1000 x [20 x i32]], i32, i32, i32, i32, i32, i32, i32 }
%LRUCache = type { [500 x i32], [500 x i32], [500 x i32], [10000 x i32], i32, i32, i32, i32, i32 }
%MemoryManager = type { [10000 x i32], [10000 x i1], [10000 x i32], i32, i32, i32, i32, i32, i32 }

define void @_250uMAnM4NY_new(%Node* sret(%Node) %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %Node, %Node* %0, i32 0, i32 0                                ; inst 1
  store i32 %1, i32* %3                                                            ; inst 2
  %4 = getelementptr %Node, %Node* %0, i32 0, i32 1                                ; inst 3
  store i32 %2, i32* %4                                                            ; inst 4
  %5 = getelementptr %Node, %Node* %0, i32 0, i32 2                                ; inst 5
  store i32 1, i32* %5                                                             ; inst 6
  %6 = getelementptr %Node, %Node* %0, i32 0, i32 3                                ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = getelementptr %Node, %Node* %0, i32 0, i32 4                                ; inst 9
  store i1 1, i1* %7                                                               ; inst 10
  %8 = getelementptr %Node, %Node* %0, i32 0, i32 5                                ; inst 11
  store i32 1, i32* %8                                                             ; inst 12
  %9 = getelementptr %Node, %Node* %0, i32 0, i32 6                                ; inst 13
  store i32 0, i32* %9                                                             ; inst 14
  %10 = getelementptr %Node, %Node* %0, i32 0, i32 7                               ; inst 15
  store i32 -1, i32* %10                                                           ; inst 16
  %11 = getelementptr %Node, %Node* %0, i32 0, i32 8                               ; inst 17
  store i32 -1, i32* %11                                                           ; inst 18
  %12 = getelementptr %Node, %Node* %0, i32 0, i32 9                               ; inst 19
  store i32 -1, i32* %12                                                           ; inst 20
  %13 = getelementptr %Node, %Node* %0, i32 0, i32 10                              ; inst 21
  store i32 -1, i32* %13                                                           ; inst 22
  %14 = getelementptr %Node, %Node* %0, i32 0, i32 11                              ; inst 23
  store i32 -1, i32* %14                                                           ; inst 24
  ret void                                                                         ; inst 25
}

define void @_7GLwwskssmg_new(%AVLTree* sret(%AVLTree) %0) {
_0.entry.0:
  %1 = alloca %AVLTree                                                             ; inst 1
  %2 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 0                          ; inst 2
  %3 = alloca %Node                                                                ; inst 3
  call void @_250uMAnM4NY_new(%Node* %3, i32 0, i32 0)                             ; inst 4
  %4 = getelementptr [2000 x %Node], [2000 x %Node]* %2, i32 0, i32 0              ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 7
  %6 = icmp slt i32 %5, 2000                                                       ; inst 8
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 9
_2.array.body.0:
  %7 = getelementptr %Node, %Node* %4, i32 %5                                      ; inst 10
  call void @memcpy(%Node* %7, %Node* %3, i64 48)                                  ; inst 11
  %8 = add i32 %5, 1                                                               ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  %9 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 1                          ; inst 14
  store i32 0, i32* %9                                                             ; inst 15
  %10 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 2                         ; inst 16
  store i32 -1, i32* %10                                                           ; inst 17
  %11 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 3                         ; inst 18
  %12 = getelementptr [2000 x i32], [2000 x i32]* %11, i32 0, i32 0                ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_4.array.cond.1:
  %13 = phi i32 [0, %_3.array.exit.0], [%16, %_5.array.body.1]                     ; inst 21
  %14 = icmp slt i32 %13, 2000                                                     ; inst 22
  br i1 %14, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 23
_5.array.body.1:
  %15 = getelementptr i32, i32* %12, i32 %13                                       ; inst 24
  store i32 0, i32* %15                                                            ; inst 25
  %16 = add i32 %13, 1                                                             ; inst 26
  br label %_4.array.cond.1                                                        ; inst 27
_6.array.exit.1:
  %17 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 4                         ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 5                         ; inst 30
  store i32 0, i32* %18                                                            ; inst 31
  %19 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 6                         ; inst 32
  store i32 0, i32* %19                                                            ; inst 33
  %20 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 7                         ; inst 34
  store i32 0, i32* %20                                                            ; inst 35
  %21 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 8                         ; inst 36
  store i32 0, i32* %21                                                            ; inst 37
  %22 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 9                         ; inst 38
  store i32 0, i32* %22                                                            ; inst 39
  br label %_7.while.cond.0                                                        ; inst 40
_7.while.cond.0:
  %23 = phi i32 [0, %_6.array.exit.1], [%28, %_8.while.body.0]                     ; inst 41
  %24 = icmp slt i32 %23, 2000                                                     ; inst 42
  br i1 %24, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 43
_8.while.body.0:
  %25 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 3                         ; inst 44
  %26 = sext i32 %23 to i64                                                        ; inst 45
  %27 = getelementptr [2000 x i32], [2000 x i32]* %25, i32 0, i64 %26              ; inst 46
  store i32 %23, i32* %27                                                          ; inst 47
  %28 = add i32 %23, 1                                                             ; inst 48
  br label %_7.while.cond.0                                                        ; inst 49
_9.while.exit.0:
  %29 = getelementptr %AVLTree, %AVLTree* %1, i32 0, i32 4                         ; inst 50
  store i32 2000, i32* %29                                                         ; inst 51
  call void @memcpy(%AVLTree* %0, %AVLTree* %1, i64 104032)                        ; inst 52
  ret void                                                                         ; inst 53
}

define i32 @_7GLwwskssmg_allocate_node(%AVLTree* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 4                          ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  %5 = icmp eq i32 %4, 0                                                           ; inst 3
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 -1                                                                       ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %6 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 4                          ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = sub i32 %7, 1                                                               ; inst 9
  store i32 %8, i32* %6                                                            ; inst 10
  %9 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 3                          ; inst 11
  %10 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 4                         ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = sext i32 %11 to i64                                                        ; inst 14
  %13 = getelementptr [2000 x i32], [2000 x i32]* %9, i32 0, i64 %12               ; inst 15
  %14 = load i32, i32* %13                                                         ; inst 16
  %15 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 17
  %16 = sext i32 %14 to i64                                                        ; inst 18
  %17 = getelementptr [2000 x %Node], [2000 x %Node]* %15, i32 0, i64 %16          ; inst 19
  %18 = alloca %Node                                                               ; inst 20
  call void @_250uMAnM4NY_new(%Node* %18, i32 %1, i32 %2)                          ; inst 21
  call void @memcpy(%Node* %17, %Node* %18, i64 48)                                ; inst 22
  %19 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 1                         ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = add i32 %20, 1                                                             ; inst 25
  store i32 %21, i32* %19                                                          ; inst 26
  ret i32 %14                                                                      ; inst 27
}

define void @_7GLwwskssmg_deallocate_node(%AVLTree* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 4                          ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = icmp slt i32 %3, 2000                                                       ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  %5 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 3                          ; inst 5
  %6 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 4                          ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = sext i32 %7 to i64                                                          ; inst 8
  %9 = getelementptr [2000 x i32], [2000 x i32]* %5, i32 0, i64 %8                 ; inst 9
  store i32 %1, i32* %9                                                            ; inst 10
  %10 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 4                         ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = add i32 %11, 1                                                             ; inst 13
  store i32 %12, i32* %10                                                          ; inst 14
  %13 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 1                         ; inst 15
  %14 = load i32, i32* %13                                                         ; inst 16
  %15 = sub i32 %14, 1                                                             ; inst 17
  store i32 %15, i32* %13                                                          ; inst 18
  br label %_3.if.exit.0                                                           ; inst 19
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 20
_3.if.exit.0:
  ret void                                                                         ; inst 21
}

define i32 @_7GLwwskssmg_get_height(%AVLTree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [2000 x %Node], [2000 x %Node]* %3, i32 0, i64 %4             ; inst 7
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 2                                ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  ret i32 %7                                                                       ; inst 10
}

define i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [2000 x %Node], [2000 x %Node]* %3, i32 0, i64 %4             ; inst 7
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 9                                ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = call i32 @_7GLwwskssmg_get_height(%AVLTree* %0, i32 %7)                     ; inst 10
  %9 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 11
  %10 = sext i32 %1 to i64                                                         ; inst 12
  %11 = getelementptr [2000 x %Node], [2000 x %Node]* %9, i32 0, i64 %10           ; inst 13
  %12 = getelementptr %Node, %Node* %11, i32 0, i32 10                             ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = call i32 @_7GLwwskssmg_get_height(%AVLTree* %0, i32 %13)                   ; inst 16
  %15 = sub i32 %8, %14                                                            ; inst 17
  ret i32 %15                                                                      ; inst 18
}

define void @_7GLwwskssmg_update_height(%AVLTree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp ne i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 3
  %4 = sext i32 %1 to i64                                                          ; inst 4
  %5 = getelementptr [2000 x %Node], [2000 x %Node]* %3, i32 0, i64 %4             ; inst 5
  %6 = getelementptr %Node, %Node* %5, i32 0, i32 9                                ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = call i32 @_7GLwwskssmg_get_height(%AVLTree* %0, i32 %7)                     ; inst 8
  %9 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 9
  %10 = sext i32 %1 to i64                                                         ; inst 10
  %11 = getelementptr [2000 x %Node], [2000 x %Node]* %9, i32 0, i64 %10           ; inst 11
  %12 = getelementptr %Node, %Node* %11, i32 0, i32 10                             ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = call i32 @_7GLwwskssmg_get_height(%AVLTree* %0, i32 %13)                   ; inst 14
  %15 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 15
  %16 = sext i32 %1 to i64                                                         ; inst 16
  %17 = getelementptr [2000 x %Node], [2000 x %Node]* %15, i32 0, i64 %16          ; inst 17
  %18 = getelementptr %Node, %Node* %17, i32 0, i32 2                              ; inst 18
  %19 = icmp sgt i32 %8, %14                                                       ; inst 19
  br i1 %19, label %_2.if.then.1, label %_3.if.else.1                              ; inst 20
_2.if.then.1:
  br label %_4.if.exit.1                                                           ; inst 21
_3.if.else.1:
  br label %_4.if.exit.1                                                           ; inst 22
_4.if.exit.1:
  %20 = phi i32 [%8, %_2.if.then.1], [%14, %_3.if.else.1]                          ; inst 23
  %21 = add i32 1, %20                                                             ; inst 24
  store i32 %21, i32* %18                                                          ; inst 25
  %22 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 26
  %23 = sext i32 %1 to i64                                                         ; inst 27
  %24 = getelementptr [2000 x %Node], [2000 x %Node]* %22, i32 0, i64 %23          ; inst 28
  %25 = getelementptr %Node, %Node* %24, i32 0, i32 3                              ; inst 29
  %26 = call i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %1)                   ; inst 30
  store i32 %26, i32* %25                                                          ; inst 31
  br label %_6.if.exit.0                                                           ; inst 32
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 33
_6.if.exit.0:
  ret void                                                                         ; inst 34
}

define i32 @_7GLwwskssmg_right_rotate(%AVLTree* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [2000 x %Node], [2000 x %Node]* %2, i32 0, i64 %3             ; inst 3
  %5 = getelementptr %Node, %Node* %4, i32 0, i32 9                                ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  %7 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 6
  %8 = sext i32 %6 to i64                                                          ; inst 7
  %9 = getelementptr [2000 x %Node], [2000 x %Node]* %7, i32 0, i64 %8             ; inst 8
  %10 = getelementptr %Node, %Node* %9, i32 0, i32 10                              ; inst 9
  %11 = load i32, i32* %10                                                         ; inst 10
  %12 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 11
  %13 = sext i32 %6 to i64                                                         ; inst 12
  %14 = getelementptr [2000 x %Node], [2000 x %Node]* %12, i32 0, i64 %13          ; inst 13
  %15 = getelementptr %Node, %Node* %14, i32 0, i32 10                             ; inst 14
  store i32 %1, i32* %15                                                           ; inst 15
  %16 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 16
  %17 = sext i32 %1 to i64                                                         ; inst 17
  %18 = getelementptr [2000 x %Node], [2000 x %Node]* %16, i32 0, i64 %17          ; inst 18
  %19 = getelementptr %Node, %Node* %18, i32 0, i32 9                              ; inst 19
  store i32 %11, i32* %19                                                          ; inst 20
  %20 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 21
  %21 = sext i32 %1 to i64                                                         ; inst 22
  %22 = getelementptr [2000 x %Node], [2000 x %Node]* %20, i32 0, i64 %21          ; inst 23
  %23 = getelementptr %Node, %Node* %22, i32 0, i32 11                             ; inst 24
  store i32 %6, i32* %23                                                           ; inst 25
  %24 = icmp ne i32 %11, -1                                                        ; inst 26
  br i1 %24, label %_1.if.then.0, label %_2.if.else.0                              ; inst 27
_1.if.then.0:
  %25 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 28
  %26 = sext i32 %11 to i64                                                        ; inst 29
  %27 = getelementptr [2000 x %Node], [2000 x %Node]* %25, i32 0, i64 %26          ; inst 30
  %28 = getelementptr %Node, %Node* %27, i32 0, i32 11                             ; inst 31
  store i32 %1, i32* %28                                                           ; inst 32
  br label %_3.if.exit.0                                                           ; inst 33
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 34
_3.if.exit.0:
  call void @_7GLwwskssmg_update_height(%AVLTree* %0, i32 %1)                      ; inst 35
  call void @_7GLwwskssmg_update_height(%AVLTree* %0, i32 %6)                      ; inst 36
  %29 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 8                         ; inst 37
  %30 = load i32, i32* %29                                                         ; inst 38
  %31 = add i32 %30, 1                                                             ; inst 39
  store i32 %31, i32* %29                                                          ; inst 40
  ret i32 %6                                                                       ; inst 41
}

define i32 @_7GLwwskssmg_left_rotate(%AVLTree* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [2000 x %Node], [2000 x %Node]* %2, i32 0, i64 %3             ; inst 3
  %5 = getelementptr %Node, %Node* %4, i32 0, i32 10                               ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  %7 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 6
  %8 = sext i32 %6 to i64                                                          ; inst 7
  %9 = getelementptr [2000 x %Node], [2000 x %Node]* %7, i32 0, i64 %8             ; inst 8
  %10 = getelementptr %Node, %Node* %9, i32 0, i32 9                               ; inst 9
  %11 = load i32, i32* %10                                                         ; inst 10
  %12 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 11
  %13 = sext i32 %6 to i64                                                         ; inst 12
  %14 = getelementptr [2000 x %Node], [2000 x %Node]* %12, i32 0, i64 %13          ; inst 13
  %15 = getelementptr %Node, %Node* %14, i32 0, i32 9                              ; inst 14
  store i32 %1, i32* %15                                                           ; inst 15
  %16 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 16
  %17 = sext i32 %1 to i64                                                         ; inst 17
  %18 = getelementptr [2000 x %Node], [2000 x %Node]* %16, i32 0, i64 %17          ; inst 18
  %19 = getelementptr %Node, %Node* %18, i32 0, i32 10                             ; inst 19
  store i32 %11, i32* %19                                                          ; inst 20
  %20 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 21
  %21 = sext i32 %1 to i64                                                         ; inst 22
  %22 = getelementptr [2000 x %Node], [2000 x %Node]* %20, i32 0, i64 %21          ; inst 23
  %23 = getelementptr %Node, %Node* %22, i32 0, i32 11                             ; inst 24
  store i32 %6, i32* %23                                                           ; inst 25
  %24 = icmp ne i32 %11, -1                                                        ; inst 26
  br i1 %24, label %_1.if.then.0, label %_2.if.else.0                              ; inst 27
_1.if.then.0:
  %25 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 28
  %26 = sext i32 %11 to i64                                                        ; inst 29
  %27 = getelementptr [2000 x %Node], [2000 x %Node]* %25, i32 0, i64 %26          ; inst 30
  %28 = getelementptr %Node, %Node* %27, i32 0, i32 11                             ; inst 31
  store i32 %1, i32* %28                                                           ; inst 32
  br label %_3.if.exit.0                                                           ; inst 33
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 34
_3.if.exit.0:
  call void @_7GLwwskssmg_update_height(%AVLTree* %0, i32 %1)                      ; inst 35
  call void @_7GLwwskssmg_update_height(%AVLTree* %0, i32 %6)                      ; inst 36
  %29 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 8                         ; inst 37
  %30 = load i32, i32* %29                                                         ; inst 38
  %31 = add i32 %30, 1                                                             ; inst 39
  store i32 %31, i32* %29                                                          ; inst 40
  ret i32 %6                                                                       ; inst 41
}

define i32 @_7GLwwskssmg_insert(%AVLTree* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %5 = call i32 @_7GLwwskssmg_allocate_node(%AVLTree* %0, i32 %3, i32 %2)          ; inst 3
  %6 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 6                          ; inst 4
  %7 = load i32, i32* %6                                                           ; inst 5
  %8 = add i32 %7, 1                                                               ; inst 6
  store i32 %8, i32* %6                                                            ; inst 7
  ret i32 %5                                                                       ; inst 8
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 9
_3.if.exit.0:
  %9 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 10
  %10 = sext i32 %1 to i64                                                         ; inst 11
  %11 = getelementptr [2000 x %Node], [2000 x %Node]* %9, i32 0, i64 %10           ; inst 12
  %12 = getelementptr %Node, %Node* %11, i32 0, i32 1                              ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = icmp slt i32 %2, %13                                                       ; inst 15
  br i1 %14, label %_4.if.then.1, label %_8.if.else.1                              ; inst 16
_4.if.then.1:
  %15 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 17
  %16 = sext i32 %1 to i64                                                         ; inst 18
  %17 = getelementptr [2000 x %Node], [2000 x %Node]* %15, i32 0, i64 %16          ; inst 19
  %18 = getelementptr %Node, %Node* %17, i32 0, i32 9                              ; inst 20
  %19 = load i32, i32* %18                                                         ; inst 21
  %20 = call i32 @_7GLwwskssmg_insert(%AVLTree* %0, i32 %19, i32 %2, i32 %3)       ; inst 22
  %21 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 23
  %22 = sext i32 %1 to i64                                                         ; inst 24
  %23 = getelementptr [2000 x %Node], [2000 x %Node]* %21, i32 0, i64 %22          ; inst 25
  %24 = getelementptr %Node, %Node* %23, i32 0, i32 9                              ; inst 26
  store i32 %20, i32* %24                                                          ; inst 27
  %25 = icmp ne i32 %20, -1                                                        ; inst 28
  br i1 %25, label %_5.if.then.2, label %_6.if.else.2                              ; inst 29
_5.if.then.2:
  %26 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 30
  %27 = sext i32 %20 to i64                                                        ; inst 31
  %28 = getelementptr [2000 x %Node], [2000 x %Node]* %26, i32 0, i64 %27          ; inst 32
  %29 = getelementptr %Node, %Node* %28, i32 0, i32 11                             ; inst 33
  store i32 %1, i32* %29                                                           ; inst 34
  br label %_7.if.exit.2                                                           ; inst 35
_6.if.else.2:
  br label %_7.if.exit.2                                                           ; inst 36
_7.if.exit.2:
  br label %_15.if.exit.1                                                          ; inst 37
_8.if.else.1:
  %30 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 38
  %31 = sext i32 %1 to i64                                                         ; inst 39
  %32 = getelementptr [2000 x %Node], [2000 x %Node]* %30, i32 0, i64 %31          ; inst 40
  %33 = getelementptr %Node, %Node* %32, i32 0, i32 1                              ; inst 41
  %34 = load i32, i32* %33                                                         ; inst 42
  %35 = icmp sgt i32 %2, %34                                                       ; inst 43
  br i1 %35, label %_9.if.then.3, label %_13.if.else.3                             ; inst 44
_9.if.then.3:
  %36 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 45
  %37 = sext i32 %1 to i64                                                         ; inst 46
  %38 = getelementptr [2000 x %Node], [2000 x %Node]* %36, i32 0, i64 %37          ; inst 47
  %39 = getelementptr %Node, %Node* %38, i32 0, i32 10                             ; inst 48
  %40 = load i32, i32* %39                                                         ; inst 49
  %41 = call i32 @_7GLwwskssmg_insert(%AVLTree* %0, i32 %40, i32 %2, i32 %3)       ; inst 50
  %42 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 51
  %43 = sext i32 %1 to i64                                                         ; inst 52
  %44 = getelementptr [2000 x %Node], [2000 x %Node]* %42, i32 0, i64 %43          ; inst 53
  %45 = getelementptr %Node, %Node* %44, i32 0, i32 10                             ; inst 54
  store i32 %41, i32* %45                                                          ; inst 55
  %46 = icmp ne i32 %41, -1                                                        ; inst 56
  br i1 %46, label %_10.if.then.4, label %_11.if.else.4                            ; inst 57
_10.if.then.4:
  %47 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 58
  %48 = sext i32 %41 to i64                                                        ; inst 59
  %49 = getelementptr [2000 x %Node], [2000 x %Node]* %47, i32 0, i64 %48          ; inst 60
  %50 = getelementptr %Node, %Node* %49, i32 0, i32 11                             ; inst 61
  store i32 %1, i32* %50                                                           ; inst 62
  br label %_12.if.exit.4                                                          ; inst 63
_11.if.else.4:
  br label %_12.if.exit.4                                                          ; inst 64
_12.if.exit.4:
  br label %_14.if.exit.3                                                          ; inst 65
_13.if.else.3:
  %51 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 66
  %52 = sext i32 %1 to i64                                                         ; inst 67
  %53 = getelementptr [2000 x %Node], [2000 x %Node]* %51, i32 0, i64 %52          ; inst 68
  %54 = getelementptr %Node, %Node* %53, i32 0, i32 0                              ; inst 69
  store i32 %3, i32* %54                                                           ; inst 70
  %55 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 71
  %56 = sext i32 %1 to i64                                                         ; inst 72
  %57 = getelementptr [2000 x %Node], [2000 x %Node]* %55, i32 0, i64 %56          ; inst 73
  %58 = getelementptr %Node, %Node* %57, i32 0, i32 5                              ; inst 74
  %59 = load i32, i32* %58                                                         ; inst 75
  %60 = add i32 %59, 1                                                             ; inst 76
  store i32 %60, i32* %58                                                          ; inst 77
  ret i32 %1                                                                       ; inst 78
_14.if.exit.3:
  br label %_15.if.exit.1                                                          ; inst 79
_15.if.exit.1:
  call void @_7GLwwskssmg_update_height(%AVLTree* %0, i32 %1)                      ; inst 80
  %61 = call i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %1)                   ; inst 81
  %62 = icmp sgt i32 %61, 1                                                        ; inst 82
  br i1 %62, label %_16.lazy.then.0, label %_17.lazy.else.0                        ; inst 83
_16.lazy.then.0:
  %63 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 84
  %64 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 85
  %65 = sext i32 %1 to i64                                                         ; inst 86
  %66 = getelementptr [2000 x %Node], [2000 x %Node]* %64, i32 0, i64 %65          ; inst 87
  %67 = getelementptr %Node, %Node* %66, i32 0, i32 9                              ; inst 88
  %68 = load i32, i32* %67                                                         ; inst 89
  %69 = sext i32 %68 to i64                                                        ; inst 90
  %70 = getelementptr [2000 x %Node], [2000 x %Node]* %63, i32 0, i64 %69          ; inst 91
  %71 = getelementptr %Node, %Node* %70, i32 0, i32 1                              ; inst 92
  %72 = load i32, i32* %71                                                         ; inst 93
  %73 = icmp slt i32 %2, %72                                                       ; inst 94
  br label %_18.lazy.exit.0                                                        ; inst 95
_17.lazy.else.0:
  br label %_18.lazy.exit.0                                                        ; inst 96
_18.lazy.exit.0:
  %74 = phi i1 [%73, %_16.lazy.then.0], [0, %_17.lazy.else.0]                      ; inst 97
  br i1 %74, label %_19.if.then.5, label %_20.if.else.5                            ; inst 98
_19.if.then.5:
  %75 = call i32 @_7GLwwskssmg_right_rotate(%AVLTree* %0, i32 %1)                  ; inst 99
  ret i32 %75                                                                      ; inst 100
_20.if.else.5:
  br label %_21.if.exit.5                                                          ; inst 101
_21.if.exit.5:
  %76 = icmp slt i32 %61, -1                                                       ; inst 102
  br i1 %76, label %_22.lazy.then.1, label %_23.lazy.else.1                        ; inst 103
_22.lazy.then.1:
  %77 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 104
  %78 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 105
  %79 = sext i32 %1 to i64                                                         ; inst 106
  %80 = getelementptr [2000 x %Node], [2000 x %Node]* %78, i32 0, i64 %79          ; inst 107
  %81 = getelementptr %Node, %Node* %80, i32 0, i32 10                             ; inst 108
  %82 = load i32, i32* %81                                                         ; inst 109
  %83 = sext i32 %82 to i64                                                        ; inst 110
  %84 = getelementptr [2000 x %Node], [2000 x %Node]* %77, i32 0, i64 %83          ; inst 111
  %85 = getelementptr %Node, %Node* %84, i32 0, i32 1                              ; inst 112
  %86 = load i32, i32* %85                                                         ; inst 113
  %87 = icmp sgt i32 %2, %86                                                       ; inst 114
  br label %_24.lazy.exit.1                                                        ; inst 115
_23.lazy.else.1:
  br label %_24.lazy.exit.1                                                        ; inst 116
_24.lazy.exit.1:
  %88 = phi i1 [%87, %_22.lazy.then.1], [0, %_23.lazy.else.1]                      ; inst 117
  br i1 %88, label %_25.if.then.6, label %_26.if.else.6                            ; inst 118
_25.if.then.6:
  %89 = call i32 @_7GLwwskssmg_left_rotate(%AVLTree* %0, i32 %1)                   ; inst 119
  ret i32 %89                                                                      ; inst 120
_26.if.else.6:
  br label %_27.if.exit.6                                                          ; inst 121
_27.if.exit.6:
  %90 = icmp sgt i32 %61, 1                                                        ; inst 122
  br i1 %90, label %_28.lazy.then.2, label %_29.lazy.else.2                        ; inst 123
_28.lazy.then.2:
  %91 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 124
  %92 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 125
  %93 = sext i32 %1 to i64                                                         ; inst 126
  %94 = getelementptr [2000 x %Node], [2000 x %Node]* %92, i32 0, i64 %93          ; inst 127
  %95 = getelementptr %Node, %Node* %94, i32 0, i32 9                              ; inst 128
  %96 = load i32, i32* %95                                                         ; inst 129
  %97 = sext i32 %96 to i64                                                        ; inst 130
  %98 = getelementptr [2000 x %Node], [2000 x %Node]* %91, i32 0, i64 %97          ; inst 131
  %99 = getelementptr %Node, %Node* %98, i32 0, i32 1                              ; inst 132
  %100 = load i32, i32* %99                                                        ; inst 133
  %101 = icmp sgt i32 %2, %100                                                     ; inst 134
  br label %_30.lazy.exit.2                                                        ; inst 135
_29.lazy.else.2:
  br label %_30.lazy.exit.2                                                        ; inst 136
_30.lazy.exit.2:
  %102 = phi i1 [%101, %_28.lazy.then.2], [0, %_29.lazy.else.2]                    ; inst 137
  br i1 %102, label %_31.if.then.7, label %_35.if.else.7                           ; inst 138
_31.if.then.7:
  %103 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 139
  %104 = sext i32 %1 to i64                                                        ; inst 140
  %105 = getelementptr [2000 x %Node], [2000 x %Node]* %103, i32 0, i64 %104       ; inst 141
  %106 = getelementptr %Node, %Node* %105, i32 0, i32 9                            ; inst 142
  %107 = load i32, i32* %106                                                       ; inst 143
  %108 = call i32 @_7GLwwskssmg_left_rotate(%AVLTree* %0, i32 %107)                ; inst 144
  %109 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 145
  %110 = sext i32 %1 to i64                                                        ; inst 146
  %111 = getelementptr [2000 x %Node], [2000 x %Node]* %109, i32 0, i64 %110       ; inst 147
  %112 = getelementptr %Node, %Node* %111, i32 0, i32 9                            ; inst 148
  store i32 %108, i32* %112                                                        ; inst 149
  %113 = icmp ne i32 %108, -1                                                      ; inst 150
  br i1 %113, label %_32.if.then.8, label %_33.if.else.8                           ; inst 151
_32.if.then.8:
  %114 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 152
  %115 = sext i32 %108 to i64                                                      ; inst 153
  %116 = getelementptr [2000 x %Node], [2000 x %Node]* %114, i32 0, i64 %115       ; inst 154
  %117 = getelementptr %Node, %Node* %116, i32 0, i32 11                           ; inst 155
  store i32 %1, i32* %117                                                          ; inst 156
  br label %_34.if.exit.8                                                          ; inst 157
_33.if.else.8:
  br label %_34.if.exit.8                                                          ; inst 158
_34.if.exit.8:
  %118 = call i32 @_7GLwwskssmg_right_rotate(%AVLTree* %0, i32 %1)                 ; inst 159
  ret i32 %118                                                                     ; inst 160
_35.if.else.7:
  br label %_36.if.exit.7                                                          ; inst 161
_36.if.exit.7:
  %119 = icmp slt i32 %61, -1                                                      ; inst 162
  br i1 %119, label %_37.lazy.then.3, label %_38.lazy.else.3                       ; inst 163
_37.lazy.then.3:
  %120 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 164
  %121 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 165
  %122 = sext i32 %1 to i64                                                        ; inst 166
  %123 = getelementptr [2000 x %Node], [2000 x %Node]* %121, i32 0, i64 %122       ; inst 167
  %124 = getelementptr %Node, %Node* %123, i32 0, i32 10                           ; inst 168
  %125 = load i32, i32* %124                                                       ; inst 169
  %126 = sext i32 %125 to i64                                                      ; inst 170
  %127 = getelementptr [2000 x %Node], [2000 x %Node]* %120, i32 0, i64 %126       ; inst 171
  %128 = getelementptr %Node, %Node* %127, i32 0, i32 1                            ; inst 172
  %129 = load i32, i32* %128                                                       ; inst 173
  %130 = icmp slt i32 %2, %129                                                     ; inst 174
  br label %_39.lazy.exit.3                                                        ; inst 175
_38.lazy.else.3:
  br label %_39.lazy.exit.3                                                        ; inst 176
_39.lazy.exit.3:
  %131 = phi i1 [%130, %_37.lazy.then.3], [0, %_38.lazy.else.3]                    ; inst 177
  br i1 %131, label %_40.if.then.9, label %_44.if.else.9                           ; inst 178
_40.if.then.9:
  %132 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 179
  %133 = sext i32 %1 to i64                                                        ; inst 180
  %134 = getelementptr [2000 x %Node], [2000 x %Node]* %132, i32 0, i64 %133       ; inst 181
  %135 = getelementptr %Node, %Node* %134, i32 0, i32 10                           ; inst 182
  %136 = load i32, i32* %135                                                       ; inst 183
  %137 = call i32 @_7GLwwskssmg_right_rotate(%AVLTree* %0, i32 %136)               ; inst 184
  %138 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 185
  %139 = sext i32 %1 to i64                                                        ; inst 186
  %140 = getelementptr [2000 x %Node], [2000 x %Node]* %138, i32 0, i64 %139       ; inst 187
  %141 = getelementptr %Node, %Node* %140, i32 0, i32 10                           ; inst 188
  store i32 %137, i32* %141                                                        ; inst 189
  %142 = icmp ne i32 %137, -1                                                      ; inst 190
  br i1 %142, label %_41.if.then.10, label %_42.if.else.10                         ; inst 191
_41.if.then.10:
  %143 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 192
  %144 = sext i32 %137 to i64                                                      ; inst 193
  %145 = getelementptr [2000 x %Node], [2000 x %Node]* %143, i32 0, i64 %144       ; inst 194
  %146 = getelementptr %Node, %Node* %145, i32 0, i32 11                           ; inst 195
  store i32 %1, i32* %146                                                          ; inst 196
  br label %_43.if.exit.10                                                         ; inst 197
_42.if.else.10:
  br label %_43.if.exit.10                                                         ; inst 198
_43.if.exit.10:
  %147 = call i32 @_7GLwwskssmg_left_rotate(%AVLTree* %0, i32 %1)                  ; inst 199
  ret i32 %147                                                                     ; inst 200
_44.if.else.9:
  br label %_45.if.exit.9                                                          ; inst 201
_45.if.exit.9:
  ret i32 %1                                                                       ; inst 202
}

define i32 @_7GLwwskssmg_search(%AVLTree* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 9                          ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  %5 = add i32 %4, 1                                                               ; inst 3
  store i32 %5, i32* %3                                                            ; inst 4
  %6 = icmp eq i32 %1, -1                                                          ; inst 5
  br i1 %6, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 6
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 7
_2.lazy.else.0:
  %7 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 8
  %8 = sext i32 %1 to i64                                                          ; inst 9
  %9 = getelementptr [2000 x %Node], [2000 x %Node]* %7, i32 0, i64 %8             ; inst 10
  %10 = getelementptr %Node, %Node* %9, i32 0, i32 1                               ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = icmp eq i32 %11, %2                                                        ; inst 13
  br label %_3.lazy.exit.0                                                         ; inst 14
_3.lazy.exit.0:
  %13 = phi i1 [1, %_1.lazy.then.0], [%12, %_2.lazy.else.0]                        ; inst 15
  br i1 %13, label %_4.if.then.0, label %_5.if.else.0                              ; inst 16
_4.if.then.0:
  ret i32 %1                                                                       ; inst 17
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 18
_6.if.exit.0:
  %14 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 19
  %15 = sext i32 %1 to i64                                                         ; inst 20
  %16 = getelementptr [2000 x %Node], [2000 x %Node]* %14, i32 0, i64 %15          ; inst 21
  %17 = getelementptr %Node, %Node* %16, i32 0, i32 1                              ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = icmp slt i32 %2, %18                                                       ; inst 24
  br i1 %19, label %_7.if.then.1, label %_8.if.else.1                              ; inst 25
_7.if.then.1:
  %20 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 26
  %21 = sext i32 %1 to i64                                                         ; inst 27
  %22 = getelementptr [2000 x %Node], [2000 x %Node]* %20, i32 0, i64 %21          ; inst 28
  %23 = getelementptr %Node, %Node* %22, i32 0, i32 9                              ; inst 29
  %24 = load i32, i32* %23                                                         ; inst 30
  %25 = call i32 @_7GLwwskssmg_search(%AVLTree* %0, i32 %24, i32 %2)               ; inst 31
  ret i32 %25                                                                      ; inst 32
_8.if.else.1:
  %26 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 33
  %27 = sext i32 %1 to i64                                                         ; inst 34
  %28 = getelementptr [2000 x %Node], [2000 x %Node]* %26, i32 0, i64 %27          ; inst 35
  %29 = getelementptr %Node, %Node* %28, i32 0, i32 10                             ; inst 36
  %30 = load i32, i32* %29                                                         ; inst 37
  %31 = call i32 @_7GLwwskssmg_search(%AVLTree* %0, i32 %30, i32 %2)               ; inst 38
  ret i32 %31                                                                      ; inst 39
_9.if.exit.1:
  unreachable                                                                      ; inst 40
}

define i32 @_7GLwwskssmg_find_min(%AVLTree* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 -1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %3 = phi i32 [%1, %_3.if.exit.0], [%14, %_5.while.body.0]                        ; inst 6
  %4 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 7
  %5 = sext i32 %3 to i64                                                          ; inst 8
  %6 = getelementptr [2000 x %Node], [2000 x %Node]* %4, i32 0, i64 %5             ; inst 9
  %7 = getelementptr %Node, %Node* %6, i32 0, i32 9                                ; inst 10
  %8 = load i32, i32* %7                                                           ; inst 11
  %9 = icmp ne i32 %8, -1                                                          ; inst 12
  br i1 %9, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 13
_5.while.body.0:
  %10 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 14
  %11 = sext i32 %3 to i64                                                         ; inst 15
  %12 = getelementptr [2000 x %Node], [2000 x %Node]* %10, i32 0, i64 %11          ; inst 16
  %13 = getelementptr %Node, %Node* %12, i32 0, i32 9                              ; inst 17
  %14 = load i32, i32* %13                                                         ; inst 18
  br label %_4.while.cond.0                                                        ; inst 19
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 20
}

define i32 @_7GLwwskssmg_delete_node(%AVLTree* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 5
  %5 = sext i32 %1 to i64                                                          ; inst 6
  %6 = getelementptr [2000 x %Node], [2000 x %Node]* %4, i32 0, i64 %5             ; inst 7
  %7 = getelementptr %Node, %Node* %6, i32 0, i32 1                                ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp slt i32 %2, %8                                                         ; inst 10
  br i1 %9, label %_4.if.then.1, label %_8.if.else.1                               ; inst 11
_4.if.then.1:
  %10 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 12
  %11 = sext i32 %1 to i64                                                         ; inst 13
  %12 = getelementptr [2000 x %Node], [2000 x %Node]* %10, i32 0, i64 %11          ; inst 14
  %13 = getelementptr %Node, %Node* %12, i32 0, i32 9                              ; inst 15
  %14 = load i32, i32* %13                                                         ; inst 16
  %15 = call i32 @_7GLwwskssmg_delete_node(%AVLTree* %0, i32 %14, i32 %2)          ; inst 17
  %16 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 18
  %17 = sext i32 %1 to i64                                                         ; inst 19
  %18 = getelementptr [2000 x %Node], [2000 x %Node]* %16, i32 0, i64 %17          ; inst 20
  %19 = getelementptr %Node, %Node* %18, i32 0, i32 9                              ; inst 21
  store i32 %15, i32* %19                                                          ; inst 22
  %20 = icmp ne i32 %15, -1                                                        ; inst 23
  br i1 %20, label %_5.if.then.2, label %_6.if.else.2                              ; inst 24
_5.if.then.2:
  %21 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 25
  %22 = sext i32 %15 to i64                                                        ; inst 26
  %23 = getelementptr [2000 x %Node], [2000 x %Node]* %21, i32 0, i64 %22          ; inst 27
  %24 = getelementptr %Node, %Node* %23, i32 0, i32 11                             ; inst 28
  store i32 %1, i32* %24                                                           ; inst 29
  br label %_7.if.exit.2                                                           ; inst 30
_6.if.else.2:
  br label %_7.if.exit.2                                                           ; inst 31
_7.if.exit.2:
  br label %_27.if.exit.1                                                          ; inst 32
_8.if.else.1:
  %25 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 33
  %26 = sext i32 %1 to i64                                                         ; inst 34
  %27 = getelementptr [2000 x %Node], [2000 x %Node]* %25, i32 0, i64 %26          ; inst 35
  %28 = getelementptr %Node, %Node* %27, i32 0, i32 1                              ; inst 36
  %29 = load i32, i32* %28                                                         ; inst 37
  %30 = icmp sgt i32 %2, %29                                                       ; inst 38
  br i1 %30, label %_9.if.then.3, label %_13.if.else.3                             ; inst 39
_9.if.then.3:
  %31 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 40
  %32 = sext i32 %1 to i64                                                         ; inst 41
  %33 = getelementptr [2000 x %Node], [2000 x %Node]* %31, i32 0, i64 %32          ; inst 42
  %34 = getelementptr %Node, %Node* %33, i32 0, i32 10                             ; inst 43
  %35 = load i32, i32* %34                                                         ; inst 44
  %36 = call i32 @_7GLwwskssmg_delete_node(%AVLTree* %0, i32 %35, i32 %2)          ; inst 45
  %37 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 46
  %38 = sext i32 %1 to i64                                                         ; inst 47
  %39 = getelementptr [2000 x %Node], [2000 x %Node]* %37, i32 0, i64 %38          ; inst 48
  %40 = getelementptr %Node, %Node* %39, i32 0, i32 10                             ; inst 49
  store i32 %36, i32* %40                                                          ; inst 50
  %41 = icmp ne i32 %36, -1                                                        ; inst 51
  br i1 %41, label %_10.if.then.4, label %_11.if.else.4                            ; inst 52
_10.if.then.4:
  %42 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 53
  %43 = sext i32 %36 to i64                                                        ; inst 54
  %44 = getelementptr [2000 x %Node], [2000 x %Node]* %42, i32 0, i64 %43          ; inst 55
  %45 = getelementptr %Node, %Node* %44, i32 0, i32 11                             ; inst 56
  store i32 %1, i32* %45                                                           ; inst 57
  br label %_12.if.exit.4                                                          ; inst 58
_11.if.else.4:
  br label %_12.if.exit.4                                                          ; inst 59
_12.if.exit.4:
  br label %_26.if.exit.3                                                          ; inst 60
_13.if.else.3:
  %46 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 61
  %47 = sext i32 %1 to i64                                                         ; inst 62
  %48 = getelementptr [2000 x %Node], [2000 x %Node]* %46, i32 0, i64 %47          ; inst 63
  %49 = getelementptr %Node, %Node* %48, i32 0, i32 5                              ; inst 64
  %50 = load i32, i32* %49                                                         ; inst 65
  %51 = icmp sgt i32 %50, 1                                                        ; inst 66
  br i1 %51, label %_14.if.then.5, label %_15.if.else.5                            ; inst 67
_14.if.then.5:
  %52 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 68
  %53 = sext i32 %1 to i64                                                         ; inst 69
  %54 = getelementptr [2000 x %Node], [2000 x %Node]* %52, i32 0, i64 %53          ; inst 70
  %55 = getelementptr %Node, %Node* %54, i32 0, i32 5                              ; inst 71
  %56 = load i32, i32* %55                                                         ; inst 72
  %57 = sub i32 %56, 1                                                             ; inst 73
  store i32 %57, i32* %55                                                          ; inst 74
  ret i32 %1                                                                       ; inst 75
_15.if.else.5:
  br label %_16.if.exit.5                                                          ; inst 76
_16.if.exit.5:
  %58 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 77
  %59 = sext i32 %1 to i64                                                         ; inst 78
  %60 = getelementptr [2000 x %Node], [2000 x %Node]* %58, i32 0, i64 %59          ; inst 79
  %61 = getelementptr %Node, %Node* %60, i32 0, i32 9                              ; inst 80
  %62 = load i32, i32* %61                                                         ; inst 81
  %63 = icmp eq i32 %62, -1                                                        ; inst 82
  br i1 %63, label %_17.if.then.6, label %_18.if.else.6                            ; inst 83
_17.if.then.6:
  %64 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 84
  %65 = sext i32 %1 to i64                                                         ; inst 85
  %66 = getelementptr [2000 x %Node], [2000 x %Node]* %64, i32 0, i64 %65          ; inst 86
  %67 = getelementptr %Node, %Node* %66, i32 0, i32 10                             ; inst 87
  %68 = load i32, i32* %67                                                         ; inst 88
  call void @_7GLwwskssmg_deallocate_node(%AVLTree* %0, i32 %1)                    ; inst 89
  %69 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 7                         ; inst 90
  %70 = load i32, i32* %69                                                         ; inst 91
  %71 = add i32 %70, 1                                                             ; inst 92
  store i32 %71, i32* %69                                                          ; inst 93
  ret i32 %68                                                                      ; inst 94
_18.if.else.6:
  %72 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 95
  %73 = sext i32 %1 to i64                                                         ; inst 96
  %74 = getelementptr [2000 x %Node], [2000 x %Node]* %72, i32 0, i64 %73          ; inst 97
  %75 = getelementptr %Node, %Node* %74, i32 0, i32 10                             ; inst 98
  %76 = load i32, i32* %75                                                         ; inst 99
  %77 = icmp eq i32 %76, -1                                                        ; inst 100
  br i1 %77, label %_19.if.then.7, label %_20.if.else.7                            ; inst 101
_19.if.then.7:
  %78 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 102
  %79 = sext i32 %1 to i64                                                         ; inst 103
  %80 = getelementptr [2000 x %Node], [2000 x %Node]* %78, i32 0, i64 %79          ; inst 104
  %81 = getelementptr %Node, %Node* %80, i32 0, i32 9                              ; inst 105
  %82 = load i32, i32* %81                                                         ; inst 106
  call void @_7GLwwskssmg_deallocate_node(%AVLTree* %0, i32 %1)                    ; inst 107
  %83 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 7                         ; inst 108
  %84 = load i32, i32* %83                                                         ; inst 109
  %85 = add i32 %84, 1                                                             ; inst 110
  store i32 %85, i32* %83                                                          ; inst 111
  ret i32 %82                                                                      ; inst 112
_20.if.else.7:
  br label %_21.if.exit.7                                                          ; inst 113
_21.if.exit.7:
  br label %_22.if.exit.6                                                          ; inst 114
_22.if.exit.6:
  %86 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 115
  %87 = sext i32 %1 to i64                                                         ; inst 116
  %88 = getelementptr [2000 x %Node], [2000 x %Node]* %86, i32 0, i64 %87          ; inst 117
  %89 = getelementptr %Node, %Node* %88, i32 0, i32 10                             ; inst 118
  %90 = load i32, i32* %89                                                         ; inst 119
  %91 = call i32 @_7GLwwskssmg_find_min(%AVLTree* %0, i32 %90)                     ; inst 120
  %92 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 121
  %93 = sext i32 %1 to i64                                                         ; inst 122
  %94 = getelementptr [2000 x %Node], [2000 x %Node]* %92, i32 0, i64 %93          ; inst 123
  %95 = getelementptr %Node, %Node* %94, i32 0, i32 1                              ; inst 124
  %96 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 125
  %97 = sext i32 %91 to i64                                                        ; inst 126
  %98 = getelementptr [2000 x %Node], [2000 x %Node]* %96, i32 0, i64 %97          ; inst 127
  %99 = getelementptr %Node, %Node* %98, i32 0, i32 1                              ; inst 128
  %100 = load i32, i32* %99                                                        ; inst 129
  store i32 %100, i32* %95                                                         ; inst 130
  %101 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 131
  %102 = sext i32 %1 to i64                                                        ; inst 132
  %103 = getelementptr [2000 x %Node], [2000 x %Node]* %101, i32 0, i64 %102       ; inst 133
  %104 = getelementptr %Node, %Node* %103, i32 0, i32 0                            ; inst 134
  %105 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 135
  %106 = sext i32 %91 to i64                                                       ; inst 136
  %107 = getelementptr [2000 x %Node], [2000 x %Node]* %105, i32 0, i64 %106       ; inst 137
  %108 = getelementptr %Node, %Node* %107, i32 0, i32 0                            ; inst 138
  %109 = load i32, i32* %108                                                       ; inst 139
  store i32 %109, i32* %104                                                        ; inst 140
  %110 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 141
  %111 = sext i32 %1 to i64                                                        ; inst 142
  %112 = getelementptr [2000 x %Node], [2000 x %Node]* %110, i32 0, i64 %111       ; inst 143
  %113 = getelementptr %Node, %Node* %112, i32 0, i32 5                            ; inst 144
  %114 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 145
  %115 = sext i32 %91 to i64                                                       ; inst 146
  %116 = getelementptr [2000 x %Node], [2000 x %Node]* %114, i32 0, i64 %115       ; inst 147
  %117 = getelementptr %Node, %Node* %116, i32 0, i32 5                            ; inst 148
  %118 = load i32, i32* %117                                                       ; inst 149
  store i32 %118, i32* %113                                                        ; inst 150
  %119 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 151
  %120 = sext i32 %1 to i64                                                        ; inst 152
  %121 = getelementptr [2000 x %Node], [2000 x %Node]* %119, i32 0, i64 %120       ; inst 153
  %122 = getelementptr %Node, %Node* %121, i32 0, i32 10                           ; inst 154
  %123 = load i32, i32* %122                                                       ; inst 155
  %124 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 156
  %125 = sext i32 %91 to i64                                                       ; inst 157
  %126 = getelementptr [2000 x %Node], [2000 x %Node]* %124, i32 0, i64 %125       ; inst 158
  %127 = getelementptr %Node, %Node* %126, i32 0, i32 1                            ; inst 159
  %128 = load i32, i32* %127                                                       ; inst 160
  %129 = call i32 @_7GLwwskssmg_delete_node(%AVLTree* %0, i32 %123, i32 %128)      ; inst 161
  %130 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 162
  %131 = sext i32 %1 to i64                                                        ; inst 163
  %132 = getelementptr [2000 x %Node], [2000 x %Node]* %130, i32 0, i64 %131       ; inst 164
  %133 = getelementptr %Node, %Node* %132, i32 0, i32 10                           ; inst 165
  store i32 %129, i32* %133                                                        ; inst 166
  %134 = icmp ne i32 %129, -1                                                      ; inst 167
  br i1 %134, label %_23.if.then.8, label %_24.if.else.8                           ; inst 168
_23.if.then.8:
  %135 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 169
  %136 = sext i32 %129 to i64                                                      ; inst 170
  %137 = getelementptr [2000 x %Node], [2000 x %Node]* %135, i32 0, i64 %136       ; inst 171
  %138 = getelementptr %Node, %Node* %137, i32 0, i32 11                           ; inst 172
  store i32 %1, i32* %138                                                          ; inst 173
  br label %_25.if.exit.8                                                          ; inst 174
_24.if.else.8:
  br label %_25.if.exit.8                                                          ; inst 175
_25.if.exit.8:
  br label %_26.if.exit.3                                                          ; inst 176
_26.if.exit.3:
  br label %_27.if.exit.1                                                          ; inst 177
_27.if.exit.1:
  call void @_7GLwwskssmg_update_height(%AVLTree* %0, i32 %1)                      ; inst 178
  %139 = call i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %1)                  ; inst 179
  %140 = icmp sgt i32 %139, 1                                                      ; inst 180
  br i1 %140, label %_28.lazy.then.0, label %_29.lazy.else.0                       ; inst 181
_28.lazy.then.0:
  %141 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 182
  %142 = sext i32 %1 to i64                                                        ; inst 183
  %143 = getelementptr [2000 x %Node], [2000 x %Node]* %141, i32 0, i64 %142       ; inst 184
  %144 = getelementptr %Node, %Node* %143, i32 0, i32 9                            ; inst 185
  %145 = load i32, i32* %144                                                       ; inst 186
  %146 = call i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %145)                ; inst 187
  %147 = icmp sge i32 %146, 0                                                      ; inst 188
  br label %_30.lazy.exit.0                                                        ; inst 189
_29.lazy.else.0:
  br label %_30.lazy.exit.0                                                        ; inst 190
_30.lazy.exit.0:
  %148 = phi i1 [%147, %_28.lazy.then.0], [0, %_29.lazy.else.0]                    ; inst 191
  br i1 %148, label %_31.if.then.9, label %_32.if.else.9                           ; inst 192
_31.if.then.9:
  %149 = call i32 @_7GLwwskssmg_right_rotate(%AVLTree* %0, i32 %1)                 ; inst 193
  ret i32 %149                                                                     ; inst 194
_32.if.else.9:
  br label %_33.if.exit.9                                                          ; inst 195
_33.if.exit.9:
  %150 = icmp sgt i32 %139, 1                                                      ; inst 196
  br i1 %150, label %_34.lazy.then.1, label %_35.lazy.else.1                       ; inst 197
_34.lazy.then.1:
  %151 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 198
  %152 = sext i32 %1 to i64                                                        ; inst 199
  %153 = getelementptr [2000 x %Node], [2000 x %Node]* %151, i32 0, i64 %152       ; inst 200
  %154 = getelementptr %Node, %Node* %153, i32 0, i32 9                            ; inst 201
  %155 = load i32, i32* %154                                                       ; inst 202
  %156 = call i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %155)                ; inst 203
  %157 = icmp slt i32 %156, 0                                                      ; inst 204
  br label %_36.lazy.exit.1                                                        ; inst 205
_35.lazy.else.1:
  br label %_36.lazy.exit.1                                                        ; inst 206
_36.lazy.exit.1:
  %158 = phi i1 [%157, %_34.lazy.then.1], [0, %_35.lazy.else.1]                    ; inst 207
  br i1 %158, label %_37.if.then.10, label %_41.if.else.10                         ; inst 208
_37.if.then.10:
  %159 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 209
  %160 = sext i32 %1 to i64                                                        ; inst 210
  %161 = getelementptr [2000 x %Node], [2000 x %Node]* %159, i32 0, i64 %160       ; inst 211
  %162 = getelementptr %Node, %Node* %161, i32 0, i32 9                            ; inst 212
  %163 = load i32, i32* %162                                                       ; inst 213
  %164 = call i32 @_7GLwwskssmg_left_rotate(%AVLTree* %0, i32 %163)                ; inst 214
  %165 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 215
  %166 = sext i32 %1 to i64                                                        ; inst 216
  %167 = getelementptr [2000 x %Node], [2000 x %Node]* %165, i32 0, i64 %166       ; inst 217
  %168 = getelementptr %Node, %Node* %167, i32 0, i32 9                            ; inst 218
  store i32 %164, i32* %168                                                        ; inst 219
  %169 = icmp ne i32 %164, -1                                                      ; inst 220
  br i1 %169, label %_38.if.then.11, label %_39.if.else.11                         ; inst 221
_38.if.then.11:
  %170 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 222
  %171 = sext i32 %164 to i64                                                      ; inst 223
  %172 = getelementptr [2000 x %Node], [2000 x %Node]* %170, i32 0, i64 %171       ; inst 224
  %173 = getelementptr %Node, %Node* %172, i32 0, i32 11                           ; inst 225
  store i32 %1, i32* %173                                                          ; inst 226
  br label %_40.if.exit.11                                                         ; inst 227
_39.if.else.11:
  br label %_40.if.exit.11                                                         ; inst 228
_40.if.exit.11:
  %174 = call i32 @_7GLwwskssmg_right_rotate(%AVLTree* %0, i32 %1)                 ; inst 229
  ret i32 %174                                                                     ; inst 230
_41.if.else.10:
  br label %_42.if.exit.10                                                         ; inst 231
_42.if.exit.10:
  %175 = icmp slt i32 %139, -1                                                     ; inst 232
  br i1 %175, label %_43.lazy.then.2, label %_44.lazy.else.2                       ; inst 233
_43.lazy.then.2:
  %176 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 234
  %177 = sext i32 %1 to i64                                                        ; inst 235
  %178 = getelementptr [2000 x %Node], [2000 x %Node]* %176, i32 0, i64 %177       ; inst 236
  %179 = getelementptr %Node, %Node* %178, i32 0, i32 10                           ; inst 237
  %180 = load i32, i32* %179                                                       ; inst 238
  %181 = call i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %180)                ; inst 239
  %182 = icmp sle i32 %181, 0                                                      ; inst 240
  br label %_45.lazy.exit.2                                                        ; inst 241
_44.lazy.else.2:
  br label %_45.lazy.exit.2                                                        ; inst 242
_45.lazy.exit.2:
  %183 = phi i1 [%182, %_43.lazy.then.2], [0, %_44.lazy.else.2]                    ; inst 243
  br i1 %183, label %_46.if.then.12, label %_47.if.else.12                         ; inst 244
_46.if.then.12:
  %184 = call i32 @_7GLwwskssmg_left_rotate(%AVLTree* %0, i32 %1)                  ; inst 245
  ret i32 %184                                                                     ; inst 246
_47.if.else.12:
  br label %_48.if.exit.12                                                         ; inst 247
_48.if.exit.12:
  %185 = icmp slt i32 %139, -1                                                     ; inst 248
  br i1 %185, label %_49.lazy.then.3, label %_50.lazy.else.3                       ; inst 249
_49.lazy.then.3:
  %186 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 250
  %187 = sext i32 %1 to i64                                                        ; inst 251
  %188 = getelementptr [2000 x %Node], [2000 x %Node]* %186, i32 0, i64 %187       ; inst 252
  %189 = getelementptr %Node, %Node* %188, i32 0, i32 10                           ; inst 253
  %190 = load i32, i32* %189                                                       ; inst 254
  %191 = call i32 @_7GLwwskssmg_get_balance(%AVLTree* %0, i32 %190)                ; inst 255
  %192 = icmp sgt i32 %191, 0                                                      ; inst 256
  br label %_51.lazy.exit.3                                                        ; inst 257
_50.lazy.else.3:
  br label %_51.lazy.exit.3                                                        ; inst 258
_51.lazy.exit.3:
  %193 = phi i1 [%192, %_49.lazy.then.3], [0, %_50.lazy.else.3]                    ; inst 259
  br i1 %193, label %_52.if.then.13, label %_56.if.else.13                         ; inst 260
_52.if.then.13:
  %194 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 261
  %195 = sext i32 %1 to i64                                                        ; inst 262
  %196 = getelementptr [2000 x %Node], [2000 x %Node]* %194, i32 0, i64 %195       ; inst 263
  %197 = getelementptr %Node, %Node* %196, i32 0, i32 10                           ; inst 264
  %198 = load i32, i32* %197                                                       ; inst 265
  %199 = call i32 @_7GLwwskssmg_right_rotate(%AVLTree* %0, i32 %198)               ; inst 266
  %200 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 267
  %201 = sext i32 %1 to i64                                                        ; inst 268
  %202 = getelementptr [2000 x %Node], [2000 x %Node]* %200, i32 0, i64 %201       ; inst 269
  %203 = getelementptr %Node, %Node* %202, i32 0, i32 10                           ; inst 270
  store i32 %199, i32* %203                                                        ; inst 271
  %204 = icmp ne i32 %199, -1                                                      ; inst 272
  br i1 %204, label %_53.if.then.14, label %_54.if.else.14                         ; inst 273
_53.if.then.14:
  %205 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                        ; inst 274
  %206 = sext i32 %199 to i64                                                      ; inst 275
  %207 = getelementptr [2000 x %Node], [2000 x %Node]* %205, i32 0, i64 %206       ; inst 276
  %208 = getelementptr %Node, %Node* %207, i32 0, i32 11                           ; inst 277
  store i32 %1, i32* %208                                                          ; inst 278
  br label %_55.if.exit.14                                                         ; inst 279
_54.if.else.14:
  br label %_55.if.exit.14                                                         ; inst 280
_55.if.exit.14:
  %209 = call i32 @_7GLwwskssmg_left_rotate(%AVLTree* %0, i32 %1)                  ; inst 281
  ret i32 %209                                                                     ; inst 282
_56.if.else.13:
  br label %_57.if.exit.13                                                         ; inst 283
_57.if.exit.13:
  ret i32 %1                                                                       ; inst 284
}

define void @_7GLwwskssmg_inorder_traversal(%AVLTree* %0, i32 %1, [1000 x i32]* %2, i32* %3) {
_0.entry.0:
  %4 = icmp ne i32 %1, -1                                                          ; inst 1
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  %5 = load i32, i32* %3                                                           ; inst 3
  %6 = icmp slt i32 %5, 1000                                                       ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 6
_3.lazy.exit.0:
  %7 = phi i1 [%6, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 7
  br i1 %7, label %_4.if.then.0, label %_5.if.else.0                               ; inst 8
_4.if.then.0:
  %8 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                          ; inst 9
  %9 = sext i32 %1 to i64                                                          ; inst 10
  %10 = getelementptr [2000 x %Node], [2000 x %Node]* %8, i32 0, i64 %9            ; inst 11
  %11 = getelementptr %Node, %Node* %10, i32 0, i32 9                              ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  call void @_7GLwwskssmg_inorder_traversal(%AVLTree* %0, i32 %12, [1000 x i32]* %2, i32* %3) ; inst 14
  %13 = load i32, i32* %3                                                          ; inst 15
  %14 = sext i32 %13 to i64                                                        ; inst 16
  %15 = getelementptr [1000 x i32], [1000 x i32]* %2, i32 0, i64 %14               ; inst 17
  %16 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 18
  %17 = sext i32 %1 to i64                                                         ; inst 19
  %18 = getelementptr [2000 x %Node], [2000 x %Node]* %16, i32 0, i64 %17          ; inst 20
  %19 = getelementptr %Node, %Node* %18, i32 0, i32 0                              ; inst 21
  %20 = load i32, i32* %19                                                         ; inst 22
  store i32 %20, i32* %15                                                          ; inst 23
  %21 = load i32, i32* %3                                                          ; inst 24
  %22 = add i32 %21, 1                                                             ; inst 25
  store i32 %22, i32* %3                                                           ; inst 26
  %23 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 27
  %24 = sext i32 %1 to i64                                                         ; inst 28
  %25 = getelementptr [2000 x %Node], [2000 x %Node]* %23, i32 0, i64 %24          ; inst 29
  %26 = getelementptr %Node, %Node* %25, i32 0, i32 10                             ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  call void @_7GLwwskssmg_inorder_traversal(%AVLTree* %0, i32 %27, [1000 x i32]* %2, i32* %3) ; inst 32
  br label %_6.if.exit.0                                                           ; inst 33
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 34
_6.if.exit.0:
  ret void                                                                         ; inst 35
}

define void @_83laIxrrFTG_new(%HashTable* sret(%HashTable) %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                      ; inst 1
  %3 = alloca [20 x i32]                                                           ; inst 2
  %4 = getelementptr [20 x i32], [20 x i32]* %3, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 5
  %6 = icmp slt i32 %5, 20                                                         ; inst 6
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 8
  store i32 0, i32* %7                                                             ; inst 9
  %8 = add i32 %5, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %9 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %2, i32 0, i32 0    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %10 = phi i32 [0, %_3.array.exit.0], [%13, %_5.array.body.1]                     ; inst 14
  %11 = icmp slt i32 %10, 1000                                                     ; inst 15
  br i1 %11, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %12 = getelementptr [20 x i32], [20 x i32]* %9, i32 %10                          ; inst 17
  call void @memcpy([20 x i32]* %12, [20 x i32]* %3, i64 80)                       ; inst 18
  %13 = add i32 %10, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %14 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 21
  %15 = getelementptr [1000 x i32], [1000 x i32]* %14, i32 0, i32 0                ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 24
  %17 = icmp slt i32 %16, 1000                                                     ; inst 25
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 27
  store i32 0, i32* %18                                                            ; inst 28
  %19 = add i32 %16, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  %20 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 31
  %21 = alloca [20 x i32]                                                          ; inst 32
  %22 = getelementptr [20 x i32], [20 x i32]* %21, i32 0, i32 0                    ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %23 = phi i32 [0, %_9.array.exit.2], [%26, %_11.array.body.3]                    ; inst 35
  %24 = icmp slt i32 %23, 20                                                       ; inst 36
  br i1 %24, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 38
  store i32 0, i32* %25                                                            ; inst 39
  %26 = add i32 %23, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %27 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %20, i32 0, i32 0  ; inst 42
  br label %_13.array.cond.4                                                       ; inst 43
_13.array.cond.4:
  %28 = phi i32 [0, %_12.array.exit.3], [%31, %_14.array.body.4]                   ; inst 44
  %29 = icmp slt i32 %28, 1000                                                     ; inst 45
  br i1 %29, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 46
_14.array.body.4:
  %30 = getelementptr [20 x i32], [20 x i32]* %27, i32 %28                         ; inst 47
  call void @memcpy([20 x i32]* %30, [20 x i32]* %21, i64 80)                      ; inst 48
  %31 = add i32 %28, 1                                                             ; inst 49
  br label %_13.array.cond.4                                                       ; inst 50
_15.array.exit.4:
  %32 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 51
  store i32 %1, i32* %32                                                           ; inst 52
  %33 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 4                     ; inst 53
  store i32 0, i32* %33                                                            ; inst 54
  %34 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 5                     ; inst 55
  store i32 0, i32* %34                                                            ; inst 56
  %35 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 6                     ; inst 57
  store i32 0, i32* %35                                                            ; inst 58
  %36 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 7                     ; inst 59
  store i32 31, i32* %36                                                           ; inst 60
  %37 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 8                     ; inst 61
  store i32 17, i32* %37                                                           ; inst 62
  %38 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 9                     ; inst 63
  store i32 1000003, i32* %38                                                      ; inst 64
  ret void                                                                         ; inst 65
}

define i32 @_83laIxrrFTG_hash_function(%HashTable* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 7                      ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = mul i32 %3, %1                                                              ; inst 3
  %5 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 8                      ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  %7 = add i32 %4, %6                                                              ; inst 6
  %8 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 9                      ; inst 7
  %9 = load i32, i32* %8                                                           ; inst 8
  %10 = srem i32 %7, %9                                                            ; inst 9
  %11 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 10
  %12 = load i32, i32* %11                                                         ; inst 11
  %13 = srem i32 %10, %12                                                          ; inst 12
  %14 = icmp slt i32 %13, 0                                                        ; inst 13
  br i1 %14, label %_1.if.then.0, label %_2.if.else.0                              ; inst 14
_1.if.then.0:
  %15 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 15
  %16 = load i32, i32* %15                                                         ; inst 16
  %17 = add i32 %13, %16                                                           ; inst 17
  ret i32 %17                                                                      ; inst 18
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 19
_3.if.exit.0:
  ret i32 %13                                                                      ; inst 20
}

define void @_83laIxrrFTG_insert(%HashTable* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @_83laIxrrFTG_hash_function(%HashTable* %0, i32 %1)                ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%22, %_5.if.exit.0]                              ; inst 3
  %5 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                      ; inst 4
  %6 = sext i32 %3 to i64                                                          ; inst 5
  %7 = getelementptr [1000 x i32], [1000 x i32]* %5, i32 0, i64 %6                 ; inst 6
  %8 = load i32, i32* %7                                                           ; inst 7
  %9 = icmp slt i32 %4, %8                                                         ; inst 8
  br i1 %9, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 9
_2.while.body.0:
  %10 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 10
  %11 = sext i32 %3 to i64                                                         ; inst 11
  %12 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %10, i32 0, i64 %11 ; inst 12
  %13 = sext i32 %4 to i64                                                         ; inst 13
  %14 = getelementptr [20 x i32], [20 x i32]* %12, i32 0, i64 %13                  ; inst 14
  %15 = load i32, i32* %14                                                         ; inst 15
  %16 = icmp eq i32 %15, %1                                                        ; inst 16
  br i1 %16, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  %17 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 18
  %18 = sext i32 %3 to i64                                                         ; inst 19
  %19 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %17, i32 0, i64 %18 ; inst 20
  %20 = sext i32 %4 to i64                                                         ; inst 21
  %21 = getelementptr [20 x i32], [20 x i32]* %19, i32 0, i64 %20                  ; inst 22
  store i32 %2, i32* %21                                                           ; inst 23
  ret void                                                                         ; inst 24
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 25
_5.if.exit.0:
  %22 = add i32 %4, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_6.while.exit.0:
  %23 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 28
  %24 = sext i32 %3 to i64                                                         ; inst 29
  %25 = getelementptr [1000 x i32], [1000 x i32]* %23, i32 0, i64 %24              ; inst 30
  %26 = load i32, i32* %25                                                         ; inst 31
  %27 = icmp slt i32 %26, 20                                                       ; inst 32
  br i1 %27, label %_7.if.then.1, label %_14.if.else.1                             ; inst 33
_7.if.then.1:
  %28 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 34
  %29 = sext i32 %3 to i64                                                         ; inst 35
  %30 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %28, i32 0, i64 %29 ; inst 36
  %31 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 37
  %32 = sext i32 %3 to i64                                                         ; inst 38
  %33 = getelementptr [1000 x i32], [1000 x i32]* %31, i32 0, i64 %32              ; inst 39
  %34 = load i32, i32* %33                                                         ; inst 40
  %35 = sext i32 %34 to i64                                                        ; inst 41
  %36 = getelementptr [20 x i32], [20 x i32]* %30, i32 0, i64 %35                  ; inst 42
  store i32 %1, i32* %36                                                           ; inst 43
  %37 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 44
  %38 = sext i32 %3 to i64                                                         ; inst 45
  %39 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %37, i32 0, i64 %38 ; inst 46
  %40 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 47
  %41 = sext i32 %3 to i64                                                         ; inst 48
  %42 = getelementptr [1000 x i32], [1000 x i32]* %40, i32 0, i64 %41              ; inst 49
  %43 = load i32, i32* %42                                                         ; inst 50
  %44 = sext i32 %43 to i64                                                        ; inst 51
  %45 = getelementptr [20 x i32], [20 x i32]* %39, i32 0, i64 %44                  ; inst 52
  store i32 %2, i32* %45                                                           ; inst 53
  %46 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 54
  %47 = sext i32 %3 to i64                                                         ; inst 55
  %48 = getelementptr [1000 x i32], [1000 x i32]* %46, i32 0, i64 %47              ; inst 56
  %49 = load i32, i32* %48                                                         ; inst 57
  %50 = add i32 %49, 1                                                             ; inst 58
  store i32 %50, i32* %48                                                          ; inst 59
  %51 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 4                     ; inst 60
  %52 = load i32, i32* %51                                                         ; inst 61
  %53 = add i32 %52, 1                                                             ; inst 62
  store i32 %53, i32* %51                                                          ; inst 63
  %54 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 64
  %55 = sext i32 %3 to i64                                                         ; inst 65
  %56 = getelementptr [1000 x i32], [1000 x i32]* %54, i32 0, i64 %55              ; inst 66
  %57 = load i32, i32* %56                                                         ; inst 67
  %58 = icmp sgt i32 %57, 1                                                        ; inst 68
  br i1 %58, label %_8.if.then.2, label %_9.if.else.2                              ; inst 69
_8.if.then.2:
  %59 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 5                     ; inst 70
  %60 = load i32, i32* %59                                                         ; inst 71
  %61 = add i32 %60, 1                                                             ; inst 72
  store i32 %61, i32* %59                                                          ; inst 73
  br label %_10.if.exit.2                                                          ; inst 74
_9.if.else.2:
  br label %_10.if.exit.2                                                          ; inst 75
_10.if.exit.2:
  %62 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 4                     ; inst 76
  %63 = load i32, i32* %62                                                         ; inst 77
  %64 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 78
  %65 = load i32, i32* %64                                                         ; inst 79
  %66 = mul i32 %65, 3                                                             ; inst 80
  %67 = sdiv i32 %66, 4                                                            ; inst 81
  %68 = icmp sgt i32 %63, %67                                                      ; inst 82
  br i1 %68, label %_11.if.then.3, label %_12.if.else.3                            ; inst 83
_11.if.then.3:
  call void @_83laIxrrFTG_resize(%HashTable* %0)                                   ; inst 84
  br label %_13.if.exit.3                                                          ; inst 85
_12.if.else.3:
  br label %_13.if.exit.3                                                          ; inst 86
_13.if.exit.3:
  br label %_15.if.exit.1                                                          ; inst 87
_14.if.else.1:
  br label %_15.if.exit.1                                                          ; inst 88
_15.if.exit.1:
  ret void                                                                         ; inst 89
}

define i32 @_83laIxrrFTG_search(%HashTable* %0, i32 %1) {
_0.entry.0:
  %2 = call i32 @_83laIxrrFTG_hash_function(%HashTable* %0, i32 %1)                ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%22, %_5.if.exit.0]                              ; inst 3
  %4 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                      ; inst 4
  %5 = sext i32 %2 to i64                                                          ; inst 5
  %6 = getelementptr [1000 x i32], [1000 x i32]* %4, i32 0, i64 %5                 ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = icmp slt i32 %3, %7                                                         ; inst 8
  br i1 %8, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 9
_2.while.body.0:
  %9 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                      ; inst 10
  %10 = sext i32 %2 to i64                                                         ; inst 11
  %11 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %9, i32 0, i64 %10 ; inst 12
  %12 = sext i32 %3 to i64                                                         ; inst 13
  %13 = getelementptr [20 x i32], [20 x i32]* %11, i32 0, i64 %12                  ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = icmp eq i32 %14, %1                                                        ; inst 16
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  %16 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 18
  %17 = sext i32 %2 to i64                                                         ; inst 19
  %18 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %16, i32 0, i64 %17 ; inst 20
  %19 = sext i32 %3 to i64                                                         ; inst 21
  %20 = getelementptr [20 x i32], [20 x i32]* %18, i32 0, i64 %19                  ; inst 22
  %21 = load i32, i32* %20                                                         ; inst 23
  ret i32 %21                                                                      ; inst 24
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 25
_5.if.exit.0:
  %22 = add i32 %3, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_6.while.exit.0:
  ret i32 -1                                                                       ; inst 28
}

define i1 @_83laIxrrFTG_delete(%HashTable* %0, i32 %1) {
_0.entry.0:
  %2 = call i32 @_83laIxrrFTG_hash_function(%HashTable* %0, i32 %1)                ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%56, %_8.if.exit.0]                              ; inst 3
  %4 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                      ; inst 4
  %5 = sext i32 %2 to i64                                                          ; inst 5
  %6 = getelementptr [1000 x i32], [1000 x i32]* %4, i32 0, i64 %5                 ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = icmp slt i32 %3, %7                                                         ; inst 8
  br i1 %8, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 9
_2.while.body.0:
  %9 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                      ; inst 10
  %10 = sext i32 %2 to i64                                                         ; inst 11
  %11 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %9, i32 0, i64 %10 ; inst 12
  %12 = sext i32 %3 to i64                                                         ; inst 13
  %13 = getelementptr [20 x i32], [20 x i32]* %11, i32 0, i64 %12                  ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = icmp eq i32 %14, %1                                                        ; inst 16
  br i1 %15, label %_3.if.then.0, label %_7.if.else.0                              ; inst 17
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 18
_4.while.cond.1:
  %16 = phi i32 [%3, %_3.if.then.0], [%47, %_5.while.body.1]                       ; inst 19
  %17 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 20
  %18 = sext i32 %2 to i64                                                         ; inst 21
  %19 = getelementptr [1000 x i32], [1000 x i32]* %17, i32 0, i64 %18              ; inst 22
  %20 = load i32, i32* %19                                                         ; inst 23
  %21 = sub i32 %20, 1                                                             ; inst 24
  %22 = icmp slt i32 %16, %21                                                      ; inst 25
  br i1 %22, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 26
_5.while.body.1:
  %23 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 27
  %24 = sext i32 %2 to i64                                                         ; inst 28
  %25 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %23, i32 0, i64 %24 ; inst 29
  %26 = sext i32 %16 to i64                                                        ; inst 30
  %27 = getelementptr [20 x i32], [20 x i32]* %25, i32 0, i64 %26                  ; inst 31
  %28 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 32
  %29 = sext i32 %2 to i64                                                         ; inst 33
  %30 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %28, i32 0, i64 %29 ; inst 34
  %31 = add i32 %16, 1                                                             ; inst 35
  %32 = sext i32 %31 to i64                                                        ; inst 36
  %33 = getelementptr [20 x i32], [20 x i32]* %30, i32 0, i64 %32                  ; inst 37
  %34 = load i32, i32* %33                                                         ; inst 38
  store i32 %34, i32* %27                                                          ; inst 39
  %35 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 40
  %36 = sext i32 %2 to i64                                                         ; inst 41
  %37 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %35, i32 0, i64 %36 ; inst 42
  %38 = sext i32 %16 to i64                                                        ; inst 43
  %39 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i64 %38                  ; inst 44
  %40 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 45
  %41 = sext i32 %2 to i64                                                         ; inst 46
  %42 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %40, i32 0, i64 %41 ; inst 47
  %43 = add i32 %16, 1                                                             ; inst 48
  %44 = sext i32 %43 to i64                                                        ; inst 49
  %45 = getelementptr [20 x i32], [20 x i32]* %42, i32 0, i64 %44                  ; inst 50
  %46 = load i32, i32* %45                                                         ; inst 51
  store i32 %46, i32* %39                                                          ; inst 52
  %47 = add i32 %16, 1                                                             ; inst 53
  br label %_4.while.cond.1                                                        ; inst 54
_6.while.exit.1:
  %48 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 55
  %49 = sext i32 %2 to i64                                                         ; inst 56
  %50 = getelementptr [1000 x i32], [1000 x i32]* %48, i32 0, i64 %49              ; inst 57
  %51 = load i32, i32* %50                                                         ; inst 58
  %52 = sub i32 %51, 1                                                             ; inst 59
  store i32 %52, i32* %50                                                          ; inst 60
  %53 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 4                     ; inst 61
  %54 = load i32, i32* %53                                                         ; inst 62
  %55 = sub i32 %54, 1                                                             ; inst 63
  store i32 %55, i32* %53                                                          ; inst 64
  ret i1 1                                                                         ; inst 65
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 66
_8.if.exit.0:
  %56 = add i32 %3, 1                                                              ; inst 67
  br label %_1.while.cond.0                                                        ; inst 68
_9.while.exit.0:
  ret i1 0                                                                         ; inst 69
}

define void @_83laIxrrFTG_resize(%HashTable* %0) {
_0.entry.0:
  %1 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                      ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp sge i32 %2, 900                                                        ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret void                                                                         ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = alloca [1000 x [20 x i32]]                                                  ; inst 7
  %5 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                      ; inst 8
  call void @memcpy([1000 x [20 x i32]]* %4, [1000 x [20 x i32]]* %5, i64 80000)   ; inst 9
  %6 = alloca [1000 x [20 x i32]]                                                  ; inst 10
  %7 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                      ; inst 11
  call void @memcpy([1000 x [20 x i32]]* %6, [1000 x [20 x i32]]* %7, i64 80000)   ; inst 12
  %8 = alloca [1000 x i32]                                                         ; inst 13
  %9 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                      ; inst 14
  call void @memcpy([1000 x i32]* %8, [1000 x i32]* %9, i64 4000)                  ; inst 15
  %10 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 16
  %11 = load i32, i32* %10                                                         ; inst 17
  %12 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 18
  %13 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 19
  %14 = load i32, i32* %13                                                         ; inst 20
  %15 = mul i32 %14, 2                                                             ; inst 21
  store i32 %15, i32* %12                                                          ; inst 22
  %16 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 23
  %17 = load i32, i32* %16                                                         ; inst 24
  %18 = icmp sgt i32 %17, 1000                                                     ; inst 25
  br i1 %18, label %_4.if.then.1, label %_5.if.else.1                              ; inst 26
_4.if.then.1:
  %19 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 3                     ; inst 27
  store i32 1000, i32* %19                                                         ; inst 28
  br label %_6.if.exit.1                                                           ; inst 29
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 30
_6.if.exit.1:
  %20 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 31
  %21 = alloca [1000 x [20 x i32]]                                                 ; inst 32
  %22 = alloca [20 x i32]                                                          ; inst 33
  %23 = getelementptr [20 x i32], [20 x i32]* %22, i32 0, i32 0                    ; inst 34
  br label %_7.array.cond.0                                                        ; inst 35
_7.array.cond.0:
  %24 = phi i32 [0, %_6.if.exit.1], [%27, %_8.array.body.0]                        ; inst 36
  %25 = icmp slt i32 %24, 20                                                       ; inst 37
  br i1 %25, label %_8.array.body.0, label %_9.array.exit.0                        ; inst 38
_8.array.body.0:
  %26 = getelementptr i32, i32* %23, i32 %24                                       ; inst 39
  store i32 0, i32* %26                                                            ; inst 40
  %27 = add i32 %24, 1                                                             ; inst 41
  br label %_7.array.cond.0                                                        ; inst 42
_9.array.exit.0:
  %28 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %21, i32 0, i32 0  ; inst 43
  br label %_10.array.cond.1                                                       ; inst 44
_10.array.cond.1:
  %29 = phi i32 [0, %_9.array.exit.0], [%32, %_11.array.body.1]                    ; inst 45
  %30 = icmp slt i32 %29, 1000                                                     ; inst 46
  br i1 %30, label %_11.array.body.1, label %_12.array.exit.1                      ; inst 47
_11.array.body.1:
  %31 = getelementptr [20 x i32], [20 x i32]* %28, i32 %29                         ; inst 48
  call void @memcpy([20 x i32]* %31, [20 x i32]* %22, i64 80)                      ; inst 49
  %32 = add i32 %29, 1                                                             ; inst 50
  br label %_10.array.cond.1                                                       ; inst 51
_12.array.exit.1:
  call void @memcpy([1000 x [20 x i32]]* %20, [1000 x [20 x i32]]* %21, i64 80000) ; inst 52
  %33 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 53
  %34 = alloca [1000 x [20 x i32]]                                                 ; inst 54
  %35 = alloca [20 x i32]                                                          ; inst 55
  %36 = getelementptr [20 x i32], [20 x i32]* %35, i32 0, i32 0                    ; inst 56
  br label %_13.array.cond.2                                                       ; inst 57
_13.array.cond.2:
  %37 = phi i32 [0, %_12.array.exit.1], [%40, %_14.array.body.2]                   ; inst 58
  %38 = icmp slt i32 %37, 20                                                       ; inst 59
  br i1 %38, label %_14.array.body.2, label %_15.array.exit.2                      ; inst 60
_14.array.body.2:
  %39 = getelementptr i32, i32* %36, i32 %37                                       ; inst 61
  store i32 0, i32* %39                                                            ; inst 62
  %40 = add i32 %37, 1                                                             ; inst 63
  br label %_13.array.cond.2                                                       ; inst 64
_15.array.exit.2:
  %41 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %34, i32 0, i32 0  ; inst 65
  br label %_16.array.cond.3                                                       ; inst 66
_16.array.cond.3:
  %42 = phi i32 [0, %_15.array.exit.2], [%45, %_17.array.body.3]                   ; inst 67
  %43 = icmp slt i32 %42, 1000                                                     ; inst 68
  br i1 %43, label %_17.array.body.3, label %_18.array.exit.3                      ; inst 69
_17.array.body.3:
  %44 = getelementptr [20 x i32], [20 x i32]* %41, i32 %42                         ; inst 70
  call void @memcpy([20 x i32]* %44, [20 x i32]* %35, i64 80)                      ; inst 71
  %45 = add i32 %42, 1                                                             ; inst 72
  br label %_16.array.cond.3                                                       ; inst 73
_18.array.exit.3:
  call void @memcpy([1000 x [20 x i32]]* %33, [1000 x [20 x i32]]* %34, i64 80000) ; inst 74
  %46 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 75
  %47 = alloca [1000 x i32]                                                        ; inst 76
  %48 = getelementptr [1000 x i32], [1000 x i32]* %47, i32 0, i32 0                ; inst 77
  br label %_19.array.cond.4                                                       ; inst 78
_19.array.cond.4:
  %49 = phi i32 [0, %_18.array.exit.3], [%52, %_20.array.body.4]                   ; inst 79
  %50 = icmp slt i32 %49, 1000                                                     ; inst 80
  br i1 %50, label %_20.array.body.4, label %_21.array.exit.4                      ; inst 81
_20.array.body.4:
  %51 = getelementptr i32, i32* %48, i32 %49                                       ; inst 82
  store i32 0, i32* %51                                                            ; inst 83
  %52 = add i32 %49, 1                                                             ; inst 84
  br label %_19.array.cond.4                                                       ; inst 85
_21.array.exit.4:
  call void @memcpy([1000 x i32]* %46, [1000 x i32]* %47, i64 4000)                ; inst 86
  %53 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 4                     ; inst 87
  store i32 0, i32* %53                                                            ; inst 88
  %54 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 6                     ; inst 89
  %55 = load i32, i32* %54                                                         ; inst 90
  %56 = add i32 %55, 1                                                             ; inst 91
  store i32 %56, i32* %54                                                          ; inst 92
  br label %_22.while.cond.0                                                       ; inst 93
_22.while.cond.0:
  %57 = phi i32 [0, %_21.array.exit.4], [%75, %_26.while.exit.1]                   ; inst 94
  %58 = icmp slt i32 %57, %11                                                      ; inst 95
  br i1 %58, label %_23.while.body.0, label %_27.while.exit.0                      ; inst 96
_23.while.body.0:
  br label %_24.while.cond.1                                                       ; inst 97
_24.while.cond.1:
  %59 = phi i32 [0, %_23.while.body.0], [%74, %_25.while.body.1]                   ; inst 98
  %60 = sext i32 %57 to i64                                                        ; inst 99
  %61 = getelementptr [1000 x i32], [1000 x i32]* %8, i32 0, i64 %60               ; inst 100
  %62 = load i32, i32* %61                                                         ; inst 101
  %63 = icmp slt i32 %59, %62                                                      ; inst 102
  br i1 %63, label %_25.while.body.1, label %_26.while.exit.1                      ; inst 103
_25.while.body.1:
  %64 = sext i32 %57 to i64                                                        ; inst 104
  %65 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %6, i32 0, i64 %64 ; inst 105
  %66 = sext i32 %59 to i64                                                        ; inst 106
  %67 = getelementptr [20 x i32], [20 x i32]* %65, i32 0, i64 %66                  ; inst 107
  %68 = load i32, i32* %67                                                         ; inst 108
  %69 = sext i32 %57 to i64                                                        ; inst 109
  %70 = getelementptr [1000 x [20 x i32]], [1000 x [20 x i32]]* %4, i32 0, i64 %69 ; inst 110
  %71 = sext i32 %59 to i64                                                        ; inst 111
  %72 = getelementptr [20 x i32], [20 x i32]* %70, i32 0, i64 %71                  ; inst 112
  %73 = load i32, i32* %72                                                         ; inst 113
  call void @_83laIxrrFTG_insert(%HashTable* %0, i32 %68, i32 %73)                 ; inst 114
  %74 = add i32 %59, 1                                                             ; inst 115
  br label %_24.while.cond.1                                                       ; inst 116
_26.while.exit.1:
  %75 = add i32 %57, 1                                                             ; inst 117
  br label %_22.while.cond.0                                                       ; inst 118
_27.while.exit.0:
  ret void                                                                         ; inst 119
}

define void @_bC9qHXNq9fZ_new(%LRUCache* sret(%LRUCache) %0, i32 %1) {
_0.entry.0:
  %2 = alloca %LRUCache                                                            ; inst 1
  %3 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 0                        ; inst 2
  %4 = getelementptr [500 x i32], [500 x i32]* %3, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 5
  %6 = icmp slt i32 %5, 500                                                        ; inst 6
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 8
  store i32 0, i32* %7                                                             ; inst 9
  %8 = add i32 %5, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %9 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 1                        ; inst 12
  %10 = getelementptr [500 x i32], [500 x i32]* %9, i32 0, i32 0                   ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 15
  %12 = icmp slt i32 %11, 500                                                      ; inst 16
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %13 = getelementptr i32, i32* %10, i32 %11                                       ; inst 18
  store i32 0, i32* %13                                                            ; inst 19
  %14 = add i32 %11, 1                                                             ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %15 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 2                       ; inst 22
  %16 = getelementptr [500 x i32], [500 x i32]* %15, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %17 = phi i32 [0, %_6.array.exit.1], [%20, %_8.array.body.2]                     ; inst 25
  %18 = icmp slt i32 %17, 500                                                      ; inst 26
  br i1 %18, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %19 = getelementptr i32, i32* %16, i32 %17                                       ; inst 28
  store i32 0, i32* %19                                                            ; inst 29
  %20 = add i32 %17, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %21 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 3                       ; inst 32
  %22 = getelementptr [10000 x i32], [10000 x i32]* %21, i32 0, i32 0              ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %23 = phi i32 [0, %_9.array.exit.2], [%26, %_11.array.body.3]                    ; inst 35
  %24 = icmp slt i32 %23, 10000                                                    ; inst 36
  br i1 %24, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %25 = getelementptr i32, i32* %22, i32 %23                                       ; inst 38
  store i32 -1, i32* %25                                                           ; inst 39
  %26 = add i32 %23, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %27 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 4                       ; inst 42
  store i32 %1, i32* %27                                                           ; inst 43
  %28 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 5                       ; inst 44
  store i32 0, i32* %28                                                            ; inst 45
  %29 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 6                       ; inst 46
  store i32 0, i32* %29                                                            ; inst 47
  %30 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 7                       ; inst 48
  store i32 0, i32* %30                                                            ; inst 49
  %31 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 8                       ; inst 50
  store i32 0, i32* %31                                                            ; inst 51
  br label %_13.while.cond.0                                                       ; inst 52
_13.while.cond.0:
  %32 = phi i32 [0, %_12.array.exit.3], [%37, %_14.while.body.0]                   ; inst 53
  %33 = icmp slt i32 %32, 10000                                                    ; inst 54
  br i1 %33, label %_14.while.body.0, label %_15.while.exit.0                      ; inst 55
_14.while.body.0:
  %34 = getelementptr %LRUCache, %LRUCache* %2, i32 0, i32 3                       ; inst 56
  %35 = sext i32 %32 to i64                                                        ; inst 57
  %36 = getelementptr [10000 x i32], [10000 x i32]* %34, i32 0, i64 %35            ; inst 58
  store i32 -1, i32* %36                                                           ; inst 59
  %37 = add i32 %32, 1                                                             ; inst 60
  br label %_13.while.cond.0                                                       ; inst 61
_15.while.exit.0:
  call void @memcpy(%LRUCache* %0, %LRUCache* %2, i64 46020)                       ; inst 62
  ret void                                                                         ; inst 63
}

define i32 @_bC9qHXNq9fZ_get(%LRUCache* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 6                        ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = add i32 %3, 1                                                               ; inst 3
  store i32 %4, i32* %2                                                            ; inst 4
  %5 = icmp slt i32 %1, 0                                                          ; inst 5
  br i1 %5, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 6
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 7
_2.lazy.else.0:
  %6 = icmp sge i32 %1, 10000                                                      ; inst 8
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %7 = phi i1 [1, %_1.lazy.then.0], [%6, %_2.lazy.else.0]                          ; inst 10
  br i1 %7, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  %8 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 8                        ; inst 12
  %9 = load i32, i32* %8                                                           ; inst 13
  %10 = add i32 %9, 1                                                              ; inst 14
  store i32 %10, i32* %8                                                           ; inst 15
  ret i32 -1                                                                       ; inst 16
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 17
_6.if.exit.0:
  %11 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 3                       ; inst 18
  %12 = sext i32 %1 to i64                                                         ; inst 19
  %13 = getelementptr [10000 x i32], [10000 x i32]* %11, i32 0, i64 %12            ; inst 20
  %14 = load i32, i32* %13                                                         ; inst 21
  %15 = icmp eq i32 %14, -1                                                        ; inst 22
  br i1 %15, label %_7.if.then.1, label %_8.if.else.1                              ; inst 23
_7.if.then.1:
  %16 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 8                       ; inst 24
  %17 = load i32, i32* %16                                                         ; inst 25
  %18 = add i32 %17, 1                                                             ; inst 26
  store i32 %18, i32* %16                                                          ; inst 27
  ret i32 -1                                                                       ; inst 28
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 29
_9.if.exit.1:
  call void @_bC9qHXNq9fZ_update_usage_order(%LRUCache* %0, i32 %14)               ; inst 30
  %19 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 7                       ; inst 31
  %20 = load i32, i32* %19                                                         ; inst 32
  %21 = add i32 %20, 1                                                             ; inst 33
  store i32 %21, i32* %19                                                          ; inst 34
  %22 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 0                       ; inst 35
  %23 = sext i32 %14 to i64                                                        ; inst 36
  %24 = getelementptr [500 x i32], [500 x i32]* %22, i32 0, i64 %23                ; inst 37
  %25 = load i32, i32* %24                                                         ; inst 38
  ret i32 %25                                                                      ; inst 39
}

define void @_bC9qHXNq9fZ_put(%LRUCache* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %1, 0                                                          ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %4 = icmp sge i32 %1, 10000                                                      ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %5 = phi i1 [1, %_1.lazy.then.0], [%4, %_2.lazy.else.0]                          ; inst 6
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret void                                                                         ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %6 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 3                        ; inst 10
  %7 = sext i32 %1 to i64                                                          ; inst 11
  %8 = getelementptr [10000 x i32], [10000 x i32]* %6, i32 0, i64 %7               ; inst 12
  %9 = load i32, i32* %8                                                           ; inst 13
  %10 = icmp ne i32 %9, -1                                                         ; inst 14
  br i1 %10, label %_7.if.then.1, label %_8.if.else.1                              ; inst 15
_7.if.then.1:
  %11 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 0                       ; inst 16
  %12 = sext i32 %9 to i64                                                         ; inst 17
  %13 = getelementptr [500 x i32], [500 x i32]* %11, i32 0, i64 %12                ; inst 18
  store i32 %2, i32* %13                                                           ; inst 19
  call void @_bC9qHXNq9fZ_update_usage_order(%LRUCache* %0, i32 %9)                ; inst 20
  ret void                                                                         ; inst 21
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 22
_9.if.exit.1:
  %14 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 5                       ; inst 23
  %15 = load i32, i32* %14                                                         ; inst 24
  %16 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 4                       ; inst 25
  %17 = load i32, i32* %16                                                         ; inst 26
  %18 = icmp slt i32 %15, %17                                                      ; inst 27
  br i1 %18, label %_10.if.then.2, label %_11.if.else.2                            ; inst 28
_10.if.then.2:
  %19 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 5                       ; inst 29
  %20 = load i32, i32* %19                                                         ; inst 30
  %21 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 1                       ; inst 31
  %22 = sext i32 %20 to i64                                                        ; inst 32
  %23 = getelementptr [500 x i32], [500 x i32]* %21, i32 0, i64 %22                ; inst 33
  store i32 %1, i32* %23                                                           ; inst 34
  %24 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 0                       ; inst 35
  %25 = sext i32 %20 to i64                                                        ; inst 36
  %26 = getelementptr [500 x i32], [500 x i32]* %24, i32 0, i64 %25                ; inst 37
  store i32 %2, i32* %26                                                           ; inst 38
  %27 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 3                       ; inst 39
  %28 = sext i32 %1 to i64                                                         ; inst 40
  %29 = getelementptr [10000 x i32], [10000 x i32]* %27, i32 0, i64 %28            ; inst 41
  store i32 %20, i32* %29                                                          ; inst 42
  %30 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 2                       ; inst 43
  %31 = sext i32 %20 to i64                                                        ; inst 44
  %32 = getelementptr [500 x i32], [500 x i32]* %30, i32 0, i64 %31                ; inst 45
  %33 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 6                       ; inst 46
  %34 = load i32, i32* %33                                                         ; inst 47
  store i32 %34, i32* %32                                                          ; inst 48
  %35 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 5                       ; inst 49
  %36 = load i32, i32* %35                                                         ; inst 50
  %37 = add i32 %36, 1                                                             ; inst 51
  store i32 %37, i32* %35                                                          ; inst 52
  br label %_24.if.exit.2                                                          ; inst 53
_11.if.else.2:
  %38 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 2                       ; inst 54
  %39 = getelementptr [500 x i32], [500 x i32]* %38, i32 0, i64 0                  ; inst 55
  %40 = load i32, i32* %39                                                         ; inst 56
  br label %_12.while.cond.0                                                       ; inst 57
_12.while.cond.0:
  %41 = phi i32 [%40, %_11.if.else.2], [%56, %_16.if.exit.3]                       ; inst 58
  %42 = phi i32 [0, %_11.if.else.2], [%57, %_16.if.exit.3]                         ; inst 59
  %43 = phi i32 [1, %_11.if.else.2], [%58, %_16.if.exit.3]                         ; inst 60
  %44 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 4                       ; inst 61
  %45 = load i32, i32* %44                                                         ; inst 62
  %46 = icmp slt i32 %43, %45                                                      ; inst 63
  br i1 %46, label %_13.while.body.0, label %_17.while.exit.0                      ; inst 64
_13.while.body.0:
  %47 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 2                       ; inst 65
  %48 = sext i32 %43 to i64                                                        ; inst 66
  %49 = getelementptr [500 x i32], [500 x i32]* %47, i32 0, i64 %48                ; inst 67
  %50 = load i32, i32* %49                                                         ; inst 68
  %51 = icmp slt i32 %50, %41                                                      ; inst 69
  br i1 %51, label %_14.if.then.3, label %_15.if.else.3                            ; inst 70
_14.if.then.3:
  %52 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 2                       ; inst 71
  %53 = sext i32 %43 to i64                                                        ; inst 72
  %54 = getelementptr [500 x i32], [500 x i32]* %52, i32 0, i64 %53                ; inst 73
  %55 = load i32, i32* %54                                                         ; inst 74
  br label %_16.if.exit.3                                                          ; inst 75
_15.if.else.3:
  br label %_16.if.exit.3                                                          ; inst 76
_16.if.exit.3:
  %56 = phi i32 [%55, %_14.if.then.3], [%41, %_15.if.else.3]                       ; inst 77
  %57 = phi i32 [%43, %_14.if.then.3], [%42, %_15.if.else.3]                       ; inst 78
  %58 = add i32 %43, 1                                                             ; inst 79
  br label %_12.while.cond.0                                                       ; inst 80
_17.while.exit.0:
  %59 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 1                       ; inst 81
  %60 = sext i32 %42 to i64                                                        ; inst 82
  %61 = getelementptr [500 x i32], [500 x i32]* %59, i32 0, i64 %60                ; inst 83
  %62 = load i32, i32* %61                                                         ; inst 84
  %63 = icmp sge i32 %62, 0                                                        ; inst 85
  br i1 %63, label %_18.lazy.then.1, label %_19.lazy.else.1                        ; inst 86
_18.lazy.then.1:
  %64 = icmp slt i32 %62, 10000                                                    ; inst 87
  br label %_20.lazy.exit.1                                                        ; inst 88
_19.lazy.else.1:
  br label %_20.lazy.exit.1                                                        ; inst 89
_20.lazy.exit.1:
  %65 = phi i1 [%64, %_18.lazy.then.1], [0, %_19.lazy.else.1]                      ; inst 90
  br i1 %65, label %_21.if.then.4, label %_22.if.else.4                            ; inst 91
_21.if.then.4:
  %66 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 3                       ; inst 92
  %67 = sext i32 %62 to i64                                                        ; inst 93
  %68 = getelementptr [10000 x i32], [10000 x i32]* %66, i32 0, i64 %67            ; inst 94
  store i32 -1, i32* %68                                                           ; inst 95
  br label %_23.if.exit.4                                                          ; inst 96
_22.if.else.4:
  br label %_23.if.exit.4                                                          ; inst 97
_23.if.exit.4:
  %69 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 1                       ; inst 98
  %70 = sext i32 %42 to i64                                                        ; inst 99
  %71 = getelementptr [500 x i32], [500 x i32]* %69, i32 0, i64 %70                ; inst 100
  store i32 %1, i32* %71                                                           ; inst 101
  %72 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 0                       ; inst 102
  %73 = sext i32 %42 to i64                                                        ; inst 103
  %74 = getelementptr [500 x i32], [500 x i32]* %72, i32 0, i64 %73                ; inst 104
  store i32 %2, i32* %74                                                           ; inst 105
  %75 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 3                       ; inst 106
  %76 = sext i32 %1 to i64                                                         ; inst 107
  %77 = getelementptr [10000 x i32], [10000 x i32]* %75, i32 0, i64 %76            ; inst 108
  store i32 %42, i32* %77                                                          ; inst 109
  %78 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 2                       ; inst 110
  %79 = sext i32 %42 to i64                                                        ; inst 111
  %80 = getelementptr [500 x i32], [500 x i32]* %78, i32 0, i64 %79                ; inst 112
  %81 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 6                       ; inst 113
  %82 = load i32, i32* %81                                                         ; inst 114
  store i32 %82, i32* %80                                                          ; inst 115
  br label %_24.if.exit.2                                                          ; inst 116
_24.if.exit.2:
  ret void                                                                         ; inst 117
}

define void @_bC9qHXNq9fZ_update_usage_order(%LRUCache* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 2                        ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [500 x i32], [500 x i32]* %2, i32 0, i64 %3                   ; inst 3
  %5 = getelementptr %LRUCache, %LRUCache* %0, i32 0, i32 6                        ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  store i32 %6, i32* %4                                                            ; inst 6
  ret void                                                                         ; inst 7
}

define void @_bC9qHXNq9fZ_get_cache_statistics([5 x i32]* sret([5 x i32]) %0, %LRUCache* %1) {
_0.entry.0:
  %2 = getelementptr %LRUCache, %LRUCache* %1, i32 0, i32 6                        ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = icmp sgt i32 %3, 0                                                          ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  %5 = getelementptr %LRUCache, %LRUCache* %1, i32 0, i32 7                        ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = mul i32 %6, 100                                                             ; inst 7
  %8 = getelementptr %LRUCache, %LRUCache* %1, i32 0, i32 6                        ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = sdiv i32 %7, %9                                                            ; inst 10
  br label %_3.if.exit.0                                                           ; inst 11
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 12
_3.if.exit.0:
  %11 = phi i32 [%10, %_1.if.then.0], [0, %_2.if.else.0]                           ; inst 13
  %12 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i32 0                       ; inst 14
  %13 = getelementptr %LRUCache, %LRUCache* %1, i32 0, i32 7                       ; inst 15
  %14 = load i32, i32* %13                                                         ; inst 16
  store i32 %14, i32* %12                                                          ; inst 17
  %15 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i32 1                       ; inst 18
  %16 = getelementptr %LRUCache, %LRUCache* %1, i32 0, i32 8                       ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  store i32 %17, i32* %15                                                          ; inst 21
  %18 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i32 2                       ; inst 22
  %19 = getelementptr %LRUCache, %LRUCache* %1, i32 0, i32 6                       ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  store i32 %20, i32* %18                                                          ; inst 25
  %21 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i32 3                       ; inst 26
  store i32 %11, i32* %21                                                          ; inst 27
  %22 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i32 4                       ; inst 28
  %23 = getelementptr %LRUCache, %LRUCache* %1, i32 0, i32 5                       ; inst 29
  %24 = load i32, i32* %23                                                         ; inst 30
  store i32 %24, i32* %22                                                          ; inst 31
  ret void                                                                         ; inst 32
}

define void @_5xhK14xBtVu_new(%MemoryManager* sret(%MemoryManager) %0, i32 %1) {
_0.entry.0:
  %2 = alloca %MemoryManager                                                       ; inst 1
  %3 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 0              ; inst 2
  %4 = getelementptr [10000 x i32], [10000 x i32]* %3, i32 0, i32 0                ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 5
  %6 = icmp slt i32 %5, 10000                                                      ; inst 6
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 8
  store i32 0, i32* %7                                                             ; inst 9
  %8 = add i32 %5, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %9 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 1              ; inst 12
  %10 = getelementptr [10000 x i1], [10000 x i1]* %9, i32 0, i32 0                 ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 15
  %12 = icmp slt i32 %11, 10000                                                    ; inst 16
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %13 = getelementptr i1, i1* %10, i32 %11                                         ; inst 18
  store i1 0, i1* %13                                                              ; inst 19
  %14 = add i32 %11, 1                                                             ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %15 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 2             ; inst 22
  %16 = getelementptr [10000 x i32], [10000 x i32]* %15, i32 0, i32 0              ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %17 = phi i32 [0, %_6.array.exit.1], [%20, %_8.array.body.2]                     ; inst 25
  %18 = icmp slt i32 %17, 10000                                                    ; inst 26
  br i1 %18, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %19 = getelementptr i32, i32* %16, i32 %17                                       ; inst 28
  store i32 0, i32* %19                                                            ; inst 29
  %20 = add i32 %17, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %21 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 3             ; inst 32
  store i32 %1, i32* %21                                                           ; inst 33
  %22 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 4             ; inst 34
  store i32 0, i32* %22                                                            ; inst 35
  %23 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 5             ; inst 36
  store i32 %1, i32* %23                                                           ; inst 37
  %24 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 6             ; inst 38
  store i32 0, i32* %24                                                            ; inst 39
  %25 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 7             ; inst 40
  store i32 0, i32* %25                                                            ; inst 41
  %26 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 8             ; inst 42
  store i32 0, i32* %26                                                            ; inst 43
  %27 = getelementptr %MemoryManager, %MemoryManager* %2, i32 0, i32 2             ; inst 44
  %28 = getelementptr [10000 x i32], [10000 x i32]* %27, i32 0, i64 0              ; inst 45
  store i32 %1, i32* %28                                                           ; inst 46
  call void @memcpy(%MemoryManager* %0, %MemoryManager* %2, i64 90024)             ; inst 47
  ret void                                                                         ; inst 48
}

define i32 @_5xhK14xBtVu_allocate(%MemoryManager* %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %1, 0                                                          ; inst 1
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %3 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 5              ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  %5 = icmp sgt i32 %1, %4                                                         ; inst 6
  br label %_3.lazy.exit.0                                                         ; inst 7
_3.lazy.exit.0:
  %6 = phi i1 [1, %_1.lazy.then.0], [%5, %_2.lazy.else.0]                          ; inst 8
  br i1 %6, label %_4.if.then.0, label %_5.if.else.0                               ; inst 9
_4.if.then.0:
  ret i32 -1                                                                       ; inst 10
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 11
_6.if.exit.0:
  br label %_7.while.cond.0                                                        ; inst 12
_7.while.cond.0:
  %7 = phi i32 [0, %_6.if.exit.0], [%59, %_23.if.exit.1]                           ; inst 13
  %8 = icmp slt i32 %7, 10000                                                      ; inst 14
  br i1 %8, label %_8.while.body.0, label %_24.while.exit.0                        ; inst 15
_8.while.body.0:
  %9 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 1              ; inst 16
  %10 = sext i32 %7 to i64                                                         ; inst 17
  %11 = getelementptr [10000 x i1], [10000 x i1]* %9, i32 0, i64 %10               ; inst 18
  %12 = load i1, i1* %11                                                           ; inst 19
  %13 = icmp eq i1 %12, 0                                                          ; inst 20
  br i1 %13, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 21
_9.lazy.then.1:
  %14 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 22
  %15 = sext i32 %7 to i64                                                         ; inst 23
  %16 = getelementptr [10000 x i32], [10000 x i32]* %14, i32 0, i64 %15            ; inst 24
  %17 = load i32, i32* %16                                                         ; inst 25
  %18 = icmp sge i32 %17, %1                                                       ; inst 26
  br label %_11.lazy.exit.1                                                        ; inst 27
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 28
_11.lazy.exit.1:
  %19 = phi i1 [%18, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 29
  br i1 %19, label %_12.if.then.1, label %_22.if.else.1                            ; inst 30
_12.if.then.1:
  %20 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 1             ; inst 31
  %21 = sext i32 %7 to i64                                                         ; inst 32
  %22 = getelementptr [10000 x i1], [10000 x i1]* %20, i32 0, i64 %21              ; inst 33
  store i1 1, i1* %22                                                              ; inst 34
  %23 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 0             ; inst 35
  %24 = sext i32 %7 to i64                                                         ; inst 36
  %25 = getelementptr [10000 x i32], [10000 x i32]* %23, i32 0, i64 %24            ; inst 37
  store i32 %7, i32* %25                                                           ; inst 38
  %26 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 39
  %27 = sext i32 %7 to i64                                                         ; inst 40
  %28 = getelementptr [10000 x i32], [10000 x i32]* %26, i32 0, i64 %27            ; inst 41
  %29 = load i32, i32* %28                                                         ; inst 42
  %30 = icmp sgt i32 %29, %1                                                       ; inst 43
  br i1 %30, label %_13.if.then.2, label %_20.if.else.2                            ; inst 44
_13.if.then.2:
  %31 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 45
  %32 = sext i32 %7 to i64                                                         ; inst 46
  %33 = getelementptr [10000 x i32], [10000 x i32]* %31, i32 0, i64 %32            ; inst 47
  %34 = load i32, i32* %33                                                         ; inst 48
  %35 = sub i32 %34, %1                                                            ; inst 49
  %36 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 50
  %37 = sext i32 %7 to i64                                                         ; inst 51
  %38 = getelementptr [10000 x i32], [10000 x i32]* %36, i32 0, i64 %37            ; inst 52
  store i32 %1, i32* %38                                                           ; inst 53
  br label %_14.while.cond.1                                                       ; inst 54
_14.while.cond.1:
  %39 = phi i32 [0, %_13.if.then.2], [%49, %_18.if.exit.3]                         ; inst 55
  %40 = icmp slt i32 %39, 10000                                                    ; inst 56
  br i1 %40, label %_15.while.body.1, label %_25.critical_edge.0                   ; inst 57
_15.while.body.1:
  %41 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 58
  %42 = sext i32 %39 to i64                                                        ; inst 59
  %43 = getelementptr [10000 x i32], [10000 x i32]* %41, i32 0, i64 %42            ; inst 60
  %44 = load i32, i32* %43                                                         ; inst 61
  %45 = icmp eq i32 %44, 0                                                         ; inst 62
  br i1 %45, label %_16.if.then.3, label %_17.if.else.3                            ; inst 63
_16.if.then.3:
  %46 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 64
  %47 = sext i32 %39 to i64                                                        ; inst 65
  %48 = getelementptr [10000 x i32], [10000 x i32]* %46, i32 0, i64 %47            ; inst 66
  store i32 %35, i32* %48                                                          ; inst 67
  br label %_19.while.exit.1                                                       ; inst 68
_17.if.else.3:
  br label %_18.if.exit.3                                                          ; inst 69
_18.if.exit.3:
  %49 = add i32 %39, 1                                                             ; inst 70
  br label %_14.while.cond.1                                                       ; inst 71
_19.while.exit.1:
  br label %_21.if.exit.2                                                          ; inst 72
_20.if.else.2:
  br label %_21.if.exit.2                                                          ; inst 73
_21.if.exit.2:
  %50 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 4             ; inst 74
  %51 = load i32, i32* %50                                                         ; inst 75
  %52 = add i32 %51, %1                                                            ; inst 76
  store i32 %52, i32* %50                                                          ; inst 77
  %53 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 5             ; inst 78
  %54 = load i32, i32* %53                                                         ; inst 79
  %55 = sub i32 %54, %1                                                            ; inst 80
  store i32 %55, i32* %53                                                          ; inst 81
  %56 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 6             ; inst 82
  %57 = load i32, i32* %56                                                         ; inst 83
  %58 = add i32 %57, 1                                                             ; inst 84
  store i32 %58, i32* %56                                                          ; inst 85
  call void @_5xhK14xBtVu_calculate_fragmentation(%MemoryManager* %0)              ; inst 86
  ret i32 %7                                                                       ; inst 87
_22.if.else.1:
  br label %_23.if.exit.1                                                          ; inst 88
_23.if.exit.1:
  %59 = add i32 %7, 1                                                              ; inst 89
  br label %_7.while.cond.0                                                        ; inst 90
_24.while.exit.0:
  ret i32 -1                                                                       ; inst 91
_25.critical_edge.0:
  br label %_19.while.exit.1                                                       ; inst 92
}

define i1 @_5xhK14xBtVu_deallocate(%MemoryManager* %0, i32 %1) {
_0.entry.0:
  %2 = icmp slt i32 %1, 0                                                          ; inst 1
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %3 = icmp sge i32 %1, 10000                                                      ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %4 = phi i1 [1, %_1.lazy.then.0], [%3, %_2.lazy.else.0]                          ; inst 6
  br i1 %4, label %_4.lazy.then.1, label %_5.lazy.else.1                           ; inst 7
_4.lazy.then.1:
  br label %_6.lazy.exit.1                                                         ; inst 8
_5.lazy.else.1:
  %5 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 1              ; inst 9
  %6 = sext i32 %1 to i64                                                          ; inst 10
  %7 = getelementptr [10000 x i1], [10000 x i1]* %5, i32 0, i64 %6                 ; inst 11
  %8 = load i1, i1* %7                                                             ; inst 12
  %9 = icmp eq i1 %8, 0                                                            ; inst 13
  br label %_6.lazy.exit.1                                                         ; inst 14
_6.lazy.exit.1:
  %10 = phi i1 [1, %_4.lazy.then.1], [%9, %_5.lazy.else.1]                         ; inst 15
  br i1 %10, label %_7.if.then.0, label %_8.if.else.0                              ; inst 16
_7.if.then.0:
  ret i1 0                                                                         ; inst 17
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 18
_9.if.exit.0:
  %11 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 19
  %12 = sext i32 %1 to i64                                                         ; inst 20
  %13 = getelementptr [10000 x i32], [10000 x i32]* %11, i32 0, i64 %12            ; inst 21
  %14 = load i32, i32* %13                                                         ; inst 22
  %15 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 1             ; inst 23
  %16 = sext i32 %1 to i64                                                         ; inst 24
  %17 = getelementptr [10000 x i1], [10000 x i1]* %15, i32 0, i64 %16              ; inst 25
  store i1 0, i1* %17                                                              ; inst 26
  %18 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 4             ; inst 27
  %19 = load i32, i32* %18                                                         ; inst 28
  %20 = sub i32 %19, %14                                                           ; inst 29
  store i32 %20, i32* %18                                                          ; inst 30
  %21 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 5             ; inst 31
  %22 = load i32, i32* %21                                                         ; inst 32
  %23 = add i32 %22, %14                                                           ; inst 33
  store i32 %23, i32* %21                                                          ; inst 34
  %24 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 7             ; inst 35
  %25 = load i32, i32* %24                                                         ; inst 36
  %26 = add i32 %25, 1                                                             ; inst 37
  store i32 %26, i32* %24                                                          ; inst 38
  call void @_5xhK14xBtVu_coalesce_free_blocks(%MemoryManager* %0)                 ; inst 39
  call void @_5xhK14xBtVu_calculate_fragmentation(%MemoryManager* %0)              ; inst 40
  ret i1 1                                                                         ; inst 41
}

define void @_5xhK14xBtVu_coalesce_free_blocks(%MemoryManager* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%29, %_8.if.exit.0]                              ; inst 2
  %2 = icmp slt i32 %1, 9999                                                       ; inst 3
  br i1 %2, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 1              ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [10000 x i1], [10000 x i1]* %3, i32 0, i64 %4                 ; inst 7
  %6 = load i1, i1* %5                                                             ; inst 8
  %7 = icmp eq i1 %6, 0                                                            ; inst 9
  br i1 %7, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 10
_3.lazy.then.0:
  %8 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 1              ; inst 11
  %9 = add i32 %1, 1                                                               ; inst 12
  %10 = sext i32 %9 to i64                                                         ; inst 13
  %11 = getelementptr [10000 x i1], [10000 x i1]* %8, i32 0, i64 %10               ; inst 14
  %12 = load i1, i1* %11                                                           ; inst 15
  %13 = icmp eq i1 %12, 0                                                          ; inst 16
  br label %_5.lazy.exit.0                                                         ; inst 17
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 18
_5.lazy.exit.0:
  %14 = phi i1 [%13, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 19
  br i1 %14, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %15 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 21
  %16 = sext i32 %1 to i64                                                         ; inst 22
  %17 = getelementptr [10000 x i32], [10000 x i32]* %15, i32 0, i64 %16            ; inst 23
  %18 = load i32, i32* %17                                                         ; inst 24
  %19 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 25
  %20 = add i32 %1, 1                                                              ; inst 26
  %21 = sext i32 %20 to i64                                                        ; inst 27
  %22 = getelementptr [10000 x i32], [10000 x i32]* %19, i32 0, i64 %21            ; inst 28
  %23 = load i32, i32* %22                                                         ; inst 29
  %24 = add i32 %18, %23                                                           ; inst 30
  store i32 %24, i32* %17                                                          ; inst 31
  %25 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 32
  %26 = add i32 %1, 1                                                              ; inst 33
  %27 = sext i32 %26 to i64                                                        ; inst 34
  %28 = getelementptr [10000 x i32], [10000 x i32]* %25, i32 0, i64 %27            ; inst 35
  store i32 0, i32* %28                                                            ; inst 36
  br label %_8.if.exit.0                                                           ; inst 37
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 38
_8.if.exit.0:
  %29 = add i32 %1, 1                                                              ; inst 39
  br label %_1.while.cond.0                                                        ; inst 40
_9.while.exit.0:
  ret void                                                                         ; inst 41
}

define void @_5xhK14xBtVu_calculate_fragmentation(%MemoryManager* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%26, %_11.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 3
  %3 = icmp slt i32 %1, 10000                                                      ; inst 4
  br i1 %3, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %4 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 1              ; inst 6
  %5 = sext i32 %1 to i64                                                          ; inst 7
  %6 = getelementptr [10000 x i1], [10000 x i1]* %4, i32 0, i64 %5                 ; inst 8
  %7 = load i1, i1* %6                                                             ; inst 9
  %8 = icmp eq i1 %7, 0                                                            ; inst 10
  br i1 %8, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 11
_3.lazy.then.0:
  %9 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2              ; inst 12
  %10 = sext i32 %1 to i64                                                         ; inst 13
  %11 = getelementptr [10000 x i32], [10000 x i32]* %9, i32 0, i64 %10             ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = icmp sgt i32 %12, 0                                                        ; inst 16
  br label %_5.lazy.exit.0                                                         ; inst 17
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 18
_5.lazy.exit.0:
  %14 = phi i1 [%13, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 19
  br i1 %14, label %_6.if.then.0, label %_10.if.else.0                             ; inst 20
_6.if.then.0:
  %15 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 21
  %16 = sext i32 %1 to i64                                                         ; inst 22
  %17 = getelementptr [10000 x i32], [10000 x i32]* %15, i32 0, i64 %16            ; inst 23
  %18 = load i32, i32* %17                                                         ; inst 24
  %19 = icmp sgt i32 %18, %2                                                       ; inst 25
  br i1 %19, label %_7.if.then.1, label %_8.if.else.1                              ; inst 26
_7.if.then.1:
  %20 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 2             ; inst 27
  %21 = sext i32 %1 to i64                                                         ; inst 28
  %22 = getelementptr [10000 x i32], [10000 x i32]* %20, i32 0, i64 %21            ; inst 29
  %23 = load i32, i32* %22                                                         ; inst 30
  br label %_9.if.exit.1                                                           ; inst 31
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 32
_9.if.exit.1:
  %24 = phi i32 [%23, %_7.if.then.1], [%2, %_8.if.else.1]                          ; inst 33
  br label %_11.if.exit.0                                                          ; inst 34
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 35
_11.if.exit.0:
  %25 = phi i32 [%24, %_9.if.exit.1], [%2, %_10.if.else.0]                         ; inst 36
  %26 = add i32 %1, 1                                                              ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_12.while.exit.0:
  %27 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 5             ; inst 39
  %28 = load i32, i32* %27                                                         ; inst 40
  %29 = icmp sgt i32 %28, 0                                                        ; inst 41
  br i1 %29, label %_13.if.then.2, label %_14.if.else.2                            ; inst 42
_13.if.then.2:
  %30 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 8             ; inst 43
  %31 = mul i32 %2, 100                                                            ; inst 44
  %32 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 5             ; inst 45
  %33 = load i32, i32* %32                                                         ; inst 46
  %34 = sdiv i32 %31, %33                                                          ; inst 47
  %35 = sub i32 100, %34                                                           ; inst 48
  store i32 %35, i32* %30                                                          ; inst 49
  br label %_15.if.exit.2                                                          ; inst 50
_14.if.else.2:
  %36 = getelementptr %MemoryManager, %MemoryManager* %0, i32 0, i32 8             ; inst 51
  store i32 0, i32* %36                                                            ; inst 52
  br label %_15.if.exit.2                                                          ; inst 53
_15.if.exit.2:
  ret void                                                                         ; inst 54
}

define void @_5xhK14xBtVu_get_memory_statistics([6 x i32]* sret([6 x i32]) %0, %MemoryManager* %1) {
_0.entry.0:
  %2 = getelementptr [6 x i32], [6 x i32]* %0, i32 0, i32 0                        ; inst 1
  %3 = getelementptr %MemoryManager, %MemoryManager* %1, i32 0, i32 4              ; inst 2
  %4 = load i32, i32* %3                                                           ; inst 3
  store i32 %4, i32* %2                                                            ; inst 4
  %5 = getelementptr [6 x i32], [6 x i32]* %0, i32 0, i32 1                        ; inst 5
  %6 = getelementptr %MemoryManager, %MemoryManager* %1, i32 0, i32 5              ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  store i32 %7, i32* %5                                                            ; inst 8
  %8 = getelementptr [6 x i32], [6 x i32]* %0, i32 0, i32 2                        ; inst 9
  %9 = getelementptr %MemoryManager, %MemoryManager* %1, i32 0, i32 6              ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  store i32 %10, i32* %8                                                           ; inst 12
  %11 = getelementptr [6 x i32], [6 x i32]* %0, i32 0, i32 3                       ; inst 13
  %12 = getelementptr %MemoryManager, %MemoryManager* %1, i32 0, i32 7             ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  store i32 %13, i32* %11                                                          ; inst 16
  %14 = getelementptr [6 x i32], [6 x i32]* %0, i32 0, i32 4                       ; inst 17
  %15 = getelementptr %MemoryManager, %MemoryManager* %1, i32 0, i32 8             ; inst 18
  %16 = load i32, i32* %15                                                         ; inst 19
  store i32 %16, i32* %14                                                          ; inst 20
  %17 = getelementptr [6 x i32], [6 x i32]* %0, i32 0, i32 5                       ; inst 21
  %18 = getelementptr %MemoryManager, %MemoryManager* %1, i32 0, i32 3             ; inst 22
  %19 = load i32, i32* %18                                                         ; inst 23
  store i32 %19, i32* %17                                                          ; inst 24
  ret void                                                                         ; inst 25
}

define void @main() {
_0.entry.0:
  %0 = alloca %AVLTree                                                             ; inst 1
  call void @_7GLwwskssmg_new(%AVLTree* %0)                                        ; inst 2
  %1 = call i32 @getInt()                                                          ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%27, %_14.if.exit.0]                             ; inst 5
  %3 = icmp slt i32 %2, %1                                                         ; inst 6
  br i1 %3, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 7
_2.while.body.0:
  %4 = call i32 @getInt()                                                          ; inst 8
  %5 = call i32 @getInt()                                                          ; inst 9
  %6 = call i32 @getInt()                                                          ; inst 10
  %7 = icmp eq i32 %4, 1                                                           ; inst 11
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 12
_3.if.then.0:
  %8 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 2                          ; inst 13
  %9 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 2                          ; inst 14
  %10 = load i32, i32* %9                                                          ; inst 15
  %11 = call i32 @_7GLwwskssmg_insert(%AVLTree* %0, i32 %10, i32 %5, i32 %6)       ; inst 16
  store i32 %11, i32* %8                                                           ; inst 17
  br label %_14.if.exit.0                                                          ; inst 18
_4.if.else.0:
  %12 = icmp eq i32 %4, 2                                                          ; inst 19
  br i1 %12, label %_5.if.then.1, label %_6.if.else.1                              ; inst 20
_5.if.then.1:
  %13 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 2                         ; inst 21
  %14 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 2                         ; inst 22
  %15 = load i32, i32* %14                                                         ; inst 23
  %16 = call i32 @_7GLwwskssmg_delete_node(%AVLTree* %0, i32 %15, i32 %5)          ; inst 24
  store i32 %16, i32* %13                                                          ; inst 25
  br label %_13.if.exit.1                                                          ; inst 26
_6.if.else.1:
  %17 = icmp eq i32 %4, 3                                                          ; inst 27
  br i1 %17, label %_7.if.then.2, label %_11.if.else.2                             ; inst 28
_7.if.then.2:
  %18 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 2                         ; inst 29
  %19 = load i32, i32* %18                                                         ; inst 30
  %20 = call i32 @_7GLwwskssmg_search(%AVLTree* %0, i32 %19, i32 %5)               ; inst 31
  %21 = icmp ne i32 %20, -1                                                        ; inst 32
  br i1 %21, label %_8.if.then.3, label %_9.if.else.3                              ; inst 33
_8.if.then.3:
  %22 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 0                         ; inst 34
  %23 = sext i32 %20 to i64                                                        ; inst 35
  %24 = getelementptr [2000 x %Node], [2000 x %Node]* %22, i32 0, i64 %23          ; inst 36
  %25 = getelementptr %Node, %Node* %24, i32 0, i32 0                              ; inst 37
  %26 = load i32, i32* %25                                                         ; inst 38
  call void @printlnInt(i32 %26)                                                   ; inst 39
  br label %_10.if.exit.3                                                          ; inst 40
_9.if.else.3:
  call void @printlnInt(i32 -1)                                                    ; inst 41
  br label %_10.if.exit.3                                                          ; inst 42
_10.if.exit.3:
  br label %_12.if.exit.2                                                          ; inst 43
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 44
_12.if.exit.2:
  br label %_13.if.exit.1                                                          ; inst 45
_13.if.exit.1:
  br label %_14.if.exit.0                                                          ; inst 46
_14.if.exit.0:
  %27 = add i32 %2, 1                                                              ; inst 47
  br label %_1.while.cond.0                                                        ; inst 48
_15.while.exit.0:
  %28 = call i32 @getInt()                                                         ; inst 49
  %29 = alloca %HashTable                                                          ; inst 50
  call void @_83laIxrrFTG_new(%HashTable* %29, i32 %28)                            ; inst 51
  %30 = call i32 @getInt()                                                         ; inst 52
  br label %_16.while.cond.1                                                       ; inst 53
_16.while.cond.1:
  %31 = phi i32 [0, %_15.while.exit.0], [%42, %_29.if.exit.4]                      ; inst 54
  %32 = icmp slt i32 %31, %30                                                      ; inst 55
  br i1 %32, label %_17.while.body.1, label %_30.while.exit.1                      ; inst 56
_17.while.body.1:
  %33 = call i32 @getInt()                                                         ; inst 57
  %34 = call i32 @getInt()                                                         ; inst 58
  %35 = icmp eq i32 %33, 1                                                         ; inst 59
  br i1 %35, label %_18.if.then.4, label %_19.if.else.4                            ; inst 60
_18.if.then.4:
  %36 = call i32 @getInt()                                                         ; inst 61
  call void @_83laIxrrFTG_insert(%HashTable* %29, i32 %34, i32 %36)                ; inst 62
  br label %_29.if.exit.4                                                          ; inst 63
_19.if.else.4:
  %37 = icmp eq i32 %33, 2                                                         ; inst 64
  br i1 %37, label %_20.if.then.5, label %_21.if.else.5                            ; inst 65
_20.if.then.5:
  %38 = call i32 @_83laIxrrFTG_search(%HashTable* %29, i32 %34)                    ; inst 66
  call void @printlnInt(i32 %38)                                                   ; inst 67
  br label %_28.if.exit.5                                                          ; inst 68
_21.if.else.5:
  %39 = icmp eq i32 %33, 3                                                         ; inst 69
  br i1 %39, label %_22.if.then.6, label %_26.if.else.6                            ; inst 70
_22.if.then.6:
  %40 = call i1 @_83laIxrrFTG_delete(%HashTable* %29, i32 %34)                     ; inst 71
  br i1 %40, label %_23.if.then.7, label %_24.if.else.7                            ; inst 72
_23.if.then.7:
  br label %_25.if.exit.7                                                          ; inst 73
_24.if.else.7:
  br label %_25.if.exit.7                                                          ; inst 74
_25.if.exit.7:
  %41 = phi i32 [1, %_23.if.then.7], [0, %_24.if.else.7]                           ; inst 75
  call void @printlnInt(i32 %41)                                                   ; inst 76
  br label %_27.if.exit.6                                                          ; inst 77
_26.if.else.6:
  br label %_27.if.exit.6                                                          ; inst 78
_27.if.exit.6:
  br label %_28.if.exit.5                                                          ; inst 79
_28.if.exit.5:
  br label %_29.if.exit.4                                                          ; inst 80
_29.if.exit.4:
  %42 = add i32 %31, 1                                                             ; inst 81
  br label %_16.while.cond.1                                                       ; inst 82
_30.while.exit.1:
  %43 = call i32 @getInt()                                                         ; inst 83
  %44 = alloca %LRUCache                                                           ; inst 84
  call void @_bC9qHXNq9fZ_new(%LRUCache* %44, i32 %43)                             ; inst 85
  %45 = call i32 @getInt()                                                         ; inst 86
  br label %_31.while.cond.2                                                       ; inst 87
_31.while.cond.2:
  %46 = phi i32 [0, %_30.while.exit.1], [%54, %_38.if.exit.8]                      ; inst 88
  %47 = icmp slt i32 %46, %45                                                      ; inst 89
  br i1 %47, label %_32.while.body.2, label %_39.while.exit.2                      ; inst 90
_32.while.body.2:
  %48 = call i32 @getInt()                                                         ; inst 91
  %49 = call i32 @getInt()                                                         ; inst 92
  %50 = icmp eq i32 %48, 1                                                         ; inst 93
  br i1 %50, label %_33.if.then.8, label %_34.if.else.8                            ; inst 94
_33.if.then.8:
  %51 = call i32 @getInt()                                                         ; inst 95
  call void @_bC9qHXNq9fZ_put(%LRUCache* %44, i32 %49, i32 %51)                    ; inst 96
  br label %_38.if.exit.8                                                          ; inst 97
_34.if.else.8:
  %52 = icmp eq i32 %48, 2                                                         ; inst 98
  br i1 %52, label %_35.if.then.9, label %_36.if.else.9                            ; inst 99
_35.if.then.9:
  %53 = call i32 @_bC9qHXNq9fZ_get(%LRUCache* %44, i32 %49)                        ; inst 100
  call void @printlnInt(i32 %53)                                                   ; inst 101
  br label %_37.if.exit.9                                                          ; inst 102
_36.if.else.9:
  br label %_37.if.exit.9                                                          ; inst 103
_37.if.exit.9:
  br label %_38.if.exit.8                                                          ; inst 104
_38.if.exit.8:
  %54 = add i32 %46, 1                                                             ; inst 105
  br label %_31.while.cond.2                                                       ; inst 106
_39.while.exit.2:
  %55 = call i32 @getInt()                                                         ; inst 107
  %56 = alloca %MemoryManager                                                      ; inst 108
  call void @_5xhK14xBtVu_new(%MemoryManager* %56, i32 %55)                        ; inst 109
  %57 = call i32 @getInt()                                                         ; inst 110
  br label %_40.while.cond.3                                                       ; inst 111
_40.while.cond.3:
  %58 = phi i32 [0, %_39.while.exit.2], [%68, %_50.if.exit.10]                     ; inst 112
  %59 = icmp slt i32 %58, %57                                                      ; inst 113
  br i1 %59, label %_41.while.body.3, label %_51.while.exit.3                      ; inst 114
_41.while.body.3:
  %60 = call i32 @getInt()                                                         ; inst 115
  %61 = icmp eq i32 %60, 1                                                         ; inst 116
  br i1 %61, label %_42.if.then.10, label %_43.if.else.10                          ; inst 117
_42.if.then.10:
  %62 = call i32 @getInt()                                                         ; inst 118
  %63 = call i32 @_5xhK14xBtVu_allocate(%MemoryManager* %56, i32 %62)              ; inst 119
  call void @printlnInt(i32 %63)                                                   ; inst 120
  br label %_50.if.exit.10                                                         ; inst 121
_43.if.else.10:
  %64 = icmp eq i32 %60, 2                                                         ; inst 122
  br i1 %64, label %_44.if.then.11, label %_48.if.else.11                          ; inst 123
_44.if.then.11:
  %65 = call i32 @getInt()                                                         ; inst 124
  %66 = call i1 @_5xhK14xBtVu_deallocate(%MemoryManager* %56, i32 %65)             ; inst 125
  br i1 %66, label %_45.if.then.12, label %_46.if.else.12                          ; inst 126
_45.if.then.12:
  br label %_47.if.exit.12                                                         ; inst 127
_46.if.else.12:
  br label %_47.if.exit.12                                                         ; inst 128
_47.if.exit.12:
  %67 = phi i32 [1, %_45.if.then.12], [0, %_46.if.else.12]                         ; inst 129
  call void @printlnInt(i32 %67)                                                   ; inst 130
  br label %_49.if.exit.11                                                         ; inst 131
_48.if.else.11:
  br label %_49.if.exit.11                                                         ; inst 132
_49.if.exit.11:
  br label %_50.if.exit.10                                                         ; inst 133
_50.if.exit.10:
  %68 = add i32 %58, 1                                                             ; inst 134
  br label %_40.while.cond.3                                                       ; inst 135
_51.while.exit.3:
  %69 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 1                         ; inst 136
  %70 = load i32, i32* %69                                                         ; inst 137
  call void @printlnInt(i32 %70)                                                   ; inst 138
  %71 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 8                         ; inst 139
  %72 = load i32, i32* %71                                                         ; inst 140
  call void @printlnInt(i32 %72)                                                   ; inst 141
  %73 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 9                         ; inst 142
  %74 = load i32, i32* %73                                                         ; inst 143
  call void @printlnInt(i32 %74)                                                   ; inst 144
  %75 = getelementptr %HashTable, %HashTable* %29, i32 0, i32 4                    ; inst 145
  %76 = load i32, i32* %75                                                         ; inst 146
  call void @printlnInt(i32 %76)                                                   ; inst 147
  %77 = getelementptr %HashTable, %HashTable* %29, i32 0, i32 5                    ; inst 148
  %78 = load i32, i32* %77                                                         ; inst 149
  call void @printlnInt(i32 %78)                                                   ; inst 150
  %79 = getelementptr %HashTable, %HashTable* %29, i32 0, i32 6                    ; inst 151
  %80 = load i32, i32* %79                                                         ; inst 152
  call void @printlnInt(i32 %80)                                                   ; inst 153
  %81 = alloca [5 x i32]                                                           ; inst 154
  call void @_bC9qHXNq9fZ_get_cache_statistics([5 x i32]* %81, %LRUCache* %44)     ; inst 155
  br label %_52.while.cond.4                                                       ; inst 156
_52.while.cond.4:
  %82 = phi i32 [0, %_51.while.exit.3], [%87, %_53.while.body.4]                   ; inst 157
  %83 = icmp slt i32 %82, 5                                                        ; inst 158
  br i1 %83, label %_53.while.body.4, label %_54.while.exit.4                      ; inst 159
_53.while.body.4:
  %84 = sext i32 %82 to i64                                                        ; inst 160
  %85 = getelementptr [5 x i32], [5 x i32]* %81, i32 0, i64 %84                    ; inst 161
  %86 = load i32, i32* %85                                                         ; inst 162
  call void @printlnInt(i32 %86)                                                   ; inst 163
  %87 = add i32 %82, 1                                                             ; inst 164
  br label %_52.while.cond.4                                                       ; inst 165
_54.while.exit.4:
  %88 = alloca [6 x i32]                                                           ; inst 166
  call void @_5xhK14xBtVu_get_memory_statistics([6 x i32]* %88, %MemoryManager* %56) ; inst 167
  br label %_55.while.cond.5                                                       ; inst 168
_55.while.cond.5:
  %89 = phi i32 [0, %_54.while.exit.4], [%94, %_56.while.body.5]                   ; inst 169
  %90 = icmp slt i32 %89, 6                                                        ; inst 170
  br i1 %90, label %_56.while.body.5, label %_57.while.exit.5                      ; inst 171
_56.while.body.5:
  %91 = sext i32 %89 to i64                                                        ; inst 172
  %92 = getelementptr [6 x i32], [6 x i32]* %88, i32 0, i64 %91                    ; inst 173
  %93 = load i32, i32* %92                                                         ; inst 174
  call void @printlnInt(i32 %93)                                                   ; inst 175
  %94 = add i32 %89, 1                                                             ; inst 176
  br label %_55.while.cond.5                                                       ; inst 177
_57.while.exit.5:
  %95 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 1                         ; inst 178
  %96 = load i32, i32* %95                                                         ; inst 179
  %97 = mul i32 %96, 10                                                            ; inst 180
  %98 = getelementptr %AVLTree, %AVLTree* %0, i32 0, i32 8                         ; inst 181
  %99 = load i32, i32* %98                                                         ; inst 182
  %100 = add i32 %97, %99                                                          ; inst 183
  %101 = getelementptr %HashTable, %HashTable* %29, i32 0, i32 4                   ; inst 184
  %102 = load i32, i32* %101                                                       ; inst 185
  %103 = mul i32 %102, 5                                                           ; inst 186
  %104 = getelementptr %HashTable, %HashTable* %29, i32 0, i32 5                   ; inst 187
  %105 = load i32, i32* %104                                                       ; inst 188
  %106 = add i32 %103, %105                                                        ; inst 189
  %107 = getelementptr [5 x i32], [5 x i32]* %81, i32 0, i64 3                     ; inst 190
  %108 = load i32, i32* %107                                                       ; inst 191
  %109 = getelementptr [6 x i32], [6 x i32]* %88, i32 0, i64 4                     ; inst 192
  %110 = load i32, i32* %109                                                       ; inst 193
  %111 = sub i32 100, %110                                                         ; inst 194
  %112 = add i32 %100, %106                                                        ; inst 195
  %113 = add i32 %112, %108                                                        ; inst 196
  %114 = add i32 %113, %111                                                        ; inst 197
  call void @printlnInt(i32 %114)                                                  ; inst 198
  call void @exit(i32 0)                                                           ; inst 199
  ret void                                                                         ; inst 200
}

