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
  call void @printlnInt(i32 42)                                                    ; inst 1
  %0 = call i32 @run_cache_simulation()                                            ; inst 2
  call void @printlnInt(i32 %0)                                                    ; inst 3
  %1 = call i32 @run_memory_manager()                                              ; inst 4
  call void @printlnInt(i32 %1)                                                    ; inst 5
  %2 = call i32 @run_hash_table_tests()                                            ; inst 6
  call void @printlnInt(i32 %2)                                                    ; inst 7
  %3 = call i32 @run_priority_queue_tests()                                        ; inst 8
  call void @printlnInt(i32 %3)                                                    ; inst 9
  %4 = call i32 @run_integrated_system_test()                                      ; inst 10
  call void @printlnInt(i32 %4)                                                    ; inst 11
  call void @printlnInt(i32 99)                                                    ; inst 12
  call void @exit(i32 0)                                                           ; inst 13
  ret void                                                                         ; inst 14
}

define i32 @get_l1_cache_size() {
_0.entry.0:
  ret i32 64                                                                       ; inst 1
}

define i32 @get_l2_cache_size() {
_0.entry.0:
  ret i32 512                                                                      ; inst 1
}

define i32 @get_l3_cache_size() {
_0.entry.0:
  ret i32 2048                                                                     ; inst 1
}

define i32 @get_cache_line_size() {
_0.entry.0:
  ret i32 64                                                                       ; inst 1
}

define i32 @get_associativity() {
_0.entry.0:
  ret i32 4                                                                        ; inst 1
}

define i32 @get_page_size() {
_0.entry.0:
  ret i32 4096                                                                     ; inst 1
}

define i32 @get_heap_size() {
_0.entry.0:
  ret i32 65536                                                                    ; inst 1
}

define i32 @get_gc_threshold() {
_0.entry.0:
  ret i32 80                                                                       ; inst 1
}

define i32 @get_hash_table_size() {
_0.entry.0:
  ret i32 1024                                                                     ; inst 1
}

define i32 @get_max_probe_distance() {
_0.entry.0:
  ret i32 16                                                                       ; inst 1
}

define i32 @run_cache_simulation() {
_0.entry.0:
  %0 = alloca [256 x i32]                                                          ; inst 1
  %1 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 256                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [4096 x i32]                                                         ; inst 11
  %7 = getelementptr [4096 x i32], [4096 x i32]* %6, i32 0, i32 0                  ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 4096                                                       ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %12 = phi i32 [0, %_6.array.exit.1], [%22, %_11.if.exit.0]                       ; inst 22
  %13 = phi i32 [0, %_6.array.exit.1], [%24, %_11.if.exit.0]                       ; inst 23
  %14 = phi i32 [0, %_6.array.exit.1], [%25, %_11.if.exit.0]                       ; inst 24
  %15 = phi i32 [0, %_6.array.exit.1], [%23, %_11.if.exit.0]                       ; inst 25
  %16 = icmp slt i32 %14, 10000                                                    ; inst 26
  br i1 %16, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 27
_8.while.body.0:
  %17 = call i32 @generate_memory_address(i32 %14)                                 ; inst 28
  %18 = call i32 @simulate_cache_access(i32 %17, [256 x i32]* %0, [4096 x i32]* %6) ; inst 29
  %19 = icmp sgt i32 %18, 0                                                        ; inst 30
  br i1 %19, label %_9.if.then.0, label %_10.if.else.0                             ; inst 31
_9.if.then.0:
  %20 = add i32 %12, 1                                                             ; inst 32
  br label %_11.if.exit.0                                                          ; inst 33
_10.if.else.0:
  %21 = call i32 @simulate_cache_fill(i32 %17, [256 x i32]* %0, [4096 x i32]* %6)  ; inst 34
  br label %_11.if.exit.0                                                          ; inst 35
_11.if.exit.0:
  %22 = phi i32 [%20, %_9.if.then.0], [%12, %_10.if.else.0]                        ; inst 36
  %23 = call i32 @update_lru_counters_l1([256 x i32]* %0, i32 %15)                 ; inst 37
  %24 = call i32 @update_lru_counters_l2([4096 x i32]* %6, i32 %13)                ; inst 38
  %25 = add i32 %14, 1                                                             ; inst 39
  br label %_7.while.cond.0                                                        ; inst 40
_12.while.exit.0:
  %26 = mul i32 %12, 1000                                                          ; inst 41
  %27 = sdiv i32 %26, 10000                                                        ; inst 42
  ret i32 %27                                                                      ; inst 43
}

define i32 @generate_memory_address(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 7                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %3 = mul i32 %0, 4                                                               ; inst 4
  %4 = add i32 268435456, %3                                                       ; inst 5
  br label %_21.if.exit.0                                                          ; inst 6
_2.if.else.0:
  %5 = icmp eq i32 %1, 1                                                           ; inst 7
  br i1 %5, label %_3.if.then.1, label %_4.if.else.1                               ; inst 8
_3.if.then.1:
  %6 = mul i32 %0, 64                                                              ; inst 9
  %7 = srem i32 %6, 8192                                                           ; inst 10
  %8 = add i32 268435456, %7                                                       ; inst 11
  br label %_20.if.exit.1                                                          ; inst 12
_4.if.else.1:
  %9 = icmp eq i32 %1, 2                                                           ; inst 13
  br i1 %9, label %_5.if.then.2, label %_6.if.else.2                               ; inst 14
_5.if.then.2:
  %10 = call i32 @hash_function(i32 %0)                                            ; inst 15
  %11 = srem i32 %10, 16384                                                        ; inst 16
  %12 = add i32 268435456, %11                                                     ; inst 17
  br label %_19.if.exit.2                                                          ; inst 18
_6.if.else.2:
  %13 = icmp eq i32 %1, 3                                                          ; inst 19
  br i1 %13, label %_7.if.then.3, label %_8.if.else.3                              ; inst 20
_7.if.then.3:
  %14 = srem i32 %0, 128                                                           ; inst 21
  %15 = mul i32 %14, 4                                                             ; inst 22
  %16 = add i32 268435456, %15                                                     ; inst 23
  br label %_18.if.exit.3                                                          ; inst 24
_8.if.else.3:
  %17 = icmp eq i32 %1, 4                                                          ; inst 25
  br i1 %17, label %_9.if.then.4, label %_10.if.else.4                             ; inst 26
_9.if.then.4:
  %18 = sdiv i32 %0, 64                                                            ; inst 27
  %19 = srem i32 %0, 64                                                            ; inst 28
  %20 = mul i32 %18, 4096                                                          ; inst 29
  %21 = add i32 268435456, %20                                                     ; inst 30
  %22 = mul i32 %19, 4                                                             ; inst 31
  %23 = add i32 %21, %22                                                           ; inst 32
  br label %_17.if.exit.4                                                          ; inst 33
_10.if.else.4:
  %24 = icmp eq i32 %1, 5                                                          ; inst 34
  br i1 %24, label %_11.if.then.5, label %_15.if.else.5                            ; inst 35
_11.if.then.5:
  br label %_12.while.cond.0                                                       ; inst 36
_12.while.cond.0:
  %25 = phi i32 [1, %_11.if.then.5], [%28, %_13.while.body.0]                      ; inst 37
  %26 = phi i32 [%0, %_11.if.then.5], [%29, %_13.while.body.0]                     ; inst 38
  %27 = icmp sgt i32 %26, 0                                                        ; inst 39
  br i1 %27, label %_13.while.body.0, label %_14.while.exit.0                      ; inst 40
_13.while.body.0:
  %28 = mul i32 %25, 2                                                             ; inst 41
  %29 = sdiv i32 %26, 2                                                            ; inst 42
  br label %_12.while.cond.0                                                       ; inst 43
_14.while.exit.0:
  %30 = mul i32 %0, %25                                                            ; inst 44
  %31 = srem i32 %30, 32768                                                        ; inst 45
  %32 = add i32 268435456, %31                                                     ; inst 46
  br label %_16.if.exit.5                                                          ; inst 47
_15.if.else.5:
  %33 = mul i32 %0, 17                                                             ; inst 48
  %34 = mul i32 %0, %0                                                             ; inst 49
  %35 = add i32 %33, %34                                                           ; inst 50
  %36 = srem i32 %35, 65536                                                        ; inst 51
  %37 = add i32 268435456, %36                                                     ; inst 52
  br label %_16.if.exit.5                                                          ; inst 53
_16.if.exit.5:
  %38 = phi i32 [%32, %_14.while.exit.0], [%37, %_15.if.else.5]                    ; inst 54
  br label %_17.if.exit.4                                                          ; inst 55
_17.if.exit.4:
  %39 = phi i32 [%23, %_9.if.then.4], [%38, %_16.if.exit.5]                        ; inst 56
  br label %_18.if.exit.3                                                          ; inst 57
_18.if.exit.3:
  %40 = phi i32 [%16, %_7.if.then.3], [%39, %_17.if.exit.4]                        ; inst 58
  br label %_19.if.exit.2                                                          ; inst 59
_19.if.exit.2:
  %41 = phi i32 [%12, %_5.if.then.2], [%40, %_18.if.exit.3]                        ; inst 60
  br label %_20.if.exit.1                                                          ; inst 61
_20.if.exit.1:
  %42 = phi i32 [%8, %_3.if.then.1], [%41, %_19.if.exit.2]                         ; inst 62
  br label %_21.if.exit.0                                                          ; inst 63
_21.if.exit.0:
  %43 = phi i32 [%4, %_1.if.then.0], [%42, %_20.if.exit.1]                         ; inst 64
  ret i32 %43                                                                      ; inst 65
}

define i32 @hash_function(i32 %0) {
_0.entry.0:
  %1 = ashr i32 %0, 16                                                             ; inst 1
  %2 = xor i32 %0, %1                                                              ; inst 2
  %3 = srem i32 %2, 32768                                                          ; inst 3
  %4 = mul i32 %3, 40763                                                           ; inst 4
  %5 = ashr i32 %4, 16                                                             ; inst 5
  %6 = xor i32 %4, %5                                                              ; inst 6
  %7 = srem i32 %6, 32768                                                          ; inst 7
  %8 = mul i32 %7, 21311                                                           ; inst 8
  %9 = ashr i32 %8, 16                                                             ; inst 9
  %10 = xor i32 %8, %9                                                             ; inst 10
  ret i32 %10                                                                      ; inst 11
}

define i32 @simulate_cache_access(i32 %0, [256 x i32]* %1, [4096 x i32]* %2) {
_0.entry.0:
  %3 = call i32 @get_cache_line_size()                                             ; inst 1
  %4 = sdiv i32 %0, %3                                                             ; inst 2
  %5 = srem i32 %4, 16                                                             ; inst 3
  %6 = call i32 @get_cache_line_size()                                             ; inst 4
  %7 = mul i32 %6, 16                                                              ; inst 5
  %8 = sdiv i32 %0, %7                                                             ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%30, %_8.if.exit.0]                              ; inst 8
  %10 = call i32 @get_associativity()                                              ; inst 9
  %11 = icmp slt i32 %9, %10                                                       ; inst 10
  br i1 %11, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 11
_2.while.body.0:
  %12 = call i32 @get_associativity()                                              ; inst 12
  %13 = mul i32 %5, %12                                                            ; inst 13
  %14 = add i32 %13, %9                                                            ; inst 14
  %15 = mul i32 %14, 4                                                             ; inst 15
  %16 = sext i32 %15 to i64                                                        ; inst 16
  %17 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %16                 ; inst 17
  %18 = load i32, i32* %17                                                         ; inst 18
  %19 = sext i32 %15 to i64                                                        ; inst 19
  %20 = add i64 %19, 1                                                             ; inst 20
  %21 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %20                 ; inst 21
  %22 = load i32, i32* %21                                                         ; inst 22
  %23 = icmp eq i32 %22, 1                                                         ; inst 23
  br i1 %23, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 24
_3.lazy.then.0:
  %24 = icmp eq i32 %18, %8                                                        ; inst 25
  br label %_5.lazy.exit.0                                                         ; inst 26
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 27
_5.lazy.exit.0:
  %25 = phi i1 [%24, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 28
  br i1 %25, label %_6.if.then.0, label %_7.if.else.0                              ; inst 29
_6.if.then.0:
  %26 = sext i32 %15 to i64                                                        ; inst 30
  %27 = add i64 %26, 2                                                             ; inst 31
  %28 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %27                 ; inst 32
  %29 = call i32 @get_current_timestamp()                                          ; inst 33
  store i32 %29, i32* %28                                                          ; inst 34
  ret i32 1                                                                        ; inst 35
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 36
_8.if.exit.0:
  %30 = add i32 %9, 1                                                              ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_9.while.exit.0:
  %31 = call i32 @get_cache_line_size()                                            ; inst 39
  %32 = sdiv i32 %0, %31                                                           ; inst 40
  %33 = srem i32 %32, 64                                                           ; inst 41
  %34 = call i32 @get_cache_line_size()                                            ; inst 42
  %35 = mul i32 %34, 64                                                            ; inst 43
  %36 = sdiv i32 %0, %35                                                           ; inst 44
  br label %_10.while.cond.1                                                       ; inst 45
_10.while.cond.1:
  %37 = phi i32 [0, %_9.while.exit.0], [%56, %_17.if.exit.1]                       ; inst 46
  %38 = icmp slt i32 %37, 8                                                        ; inst 47
  br i1 %38, label %_11.while.body.1, label %_18.while.exit.1                      ; inst 48
_11.while.body.1:
  %39 = mul i32 %33, 8                                                             ; inst 49
  %40 = add i32 %39, %37                                                           ; inst 50
  %41 = mul i32 %40, 4                                                             ; inst 51
  %42 = sext i32 %41 to i64                                                        ; inst 52
  %43 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %42               ; inst 53
  %44 = load i32, i32* %43                                                         ; inst 54
  %45 = sext i32 %41 to i64                                                        ; inst 55
  %46 = add i64 %45, 1                                                             ; inst 56
  %47 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %46               ; inst 57
  %48 = load i32, i32* %47                                                         ; inst 58
  %49 = icmp eq i32 %48, 1                                                         ; inst 59
  br i1 %49, label %_12.lazy.then.1, label %_13.lazy.else.1                        ; inst 60
_12.lazy.then.1:
  %50 = icmp eq i32 %44, %36                                                       ; inst 61
  br label %_14.lazy.exit.1                                                        ; inst 62
_13.lazy.else.1:
  br label %_14.lazy.exit.1                                                        ; inst 63
_14.lazy.exit.1:
  %51 = phi i1 [%50, %_12.lazy.then.1], [0, %_13.lazy.else.1]                      ; inst 64
  br i1 %51, label %_15.if.then.1, label %_16.if.else.1                            ; inst 65
_15.if.then.1:
  %52 = sext i32 %41 to i64                                                        ; inst 66
  %53 = add i64 %52, 2                                                             ; inst 67
  %54 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %53               ; inst 68
  %55 = call i32 @get_current_timestamp()                                          ; inst 69
  store i32 %55, i32* %54                                                          ; inst 70
  ret i32 2                                                                        ; inst 71
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 72
_17.if.exit.1:
  %56 = add i32 %37, 1                                                             ; inst 73
  br label %_10.while.cond.1                                                       ; inst 74
_18.while.exit.1:
  ret i32 0                                                                        ; inst 75
}

