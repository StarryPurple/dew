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
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %0 = phi i32 [0, %_0.entry.0], [%87, %_53.if.exit.15]                            ; inst 2
  %1 = phi i32 [0, %_0.entry.0], [%76, %_53.if.exit.15]                            ; inst 3
  %2 = phi i32 [0, %_0.entry.0], [%53, %_53.if.exit.15]                            ; inst 4
  %3 = phi i32 [1500, %_0.entry.0], [%65, %_53.if.exit.15]                         ; inst 5
  %4 = phi i32 [1000, %_0.entry.0], [%54, %_53.if.exit.15]                         ; inst 6
  %5 = phi i32 [0, %_0.entry.0], [%77, %_53.if.exit.15]                            ; inst 7
  %6 = phi i32 [800, %_0.entry.0], [%78, %_53.if.exit.15]                          ; inst 8
  %7 = phi i32 [0, %_0.entry.0], [%67, %_53.if.exit.15]                            ; inst 9
  %8 = phi i32 [0, %_0.entry.0], [%86, %_53.if.exit.15]                            ; inst 10
  %9 = icmp slt i32 %0, 200                                                        ; inst 11
  br i1 %9, label %_2.while.body.0, label %_54.while.exit.0                        ; inst 12
_2.while.body.0:
  %10 = srem i32 %0, 3                                                             ; inst 13
  %11 = mul i32 %0, 7                                                              ; inst 14
  %12 = add i32 %11, 15                                                            ; inst 15
  %13 = srem i32 %12, 50                                                           ; inst 16
  %14 = add i32 %13, 10                                                            ; inst 17
  %15 = icmp eq i32 %10, 0                                                         ; inst 18
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 19
_3.if.then.0:
  %16 = add i32 %2, %14                                                            ; inst 20
  br label %_8.if.exit.0                                                           ; inst 21
_4.if.else.0:
  %17 = icmp eq i32 %10, 1                                                         ; inst 22
  br i1 %17, label %_5.if.then.1, label %_6.if.else.1                              ; inst 23
_5.if.then.1:
  %18 = add i32 %7, %14                                                            ; inst 24
  br label %_7.if.exit.1                                                           ; inst 25
_6.if.else.1:
  %19 = add i32 %1, %14                                                            ; inst 26
  br label %_7.if.exit.1                                                           ; inst 27
_7.if.exit.1:
  %20 = phi i32 [%1, %_5.if.then.1], [%19, %_6.if.else.1]                          ; inst 28
  %21 = phi i32 [%18, %_5.if.then.1], [%7, %_6.if.else.1]                          ; inst 29
  br label %_8.if.exit.0                                                           ; inst 30
_8.if.exit.0:
  %22 = phi i32 [%1, %_3.if.then.0], [%20, %_7.if.exit.1]                          ; inst 31
  %23 = phi i32 [%16, %_3.if.then.0], [%2, %_7.if.exit.1]                          ; inst 32
  %24 = phi i32 [%7, %_3.if.then.0], [%21, %_7.if.exit.1]                          ; inst 33
  %25 = srem i32 %0, 10                                                            ; inst 34
  %26 = icmp eq i32 %25, 0                                                         ; inst 35
  br i1 %26, label %_9.if.then.2, label %_10.if.else.2                             ; inst 36
_9.if.then.2:
  %27 = add i32 %4, 200                                                            ; inst 37
  %28 = add i32 %3, 300                                                            ; inst 38
  %29 = add i32 %6, 150                                                            ; inst 39
  br label %_11.if.exit.2                                                          ; inst 40
_10.if.else.2:
  br label %_11.if.exit.2                                                          ; inst 41
_11.if.exit.2:
  %30 = phi i32 [%28, %_9.if.then.2], [%3, %_10.if.else.2]                         ; inst 42
  %31 = phi i32 [%27, %_9.if.then.2], [%4, %_10.if.else.2]                         ; inst 43
  %32 = phi i32 [%29, %_9.if.then.2], [%6, %_10.if.else.2]                         ; inst 44
  %33 = icmp sgt i32 %23, 0                                                        ; inst 45
  br i1 %33, label %_12.if.then.3, label %_16.if.else.3                            ; inst 46
_12.if.then.3:
  %34 = icmp sge i32 %31, %23                                                      ; inst 47
  br i1 %34, label %_13.if.then.4, label %_14.if.else.4                            ; inst 48
