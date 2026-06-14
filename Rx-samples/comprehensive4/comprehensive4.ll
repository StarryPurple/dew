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
  call void @printlnInt(i32 1400)                                                  ; inst 1
  call void @testDeepRecursiveAlgorithms()                                         ; inst 2
  call void @testMutualRecursion()                                                 ; inst 3
  call void @testTreeTraversalAlgorithms()                                         ; inst 4
  call void @testDivideAndConquerAlgorithms()                                      ; inst 5
  call void @testRecursiveMathematicalComputations()                               ; inst 6
  call void @printlnInt(i32 1499)                                                  ; inst 7
  call void @exit(i32 0)                                                           ; inst 8
  ret void                                                                         ; inst 9
}

define void @testDeepRecursiveAlgorithms() {
_0.entry.0:
  call void @printlnInt(i32 1401)                                                  ; inst 1
  %0 = call i32 @tailRecursiveFactorial(i32 12, i32 1)                             ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @deepRecursiveSum(i32 1000, i32 0)                                 ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @recursiveCountdown(i32 500)                                       ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @recursivePower(i32 2, i32 20)                                     ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  call void @printlnInt(i32 1402)                                                  ; inst 10
  ret void                                                                         ; inst 11
}

define i32 @tailRecursiveFactorial(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = sub i32 %0, 1                                                               ; inst 5
  %4 = mul i32 %1, %0                                                              ; inst 6
  %5 = call i32 @tailRecursiveFactorial(i32 %3, i32 %4)                            ; inst 7
  ret i32 %5                                                                       ; inst 8
}

define i32 @deepRecursiveSum(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = sub i32 %0, 1                                                               ; inst 5
  %4 = add i32 %1, %0                                                              ; inst 6
  %5 = call i32 @deepRecursiveSum(i32 %3, i32 %4)                                  ; inst 7
  ret i32 %5                                                                       ; inst 8
}

define i32 @recursiveCountdown(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = sub i32 %0, 1                                                               ; inst 5
  %3 = call i32 @recursiveCountdown(i32 %2)                                        ; inst 6
  %4 = add i32 1, %3                                                               ; inst 7
  ret i32 %4                                                                       ; inst 8
}

define i32 @recursivePower(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = icmp eq i32 %1, 1                                                           ; inst 5
  br i1 %3, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 %0                                                                       ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  %4 = srem i32 %1, 2                                                              ; inst 9
  %5 = icmp eq i32 %4, 0                                                           ; inst 10
  br i1 %5, label %_7.if.then.2, label %_8.if.else.2                               ; inst 11
_7.if.then.2:
  %6 = sdiv i32 %1, 2                                                              ; inst 12
  %7 = call i32 @recursivePower(i32 %0, i32 %6)                                    ; inst 13
  %8 = mul i32 %7, %7                                                              ; inst 14
  ret i32 %8                                                                       ; inst 15
_8.if.else.2:
  %9 = sub i32 %1, 1                                                               ; inst 16
  %10 = call i32 @recursivePower(i32 %0, i32 %9)                                   ; inst 17
  %11 = mul i32 %0, %10                                                            ; inst 18
  ret i32 %11                                                                      ; inst 19
_9.if.exit.2:
  unreachable                                                                      ; inst 20
}

define void @testMutualRecursion() {
_0.entry.0:
  call void @printlnInt(i32 1403)                                                  ; inst 1
  %0 = call i32 @countEvenOddMutual(i32 100)                                       ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @pingPongMutual(i32 50, i1 1)                                      ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @stateMachineA(i32 75, i32 0)                                      ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  call void @printlnInt(i32 1404)                                                  ; inst 8
  ret void                                                                         ; inst 9
}

define i32 @isEvenMutual(i32 %0) {
_0.entry.0:
  %1 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = sub i32 %0, 1                                                               ; inst 5
  %3 = call i32 @isOddMutual(i32 %2)                                               ; inst 6
  ret i32 %3                                                                       ; inst 7
}

define i32 @isOddMutual(i32 %0) {
_0.entry.0:
  %1 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = sub i32 %0, 1                                                               ; inst 5
  %3 = call i32 @isEvenMutual(i32 %2)                                              ; inst 6
  ret i32 %3                                                                       ; inst 7
}

define i32 @countEvenOddMutual(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%8, %_5.if.exit.0]                               ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%7, %_5.if.exit.0]                               ; inst 3
  %3 = icmp sle i32 %1, %0                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = call i32 @isEvenMutual(i32 %1)                                              ; inst 6
  %5 = icmp eq i32 %4, 1                                                           ; inst 7
  br i1 %5, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %6 = add i32 %2, 1                                                               ; inst 9
  br label %_5.if.exit.0                                                           ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %7 = phi i32 [%6, %_3.if.then.0], [%2, %_4.if.else.0]                            ; inst 12
  %8 = add i32 %1, 1                                                               ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_6.while.exit.0:
  ret i32 %2                                                                       ; inst 15
}

define i32 @pingMutual(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = sub i32 %0, 1                                                               ; inst 5
  %4 = add i32 %1, 1                                                               ; inst 6
  %5 = call i32 @pongMutual(i32 %3, i32 %4)                                        ; inst 7
  ret i32 %5                                                                       ; inst 8
}

define i32 @pongMutual(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = sub i32 %0, 1                                                               ; inst 5
  %4 = add i32 %1, 2                                                               ; inst 6
  %5 = call i32 @pingMutual(i32 %3, i32 %4)                                        ; inst 7
  ret i32 %5                                                                       ; inst 8
}

define i32 @pingPongMutual(i32 %0, i1 %1) {
_0.entry.0:
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 1
_1.if.then.0:
  %2 = call i32 @pingMutual(i32 %0, i32 0)                                         ; inst 2
  ret i32 %2                                                                       ; inst 3
_2.if.else.0:
  %3 = call i32 @pongMutual(i32 %0, i32 0)                                         ; inst 4
  ret i32 %3                                                                       ; inst 5
_3.if.exit.0:
  unreachable                                                                      ; inst 6
}