define i32 @simulate_cache_fill(i32 %0, [256 x i32]* %1, [4096 x i32]* %2) {
_0.entry.0:
  %3 = call i32 @get_cache_line_size()                                             ; inst 1
  %4 = sdiv i32 %0, %3                                                             ; inst 2
  %5 = srem i32 %4, 16                                                             ; inst 3
  %6 = call i32 @get_cache_line_size()                                             ; inst 4
  %7 = mul i32 %6, 16                                                              ; inst 5
  %8 = sdiv i32 %0, %7                                                             ; inst 6
  %9 = call i32 @find_lru_way_l1([256 x i32]* %1, i32 %5)                          ; inst 7
  %10 = call i32 @get_associativity()                                              ; inst 8
  %11 = mul i32 %5, %10                                                            ; inst 9
  %12 = add i32 %11, %9                                                            ; inst 10
  %13 = mul i32 %12, 4                                                             ; inst 11
  %14 = sext i32 %13 to i64                                                        ; inst 12
  %15 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %14                 ; inst 13
  store i32 %8, i32* %15                                                           ; inst 14
  %16 = sext i32 %13 to i64                                                        ; inst 15
  %17 = add i64 %16, 1                                                             ; inst 16
  %18 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %17                 ; inst 17
  store i32 1, i32* %18                                                            ; inst 18
  %19 = sext i32 %13 to i64                                                        ; inst 19
  %20 = add i64 %19, 2                                                             ; inst 20
  %21 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %20                 ; inst 21
  %22 = call i32 @get_current_timestamp()                                          ; inst 22
  store i32 %22, i32* %21                                                          ; inst 23
  %23 = sext i32 %13 to i64                                                        ; inst 24
  %24 = add i64 %23, 3                                                             ; inst 25
  %25 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %24                 ; inst 26
  %26 = call i32 @simulate_memory_read(i32 %0)                                     ; inst 27
  store i32 %26, i32* %25                                                          ; inst 28
  %27 = call i32 @get_cache_line_size()                                            ; inst 29
  %28 = sdiv i32 %0, %27                                                           ; inst 30
  %29 = srem i32 %28, 64                                                           ; inst 31
  %30 = call i32 @get_cache_line_size()                                            ; inst 32
  %31 = mul i32 %30, 64                                                            ; inst 33
  %32 = sdiv i32 %0, %31                                                           ; inst 34
  %33 = call i32 @find_lru_way_l2([4096 x i32]* %2, i32 %29)                       ; inst 35
  %34 = mul i32 %29, 8                                                             ; inst 36
  %35 = add i32 %34, %33                                                           ; inst 37
  %36 = mul i32 %35, 4                                                             ; inst 38
  %37 = sext i32 %36 to i64                                                        ; inst 39
  %38 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %37               ; inst 40
  store i32 %32, i32* %38                                                          ; inst 41
  %39 = sext i32 %36 to i64                                                        ; inst 42
  %40 = add i64 %39, 1                                                             ; inst 43
  %41 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %40               ; inst 44
  store i32 1, i32* %41                                                            ; inst 45
  %42 = sext i32 %36 to i64                                                        ; inst 46
  %43 = add i64 %42, 2                                                             ; inst 47
  %44 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %43               ; inst 48
  %45 = call i32 @get_current_timestamp()                                          ; inst 49
  store i32 %45, i32* %44                                                          ; inst 50
  %46 = sext i32 %36 to i64                                                        ; inst 51
  %47 = add i64 %46, 3                                                             ; inst 52
  %48 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %47               ; inst 53
  %49 = call i32 @simulate_memory_read(i32 %0)                                     ; inst 54
  store i32 %49, i32* %48                                                          ; inst 55
  ret i32 1                                                                        ; inst 56
}

define i32 @find_lru_way_l1([256 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%23, %_8.if.exit.1]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.1]                              ; inst 3
  %4 = phi i32 [2147483647, %_0.entry.0], [%22, %_8.if.exit.1]                     ; inst 4
  %5 = call i32 @get_associativity()                                               ; inst 5
  %6 = icmp slt i32 %2, %5                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %7 = call i32 @get_associativity()                                               ; inst 8
  %8 = mul i32 %1, %7                                                              ; inst 9
  %9 = add i32 %8, %2                                                              ; inst 10
  %10 = mul i32 %9, 4                                                              ; inst 11
  %11 = sext i32 %10 to i64                                                        ; inst 12
  %12 = add i64 %11, 2                                                             ; inst 13
  %13 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %12                 ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = sext i32 %10 to i64                                                        ; inst 16
  %16 = add i64 %15, 1                                                             ; inst 17
  %17 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %16                 ; inst 18
  %18 = load i32, i32* %17                                                         ; inst 19
  %19 = icmp eq i32 %18, 0                                                         ; inst 20
  br i1 %19, label %_3.if.then.0, label %_4.if.else.0                              ; inst 21
_3.if.then.0:
  ret i32 %2                                                                       ; inst 22
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 23
_5.if.exit.0:
  %20 = icmp slt i32 %14, %4                                                       ; inst 24
  br i1 %20, label %_6.if.then.1, label %_7.if.else.1                              ; inst 25
_6.if.then.1:
  br label %_8.if.exit.1                                                           ; inst 26
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 27
_8.if.exit.1:
  %21 = phi i32 [%2, %_6.if.then.1], [%3, %_7.if.else.1]                           ; inst 28
  %22 = phi i32 [%14, %_6.if.then.1], [%4, %_7.if.else.1]                          ; inst 29
  %23 = add i32 %2, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_9.while.exit.0:
  ret i32 %3                                                                       ; inst 32
}

define i32 @find_lru_way_l2([4096 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.1]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%19, %_8.if.exit.1]                              ; inst 3
  %4 = phi i32 [2147483647, %_0.entry.0], [%20, %_8.if.exit.1]                     ; inst 4
  %5 = icmp slt i32 %2, 8                                                          ; inst 5
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = mul i32 %1, 8                                                               ; inst 7
  %7 = add i32 %6, %2                                                              ; inst 8
  %8 = mul i32 %7, 4                                                               ; inst 9
  %9 = sext i32 %8 to i64                                                          ; inst 10
  %10 = add i64 %9, 2                                                              ; inst 11
  %11 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %10               ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  %13 = sext i32 %8 to i64                                                         ; inst 14
  %14 = add i64 %13, 1                                                             ; inst 15
  %15 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %14               ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = icmp eq i32 %16, 0                                                         ; inst 18
  br i1 %17, label %_3.if.then.0, label %_4.if.else.0                              ; inst 19
_3.if.then.0:
  ret i32 %2                                                                       ; inst 20
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 21
_5.if.exit.0:
  %18 = icmp slt i32 %12, %4                                                       ; inst 22
  br i1 %18, label %_6.if.then.1, label %_7.if.else.1                              ; inst 23
_6.if.then.1:
  br label %_8.if.exit.1                                                           ; inst 24
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 25
_8.if.exit.1:
  %19 = phi i32 [%2, %_6.if.then.1], [%3, %_7.if.else.1]                           ; inst 26
  %20 = phi i32 [%12, %_6.if.then.1], [%4, %_7.if.else.1]                          ; inst 27
  %21 = add i32 %2, 1                                                              ; inst 28
  br label %_1.while.cond.0                                                        ; inst 29
_9.while.exit.0:
  ret i32 %3                                                                       ; inst 30
}

