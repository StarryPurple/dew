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


%ListNode = type { i32, i32 }
%HashEntry = type { i32, i32, i32, i1 }
%Stack = type { [500 x i32], i32, i32 }
%Queue = type { [500 x i32], i32, i32, i32, i32 }
%MemoryPool = type { [2000 x %ListNode], i32, i32, i32 }
%HashTable = type { [127 x i32], [1000 x %HashEntry], i32 }
%LinkedListManager = type { [10 x i32], i32, i32 }

define void @init_memory_pool(%MemoryPool* sret(%MemoryPool) %0) {
_0.entry.0:
  %1 = alloca %MemoryPool                                                          ; inst 1
  %2 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                    ; inst 2
  %3 = alloca %ListNode                                                            ; inst 3
  %4 = getelementptr %ListNode, %ListNode* %3, i32 0, i32 0                        ; inst 4
  store i32 0, i32* %4                                                             ; inst 5
  %5 = getelementptr %ListNode, %ListNode* %3, i32 0, i32 1                        ; inst 6
  store i32 -1, i32* %5                                                            ; inst 7
  %6 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %2, i32 0, i32 0      ; inst 8
  br label %_1.array.cond.0                                                        ; inst 9
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 10
  %8 = icmp slt i32 %7, 2000                                                       ; inst 11
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 12
_2.array.body.0:
  %9 = getelementptr %ListNode, %ListNode* %6, i32 %7                              ; inst 13
  call void @memcpy(%ListNode* %9, %ListNode* %3, i64 8)                           ; inst 14
  %10 = add i32 %7, 1                                                              ; inst 15
  br label %_1.array.cond.0                                                        ; inst 16
_3.array.exit.0:
  %11 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 1                   ; inst 17
  store i32 0, i32* %11                                                            ; inst 18
  %12 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 2                   ; inst 19
  store i32 0, i32* %12                                                            ; inst 20
  %13 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 3                   ; inst 21
  store i32 0, i32* %13                                                            ; inst 22
  br label %_4.while.cond.0                                                        ; inst 23
_4.while.cond.0:
  %14 = phi i64 [0, %_3.array.exit.0], [%21, %_5.while.body.0]                     ; inst 24
  %15 = icmp ult i64 %14, 1999                                                     ; inst 25
  br i1 %15, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 26
_5.while.body.0:
  %16 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 27
  %17 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %16, i32 0, i64 %14  ; inst 28
  %18 = getelementptr %ListNode, %ListNode* %17, i32 0, i32 1                      ; inst 29
  %19 = trunc i64 %14 to i32                                                       ; inst 30
  %20 = add i32 %19, 1                                                             ; inst 31
  store i32 %20, i32* %18                                                          ; inst 32
  %21 = add i64 %14, 1                                                             ; inst 33
  br label %_4.while.cond.0                                                        ; inst 34
_6.while.exit.0:
  %22 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 35
  %23 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %22, i32 0, i64 1999 ; inst 36
  %24 = getelementptr %ListNode, %ListNode* %23, i32 0, i32 1                      ; inst 37
  store i32 -1, i32* %24                                                           ; inst 38
  call void @memcpy(%MemoryPool* %0, %MemoryPool* %1, i64 16012)                   ; inst 39
  ret void                                                                         ; inst 40
}

define i32 @allocate_node(%MemoryPool* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 1                    ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = icmp eq i32 %3, -1                                                          ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 -1                                                                       ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 1                    ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 1                    ; inst 9
  %8 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 0                    ; inst 10
  %9 = sext i32 %6 to i64                                                          ; inst 11
  %10 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %8, i32 0, i64 %9    ; inst 12
  %11 = getelementptr %ListNode, %ListNode* %10, i32 0, i32 1                      ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  store i32 %12, i32* %7                                                           ; inst 15
  %13 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 0                   ; inst 16
  %14 = sext i32 %6 to i64                                                         ; inst 17
  %15 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %13, i32 0, i64 %14  ; inst 18
  %16 = getelementptr %ListNode, %ListNode* %15, i32 0, i32 0                      ; inst 19
  store i32 %1, i32* %16                                                           ; inst 20
  %17 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 0                   ; inst 21
  %18 = sext i32 %6 to i64                                                         ; inst 22
  %19 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %17, i32 0, i64 %18  ; inst 23
  %20 = getelementptr %ListNode, %ListNode* %19, i32 0, i32 1                      ; inst 24
  store i32 -1, i32* %20                                                           ; inst 25
  %21 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 2                   ; inst 26
  %22 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 2                   ; inst 27
  %23 = load i32, i32* %22                                                         ; inst 28
  %24 = add i32 %23, 1                                                             ; inst 29
  store i32 %24, i32* %21                                                          ; inst 30
  ret i32 %6                                                                       ; inst 31
}

define void @deallocate_node(%MemoryPool* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, -1                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 0                    ; inst 5
  %4 = sext i32 %1 to i64                                                          ; inst 6
  %5 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %3, i32 0, i64 %4     ; inst 7
  %6 = getelementptr %ListNode, %ListNode* %5, i32 0, i32 1                        ; inst 8
  %7 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 1                    ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  store i32 %8, i32* %6                                                            ; inst 11
  %9 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 1                    ; inst 12
  store i32 %1, i32* %9                                                            ; inst 13
  %10 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 2                   ; inst 14
  %11 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 2                   ; inst 15
  %12 = load i32, i32* %11                                                         ; inst 16
  %13 = sub i32 %12, 1                                                             ; inst 17
  store i32 %13, i32* %10                                                          ; inst 18
  ret void                                                                         ; inst 19
}

define void @init_stack(%Stack* sret(%Stack) %0) {
_0.entry.0:
  %1 = getelementptr %Stack, %Stack* %0, i32 0, i32 0                              ; inst 1
  %2 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 500                                                        ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                              ; inst 11
  store i32 -1, i32* %7                                                            ; inst 12
  %8 = getelementptr %Stack, %Stack* %0, i32 0, i32 2                              ; inst 13
  %9 = trunc i64 500 to i32                                                        ; inst 14
  store i32 %9, i32* %8                                                            ; inst 15
  ret void                                                                         ; inst 16
}

define i1 @stack_push(%Stack* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                              ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = getelementptr %Stack, %Stack* %0, i32 0, i32 2                              ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = sub i32 %5, 1                                                               ; inst 5
  %7 = icmp sge i32 %3, %6                                                         ; inst 6
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 7
_1.if.then.0:
  ret i1 0                                                                         ; inst 8
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 9
_3.if.exit.0:
  %8 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                              ; inst 10
  %9 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                              ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  %11 = add i32 %10, 1                                                             ; inst 13
  store i32 %11, i32* %8                                                           ; inst 14
  %12 = getelementptr %Stack, %Stack* %0, i32 0, i32 0                             ; inst 15
  %13 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                             ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = sext i32 %14 to i64                                                        ; inst 18
  %16 = getelementptr [500 x i32], [500 x i32]* %12, i32 0, i64 %15                ; inst 19
  store i32 %1, i32* %16                                                           ; inst 20
  ret i1 1                                                                         ; inst 21
}

define i32 @stack_pop(%Stack* %0) {
_0.entry.0:
  %1 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                              ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp slt i32 %2, 0                                                          ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 -999999                                                                  ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = getelementptr %Stack, %Stack* %0, i32 0, i32 0                              ; inst 7
  %5 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                              ; inst 8
  %6 = load i32, i32* %5                                                           ; inst 9
  %7 = sext i32 %6 to i64                                                          ; inst 10
  %8 = getelementptr [500 x i32], [500 x i32]* %4, i32 0, i64 %7                   ; inst 11
  %9 = load i32, i32* %8                                                           ; inst 12
  %10 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                             ; inst 13
  %11 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                             ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = sub i32 %12, 1                                                             ; inst 16
  store i32 %13, i32* %10                                                          ; inst 17
  ret i32 %9                                                                       ; inst 18
}

define i1 @stack_is_empty(%Stack* %0) {
_0.entry.0:
  %1 = getelementptr %Stack, %Stack* %0, i32 0, i32 1                              ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp slt i32 %2, 0                                                          ; inst 3
  ret i1 %3                                                                        ; inst 4
}

define void @init_queue(%Queue* sret(%Queue) %0) {
_0.entry.0:
  %1 = getelementptr %Queue, %Queue* %0, i32 0, i32 0                              ; inst 1
  %2 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 500                                                        ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr %Queue, %Queue* %0, i32 0, i32 1                              ; inst 11
  store i32 0, i32* %7                                                             ; inst 12
  %8 = getelementptr %Queue, %Queue* %0, i32 0, i32 2                              ; inst 13
  store i32 0, i32* %8                                                             ; inst 14
  %9 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                              ; inst 15
  store i32 0, i32* %9                                                             ; inst 16
  %10 = getelementptr %Queue, %Queue* %0, i32 0, i32 4                             ; inst 17
  %11 = trunc i64 500 to i32                                                       ; inst 18
  store i32 %11, i32* %10                                                          ; inst 19
  ret void                                                                         ; inst 20
}