define i32 @stateMachineA(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = srem i32 %0, 3                                                              ; inst 5
  %4 = icmp eq i32 %3, 0                                                           ; inst 6
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  %5 = sub i32 %0, 1                                                               ; inst 8
  %6 = add i32 %1, 10                                                              ; inst 9
  %7 = call i32 @stateMachineB(i32 %5, i32 %6)                                     ; inst 10
  ret i32 %7                                                                       ; inst 11
_5.if.else.1:
  %8 = sub i32 %0, 1                                                               ; inst 12
  %9 = add i32 %1, 1                                                               ; inst 13
  %10 = call i32 @stateMachineC(i32 %8, i32 %9)                                    ; inst 14
  ret i32 %10                                                                      ; inst 15
_6.if.exit.1:
  unreachable                                                                      ; inst 16
}

define i32 @stateMachineB(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = srem i32 %0, 2                                                              ; inst 5
  %4 = icmp eq i32 %3, 0                                                           ; inst 6
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  %5 = sub i32 %0, 1                                                               ; inst 8
  %6 = add i32 %1, 5                                                               ; inst 9
  %7 = call i32 @stateMachineC(i32 %5, i32 %6)                                     ; inst 10
  ret i32 %7                                                                       ; inst 11
_5.if.else.1:
  %8 = sub i32 %0, 1                                                               ; inst 12
  %9 = add i32 %1, 2                                                               ; inst 13
  %10 = call i32 @stateMachineA(i32 %8, i32 %9)                                    ; inst 14
  ret i32 %10                                                                      ; inst 15
_6.if.exit.1:
  unreachable                                                                      ; inst 16
}

define i32 @stateMachineC(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %0, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = srem i32 %0, 5                                                              ; inst 5
  %4 = icmp eq i32 %3, 0                                                           ; inst 6
  br i1 %4, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  %5 = sub i32 %0, 1                                                               ; inst 8
  %6 = add i32 %1, 20                                                              ; inst 9
  %7 = call i32 @stateMachineA(i32 %5, i32 %6)                                     ; inst 10
  ret i32 %7                                                                       ; inst 11
_5.if.else.1:
  %8 = sub i32 %0, 1                                                               ; inst 12
  %9 = add i32 %1, 3                                                               ; inst 13
  %10 = call i32 @stateMachineB(i32 %8, i32 %9)                                    ; inst 14
  ret i32 %10                                                                      ; inst 15
_6.if.exit.1:
  unreachable                                                                      ; inst 16
}

define void @testTreeTraversalAlgorithms() {
_0.entry.0:
  %0 = alloca [127 x i32]                                                          ; inst 1
  %1 = alloca [127 x i32]                                                          ; inst 2
  %2 = alloca [127 x i32]                                                          ; inst 3
  %3 = alloca [127 x i32]                                                          ; inst 4
  %4 = alloca [127 x i32]                                                          ; inst 5
  %5 = alloca [127 x i32]                                                          ; inst 6
  call void @printlnInt(i32 1405)                                                  ; inst 7
  %6 = alloca [127 x i32]                                                          ; inst 8
  %7 = getelementptr [127 x i32], [127 x i32]* %6, i32 0, i32 0                    ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 11
  %9 = icmp slt i32 %8, 127                                                        ; inst 12
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 13
_2.array.body.0:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 14
  store i32 0, i32* %10                                                            ; inst 15
  %11 = add i32 %8, 1                                                              ; inst 16
  br label %_1.array.cond.0                                                        ; inst 17
_3.array.exit.0:
  call void @memcpy([127 x i32]* %0, [127 x i32]* %6, i64 508)                     ; inst 18
  call void @buildBinaryTree([127 x i32]* %0)                                      ; inst 19
  call void @memcpy([127 x i32]* %1, [127 x i32]* %6, i64 508)                     ; inst 20
  %12 = call i32 @preorderTraversal([127 x i32]* %1, i64 0)                        ; inst 21
  call void @printlnInt(i32 %12)                                                   ; inst 22
  call void @memcpy([127 x i32]* %2, [127 x i32]* %6, i64 508)                     ; inst 23
  %13 = call i32 @inorderTraversal([127 x i32]* %2, i64 0)                         ; inst 24
  call void @printlnInt(i32 %13)                                                   ; inst 25
  call void @memcpy([127 x i32]* %3, [127 x i32]* %6, i64 508)                     ; inst 26
  %14 = call i32 @postorderTraversal([127 x i32]* %3, i64 0)                       ; inst 27
  call void @printlnInt(i32 %14)                                                   ; inst 28
  call void @memcpy([127 x i32]* %4, [127 x i32]* %6, i64 508)                     ; inst 29
  %15 = call i32 @recursiveTreeSearch([127 x i32]* %4, i64 0, i32 50)              ; inst 30
  call void @printlnInt(i32 %15)                                                   ; inst 31
  call void @memcpy([127 x i32]* %5, [127 x i32]* %6, i64 508)                     ; inst 32
  %16 = call i32 @calculateTreeDepth([127 x i32]* %5, i64 0)                       ; inst 33
  call void @printlnInt(i32 %16)                                                   ; inst 34
  call void @printlnInt(i32 1406)                                                  ; inst 35
  ret void                                                                         ; inst 36
}

define void @buildBinaryTree([127 x i32]* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%7, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 127                                                        ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %3 = sext i32 %1 to i64                                                          ; inst 5
  %4 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %3                   ; inst 6
  %5 = add i32 %1, 1                                                               ; inst 7
  %6 = mul i32 %5, 10                                                              ; inst 8
  store i32 %6, i32* %4                                                            ; inst 9
  %7 = add i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret void                                                                         ; inst 12
}