define i32 @update_lru_counters_l1([256 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = add i32 %1, 1                                                               ; inst 1
  ret i32 %2                                                                       ; inst 2
}

define i32 @update_lru_counters_l2([4096 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = add i32 %1, 1                                                               ; inst 1
  ret i32 %2                                                                       ; inst 2
}

define i32 @get_current_timestamp() {
_0.entry.0:
  %0 = call i32 @hash_function(i32 42)                                             ; inst 1
  %1 = srem i32 %0, 1000000                                                        ; inst 2
  ret i32 %1                                                                       ; inst 3
}

define i32 @simulate_memory_read(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 65536                                                          ; inst 1
  %2 = call i32 @hash_function(i32 %1)                                             ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @run_memory_manager() {
_0.entry.0:
  %0 = alloca [16 x i32]                                                           ; inst 1
  %1 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 0                      ; inst 2
  store i32 8, i32* %1                                                             ; inst 3
  %2 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 1                      ; inst 4
  store i32 16, i32* %2                                                            ; inst 5
  %3 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 2                      ; inst 6
  store i32 32, i32* %3                                                            ; inst 7
  %4 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 3                      ; inst 8
  store i32 64, i32* %4                                                            ; inst 9
  %5 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 4                      ; inst 10
  store i32 128, i32* %5                                                           ; inst 11
  %6 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 5                      ; inst 12
  store i32 256, i32* %6                                                           ; inst 13
  %7 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 6                      ; inst 14
  store i32 512, i32* %7                                                           ; inst 15
  %8 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 7                      ; inst 16
  store i32 1024, i32* %8                                                          ; inst 17
  %9 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 8                      ; inst 18
  store i32 2048, i32* %9                                                          ; inst 19
  %10 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 9                     ; inst 20
  store i32 4096, i32* %10                                                         ; inst 21
  %11 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 10                    ; inst 22
  store i32 8192, i32* %11                                                         ; inst 23
  %12 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 11                    ; inst 24
  store i32 16384, i32* %12                                                        ; inst 25
  %13 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 12                    ; inst 26
  store i32 32768, i32* %13                                                        ; inst 27
  %14 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 13                    ; inst 28
  store i32 65536, i32* %14                                                        ; inst 29
  %15 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 14                    ; inst 30
  store i32 131072, i32* %15                                                       ; inst 31
  %16 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 15                    ; inst 32
  store i32 262144, i32* %16                                                       ; inst 33
  %17 = alloca [16384 x i32]                                                       ; inst 34
  %18 = getelementptr [16384 x i32], [16384 x i32]* %17, i32 0, i32 0              ; inst 35
  br label %_1.array.cond.0                                                        ; inst 36
_1.array.cond.0:
  %19 = phi i32 [0, %_0.entry.0], [%22, %_2.array.body.0]                          ; inst 37
  %20 = icmp slt i32 %19, 16384                                                    ; inst 38
  br i1 %20, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 39
_2.array.body.0:
  %21 = getelementptr i32, i32* %18, i32 %19                                       ; inst 40
  store i32 0, i32* %21                                                            ; inst 41
  %22 = add i32 %19, 1                                                             ; inst 42
  br label %_1.array.cond.0                                                        ; inst 43
_3.array.exit.0:
  %23 = alloca [4096 x i32]                                                        ; inst 44
  %24 = getelementptr [4096 x i32], [4096 x i32]* %23, i32 0, i32 0                ; inst 45
  br label %_4.array.cond.1                                                        ; inst 46
_4.array.cond.1:
  %25 = phi i32 [0, %_3.array.exit.0], [%28, %_5.array.body.1]                     ; inst 47
  %26 = icmp slt i32 %25, 4096                                                     ; inst 48
  br i1 %26, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 49
_5.array.body.1:
  %27 = getelementptr i32, i32* %24, i32 %25                                       ; inst 50
  store i32 0, i32* %27                                                            ; inst 51
  %28 = add i32 %25, 1                                                             ; inst 52
  br label %_4.array.cond.1                                                        ; inst 53
_6.array.exit.1:
  %29 = alloca [4096 x i32]                                                        ; inst 54
  %30 = getelementptr [4096 x i32], [4096 x i32]* %29, i32 0, i32 0                ; inst 55
  br label %_7.array.cond.2                                                        ; inst 56
_7.array.cond.2:
  %31 = phi i32 [0, %_6.array.exit.1], [%34, %_8.array.body.2]                     ; inst 57
  %32 = icmp slt i32 %31, 4096                                                     ; inst 58
  br i1 %32, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 59
_8.array.body.2:
  %33 = getelementptr i32, i32* %30, i32 %31                                       ; inst 60
  store i32 0, i32* %33                                                            ; inst 61
  %34 = add i32 %31, 1                                                             ; inst 62
  br label %_7.array.cond.2                                                        ; inst 63
_9.array.exit.2:
  %35 = getelementptr [4096 x i32], [4096 x i32]* %23, i32 0, i64 0                ; inst 64
  store i32 0, i32* %35                                                            ; inst 65
  %36 = getelementptr [4096 x i32], [4096 x i32]* %23, i32 0, i64 1                ; inst 66
  store i32 65536, i32* %36                                                        ; inst 67
  br label %_10.while.cond.0                                                       ; inst 68
_10.while.cond.0:
  %37 = phi i32 [0, %_9.array.exit.2], [%68, %_29.if.exit.3]                       ; inst 69
  %38 = phi i32 [0, %_9.array.exit.2], [%69, %_29.if.exit.3]                       ; inst 70
  %39 = phi i32 [0, %_9.array.exit.2], [%70, %_29.if.exit.3]                       ; inst 71
  %40 = phi i32 [0, %_9.array.exit.2], [%82, %_29.if.exit.3]                       ; inst 72
  %41 = phi i32 [1, %_9.array.exit.2], [%83, %_29.if.exit.3]                       ; inst 73
  %42 = phi i32 [0, %_9.array.exit.2], [%84, %_29.if.exit.3]                       ; inst 74
  %43 = icmp slt i32 %42, 10                                                       ; inst 75
  br i1 %43, label %_11.while.body.0, label %_30.while.exit.0                      ; inst 76
_11.while.body.0:
  %44 = srem i32 %42, 16                                                           ; inst 77
  %45 = sext i32 %44 to i64                                                        ; inst 78
  %46 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i64 %45                   ; inst 79
  %47 = load i32, i32* %46                                                         ; inst 80
  %48 = call i32 @allocate_memory([16384 x i32]* %17, [4096 x i32]* %23, [4096 x i32]* %29, i32 %41, i32 %40, i32 %47) ; inst 81
  %49 = icmp sge i32 %48, 0                                                        ; inst 82
  br i1 %49, label %_12.if.then.0, label %_13.if.else.0                            ; inst 83
_12.if.then.0:
  %50 = add i32 %39, 1                                                             ; inst 84
  %51 = add i32 %40, 1                                                             ; inst 85
  %52 = call i32 @simulate_memory_usage(i32 %48, i32 %47)                          ; inst 86
  br label %_20.if.exit.0                                                          ; inst 87
_13.if.else.0:
  %53 = call i32 @run_garbage_collection([16384 x i32]* %17, [4096 x i32]* %23, [4096 x i32]* %29, i32 %41, i32 %40) ; inst 88
  %54 = add i32 %37, 1                                                             ; inst 89
  %55 = icmp sgt i32 %53, 0                                                        ; inst 90
  br i1 %55, label %_14.if.then.1, label %_18.if.else.1                            ; inst 91
_14.if.then.1:
  %56 = call i32 @allocate_memory([16384 x i32]* %17, [4096 x i32]* %23, [4096 x i32]* %29, i32 %41, i32 %40, i32 %47) ; inst 92
  %57 = icmp sge i32 %56, 0                                                        ; inst 93
  br i1 %57, label %_15.if.then.2, label %_16.if.else.2                            ; inst 94
_15.if.then.2:
  %58 = add i32 %39, 1                                                             ; inst 95
  %59 = add i32 %40, 1                                                             ; inst 96
  br label %_17.if.exit.2                                                          ; inst 97
_16.if.else.2:
  %60 = add i32 %38, 1                                                             ; inst 98
  br label %_17.if.exit.2                                                          ; inst 99
_17.if.exit.2:
  %61 = phi i32 [%38, %_15.if.then.2], [%60, %_16.if.else.2]                       ; inst 100
  %62 = phi i32 [%58, %_15.if.then.2], [%39, %_16.if.else.2]                       ; inst 101
  %63 = phi i32 [%59, %_15.if.then.2], [%40, %_16.if.else.2]                       ; inst 102
  br label %_19.if.exit.1                                                          ; inst 103
_18.if.else.1:
  %64 = add i32 %38, 1                                                             ; inst 104
  br label %_19.if.exit.1                                                          ; inst 105
_19.if.exit.1:
  %65 = phi i32 [%61, %_17.if.exit.2], [%64, %_18.if.else.1]                       ; inst 106
  %66 = phi i32 [%62, %_17.if.exit.2], [%39, %_18.if.else.1]                       ; inst 107
  %67 = phi i32 [%63, %_17.if.exit.2], [%40, %_18.if.else.1]                       ; inst 108
  br label %_20.if.exit.0                                                          ; inst 109
_20.if.exit.0:
  %68 = phi i32 [%37, %_12.if.then.0], [%54, %_19.if.exit.1]                       ; inst 110
  %69 = phi i32 [%38, %_12.if.then.0], [%65, %_19.if.exit.1]                       ; inst 111
  %70 = phi i32 [%50, %_12.if.then.0], [%66, %_19.if.exit.1]                       ; inst 112
  %71 = phi i32 [%51, %_12.if.then.0], [%67, %_19.if.exit.1]                       ; inst 113
  %72 = srem i32 %42, 10                                                           ; inst 114
  %73 = icmp eq i32 %72, 7                                                         ; inst 115
  br i1 %73, label %_21.lazy.then.0, label %_22.lazy.else.0                        ; inst 116
_21.lazy.then.0:
  %74 = icmp sgt i32 %71, 0                                                        ; inst 117
  br label %_23.lazy.exit.0                                                        ; inst 118
_22.lazy.else.0:
  br label %_23.lazy.exit.0                                                        ; inst 119
_23.lazy.exit.0:
  %75 = phi i1 [%74, %_21.lazy.then.0], [0, %_22.lazy.else.0]                      ; inst 120
  br i1 %75, label %_24.if.then.3, label %_28.if.else.3                            ; inst 121
_24.if.then.3:
  %76 = call i32 @free_random_block([16384 x i32]* %17, [4096 x i32]* %23, [4096 x i32]* %29, i32 %41, i32 %71) ; inst 122
  %77 = icmp sgt i32 %76, 0                                                        ; inst 123
  br i1 %77, label %_25.if.then.4, label %_26.if.else.4                            ; inst 124
_25.if.then.4:
  %78 = sub i32 %71, 1                                                             ; inst 125
  %79 = add i32 %41, 1                                                             ; inst 126
  br label %_27.if.exit.4                                                          ; inst 127
_26.if.else.4:
  br label %_27.if.exit.4                                                          ; inst 128
_27.if.exit.4:
  %80 = phi i32 [%78, %_25.if.then.4], [%71, %_26.if.else.4]                       ; inst 129
  %81 = phi i32 [%79, %_25.if.then.4], [%41, %_26.if.else.4]                       ; inst 130
  br label %_29.if.exit.3                                                          ; inst 131
_28.if.else.3:
  br label %_29.if.exit.3                                                          ; inst 132
_29.if.exit.3:
  %82 = phi i32 [%80, %_27.if.exit.4], [%71, %_28.if.else.3]                       ; inst 133
  %83 = phi i32 [%81, %_27.if.exit.4], [%41, %_28.if.else.3]                       ; inst 134
  %84 = add i32 %42, 1                                                             ; inst 135
  br label %_10.while.cond.0                                                       ; inst 136
_30.while.exit.0:
  %85 = mul i32 %39, 1000                                                          ; inst 137
  %86 = add i32 %39, %38                                                           ; inst 138
  %87 = sdiv i32 %85, %86                                                          ; inst 139
  %88 = add i32 %87, %37                                                           ; inst 140
  ret i32 %88                                                                      ; inst 141
}

define i32 @allocate_memory([16384 x i32]* %0, [4096 x i32]* %1, [4096 x i32]* %2, i32 %3, i32 %4, i32 %5) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%57, %_11.if.exit.0]                             ; inst 2
  %7 = icmp slt i32 %6, %3                                                         ; inst 3
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 4
_2.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 5
  %9 = mul i64 %8, 2                                                               ; inst 6
  %10 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %9                ; inst 7
  %11 = load i32, i32* %10                                                         ; inst 8
  %12 = sext i32 %6 to i64                                                         ; inst 9
  %13 = mul i64 %12, 2                                                             ; inst 10
  %14 = add i64 %13, 1                                                             ; inst 11
  %15 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %14               ; inst 12
  %16 = load i32, i32* %15                                                         ; inst 13
  %17 = icmp sge i32 %16, %5                                                       ; inst 14
  br i1 %17, label %_3.if.then.0, label %_10.if.else.0                             ; inst 15
_3.if.then.0:
  %18 = sext i32 %4 to i64                                                         ; inst 16
  %19 = mul i64 %18, 2                                                             ; inst 17
  %20 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %19               ; inst 18
  store i32 %11, i32* %20                                                          ; inst 19
  %21 = sext i32 %4 to i64                                                         ; inst 20
  %22 = mul i64 %21, 2                                                             ; inst 21
  %23 = add i64 %22, 1                                                             ; inst 22
  %24 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %23               ; inst 23
  store i32 %5, i32* %24                                                           ; inst 24
  %25 = icmp eq i32 %16, %5                                                        ; inst 25
  br i1 %25, label %_4.if.then.1, label %_8.if.else.1                              ; inst 26
_4.if.then.1:
  br label %_5.while.cond.1                                                        ; inst 27
_5.while.cond.1:
  %26 = phi i32 [%6, %_4.if.then.1], [%47, %_6.while.body.1]                       ; inst 28
  %27 = sub i32 %3, 1                                                              ; inst 29
  %28 = icmp slt i32 %26, %27                                                      ; inst 30
  br i1 %28, label %_6.while.body.1, label %_7.while.exit.1                        ; inst 31
_6.while.body.1:
  %29 = sext i32 %26 to i64                                                        ; inst 32
  %30 = mul i64 %29, 2                                                             ; inst 33
  %31 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %30               ; inst 34
  %32 = sext i32 %26 to i64                                                        ; inst 35
  %33 = add i64 %32, 1                                                             ; inst 36
  %34 = mul i64 %33, 2                                                             ; inst 37
  %35 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %34               ; inst 38
  %36 = load i32, i32* %35                                                         ; inst 39
  store i32 %36, i32* %31                                                          ; inst 40
  %37 = sext i32 %26 to i64                                                        ; inst 41
  %38 = mul i64 %37, 2                                                             ; inst 42
  %39 = add i64 %38, 1                                                             ; inst 43
  %40 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %39               ; inst 44
  %41 = sext i32 %26 to i64                                                        ; inst 45
  %42 = add i64 %41, 1                                                             ; inst 46
  %43 = mul i64 %42, 2                                                             ; inst 47
  %44 = add i64 %43, 1                                                             ; inst 48
  %45 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %44               ; inst 49
  %46 = load i32, i32* %45                                                         ; inst 50
  store i32 %46, i32* %40                                                          ; inst 51
  %47 = add i32 %26, 1                                                             ; inst 52
  br label %_5.while.cond.1                                                        ; inst 53
_7.while.exit.1:
  br label %_9.if.exit.1                                                           ; inst 54
_8.if.else.1:
  %48 = sext i32 %6 to i64                                                         ; inst 55
  %49 = mul i64 %48, 2                                                             ; inst 56
  %50 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %49               ; inst 57
  %51 = add i32 %11, %5                                                            ; inst 58
  store i32 %51, i32* %50                                                          ; inst 59
  %52 = sext i32 %6 to i64                                                         ; inst 60
  %53 = mul i64 %52, 2                                                             ; inst 61
  %54 = add i64 %53, 1                                                             ; inst 62
  %55 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %54               ; inst 63
  %56 = sub i32 %16, %5                                                            ; inst 64
  store i32 %56, i32* %55                                                          ; inst 65
  br label %_9.if.exit.1                                                           ; inst 66
_9.if.exit.1:
  ret i32 %11                                                                      ; inst 67
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 68
_11.if.exit.0:
  %57 = add i32 %6, 1                                                              ; inst 69
  br label %_1.while.cond.0                                                        ; inst 70
_12.while.exit.0:
  ret i32 -1                                                                       ; inst 71
}

define i32 @simulate_memory_usage(i32 %0, i32 %1) {
_0.entry.0:
  %2 = add i32 %0, %1                                                              ; inst 1
  %3 = srem i32 %2, 5                                                              ; inst 2
  %4 = icmp eq i32 %3, 0                                                           ; inst 3
  br i1 %4, label %_1.if.then.0, label %_5.if.else.0                               ; inst 4
_1.if.then.0:
  br label %_2.while.cond.0                                                        ; inst 5
_2.while.cond.0:
  %5 = phi i32 [0, %_1.if.then.0], [%9, %_3.while.body.0]                          ; inst 6
  %6 = phi i32 [0, %_1.if.then.0], [%8, %_3.while.body.0]                          ; inst 7
  %7 = icmp slt i32 %5, %1                                                         ; inst 8
  br i1 %7, label %_3.while.body.0, label %_4.while.exit.0                         ; inst 9
_3.while.body.0:
  %8 = add i32 %6, 1                                                               ; inst 10
  %9 = add i32 %5, 4                                                               ; inst 11
  br label %_2.while.cond.0                                                        ; inst 12
_4.while.exit.0:
  br label %_24.if.exit.0                                                          ; inst 13
_5.if.else.0:
  %10 = icmp eq i32 %3, 1                                                          ; inst 14
  br i1 %10, label %_6.if.then.1, label %_10.if.else.1                             ; inst 15
_6.if.then.1:
  %11 = sdiv i32 %1, 8                                                             ; inst 16
  br label %_7.while.cond.1                                                        ; inst 17
_7.while.cond.1:
  %12 = phi i32 [0, %_6.if.then.1], [%17, %_8.while.body.1]                        ; inst 18
  %13 = phi i32 [0, %_6.if.then.1], [%18, %_8.while.body.1]                        ; inst 19
  %14 = icmp slt i32 %13, %11                                                      ; inst 20
  br i1 %14, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 21
_8.while.body.1:
  %15 = add i32 %13, %0                                                            ; inst 22
  %16 = call i32 @hash_function(i32 %15)                                           ; inst 23
  %17 = add i32 %12, 1                                                             ; inst 24
  %18 = add i32 %13, 1                                                             ; inst 25
  br label %_7.while.cond.1                                                        ; inst 26
_9.while.exit.1:
  br label %_23.if.exit.1                                                          ; inst 27
_10.if.else.1:
  %19 = icmp eq i32 %3, 2                                                          ; inst 28
  br i1 %19, label %_11.if.then.2, label %_15.if.else.2                            ; inst 29
_11.if.then.2:
  br label %_12.while.cond.2                                                       ; inst 30
_12.while.cond.2:
  %20 = phi i32 [0, %_11.if.then.2], [%24, %_13.while.body.2]                      ; inst 31
  %21 = phi i32 [0, %_11.if.then.2], [%23, %_13.while.body.2]                      ; inst 32
  %22 = icmp slt i32 %20, %1                                                       ; inst 33
  br i1 %22, label %_13.while.body.2, label %_14.while.exit.2                      ; inst 34
_13.while.body.2:
  %23 = add i32 %21, 1                                                             ; inst 35
  %24 = add i32 %20, 16                                                            ; inst 36
  br label %_12.while.cond.2                                                       ; inst 37
_14.while.exit.2:
  br label %_22.if.exit.2                                                          ; inst 38
_15.if.else.2:
  %25 = icmp eq i32 %3, 3                                                          ; inst 39
  br i1 %25, label %_16.if.then.3, label %_20.if.else.3                            ; inst 40
_16.if.then.3:
  %26 = sdiv i32 %1, 4                                                             ; inst 41
  br label %_17.while.cond.3                                                       ; inst 42
_17.while.cond.3:
  %27 = phi i32 [0, %_16.if.then.3], [%31, %_18.while.body.3]                      ; inst 43
  %28 = phi i32 [0, %_16.if.then.3], [%30, %_18.while.body.3]                      ; inst 44
  %29 = icmp slt i32 %27, %26                                                      ; inst 45
  br i1 %29, label %_18.while.body.3, label %_19.while.exit.3                      ; inst 46
_18.while.body.3:
  %30 = add i32 %28, 1                                                             ; inst 47
  %31 = add i32 %27, 1                                                             ; inst 48
  br label %_17.while.cond.3                                                       ; inst 49
_19.while.exit.3:
  br label %_21.if.exit.3                                                          ; inst 50
_20.if.else.3:
  %32 = call i32 @simulate_complex_memory_pattern(i32 %0, i32 %1)                  ; inst 51
  br label %_21.if.exit.3                                                          ; inst 52
_21.if.exit.3:
  %33 = phi i32 [%28, %_19.while.exit.3], [%32, %_20.if.else.3]                    ; inst 53
  br label %_22.if.exit.2                                                          ; inst 54
_22.if.exit.2:
  %34 = phi i32 [%21, %_14.while.exit.2], [%33, %_21.if.exit.3]                    ; inst 55
  br label %_23.if.exit.1                                                          ; inst 56
_23.if.exit.1:
  %35 = phi i32 [%12, %_9.while.exit.1], [%34, %_22.if.exit.2]                     ; inst 57
  br label %_24.if.exit.0                                                          ; inst 58
_24.if.exit.0:
  %36 = phi i32 [%6, %_4.while.exit.0], [%35, %_23.if.exit.1]                      ; inst 59
  ret i32 %36                                                                      ; inst 60
}

define i32 @simulate_complex_memory_pattern(i32 %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%33, %_17.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%34, %_17.if.exit.0]                             ; inst 3
  %4 = icmp slt i32 %3, 4                                                          ; inst 4
  br i1 %4, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 5
_2.while.body.0:
  %5 = sdiv i32 %1, 4                                                              ; inst 6
  %6 = mul i32 %3, %5                                                              ; inst 7
  %7 = add i32 %0, %6                                                              ; inst 8
  %8 = srem i32 %3, 2                                                              ; inst 9
  %9 = icmp eq i32 %8, 0                                                           ; inst 10
  br i1 %9, label %_3.if.then.0, label %_10.if.else.0                              ; inst 11
_3.if.then.0:
  br label %_4.while.cond.1                                                        ; inst 12
_4.while.cond.1:
  %10 = phi i32 [%2, %_3.if.then.0], [%19, %_8.if.exit.1]                          ; inst 13
  %11 = phi i32 [0, %_3.if.then.0], [%20, %_8.if.exit.1]                           ; inst 14
  %12 = icmp slt i32 %11, %5                                                       ; inst 15
  br i1 %12, label %_5.while.body.1, label %_9.while.exit.1                        ; inst 16
_5.while.body.1:
  %13 = add i32 %10, 1                                                             ; inst 17
  %14 = srem i32 %11, 64                                                           ; inst 18
  %15 = icmp eq i32 %14, 0                                                         ; inst 19
  br i1 %15, label %_6.if.then.1, label %_7.if.else.1                              ; inst 20
_6.if.then.1:
  %16 = add i32 %7, %11                                                            ; inst 21
  %17 = call i32 @compute_checksum(i32 %16)                                        ; inst 22
  %18 = add i32 %13, %17                                                           ; inst 23
  br label %_8.if.exit.1                                                           ; inst 24
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 25
_8.if.exit.1:
  %19 = phi i32 [%18, %_6.if.then.1], [%13, %_7.if.else.1]                         ; inst 26
  %20 = add i32 %11, 4                                                             ; inst 27
  br label %_4.while.cond.1                                                        ; inst 28
_9.while.exit.1:
  br label %_17.if.exit.0                                                          ; inst 29
_10.if.else.0:
  %21 = sub i32 %5, 4                                                              ; inst 30
  br label %_11.while.cond.2                                                       ; inst 31
_11.while.cond.2:
  %22 = phi i32 [%2, %_10.if.else.0], [%31, %_15.if.exit.2]                        ; inst 32
  %23 = phi i32 [%21, %_10.if.else.0], [%32, %_15.if.exit.2]                       ; inst 33
  %24 = icmp sge i32 %23, 0                                                        ; inst 34
  br i1 %24, label %_12.while.body.2, label %_16.while.exit.2                      ; inst 35
_12.while.body.2:
  %25 = add i32 %22, 1                                                             ; inst 36
  %26 = srem i32 %23, 128                                                          ; inst 37
  %27 = icmp eq i32 %26, 0                                                         ; inst 38
  br i1 %27, label %_13.if.then.2, label %_14.if.else.2                            ; inst 39
_13.if.then.2:
  %28 = add i32 %7, %23                                                            ; inst 40
  %29 = call i32 @compute_complex_function(i32 %28)                                ; inst 41
  %30 = add i32 %25, %29                                                           ; inst 42
  br label %_15.if.exit.2                                                          ; inst 43
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 44
_15.if.exit.2:
  %31 = phi i32 [%30, %_13.if.then.2], [%25, %_14.if.else.2]                       ; inst 45
  %32 = sub i32 %23, 4                                                             ; inst 46
  br label %_11.while.cond.2                                                       ; inst 47
_16.while.exit.2:
  br label %_17.if.exit.0                                                          ; inst 48
_17.if.exit.0:
  %33 = phi i32 [%10, %_9.while.exit.1], [%22, %_16.while.exit.2]                  ; inst 49
  %34 = add i32 %3, 1                                                              ; inst 50
  br label %_1.while.cond.0                                                        ; inst 51
_18.while.exit.0:
  ret i32 %2                                                                       ; inst 52
}