define i1 @queue_enqueue(%Queue* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                              ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = getelementptr %Queue, %Queue* %0, i32 0, i32 4                              ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = icmp sge i32 %3, %5                                                         ; inst 5
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 6
_1.if.then.0:
  ret i1 0                                                                         ; inst 7
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 8
_3.if.exit.0:
  %7 = getelementptr %Queue, %Queue* %0, i32 0, i32 0                              ; inst 9
  %8 = getelementptr %Queue, %Queue* %0, i32 0, i32 2                              ; inst 10
  %9 = load i32, i32* %8                                                           ; inst 11
  %10 = sext i32 %9 to i64                                                         ; inst 12
  %11 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %10                 ; inst 13
  store i32 %1, i32* %11                                                           ; inst 14
  %12 = getelementptr %Queue, %Queue* %0, i32 0, i32 2                             ; inst 15
  %13 = getelementptr %Queue, %Queue* %0, i32 0, i32 2                             ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = add i32 %14, 1                                                             ; inst 18
  %16 = getelementptr %Queue, %Queue* %0, i32 0, i32 4                             ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = srem i32 %15, %17                                                          ; inst 21
  store i32 %18, i32* %12                                                          ; inst 22
  %19 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                             ; inst 23
  %20 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                             ; inst 24
  %21 = load i32, i32* %20                                                         ; inst 25
  %22 = add i32 %21, 1                                                             ; inst 26
  store i32 %22, i32* %19                                                          ; inst 27
  ret i1 1                                                                         ; inst 28
}

define i32 @queue_dequeue(%Queue* %0) {
_0.entry.0:
  %1 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                              ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp sle i32 %2, 0                                                          ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 -999999                                                                  ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = getelementptr %Queue, %Queue* %0, i32 0, i32 0                              ; inst 7
  %5 = getelementptr %Queue, %Queue* %0, i32 0, i32 1                              ; inst 8
  %6 = load i32, i32* %5                                                           ; inst 9
  %7 = sext i32 %6 to i64                                                          ; inst 10
  %8 = getelementptr [500 x i32], [500 x i32]* %4, i32 0, i64 %7                   ; inst 11
  %9 = load i32, i32* %8                                                           ; inst 12
  %10 = getelementptr %Queue, %Queue* %0, i32 0, i32 1                             ; inst 13
  %11 = getelementptr %Queue, %Queue* %0, i32 0, i32 1                             ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = add i32 %12, 1                                                             ; inst 16
  %14 = getelementptr %Queue, %Queue* %0, i32 0, i32 4                             ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  %16 = srem i32 %13, %15                                                          ; inst 19
  store i32 %16, i32* %10                                                          ; inst 20
  %17 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                             ; inst 21
  %18 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                             ; inst 22
  %19 = load i32, i32* %18                                                         ; inst 23
  %20 = sub i32 %19, 1                                                             ; inst 24
  store i32 %20, i32* %17                                                          ; inst 25
  ret i32 %9                                                                       ; inst 26
}

define i1 @queue_is_empty(%Queue* %0) {
_0.entry.0:
  %1 = getelementptr %Queue, %Queue* %0, i32 0, i32 3                              ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp sle i32 %2, 0                                                          ; inst 3
  ret i1 %3                                                                        ; inst 4
}

define i32 @hash_function(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 31                                                              ; inst 1
  %2 = add i32 %1, 17                                                              ; inst 2
  %3 = trunc i64 127 to i32                                                        ; inst 3
  %4 = srem i32 %2, %3                                                             ; inst 4
  %5 = icmp slt i32 %4, 0                                                          ; inst 5
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 6
_1.if.then.0:
  %6 = trunc i64 127 to i32                                                        ; inst 7
  %7 = add i32 %4, %6                                                              ; inst 8
  br label %_3.if.exit.0                                                           ; inst 9
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 10
_3.if.exit.0:
  %8 = phi i32 [%7, %_1.if.then.0], [%4, %_2.if.else.0]                            ; inst 11
  ret i32 %8                                                                       ; inst 12
}

define void @init_hash_table(%HashTable* sret(%HashTable) %0) {
_0.entry.0:
  %1 = alloca %HashTable                                                           ; inst 1
  %2 = getelementptr %HashTable, %HashTable* %1, i32 0, i32 0                      ; inst 2
  %3 = getelementptr [127 x i32], [127 x i32]* %2, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 127                                                        ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 8
  store i32 -1, i32* %6                                                            ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %8 = getelementptr %HashTable, %HashTable* %1, i32 0, i32 1                      ; inst 12
  %9 = alloca %HashEntry                                                           ; inst 13
  %10 = getelementptr %HashEntry, %HashEntry* %9, i32 0, i32 0                     ; inst 14
  store i32 0, i32* %10                                                            ; inst 15
  %11 = getelementptr %HashEntry, %HashEntry* %9, i32 0, i32 1                     ; inst 16
  store i32 0, i32* %11                                                            ; inst 17
  %12 = getelementptr %HashEntry, %HashEntry* %9, i32 0, i32 2                     ; inst 18
  store i32 -1, i32* %12                                                           ; inst 19
  %13 = getelementptr %HashEntry, %HashEntry* %9, i32 0, i32 3                     ; inst 20
  store i1 0, i1* %13                                                              ; inst 21
  %14 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %8, i32 0, i32 0   ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_4.array.cond.1:
  %15 = phi i32 [0, %_3.array.exit.0], [%18, %_5.array.body.1]                     ; inst 24
  %16 = icmp slt i32 %15, 1000                                                     ; inst 25
  br i1 %16, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 26
_5.array.body.1:
  %17 = getelementptr %HashEntry, %HashEntry* %14, i32 %15                         ; inst 27
  call void @memcpy(%HashEntry* %17, %HashEntry* %9, i64 16)                       ; inst 28
  %18 = add i32 %15, 1                                                             ; inst 29
  br label %_4.array.cond.1                                                        ; inst 30
_6.array.exit.1:
  %19 = getelementptr %HashTable, %HashTable* %1, i32 0, i32 2                     ; inst 31
  store i32 0, i32* %19                                                            ; inst 32
  br label %_7.while.cond.0                                                        ; inst 33
_7.while.cond.0:
  %20 = phi i64 [0, %_6.array.exit.1], [%25, %_8.while.body.0]                     ; inst 34
  %21 = icmp ult i64 %20, 1000                                                     ; inst 35
  br i1 %21, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 36
_8.while.body.0:
  %22 = getelementptr %HashTable, %HashTable* %1, i32 0, i32 1                     ; inst 37
  %23 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %22, i32 0, i64 %20 ; inst 38
  %24 = getelementptr %HashEntry, %HashEntry* %23, i32 0, i32 3                    ; inst 39
  store i1 0, i1* %24                                                              ; inst 40
  %25 = add i64 %20, 1                                                             ; inst 41
  br label %_7.while.cond.0                                                        ; inst 42
_9.while.exit.0:
  call void @memcpy(%HashTable* %0, %HashTable* %1, i64 16512)                     ; inst 43
  ret void                                                                         ; inst 44
}