_13.if.then.4:
  br label %_15.if.exit.4                                                          ; inst 49
_14.if.else.4:
  br label %_15.if.exit.4                                                          ; inst 50
_15.if.exit.4:
  %35 = phi i1 [1, %_13.if.then.4], [0, %_14.if.else.4]                            ; inst 51
  br label %_17.if.exit.3                                                          ; inst 52
_16.if.else.3:
  br label %_17.if.exit.3                                                          ; inst 53
_17.if.exit.3:
  %36 = phi i1 [%35, %_15.if.exit.4], [0, %_16.if.else.3]                          ; inst 54
  %37 = icmp sgt i32 %24, 0                                                        ; inst 55
  br i1 %37, label %_18.if.then.5, label %_22.if.else.5                            ; inst 56
_18.if.then.5:
  %38 = icmp sge i32 %30, %24                                                      ; inst 57
  br i1 %38, label %_19.if.then.6, label %_20.if.else.6                            ; inst 58
_19.if.then.6:
  br label %_21.if.exit.6                                                          ; inst 59
_20.if.else.6:
  br label %_21.if.exit.6                                                          ; inst 60
_21.if.exit.6:
  %39 = phi i1 [1, %_19.if.then.6], [0, %_20.if.else.6]                            ; inst 61
  br label %_23.if.exit.5                                                          ; inst 62
_22.if.else.5:
  br label %_23.if.exit.5                                                          ; inst 63
_23.if.exit.5:
  %40 = phi i1 [%39, %_21.if.exit.6], [0, %_22.if.else.5]                          ; inst 64
  %41 = icmp sgt i32 %22, 0                                                        ; inst 65
  br i1 %41, label %_24.if.then.7, label %_28.if.else.7                            ; inst 66
_24.if.then.7:
  %42 = icmp sge i32 %32, %22                                                      ; inst 67
  br i1 %42, label %_25.if.then.8, label %_26.if.else.8                            ; inst 68
_25.if.then.8:
  br label %_27.if.exit.8                                                          ; inst 69
_26.if.else.8:
  br label %_27.if.exit.8                                                          ; inst 70
_27.if.exit.8:
  %43 = phi i1 [1, %_25.if.then.8], [0, %_26.if.else.8]                            ; inst 71
  br label %_29.if.exit.7                                                          ; inst 72
_28.if.else.7:
  br label %_29.if.exit.7                                                          ; inst 73
_29.if.exit.7:
  %44 = phi i1 [%43, %_27.if.exit.8], [0, %_28.if.else.7]                          ; inst 74
  br i1 %36, label %_30.if.then.9, label %_34.if.else.9                            ; inst 75
_30.if.then.9:
  %45 = icmp sgt i32 %23, 50                                                       ; inst 76
  br i1 %45, label %_31.if.then.10, label %_32.if.else.10                          ; inst 77
_31.if.then.10:
  %46 = mul i32 %23, 5                                                             ; inst 78
  br label %_33.if.exit.10                                                         ; inst 79
_32.if.else.10:
  %47 = mul i32 %23, 10                                                            ; inst 80
  br label %_33.if.exit.10                                                         ; inst 81
_33.if.exit.10:
  %48 = phi i32 [%46, %_31.if.then.10], [%47, %_32.if.else.10]                     ; inst 82
  %49 = phi i32 [100, %_31.if.then.10], [0, %_32.if.else.10]                       ; inst 83
  %50 = sub i32 %31, %23                                                           ; inst 84
  %51 = add i32 %8, %48                                                            ; inst 85
  %52 = add i32 %5, %23                                                            ; inst 86
  br label %_35.if.exit.9                                                          ; inst 87
_34.if.else.9:
  br label %_35.if.exit.9                                                          ; inst 88
_35.if.exit.9:
  %53 = phi i32 [0, %_33.if.exit.10], [%23, %_34.if.else.9]                        ; inst 89
  %54 = phi i32 [%50, %_33.if.exit.10], [%31, %_34.if.else.9]                      ; inst 90
  %55 = phi i32 [%52, %_33.if.exit.10], [%5, %_34.if.else.9]                       ; inst 91
  %56 = phi i32 [%51, %_33.if.exit.10], [%8, %_34.if.else.9]                       ; inst 92
  %57 = phi i32 [%49, %_33.if.exit.10], [0, %_34.if.else.9]                        ; inst 93
  br i1 %40, label %_36.if.then.11, label %_40.if.else.11                          ; inst 94