define i32 @compute_checksum(i32 %0) {
_0.entry.0:
  %1 = shl i32 %0, 13                                                              ; inst 1
  %2 = xor i32 %0, %1                                                              ; inst 2
  %3 = ashr i32 %2, 17                                                             ; inst 3
  %4 = xor i32 %2, %3                                                              ; inst 4
  %5 = shl i32 %4, 5                                                               ; inst 5
  %6 = xor i32 %4, %5                                                              ; inst 6
  %7 = srem i32 %6, 1000                                                           ; inst 7
  ret i32 %7                                                                       ; inst 8
}

define i32 @compute_complex_function(i32 %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %2 = phi i32 [%0, %_0.entry.0], [%8, %_2.while.body.0]                           ; inst 3
  %3 = icmp slt i32 %1, 10                                                         ; inst 4
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %4 = mul i32 %2, 17                                                              ; inst 6
  %5 = add i32 %4, 31                                                              ; inst 7
  %6 = srem i32 %5, 65537                                                          ; inst 8
  %7 = ashr i32 %6, 8                                                              ; inst 9
  %8 = xor i32 %6, %7                                                              ; inst 10
  %9 = add i32 %1, 1                                                               ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %10 = srem i32 %2, 100                                                           ; inst 13
  ret i32 %10                                                                      ; inst 14
}

define i32 @run_garbage_collection([16384 x i32]* %0, [4096 x i32]* %1, [4096 x i32]* %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = alloca [4096 x i1]                                                          ; inst 1
  %6 = getelementptr [4096 x i1], [4096 x i1]* %5, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 4
  %8 = icmp slt i32 %7, 4096                                                       ; inst 5
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %9 = getelementptr i1, i1* %6, i32 %7                                            ; inst 7
  store i1 0, i1* %9                                                               ; inst 8
  %10 = add i32 %7, 1                                                              ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %11 = call i32 @mark_reachable_blocks([4096 x i32]* %2, i32 %4, [4096 x i1]* %5) ; inst 11
  br label %_4.while.cond.0                                                        ; inst 12
_4.while.cond.0:
  %12 = phi i32 [0, %_3.array.exit.0], [%38, %_8.if.exit.0]                        ; inst 13
  %13 = phi i32 [0, %_3.array.exit.0], [%39, %_8.if.exit.0]                        ; inst 14
  %14 = phi i32 [0, %_3.array.exit.0], [%40, %_8.if.exit.0]                        ; inst 15
  %15 = icmp slt i32 %14, %4                                                       ; inst 16
  br i1 %15, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 17
_5.while.body.0:
  %16 = sext i32 %14 to i64                                                        ; inst 18
  %17 = getelementptr [4096 x i1], [4096 x i1]* %5, i32 0, i64 %16                 ; inst 19
  %18 = load i1, i1* %17                                                           ; inst 20
  %19 = icmp eq i1 %18, 0                                                          ; inst 21
  br i1 %19, label %_6.if.then.0, label %_7.if.else.0                              ; inst 22
_6.if.then.0:
  %20 = sext i32 %14 to i64                                                        ; inst 23
  %21 = mul i64 %20, 2                                                             ; inst 24
  %22 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %21               ; inst 25
  %23 = load i32, i32* %22                                                         ; inst 26
  %24 = sext i32 %14 to i64                                                        ; inst 27
  %25 = mul i64 %24, 2                                                             ; inst 28
  %26 = add i64 %25, 1                                                             ; inst 29
  %27 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %26               ; inst 30
  %28 = load i32, i32* %27                                                         ; inst 31
  %29 = sext i32 %3 to i64                                                         ; inst 32
  %30 = mul i64 %29, 2                                                             ; inst 33
  %31 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %30               ; inst 34
  store i32 %23, i32* %31                                                          ; inst 35
  %32 = sext i32 %3 to i64                                                         ; inst 36
  %33 = mul i64 %32, 2                                                             ; inst 37
  %34 = add i64 %33, 1                                                             ; inst 38
  %35 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %34               ; inst 39
  store i32 %28, i32* %35                                                          ; inst 40
  %36 = add i32 %12, %28                                                           ; inst 41
  %37 = add i32 %13, 1                                                             ; inst 42
  br label %_8.if.exit.0                                                           ; inst 43
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 44
_8.if.exit.0:
  %38 = phi i32 [%36, %_6.if.then.0], [%12, %_7.if.else.0]                         ; inst 45
  %39 = phi i32 [%37, %_6.if.then.0], [%13, %_7.if.else.0]                         ; inst 46
  %40 = add i32 %14, 1                                                             ; inst 47
  br label %_4.while.cond.0                                                        ; inst 48
_9.while.exit.0:
  %41 = add i32 %3, %13                                                            ; inst 49
  %42 = call i32 @coalesce_free_blocks([4096 x i32]* %1, i32 %41)                  ; inst 50
  %43 = add i32 %12, %42                                                           ; inst 51
  ret i32 %43                                                                      ; inst 52
}

define i32 @mark_reachable_blocks([4096 x i32]* %0, i32 %1, [4096 x i1]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%21, %_5.if.exit.0]                              ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%20, %_5.if.exit.0]                              ; inst 3
  %5 = icmp slt i32 %3, %1                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 6
  %7 = mul i64 %6, 2                                                               ; inst 7
  %8 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %7                 ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = sext i32 %3 to i64                                                         ; inst 10
  %11 = mul i64 %10, 2                                                             ; inst 11
  %12 = add i64 %11, 1                                                             ; inst 12
  %13 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %12               ; inst 13
  %14 = load i32, i32* %13                                                         ; inst 14
  %15 = call i32 @compute_reachability_score(i32 %9, i32 %14, i32 %3)              ; inst 15
  %16 = icmp sgt i32 %15, 50                                                       ; inst 16
  br i1 %16, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  %17 = sext i32 %3 to i64                                                         ; inst 18
  %18 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %17                 ; inst 19
  store i1 1, i1* %18                                                              ; inst 20
  %19 = add i32 %4, 1                                                              ; inst 21
  br label %_5.if.exit.0                                                           ; inst 22
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 23
_5.if.exit.0:
  %20 = phi i32 [%19, %_3.if.then.0], [%4, %_4.if.else.0]                          ; inst 24
  %21 = add i32 %3, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_6.while.exit.0:
  ret i32 %4                                                                       ; inst 27
}

define i32 @compute_reachability_score(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = sub i32 100, %2                                                             ; inst 1
  %4 = icmp sge i32 %1, 64                                                         ; inst 2
  br i1 %4, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 3
_1.lazy.then.0:
  %5 = icmp sle i32 %1, 4096                                                       ; inst 4
  br label %_3.lazy.exit.0                                                         ; inst 5
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 6
_3.lazy.exit.0:
  %6 = phi i1 [%5, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 7
  br i1 %6, label %_4.if.then.0, label %_5.if.else.0                               ; inst 8
_4.if.then.0:
  %7 = add i32 %3, 30                                                              ; inst 9
  br label %_6.if.exit.0                                                           ; inst 10
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 11
_6.if.exit.0:
  %8 = phi i32 [%7, %_4.if.then.0], [%3, %_5.if.else.0]                            ; inst 12
  %9 = srem i32 %0, 4096                                                           ; inst 13
  %10 = icmp eq i32 %9, 0                                                          ; inst 14
  br i1 %10, label %_7.if.then.1, label %_8.if.else.1                              ; inst 15
_7.if.then.1:
  %11 = add i32 %8, 20                                                             ; inst 16
  br label %_9.if.exit.1                                                           ; inst 17
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 18
_9.if.exit.1:
  %12 = phi i32 [%11, %_7.if.then.1], [%8, %_8.if.else.1]                          ; inst 19
  %13 = add i32 %0, %1                                                             ; inst 20
  %14 = call i32 @hash_function(i32 %13)                                           ; inst 21
  %15 = srem i32 %14, 40                                                           ; inst 22
  %16 = add i32 %12, %15                                                           ; inst 23
  ret i32 %16                                                                      ; inst 24
}

define i32 @coalesce_free_blocks([4096 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%56, %_8.while.exit.1]                           ; inst 2
  %3 = sub i32 %1, 1                                                               ; inst 3
  %4 = icmp slt i32 %2, %3                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%55, %_7.if.exit.0]                         ; inst 7
  %6 = sub i32 %1, 1                                                               ; inst 8
  %7 = sub i32 %6, %2                                                              ; inst 9
  %8 = icmp slt i32 %5, %7                                                         ; inst 10
  br i1 %8, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 11
_4.while.body.1:
  %9 = sext i32 %5 to i64                                                          ; inst 12
  %10 = mul i64 %9, 2                                                              ; inst 13
  %11 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %10               ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = sext i32 %5 to i64                                                         ; inst 16
  %14 = add i64 %13, 1                                                             ; inst 17
  %15 = mul i64 %14, 2                                                             ; inst 18
  %16 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %15               ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  %18 = icmp sgt i32 %12, %17                                                      ; inst 21
  br i1 %18, label %_5.if.then.0, label %_6.if.else.0                              ; inst 22
_5.if.then.0:
  %19 = sext i32 %5 to i64                                                         ; inst 23
  %20 = mul i64 %19, 2                                                             ; inst 24
  %21 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %20               ; inst 25
  %22 = load i32, i32* %21                                                         ; inst 26
  %23 = sext i32 %5 to i64                                                         ; inst 27
  %24 = mul i64 %23, 2                                                             ; inst 28
  %25 = add i64 %24, 1                                                             ; inst 29
  %26 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %25               ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = sext i32 %5 to i64                                                         ; inst 32
  %29 = mul i64 %28, 2                                                             ; inst 33
  %30 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %29               ; inst 34
  %31 = sext i32 %5 to i64                                                         ; inst 35
  %32 = add i64 %31, 1                                                             ; inst 36
  %33 = mul i64 %32, 2                                                             ; inst 37
  %34 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %33               ; inst 38
  %35 = load i32, i32* %34                                                         ; inst 39
  store i32 %35, i32* %30                                                          ; inst 40
  %36 = sext i32 %5 to i64                                                         ; inst 41
  %37 = mul i64 %36, 2                                                             ; inst 42
  %38 = add i64 %37, 1                                                             ; inst 43
  %39 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %38               ; inst 44
  %40 = sext i32 %5 to i64                                                         ; inst 45
  %41 = add i64 %40, 1                                                             ; inst 46
  %42 = mul i64 %41, 2                                                             ; inst 47
  %43 = add i64 %42, 1                                                             ; inst 48
  %44 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %43               ; inst 49
  %45 = load i32, i32* %44                                                         ; inst 50
  store i32 %45, i32* %39                                                          ; inst 51
  %46 = sext i32 %5 to i64                                                         ; inst 52
  %47 = add i64 %46, 1                                                             ; inst 53
  %48 = mul i64 %47, 2                                                             ; inst 54
  %49 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %48               ; inst 55
  store i32 %22, i32* %49                                                          ; inst 56
  %50 = sext i32 %5 to i64                                                         ; inst 57
  %51 = add i64 %50, 1                                                             ; inst 58
  %52 = mul i64 %51, 2                                                             ; inst 59
  %53 = add i64 %52, 1                                                             ; inst 60
  %54 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %53               ; inst 61
  store i32 %27, i32* %54                                                          ; inst 62
  br label %_7.if.exit.0                                                           ; inst 63
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 64
_7.if.exit.0:
  %55 = add i32 %5, 1                                                              ; inst 65
  br label %_3.while.cond.1                                                        ; inst 66
_8.while.exit.1:
  %56 = add i32 %2, 1                                                              ; inst 67
  br label %_1.while.cond.0                                                        ; inst 68
_9.while.exit.0:
  br label %_10.while.cond.2                                                       ; inst 69
_10.while.cond.2:
  %57 = phi i32 [0, %_9.while.exit.0], [%113, %_17.if.exit.1]                      ; inst 70
  %58 = phi i32 [0, %_9.while.exit.0], [%114, %_17.if.exit.1]                      ; inst 71
  %59 = sub i32 %1, 1                                                              ; inst 72
  %60 = icmp slt i32 %58, %59                                                      ; inst 73
  br i1 %60, label %_11.while.body.2, label %_18.while.exit.2                      ; inst 74
_11.while.body.2:
  %61 = sext i32 %58 to i64                                                        ; inst 75
  %62 = mul i64 %61, 2                                                             ; inst 76
  %63 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %62               ; inst 77
  %64 = load i32, i32* %63                                                         ; inst 78
  %65 = sext i32 %58 to i64                                                        ; inst 79
  %66 = mul i64 %65, 2                                                             ; inst 80
  %67 = add i64 %66, 1                                                             ; inst 81
  %68 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %67               ; inst 82
  %69 = load i32, i32* %68                                                         ; inst 83
  %70 = sext i32 %58 to i64                                                        ; inst 84
  %71 = add i64 %70, 1                                                             ; inst 85
  %72 = mul i64 %71, 2                                                             ; inst 86
  %73 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %72               ; inst 87
  %74 = load i32, i32* %73                                                         ; inst 88
  %75 = add i32 %64, %69                                                           ; inst 89
  %76 = icmp eq i32 %75, %74                                                       ; inst 90
  br i1 %76, label %_12.if.then.1, label %_16.if.else.1                            ; inst 91
_12.if.then.1:
  %77 = sext i32 %58 to i64                                                        ; inst 92
  %78 = mul i64 %77, 2                                                             ; inst 93
  %79 = add i64 %78, 1                                                             ; inst 94
  %80 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %79               ; inst 95
  %81 = sext i32 %58 to i64                                                        ; inst 96
  %82 = add i64 %81, 1                                                             ; inst 97
  %83 = mul i64 %82, 2                                                             ; inst 98
  %84 = add i64 %83, 1                                                             ; inst 99
  %85 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %84               ; inst 100
  %86 = load i32, i32* %85                                                         ; inst 101
  %87 = add i32 %69, %86                                                           ; inst 102
  store i32 %87, i32* %80                                                          ; inst 103
  %88 = add i32 %58, 1                                                             ; inst 104
  br label %_13.while.cond.3                                                       ; inst 105
_13.while.cond.3:
  %89 = phi i32 [%88, %_12.if.then.1], [%110, %_14.while.body.3]                   ; inst 106
  %90 = sub i32 %1, 1                                                              ; inst 107
  %91 = icmp slt i32 %89, %90                                                      ; inst 108
  br i1 %91, label %_14.while.body.3, label %_15.while.exit.3                      ; inst 109
_14.while.body.3:
  %92 = sext i32 %89 to i64                                                        ; inst 110
  %93 = mul i64 %92, 2                                                             ; inst 111
  %94 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %93               ; inst 112
  %95 = sext i32 %89 to i64                                                        ; inst 113
  %96 = add i64 %95, 1                                                             ; inst 114
  %97 = mul i64 %96, 2                                                             ; inst 115
  %98 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %97               ; inst 116
  %99 = load i32, i32* %98                                                         ; inst 117
  store i32 %99, i32* %94                                                          ; inst 118
  %100 = sext i32 %89 to i64                                                       ; inst 119
  %101 = mul i64 %100, 2                                                           ; inst 120
  %102 = add i64 %101, 1                                                           ; inst 121
  %103 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %102             ; inst 122
  %104 = sext i32 %89 to i64                                                       ; inst 123
  %105 = add i64 %104, 1                                                           ; inst 124
  %106 = mul i64 %105, 2                                                           ; inst 125
  %107 = add i64 %106, 1                                                           ; inst 126
  %108 = getelementptr [4096 x i32], [4096 x i32]* %0, i32 0, i64 %107             ; inst 127
  %109 = load i32, i32* %108                                                       ; inst 128
  store i32 %109, i32* %103                                                        ; inst 129
  %110 = add i32 %89, 1                                                            ; inst 130
  br label %_13.while.cond.3                                                       ; inst 131
_15.while.exit.3:
  %111 = add i32 %57, 1                                                            ; inst 132
  br label %_17.if.exit.1                                                          ; inst 133
_16.if.else.1:
  %112 = add i32 %58, 1                                                            ; inst 134
  br label %_17.if.exit.1                                                          ; inst 135
_17.if.exit.1:
  %113 = phi i32 [%111, %_15.while.exit.3], [%57, %_16.if.else.1]                  ; inst 136
  %114 = phi i32 [%58, %_15.while.exit.3], [%112, %_16.if.else.1]                  ; inst 137
  br label %_10.while.cond.2                                                       ; inst 138
_18.while.exit.2:
  ret i32 %57                                                                      ; inst 139
}