define i32 @preorderTraversal([127 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca [127 x i32]                                                          ; inst 1
  %3 = alloca [127 x i32]                                                          ; inst 2
  %4 = icmp uge i64 %1, 127                                                        ; inst 3
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 4
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  %5 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp eq i32 %6, 0                                                           ; inst 8
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %8 = phi i1 [1, %_1.lazy.then.0], [%7, %_2.lazy.else.0]                          ; inst 10
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  ret i32 0                                                                        ; inst 12
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 13
_6.if.exit.0:
  %9 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                   ; inst 14
  %10 = load i32, i32* %9                                                          ; inst 15
  %11 = mul i64 2, %1                                                              ; inst 16
  %12 = add i64 %11, 1                                                             ; inst 17
  call void @memcpy([127 x i32]* %2, [127 x i32]* %0, i64 508)                     ; inst 18
  %13 = call i32 @preorderTraversal([127 x i32]* %2, i64 %12)                      ; inst 19
  %14 = mul i64 2, %1                                                              ; inst 20
  %15 = add i64 %14, 2                                                             ; inst 21
  call void @memcpy([127 x i32]* %3, [127 x i32]* %0, i64 508)                     ; inst 22
  %16 = call i32 @preorderTraversal([127 x i32]* %3, i64 %15)                      ; inst 23
  %17 = add i32 %10, %13                                                           ; inst 24
  %18 = add i32 %17, %16                                                           ; inst 25
  ret i32 %18                                                                      ; inst 26
}

define i32 @inorderTraversal([127 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca [127 x i32]                                                          ; inst 1
  %3 = alloca [127 x i32]                                                          ; inst 2
  %4 = icmp uge i64 %1, 127                                                        ; inst 3
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 4
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  %5 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp eq i32 %6, 0                                                           ; inst 8
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %8 = phi i1 [1, %_1.lazy.then.0], [%7, %_2.lazy.else.0]                          ; inst 10
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  ret i32 0                                                                        ; inst 12
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 13
_6.if.exit.0:
  %9 = mul i64 2, %1                                                               ; inst 14
  %10 = add i64 %9, 1                                                              ; inst 15
  call void @memcpy([127 x i32]* %2, [127 x i32]* %0, i64 508)                     ; inst 16
  %11 = call i32 @inorderTraversal([127 x i32]* %2, i64 %10)                       ; inst 17
  %12 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                  ; inst 18
  %13 = load i32, i32* %12                                                         ; inst 19
  %14 = mul i64 2, %1                                                              ; inst 20
  %15 = add i64 %14, 2                                                             ; inst 21
  call void @memcpy([127 x i32]* %3, [127 x i32]* %0, i64 508)                     ; inst 22
  %16 = call i32 @inorderTraversal([127 x i32]* %3, i64 %15)                       ; inst 23
  %17 = add i32 %11, %13                                                           ; inst 24
  %18 = add i32 %17, %16                                                           ; inst 25
  ret i32 %18                                                                      ; inst 26
}

define i32 @postorderTraversal([127 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca [127 x i32]                                                          ; inst 1
  %3 = alloca [127 x i32]                                                          ; inst 2
  %4 = icmp uge i64 %1, 127                                                        ; inst 3
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 4
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  %5 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp eq i32 %6, 0                                                           ; inst 8
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %8 = phi i1 [1, %_1.lazy.then.0], [%7, %_2.lazy.else.0]                          ; inst 10
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  ret i32 0                                                                        ; inst 12
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 13
_6.if.exit.0:
  %9 = mul i64 2, %1                                                               ; inst 14
  %10 = add i64 %9, 1                                                              ; inst 15
  call void @memcpy([127 x i32]* %2, [127 x i32]* %0, i64 508)                     ; inst 16
  %11 = call i32 @postorderTraversal([127 x i32]* %2, i64 %10)                     ; inst 17
  %12 = mul i64 2, %1                                                              ; inst 18
  %13 = add i64 %12, 2                                                             ; inst 19
  call void @memcpy([127 x i32]* %3, [127 x i32]* %0, i64 508)                     ; inst 20
  %14 = call i32 @postorderTraversal([127 x i32]* %3, i64 %13)                     ; inst 21
  %15 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                  ; inst 22
  %16 = load i32, i32* %15                                                         ; inst 23
  %17 = add i32 %11, %14                                                           ; inst 24
  %18 = add i32 %17, %16                                                           ; inst 25
  ret i32 %18                                                                      ; inst 26
}

define i32 @recursiveTreeSearch([127 x i32]* %0, i64 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [127 x i32]                                                          ; inst 1
  %4 = alloca [127 x i32]                                                          ; inst 2
  %5 = icmp uge i64 %1, 127                                                        ; inst 3
  br i1 %5, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 4
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  %6 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                   ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = icmp eq i32 %7, 0                                                           ; inst 8
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %9 = phi i1 [1, %_1.lazy.then.0], [%8, %_2.lazy.else.0]                          ; inst 10
  br i1 %9, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  ret i32 0                                                                        ; inst 12
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 13
_6.if.exit.0:
  %10 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                  ; inst 14
  %11 = load i32, i32* %10                                                         ; inst 15
  %12 = icmp eq i32 %11, %2                                                        ; inst 16
  br i1 %12, label %_7.if.then.1, label %_8.if.else.1                              ; inst 17
_7.if.then.1:
  ret i32 1                                                                        ; inst 18
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 19
_9.if.exit.1:
  %13 = mul i64 2, %1                                                              ; inst 20
  %14 = add i64 %13, 1                                                             ; inst 21
  call void @memcpy([127 x i32]* %3, [127 x i32]* %0, i64 508)                     ; inst 22
  %15 = call i32 @recursiveTreeSearch([127 x i32]* %3, i64 %14, i32 %2)            ; inst 23
  %16 = icmp eq i32 %15, 1                                                         ; inst 24
  br i1 %16, label %_10.if.then.2, label %_11.if.else.2                            ; inst 25
_10.if.then.2:
  ret i32 1                                                                        ; inst 26
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 27
_12.if.exit.2:
  %17 = mul i64 2, %1                                                              ; inst 28
  %18 = add i64 %17, 2                                                             ; inst 29
  call void @memcpy([127 x i32]* %4, [127 x i32]* %0, i64 508)                     ; inst 30
  %19 = call i32 @recursiveTreeSearch([127 x i32]* %4, i64 %18, i32 %2)            ; inst 31
  ret i32 %19                                                                      ; inst 32
}

define i32 @calculateTreeDepth([127 x i32]* %0, i64 %1) {
_0.entry.0:
  %2 = alloca [127 x i32]                                                          ; inst 1
  %3 = alloca [127 x i32]                                                          ; inst 2
  %4 = icmp uge i64 %1, 127                                                        ; inst 3
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 4
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  %5 = getelementptr [127 x i32], [127 x i32]* %0, i32 0, i64 %1                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp eq i32 %6, 0                                                           ; inst 8
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %8 = phi i1 [1, %_1.lazy.then.0], [%7, %_2.lazy.else.0]                          ; inst 10
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  ret i32 0                                                                        ; inst 12
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 13
_6.if.exit.0:
  %9 = mul i64 2, %1                                                               ; inst 14
  %10 = add i64 %9, 1                                                              ; inst 15
  call void @memcpy([127 x i32]* %2, [127 x i32]* %0, i64 508)                     ; inst 16
  %11 = call i32 @calculateTreeDepth([127 x i32]* %2, i64 %10)                     ; inst 17
  %12 = mul i64 2, %1                                                              ; inst 18
  %13 = add i64 %12, 2                                                             ; inst 19
  call void @memcpy([127 x i32]* %3, [127 x i32]* %0, i64 508)                     ; inst 20
  %14 = call i32 @calculateTreeDepth([127 x i32]* %3, i64 %13)                     ; inst 21
  %15 = icmp sgt i32 %11, %14                                                      ; inst 22
  br i1 %15, label %_7.if.then.1, label %_8.if.else.1                              ; inst 23
_7.if.then.1:
  %16 = add i32 %11, 1                                                             ; inst 24
  br label %_9.if.exit.1                                                           ; inst 25
_8.if.else.1:
  %17 = add i32 %14, 1                                                             ; inst 26
  br label %_9.if.exit.1                                                           ; inst 27
_9.if.exit.1:
  %18 = phi i32 [%16, %_7.if.then.1], [%17, %_8.if.else.1]                         ; inst 28
  ret i32 %18                                                                      ; inst 29
}

define void @testDivideAndConquerAlgorithms() {
_0.entry.0:
  %0 = alloca [100 x i32]                                                          ; inst 1
  call void @printlnInt(i32 1407)                                                  ; inst 2
  %1 = alloca [100 x i32]                                                          ; inst 3
  %2 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i32 0                    ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 6
  %4 = icmp slt i32 %3, 100                                                        ; inst 7
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 9
  store i32 0, i32* %5                                                             ; inst 10
  %6 = add i32 %3, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  call void @memcpy([100 x i32]* %0, [100 x i32]* %1, i64 400)                     ; inst 13
  call void @initializeRandomArray([100 x i32]* %0, i64 100)                       ; inst 14
  %7 = call i32 @recursiveMergeSort([100 x i32]* %1, i64 0, i64 99)                ; inst 15
  call void @printlnInt(i32 %7)                                                    ; inst 16
  %8 = call i32 @recursiveBinarySearch([100 x i32]* %1, i64 0, i64 99, i32 42)     ; inst 17
  call void @printlnInt(i32 %8)                                                    ; inst 18
  %9 = call i32 @recursiveQuickSelect([100 x i32]* %1, i64 0, i64 99, i64 50)      ; inst 19
  call void @printlnInt(i32 %9)                                                    ; inst 20
  %10 = call i32 @testRecursiveMatrixMultiplication()                              ; inst 21
  call void @printlnInt(i32 %10)                                                   ; inst 22
  call void @printlnInt(i32 1408)                                                  ; inst 23
  ret void                                                                         ; inst 24
}

define void @initializeRandomArray([100 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 2
  %3 = phi i32 [12345, %_0.entry.0], [%10, %_5.if.exit.0]                          ; inst 3
  %4 = icmp ult i64 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = mul i32 %3, 1103                                                            ; inst 6
  %6 = add i32 %5, 4721                                                            ; inst 7
  %7 = srem i32 %6, 1048583                                                        ; inst 8
  %8 = icmp slt i32 %7, 0                                                          ; inst 9
  br i1 %8, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %9 = sub i32 0, %7                                                               ; inst 11
  br label %_5.if.exit.0                                                           ; inst 12
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 13
_5.if.exit.0:
  %10 = phi i32 [%9, %_3.if.then.0], [%7, %_4.if.else.0]                           ; inst 14
  %11 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                  ; inst 15
  %12 = srem i32 %10, 1000                                                         ; inst 16
  store i32 %12, i32* %11                                                          ; inst 17
  %13 = add i64 %2, 1                                                              ; inst 18
  br label %_1.while.cond.0                                                        ; inst 19
_6.while.exit.0:
  ret void                                                                         ; inst 20
}

define i32 @recursiveMergeSort([100 x i32]* %0, i64 %1, i64 %2) {
_0.entry.0:
  %3 = icmp uge i64 %1, %2                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = sub i64 %2, %1                                                              ; inst 5
  %5 = udiv i64 %4, 2                                                              ; inst 6
  %6 = add i64 %1, %5                                                              ; inst 7
  %7 = call i32 @recursiveMergeSort([100 x i32]* %0, i64 %1, i64 %6)               ; inst 8
  %8 = add i64 %6, 1                                                               ; inst 9
  %9 = call i32 @recursiveMergeSort([100 x i32]* %0, i64 %8, i64 %2)               ; inst 10
  %10 = call i32 @recursiveMerge([100 x i32]* %0, i64 %1, i64 %6, i64 %2)          ; inst 11
  %11 = add i32 %7, %9                                                             ; inst 12
  %12 = add i32 %11, %10                                                           ; inst 13
  ret i32 %12                                                                      ; inst 14
}

define i32 @recursiveMerge([100 x i32]* %0, i64 %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = sub i64 %2, %1                                                              ; inst 1
  %5 = add i64 %4, 1                                                               ; inst 2
  %6 = sub i64 %3, %2                                                              ; inst 3
  %7 = alloca [50 x i32]                                                           ; inst 4
  %8 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i32 0                      ; inst 5
  br label %_1.array.cond.0                                                        ; inst 6
_1.array.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%12, %_2.array.body.0]                           ; inst 7
  %10 = icmp slt i32 %9, 50                                                        ; inst 8
  br i1 %10, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 9
_2.array.body.0:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 10
  store i32 0, i32* %11                                                            ; inst 11
  %12 = add i32 %9, 1                                                              ; inst 12
  br label %_1.array.cond.0                                                        ; inst 13
_3.array.exit.0:
  %13 = alloca [50 x i32]                                                          ; inst 14
  %14 = getelementptr [50 x i32], [50 x i32]* %13, i32 0, i32 0                    ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %15 = phi i32 [0, %_3.array.exit.0], [%18, %_5.array.body.1]                     ; inst 17
  %16 = icmp slt i32 %15, 50                                                       ; inst 18
  br i1 %16, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 20
  store i32 0, i32* %17                                                            ; inst 21
  %18 = add i32 %15, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %19 = phi i64 [0, %_6.array.exit.1], [%25, %_8.while.body.0]                     ; inst 25
  %20 = icmp ult i64 %19, %5                                                       ; inst 26
  br i1 %20, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 27
_8.while.body.0:
  %21 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i64 %19                   ; inst 28
  %22 = add i64 %1, %19                                                            ; inst 29
  %23 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %22                 ; inst 30
  %24 = load i32, i32* %23                                                         ; inst 31
  store i32 %24, i32* %21                                                          ; inst 32
  %25 = add i64 %19, 1                                                             ; inst 33
  br label %_7.while.cond.0                                                        ; inst 34
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 35
_10.while.cond.1:
  %26 = phi i64 [0, %_9.while.exit.0], [%33, %_11.while.body.1]                    ; inst 36
  %27 = icmp ult i64 %26, %6                                                       ; inst 37
  br i1 %27, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 38
_11.while.body.1:
  %28 = getelementptr [50 x i32], [50 x i32]* %13, i32 0, i64 %26                  ; inst 39
  %29 = add i64 %2, 1                                                              ; inst 40
  %30 = add i64 %29, %26                                                           ; inst 41
  %31 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %30                 ; inst 42
  %32 = load i32, i32* %31                                                         ; inst 43
  store i32 %32, i32* %28                                                          ; inst 44
  %33 = add i64 %26, 1                                                             ; inst 45
  br label %_10.while.cond.1                                                       ; inst 46
_12.while.exit.1:
  br label %_13.while.cond.2                                                       ; inst 47
_13.while.cond.2:
  %34 = phi i32 [0, %_12.while.exit.1], [%41, %_20.if.exit.0]                      ; inst 48
  %35 = phi i64 [%1, %_12.while.exit.1], [%57, %_20.if.exit.0]                     ; inst 49
  %36 = phi i64 [0, %_12.while.exit.1], [%55, %_20.if.exit.0]                      ; inst 50
  %37 = phi i64 [0, %_12.while.exit.1], [%56, %_20.if.exit.0]                      ; inst 51
  %38 = icmp ult i64 %37, %5                                                       ; inst 52
  br i1 %38, label %_14.lazy.then.0, label %_15.lazy.else.0                        ; inst 53
_14.lazy.then.0:
  %39 = icmp ult i64 %36, %6                                                       ; inst 54
  br label %_16.lazy.exit.0                                                        ; inst 55
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 56
_16.lazy.exit.0:
  %40 = phi i1 [%39, %_14.lazy.then.0], [0, %_15.lazy.else.0]                      ; inst 57
  br i1 %40, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 58
_17.while.body.2:
  %41 = add i32 %34, 1                                                             ; inst 59
  %42 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i64 %37                   ; inst 60
  %43 = load i32, i32* %42                                                         ; inst 61
  %44 = getelementptr [50 x i32], [50 x i32]* %13, i32 0, i64 %36                  ; inst 62
  %45 = load i32, i32* %44                                                         ; inst 63
  %46 = icmp sle i32 %43, %45                                                      ; inst 64
  br i1 %46, label %_18.if.then.0, label %_19.if.else.0                            ; inst 65
_18.if.then.0:
  %47 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %35                 ; inst 66
  %48 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i64 %37                   ; inst 67
  %49 = load i32, i32* %48                                                         ; inst 68
  store i32 %49, i32* %47                                                          ; inst 69
  %50 = add i64 %37, 1                                                             ; inst 70
  br label %_20.if.exit.0                                                          ; inst 71
_19.if.else.0:
  %51 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %35                 ; inst 72
  %52 = getelementptr [50 x i32], [50 x i32]* %13, i32 0, i64 %36                  ; inst 73
  %53 = load i32, i32* %52                                                         ; inst 74
  store i32 %53, i32* %51                                                          ; inst 75
  %54 = add i64 %36, 1                                                             ; inst 76
  br label %_20.if.exit.0                                                          ; inst 77
_20.if.exit.0:
  %55 = phi i64 [%36, %_18.if.then.0], [%54, %_19.if.else.0]                       ; inst 78
  %56 = phi i64 [%50, %_18.if.then.0], [%37, %_19.if.else.0]                       ; inst 79
  %57 = add i64 %35, 1                                                             ; inst 80
  br label %_13.while.cond.2                                                       ; inst 81
_21.while.exit.2:
  br label %_22.while.cond.3                                                       ; inst 82
_22.while.cond.3:
  %58 = phi i64 [%35, %_21.while.exit.2], [%65, %_23.while.body.3]                 ; inst 83
  %59 = phi i64 [%37, %_21.while.exit.2], [%64, %_23.while.body.3]                 ; inst 84
  %60 = icmp ult i64 %59, %5                                                       ; inst 85
  br i1 %60, label %_23.while.body.3, label %_24.while.exit.3                      ; inst 86
_23.while.body.3:
  %61 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %58                 ; inst 87
  %62 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i64 %59                   ; inst 88
  %63 = load i32, i32* %62                                                         ; inst 89
  store i32 %63, i32* %61                                                          ; inst 90
  %64 = add i64 %59, 1                                                             ; inst 91
  %65 = add i64 %58, 1                                                             ; inst 92
  br label %_22.while.cond.3                                                       ; inst 93
_24.while.exit.3:
  br label %_25.while.cond.4                                                       ; inst 94
_25.while.cond.4:
  %66 = phi i64 [%58, %_24.while.exit.3], [%73, %_26.while.body.4]                 ; inst 95
  %67 = phi i64 [%36, %_24.while.exit.3], [%72, %_26.while.body.4]                 ; inst 96
  %68 = icmp ult i64 %67, %6                                                       ; inst 97
  br i1 %68, label %_26.while.body.4, label %_27.while.exit.4                      ; inst 98
_26.while.body.4:
  %69 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %66                 ; inst 99
  %70 = getelementptr [50 x i32], [50 x i32]* %13, i32 0, i64 %67                  ; inst 100
  %71 = load i32, i32* %70                                                         ; inst 101
  store i32 %71, i32* %69                                                          ; inst 102
  %72 = add i64 %67, 1                                                             ; inst 103
  %73 = add i64 %66, 1                                                             ; inst 104
  br label %_25.while.cond.4                                                       ; inst 105
_27.while.exit.4:
  ret i32 %34                                                                      ; inst 106
}

define i32 @recursiveBinarySearch([100 x i32]* %0, i64 %1, i64 %2, i32 %3) {
_0.entry.0:
  %4 = icmp ugt i64 %1, %2                                                         ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 -1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %5 = sub i64 %2, %1                                                              ; inst 5
  %6 = udiv i64 %5, 2                                                              ; inst 6
  %7 = add i64 %1, %6                                                              ; inst 7
  %8 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %7                   ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = icmp eq i32 %9, %3                                                         ; inst 10
  br i1 %10, label %_4.if.then.1, label %_5.if.else.1                              ; inst 11
_4.if.then.1:
  %11 = trunc i64 %7 to i32                                                        ; inst 12
  ret i32 %11                                                                      ; inst 13
_5.if.else.1:
  %12 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %7                  ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = icmp sgt i32 %13, %3                                                       ; inst 16
  br i1 %14, label %_6.if.then.2, label %_7.if.else.2                              ; inst 17
_6.if.then.2:
  %15 = sub i64 %7, 1                                                              ; inst 18
  %16 = call i32 @recursiveBinarySearch([100 x i32]* %0, i64 %1, i64 %15, i32 %3)  ; inst 19
  ret i32 %16                                                                      ; inst 20
_7.if.else.2:
  %17 = add i64 %7, 1                                                              ; inst 21
  %18 = call i32 @recursiveBinarySearch([100 x i32]* %0, i64 %17, i64 %2, i32 %3)  ; inst 22
  ret i32 %18                                                                      ; inst 23
_8.if.exit.2:
  br label %_9.if.exit.1                                                           ; inst 24
_9.if.exit.1:
  unreachable                                                                      ; inst 25
}

define i32 @recursiveQuickSelect([100 x i32]* %0, i64 %1, i64 %2, i64 %3) {
_0.entry.0:
  %4 = icmp eq i64 %1, %2                                                          ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %1                   ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  ret i32 %6                                                                       ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %7 = call i64 @recursivePartition([100 x i32]* %0, i64 %1, i64 %2)               ; inst 7
  %8 = icmp eq i64 %3, %7                                                          ; inst 8
  br i1 %8, label %_4.if.then.1, label %_5.if.else.1                               ; inst 9
_4.if.then.1:
  %9 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %3                   ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  ret i32 %10                                                                      ; inst 12
_5.if.else.1:
  %11 = icmp ult i64 %3, %7                                                        ; inst 13
  br i1 %11, label %_6.if.then.2, label %_7.if.else.2                              ; inst 14
_6.if.then.2:
  %12 = sub i64 %7, 1                                                              ; inst 15
  %13 = call i32 @recursiveQuickSelect([100 x i32]* %0, i64 %1, i64 %12, i64 %3)   ; inst 16
  ret i32 %13                                                                      ; inst 17
_7.if.else.2:
  %14 = add i64 %7, 1                                                              ; inst 18
  %15 = call i32 @recursiveQuickSelect([100 x i32]* %0, i64 %14, i64 %2, i64 %3)   ; inst 19
  ret i32 %15                                                                      ; inst 20
_8.if.exit.2:
  br label %_9.if.exit.1                                                           ; inst 21
_9.if.exit.1:
  unreachable                                                                      ; inst 22
}

define i64 @recursivePartition([100 x i32]* %0, i64 %1, i64 %2) {
_0.entry.0:
  %3 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                   ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %5 = phi i64 [%1, %_0.entry.0], [%21, %_5.if.exit.0]                             ; inst 4
  %6 = phi i64 [%1, %_0.entry.0], [%20, %_5.if.exit.0]                             ; inst 5
  %7 = icmp ult i64 %5, %2                                                         ; inst 6
  br i1 %7, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 7
_2.while.body.0:
  %8 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %5                   ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = icmp sle i32 %9, %4                                                        ; inst 10
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 11
_3.if.then.0:
  %11 = add i64 %6, 1                                                              ; inst 12
  %12 = sub i64 %11, 1                                                             ; inst 13
  %13 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %12                 ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = sub i64 %11, 1                                                             ; inst 16
  %16 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %15                 ; inst 17
  %17 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %5                  ; inst 18
  %18 = load i32, i32* %17                                                         ; inst 19
  store i32 %18, i32* %16                                                          ; inst 20
  %19 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %5                  ; inst 21
  store i32 %14, i32* %19                                                          ; inst 22
  br label %_5.if.exit.0                                                           ; inst 23
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 24
_5.if.exit.0:
  %20 = phi i64 [%11, %_3.if.then.0], [%6, %_4.if.else.0]                          ; inst 25
  %21 = add i64 %5, 1                                                              ; inst 26
  br label %_1.while.cond.0                                                        ; inst 27
_6.while.exit.0:
  %22 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %6                  ; inst 28
  %23 = load i32, i32* %22                                                         ; inst 29
  %24 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %6                  ; inst 30
  %25 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                  ; inst 31
  %26 = load i32, i32* %25                                                         ; inst 32
  store i32 %26, i32* %24                                                          ; inst 33
  %27 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %2                  ; inst 34
  store i32 %23, i32* %27                                                          ; inst 35
  ret i64 %6                                                                       ; inst 36
}

define i32 @testRecursiveMatrixMultiplication() {
_0.entry.0:
  %0 = alloca [16 x i32]                                                           ; inst 1
  %1 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 16                                                         ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [16 x i32]                                                           ; inst 11
  %7 = getelementptr [16 x i32], [16 x i32]* %6, i32 0, i32 0                      ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 16                                                         ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca [16 x i32]                                                          ; inst 21
  %13 = getelementptr [16 x i32], [16 x i32]* %12, i32 0, i32 0                    ; inst 22
  br label %_7.array.cond.2                                                        ; inst 23
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 24
  %15 = icmp slt i32 %14, 16                                                       ; inst 25
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 26
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 27
  store i32 0, i32* %16                                                            ; inst 28
  %17 = add i32 %14, 1                                                             ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_9.array.exit.2:
  call void @initializeMatrix([16 x i32]* %0, i64 4)                               ; inst 31
  call void @initializeMatrix([16 x i32]* %6, i64 4)                               ; inst 32
  call void @recursiveMatrixMultiply([16 x i32]* %0, [16 x i32]* %6, [16 x i32]* %12, i64 4) ; inst 33
  br label %_10.while.cond.0                                                       ; inst 34
_10.while.cond.0:
  %18 = phi i64 [0, %_9.array.exit.2], [%24, %_11.while.body.0]                    ; inst 35
  %19 = phi i32 [0, %_9.array.exit.2], [%23, %_11.while.body.0]                    ; inst 36
  %20 = icmp ult i64 %18, 16                                                       ; inst 37
  br i1 %20, label %_11.while.body.0, label %_12.while.exit.0                      ; inst 38
_11.while.body.0:
  %21 = getelementptr [16 x i32], [16 x i32]* %12, i32 0, i64 %18                  ; inst 39
  %22 = load i32, i32* %21                                                         ; inst 40
  %23 = add i32 %19, %22                                                           ; inst 41
  %24 = add i64 %18, 1                                                             ; inst 42
  br label %_10.while.cond.0                                                       ; inst 43
_12.while.exit.0:
  ret i32 %19                                                                      ; inst 44
}

define void @initializeMatrix([16 x i32]* %0, i64 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i64 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %3 = mul i64 %1, %1                                                              ; inst 3
  %4 = icmp ult i64 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %2                     ; inst 6
  %6 = urem i64 %2, 10                                                             ; inst 7
  %7 = trunc i64 %6 to i32                                                         ; inst 8
  %8 = add i32 %7, 1                                                               ; inst 9
  store i32 %8, i32* %5                                                            ; inst 10
  %9 = add i64 %2, 1                                                               ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  ret void                                                                         ; inst 13
}

define void @recursiveMatrixMultiply([16 x i32]* %0, [16 x i32]* %1, [16 x i32]* %2, i64 %3) {
_0.entry.0:
  %4 = icmp eq i64 %3, 1                                                           ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %5 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 0                      ; inst 3
  %6 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 0                      ; inst 4
  %7 = load i32, i32* %6                                                           ; inst 5
  %8 = getelementptr [16 x i32], [16 x i32]* %1, i32 0, i64 0                      ; inst 6
  %9 = load i32, i32* %8                                                           ; inst 7
  %10 = mul i32 %7, %9                                                             ; inst 8
  store i32 %10, i32* %5                                                           ; inst 9
  ret void                                                                         ; inst 10
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 11
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %11 = phi i64 [0, %_3.if.exit.0], [%39, %_11.while.exit.1]                       ; inst 13
  %12 = icmp ult i64 %11, %3                                                       ; inst 14
  br i1 %12, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 15
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 16
_6.while.cond.1:
  %13 = phi i64 [0, %_5.while.body.0], [%38, %_10.while.exit.2]                    ; inst 17
  %14 = icmp ult i64 %13, %3                                                       ; inst 18
  br i1 %14, label %_7.while.body.1, label %_11.while.exit.1                       ; inst 19
_7.while.body.1:
  %15 = mul i64 %11, %3                                                            ; inst 20
  %16 = add i64 %15, %13                                                           ; inst 21
  %17 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 %16                   ; inst 22
  store i32 0, i32* %17                                                            ; inst 23
  br label %_8.while.cond.2                                                        ; inst 24
_8.while.cond.2:
  %18 = phi i64 [0, %_7.while.body.1], [%37, %_9.while.body.2]                     ; inst 25
  %19 = icmp ult i64 %18, %3                                                       ; inst 26
  br i1 %19, label %_9.while.body.2, label %_10.while.exit.2                       ; inst 27
_9.while.body.2:
  %20 = mul i64 %11, %3                                                            ; inst 28
  %21 = add i64 %20, %13                                                           ; inst 29
  %22 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 %21                   ; inst 30
  %23 = mul i64 %11, %3                                                            ; inst 31
  %24 = add i64 %23, %13                                                           ; inst 32
  %25 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 %24                   ; inst 33
  %26 = load i32, i32* %25                                                         ; inst 34
  %27 = mul i64 %11, %3                                                            ; inst 35
  %28 = add i64 %27, %18                                                           ; inst 36
  %29 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %28                   ; inst 37
  %30 = load i32, i32* %29                                                         ; inst 38
  %31 = mul i64 %18, %3                                                            ; inst 39
  %32 = add i64 %31, %13                                                           ; inst 40
  %33 = getelementptr [16 x i32], [16 x i32]* %1, i32 0, i64 %32                   ; inst 41
  %34 = load i32, i32* %33                                                         ; inst 42
  %35 = mul i32 %30, %34                                                           ; inst 43
  %36 = add i32 %26, %35                                                           ; inst 44
  store i32 %36, i32* %22                                                          ; inst 45
  %37 = add i64 %18, 1                                                             ; inst 46
  br label %_8.while.cond.2                                                        ; inst 47
_10.while.exit.2:
  %38 = add i64 %13, 1                                                             ; inst 48
  br label %_6.while.cond.1                                                        ; inst 49
_11.while.exit.1:
  %39 = add i64 %11, 1                                                             ; inst 50
  br label %_4.while.cond.0                                                        ; inst 51
_12.while.exit.0:
  ret void                                                                         ; inst 52
}

define void @testRecursiveMathematicalComputations() {
_0.entry.0:
  call void @printlnInt(i32 1409)                                                  ; inst 1
  %0 = call i32 @recursiveGCD(i32 1071, i32 462)                                   ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @recursiveFibonacci(i32 25)                                        ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @recursiveCombination(i32 10, i32 5)                               ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @recursiveSumOfDivisors(i32 60)                                    ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  %4 = call i32 @recursiveDigitSum(i32 123456789)                                  ; inst 10
  call void @printlnInt(i32 %4)                                                    ; inst 11
  call void @printlnInt(i32 1410)                                                  ; inst 12
  ret void                                                                         ; inst 13
}

define i32 @recursiveGCD(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %0                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = srem i32 %0, %1                                                             ; inst 5
  %4 = call i32 @recursiveGCD(i32 %1, i32 %3)                                      ; inst 6
  ret i32 %4                                                                       ; inst 7
}

define i32 @recursiveFibonacci(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %0                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = sub i32 %0, 1                                                               ; inst 5
  %3 = call i32 @recursiveFibonacci(i32 %2)                                        ; inst 6
  %4 = sub i32 %0, 2                                                               ; inst 7
  %5 = call i32 @recursiveFibonacci(i32 %4)                                        ; inst 8
  %6 = add i32 %3, %5                                                              ; inst 9
  ret i32 %6                                                                       ; inst 10
}

define i32 @recursiveCombination(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %3 = icmp eq i32 %1, %0                                                          ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %4 = phi i1 [1, %_1.lazy.then.0], [%3, %_2.lazy.else.0]                          ; inst 6
  br i1 %4, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i32 1                                                                        ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %5 = icmp eq i32 %1, 1                                                           ; inst 10
  br i1 %5, label %_7.if.then.1, label %_8.if.else.1                               ; inst 11
_7.if.then.1:
  ret i32 %0                                                                       ; inst 12
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 13
_9.if.exit.1:
  %6 = sub i32 %0, 1                                                               ; inst 14
  %7 = sub i32 %1, 1                                                               ; inst 15
  %8 = call i32 @recursiveCombination(i32 %6, i32 %7)                              ; inst 16
  %9 = sub i32 %0, 1                                                               ; inst 17
  %10 = call i32 @recursiveCombination(i32 %9, i32 %1)                             ; inst 18
  %11 = add i32 %8, %10                                                            ; inst 19
  ret i32 %11                                                                      ; inst 20
}

define i32 @recursiveSumOfDivisors(i32 %0) {
_0.entry.0:
  %1 = call i32 @recursiveSumOfDivisorsHelper(i32 %0, i32 1, i32 0)                ; inst 1
  ret i32 %1                                                                       ; inst 2
}

define i32 @recursiveSumOfDivisorsHelper(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp sgt i32 %1, %0                                                         ; inst 1
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %2                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %4 = srem i32 %0, %1                                                             ; inst 5
  %5 = icmp eq i32 %4, 0                                                           ; inst 6
  br i1 %5, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  %6 = add i32 %1, 1                                                               ; inst 8
  %7 = add i32 %2, %1                                                              ; inst 9
  %8 = call i32 @recursiveSumOfDivisorsHelper(i32 %0, i32 %6, i32 %7)              ; inst 10
  ret i32 %8                                                                       ; inst 11
_5.if.else.1:
  %9 = add i32 %1, 1                                                               ; inst 12
  %10 = call i32 @recursiveSumOfDivisorsHelper(i32 %0, i32 %9, i32 %2)             ; inst 13
  ret i32 %10                                                                      ; inst 14
_6.if.exit.1:
  unreachable                                                                      ; inst 15
}

define i32 @recursiveDigitSum(i32 %0) {
_0.entry.0:
  %1 = icmp slt i32 %0, 10                                                         ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %0                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = srem i32 %0, 10                                                             ; inst 5
  %3 = sdiv i32 %0, 10                                                             ; inst 6
  %4 = call i32 @recursiveDigitSum(i32 %3)                                         ; inst 7
  %5 = add i32 %2, %4                                                              ; inst 8
  ret i32 %5                                                                       ; inst 9
}

define i32 @recursiveArraySum([100 x i32]* %0, i64 %1, i64 %2) {
_0.entry.0:
  %3 = alloca [100 x i32]                                                          ; inst 1
  %4 = icmp uge i64 %1, %2                                                         ; inst 2
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i32 0                                                                        ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %1                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = add i64 %1, 1                                                               ; inst 8
  call void @memcpy([100 x i32]* %3, [100 x i32]* %0, i64 400)                     ; inst 9
  %8 = call i32 @recursiveArraySum([100 x i32]* %3, i64 %7, i64 %2)                ; inst 10
  %9 = add i32 %6, %8                                                              ; inst 11
  ret i32 %9                                                                       ; inst 12
}

define i32 @recursiveArrayMax([100 x i32]* %0, i64 %1, i64 %2, i32 %3) {
_0.entry.0:
  %4 = alloca [100 x i32]                                                          ; inst 1
  %5 = icmp uge i64 %1, %2                                                         ; inst 2
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i32 %3                                                                       ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %6 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %1                   ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = icmp sgt i32 %7, %3                                                         ; inst 8
  br i1 %8, label %_4.if.then.1, label %_5.if.else.1                               ; inst 9
_4.if.then.1:
  %9 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %1                   ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  br label %_6.if.exit.1                                                           ; inst 12
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 13
_6.if.exit.1:
  %11 = phi i32 [%10, %_4.if.then.1], [%3, %_5.if.else.1]                          ; inst 14
  %12 = add i64 %1, 1                                                              ; inst 15
  call void @memcpy([100 x i32]* %4, [100 x i32]* %0, i64 400)                     ; inst 16
  %13 = call i32 @recursiveArrayMax([100 x i32]* %4, i64 %12, i64 %2, i32 %11)     ; inst 17
  ret i32 %13                                                                      ; inst 18
}

define i32 @recursiveStringLength(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp slt i32 %0, 10                                                         ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = add i32 %1, 1                                                               ; inst 3
  ret i32 %3                                                                       ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %4 = sdiv i32 %0, 10                                                             ; inst 6
  %5 = add i32 %1, 1                                                               ; inst 7
  %6 = call i32 @recursiveStringLength(i32 %4, i32 %5)                             ; inst 8
  ret i32 %6                                                                       ; inst 9
}

define i32 @recursiveIsPalindrome(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %3, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  %4 = icmp eq i32 %1, %2                                                          ; inst 3
  br i1 %4, label %_2.if.then.1, label %_3.if.else.1                               ; inst 4
_2.if.then.1:
  ret i32 1                                                                        ; inst 5
_3.if.else.1:
  ret i32 0                                                                        ; inst 6
_4.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 7
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 8
_6.if.exit.0:
  %5 = phi i32 [%2, %_4.if.exit.1], [%2, %_5.if.else.0]                            ; inst 9
  %6 = phi i32 [%1, %_4.if.exit.1], [%1, %_5.if.else.0]                            ; inst 10
  %7 = phi i32 [%0, %_4.if.exit.1], [%0, %_5.if.else.0]                            ; inst 11
  %8 = sdiv i32 %7, 10                                                             ; inst 12
  %9 = mul i32 %6, 10                                                              ; inst 13
  %10 = srem i32 %7, 10                                                            ; inst 14
  %11 = add i32 %9, %10                                                            ; inst 15
  %12 = call i32 @recursiveIsPalindrome(i32 %8, i32 %11, i32 %5)                   ; inst 16
  ret i32 %12                                                                      ; inst 17
}