_36.if.then.11:
  %58 = icmp sgt i32 %24, 40                                                       ; inst 95
  br i1 %58, label %_37.if.then.12, label %_38.if.else.12                          ; inst 96
_37.if.then.12:
  %59 = mul i32 %24, 12                                                            ; inst 97
  br label %_39.if.exit.12                                                         ; inst 98
_38.if.else.12:
  %60 = mul i32 %24, 15                                                            ; inst 99
  br label %_39.if.exit.12                                                         ; inst 100
_39.if.exit.12:
  %61 = phi i32 [%59, %_37.if.then.12], [%60, %_38.if.else.12]                     ; inst 101
  %62 = sub i32 %30, %24                                                           ; inst 102
  %63 = add i32 %56, %61                                                           ; inst 103
  %64 = add i32 %55, %24                                                           ; inst 104
  br label %_41.if.exit.11                                                         ; inst 105
_40.if.else.11:
  br label %_41.if.exit.11                                                         ; inst 106
_41.if.exit.11:
  %65 = phi i32 [%62, %_39.if.exit.12], [%30, %_40.if.else.11]                     ; inst 107
  %66 = phi i32 [%64, %_39.if.exit.12], [%55, %_40.if.else.11]                     ; inst 108
  %67 = phi i32 [0, %_39.if.exit.12], [%24, %_40.if.else.11]                       ; inst 109
  %68 = phi i32 [%63, %_39.if.exit.12], [%56, %_40.if.else.11]                     ; inst 110
  br i1 %44, label %_42.if.then.13, label %_46.if.else.13                          ; inst 111
_42.if.then.13:
  %69 = icmp sgt i32 %22, 30                                                       ; inst 112
  br i1 %69, label %_43.if.then.14, label %_44.if.else.14                          ; inst 113
_43.if.then.14:
  %70 = mul i32 %22, 18                                                            ; inst 114
  br label %_45.if.exit.14                                                         ; inst 115
_44.if.else.14:
  %71 = mul i32 %22, 20                                                            ; inst 116
  br label %_45.if.exit.14                                                         ; inst 117
_45.if.exit.14:
  %72 = phi i32 [%70, %_43.if.then.14], [%71, %_44.if.else.14]                     ; inst 118
  %73 = sub i32 %32, %22                                                           ; inst 119
  %74 = add i32 %68, %72                                                           ; inst 120
  %75 = add i32 %66, %22                                                           ; inst 121
  br label %_47.if.exit.13                                                         ; inst 122
_46.if.else.13:
  br label %_47.if.exit.13                                                         ; inst 123
_47.if.exit.13:
  %76 = phi i32 [0, %_45.if.exit.14], [%22, %_46.if.else.13]                       ; inst 124
  %77 = phi i32 [%75, %_45.if.exit.14], [%66, %_46.if.else.13]                     ; inst 125
  %78 = phi i32 [%73, %_45.if.exit.14], [%32, %_46.if.else.13]                     ; inst 126
  %79 = phi i32 [%74, %_45.if.exit.14], [%68, %_46.if.else.13]                     ; inst 127
  %80 = srem i32 %0, 25                                                            ; inst 128
  %81 = icmp eq i32 %80, 0                                                         ; inst 129
  br i1 %81, label %_48.if.then.15, label %_52.if.else.15                          ; inst 130
_48.if.then.15:
  %82 = call i32 @perform_audit(i32 %54, i32 %65, i32 %78, i32 %79)                ; inst 131
  %83 = icmp slt i32 %82, 0                                                        ; inst 132
  br i1 %83, label %_49.if.then.16, label %_50.if.else.16                          ; inst 133
_49.if.then.16:
  %84 = add i32 %79, %57                                                           ; inst 134
  br label %_51.if.exit.16                                                         ; inst 135
_50.if.else.16:
  br label %_51.if.exit.16                                                         ; inst 136
_51.if.exit.16:
  %85 = phi i32 [%84, %_49.if.then.16], [%79, %_50.if.else.16]                     ; inst 137
  br label %_53.if.exit.15                                                         ; inst 138
_52.if.else.15:
  br label %_53.if.exit.15                                                         ; inst 139
_53.if.exit.15:
  %86 = phi i32 [%85, %_51.if.exit.16], [%79, %_52.if.else.15]                     ; inst 140
  %87 = add i32 %0, 1                                                              ; inst 141
  br label %_1.while.cond.0                                                        ; inst 142