define i32 @free_random_block([16384 x i32]* %0, [4096 x i32]* %1, [4096 x i32]* %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = icmp eq i32 %4, 0                                                           ; inst 1
  br i1 %5, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 0                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %6 = call i32 @hash_function(i32 %4)                                             ; inst 5
  %7 = srem i32 %6, %4                                                             ; inst 6
  %8 = sext i32 %7 to i64                                                          ; inst 7
  %9 = mul i64 %8, 2                                                               ; inst 8
  %10 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %9                ; inst 9
  %11 = load i32, i32* %10                                                         ; inst 10
  %12 = sext i32 %7 to i64                                                         ; inst 11
  %13 = mul i64 %12, 2                                                             ; inst 12
  %14 = add i64 %13, 1                                                             ; inst 13
  %15 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %14               ; inst 14
  %16 = load i32, i32* %15                                                         ; inst 15
  %17 = sext i32 %3 to i64                                                         ; inst 16
  %18 = mul i64 %17, 2                                                             ; inst 17
  %19 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %18               ; inst 18
  store i32 %11, i32* %19                                                          ; inst 19
  %20 = sext i32 %3 to i64                                                         ; inst 20
  %21 = mul i64 %20, 2                                                             ; inst 21
  %22 = add i64 %21, 1                                                             ; inst 22
  %23 = getelementptr [4096 x i32], [4096 x i32]* %1, i32 0, i64 %22               ; inst 23
  store i32 %16, i32* %23                                                          ; inst 24
  br label %_4.while.cond.0                                                        ; inst 25
_4.while.cond.0:
  %24 = phi i32 [%7, %_3.if.exit.0], [%45, %_5.while.body.0]                       ; inst 26
  %25 = sub i32 %4, 1                                                              ; inst 27
  %26 = icmp slt i32 %24, %25                                                      ; inst 28
  br i1 %26, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 29
_5.while.body.0:
  %27 = sext i32 %24 to i64                                                        ; inst 30
  %28 = mul i64 %27, 2                                                             ; inst 31
  %29 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %28               ; inst 32
  %30 = sext i32 %24 to i64                                                        ; inst 33
  %31 = add i64 %30, 1                                                             ; inst 34
  %32 = mul i64 %31, 2                                                             ; inst 35
  %33 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %32               ; inst 36
  %34 = load i32, i32* %33                                                         ; inst 37
  store i32 %34, i32* %29                                                          ; inst 38
  %35 = sext i32 %24 to i64                                                        ; inst 39
  %36 = mul i64 %35, 2                                                             ; inst 40
  %37 = add i64 %36, 1                                                             ; inst 41
  %38 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %37               ; inst 42
  %39 = sext i32 %24 to i64                                                        ; inst 43
  %40 = add i64 %39, 1                                                             ; inst 44
  %41 = mul i64 %40, 2                                                             ; inst 45
  %42 = add i64 %41, 1                                                             ; inst 46
  %43 = getelementptr [4096 x i32], [4096 x i32]* %2, i32 0, i64 %42               ; inst 47
  %44 = load i32, i32* %43                                                         ; inst 48
  store i32 %44, i32* %38                                                          ; inst 49
  %45 = add i32 %24, 1                                                             ; inst 50
  br label %_4.while.cond.0                                                        ; inst 51
_6.while.exit.0:
  ret i32 1                                                                        ; inst 52
}

define i32 @run_hash_table_tests() {
_0.entry.0:
  %0 = call i32 @get_hash_table_size()                                             ; inst 1
  %1 = alloca [2048 x i32]                                                         ; inst 2
  %2 = getelementptr [2048 x i32], [2048 x i32]* %1, i32 0, i32 0                  ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 2048                                                       ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [4096 x i1]                                                          ; inst 12
  %8 = getelementptr [4096 x i1], [4096 x i1]* %7, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 4096                                                      ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i1, i1* %8, i32 %9                                           ; inst 18
  store i1 0, i1* %11                                                              ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [4096 x i1]                                                         ; inst 22
  %14 = getelementptr [4096 x i1], [4096 x i1]* %13, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 25
  %16 = icmp slt i32 %15, 4096                                                     ; inst 26
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %17 = getelementptr i1, i1* %14, i32 %15                                         ; inst 28
  store i1 0, i1* %17                                                              ; inst 29
  %18 = add i32 %15, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  br label %_10.while.cond.0                                                       ; inst 32
_10.while.cond.0:
  %19 = phi i32 [0, %_9.array.exit.2], [%54, %_32.if.exit.0]                       ; inst 33
  %20 = phi i32 [0, %_9.array.exit.2], [%50, %_32.if.exit.0]                       ; inst 34
  %21 = phi i32 [0, %_9.array.exit.2], [%51, %_32.if.exit.0]                       ; inst 35
  %22 = phi i32 [0, %_9.array.exit.2], [%52, %_32.if.exit.0]                       ; inst 36
  %23 = phi i32 [0, %_9.array.exit.2], [%53, %_32.if.exit.0]                       ; inst 37
  %24 = icmp slt i32 %19, 8000                                                     ; inst 38
  br i1 %24, label %_11.while.body.0, label %_33.while.exit.0                      ; inst 39
_11.while.body.0:
  %25 = srem i32 %19, 4                                                            ; inst 40
  %26 = call i32 @generate_hash_key(i32 %19)                                       ; inst 41
  %27 = call i32 @generate_hash_value(i32 %19)                                     ; inst 42
  %28 = icmp eq i32 %25, 0                                                         ; inst 43
  br i1 %28, label %_12.lazy.then.0, label %_13.lazy.else.0                        ; inst 44
_12.lazy.then.0:
  br label %_14.lazy.exit.0                                                        ; inst 45
_13.lazy.else.0:
  %29 = icmp eq i32 %25, 1                                                         ; inst 46
  br label %_14.lazy.exit.0                                                        ; inst 47
_14.lazy.exit.0:
  %30 = phi i1 [1, %_12.lazy.then.0], [%29, %_13.lazy.else.0]                      ; inst 48
  br i1 %30, label %_15.if.then.0, label %_22.if.else.0                            ; inst 49
_15.if.then.0:
  %31 = call i32 @hash_table_insert([2048 x i32]* %1, [4096 x i1]* %7, [4096 x i1]* %13, i32 %0, i32 %26, i32 %27) ; inst 50
  %32 = icmp sge i32 %31, 0                                                        ; inst 51
  br i1 %32, label %_16.if.then.1, label %_20.if.else.1                            ; inst 52
_16.if.then.1:
  %33 = add i32 %22, 1                                                             ; inst 53
  %34 = icmp sgt i32 %31, 0                                                        ; inst 54
  br i1 %34, label %_17.if.then.2, label %_18.if.else.2                            ; inst 55
_17.if.then.2:
  %35 = add i32 %20, %31                                                           ; inst 56
  br label %_19.if.exit.2                                                          ; inst 57
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 58
_19.if.exit.2:
  %36 = phi i32 [%35, %_17.if.then.2], [%20, %_18.if.else.2]                       ; inst 59
  br label %_21.if.exit.1                                                          ; inst 60
_20.if.else.1:
  br label %_21.if.exit.1                                                          ; inst 61
_21.if.exit.1:
  %37 = phi i32 [%36, %_19.if.exit.2], [%20, %_20.if.else.1]                       ; inst 62
  %38 = phi i32 [%33, %_19.if.exit.2], [%22, %_20.if.else.1]                       ; inst 63
  br label %_32.if.exit.0                                                          ; inst 64
_22.if.else.0:
  %39 = icmp eq i32 %25, 2                                                         ; inst 65
  br i1 %39, label %_23.if.then.3, label %_27.if.else.3                            ; inst 66
_23.if.then.3:
  %40 = call i32 @hash_table_lookup([2048 x i32]* %1, [4096 x i1]* %7, [4096 x i1]* %13, i32 %0, i32 %26) ; inst 67
  %41 = icmp sge i32 %40, 0                                                        ; inst 68
  br i1 %41, label %_24.if.then.4, label %_25.if.else.4                            ; inst 69
_24.if.then.4:
  %42 = add i32 %23, 1                                                             ; inst 70
  br label %_26.if.exit.4                                                          ; inst 71
_25.if.else.4:
  br label %_26.if.exit.4                                                          ; inst 72
_26.if.exit.4:
  %43 = phi i32 [%42, %_24.if.then.4], [%23, %_25.if.else.4]                       ; inst 73
  br label %_31.if.exit.3                                                          ; inst 74
_27.if.else.3:
  %44 = call i32 @hash_table_delete([2048 x i32]* %1, [4096 x i1]* %7, [4096 x i1]* %13, i32 %0, i32 %26) ; inst 75
  %45 = icmp sgt i32 %44, 0                                                        ; inst 76
  br i1 %45, label %_28.if.then.5, label %_29.if.else.5                            ; inst 77
_28.if.then.5:
  %46 = add i32 %21, 1                                                             ; inst 78
  br label %_30.if.exit.5                                                          ; inst 79
_29.if.else.5:
  br label %_30.if.exit.5                                                          ; inst 80
_30.if.exit.5:
  %47 = phi i32 [%46, %_28.if.then.5], [%21, %_29.if.else.5]                       ; inst 81
  br label %_31.if.exit.3                                                          ; inst 82
_31.if.exit.3:
  %48 = phi i32 [%21, %_26.if.exit.4], [%47, %_30.if.exit.5]                       ; inst 83
  %49 = phi i32 [%43, %_26.if.exit.4], [%23, %_30.if.exit.5]                       ; inst 84
  br label %_32.if.exit.0                                                          ; inst 85
_32.if.exit.0:
  %50 = phi i32 [%37, %_21.if.exit.1], [%20, %_31.if.exit.3]                       ; inst 86
  %51 = phi i32 [%21, %_21.if.exit.1], [%48, %_31.if.exit.3]                       ; inst 87
  %52 = phi i32 [%38, %_21.if.exit.1], [%22, %_31.if.exit.3]                       ; inst 88
  %53 = phi i32 [%23, %_21.if.exit.1], [%49, %_31.if.exit.3]                       ; inst 89
  %54 = add i32 %19, 1                                                             ; inst 90
  br label %_10.while.cond.0                                                       ; inst 91
_33.while.exit.0:
  %55 = add i32 %22, %23                                                           ; inst 92
  %56 = add i32 %55, %21                                                           ; inst 93
  %57 = sdiv i32 %20, 10                                                           ; inst 94
  %58 = sub i32 %56, %57                                                           ; inst 95
  ret i32 %58                                                                      ; inst 96
}