define i1 @hash_table_insert(%HashTable* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                      ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  %5 = trunc i64 1000 to i32                                                       ; inst 3
  %6 = icmp sge i32 %4, %5                                                         ; inst 4
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  ret i1 0                                                                         ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %7 = call i32 @hash_function(i32 %1)                                             ; inst 8
  %8 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                      ; inst 9
  %9 = sext i32 %7 to i64                                                          ; inst 10
  %10 = getelementptr [127 x i32], [127 x i32]* %8, i32 0, i64 %9                  ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %12 = phi i32 [%11, %_3.if.exit.0], [%28, %_8.if.exit.1]                         ; inst 14
  %13 = icmp ne i32 %12, -1                                                        ; inst 15
  br i1 %13, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 16
_5.while.body.0:
  %14 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 17
  %15 = sext i32 %12 to i64                                                        ; inst 18
  %16 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %14, i32 0, i64 %15 ; inst 19
  %17 = getelementptr %HashEntry, %HashEntry* %16, i32 0, i32 0                    ; inst 20
  %18 = load i32, i32* %17                                                         ; inst 21
  %19 = icmp eq i32 %18, %1                                                        ; inst 22
  br i1 %19, label %_6.if.then.1, label %_7.if.else.1                              ; inst 23
_6.if.then.1:
  %20 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 24
  %21 = sext i32 %12 to i64                                                        ; inst 25
  %22 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %20, i32 0, i64 %21 ; inst 26
  %23 = getelementptr %HashEntry, %HashEntry* %22, i32 0, i32 1                    ; inst 27
  store i32 %2, i32* %23                                                           ; inst 28
  ret i1 1                                                                         ; inst 29
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 30
_8.if.exit.1:
  %24 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 31
  %25 = sext i32 %12 to i64                                                        ; inst 32
  %26 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %24, i32 0, i64 %25 ; inst 33
  %27 = getelementptr %HashEntry, %HashEntry* %26, i32 0, i32 2                    ; inst 34
  %28 = load i32, i32* %27                                                         ; inst 35
  br label %_4.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 37
_10.while.cond.1:
  %29 = phi i32 [0, %_9.while.exit.0], [%38, %_14.while.body.1]                    ; inst 38
  %30 = trunc i64 1000 to i32                                                      ; inst 39
  %31 = icmp slt i32 %29, %30                                                      ; inst 40
  br i1 %31, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 41
_11.lazy.then.0:
  %32 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 42
  %33 = sext i32 %29 to i64                                                        ; inst 43
  %34 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %32, i32 0, i64 %33 ; inst 44
  %35 = getelementptr %HashEntry, %HashEntry* %34, i32 0, i32 3                    ; inst 45
  %36 = load i1, i1* %35                                                           ; inst 46
  br label %_13.lazy.exit.0                                                        ; inst 47
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 48
_13.lazy.exit.0:
  %37 = phi i1 [%36, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 49
  br i1 %37, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 50
_14.while.body.1:
  %38 = add i32 %29, 1                                                             ; inst 51
  br label %_10.while.cond.1                                                       ; inst 52
_15.while.exit.1:
  %39 = trunc i64 1000 to i32                                                      ; inst 53
  %40 = icmp sge i32 %29, %39                                                      ; inst 54
  br i1 %40, label %_16.if.then.2, label %_17.if.else.2                            ; inst 55
_16.if.then.2:
  ret i1 0                                                                         ; inst 56
_17.if.else.2:
  br label %_18.if.exit.2                                                          ; inst 57
_18.if.exit.2:
  %41 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 58
  %42 = sext i32 %29 to i64                                                        ; inst 59
  %43 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %41, i32 0, i64 %42 ; inst 60
  %44 = getelementptr %HashEntry, %HashEntry* %43, i32 0, i32 0                    ; inst 61
  store i32 %1, i32* %44                                                           ; inst 62
  %45 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 63
  %46 = sext i32 %29 to i64                                                        ; inst 64
  %47 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %45, i32 0, i64 %46 ; inst 65
  %48 = getelementptr %HashEntry, %HashEntry* %47, i32 0, i32 1                    ; inst 66
  store i32 %2, i32* %48                                                           ; inst 67
  %49 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 68
  %50 = sext i32 %29 to i64                                                        ; inst 69
  %51 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %49, i32 0, i64 %50 ; inst 70
  %52 = getelementptr %HashEntry, %HashEntry* %51, i32 0, i32 2                    ; inst 71
  %53 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 72
  %54 = sext i32 %7 to i64                                                         ; inst 73
  %55 = getelementptr [127 x i32], [127 x i32]* %53, i32 0, i64 %54                ; inst 74
  %56 = load i32, i32* %55                                                         ; inst 75
  store i32 %56, i32* %52                                                          ; inst 76
  %57 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 77
  %58 = sext i32 %29 to i64                                                        ; inst 78
  %59 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %57, i32 0, i64 %58 ; inst 79
  %60 = getelementptr %HashEntry, %HashEntry* %59, i32 0, i32 3                    ; inst 80
  store i1 1, i1* %60                                                              ; inst 81
  %61 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 82
  %62 = sext i32 %7 to i64                                                         ; inst 83
  %63 = getelementptr [127 x i32], [127 x i32]* %61, i32 0, i64 %62                ; inst 84
  store i32 %29, i32* %63                                                          ; inst 85
  %64 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 86
  %65 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 87
  %66 = load i32, i32* %65                                                         ; inst 88
  %67 = add i32 %66, 1                                                             ; inst 89
  store i32 %67, i32* %64                                                          ; inst 90
  ret i1 1                                                                         ; inst 91
}

define i32 @hash_table_search(%HashTable* %0, i32 %1) {
_0.entry.0:
  %2 = call i32 @hash_function(i32 %1)                                             ; inst 1
  %3 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                      ; inst 2
  %4 = sext i32 %2 to i64                                                          ; inst 3
  %5 = getelementptr [127 x i32], [127 x i32]* %3, i32 0, i64 %4                   ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %7 = phi i32 [%6, %_0.entry.0], [%24, %_5.if.exit.0]                             ; inst 7
  %8 = icmp ne i32 %7, -1                                                          ; inst 8
  br i1 %8, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 9
_2.while.body.0:
  %9 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                      ; inst 10
  %10 = sext i32 %7 to i64                                                         ; inst 11
  %11 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %9, i32 0, i64 %10 ; inst 12
  %12 = getelementptr %HashEntry, %HashEntry* %11, i32 0, i32 0                    ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = icmp eq i32 %13, %1                                                        ; inst 15
  br i1 %14, label %_3.if.then.0, label %_4.if.else.0                              ; inst 16
_3.if.then.0:
  %15 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 17
  %16 = sext i32 %7 to i64                                                         ; inst 18
  %17 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %15, i32 0, i64 %16 ; inst 19
  %18 = getelementptr %HashEntry, %HashEntry* %17, i32 0, i32 1                    ; inst 20
  %19 = load i32, i32* %18                                                         ; inst 21
  ret i32 %19                                                                      ; inst 22
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 23
_5.if.exit.0:
  %20 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 24
  %21 = sext i32 %7 to i64                                                         ; inst 25
  %22 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %20, i32 0, i64 %21 ; inst 26
  %23 = getelementptr %HashEntry, %HashEntry* %22, i32 0, i32 2                    ; inst 27
  %24 = load i32, i32* %23                                                         ; inst 28
  br label %_1.while.cond.0                                                        ; inst 29
_6.while.exit.0:
  ret i32 -999999                                                                  ; inst 30
}

define i1 @hash_table_delete(%HashTable* %0, i32 %1) {
_0.entry.0:
  %2 = call i32 @hash_function(i32 %1)                                             ; inst 1
  %3 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                      ; inst 2
  %4 = sext i32 %2 to i64                                                          ; inst 3
  %5 = getelementptr [127 x i32], [127 x i32]* %3, i32 0, i64 %4                   ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %7 = phi i32 [-1, %_0.entry.0], [%8, %_8.if.exit.0]                              ; inst 7
  %8 = phi i32 [%6, %_0.entry.0], [%46, %_8.if.exit.0]                             ; inst 8
  %9 = icmp ne i32 %8, -1                                                          ; inst 9
  br i1 %9, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 10
_2.while.body.0:
  %10 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 11
  %11 = sext i32 %8 to i64                                                         ; inst 12
  %12 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %10, i32 0, i64 %11 ; inst 13
  %13 = getelementptr %HashEntry, %HashEntry* %12, i32 0, i32 0                    ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = icmp eq i32 %14, %1                                                        ; inst 16
  br i1 %15, label %_3.if.then.0, label %_7.if.else.0                              ; inst 17
_3.if.then.0:
  %16 = icmp eq i32 %7, -1                                                         ; inst 18
  br i1 %16, label %_4.if.then.1, label %_5.if.else.1                              ; inst 19
_4.if.then.1:
  %17 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 0                     ; inst 20
  %18 = sext i32 %2 to i64                                                         ; inst 21
  %19 = getelementptr [127 x i32], [127 x i32]* %17, i32 0, i64 %18                ; inst 22
  %20 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 23
  %21 = sext i32 %8 to i64                                                         ; inst 24
  %22 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %20, i32 0, i64 %21 ; inst 25
  %23 = getelementptr %HashEntry, %HashEntry* %22, i32 0, i32 2                    ; inst 26
  %24 = load i32, i32* %23                                                         ; inst 27
  store i32 %24, i32* %19                                                          ; inst 28
  br label %_6.if.exit.1                                                           ; inst 29
_5.if.else.1:
  %25 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 30
  %26 = sext i32 %7 to i64                                                         ; inst 31
  %27 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %25, i32 0, i64 %26 ; inst 32
  %28 = getelementptr %HashEntry, %HashEntry* %27, i32 0, i32 2                    ; inst 33
  %29 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 34
  %30 = sext i32 %8 to i64                                                         ; inst 35
  %31 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %29, i32 0, i64 %30 ; inst 36
  %32 = getelementptr %HashEntry, %HashEntry* %31, i32 0, i32 2                    ; inst 37
  %33 = load i32, i32* %32                                                         ; inst 38
  store i32 %33, i32* %28                                                          ; inst 39
  br label %_6.if.exit.1                                                           ; inst 40
_6.if.exit.1:
  %34 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 41
  %35 = sext i32 %8 to i64                                                         ; inst 42
  %36 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %34, i32 0, i64 %35 ; inst 43
  %37 = getelementptr %HashEntry, %HashEntry* %36, i32 0, i32 3                    ; inst 44
  store i1 0, i1* %37                                                              ; inst 45
  %38 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 46
  %39 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 2                     ; inst 47
  %40 = load i32, i32* %39                                                         ; inst 48
  %41 = sub i32 %40, 1                                                             ; inst 49
  store i32 %41, i32* %38                                                          ; inst 50
  ret i1 1                                                                         ; inst 51
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 52
_8.if.exit.0:
  %42 = getelementptr %HashTable, %HashTable* %0, i32 0, i32 1                     ; inst 53
  %43 = sext i32 %8 to i64                                                         ; inst 54
  %44 = getelementptr [1000 x %HashEntry], [1000 x %HashEntry]* %42, i32 0, i64 %43 ; inst 55
  %45 = getelementptr %HashEntry, %HashEntry* %44, i32 0, i32 2                    ; inst 56
  %46 = load i32, i32* %45                                                         ; inst 57
  br label %_1.while.cond.0                                                        ; inst 58
_9.while.exit.0:
  ret i1 0                                                                         ; inst 59
}

define void @init_list_manager(%LinkedListManager* sret(%LinkedListManager) %0) {
_0.entry.0:
  %1 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0      ; inst 1
  %2 = getelementptr [10 x i32], [10 x i32]* %1, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 10                                                         ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 -1, i32* %5                                                            ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 1      ; inst 11
  store i32 0, i32* %7                                                             ; inst 12
  %8 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 2      ; inst 13
  store i32 0, i32* %8                                                             ; inst 14
  ret void                                                                         ; inst 15
}

define i1 @list_insert_head(%LinkedListManager* %0, %MemoryPool* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp slt i32 %2, 0                                                          ; inst 1
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %5 = icmp sge i32 %2, 10                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %6 = phi i1 [1, %_1.lazy.then.0], [%5, %_2.lazy.else.0]                          ; inst 6
  br i1 %6, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i1 0                                                                         ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %7 = call i32 @allocate_node(%MemoryPool* %1, i32 %3)                            ; inst 10
  %8 = call i32 @allocate_node(%MemoryPool* %1, i32 %3)                            ; inst 11
  %9 = icmp eq i32 %8, -1                                                          ; inst 12
  br i1 %9, label %_7.if.then.1, label %_8.if.else.1                               ; inst 13
_7.if.then.1:
  ret i1 0                                                                         ; inst 14
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 15
_9.if.exit.1:
  %10 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 16
  %11 = sext i32 %8 to i64                                                         ; inst 17
  %12 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %10, i32 0, i64 %11  ; inst 18
  %13 = getelementptr %ListNode, %ListNode* %12, i32 0, i32 1                      ; inst 19
  %14 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 20
  %15 = sext i32 %2 to i64                                                         ; inst 21
  %16 = getelementptr [10 x i32], [10 x i32]* %14, i32 0, i64 %15                  ; inst 22
  %17 = load i32, i32* %16                                                         ; inst 23
  store i32 %17, i32* %13                                                          ; inst 24
  %18 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 25
  %19 = sext i32 %2 to i64                                                         ; inst 26
  %20 = getelementptr [10 x i32], [10 x i32]* %18, i32 0, i64 %19                  ; inst 27
  store i32 %8, i32* %20                                                           ; inst 28
  %21 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 2     ; inst 29
  %22 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 2     ; inst 30
  %23 = load i32, i32* %22                                                         ; inst 31
  %24 = add i32 %23, 1                                                             ; inst 32
  store i32 %24, i32* %21                                                          ; inst 33
  ret i1 1                                                                         ; inst 34
}

define i1 @list_search(%LinkedListManager* %0, %MemoryPool* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp slt i32 %2, 0                                                          ; inst 1
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %5 = icmp sge i32 %2, 10                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %6 = phi i1 [1, %_1.lazy.then.0], [%5, %_2.lazy.else.0]                          ; inst 6
  br i1 %6, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i1 0                                                                         ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %7 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0      ; inst 10
  %8 = sext i32 %2 to i64                                                          ; inst 11
  %9 = getelementptr [10 x i32], [10 x i32]* %7, i32 0, i64 %8                     ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  br label %_7.while.cond.0                                                        ; inst 14
_7.while.cond.0:
  %11 = phi i32 [%10, %_6.if.exit.0], [%23, %_11.if.exit.1]                        ; inst 15
  %12 = icmp ne i32 %11, -1                                                        ; inst 16
  br i1 %12, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 17
_8.while.body.0:
  %13 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 18
  %14 = sext i32 %11 to i64                                                        ; inst 19
  %15 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %13, i32 0, i64 %14  ; inst 20
  %16 = getelementptr %ListNode, %ListNode* %15, i32 0, i32 0                      ; inst 21
  %17 = load i32, i32* %16                                                         ; inst 22
  %18 = icmp eq i32 %17, %3                                                        ; inst 23
  br i1 %18, label %_9.if.then.1, label %_10.if.else.1                             ; inst 24
_9.if.then.1:
  ret i1 1                                                                         ; inst 25
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 26
_11.if.exit.1:
  %19 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 27
  %20 = sext i32 %11 to i64                                                        ; inst 28
  %21 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %19, i32 0, i64 %20  ; inst 29
  %22 = getelementptr %ListNode, %ListNode* %21, i32 0, i32 1                      ; inst 30
  %23 = load i32, i32* %22                                                         ; inst 31
  br label %_7.while.cond.0                                                        ; inst 32
_12.while.exit.0:
  ret i1 0                                                                         ; inst 33
}

define i1 @list_delete(%LinkedListManager* %0, %MemoryPool* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp slt i32 %2, 0                                                          ; inst 1
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %5 = icmp sge i32 %2, 10                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %6 = phi i1 [1, %_1.lazy.then.0], [%5, %_2.lazy.else.0]                          ; inst 6
  br i1 %6, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i1 0                                                                         ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %7 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0      ; inst 10
  %8 = sext i32 %2 to i64                                                          ; inst 11
  %9 = getelementptr [10 x i32], [10 x i32]* %7, i32 0, i64 %8                     ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  br label %_7.while.cond.0                                                        ; inst 14
_7.while.cond.0:
  %11 = phi i32 [-1, %_6.if.exit.0], [%12, %_14.if.exit.1]                         ; inst 15
  %12 = phi i32 [%10, %_6.if.exit.0], [%46, %_14.if.exit.1]                        ; inst 16
  %13 = icmp ne i32 %12, -1                                                        ; inst 17
  br i1 %13, label %_8.while.body.0, label %_15.while.exit.0                       ; inst 18
_8.while.body.0:
  %14 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 19
  %15 = sext i32 %12 to i64                                                        ; inst 20
  %16 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %14, i32 0, i64 %15  ; inst 21
  %17 = getelementptr %ListNode, %ListNode* %16, i32 0, i32 0                      ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = icmp eq i32 %18, %3                                                        ; inst 24
  br i1 %19, label %_9.if.then.1, label %_13.if.else.1                             ; inst 25
_9.if.then.1:
  %20 = icmp eq i32 %11, -1                                                        ; inst 26
  br i1 %20, label %_10.if.then.2, label %_11.if.else.2                            ; inst 27
_10.if.then.2:
  %21 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 28
  %22 = sext i32 %2 to i64                                                         ; inst 29
  %23 = getelementptr [10 x i32], [10 x i32]* %21, i32 0, i64 %22                  ; inst 30
  %24 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 31
  %25 = sext i32 %12 to i64                                                        ; inst 32
  %26 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %24, i32 0, i64 %25  ; inst 33
  %27 = getelementptr %ListNode, %ListNode* %26, i32 0, i32 1                      ; inst 34
  %28 = load i32, i32* %27                                                         ; inst 35
  store i32 %28, i32* %23                                                          ; inst 36
  br label %_12.if.exit.2                                                          ; inst 37
_11.if.else.2:
  %29 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 38
  %30 = sext i32 %11 to i64                                                        ; inst 39
  %31 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %29, i32 0, i64 %30  ; inst 40
  %32 = getelementptr %ListNode, %ListNode* %31, i32 0, i32 1                      ; inst 41
  %33 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 42
  %34 = sext i32 %12 to i64                                                        ; inst 43
  %35 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %33, i32 0, i64 %34  ; inst 44
  %36 = getelementptr %ListNode, %ListNode* %35, i32 0, i32 1                      ; inst 45
  %37 = load i32, i32* %36                                                         ; inst 46
  store i32 %37, i32* %32                                                          ; inst 47
  br label %_12.if.exit.2                                                          ; inst 48
_12.if.exit.2:
  call void @deallocate_node(%MemoryPool* %1, i32 %12)                             ; inst 49
  %38 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 2     ; inst 50
  %39 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 2     ; inst 51
  %40 = load i32, i32* %39                                                         ; inst 52
  %41 = sub i32 %40, 1                                                             ; inst 53
  store i32 %41, i32* %38                                                          ; inst 54
  ret i1 1                                                                         ; inst 55
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 56
_14.if.exit.1:
  %42 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 57
  %43 = sext i32 %12 to i64                                                        ; inst 58
  %44 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %42, i32 0, i64 %43  ; inst 59
  %45 = getelementptr %ListNode, %ListNode* %44, i32 0, i32 1                      ; inst 60
  %46 = load i32, i32* %45                                                         ; inst 61
  br label %_7.while.cond.0                                                        ; inst 62
_15.while.exit.0:
  ret i1 0                                                                         ; inst 63
}

define i32 @list_length(%LinkedListManager* %0, %MemoryPool* %1, i32 %2) {
_0.entry.0:
  %3 = icmp slt i32 %2, 0                                                          ; inst 1
  br i1 %3, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %4 = icmp sge i32 %2, 10                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %5 = phi i1 [1, %_1.lazy.then.0], [%4, %_2.lazy.else.0]                          ; inst 6
  br i1 %5, label %_4.if.then.0, label %_5.if.else.0                               ; inst 7
_4.if.then.0:
  ret i32 0                                                                        ; inst 8
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 9
_6.if.exit.0:
  %6 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0      ; inst 10
  %7 = sext i32 %2 to i64                                                          ; inst 11
  %8 = getelementptr [10 x i32], [10 x i32]* %6, i32 0, i64 %7                     ; inst 12
  %9 = load i32, i32* %8                                                           ; inst 13
  br label %_7.while.cond.0                                                        ; inst 14
_7.while.cond.0:
  %10 = phi i32 [0, %_6.if.exit.0], [%13, %_8.while.body.0]                        ; inst 15
  %11 = phi i32 [%9, %_6.if.exit.0], [%18, %_8.while.body.0]                       ; inst 16
  %12 = icmp ne i32 %11, -1                                                        ; inst 17
  br i1 %12, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 18
_8.while.body.0:
  %13 = add i32 %10, 1                                                             ; inst 19
  %14 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 20
  %15 = sext i32 %11 to i64                                                        ; inst 21
  %16 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %14, i32 0, i64 %15  ; inst 22
  %17 = getelementptr %ListNode, %ListNode* %16, i32 0, i32 1                      ; inst 23
  %18 = load i32, i32* %17                                                         ; inst 24
  br label %_7.while.cond.0                                                        ; inst 25
_9.while.exit.0:
  ret i32 %10                                                                      ; inst 26
}

define i1 @list_merge_sorted(%LinkedListManager* %0, %MemoryPool* %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = icmp slt i32 %2, 0                                                          ; inst 1
  br i1 %5, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  br label %_3.lazy.exit.0                                                         ; inst 3
_2.lazy.else.0:
  %6 = icmp sge i32 %2, 10                                                         ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_3.lazy.exit.0:
  %7 = phi i1 [1, %_1.lazy.then.0], [%6, %_2.lazy.else.0]                          ; inst 6
  br i1 %7, label %_4.lazy.then.1, label %_5.lazy.else.1                           ; inst 7
_4.lazy.then.1:
  br label %_6.lazy.exit.1                                                         ; inst 8
_5.lazy.else.1:
  %8 = icmp slt i32 %3, 0                                                          ; inst 9
  br label %_6.lazy.exit.1                                                         ; inst 10
_6.lazy.exit.1:
  %9 = phi i1 [1, %_4.lazy.then.1], [%8, %_5.lazy.else.1]                          ; inst 11
  br i1 %9, label %_7.lazy.then.2, label %_8.lazy.else.2                           ; inst 12
_7.lazy.then.2:
  br label %_9.lazy.exit.2                                                         ; inst 13
_8.lazy.else.2:
  %10 = icmp sge i32 %3, 10                                                        ; inst 14
  br label %_9.lazy.exit.2                                                         ; inst 15
_9.lazy.exit.2:
  %11 = phi i1 [1, %_7.lazy.then.2], [%10, %_8.lazy.else.2]                        ; inst 16
  br i1 %11, label %_10.lazy.then.3, label %_11.lazy.else.3                        ; inst 17
_10.lazy.then.3:
  br label %_12.lazy.exit.3                                                        ; inst 18
_11.lazy.else.3:
  %12 = icmp slt i32 %4, 0                                                         ; inst 19
  br label %_12.lazy.exit.3                                                        ; inst 20
_12.lazy.exit.3:
  %13 = phi i1 [1, %_10.lazy.then.3], [%12, %_11.lazy.else.3]                      ; inst 21
  br i1 %13, label %_13.lazy.then.4, label %_14.lazy.else.4                        ; inst 22
_13.lazy.then.4:
  br label %_15.lazy.exit.4                                                        ; inst 23
_14.lazy.else.4:
  %14 = icmp sge i32 %4, 10                                                        ; inst 24
  br label %_15.lazy.exit.4                                                        ; inst 25
_15.lazy.exit.4:
  %15 = phi i1 [1, %_13.lazy.then.4], [%14, %_14.lazy.else.4]                      ; inst 26
  br i1 %15, label %_16.if.then.0, label %_17.if.else.0                            ; inst 27
_16.if.then.0:
  ret i1 0                                                                         ; inst 28
_17.if.else.0:
  br label %_18.if.exit.0                                                          ; inst 29
_18.if.exit.0:
  %16 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 30
  %17 = sext i32 %2 to i64                                                         ; inst 31
  %18 = getelementptr [10 x i32], [10 x i32]* %16, i32 0, i64 %17                  ; inst 32
  %19 = load i32, i32* %18                                                         ; inst 33
  %20 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 34
  %21 = sext i32 %3 to i64                                                         ; inst 35
  %22 = getelementptr [10 x i32], [10 x i32]* %20, i32 0, i64 %21                  ; inst 36
  %23 = load i32, i32* %22                                                         ; inst 37
  %24 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 38
  %25 = sext i32 %4 to i64                                                         ; inst 39
  %26 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i64 %25                  ; inst 40
  store i32 -1, i32* %26                                                           ; inst 41
  br label %_19.while.cond.0                                                       ; inst 42
_19.while.cond.0:
  %27 = phi i32 [%19, %_18.if.exit.0], [%54, %_29.if.exit.2]                       ; inst 43
  %28 = phi i32 [%23, %_18.if.exit.0], [%55, %_29.if.exit.2]                       ; inst 44
  %29 = phi i32 [-1, %_18.if.exit.0], [%73, %_29.if.exit.2]                        ; inst 45
  %30 = icmp ne i32 %27, -1                                                        ; inst 46
  br i1 %30, label %_20.lazy.then.5, label %_21.lazy.else.5                        ; inst 47
_20.lazy.then.5:
  %31 = icmp ne i32 %28, -1                                                        ; inst 48
  br label %_22.lazy.exit.5                                                        ; inst 49
_21.lazy.else.5:
  br label %_22.lazy.exit.5                                                        ; inst 50
_22.lazy.exit.5:
  %32 = phi i1 [%31, %_20.lazy.then.5], [0, %_21.lazy.else.5]                      ; inst 51
  br i1 %32, label %_23.while.body.0, label %_30.while.exit.0                      ; inst 52
_23.while.body.0:
  %33 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 53
  %34 = sext i32 %27 to i64                                                        ; inst 54
  %35 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %33, i32 0, i64 %34  ; inst 55
  %36 = getelementptr %ListNode, %ListNode* %35, i32 0, i32 0                      ; inst 56
  %37 = load i32, i32* %36                                                         ; inst 57
  %38 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 58
  %39 = sext i32 %28 to i64                                                        ; inst 59
  %40 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %38, i32 0, i64 %39  ; inst 60
  %41 = getelementptr %ListNode, %ListNode* %40, i32 0, i32 0                      ; inst 61
  %42 = load i32, i32* %41                                                         ; inst 62
  %43 = icmp sle i32 %37, %42                                                      ; inst 63
  br i1 %43, label %_24.if.then.1, label %_25.if.else.1                            ; inst 64
_24.if.then.1:
  %44 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 65
  %45 = sext i32 %27 to i64                                                        ; inst 66
  %46 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %44, i32 0, i64 %45  ; inst 67
  %47 = getelementptr %ListNode, %ListNode* %46, i32 0, i32 1                      ; inst 68
  %48 = load i32, i32* %47                                                         ; inst 69
  br label %_26.if.exit.1                                                          ; inst 70
_25.if.else.1:
  %49 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 71
  %50 = sext i32 %28 to i64                                                        ; inst 72
  %51 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %49, i32 0, i64 %50  ; inst 73
  %52 = getelementptr %ListNode, %ListNode* %51, i32 0, i32 1                      ; inst 74
  %53 = load i32, i32* %52                                                         ; inst 75
  br label %_26.if.exit.1                                                          ; inst 76
_26.if.exit.1:
  %54 = phi i32 [%48, %_24.if.then.1], [%27, %_25.if.else.1]                       ; inst 77
  %55 = phi i32 [%28, %_24.if.then.1], [%53, %_25.if.else.1]                       ; inst 78
  %56 = phi i32 [%27, %_24.if.then.1], [%28, %_25.if.else.1]                       ; inst 79
  %57 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 80
  %58 = sext i32 %56 to i64                                                        ; inst 81
  %59 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %57, i32 0, i64 %58  ; inst 82
  %60 = getelementptr %ListNode, %ListNode* %59, i32 0, i32 1                      ; inst 83
  store i32 -1, i32* %60                                                           ; inst 84
  %61 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 85
  %62 = sext i32 %4 to i64                                                         ; inst 86
  %63 = getelementptr [10 x i32], [10 x i32]* %61, i32 0, i64 %62                  ; inst 87
  %64 = load i32, i32* %63                                                         ; inst 88
  %65 = icmp eq i32 %64, -1                                                        ; inst 89
  br i1 %65, label %_27.if.then.2, label %_28.if.else.2                            ; inst 90
_27.if.then.2:
  %66 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 91
  %67 = sext i32 %4 to i64                                                         ; inst 92
  %68 = getelementptr [10 x i32], [10 x i32]* %66, i32 0, i64 %67                  ; inst 93
  store i32 %56, i32* %68                                                          ; inst 94
  br label %_29.if.exit.2                                                          ; inst 95
_28.if.else.2:
  %69 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 96
  %70 = sext i32 %29 to i64                                                        ; inst 97
  %71 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %69, i32 0, i64 %70  ; inst 98
  %72 = getelementptr %ListNode, %ListNode* %71, i32 0, i32 1                      ; inst 99
  store i32 %56, i32* %72                                                          ; inst 100
  br label %_29.if.exit.2                                                          ; inst 101
_29.if.exit.2:
  %73 = phi i32 [%56, %_27.if.then.2], [%56, %_28.if.else.2]                       ; inst 102
  br label %_19.while.cond.0                                                       ; inst 103
_30.while.exit.0:
  %74 = icmp ne i32 %27, -1                                                        ; inst 104
  br i1 %74, label %_31.if.then.3, label %_32.if.else.3                            ; inst 105
_31.if.then.3:
  br label %_33.if.exit.3                                                          ; inst 106
_32.if.else.3:
  br label %_33.if.exit.3                                                          ; inst 107
_33.if.exit.3:
  %75 = phi i32 [%27, %_31.if.then.3], [%28, %_32.if.else.3]                       ; inst 108
  %76 = icmp ne i32 %75, -1                                                        ; inst 109
  br i1 %76, label %_34.if.then.4, label %_38.if.else.4                            ; inst 110
_34.if.then.4:
  %77 = icmp ne i32 %29, -1                                                        ; inst 111
  br i1 %77, label %_35.if.then.5, label %_36.if.else.5                            ; inst 112
_35.if.then.5:
  %78 = getelementptr %MemoryPool, %MemoryPool* %1, i32 0, i32 0                   ; inst 113
  %79 = sext i32 %29 to i64                                                        ; inst 114
  %80 = getelementptr [2000 x %ListNode], [2000 x %ListNode]* %78, i32 0, i64 %79  ; inst 115
  %81 = getelementptr %ListNode, %ListNode* %80, i32 0, i32 1                      ; inst 116
  store i32 %75, i32* %81                                                          ; inst 117
  br label %_37.if.exit.5                                                          ; inst 118
_36.if.else.5:
  %82 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 119
  %83 = sext i32 %4 to i64                                                         ; inst 120
  %84 = getelementptr [10 x i32], [10 x i32]* %82, i32 0, i64 %83                  ; inst 121
  store i32 %75, i32* %84                                                          ; inst 122
  br label %_37.if.exit.5                                                          ; inst 123
_37.if.exit.5:
  br label %_39.if.exit.4                                                          ; inst 124
_38.if.else.4:
  br label %_39.if.exit.4                                                          ; inst 125
_39.if.exit.4:
  %85 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 126
  %86 = sext i32 %2 to i64                                                         ; inst 127
  %87 = getelementptr [10 x i32], [10 x i32]* %85, i32 0, i64 %86                  ; inst 128
  store i32 -1, i32* %87                                                           ; inst 129
  %88 = getelementptr %LinkedListManager, %LinkedListManager* %0, i32 0, i32 0     ; inst 130
  %89 = sext i32 %3 to i64                                                         ; inst 131
  %90 = getelementptr [10 x i32], [10 x i32]* %88, i32 0, i64 %89                  ; inst 132
  store i32 -1, i32* %90                                                           ; inst 133
  ret i1 1                                                                         ; inst 134
}

define void @test_comprehensive_operations() {
_0.entry.0:
  call void @printlnInt(i32 19001)                                                 ; inst 1
  %0 = alloca %MemoryPool                                                          ; inst 2
  call void @init_memory_pool(%MemoryPool* %0)                                     ; inst 3
  %1 = alloca %HashTable                                                           ; inst 4
  call void @init_hash_table(%HashTable* %1)                                       ; inst 5
  %2 = alloca %Stack                                                               ; inst 6
  call void @init_stack(%Stack* %2)                                                ; inst 7
  %3 = alloca %Queue                                                               ; inst 8
  call void @init_queue(%Queue* %3)                                                ; inst 9
  %4 = alloca %LinkedListManager                                                   ; inst 10
  call void @init_list_manager(%LinkedListManager* %4)                             ; inst 11
  call void @printlnInt(i32 19002)                                                 ; inst 12
  %5 = alloca [100 x i32]                                                          ; inst 13
  %6 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i32 0                    ; inst 14
  br label %_1.array.cond.0                                                        ; inst 15
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 16
  %8 = icmp slt i32 %7, 100                                                        ; inst 17
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 18
_2.array.body.0:
  %9 = getelementptr i32, i32* %6, i32 %7                                          ; inst 19
  store i32 -1, i32* %9                                                            ; inst 20
  %10 = add i32 %7, 1                                                              ; inst 21
  br label %_1.array.cond.0                                                        ; inst 22
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 23
_4.while.cond.0:
  %11 = phi i32 [0, %_3.array.exit.0], [%22, %_8.if.exit.0]                        ; inst 24
  %12 = icmp slt i32 %11, 100                                                      ; inst 25
  br i1 %12, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 26
_5.while.body.0:
  %13 = sext i32 %11 to i64                                                        ; inst 27
  %14 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %13                 ; inst 28
  %15 = mul i32 %11, 7                                                             ; inst 29
  %16 = add i32 %15, 13                                                            ; inst 30
  %17 = call i32 @allocate_node(%MemoryPool* %0, i32 %16)                          ; inst 31
  store i32 %17, i32* %14                                                          ; inst 32
  %18 = sext i32 %11 to i64                                                        ; inst 33
  %19 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %18                 ; inst 34
  %20 = load i32, i32* %19                                                         ; inst 35
  %21 = icmp eq i32 %20, -1                                                        ; inst 36
  br i1 %21, label %_6.if.then.0, label %_7.if.else.0                              ; inst 37
_6.if.then.0:
  call void @printlnInt(i32 19901)                                                 ; inst 38
  br label %_8.if.exit.0                                                           ; inst 39
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 40
_8.if.exit.0:
  %22 = add i32 %11, 1                                                             ; inst 41
  br label %_4.while.cond.0                                                        ; inst 42
_9.while.exit.0:
  %23 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 2                   ; inst 43
  %24 = load i32, i32* %23                                                         ; inst 44
  call void @printlnInt(i32 %24)                                                   ; inst 45
  br label %_10.while.cond.1                                                       ; inst 46
_10.while.cond.1:
  %25 = phi i32 [0, %_9.while.exit.0], [%35, %_17.if.exit.1]                       ; inst 47
  %26 = icmp slt i32 %25, 200                                                      ; inst 48
  br i1 %26, label %_11.while.body.1, label %_18.while.exit.1                      ; inst 49
_11.while.body.1:
  %27 = mul i32 %25, 127                                                           ; inst 50
  %28 = add i32 %27, 1                                                             ; inst 51
  %29 = mul i32 %25, %25                                                           ; inst 52
  %30 = add i32 %29, 17                                                            ; inst 53
  %31 = call i1 @hash_table_insert(%HashTable* %1, i32 %28, i32 %30)               ; inst 54
  br i1 %31, label %_12.if.then.1, label %_16.if.else.1                            ; inst 55
_12.if.then.1:
  %32 = call i32 @hash_table_search(%HashTable* %1, i32 %28)                       ; inst 56
  %33 = call i32 @hash_table_search(%HashTable* %1, i32 %28)                       ; inst 57
  %34 = icmp ne i32 %33, %30                                                       ; inst 58
  br i1 %34, label %_13.if.then.2, label %_14.if.else.2                            ; inst 59
_13.if.then.2:
  call void @printlnInt(i32 19902)                                                 ; inst 60
  br label %_15.if.exit.2                                                          ; inst 61
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 62
_15.if.exit.2:
  br label %_17.if.exit.1                                                          ; inst 63
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 64
_17.if.exit.1:
  %35 = add i32 %25, 1                                                             ; inst 65
  br label %_10.while.cond.1                                                       ; inst 66
_18.while.exit.1:
  %36 = getelementptr %HashTable, %HashTable* %1, i32 0, i32 2                     ; inst 67
  %37 = load i32, i32* %36                                                         ; inst 68
  call void @printlnInt(i32 %37)                                                   ; inst 69
  br label %_19.while.cond.2                                                       ; inst 70
_19.while.cond.2:
  %38 = phi i32 [0, %_18.while.exit.1], [%46, %_23.if.exit.3]                      ; inst 71
  %39 = trunc i64 500 to i32                                                       ; inst 72
  %40 = add i32 %39, 10                                                            ; inst 73
  %41 = icmp slt i32 %38, %40                                                      ; inst 74
  br i1 %41, label %_20.while.body.2, label %_85.critical_edge.0                   ; inst 75
_20.while.body.2:
  %42 = mul i32 %38, 3                                                             ; inst 76
  %43 = add i32 %42, 7                                                             ; inst 77
  %44 = call i1 @stack_push(%Stack* %2, i32 %43)                                   ; inst 78
  %45 = icmp eq i1 %44, 0                                                          ; inst 79
  br i1 %45, label %_21.if.then.3, label %_22.if.else.3                            ; inst 80
_21.if.then.3:
  call void @printlnInt(i32 19903)                                                 ; inst 81
  br label %_24.while.exit.2                                                       ; inst 82
_22.if.else.3:
  br label %_23.if.exit.3                                                          ; inst 83
_23.if.exit.3:
  %46 = add i32 %38, 1                                                             ; inst 84
  br label %_19.while.cond.2                                                       ; inst 85
_24.while.exit.2:
  br label %_25.while.cond.3                                                       ; inst 86
_25.while.cond.3:
  %47 = phi i32 [0, %_24.while.exit.2], [%53, %_29.if.exit.4]                      ; inst 87
  %48 = call i1 @stack_is_empty(%Stack* %2)                                        ; inst 88
  %49 = icmp eq i1 %48, 0                                                          ; inst 89
  br i1 %49, label %_26.while.body.3, label %_30.while.exit.3                      ; inst 90
_26.while.body.3:
  %50 = call i32 @stack_pop(%Stack* %2)                                            ; inst 91
  %51 = icmp ne i32 %50, -999999                                                   ; inst 92
  br i1 %51, label %_27.if.then.4, label %_28.if.else.4                            ; inst 93
_27.if.then.4:
  %52 = add i32 %47, 1                                                             ; inst 94
  br label %_29.if.exit.4                                                          ; inst 95
_28.if.else.4:
  br label %_29.if.exit.4                                                          ; inst 96
_29.if.exit.4:
  %53 = phi i32 [%52, %_27.if.then.4], [%47, %_28.if.else.4]                       ; inst 97
  br label %_25.while.cond.3                                                       ; inst 98
_30.while.exit.3:
  call void @printlnInt(i32 %47)                                                   ; inst 99
  br label %_31.while.cond.4                                                       ; inst 100
_31.while.cond.4:
  %54 = phi i32 [0, %_30.while.exit.3], [%61, %_32.while.body.4]                   ; inst 101
  %55 = trunc i64 500 to i32                                                       ; inst 102
  %56 = sdiv i32 %55, 2                                                            ; inst 103
  %57 = icmp slt i32 %54, %56                                                      ; inst 104
  br i1 %57, label %_32.while.body.4, label %_33.while.exit.4                      ; inst 105
_32.while.body.4:
  %58 = mul i32 %54, 5                                                             ; inst 106
  %59 = add i32 %58, 11                                                            ; inst 107
  %60 = call i1 @queue_enqueue(%Queue* %3, i32 %59)                                ; inst 108
  %61 = add i32 %54, 1                                                             ; inst 109
  br label %_31.while.cond.4                                                       ; inst 110
_33.while.exit.4:
  br label %_34.while.cond.5                                                       ; inst 111
_34.while.cond.5:
  %62 = phi i32 [0, %_33.while.exit.4], [%67, %_35.while.body.5]                   ; inst 112
  %63 = trunc i64 500 to i32                                                       ; inst 113
  %64 = sdiv i32 %63, 4                                                            ; inst 114
  %65 = icmp slt i32 %62, %64                                                      ; inst 115
  br i1 %65, label %_35.while.body.5, label %_36.while.exit.5                      ; inst 116
_35.while.body.5:
  %66 = call i32 @queue_dequeue(%Queue* %3)                                        ; inst 117
  %67 = add i32 %62, 1                                                             ; inst 118
  br label %_34.while.cond.5                                                       ; inst 119
_36.while.exit.5:
  br label %_37.while.cond.6                                                       ; inst 120
_37.while.cond.6:
  %68 = phi i32 [0, %_36.while.exit.5], [%76, %_41.if.exit.5]                      ; inst 121
  %69 = trunc i64 500 to i32                                                       ; inst 122
  %70 = sdiv i32 %69, 2                                                            ; inst 123
  %71 = icmp slt i32 %68, %70                                                      ; inst 124
  br i1 %71, label %_38.while.body.6, label %_42.while.exit.6                      ; inst 125
_38.while.body.6:
  %72 = mul i32 %68, 7                                                             ; inst 126
  %73 = add i32 %72, 23                                                            ; inst 127
  %74 = call i1 @queue_enqueue(%Queue* %3, i32 %73)                                ; inst 128
  %75 = icmp eq i1 %74, 0                                                          ; inst 129
  br i1 %75, label %_39.if.then.5, label %_40.if.else.5                            ; inst 130
_39.if.then.5:
  call void @printlnInt(i32 19904)                                                 ; inst 131
  br label %_41.if.exit.5                                                          ; inst 132
_40.if.else.5:
  br label %_41.if.exit.5                                                          ; inst 133
_41.if.exit.5:
  %76 = add i32 %68, 1                                                             ; inst 134
  br label %_37.while.cond.6                                                       ; inst 135
_42.while.exit.6:
  %77 = getelementptr %Queue, %Queue* %3, i32 0, i32 3                             ; inst 136
  %78 = load i32, i32* %77                                                         ; inst 137
  call void @printlnInt(i32 %78)                                                   ; inst 138
  br label %_43.while.cond.7                                                       ; inst 139
_43.while.cond.7:
  %79 = phi i32 [0, %_42.while.exit.6], [%87, %_47.while.exit.8]                   ; inst 140
  %80 = icmp slt i32 %79, 5                                                        ; inst 141
  br i1 %80, label %_44.while.body.7, label %_48.while.exit.7                      ; inst 142
_44.while.body.7:
  br label %_45.while.cond.8                                                       ; inst 143
_45.while.cond.8:
  %81 = phi i32 [0, %_44.while.body.7], [%86, %_46.while.body.8]                   ; inst 144
  %82 = icmp slt i32 %81, 20                                                       ; inst 145
  br i1 %82, label %_46.while.body.8, label %_47.while.exit.8                      ; inst 146
_46.while.body.8:
  %83 = mul i32 %81, 2                                                             ; inst 147
  %84 = add i32 %83, %79                                                           ; inst 148
  %85 = call i1 @list_insert_head(%LinkedListManager* %4, %MemoryPool* %0, i32 %79, i32 %84) ; inst 149
  %86 = add i32 %81, 1                                                             ; inst 150
  br label %_45.while.cond.8                                                       ; inst 151
_47.while.exit.8:
  %87 = add i32 %79, 1                                                             ; inst 152
  br label %_43.while.cond.7                                                       ; inst 153
_48.while.exit.7:
  %88 = getelementptr %LinkedListManager, %LinkedListManager* %4, i32 0, i32 2     ; inst 154
  %89 = load i32, i32* %88                                                         ; inst 155
  call void @printlnInt(i32 %89)                                                   ; inst 156
  br label %_49.while.cond.9                                                       ; inst 157
_49.while.cond.9:
  %90 = phi i32 [0, %_48.while.exit.7], [%93, %_56.while.exit.10]                  ; inst 158
  %91 = phi i32 [0, %_48.while.exit.7], [%102, %_56.while.exit.10]                 ; inst 159
  %92 = icmp slt i32 %91, 5                                                        ; inst 160
  br i1 %92, label %_50.while.body.9, label %_57.while.exit.9                      ; inst 161
_50.while.body.9:
  br label %_51.while.cond.10                                                      ; inst 162
_51.while.cond.10:
  %93 = phi i32 [%90, %_50.while.body.9], [%100, %_55.if.exit.6]                   ; inst 163
  %94 = phi i32 [0, %_50.while.body.9], [%101, %_55.if.exit.6]                     ; inst 164
  %95 = icmp slt i32 %94, 20                                                       ; inst 165
  br i1 %95, label %_52.while.body.10, label %_56.while.exit.10                    ; inst 166
_52.while.body.10:
  %96 = mul i32 %94, 2                                                             ; inst 167
  %97 = add i32 %96, %91                                                           ; inst 168
  %98 = call i1 @list_search(%LinkedListManager* %4, %MemoryPool* %0, i32 %91, i32 %97) ; inst 169
  br i1 %98, label %_53.if.then.6, label %_54.if.else.6                            ; inst 170
_53.if.then.6:
  %99 = add i32 %93, 1                                                             ; inst 171
  br label %_55.if.exit.6                                                          ; inst 172
_54.if.else.6:
  br label %_55.if.exit.6                                                          ; inst 173
_55.if.exit.6:
  %100 = phi i32 [%99, %_53.if.then.6], [%93, %_54.if.else.6]                      ; inst 174
  %101 = add i32 %94, 1                                                            ; inst 175
  br label %_51.while.cond.10                                                      ; inst 176
_56.while.exit.10:
  %102 = add i32 %91, 1                                                            ; inst 177
  br label %_49.while.cond.9                                                       ; inst 178
_57.while.exit.9:
  call void @printlnInt(i32 %90)                                                   ; inst 179
  br label %_58.while.cond.11                                                      ; inst 180
_58.while.cond.11:
  %103 = phi i32 [0, %_57.while.exit.9], [%117, %_65.if.exit.7]                    ; inst 181
  %104 = icmp slt i32 %103, 100                                                    ; inst 182
  br i1 %104, label %_59.while.body.11, label %_66.while.exit.11                   ; inst 183
_59.while.body.11:
  %105 = srem i32 %103, 2                                                          ; inst 184
  %106 = icmp eq i32 %105, 0                                                       ; inst 185
  br i1 %106, label %_60.lazy.then.0, label %_61.lazy.else.0                       ; inst 186
_60.lazy.then.0:
  %107 = sext i32 %103 to i64                                                      ; inst 187
  %108 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %107               ; inst 188
  %109 = load i32, i32* %108                                                       ; inst 189
  %110 = icmp ne i32 %109, -1                                                      ; inst 190
  br label %_62.lazy.exit.0                                                        ; inst 191
_61.lazy.else.0:
  br label %_62.lazy.exit.0                                                        ; inst 192
_62.lazy.exit.0:
  %111 = phi i1 [%110, %_60.lazy.then.0], [0, %_61.lazy.else.0]                    ; inst 193
  br i1 %111, label %_63.if.then.7, label %_64.if.else.7                           ; inst 194
_63.if.then.7:
  %112 = sext i32 %103 to i64                                                      ; inst 195
  %113 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %112               ; inst 196
  %114 = load i32, i32* %113                                                       ; inst 197
  call void @deallocate_node(%MemoryPool* %0, i32 %114)                            ; inst 198
  %115 = sext i32 %103 to i64                                                      ; inst 199
  %116 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %115               ; inst 200
  store i32 -1, i32* %116                                                          ; inst 201
  br label %_65.if.exit.7                                                          ; inst 202
_64.if.else.7:
  br label %_65.if.exit.7                                                          ; inst 203
_65.if.exit.7:
  %117 = add i32 %103, 1                                                           ; inst 204
  br label %_58.while.cond.11                                                      ; inst 205
_66.while.exit.11:
  %118 = getelementptr %MemoryPool, %MemoryPool* %0, i32 0, i32 2                  ; inst 206
  %119 = load i32, i32* %118                                                       ; inst 207
  call void @printlnInt(i32 %119)                                                  ; inst 208
  br label %_67.while.cond.12                                                      ; inst 209
_67.while.cond.12:
  %120 = phi i32 [0, %_66.while.exit.11], [%129, %_71.if.exit.8]                   ; inst 210
  %121 = phi i32 [0, %_66.while.exit.11], [%128, %_71.if.exit.8]                   ; inst 211
  %122 = icmp slt i32 %120, 60                                                     ; inst 212
  br i1 %122, label %_68.while.body.12, label %_72.while.exit.12                   ; inst 213
_68.while.body.12:
  %123 = mul i32 %120, 11                                                          ; inst 214
  %124 = add i32 %123, 19                                                          ; inst 215
  %125 = call i32 @allocate_node(%MemoryPool* %0, i32 %124)                        ; inst 216
  %126 = icmp ne i32 %125, -1                                                      ; inst 217
  br i1 %126, label %_69.if.then.8, label %_70.if.else.8                           ; inst 218
_69.if.then.8:
  %127 = add i32 %121, 1                                                           ; inst 219
  br label %_71.if.exit.8                                                          ; inst 220
_70.if.else.8:
  br label %_71.if.exit.8                                                          ; inst 221
_71.if.exit.8:
  %128 = phi i32 [%127, %_69.if.then.8], [%121, %_70.if.else.8]                    ; inst 222
  %129 = add i32 %120, 1                                                           ; inst 223
  br label %_67.while.cond.12                                                      ; inst 224
_72.while.exit.12:
  call void @printlnInt(i32 %121)                                                  ; inst 225
  br label %_73.while.cond.13                                                      ; inst 226
_73.while.cond.13:
  %130 = phi i32 [0, %_72.while.exit.12], [%137, %_77.if.exit.9]                   ; inst 227
  %131 = phi i32 [0, %_72.while.exit.12], [%138, %_77.if.exit.9]                   ; inst 228
  %132 = icmp slt i32 %131, 100                                                    ; inst 229
  br i1 %132, label %_74.while.body.13, label %_78.while.exit.13                   ; inst 230
_74.while.body.13:
  %133 = mul i32 %131, 127                                                         ; inst 231
  %134 = add i32 %133, 1                                                           ; inst 232
  %135 = call i1 @hash_table_delete(%HashTable* %1, i32 %134)                      ; inst 233
  br i1 %135, label %_75.if.then.9, label %_76.if.else.9                           ; inst 234
_75.if.then.9:
  %136 = add i32 %130, 1                                                           ; inst 235
  br label %_77.if.exit.9                                                          ; inst 236
_76.if.else.9:
  br label %_77.if.exit.9                                                          ; inst 237
_77.if.exit.9:
  %137 = phi i32 [%136, %_75.if.then.9], [%130, %_76.if.else.9]                    ; inst 238
  %138 = add i32 %131, 1                                                           ; inst 239
  br label %_73.while.cond.13                                                      ; inst 240
_78.while.exit.13:
  call void @printlnInt(i32 %130)                                                  ; inst 241
  br label %_79.while.cond.14                                                      ; inst 242
_79.while.cond.14:
  %139 = phi i32 [0, %_78.while.exit.13], [%147, %_80.while.body.14]               ; inst 243
  %140 = icmp slt i32 %139, 50                                                     ; inst 244
  br i1 %140, label %_80.while.body.14, label %_81.while.exit.14                   ; inst 245
_80.while.body.14:
  %141 = mul i32 %139, 127                                                         ; inst 246
  %142 = add i32 %141, 1                                                           ; inst 247
  %143 = mul i32 %139, %139                                                        ; inst 248
  %144 = mul i32 %143, %139                                                        ; inst 249
  %145 = add i32 %144, 29                                                          ; inst 250
  %146 = call i1 @hash_table_insert(%HashTable* %1, i32 %142, i32 %145)            ; inst 251
  %147 = add i32 %139, 1                                                           ; inst 252
  br label %_79.while.cond.14                                                      ; inst 253
_81.while.exit.14:
  %148 = getelementptr %HashTable, %HashTable* %1, i32 0, i32 2                    ; inst 254
  %149 = load i32, i32* %148                                                       ; inst 255
  call void @printlnInt(i32 %149)                                                  ; inst 256
  br label %_82.while.cond.15                                                      ; inst 257
_82.while.cond.15:
  %150 = phi i32 [0, %_81.while.exit.14], [%157, %_83.while.body.15]               ; inst 258
  %151 = icmp slt i32 %150, 15                                                     ; inst 259
  br i1 %151, label %_83.while.body.15, label %_84.while.exit.15                   ; inst 260
_83.while.body.15:
  %152 = mul i32 %150, 4                                                           ; inst 261
  %153 = call i1 @list_insert_head(%LinkedListManager* %4, %MemoryPool* %0, i32 7, i32 %152) ; inst 262
  %154 = mul i32 %150, 4                                                           ; inst 263
  %155 = add i32 %154, 2                                                           ; inst 264
  %156 = call i1 @list_insert_head(%LinkedListManager* %4, %MemoryPool* %0, i32 8, i32 %155) ; inst 265
  %157 = add i32 %150, 1                                                           ; inst 266
  br label %_82.while.cond.15                                                      ; inst 267
_84.while.exit.15:
  %158 = call i32 @list_length(%LinkedListManager* %4, %MemoryPool* %0, i32 7)     ; inst 268
  %159 = call i32 @list_length(%LinkedListManager* %4, %MemoryPool* %0, i32 8)     ; inst 269
  %160 = add i32 %158, %159                                                        ; inst 270
  call void @printlnInt(i32 %160)                                                  ; inst 271
  %161 = call i1 @list_merge_sorted(%LinkedListManager* %4, %MemoryPool* %0, i32 7, i32 8, i32 9) ; inst 272
  %162 = call i32 @list_length(%LinkedListManager* %4, %MemoryPool* %0, i32 9)     ; inst 273
  call void @printlnInt(i32 %162)                                                  ; inst 274
  call void @printlnInt(i32 19999)                                                 ; inst 275
  ret void                                                                         ; inst 276
_85.critical_edge.0:
  br label %_24.while.exit.2                                                       ; inst 277
}

define void @main() {
_0.entry.0:
  call void @test_comprehensive_operations()                                       ; inst 1
  call void @exit(i32 0)                                                           ; inst 2
  ret void                                                                         ; inst 3
}