_54.while.exit.0:
  call void @printlnInt(i32 %8)                                                    ; inst 143
  call void @printlnInt(i32 %5)                                                    ; inst 144
  call void @printlnInt(i32 %4)                                                    ; inst 145
  call void @printlnInt(i32 %3)                                                    ; inst 146
  call void @printlnInt(i32 %6)                                                    ; inst 147
  call void @exit(i32 0)                                                           ; inst 148
  ret void                                                                         ; inst 149
}

define i32 @perform_audit(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp slt i32 %0, 100                                                        ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %5 = phi i32 [-10, %_1.if.then.0], [5, %_2.if.else.0]                            ; inst 5
  %6 = icmp slt i32 %1, 150                                                        ; inst 6
  br i1 %6, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  %7 = sub i32 %5, 10                                                              ; inst 8
  br label %_6.if.exit.1                                                           ; inst 9
_5.if.else.1:
  %8 = add i32 %5, 5                                                               ; inst 10
  br label %_6.if.exit.1                                                           ; inst 11
_6.if.exit.1:
  %9 = phi i32 [%7, %_4.if.then.1], [%8, %_5.if.else.1]                            ; inst 12
  %10 = icmp slt i32 %2, 80                                                        ; inst 13
  br i1 %10, label %_7.if.then.2, label %_8.if.else.2                              ; inst 14
_7.if.then.2:
  %11 = sub i32 %9, 10                                                             ; inst 15
  br label %_9.if.exit.2                                                           ; inst 16
_8.if.else.2:
  %12 = add i32 %9, 5                                                              ; inst 17
  br label %_9.if.exit.2                                                           ; inst 18
_9.if.exit.2:
  %13 = phi i32 [%11, %_7.if.then.2], [%12, %_8.if.else.2]                         ; inst 19
  %14 = icmp sgt i32 %3, 50000                                                     ; inst 20
  br i1 %14, label %_10.if.then.3, label %_11.if.else.3                            ; inst 21
_10.if.then.3:
  %15 = add i32 %13, 20                                                            ; inst 22
  br label %_15.if.exit.3                                                          ; inst 23
_11.if.else.3:
  %16 = icmp sgt i32 %3, 20000                                                     ; inst 24
  br i1 %16, label %_12.if.then.4, label %_13.if.else.4                            ; inst 25
_12.if.then.4:
  %17 = add i32 %13, 10                                                            ; inst 26
  br label %_14.if.exit.4                                                          ; inst 27
_13.if.else.4:
  br label %_14.if.exit.4                                                          ; inst 28
_14.if.exit.4:
  %18 = phi i32 [%17, %_12.if.then.4], [%13, %_13.if.else.4]                       ; inst 29
  br label %_15.if.exit.3                                                          ; inst 30
_15.if.exit.3:
  %19 = phi i32 [%15, %_10.if.then.3], [%18, %_14.if.exit.4]                       ; inst 31
  br label %_16.while.cond.0                                                       ; inst 32
_16.while.cond.0:
  %20 = phi i32 [0, %_15.if.exit.3], [%25, %_17.while.body.0]                      ; inst 33
  %21 = phi i32 [%3, %_15.if.exit.3], [%24, %_17.while.body.0]                     ; inst 34
  %22 = icmp slt i32 %20, 5                                                        ; inst 35
  br i1 %22, label %_17.while.body.0, label %_18.while.exit.0                      ; inst 36
_17.while.body.0:
  %23 = add i32 %20, 1                                                             ; inst 37
  %24 = sdiv i32 %21, %23                                                          ; inst 38
  %25 = add i32 %20, 1                                                             ; inst 39
  br label %_16.while.cond.0                                                       ; inst 40
_18.while.exit.0:
  %26 = srem i32 %21, 10                                                           ; inst 41
  %27 = add i32 %19, %26                                                           ; inst 42
  %28 = icmp sgt i32 %27, 15                                                       ; inst 43
  br i1 %28, label %_19.if.then.5, label %_20.if.else.5                            ; inst 44
_19.if.then.5:
  br label %_24.if.exit.5                                                          ; inst 45
_20.if.else.5:
  %29 = icmp sgt i32 %27, 0                                                        ; inst 46
  br i1 %29, label %_21.if.then.6, label %_22.if.else.6                            ; inst 47
_21.if.then.6:
  br label %_23.if.exit.6                                                          ; inst 48
_22.if.else.6:
  br label %_23.if.exit.6                                                          ; inst 49
_23.if.exit.6:
  %30 = phi i32 [0, %_21.if.then.6], [-1, %_22.if.else.6]                          ; inst 50
  br label %_24.if.exit.5                                                          ; inst 51
_24.if.exit.5:
  %31 = phi i32 [1, %_19.if.then.5], [%30, %_23.if.exit.6]                         ; inst 52
  ret i32 %31                                                                      ; inst 53
}