define i32 @generate_hash_key(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 6                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i32 %0                                                                       ; inst 4
_2.if.else.0:
  %3 = icmp eq i32 %1, 1                                                           ; inst 5
  br i1 %3, label %_3.if.then.1, label %_4.if.else.1                               ; inst 6
_3.if.then.1:
  %4 = mul i32 %0, 17                                                              ; inst 7
  %5 = add i32 %4, 31                                                              ; inst 8
  ret i32 %5                                                                       ; inst 9
_4.if.else.1:
  %6 = icmp eq i32 %1, 2                                                           ; inst 10
  br i1 %6, label %_5.if.then.2, label %_6.if.else.2                               ; inst 11
_5.if.then.2:
  %7 = call i32 @hash_function(i32 %0)                                             ; inst 12
  ret i32 %7                                                                       ; inst 13
_6.if.else.2:
  %8 = icmp eq i32 %1, 3                                                           ; inst 14
  br i1 %8, label %_7.if.then.3, label %_8.if.else.3                               ; inst 15
_7.if.then.3:
  %9 = mul i32 %0, %0                                                              ; inst 16
  %10 = srem i32 %9, 65536                                                         ; inst 17
  ret i32 %10                                                                      ; inst 18
_8.if.else.3:
  %11 = icmp eq i32 %1, 4                                                          ; inst 19
  br i1 %11, label %_9.if.then.4, label %_10.if.else.4                             ; inst 20
_9.if.then.4:
  %12 = srem i32 %0, 20                                                            ; inst 21
  %13 = call i32 @fibonacci_number(i32 %12)                                        ; inst 22
  ret i32 %13                                                                      ; inst 23
_10.if.else.4:
  %14 = call i32 @generate_clustered_key(i32 %0)                                   ; inst 24
  ret i32 %14                                                                      ; inst 25
_11.if.exit.4:
  br label %_12.if.exit.3                                                          ; inst 26
_12.if.exit.3:
  br label %_13.if.exit.2                                                          ; inst 27
_13.if.exit.2:
  br label %_14.if.exit.1                                                          ; inst 28
_14.if.exit.1:
  br label %_15.if.exit.0                                                          ; inst 29
_15.if.exit.0:
  unreachable                                                                      ; inst 30
}

define i32 @generate_hash_value(i32 %0) {
_0.entry.0:
  %1 = mul i32 %0, 13                                                              ; inst 1
  %2 = add i32 %1, 7                                                               ; inst 2
  %3 = srem i32 %2, 1000000                                                        ; inst 3
  ret i32 %3                                                                       ; inst 4
}

define i32 @generate_clustered_key(i32 %0) {
_0.entry.0:
  %1 = sdiv i32 %0, 100                                                            ; inst 1
  %2 = srem i32 %0, 100                                                            ; inst 2
  %3 = mul i32 %1, 10000                                                           ; inst 3
  %4 = add i32 %3, %2                                                              ; inst 4
  ret i32 %4                                                                       ; inst 5
}

define i32 @fibonacci_number(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %0                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 5
_4.while.cond.0:
  %2 = phi i32 [2, %_3.if.exit.0], [%7, %_5.while.body.0]                          ; inst 6
  %3 = phi i32 [1, %_3.if.exit.0], [%6, %_5.while.body.0]                          ; inst 7
  %4 = phi i32 [0, %_3.if.exit.0], [%3, %_5.while.body.0]                          ; inst 8
  %5 = icmp sle i32 %2, %0                                                         ; inst 9
  br i1 %5, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 10
_5.while.body.0:
  %6 = add i32 %4, %3                                                              ; inst 11
  %7 = add i32 %2, 1                                                               ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_6.while.exit.0:
  ret i32 %3                                                                       ; inst 14
}

define i32 @hash_table_insert([2048 x i32]* %0, [4096 x i1]* %1, [4096 x i1]* %2, i32 %3, i32 %4, i32 %5) {
_0.entry.0:
  %6 = call i32 @hash_function(i32 %4)                                             ; inst 1
  %7 = srem i32 %6, %3                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%42, %_11.if.exit.1]                             ; inst 4
  %9 = call i32 @get_max_probe_distance()                                          ; inst 5
  %10 = icmp slt i32 %8, %9                                                        ; inst 6
  br i1 %10, label %_2.while.body.0, label %_12.while.exit.0                       ; inst 7
_2.while.body.0:
  %11 = mul i32 %8, %8                                                             ; inst 8
  %12 = add i32 %7, %11                                                            ; inst 9
  %13 = srem i32 %12, %3                                                           ; inst 10
  %14 = sext i32 %13 to i64                                                        ; inst 11
  %15 = getelementptr [4096 x i1], [4096 x i1]* %1, i32 0, i64 %14                 ; inst 12
  %16 = load i1, i1* %15                                                           ; inst 13
  %17 = icmp eq i1 %16, 0                                                          ; inst 14
  br i1 %17, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 15
_3.lazy.then.0:
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  %18 = sext i32 %13 to i64                                                        ; inst 17
  %19 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %18                 ; inst 18
  %20 = load i1, i1* %19                                                           ; inst 19
  br label %_5.lazy.exit.0                                                         ; inst 20
_5.lazy.exit.0:
  %21 = phi i1 [1, %_3.lazy.then.0], [%20, %_4.lazy.else.0]                        ; inst 21
  br i1 %21, label %_6.if.then.0, label %_7.if.else.0                              ; inst 22
_6.if.then.0:
  %22 = sext i32 %13 to i64                                                        ; inst 23
  %23 = mul i64 %22, 2                                                             ; inst 24
  %24 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %23               ; inst 25
  store i32 %4, i32* %24                                                           ; inst 26
  %25 = sext i32 %13 to i64                                                        ; inst 27
  %26 = mul i64 %25, 2                                                             ; inst 28
  %27 = add i64 %26, 1                                                             ; inst 29
  %28 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %27               ; inst 30
  store i32 %5, i32* %28                                                           ; inst 31
  %29 = sext i32 %13 to i64                                                        ; inst 32
  %30 = getelementptr [4096 x i1], [4096 x i1]* %1, i32 0, i64 %29                 ; inst 33
  store i1 1, i1* %30                                                              ; inst 34
  %31 = sext i32 %13 to i64                                                        ; inst 35
  %32 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %31                 ; inst 36
  store i1 0, i1* %32                                                              ; inst 37
  ret i32 %8                                                                       ; inst 38
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 39
_8.if.exit.0:
  %33 = sext i32 %13 to i64                                                        ; inst 40
  %34 = mul i64 %33, 2                                                             ; inst 41
  %35 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %34               ; inst 42
  %36 = load i32, i32* %35                                                         ; inst 43
  %37 = icmp eq i32 %36, %4                                                        ; inst 44
  br i1 %37, label %_9.if.then.1, label %_10.if.else.1                             ; inst 45
_9.if.then.1:
  %38 = sext i32 %13 to i64                                                        ; inst 46
  %39 = mul i64 %38, 2                                                             ; inst 47
  %40 = add i64 %39, 1                                                             ; inst 48
  %41 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %40               ; inst 49
  store i32 %5, i32* %41                                                           ; inst 50
  ret i32 0                                                                        ; inst 51
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 52
_11.if.exit.1:
  %42 = add i32 %8, 1                                                              ; inst 53
  br label %_1.while.cond.0                                                        ; inst 54
_12.while.exit.0:
  ret i32 -1                                                                       ; inst 55
}

define i32 @hash_table_lookup([2048 x i32]* %0, [4096 x i1]* %1, [4096 x i1]* %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = call i32 @hash_function(i32 %4)                                             ; inst 1
  %6 = srem i32 %5, %3                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%41, %_17.if.exit.1]                             ; inst 4
  %8 = call i32 @get_max_probe_distance()                                          ; inst 5
  %9 = icmp slt i32 %7, %8                                                         ; inst 6
  br i1 %9, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 7
_2.while.body.0:
  %10 = mul i32 %7, %7                                                             ; inst 8
  %11 = add i32 %6, %10                                                            ; inst 9
  %12 = srem i32 %11, %3                                                           ; inst 10
  %13 = sext i32 %12 to i64                                                        ; inst 11
  %14 = getelementptr [4096 x i1], [4096 x i1]* %1, i32 0, i64 %13                 ; inst 12
  %15 = load i1, i1* %14                                                           ; inst 13
  %16 = icmp eq i1 %15, 0                                                          ; inst 14
  br i1 %16, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 15
_3.lazy.then.0:
  %17 = sext i32 %12 to i64                                                        ; inst 16
  %18 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %17                 ; inst 17
  %19 = load i1, i1* %18                                                           ; inst 18
  %20 = icmp eq i1 %19, 0                                                          ; inst 19
  br label %_5.lazy.exit.0                                                         ; inst 20
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 21
_5.lazy.exit.0:
  %21 = phi i1 [%20, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 22
  br i1 %21, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  ret i32 -1                                                                       ; inst 24
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 25
_8.if.exit.0:
  %22 = sext i32 %12 to i64                                                        ; inst 26
  %23 = getelementptr [4096 x i1], [4096 x i1]* %1, i32 0, i64 %22                 ; inst 27
  %24 = load i1, i1* %23                                                           ; inst 28
  br i1 %24, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 29
_9.lazy.then.1:
  %25 = sext i32 %12 to i64                                                        ; inst 30
  %26 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %25                 ; inst 31
  %27 = load i1, i1* %26                                                           ; inst 32
  %28 = icmp eq i1 %27, 0                                                          ; inst 33
  br label %_11.lazy.exit.1                                                        ; inst 34
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 35
_11.lazy.exit.1:
  %29 = phi i1 [%28, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 36
  br i1 %29, label %_12.lazy.then.2, label %_13.lazy.else.2                        ; inst 37
_12.lazy.then.2:
  %30 = sext i32 %12 to i64                                                        ; inst 38
  %31 = mul i64 %30, 2                                                             ; inst 39
  %32 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %31               ; inst 40
  %33 = load i32, i32* %32                                                         ; inst 41
  %34 = icmp eq i32 %33, %4                                                        ; inst 42
  br label %_14.lazy.exit.2                                                        ; inst 43
_13.lazy.else.2:
  br label %_14.lazy.exit.2                                                        ; inst 44
_14.lazy.exit.2:
  %35 = phi i1 [%34, %_12.lazy.then.2], [0, %_13.lazy.else.2]                      ; inst 45
  br i1 %35, label %_15.if.then.1, label %_16.if.else.1                            ; inst 46
_15.if.then.1:
  %36 = sext i32 %12 to i64                                                        ; inst 47
  %37 = mul i64 %36, 2                                                             ; inst 48
  %38 = add i64 %37, 1                                                             ; inst 49
  %39 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %38               ; inst 50
  %40 = load i32, i32* %39                                                         ; inst 51
  ret i32 %40                                                                      ; inst 52
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 53
_17.if.exit.1:
  %41 = add i32 %7, 1                                                              ; inst 54
  br label %_1.while.cond.0                                                        ; inst 55
_18.while.exit.0:
  ret i32 -1                                                                       ; inst 56
}

define i32 @hash_table_delete([2048 x i32]* %0, [4096 x i1]* %1, [4096 x i1]* %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = call i32 @hash_function(i32 %4)                                             ; inst 1
  %6 = srem i32 %5, %3                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%38, %_17.if.exit.1]                             ; inst 4
  %8 = call i32 @get_max_probe_distance()                                          ; inst 5
  %9 = icmp slt i32 %7, %8                                                         ; inst 6
  br i1 %9, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 7
_2.while.body.0:
  %10 = mul i32 %7, %7                                                             ; inst 8
  %11 = add i32 %6, %10                                                            ; inst 9
  %12 = srem i32 %11, %3                                                           ; inst 10
  %13 = sext i32 %12 to i64                                                        ; inst 11
  %14 = getelementptr [4096 x i1], [4096 x i1]* %1, i32 0, i64 %13                 ; inst 12
  %15 = load i1, i1* %14                                                           ; inst 13
  %16 = icmp eq i1 %15, 0                                                          ; inst 14
  br i1 %16, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 15
_3.lazy.then.0:
  %17 = sext i32 %12 to i64                                                        ; inst 16
  %18 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %17                 ; inst 17
  %19 = load i1, i1* %18                                                           ; inst 18
  %20 = icmp eq i1 %19, 0                                                          ; inst 19
  br label %_5.lazy.exit.0                                                         ; inst 20
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 21
_5.lazy.exit.0:
  %21 = phi i1 [%20, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 22
  br i1 %21, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  ret i32 0                                                                        ; inst 24
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 25
_8.if.exit.0:
  %22 = sext i32 %12 to i64                                                        ; inst 26
  %23 = getelementptr [4096 x i1], [4096 x i1]* %1, i32 0, i64 %22                 ; inst 27
  %24 = load i1, i1* %23                                                           ; inst 28
  br i1 %24, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 29
_9.lazy.then.1:
  %25 = sext i32 %12 to i64                                                        ; inst 30
  %26 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %25                 ; inst 31
  %27 = load i1, i1* %26                                                           ; inst 32
  %28 = icmp eq i1 %27, 0                                                          ; inst 33
  br label %_11.lazy.exit.1                                                        ; inst 34
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 35
_11.lazy.exit.1:
  %29 = phi i1 [%28, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 36
  br i1 %29, label %_12.lazy.then.2, label %_13.lazy.else.2                        ; inst 37
_12.lazy.then.2:
  %30 = sext i32 %12 to i64                                                        ; inst 38
  %31 = mul i64 %30, 2                                                             ; inst 39
  %32 = getelementptr [2048 x i32], [2048 x i32]* %0, i32 0, i64 %31               ; inst 40
  %33 = load i32, i32* %32                                                         ; inst 41
  %34 = icmp eq i32 %33, %4                                                        ; inst 42
  br label %_14.lazy.exit.2                                                        ; inst 43
_13.lazy.else.2:
  br label %_14.lazy.exit.2                                                        ; inst 44
_14.lazy.exit.2:
  %35 = phi i1 [%34, %_12.lazy.then.2], [0, %_13.lazy.else.2]                      ; inst 45
  br i1 %35, label %_15.if.then.1, label %_16.if.else.1                            ; inst 46
_15.if.then.1:
  %36 = sext i32 %12 to i64                                                        ; inst 47
  %37 = getelementptr [4096 x i1], [4096 x i1]* %2, i32 0, i64 %36                 ; inst 48
  store i1 1, i1* %37                                                              ; inst 49
  ret i32 1                                                                        ; inst 50
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 51
_17.if.exit.1:
  %38 = add i32 %7, 1                                                              ; inst 52
  br label %_1.while.cond.0                                                        ; inst 53
_18.while.exit.0:
  ret i32 0                                                                        ; inst 54
}

define i32 @run_priority_queue_tests() {
_0.entry.0:
  %0 = alloca [512 x i32]                                                          ; inst 1
  %1 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 512                                                        ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %6 = phi i32 [0, %_3.array.exit.0], [%58, %_41.if.exit.0]                        ; inst 12
  %7 = phi i32 [0, %_3.array.exit.0], [%59, %_41.if.exit.0]                        ; inst 13
  %8 = phi i32 [0, %_3.array.exit.0], [%61, %_41.if.exit.0]                        ; inst 14
  %9 = phi i32 [0, %_3.array.exit.0], [%60, %_41.if.exit.0]                        ; inst 15
  %10 = icmp slt i32 %8, 6000                                                      ; inst 16
  br i1 %10, label %_5.while.body.0, label %_42.while.exit.0                       ; inst 17
_5.while.body.0:
  %11 = srem i32 %8, 5                                                             ; inst 18
  %12 = icmp eq i32 %11, 0                                                         ; inst 19
  br i1 %12, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 20
_6.lazy.then.0:
  br label %_8.lazy.exit.0                                                         ; inst 21
_7.lazy.else.0:
  %13 = icmp eq i32 %11, 1                                                         ; inst 22
  br label %_8.lazy.exit.0                                                         ; inst 23
_8.lazy.exit.0:
  %14 = phi i1 [1, %_6.lazy.then.0], [%13, %_7.lazy.else.0]                        ; inst 24
  br i1 %14, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 25
_9.lazy.then.1:
  br label %_11.lazy.exit.1                                                        ; inst 26
_10.lazy.else.1:
  %15 = icmp eq i32 %11, 2                                                         ; inst 27
  br label %_11.lazy.exit.1                                                        ; inst 28
_11.lazy.exit.1:
  %16 = phi i1 [1, %_9.lazy.then.1], [%15, %_10.lazy.else.1]                       ; inst 29
  br i1 %16, label %_12.if.then.0, label %_22.if.else.0                            ; inst 30
_12.if.then.0:
  %17 = icmp slt i32 %6, 256                                                       ; inst 31
  br i1 %17, label %_13.if.then.1, label %_20.if.else.1                            ; inst 32
_13.if.then.1:
  %18 = call i32 @generate_priority(i32 %8)                                        ; inst 33
  %19 = call i32 @priority_queue_insert([512 x i32]* %0, i32 %6, i32 %18, i32 %8)  ; inst 34
  %20 = icmp sgt i32 %19, 0                                                        ; inst 35
  br i1 %20, label %_14.if.then.2, label %_18.if.else.2                            ; inst 36
_14.if.then.2:
  %21 = add i32 %6, 1                                                              ; inst 37
  %22 = add i32 %7, 1                                                              ; inst 38
  %23 = call i32 @validate_heap_property([512 x i32]* %0, i32 %21)                 ; inst 39
  %24 = icmp eq i32 %23, 0                                                         ; inst 40
  br i1 %24, label %_15.if.then.3, label %_16.if.else.3                            ; inst 41
_15.if.then.3:
  %25 = add i32 %9, 1                                                              ; inst 42
  br label %_17.if.exit.3                                                          ; inst 43
_16.if.else.3:
  br label %_17.if.exit.3                                                          ; inst 44
_17.if.exit.3:
  %26 = phi i32 [%25, %_15.if.then.3], [%9, %_16.if.else.3]                        ; inst 45
  br label %_19.if.exit.2                                                          ; inst 46
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 47
_19.if.exit.2:
  %27 = phi i32 [%21, %_17.if.exit.3], [%6, %_18.if.else.2]                        ; inst 48
  %28 = phi i32 [%22, %_17.if.exit.3], [%7, %_18.if.else.2]                        ; inst 49
  %29 = phi i32 [%26, %_17.if.exit.3], [%9, %_18.if.else.2]                        ; inst 50
  br label %_21.if.exit.1                                                          ; inst 51
_20.if.else.1:
  br label %_21.if.exit.1                                                          ; inst 52
_21.if.exit.1:
  %30 = phi i32 [%27, %_19.if.exit.2], [%6, %_20.if.else.1]                        ; inst 53
  %31 = phi i32 [%28, %_19.if.exit.2], [%7, %_20.if.else.1]                        ; inst 54
  %32 = phi i32 [%29, %_19.if.exit.2], [%9, %_20.if.else.1]                        ; inst 55
  br label %_41.if.exit.0                                                          ; inst 56
_22.if.else.0:
  %33 = icmp eq i32 %11, 3                                                         ; inst 57
  br i1 %33, label %_23.if.then.4, label %_33.if.else.4                            ; inst 58
_23.if.then.4:
  %34 = icmp sgt i32 %6, 0                                                         ; inst 59
  br i1 %34, label %_24.if.then.5, label %_31.if.else.5                            ; inst 60
_24.if.then.5:
  %35 = call i32 @priority_queue_extract_max([512 x i32]* %0, i32 %6)              ; inst 61
  %36 = icmp sge i32 %35, 0                                                        ; inst 62
  br i1 %36, label %_25.if.then.6, label %_29.if.else.6                            ; inst 63
_25.if.then.6:
  %37 = sub i32 %6, 1                                                              ; inst 64
  %38 = add i32 %7, 1                                                              ; inst 65
  %39 = call i32 @validate_heap_property([512 x i32]* %0, i32 %37)                 ; inst 66
  %40 = icmp eq i32 %39, 0                                                         ; inst 67
  br i1 %40, label %_26.if.then.7, label %_27.if.else.7                            ; inst 68
_26.if.then.7:
  %41 = add i32 %9, 1                                                              ; inst 69
  br label %_28.if.exit.7                                                          ; inst 70
_27.if.else.7:
  br label %_28.if.exit.7                                                          ; inst 71
_28.if.exit.7:
  %42 = phi i32 [%41, %_26.if.then.7], [%9, %_27.if.else.7]                        ; inst 72
  br label %_30.if.exit.6                                                          ; inst 73
_29.if.else.6:
  br label %_30.if.exit.6                                                          ; inst 74
_30.if.exit.6:
  %43 = phi i32 [%37, %_28.if.exit.7], [%6, %_29.if.else.6]                        ; inst 75
  %44 = phi i32 [%38, %_28.if.exit.7], [%7, %_29.if.else.6]                        ; inst 76
  %45 = phi i32 [%42, %_28.if.exit.7], [%9, %_29.if.else.6]                        ; inst 77
  br label %_32.if.exit.5                                                          ; inst 78
_31.if.else.5:
  br label %_32.if.exit.5                                                          ; inst 79
_32.if.exit.5:
  %46 = phi i32 [%43, %_30.if.exit.6], [%6, %_31.if.else.5]                        ; inst 80
  %47 = phi i32 [%44, %_30.if.exit.6], [%7, %_31.if.else.5]                        ; inst 81
  %48 = phi i32 [%45, %_30.if.exit.6], [%9, %_31.if.else.5]                        ; inst 82
  br label %_40.if.exit.4                                                          ; inst 83
_33.if.else.4:
  %49 = icmp sgt i32 %6, 0                                                         ; inst 84
  br i1 %49, label %_34.if.then.8, label %_38.if.else.8                            ; inst 85
_34.if.then.8:
  %50 = call i32 @priority_queue_peek([512 x i32]* %0)                             ; inst 86
  %51 = icmp sge i32 %50, 0                                                        ; inst 87
  br i1 %51, label %_35.if.then.9, label %_36.if.else.9                            ; inst 88
_35.if.then.9:
  %52 = add i32 %7, 1                                                              ; inst 89
  br label %_37.if.exit.9                                                          ; inst 90
_36.if.else.9:
  br label %_37.if.exit.9                                                          ; inst 91
_37.if.exit.9:
  %53 = phi i32 [%52, %_35.if.then.9], [%7, %_36.if.else.9]                        ; inst 92
  br label %_39.if.exit.8                                                          ; inst 93
_38.if.else.8:
  br label %_39.if.exit.8                                                          ; inst 94
_39.if.exit.8:
  %54 = phi i32 [%53, %_37.if.exit.9], [%7, %_38.if.else.8]                        ; inst 95
  br label %_40.if.exit.4                                                          ; inst 96
_40.if.exit.4:
  %55 = phi i32 [%46, %_32.if.exit.5], [%6, %_39.if.exit.8]                        ; inst 97
  %56 = phi i32 [%47, %_32.if.exit.5], [%54, %_39.if.exit.8]                       ; inst 98
  %57 = phi i32 [%48, %_32.if.exit.5], [%9, %_39.if.exit.8]                        ; inst 99
  br label %_41.if.exit.0                                                          ; inst 100
_41.if.exit.0:
  %58 = phi i32 [%30, %_21.if.exit.1], [%55, %_40.if.exit.4]                       ; inst 101
  %59 = phi i32 [%31, %_21.if.exit.1], [%56, %_40.if.exit.4]                       ; inst 102
  %60 = phi i32 [%32, %_21.if.exit.1], [%57, %_40.if.exit.4]                       ; inst 103
  %61 = add i32 %8, 1                                                              ; inst 104
  br label %_4.while.cond.0                                                        ; inst 105
_42.while.exit.0:
  %62 = sub i32 %7, %9                                                             ; inst 106
  ret i32 %62                                                                      ; inst 107
}

define i32 @generate_priority(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 4                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %3 = srem i32 %0, 1000                                                           ; inst 4
  ret i32 %3                                                                       ; inst 5
_2.if.else.0:
  %4 = icmp eq i32 %1, 1                                                           ; inst 6
  br i1 %4, label %_3.if.then.1, label %_4.if.else.1                               ; inst 7
_3.if.then.1:
  %5 = call i32 @hash_function(i32 %0)                                             ; inst 8
  %6 = srem i32 %5, 10000                                                          ; inst 9
  ret i32 %6                                                                       ; inst 10
_4.if.else.1:
  %7 = icmp eq i32 %1, 2                                                           ; inst 11
  br i1 %7, label %_5.if.then.2, label %_6.if.else.2                               ; inst 12
_5.if.then.2:
  %8 = mul i32 %0, %0                                                              ; inst 13
  %9 = srem i32 %8, 5000                                                           ; inst 14
  ret i32 %9                                                                       ; inst 15
_6.if.else.2:
  %10 = srem i32 %0, 15                                                            ; inst 16
  %11 = call i32 @fibonacci_number(i32 %10)                                        ; inst 17
  %12 = mul i32 %11, 10                                                            ; inst 18
  ret i32 %12                                                                      ; inst 19
_7.if.exit.2:
  br label %_8.if.exit.1                                                           ; inst 20
_8.if.exit.1:
  br label %_9.if.exit.0                                                           ; inst 21
_9.if.exit.0:
  unreachable                                                                      ; inst 22
}

define i32 @priority_queue_insert([512 x i32]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = sext i32 %1 to i64                                                          ; inst 1
  %5 = mul i64 %4, 2                                                               ; inst 2
  %6 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %5                   ; inst 3
  store i32 %2, i32* %6                                                            ; inst 4
  %7 = sext i32 %1 to i64                                                          ; inst 5
  %8 = mul i64 %7, 2                                                               ; inst 6
  %9 = add i64 %8, 1                                                               ; inst 7
  %10 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %9                  ; inst 8
  store i32 %3, i32* %10                                                           ; inst 9
  br label %_1.while.cond.0                                                        ; inst 10
_1.while.cond.0:
  %11 = phi i32 [%1, %_0.entry.0], [%14, %_5.if.exit.0]                            ; inst 11
  %12 = icmp sgt i32 %11, 0                                                        ; inst 12
  br i1 %12, label %_2.while.body.0, label %_7.critical_edge.0                     ; inst 13
_2.while.body.0:
  %13 = sub i32 %11, 1                                                             ; inst 14
  %14 = sdiv i32 %13, 2                                                            ; inst 15
  %15 = sext i32 %14 to i64                                                        ; inst 16
  %16 = mul i64 %15, 2                                                             ; inst 17
  %17 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %16                 ; inst 18
  %18 = load i32, i32* %17                                                         ; inst 19
  %19 = sext i32 %11 to i64                                                        ; inst 20
  %20 = mul i64 %19, 2                                                             ; inst 21
  %21 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %20                 ; inst 22
  %22 = load i32, i32* %21                                                         ; inst 23
  %23 = icmp sle i32 %22, %18                                                      ; inst 24
  br i1 %23, label %_3.if.then.0, label %_4.if.else.0                              ; inst 25
_3.if.then.0:
  br label %_6.while.exit.0                                                        ; inst 26
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 27
_5.if.exit.0:
  %24 = sext i32 %11 to i64                                                        ; inst 28
  %25 = mul i64 %24, 2                                                             ; inst 29
  %26 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %25                 ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = sext i32 %11 to i64                                                        ; inst 32
  %29 = mul i64 %28, 2                                                             ; inst 33
  %30 = add i64 %29, 1                                                             ; inst 34
  %31 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %30                 ; inst 35
  %32 = load i32, i32* %31                                                         ; inst 36
  %33 = sext i32 %11 to i64                                                        ; inst 37
  %34 = mul i64 %33, 2                                                             ; inst 38
  %35 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %34                 ; inst 39
  %36 = sext i32 %14 to i64                                                        ; inst 40
  %37 = mul i64 %36, 2                                                             ; inst 41
  %38 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %37                 ; inst 42
  %39 = load i32, i32* %38                                                         ; inst 43
  store i32 %39, i32* %35                                                          ; inst 44
  %40 = sext i32 %11 to i64                                                        ; inst 45
  %41 = mul i64 %40, 2                                                             ; inst 46
  %42 = add i64 %41, 1                                                             ; inst 47
  %43 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %42                 ; inst 48
  %44 = sext i32 %14 to i64                                                        ; inst 49
  %45 = mul i64 %44, 2                                                             ; inst 50
  %46 = add i64 %45, 1                                                             ; inst 51
  %47 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %46                 ; inst 52
  %48 = load i32, i32* %47                                                         ; inst 53
  store i32 %48, i32* %43                                                          ; inst 54
  %49 = sext i32 %14 to i64                                                        ; inst 55
  %50 = mul i64 %49, 2                                                             ; inst 56
  %51 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %50                 ; inst 57
  store i32 %27, i32* %51                                                          ; inst 58
  %52 = sext i32 %14 to i64                                                        ; inst 59
  %53 = mul i64 %52, 2                                                             ; inst 60
  %54 = add i64 %53, 1                                                             ; inst 61
  %55 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %54                 ; inst 62
  store i32 %32, i32* %55                                                          ; inst 63
  br label %_1.while.cond.0                                                        ; inst 64
_6.while.exit.0:
  ret i32 1                                                                        ; inst 65
_7.critical_edge.0:
  br label %_6.while.exit.0                                                        ; inst 66
}

define i32 @priority_queue_extract_max([512 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp eq i32 %1, 0                                                           ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 -1                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %3 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 0                    ; inst 5
  %4 = load i32, i32* %3                                                           ; inst 6
  %5 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 0                    ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = sub i64 %6, 1                                                               ; inst 9
  %8 = mul i64 %7, 2                                                               ; inst 10
  %9 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %8                   ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  store i32 %10, i32* %5                                                           ; inst 13
  %11 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 1                   ; inst 14
  %12 = sext i32 %1 to i64                                                         ; inst 15
  %13 = sub i64 %12, 1                                                             ; inst 16
  %14 = mul i64 %13, 2                                                             ; inst 17
  %15 = add i64 %14, 1                                                             ; inst 18
  %16 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %15                 ; inst 19
  %17 = load i32, i32* %16                                                         ; inst 20
  store i32 %17, i32* %11                                                          ; inst 21
  %18 = sub i32 %1, 1                                                              ; inst 22
  br label %_4.while.cond.0                                                        ; inst 23
_4.while.cond.0:
  %19 = phi i32 [0, %_3.if.exit.0], [%47, %_20.if.exit.3]                          ; inst 24
  br i1 1, label %_5.while.body.0, label %_22.critical_edge.0                      ; inst 25
_5.while.body.0:
  %20 = mul i32 2, %19                                                             ; inst 26
  %21 = add i32 %20, 1                                                             ; inst 27
  %22 = mul i32 2, %19                                                             ; inst 28
  %23 = add i32 %22, 2                                                             ; inst 29
  %24 = icmp slt i32 %21, %18                                                      ; inst 30
  br i1 %24, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 31
_6.lazy.then.0:
  %25 = sext i32 %21 to i64                                                        ; inst 32
  %26 = mul i64 %25, 2                                                             ; inst 33
  %27 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %26                 ; inst 34
  %28 = load i32, i32* %27                                                         ; inst 35
  %29 = sext i32 %19 to i64                                                        ; inst 36
  %30 = mul i64 %29, 2                                                             ; inst 37
  %31 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %30                 ; inst 38
  %32 = load i32, i32* %31                                                         ; inst 39
  %33 = icmp sgt i32 %28, %32                                                      ; inst 40
  br label %_8.lazy.exit.0                                                         ; inst 41
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 42
_8.lazy.exit.0:
  %34 = phi i1 [%33, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 43
  br i1 %34, label %_9.if.then.1, label %_10.if.else.1                             ; inst 44
_9.if.then.1:
  br label %_11.if.exit.1                                                          ; inst 45
_10.if.else.1:
  br label %_11.if.exit.1                                                          ; inst 46
_11.if.exit.1:
  %35 = phi i32 [%21, %_9.if.then.1], [%19, %_10.if.else.1]                        ; inst 47
  %36 = icmp slt i32 %23, %18                                                      ; inst 48
  br i1 %36, label %_12.lazy.then.1, label %_13.lazy.else.1                        ; inst 49
_12.lazy.then.1:
  %37 = sext i32 %23 to i64                                                        ; inst 50
  %38 = mul i64 %37, 2                                                             ; inst 51
  %39 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %38                 ; inst 52
  %40 = load i32, i32* %39                                                         ; inst 53
  %41 = sext i32 %35 to i64                                                        ; inst 54
  %42 = mul i64 %41, 2                                                             ; inst 55
  %43 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %42                 ; inst 56
  %44 = load i32, i32* %43                                                         ; inst 57
  %45 = icmp sgt i32 %40, %44                                                      ; inst 58
  br label %_14.lazy.exit.1                                                        ; inst 59
_13.lazy.else.1:
  br label %_14.lazy.exit.1                                                        ; inst 60
_14.lazy.exit.1:
  %46 = phi i1 [%45, %_12.lazy.then.1], [0, %_13.lazy.else.1]                      ; inst 61
  br i1 %46, label %_15.if.then.2, label %_16.if.else.2                            ; inst 62
_15.if.then.2:
  br label %_17.if.exit.2                                                          ; inst 63
_16.if.else.2:
  br label %_17.if.exit.2                                                          ; inst 64
_17.if.exit.2:
  %47 = phi i32 [%23, %_15.if.then.2], [%35, %_16.if.else.2]                       ; inst 65
  %48 = icmp eq i32 %47, %19                                                       ; inst 66
  br i1 %48, label %_18.if.then.3, label %_19.if.else.3                            ; inst 67
_18.if.then.3:
  br label %_21.while.exit.0                                                       ; inst 68
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 69
_20.if.exit.3:
  %49 = sext i32 %19 to i64                                                        ; inst 70
  %50 = mul i64 %49, 2                                                             ; inst 71
  %51 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %50                 ; inst 72
  %52 = load i32, i32* %51                                                         ; inst 73
  %53 = sext i32 %19 to i64                                                        ; inst 74
  %54 = mul i64 %53, 2                                                             ; inst 75
  %55 = add i64 %54, 1                                                             ; inst 76
  %56 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %55                 ; inst 77
  %57 = load i32, i32* %56                                                         ; inst 78
  %58 = sext i32 %19 to i64                                                        ; inst 79
  %59 = mul i64 %58, 2                                                             ; inst 80
  %60 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %59                 ; inst 81
  %61 = sext i32 %47 to i64                                                        ; inst 82
  %62 = mul i64 %61, 2                                                             ; inst 83
  %63 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %62                 ; inst 84
  %64 = load i32, i32* %63                                                         ; inst 85
  store i32 %64, i32* %60                                                          ; inst 86
  %65 = sext i32 %19 to i64                                                        ; inst 87
  %66 = mul i64 %65, 2                                                             ; inst 88
  %67 = add i64 %66, 1                                                             ; inst 89
  %68 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %67                 ; inst 90
  %69 = sext i32 %47 to i64                                                        ; inst 91
  %70 = mul i64 %69, 2                                                             ; inst 92
  %71 = add i64 %70, 1                                                             ; inst 93
  %72 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %71                 ; inst 94
  %73 = load i32, i32* %72                                                         ; inst 95
  store i32 %73, i32* %68                                                          ; inst 96
  %74 = sext i32 %47 to i64                                                        ; inst 97
  %75 = mul i64 %74, 2                                                             ; inst 98
  %76 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %75                 ; inst 99
  store i32 %52, i32* %76                                                          ; inst 100
  %77 = sext i32 %47 to i64                                                        ; inst 101
  %78 = mul i64 %77, 2                                                             ; inst 102
  %79 = add i64 %78, 1                                                             ; inst 103
  %80 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %79                 ; inst 104
  store i32 %57, i32* %80                                                          ; inst 105
  br label %_4.while.cond.0                                                        ; inst 106
_21.while.exit.0:
  ret i32 %4                                                                       ; inst 107
_22.critical_edge.0:
  br label %_21.while.exit.0                                                       ; inst 108
}

define i32 @priority_queue_peek([512 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 0                    ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  ret i32 %2                                                                       ; inst 3
}

define i32 @validate_heap_property([512 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%30, %_14.if.exit.1]                             ; inst 2
  %3 = icmp slt i32 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 4
_2.while.body.0:
  %4 = mul i32 2, %2                                                               ; inst 5
  %5 = add i32 %4, 1                                                               ; inst 6
  %6 = mul i32 2, %2                                                               ; inst 7
  %7 = add i32 %6, 2                                                               ; inst 8
  %8 = icmp slt i32 %5, %1                                                         ; inst 9
  br i1 %8, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 10
_3.lazy.then.0:
  %9 = sext i32 %2 to i64                                                          ; inst 11
  %10 = mul i64 %9, 2                                                              ; inst 12
  %11 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %10                 ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = sext i32 %5 to i64                                                         ; inst 15
  %14 = mul i64 %13, 2                                                             ; inst 16
  %15 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %14                 ; inst 17
  %16 = load i32, i32* %15                                                         ; inst 18
  %17 = icmp slt i32 %12, %16                                                      ; inst 19
  br label %_5.lazy.exit.0                                                         ; inst 20
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 21
_5.lazy.exit.0:
  %18 = phi i1 [%17, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 22
  br i1 %18, label %_6.if.then.0, label %_7.if.else.0                              ; inst 23
_6.if.then.0:
  ret i32 0                                                                        ; inst 24
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 25
_8.if.exit.0:
  %19 = icmp slt i32 %7, %1                                                        ; inst 26
  br i1 %19, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 27
_9.lazy.then.1:
  %20 = sext i32 %2 to i64                                                         ; inst 28
  %21 = mul i64 %20, 2                                                             ; inst 29
  %22 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %21                 ; inst 30
  %23 = load i32, i32* %22                                                         ; inst 31
  %24 = sext i32 %7 to i64                                                         ; inst 32
  %25 = mul i64 %24, 2                                                             ; inst 33
  %26 = getelementptr [512 x i32], [512 x i32]* %0, i32 0, i64 %25                 ; inst 34
  %27 = load i32, i32* %26                                                         ; inst 35
  %28 = icmp slt i32 %23, %27                                                      ; inst 36
  br label %_11.lazy.exit.1                                                        ; inst 37
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 38
_11.lazy.exit.1:
  %29 = phi i1 [%28, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 39
  br i1 %29, label %_12.if.then.1, label %_13.if.else.1                            ; inst 40
_12.if.then.1:
  ret i32 0                                                                        ; inst 41
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 42
_14.if.exit.1:
  %30 = add i32 %2, 1                                                              ; inst 43
  br label %_1.while.cond.0                                                        ; inst 44
_15.while.exit.0:
  ret i32 1                                                                        ; inst 45
}

define i32 @run_integrated_system_test() {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%14, %_5.if.exit.0]                              ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%13, %_5.if.exit.0]                              ; inst 3
  %2 = icmp slt i32 %0, 1000                                                       ; inst 4
  br i1 %2, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %3 = call i32 @simulate_memory_pressure(i32 %0)                                  ; inst 6
  %4 = call i32 @simulate_cache_workload(i32 %0)                                   ; inst 7
  %5 = call i32 @simulate_hash_workload(i32 %0)                                    ; inst 8
  %6 = call i32 @simulate_queue_workload(i32 %0)                                   ; inst 9
  %7 = call i32 @compute_integrated_score(i32 %3, i32 %4, i32 %5, i32 %6)          ; inst 10
  %8 = add i32 %1, %7                                                              ; inst 11
  %9 = srem i32 %0, 100                                                            ; inst 12
  %10 = icmp eq i32 %9, 99                                                         ; inst 13
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 14
_3.if.then.0:
  %11 = call i32 @simulate_system_adaptation(i32 %0)                               ; inst 15
  %12 = add i32 %8, %11                                                            ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %13 = phi i32 [%12, %_3.if.then.0], [%8, %_4.if.else.0]                          ; inst 19
  %14 = add i32 %0, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  %15 = sdiv i32 %1, 1000                                                          ; inst 22
  ret i32 %15                                                                      ; inst 23
}

define i32 @simulate_memory_pressure(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 3                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %3 = srem i32 %0, 20                                                             ; inst 4
  %4 = add i32 50, %3                                                              ; inst 5
  ret i32 %4                                                                       ; inst 6
_2.if.else.0:
  %5 = icmp eq i32 %1, 1                                                           ; inst 7
  br i1 %5, label %_3.if.then.1, label %_4.if.else.1                               ; inst 8
_3.if.then.1:
  %6 = mul i32 %0, 17                                                              ; inst 9
  %7 = srem i32 %6, 40                                                             ; inst 10
  %8 = add i32 80, %7                                                              ; inst 11
  ret i32 %8                                                                       ; inst 12
_4.if.else.1:
  %9 = call i32 @hash_function(i32 %0)                                             ; inst 13
  %10 = srem i32 %9, 30                                                            ; inst 14
  %11 = add i32 110, %10                                                           ; inst 15
  ret i32 %11                                                                      ; inst 16
_5.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 17
_6.if.exit.0:
  unreachable                                                                      ; inst 18
}

define i32 @simulate_cache_workload(i32 %0) {
_0.entry.0:
  %1 = sdiv i32 %0, 10                                                             ; inst 1
  %2 = srem i32 %1, 4                                                              ; inst 2
  %3 = icmp eq i32 %2, 0                                                           ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret i32 90                                                                       ; inst 5
_2.if.else.0:
  %4 = icmp eq i32 %2, 1                                                           ; inst 6
  br i1 %4, label %_3.if.then.1, label %_4.if.else.1                               ; inst 7
_3.if.then.1:
  ret i32 80                                                                       ; inst 8
_4.if.else.1:
  %5 = icmp eq i32 %2, 2                                                           ; inst 9
  br i1 %5, label %_5.if.then.2, label %_6.if.else.2                               ; inst 10
_5.if.then.2:
  ret i32 60                                                                       ; inst 11
_6.if.else.2:
  %6 = mul i32 %0, 23                                                              ; inst 12
  %7 = srem i32 %6, 30                                                             ; inst 13
  %8 = add i32 70, %7                                                              ; inst 14
  %9 = sub i32 %8, 15                                                              ; inst 15
  ret i32 %9                                                                       ; inst 16
_7.if.exit.2:
  br label %_8.if.exit.1                                                           ; inst 17
_8.if.exit.1:
  br label %_9.if.exit.0                                                           ; inst 18
_9.if.exit.0:
  unreachable                                                                      ; inst 19
}

define i32 @simulate_hash_workload(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 50                                                             ; inst 1
  %2 = add i32 %1, 10                                                              ; inst 2
  %3 = sdiv i32 %2, 5                                                              ; inst 3
  %4 = sub i32 80, %3                                                              ; inst 4
  ret i32 %4                                                                       ; inst 5
}

define i32 @simulate_queue_workload(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 200                                                            ; inst 1
  %2 = add i32 %1, 50                                                              ; inst 2
  %3 = srem i32 %0, 5                                                              ; inst 3
  %4 = icmp eq i32 %3, 0                                                           ; inst 4
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  %5 = sdiv i32 %2, 20                                                             ; inst 6
  %6 = sub i32 85, %5                                                              ; inst 7
  ret i32 %6                                                                       ; inst 8
_2.if.else.0:
  %7 = icmp eq i32 %3, 1                                                           ; inst 9
  br i1 %7, label %_3.if.then.1, label %_4.if.else.1                               ; inst 10
_3.if.then.1:
  %8 = sdiv i32 %2, 15                                                             ; inst 11
  %9 = sub i32 85, %8                                                              ; inst 12
  ret i32 %9                                                                       ; inst 13
_4.if.else.1:
  %10 = sdiv i32 %2, 25                                                            ; inst 14
  %11 = sub i32 85, %10                                                            ; inst 15
  ret i32 %11                                                                      ; inst 16
_5.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 17
_6.if.exit.0:
  unreachable                                                                      ; inst 18
}

define i32 @compute_integrated_score(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = mul i32 %0, 3                                                               ; inst 1
  %5 = mul i32 %1, 4                                                               ; inst 2
  %6 = add i32 %4, %5                                                              ; inst 3
  %7 = mul i32 %2, 2                                                               ; inst 4
  %8 = add i32 %6, %7                                                              ; inst 5
  %9 = add i32 %8, %3                                                              ; inst 6
  %10 = sdiv i32 %9, 10                                                            ; inst 7
  %11 = icmp sgt i32 %10, 90                                                       ; inst 8
  br i1 %11, label %_1.if.then.0, label %_2.if.else.0                              ; inst 9
_1.if.then.0:
  %12 = add i32 %10, 10                                                            ; inst 10
  ret i32 %12                                                                      ; inst 11
_2.if.else.0:
  %13 = icmp slt i32 %10, 40                                                       ; inst 12
  br i1 %13, label %_3.if.then.1, label %_4.if.else.1                              ; inst 13
_3.if.then.1:
  %14 = sub i32 %10, 10                                                            ; inst 14
  ret i32 %14                                                                      ; inst 15
_4.if.else.1:
  ret i32 %10                                                                      ; inst 16
_5.if.exit.1:
  br label %_6.if.exit.0                                                           ; inst 17
_6.if.exit.0:
  unreachable                                                                      ; inst 18
}

define i32 @simulate_system_adaptation(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 300                                                            ; inst 1
  %2 = icmp eq i32 %1, 299                                                         ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %3 = phi i32 [5, %_1.if.then.0], [0, %_2.if.else.0]                              ; inst 6
  %4 = srem i32 %0, 500                                                            ; inst 7
  %5 = icmp eq i32 %4, 499                                                         ; inst 8
  br i1 %5, label %_4.if.then.1, label %_5.if.else.1                               ; inst 9
_4.if.then.1:
  %6 = add i32 %3, 8                                                               ; inst 10
  br label %_6.if.exit.1                                                           ; inst 11
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 12
_6.if.exit.1:
  %7 = phi i32 [%6, %_4.if.then.1], [%3, %_5.if.else.1]                            ; inst 13
  %8 = srem i32 %0, 700                                                            ; inst 14
  %9 = icmp eq i32 %8, 699                                                         ; inst 15
  br i1 %9, label %_7.if.then.2, label %_8.if.else.2                               ; inst 16
_7.if.then.2:
  %10 = add i32 %7, 3                                                              ; inst 17
  br label %_9.if.exit.2                                                           ; inst 18
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 19
_9.if.exit.2:
  %11 = phi i32 [%10, %_7.if.then.2], [%7, %_8.if.else.2]                          ; inst 20
  ret i32 %11                                                                      ; inst 21
}