define i32 @another_level_of_processing(i32 %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [%0, %_0.entry.0], [%13, %_8.while.exit.1]                          ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%18, %_8.while.exit.1]                           ; inst 3
  %4 = icmp slt i32 %3, 10                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = srem i32 %3, 2                                                              ; inst 6
  %6 = icmp eq i32 %5, 0                                                           ; inst 7
  br i1 %6, label %_3.if.then.0, label %_4.if.else.0                               ; inst 8
_3.if.then.0:
  %7 = mul i32 %1, %3                                                              ; inst 9
  %8 = add i32 %2, %7                                                              ; inst 10
  br label %_5.if.exit.0                                                           ; inst 11
_4.if.else.0:
  %9 = mul i32 %1, %3                                                              ; inst 12
  %10 = sdiv i32 %9, 2                                                             ; inst 13
  %11 = sub i32 %2, %10                                                            ; inst 14
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %12 = phi i32 [%8, %_3.if.then.0], [%11, %_4.if.else.0]                          ; inst 16
  br label %_6.while.cond.1                                                        ; inst 17
_6.while.cond.1:
  %13 = phi i32 [%12, %_5.if.exit.0], [%16, %_7.while.body.1]                      ; inst 18
  %14 = phi i32 [0, %_5.if.exit.0], [%17, %_7.while.body.1]                        ; inst 19
  %15 = icmp slt i32 %14, 5                                                        ; inst 20
  br i1 %15, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 21
_7.while.body.1:
  %16 = add i32 %13, %14                                                           ; inst 22
  %17 = add i32 %14, 1                                                             ; inst 23
  br label %_6.while.cond.1                                                        ; inst 24
_8.while.exit.1:
  %18 = add i32 %3, 1                                                              ; inst 25
  br label %_1.while.cond.0                                                        ; inst 26
_9.while.exit.0:
  ret i32 %2                                                                       ; inst 27
}

define i32 @yet_another_function(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sgt i32 %0, %1                                                         ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = sub i32 %0, %1                                                              ; inst 3
  br label %_3.if.exit.0                                                           ; inst 4
_2.if.else.0:
  %4 = sub i32 %1, %0                                                              ; inst 5
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = phi i32 [%3, %_1.if.then.0], [%4, %_2.if.else.0]                            ; inst 7
  br label %_4.while.cond.0                                                        ; inst 8
_4.while.cond.0:
  %6 = phi i32 [%5, %_3.if.exit.0], [%10, %_5.while.body.0]                        ; inst 9
  %7 = phi i32 [0, %_3.if.exit.0], [%11, %_5.while.body.0]                         ; inst 10
  %8 = icmp slt i32 %7, 5                                                          ; inst 11
  br i1 %8, label %_5.while.body.0, label %_6.while.exit.0                         ; inst 12
_5.while.body.0:
  %9 = add i32 %7, 1                                                               ; inst 13
  %10 = call i32 @another_level_of_processing(i32 %6, i32 %9)                      ; inst 14
  %11 = add i32 %7, 1                                                              ; inst 15
  br label %_4.while.cond.0                                                        ; inst 16
_6.while.exit.0:
  %12 = icmp sgt i32 %6, 1000                                                      ; inst 17
  br i1 %12, label %_7.if.then.1, label %_8.if.else.1                              ; inst 18
_7.if.then.1:
  ret i32 1000                                                                     ; inst 19
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 20
_9.if.exit.1:
  ret i32 %6                                                                       ; inst 21
}

define i32 @process_complex_data(i32 %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @yet_another_function(i32 %0, i32 %1)                              ; inst 1
  %4 = call i32 @yet_another_function(i32 %1, i32 %2)                              ; inst 2
  %5 = call i32 @yet_another_function(i32 %0, i32 %2)                              ; inst 3
  %6 = add i32 %3, %4                                                              ; inst 4
  %7 = add i32 %6, %5                                                              ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%13, %_2.while.body.0]                           ; inst 7
  %9 = phi i32 [%7, %_0.entry.0], [%12, %_2.while.body.0]                          ; inst 8
  %10 = icmp slt i32 %8, 10                                                        ; inst 9
  br i1 %10, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 10
_2.while.body.0:
  %11 = mul i32 %8, %8                                                             ; inst 11
  %12 = sub i32 %9, %11                                                            ; inst 12
  %13 = add i32 %8, 1                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  ret i32 %9                                                                       ; inst 15
}

define i32 @simulate_external_factors(i32 %0) {
_0.entry.0:
  %1 = srem i32 %0, 5                                                              ; inst 1
  %2 = icmp eq i32 %1, 0                                                           ; inst 2
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  br label %_12.if.exit.0                                                          ; inst 4
_2.if.else.0:
  %3 = icmp eq i32 %1, 1                                                           ; inst 5
  br i1 %3, label %_3.if.then.1, label %_4.if.else.1                               ; inst 6
_3.if.then.1:
  br label %_11.if.exit.1                                                          ; inst 7
_4.if.else.1:
  %4 = icmp eq i32 %1, 2                                                           ; inst 8
  br i1 %4, label %_5.if.then.2, label %_6.if.else.2                               ; inst 9
_5.if.then.2:
  br label %_10.if.exit.2                                                          ; inst 10
_6.if.else.2:
  %5 = icmp eq i32 %1, 3                                                           ; inst 11
  br i1 %5, label %_7.if.then.3, label %_8.if.else.3                               ; inst 12
_7.if.then.3:
  br label %_9.if.exit.3                                                           ; inst 13
_8.if.else.3:
  br label %_9.if.exit.3                                                           ; inst 14
_9.if.exit.3:
  %6 = phi i32 [1000, %_7.if.then.3], [-100, %_8.if.else.3]                        ; inst 15
  br label %_10.if.exit.2                                                          ; inst 16
_10.if.exit.2:
  %7 = phi i32 [0, %_5.if.then.2], [%6, %_9.if.exit.3]                             ; inst 17
  br label %_11.if.exit.1                                                          ; inst 18
_11.if.exit.1:
  %8 = phi i32 [200, %_3.if.then.1], [%7, %_10.if.exit.2]                          ; inst 19
  br label %_12.if.exit.0                                                          ; inst 20
_12.if.exit.0:
  %9 = phi i32 [-500, %_1.if.then.0], [%8, %_11.if.exit.1]                         ; inst 21
  ret i32 %9                                                                       ; inst 22
}

define i32 @final_check(i32 %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp sgt i32 %0, 500                                                        ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_3.if.exit.0                                                           ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %5 = phi i32 [1, %_1.if.then.0], [0, %_2.if.else.0]                              ; inst 5
  %6 = icmp sgt i32 %1, 800                                                        ; inst 6
  br i1 %6, label %_4.if.then.1, label %_5.if.else.1                               ; inst 7
_4.if.then.1:
  %7 = add i32 %5, 1                                                               ; inst 8
  br label %_6.if.exit.1                                                           ; inst 9
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 10
_6.if.exit.1:
  %8 = phi i32 [%7, %_4.if.then.1], [%5, %_5.if.else.1]                            ; inst 11
  %9 = icmp sgt i32 %2, 400                                                        ; inst 12
  br i1 %9, label %_7.if.then.2, label %_8.if.else.2                               ; inst 13
_7.if.then.2:
  %10 = add i32 %8, 1                                                              ; inst 14
  br label %_9.if.exit.2                                                           ; inst 15
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 16
_9.if.exit.2:
  %11 = phi i32 [%10, %_7.if.then.2], [%8, %_8.if.else.2]                          ; inst 17
  %12 = icmp sgt i32 %3, 100000                                                    ; inst 18
  br i1 %12, label %_10.if.then.3, label %_11.if.else.3                            ; inst 19
_10.if.then.3:
  %13 = add i32 %11, 2                                                             ; inst 20
  br label %_12.if.exit.3                                                          ; inst 21
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 22
_12.if.exit.3:
  %14 = phi i32 [%13, %_10.if.then.3], [%11, %_11.if.else.3]                       ; inst 23
  ret i32 %14                                                                      ; inst 24
}

