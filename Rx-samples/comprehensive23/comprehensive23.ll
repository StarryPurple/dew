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
  %0 = alloca [100 x i32]                                                          ; inst 2
  %1 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 100                                                        ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %6 = alloca [100 x i32]                                                          ; inst 12
  %7 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 15
  %9 = icmp slt i32 %8, 100                                                        ; inst 16
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 17
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 18
  store i32 0, i32* %10                                                            ; inst 19
  %11 = add i32 %8, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %12 = alloca [100 x i32]                                                         ; inst 22
  %13 = getelementptr [100 x i32], [100 x i32]* %12, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 25
  %15 = icmp slt i32 %14, 100                                                      ; inst 26
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 28
  store i32 0, i32* %16                                                            ; inst 29
  %17 = add i32 %14, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %18 = alloca [100 x i32]                                                         ; inst 32
  %19 = getelementptr [100 x i32], [100 x i32]* %18, i32 0, i32 0                  ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %20 = phi i32 [0, %_9.array.exit.2], [%23, %_11.array.body.3]                    ; inst 35
  %21 = icmp slt i32 %20, 100                                                      ; inst 36
  br i1 %21, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %22 = getelementptr i32, i32* %19, i32 %20                                       ; inst 38
  store i32 0, i32* %22                                                            ; inst 39
  %23 = add i32 %20, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %24 = alloca [100 x [50 x i32]]                                                  ; inst 42
  %25 = alloca [50 x i32]                                                          ; inst 43
  %26 = getelementptr [50 x i32], [50 x i32]* %25, i32 0, i32 0                    ; inst 44
  br label %_13.array.cond.4                                                       ; inst 45
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 46
  %28 = icmp slt i32 %27, 50                                                       ; inst 47
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 48
_14.array.body.4:
  %29 = getelementptr i32, i32* %26, i32 %27                                       ; inst 49
  store i32 0, i32* %29                                                            ; inst 50
  %30 = add i32 %27, 1                                                             ; inst 51
  br label %_13.array.cond.4                                                       ; inst 52
_15.array.exit.4:
  %31 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %24, i32 0, i32 0    ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %32 = phi i32 [0, %_15.array.exit.4], [%35, %_17.array.body.5]                   ; inst 55
  %33 = icmp slt i32 %32, 100                                                      ; inst 56
  br i1 %33, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %34 = getelementptr [50 x i32], [50 x i32]* %31, i32 %32                         ; inst 58
  call void @memcpy([50 x i32]* %34, [50 x i32]* %25, i64 200)                     ; inst 59
  %35 = add i32 %32, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  %36 = alloca [100 x i32]                                                         ; inst 62
  %37 = getelementptr [100 x i32], [100 x i32]* %36, i32 0, i32 0                  ; inst 63
  br label %_19.array.cond.6                                                       ; inst 64
_19.array.cond.6:
  %38 = phi i32 [0, %_18.array.exit.5], [%41, %_20.array.body.6]                   ; inst 65
  %39 = icmp slt i32 %38, 100                                                      ; inst 66
  br i1 %39, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 67
_20.array.body.6:
  %40 = getelementptr i32, i32* %37, i32 %38                                       ; inst 68
  store i32 0, i32* %40                                                            ; inst 69
  %41 = add i32 %38, 1                                                             ; inst 70
  br label %_19.array.cond.6                                                       ; inst 71
_21.array.exit.6:
  %42 = alloca [100 x i32]                                                         ; inst 72
  %43 = getelementptr [100 x i32], [100 x i32]* %42, i32 0, i32 0                  ; inst 73
  br label %_22.array.cond.7                                                       ; inst 74
_22.array.cond.7:
  %44 = phi i32 [0, %_21.array.exit.6], [%47, %_23.array.body.7]                   ; inst 75
  %45 = icmp slt i32 %44, 100                                                      ; inst 76
  br i1 %45, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 77
_23.array.body.7:
  %46 = getelementptr i32, i32* %43, i32 %44                                       ; inst 78
  store i32 0, i32* %46                                                            ; inst 79
  %47 = add i32 %44, 1                                                             ; inst 80
  br label %_22.array.cond.7                                                       ; inst 81
_24.array.exit.7:
  %48 = alloca [100 x i32]                                                         ; inst 82
  %49 = getelementptr [100 x i32], [100 x i32]* %48, i32 0, i32 0                  ; inst 83
  br label %_25.array.cond.8                                                       ; inst 84
_25.array.cond.8:
  %50 = phi i32 [0, %_24.array.exit.7], [%53, %_26.array.body.8]                   ; inst 85
  %51 = icmp slt i32 %50, 100                                                      ; inst 86
  br i1 %51, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 87
_26.array.body.8:
  %52 = getelementptr i32, i32* %49, i32 %50                                       ; inst 88
  store i32 0, i32* %52                                                            ; inst 89
  %53 = add i32 %50, 1                                                             ; inst 90
  br label %_25.array.cond.8                                                       ; inst 91
_27.array.exit.8:
  %54 = alloca [100 x [100 x i32]]                                                 ; inst 92
  %55 = alloca [100 x i32]                                                         ; inst 93
  %56 = getelementptr [100 x i32], [100 x i32]* %55, i32 0, i32 0                  ; inst 94
  br label %_28.array.cond.9                                                       ; inst 95
_28.array.cond.9:
  %57 = phi i32 [0, %_27.array.exit.8], [%60, %_29.array.body.9]                   ; inst 96
  %58 = icmp slt i32 %57, 100                                                      ; inst 97
  br i1 %58, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 98
_29.array.body.9:
  %59 = getelementptr i32, i32* %56, i32 %57                                       ; inst 99
  store i32 0, i32* %59                                                            ; inst 100
  %60 = add i32 %57, 1                                                             ; inst 101
  br label %_28.array.cond.9                                                       ; inst 102
_30.array.exit.9:
  %61 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %54, i32 0, i32 0  ; inst 103
  br label %_31.array.cond.10                                                      ; inst 104
_31.array.cond.10:
  %62 = phi i32 [0, %_30.array.exit.9], [%65, %_32.array.body.10]                  ; inst 105
  %63 = icmp slt i32 %62, 100                                                      ; inst 106
  br i1 %63, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 107
_32.array.body.10:
  %64 = getelementptr [100 x i32], [100 x i32]* %61, i32 %62                       ; inst 108
  call void @memcpy([100 x i32]* %64, [100 x i32]* %55, i64 400)                   ; inst 109
  %65 = add i32 %62, 1                                                             ; inst 110
  br label %_31.array.cond.10                                                      ; inst 111
_33.array.exit.10:
  %66 = alloca [100 x [100 x i32]]                                                 ; inst 112
  %67 = alloca [100 x i32]                                                         ; inst 113
  %68 = getelementptr [100 x i32], [100 x i32]* %67, i32 0, i32 0                  ; inst 114
  br label %_34.array.cond.11                                                      ; inst 115
_34.array.cond.11:
  %69 = phi i32 [0, %_33.array.exit.10], [%72, %_35.array.body.11]                 ; inst 116
  %70 = icmp slt i32 %69, 100                                                      ; inst 117
  br i1 %70, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 118
_35.array.body.11:
  %71 = getelementptr i32, i32* %68, i32 %69                                       ; inst 119
  store i32 0, i32* %71                                                            ; inst 120
  %72 = add i32 %69, 1                                                             ; inst 121
  br label %_34.array.cond.11                                                      ; inst 122
_36.array.exit.11:
  %73 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %66, i32 0, i32 0  ; inst 123
  br label %_37.array.cond.12                                                      ; inst 124
_37.array.cond.12:
  %74 = phi i32 [0, %_36.array.exit.11], [%77, %_38.array.body.12]                 ; inst 125
  %75 = icmp slt i32 %74, 100                                                      ; inst 126
  br i1 %75, label %_38.array.body.12, label %_39.array.exit.12                    ; inst 127
_38.array.body.12:
  %76 = getelementptr [100 x i32], [100 x i32]* %73, i32 %74                       ; inst 128
  call void @memcpy([100 x i32]* %76, [100 x i32]* %67, i64 400)                   ; inst 129
  %77 = add i32 %74, 1                                                             ; inst 130
  br label %_37.array.cond.12                                                      ; inst 131
_39.array.exit.12:
  %78 = alloca [1000 x [10 x i32]]                                                 ; inst 132
  %79 = alloca [10 x i32]                                                          ; inst 133
  %80 = getelementptr [10 x i32], [10 x i32]* %79, i32 0, i32 0                    ; inst 134
  br label %_40.array.cond.13                                                      ; inst 135
_40.array.cond.13:
  %81 = phi i32 [0, %_39.array.exit.12], [%84, %_41.array.body.13]                 ; inst 136
  %82 = icmp slt i32 %81, 10                                                       ; inst 137
  br i1 %82, label %_41.array.body.13, label %_42.array.exit.13                    ; inst 138
_41.array.body.13:
  %83 = getelementptr i32, i32* %80, i32 %81                                       ; inst 139
  store i32 0, i32* %83                                                            ; inst 140
  %84 = add i32 %81, 1                                                             ; inst 141
  br label %_40.array.cond.13                                                      ; inst 142
_42.array.exit.13:
  %85 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %78, i32 0, i32 0  ; inst 143
  br label %_43.array.cond.14                                                      ; inst 144
_43.array.cond.14:
  %86 = phi i32 [0, %_42.array.exit.13], [%89, %_44.array.body.14]                 ; inst 145
  %87 = icmp slt i32 %86, 1000                                                     ; inst 146
  br i1 %87, label %_44.array.body.14, label %_45.array.exit.14                    ; inst 147
_44.array.body.14:
  %88 = getelementptr [10 x i32], [10 x i32]* %85, i32 %86                         ; inst 148
  call void @memcpy([10 x i32]* %88, [10 x i32]* %79, i64 40)                      ; inst 149
  %89 = add i32 %86, 1                                                             ; inst 150
  br label %_43.array.cond.14                                                      ; inst 151
_45.array.exit.14:
  %90 = alloca i32                                                                 ; inst 152
  store i32 0, i32* %90                                                            ; inst 153
  %91 = alloca i32                                                                 ; inst 154
  store i32 0, i32* %91                                                            ; inst 155
  %92 = alloca [100 x i1]                                                          ; inst 156
  %93 = getelementptr [100 x i1], [100 x i1]* %92, i32 0, i32 0                    ; inst 157
  br label %_46.array.cond.15                                                      ; inst 158
_46.array.cond.15:
  %94 = phi i32 [0, %_45.array.exit.14], [%97, %_47.array.body.15]                 ; inst 159
  %95 = icmp slt i32 %94, 100                                                      ; inst 160
  br i1 %95, label %_47.array.body.15, label %_48.array.exit.15                    ; inst 161
_47.array.body.15:
  %96 = getelementptr i1, i1* %93, i32 %94                                         ; inst 162
  store i1 0, i1* %96                                                              ; inst 163
  %97 = add i32 %94, 1                                                             ; inst 164
  br label %_46.array.cond.15                                                      ; inst 165
_48.array.exit.15:
  %98 = alloca [1000 x i32]                                                        ; inst 166
  %99 = getelementptr [1000 x i32], [1000 x i32]* %98, i32 0, i32 0                ; inst 167
  br label %_49.array.cond.16                                                      ; inst 168
_49.array.cond.16:
  %100 = phi i32 [0, %_48.array.exit.15], [%103, %_50.array.body.16]               ; inst 169
  %101 = icmp slt i32 %100, 1000                                                   ; inst 170
  br i1 %101, label %_50.array.body.16, label %_51.array.exit.16                   ; inst 171
_50.array.body.16:
  %102 = getelementptr i32, i32* %99, i32 %100                                     ; inst 172
  store i32 0, i32* %102                                                           ; inst 173
  %103 = add i32 %100, 1                                                           ; inst 174
  br label %_49.array.cond.16                                                      ; inst 175
_51.array.exit.16:
  br label %_52.while.cond.0                                                       ; inst 176
_52.while.cond.0:
  %104 = phi i32 [0, %_51.array.exit.16], [%136, %_56.while.exit.1]                ; inst 177
  %105 = icmp slt i32 %104, 100                                                    ; inst 178
  br i1 %105, label %_53.while.body.0, label %_57.while.exit.0                     ; inst 179
_53.while.body.0:
  %106 = sext i32 %104 to i64                                                      ; inst 180
  %107 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %106               ; inst 181
  %108 = mul i32 %104, 17                                                          ; inst 182
  %109 = add i32 %108, 23                                                          ; inst 183
  store i32 %109, i32* %107                                                        ; inst 184
  %110 = sext i32 %104 to i64                                                      ; inst 185
  %111 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %110               ; inst 186
  store i32 0, i32* %111                                                           ; inst 187
  %112 = sext i32 %104 to i64                                                      ; inst 188
  %113 = getelementptr [100 x i32], [100 x i32]* %12, i32 0, i64 %112              ; inst 189
  store i32 0, i32* %113                                                           ; inst 190
  %114 = sext i32 %104 to i64                                                      ; inst 191
  %115 = getelementptr [100 x i32], [100 x i32]* %18, i32 0, i64 %114              ; inst 192
  store i32 -1, i32* %115                                                          ; inst 193
  %116 = sext i32 %104 to i64                                                      ; inst 194
  %117 = getelementptr [100 x i32], [100 x i32]* %36, i32 0, i64 %116              ; inst 195
  store i32 1, i32* %117                                                           ; inst 196
  %118 = sext i32 %104 to i64                                                      ; inst 197
  %119 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %24, i32 0, i64 %118 ; inst 198
  %120 = getelementptr [50 x i32], [50 x i32]* %119, i32 0, i64 0                  ; inst 199
  store i32 0, i32* %120                                                           ; inst 200
  %121 = sext i32 %104 to i64                                                      ; inst 201
  %122 = getelementptr [100 x i32], [100 x i32]* %42, i32 0, i64 %121              ; inst 202
  store i32 0, i32* %122                                                           ; inst 203
  %123 = sext i32 %104 to i64                                                      ; inst 204
  %124 = getelementptr [100 x i32], [100 x i32]* %48, i32 0, i64 %123              ; inst 205
  store i32 0, i32* %124                                                           ; inst 206
  br label %_54.while.cond.1                                                       ; inst 207
_54.while.cond.1:
  %125 = phi i32 [0, %_53.while.body.0], [%135, %_55.while.body.1]                 ; inst 208
  %126 = icmp slt i32 %125, 100                                                    ; inst 209
  br i1 %126, label %_55.while.body.1, label %_56.while.exit.1                     ; inst 210
_55.while.body.1:
  %127 = sext i32 %104 to i64                                                      ; inst 211
  %128 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %54, i32 0, i64 %127 ; inst 212
  %129 = sext i32 %125 to i64                                                      ; inst 213
  %130 = getelementptr [100 x i32], [100 x i32]* %128, i32 0, i64 %129             ; inst 214
  store i32 1, i32* %130                                                           ; inst 215
  %131 = sext i32 %104 to i64                                                      ; inst 216
  %132 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %66, i32 0, i64 %131 ; inst 217
  %133 = sext i32 %125 to i64                                                      ; inst 218
  %134 = getelementptr [100 x i32], [100 x i32]* %132, i32 0, i64 %133             ; inst 219
  store i32 0, i32* %134                                                           ; inst 220
  %135 = add i32 %125, 1                                                           ; inst 221
  br label %_54.while.cond.1                                                       ; inst 222
_56.while.exit.1:
  %136 = add i32 %104, 1                                                           ; inst 223
  br label %_52.while.cond.0                                                       ; inst 224
_57.while.exit.0:
  br label %_58.while.cond.2                                                       ; inst 225
_58.while.cond.2:
  %137 = phi i32 [0, %_57.while.exit.0], [%162, %_83.if.exit.5]                    ; inst 226
  %138 = phi i32 [0, %_57.while.exit.0], [%143, %_83.if.exit.5]                    ; inst 227
  %139 = phi i32 [0, %_57.while.exit.0], [%157, %_83.if.exit.5]                    ; inst 228
  %140 = phi i32 [0, %_57.while.exit.0], [%166, %_83.if.exit.5]                    ; inst 229
  %141 = icmp slt i32 %137, 1000                                                   ; inst 230
  br i1 %141, label %_59.while.body.2, label %_84.while.exit.2                     ; inst 231
_59.while.body.2:
  call void @simulate_network_conditions([100 x i1]* %92, i32 %137, i32 100)       ; inst 232
  call void @process_timeouts([100 x i32]* %6, [100 x i32]* %12, [100 x i32]* %18, [1000 x [10 x i32]]* %78, i32* %91, i32 100, i32 %137) ; inst 233
  %142 = call i32 @process_message_queue([1000 x [10 x i32]]* %78, i32* %90, i32* %91, [100 x i32]* %6, [100 x i32]* %12, [100 x i32]* %18, [100 x [50 x i32]]* %24, [100 x i32]* %36, [100 x i32]* %42, [100 x [100 x i32]]* %54, [100 x [100 x i32]]* %66, [100 x i1]* %92, i32 100) ; inst 234
  %143 = add i32 %138, %142                                                        ; inst 235
  %144 = call i32 @check_leader_election([100 x i32]* %6, [100 x i32]* %12, i32 100) ; inst 236
  %145 = icmp sge i32 %144, 0                                                      ; inst 237
  br i1 %145, label %_60.if.then.0, label %_61.if.else.0                           ; inst 238
_60.if.then.0:
  call void @simulate_log_replication(i32 %144, [100 x [50 x i32]]* %24, [100 x i32]* %36, [100 x i32]* %42, [100 x [100 x i32]]* %54, [100 x [100 x i32]]* %66, [1000 x [10 x i32]]* %78, i32* %91, [100 x i1]* %92, i32 100, i32 %137) ; inst 239
  br label %_62.if.exit.0                                                          ; inst 240
_61.if.else.0:
  br label %_62.if.exit.0                                                          ; inst 241
_62.if.exit.0:
  %146 = icmp sge i32 %144, 0                                                      ; inst 242
  br i1 %146, label %_63.lazy.then.0, label %_64.lazy.else.0                       ; inst 243
_63.lazy.then.0:
  %147 = srem i32 %137, 10                                                         ; inst 244
  %148 = icmp eq i32 %147, 0                                                       ; inst 245
  br label %_65.lazy.exit.0                                                        ; inst 246
_64.lazy.else.0:
  br label %_65.lazy.exit.0                                                        ; inst 247
_65.lazy.exit.0:
  %149 = phi i1 [%148, %_63.lazy.then.0], [0, %_64.lazy.else.0]                    ; inst 248
  br i1 %149, label %_66.if.then.1, label %_67.if.else.1                           ; inst 249
_66.if.then.1:
  %150 = sdiv i32 %137, 10                                                         ; inst 250
  %151 = add i32 %150, 1000                                                        ; inst 251
  call void @append_log_entry(i32 %144, i32 %151, [100 x [50 x i32]]* %24, [100 x i32]* %36) ; inst 252
  br label %_68.if.exit.1                                                          ; inst 253
_67.if.else.1:
  br label %_68.if.exit.1                                                          ; inst 254
_68.if.exit.1:
  %152 = call i32 @verify_system_consistency([100 x i32]* %6, [100 x i32]* %12, [100 x [50 x i32]]* %24, [100 x i32]* %36, [100 x i32]* %42, i32 100) ; inst 255
  %153 = icmp slt i32 %152, 80                                                     ; inst 256
  br i1 %153, label %_69.lazy.then.1, label %_70.lazy.else.1                       ; inst 257
_69.lazy.then.1:
  %154 = icmp sgt i32 %137, 100                                                    ; inst 258
  br label %_71.lazy.exit.1                                                        ; inst 259
_70.lazy.else.1:
  br label %_71.lazy.exit.1                                                        ; inst 260
_71.lazy.exit.1:
  %155 = phi i1 [%154, %_69.lazy.then.1], [0, %_70.lazy.else.1]                    ; inst 261
  br i1 %155, label %_72.if.then.2, label %_73.if.else.2                           ; inst 262
_72.if.then.2:
  call void @trigger_recovery_protocol([100 x i32]* %6, [100 x i32]* %12, [100 x i32]* %18, i32 100) ; inst 263
  %156 = add i32 %139, 1                                                           ; inst 264
  br label %_74.if.exit.2                                                          ; inst 265
_73.if.else.2:
  br label %_74.if.exit.2                                                          ; inst 266
_74.if.exit.2:
  %157 = phi i32 [%156, %_72.if.then.2], [%139, %_73.if.else.2]                    ; inst 267
  %158 = srem i32 %137, 50                                                         ; inst 268
  %159 = icmp eq i32 %158, 0                                                       ; inst 269
  br i1 %159, label %_75.if.then.3, label %_76.if.else.3                           ; inst 270
_75.if.then.3:
  call void @simulate_byzantine_failures([100 x i32]* %6, [100 x i1]* %92, i32 100, i32 %137) ; inst 271
  br label %_77.if.exit.3                                                          ; inst 272
_76.if.else.3:
  br label %_77.if.exit.3                                                          ; inst 273
_77.if.exit.3:
  %160 = srem i32 %137, 100                                                        ; inst 274
  %161 = icmp eq i32 %160, 0                                                       ; inst 275
  br i1 %161, label %_78.if.then.4, label %_79.if.else.4                           ; inst 276
_78.if.then.4:
  call void @compact_logs([100 x [50 x i32]]* %24, [100 x i32]* %36, [100 x i32]* %42, i32 100) ; inst 277
  br label %_80.if.exit.4                                                          ; inst 278
_79.if.else.4:
  br label %_80.if.exit.4                                                          ; inst 279
_80.if.exit.4:
  %162 = add i32 %137, 1                                                           ; inst 280
  %163 = srem i32 %162, 100                                                        ; inst 281
  %164 = icmp eq i32 %163, 0                                                       ; inst 282
  br i1 %164, label %_81.if.then.5, label %_82.if.else.5                           ; inst 283
_81.if.then.5:
  %165 = add i32 %140, 1                                                           ; inst 284
  br label %_83.if.exit.5                                                          ; inst 285
_82.if.else.5:
  br label %_83.if.exit.5                                                          ; inst 286
_83.if.exit.5:
  %166 = phi i32 [%165, %_81.if.then.5], [%140, %_82.if.else.5]                    ; inst 287
  br label %_58.while.cond.2                                                       ; inst 288
_84.while.exit.2:
  %167 = call i32 @find_stable_leader([100 x i32]* %6, [100 x i32]* %12, i32 100)  ; inst 289
  %168 = call i32 @count_total_committed_entries([100 x i32]* %42, i32 100)        ; inst 290
  %169 = call i32 @calculate_network_efficiency(i32 %138, i32 %140)                ; inst 291
  %170 = call i32 @compute_system_state_hash([100 x [50 x i32]]* %24, [100 x i32]* %36, [100 x i32]* %42, i32 100) ; inst 292
  call void @printlnInt(i32 %167)                                                  ; inst 293
  call void @printlnInt(i32 %168)                                                  ; inst 294
  call void @printlnInt(i32 %169)                                                  ; inst 295
  call void @printlnInt(i32 %170)                                                  ; inst 296
  call void @printlnInt(i32 0)                                                     ; inst 297
  call void @printlnInt(i32 %139)                                                  ; inst 298
  call void @printlnInt(i32 %138)                                                  ; inst 299
  call void @printlnInt(i32 %140)                                                  ; inst 300
  call void @exit(i32 0)                                                           ; inst 301
  ret void                                                                         ; inst 302
}

define void @simulate_network_conditions([100 x i1]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = srem i32 %1, 200                                                            ; inst 1
  %4 = icmp eq i32 %3, 50                                                          ; inst 2
  br i1 %4, label %_1.if.then.0, label %_5.if.else.0                               ; inst 3
_1.if.then.0:
  br label %_2.while.cond.0                                                        ; inst 4
_2.while.cond.0:
  %5 = phi i32 [0, %_1.if.then.0], [%13, %_3.while.body.0]                         ; inst 5
  %6 = icmp slt i32 %5, %2                                                         ; inst 6
  br i1 %6, label %_3.while.body.0, label %_4.while.exit.0                         ; inst 7
_3.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 8
  %8 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %7                     ; inst 9
  %9 = mul i32 %5, 7                                                               ; inst 10
  %10 = add i32 %9, %1                                                             ; inst 11
  %11 = srem i32 %10, 3                                                            ; inst 12
  %12 = icmp eq i32 %11, 0                                                         ; inst 13
  store i1 %12, i1* %8                                                             ; inst 14
  %13 = add i32 %5, 1                                                              ; inst 15
  br label %_2.while.cond.0                                                        ; inst 16
_4.while.exit.0:
  br label %_18.if.exit.0                                                          ; inst 17
_5.if.else.0:
  %14 = srem i32 %1, 200                                                           ; inst 18
  %15 = icmp eq i32 %14, 150                                                       ; inst 19
  br i1 %15, label %_6.if.then.1, label %_10.if.else.1                             ; inst 20
_6.if.then.1:
  br label %_7.while.cond.1                                                        ; inst 21
_7.while.cond.1:
  %16 = phi i32 [0, %_6.if.then.1], [%20, %_8.while.body.1]                        ; inst 22
  %17 = icmp slt i32 %16, %2                                                       ; inst 23
  br i1 %17, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 24
_8.while.body.1:
  %18 = sext i32 %16 to i64                                                        ; inst 25
  %19 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %18                   ; inst 26
  store i1 0, i1* %19                                                              ; inst 27
  %20 = add i32 %16, 1                                                             ; inst 28
  br label %_7.while.cond.1                                                        ; inst 29
_9.while.exit.1:
  br label %_17.if.exit.1                                                          ; inst 30
_10.if.else.1:
  %21 = srem i32 %1, 80                                                            ; inst 31
  %22 = icmp eq i32 %21, 0                                                         ; inst 32
  br i1 %22, label %_11.if.then.2, label %_15.if.else.2                            ; inst 33
_11.if.then.2:
  br label %_12.while.cond.2                                                       ; inst 34
_12.while.cond.2:
  %23 = phi i32 [0, %_11.if.then.2], [%32, %_13.while.body.2]                      ; inst 35
  %24 = icmp slt i32 %23, %2                                                       ; inst 36
  br i1 %24, label %_13.while.body.2, label %_14.while.exit.2                      ; inst 37
_13.while.body.2:
  %25 = sext i32 %23 to i64                                                        ; inst 38
  %26 = getelementptr [100 x i1], [100 x i1]* %0, i32 0, i64 %25                   ; inst 39
  %27 = mul i32 %23, 13                                                            ; inst 40
  %28 = mul i32 %1, 7                                                              ; inst 41
  %29 = add i32 %27, %28                                                           ; inst 42
  %30 = srem i32 %29, 17                                                           ; inst 43
  %31 = icmp eq i32 %30, 0                                                         ; inst 44
  store i1 %31, i1* %26                                                            ; inst 45
  %32 = add i32 %23, 1                                                             ; inst 46
  br label %_12.while.cond.2                                                       ; inst 47
_14.while.exit.2:
  br label %_16.if.exit.2                                                          ; inst 48
_15.if.else.2:
  br label %_16.if.exit.2                                                          ; inst 49
_16.if.exit.2:
  br label %_17.if.exit.1                                                          ; inst 50
_17.if.exit.1:
  br label %_18.if.exit.0                                                          ; inst 51
_18.if.exit.0:
  ret void                                                                         ; inst 52
}

define void @process_timeouts([100 x i32]* %0, [100 x i32]* %1, [100 x i32]* %2, [1000 x [10 x i32]]* %3, i32* %4, i32 %5, i32 %6) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%51, %_26.if.exit.0]                             ; inst 2
  %8 = icmp slt i32 %7, %5                                                         ; inst 3
  br i1 %8, label %_2.while.body.0, label %_27.while.exit.0                        ; inst 4
_2.while.body.0:
  %9 = mul i32 %7, 23                                                              ; inst 5
  %10 = mul i32 %6, 7                                                              ; inst 6
  %11 = add i32 %9, %10                                                            ; inst 7
  %12 = srem i32 %11, 47                                                           ; inst 8
  %13 = icmp eq i32 %12, 0                                                         ; inst 9
  br i1 %13, label %_3.if.then.0, label %_25.if.else.0                             ; inst 10
_3.if.then.0:
  %14 = sext i32 %7 to i64                                                         ; inst 11
  %15 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %14                 ; inst 12
  %16 = load i32, i32* %15                                                         ; inst 13
  %17 = icmp eq i32 %16, 0                                                         ; inst 14
  br i1 %17, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 15
_4.lazy.then.0:
  br label %_6.lazy.exit.0                                                         ; inst 16
_5.lazy.else.0:
  %18 = sext i32 %7 to i64                                                         ; inst 17
  %19 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %18                 ; inst 18
  %20 = load i32, i32* %19                                                         ; inst 19
  %21 = icmp eq i32 %20, 1                                                         ; inst 20
  br label %_6.lazy.exit.0                                                         ; inst 21
_6.lazy.exit.0:
  %22 = phi i1 [1, %_4.lazy.then.0], [%21, %_5.lazy.else.0]                        ; inst 22
  br i1 %22, label %_7.if.then.1, label %_14.if.else.1                             ; inst 23
_7.if.then.1:
  %23 = sext i32 %7 to i64                                                         ; inst 24
  %24 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %23                 ; inst 25
  store i32 1, i32* %24                                                            ; inst 26
  %25 = sext i32 %7 to i64                                                         ; inst 27
  %26 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %25                 ; inst 28
  %27 = sext i32 %7 to i64                                                         ; inst 29
  %28 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %27                 ; inst 30
  %29 = load i32, i32* %28                                                         ; inst 31
  %30 = add i32 %29, 1                                                             ; inst 32
  store i32 %30, i32* %26                                                          ; inst 33
  %31 = sext i32 %7 to i64                                                         ; inst 34
  %32 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %31                 ; inst 35
  store i32 %7, i32* %32                                                           ; inst 36
  br label %_8.while.cond.1                                                        ; inst 37
_8.while.cond.1:
  %33 = phi i32 [0, %_7.if.then.1], [%39, %_12.if.exit.2]                          ; inst 38
  %34 = icmp slt i32 %33, %5                                                       ; inst 39
  br i1 %34, label %_9.while.body.1, label %_13.while.exit.1                       ; inst 40
_9.while.body.1:
  %35 = icmp ne i32 %33, %7                                                        ; inst 41
  br i1 %35, label %_10.if.then.2, label %_11.if.else.2                            ; inst 42
_10.if.then.2:
  %36 = sext i32 %7 to i64                                                         ; inst 43
  %37 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %36                 ; inst 44
  %38 = load i32, i32* %37                                                         ; inst 45
  call void @enqueue_message([1000 x [10 x i32]]* %3, i32* %4, i32 %7, i32 %33, i32 1, i32 %38, i32 0, i32 0, i32 0) ; inst 46
  br label %_12.if.exit.2                                                          ; inst 47
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 48
_12.if.exit.2:
  %39 = add i32 %33, 1                                                             ; inst 49
  br label %_8.while.cond.1                                                        ; inst 50
_13.while.exit.1:
  br label %_24.if.exit.1                                                          ; inst 51
_14.if.else.1:
  %40 = sext i32 %7 to i64                                                         ; inst 52
  %41 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %40                 ; inst 53
  %42 = load i32, i32* %41                                                         ; inst 54
  %43 = icmp eq i32 %42, 2                                                         ; inst 55
  br i1 %43, label %_15.if.then.3, label %_22.if.else.3                            ; inst 56
_15.if.then.3:
  br label %_16.while.cond.2                                                       ; inst 57
_16.while.cond.2:
  %44 = phi i32 [0, %_15.if.then.3], [%50, %_20.if.exit.4]                         ; inst 58
  %45 = icmp slt i32 %44, %5                                                       ; inst 59
  br i1 %45, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 60
_17.while.body.2:
  %46 = icmp ne i32 %44, %7                                                        ; inst 61
  br i1 %46, label %_18.if.then.4, label %_19.if.else.4                            ; inst 62
_18.if.then.4:
  %47 = sext i32 %7 to i64                                                         ; inst 63
  %48 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %47                 ; inst 64
  %49 = load i32, i32* %48                                                         ; inst 65
  call void @enqueue_message([1000 x [10 x i32]]* %3, i32* %4, i32 %7, i32 %44, i32 2, i32 %49, i32 0, i32 0, i32 0) ; inst 66
  br label %_20.if.exit.4                                                          ; inst 67
_19.if.else.4:
  br label %_20.if.exit.4                                                          ; inst 68
_20.if.exit.4:
  %50 = add i32 %44, 1                                                             ; inst 69
  br label %_16.while.cond.2                                                       ; inst 70
_21.while.exit.2:
  br label %_23.if.exit.3                                                          ; inst 71
_22.if.else.3:
  br label %_23.if.exit.3                                                          ; inst 72
_23.if.exit.3:
  br label %_24.if.exit.1                                                          ; inst 73
_24.if.exit.1:
  br label %_26.if.exit.0                                                          ; inst 74
_25.if.else.0:
  br label %_26.if.exit.0                                                          ; inst 75
_26.if.exit.0:
  %51 = add i32 %7, 1                                                              ; inst 76
  br label %_1.while.cond.0                                                        ; inst 77
_27.while.exit.0:
  ret void                                                                         ; inst 78
}

define i32 @process_message_queue([1000 x [10 x i32]]* %0, i32* %1, i32* %2, [100 x i32]* %3, [100 x i32]* %4, [100 x i32]* %5, [100 x [50 x i32]]* %6, [100 x i32]* %7, [100 x i32]* %8, [100 x [100 x i32]]* %9, [100 x [100 x i32]]* %10, [100 x i1]* %11, i32 %12) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %13 = phi i32 [0, %_0.entry.0], [%79, %_38.if.exit.0]                            ; inst 2
  %14 = load i32, i32* %1                                                          ; inst 3
  %15 = load i32, i32* %2                                                          ; inst 4
  %16 = icmp ne i32 %14, %15                                                       ; inst 5
  br i1 %16, label %_2.lazy.then.0, label %_3.lazy.else.0                          ; inst 6
_2.lazy.then.0:
  %17 = icmp slt i32 %13, 100                                                      ; inst 7
  br label %_4.lazy.exit.0                                                         ; inst 8
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 9
_4.lazy.exit.0:
  %18 = phi i1 [%17, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 10
  br i1 %18, label %_5.while.body.0, label %_39.while.exit.0                       ; inst 11
_5.while.body.0:
  %19 = load i32, i32* %1                                                          ; inst 12
  %20 = sext i32 %19 to i64                                                        ; inst 13
  %21 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %20 ; inst 14
  %22 = getelementptr [10 x i32], [10 x i32]* %21, i32 0, i64 0                    ; inst 15
  %23 = load i32, i32* %22                                                         ; inst 16
  %24 = load i32, i32* %1                                                          ; inst 17
  %25 = sext i32 %24 to i64                                                        ; inst 18
  %26 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %25 ; inst 19
  %27 = getelementptr [10 x i32], [10 x i32]* %26, i32 0, i64 1                    ; inst 20
  %28 = load i32, i32* %27                                                         ; inst 21
  %29 = load i32, i32* %1                                                          ; inst 22
  %30 = sext i32 %29 to i64                                                        ; inst 23
  %31 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %30 ; inst 24
  %32 = getelementptr [10 x i32], [10 x i32]* %31, i32 0, i64 2                    ; inst 25
  %33 = load i32, i32* %32                                                         ; inst 26
  %34 = load i32, i32* %1                                                          ; inst 27
  %35 = sext i32 %34 to i64                                                        ; inst 28
  %36 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %35 ; inst 29
  %37 = getelementptr [10 x i32], [10 x i32]* %36, i32 0, i64 3                    ; inst 30
  %38 = load i32, i32* %37                                                         ; inst 31
  %39 = load i32, i32* %1                                                          ; inst 32
  %40 = sext i32 %39 to i64                                                        ; inst 33
  %41 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %40 ; inst 34
  %42 = getelementptr [10 x i32], [10 x i32]* %41, i32 0, i64 4                    ; inst 35
  %43 = load i32, i32* %42                                                         ; inst 36
  %44 = load i32, i32* %1                                                          ; inst 37
  %45 = sext i32 %44 to i64                                                        ; inst 38
  %46 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %45 ; inst 39
  %47 = getelementptr [10 x i32], [10 x i32]* %46, i32 0, i64 5                    ; inst 40
  %48 = load i32, i32* %47                                                         ; inst 41
  %49 = load i32, i32* %1                                                          ; inst 42
  %50 = sext i32 %49 to i64                                                        ; inst 43
  %51 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %50 ; inst 44
  %52 = getelementptr [10 x i32], [10 x i32]* %51, i32 0, i64 6                    ; inst 45
  %53 = load i32, i32* %52                                                         ; inst 46
  %54 = sext i32 %23 to i64                                                        ; inst 47
  %55 = getelementptr [100 x i1], [100 x i1]* %11, i32 0, i64 %54                  ; inst 48
  %56 = load i1, i1* %55                                                           ; inst 49
  %57 = icmp eq i1 %56, 0                                                          ; inst 50
  br i1 %57, label %_6.lazy.then.1, label %_7.lazy.else.1                          ; inst 51
_6.lazy.then.1:
  %58 = sext i32 %28 to i64                                                        ; inst 52
  %59 = getelementptr [100 x i1], [100 x i1]* %11, i32 0, i64 %58                  ; inst 53
  %60 = load i1, i1* %59                                                           ; inst 54
  %61 = icmp eq i1 %60, 0                                                          ; inst 55
  br label %_8.lazy.exit.1                                                         ; inst 56
_7.lazy.else.1:
  br label %_8.lazy.exit.1                                                         ; inst 57
_8.lazy.exit.1:
  %62 = phi i1 [%61, %_6.lazy.then.1], [0, %_7.lazy.else.1]                        ; inst 58
  br i1 %62, label %_9.lazy.then.2, label %_10.lazy.else.2                         ; inst 59
_9.lazy.then.2:
  %63 = icmp sge i32 %23, 0                                                        ; inst 60
  br label %_11.lazy.exit.2                                                        ; inst 61
_10.lazy.else.2:
  br label %_11.lazy.exit.2                                                        ; inst 62
_11.lazy.exit.2:
  %64 = phi i1 [%63, %_9.lazy.then.2], [0, %_10.lazy.else.2]                       ; inst 63
  br i1 %64, label %_12.lazy.then.3, label %_13.lazy.else.3                        ; inst 64
_12.lazy.then.3:
  %65 = icmp slt i32 %23, %12                                                      ; inst 65
  br label %_14.lazy.exit.3                                                        ; inst 66
_13.lazy.else.3:
  br label %_14.lazy.exit.3                                                        ; inst 67
_14.lazy.exit.3:
  %66 = phi i1 [%65, %_12.lazy.then.3], [0, %_13.lazy.else.3]                      ; inst 68
  br i1 %66, label %_15.lazy.then.4, label %_16.lazy.else.4                        ; inst 69
_15.lazy.then.4:
  %67 = icmp sge i32 %28, 0                                                        ; inst 70
  br label %_17.lazy.exit.4                                                        ; inst 71
_16.lazy.else.4:
  br label %_17.lazy.exit.4                                                        ; inst 72
_17.lazy.exit.4:
  %68 = phi i1 [%67, %_15.lazy.then.4], [0, %_16.lazy.else.4]                      ; inst 73
  br i1 %68, label %_18.lazy.then.5, label %_19.lazy.else.5                        ; inst 74
_18.lazy.then.5:
  %69 = icmp slt i32 %28, %12                                                      ; inst 75
  br label %_20.lazy.exit.5                                                        ; inst 76
_19.lazy.else.5:
  br label %_20.lazy.exit.5                                                        ; inst 77
_20.lazy.exit.5:
  %70 = phi i1 [%69, %_18.lazy.then.5], [0, %_19.lazy.else.5]                      ; inst 78
  br i1 %70, label %_21.if.then.0, label %_37.if.else.0                            ; inst 79
_21.if.then.0:
  %71 = icmp eq i32 %33, 1                                                         ; inst 80
  br i1 %71, label %_22.if.then.1, label %_23.if.else.1                            ; inst 81
_22.if.then.1:
  call void @handle_vote_request(i32 %23, i32 %28, i32 %38, [100 x i32]* %3, [100 x i32]* %4, [100 x i32]* %5) ; inst 82
  br label %_36.if.exit.1                                                          ; inst 83
_23.if.else.1:
  %72 = icmp eq i32 %33, 2                                                         ; inst 84
  br i1 %72, label %_24.if.then.2, label %_25.if.else.2                            ; inst 85
_24.if.then.2:
  call void @handle_heartbeat(i32 %23, i32 %28, i32 %38, [100 x i32]* %3, [100 x i32]* %4, [100 x i32]* %5) ; inst 86
  br label %_35.if.exit.2                                                          ; inst 87
_25.if.else.2:
  %73 = icmp eq i32 %33, 3                                                         ; inst 88
  br i1 %73, label %_26.if.then.3, label %_27.if.else.3                            ; inst 89
_26.if.then.3:
  call void @handle_vote_response(i32 %23, i32 %28, i32 %38, i32 %43, [100 x i32]* %3, [100 x i32]* %4, i32 %12) ; inst 90
  br label %_34.if.exit.3                                                          ; inst 91
_27.if.else.3:
  %74 = icmp eq i32 %33, 4                                                         ; inst 92
  br i1 %74, label %_28.if.then.4, label %_29.if.else.4                            ; inst 93
_28.if.then.4:
  call void @handle_append_entries(i32 %23, i32 %28, i32 %38, i32 %43, i32 %48, i32 %53, [100 x i32]* %3, [100 x i32]* %4, [100 x [50 x i32]]* %6, [100 x i32]* %7, [100 x i32]* %8) ; inst 94
  br label %_33.if.exit.4                                                          ; inst 95
_29.if.else.4:
  %75 = icmp eq i32 %33, 5                                                         ; inst 96
  br i1 %75, label %_30.if.then.5, label %_31.if.else.5                            ; inst 97
_30.if.then.5:
  call void @handle_append_response(i32 %23, i32 %28, i32 %38, i32 %43, i32 %48, [100 x i32]* %3, [100 x [100 x i32]]* %9, [100 x [100 x i32]]* %10) ; inst 98
  br label %_32.if.exit.5                                                          ; inst 99
_31.if.else.5:
  br label %_32.if.exit.5                                                          ; inst 100
_32.if.exit.5:
  br label %_33.if.exit.4                                                          ; inst 101
_33.if.exit.4:
  br label %_34.if.exit.3                                                          ; inst 102
_34.if.exit.3:
  br label %_35.if.exit.2                                                          ; inst 103
_35.if.exit.2:
  br label %_36.if.exit.1                                                          ; inst 104
_36.if.exit.1:
  br label %_38.if.exit.0                                                          ; inst 105
_37.if.else.0:
  br label %_38.if.exit.0                                                          ; inst 106
_38.if.exit.0:
  %76 = load i32, i32* %1                                                          ; inst 107
  %77 = add i32 %76, 1                                                             ; inst 108
  %78 = srem i32 %77, 1000                                                         ; inst 109
  store i32 %78, i32* %1                                                           ; inst 110
  %79 = add i32 %13, 1                                                             ; inst 111
  br label %_1.while.cond.0                                                        ; inst 112
_39.while.exit.0:
  ret i32 %13                                                                      ; inst 113
}

define void @handle_vote_request(i32 %0, i32 %1, i32 %2, [100 x i32]* %3, [100 x i32]* %4, [100 x i32]* %5) {
_0.entry.0:
  %6 = sext i32 %1 to i64                                                          ; inst 1
  %7 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %6                   ; inst 2
  %8 = load i32, i32* %7                                                           ; inst 3
  %9 = icmp sgt i32 %2, %8                                                         ; inst 4
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  %10 = sext i32 %1 to i64                                                         ; inst 6
  %11 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %10                 ; inst 7
  store i32 %2, i32* %11                                                           ; inst 8
  %12 = sext i32 %1 to i64                                                         ; inst 9
  %13 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %12                 ; inst 10
  store i32 0, i32* %13                                                            ; inst 11
  %14 = sext i32 %1 to i64                                                         ; inst 12
  %15 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %14                 ; inst 13
  store i32 -1, i32* %15                                                           ; inst 14
  br label %_3.if.exit.0                                                           ; inst 15
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 16
_3.if.exit.0:
  %16 = sext i32 %1 to i64                                                         ; inst 17
  %17 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %16                 ; inst 18
  %18 = load i32, i32* %17                                                         ; inst 19
  %19 = icmp eq i32 %2, %18                                                        ; inst 20
  br i1 %19, label %_4.lazy.then.0, label %_8.lazy.else.0                          ; inst 21
_4.lazy.then.0:
  %20 = sext i32 %1 to i64                                                         ; inst 22
  %21 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %20                 ; inst 23
  %22 = load i32, i32* %21                                                         ; inst 24
  %23 = icmp eq i32 %22, -1                                                        ; inst 25
  br i1 %23, label %_5.lazy.then.1, label %_6.lazy.else.1                          ; inst 26
_5.lazy.then.1:
  br label %_7.lazy.exit.1                                                         ; inst 27
_6.lazy.else.1:
  %24 = sext i32 %1 to i64                                                         ; inst 28
  %25 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %24                 ; inst 29
  %26 = load i32, i32* %25                                                         ; inst 30
  %27 = icmp eq i32 %26, %0                                                        ; inst 31
  br label %_7.lazy.exit.1                                                         ; inst 32
_7.lazy.exit.1:
  %28 = phi i1 [1, %_5.lazy.then.1], [%27, %_6.lazy.else.1]                        ; inst 33
  br label %_9.lazy.exit.0                                                         ; inst 34
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 35
_9.lazy.exit.0:
  %29 = phi i1 [%28, %_7.lazy.exit.1], [0, %_8.lazy.else.0]                        ; inst 36
  br i1 %29, label %_10.if.then.1, label %_11.if.else.1                            ; inst 37
_10.if.then.1:
  %30 = sext i32 %1 to i64                                                         ; inst 38
  %31 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %30                 ; inst 39
  store i32 %0, i32* %31                                                           ; inst 40
  br label %_12.if.exit.1                                                          ; inst 41
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 42
_12.if.exit.1:
  ret void                                                                         ; inst 43
}

define void @handle_heartbeat(i32 %0, i32 %1, i32 %2, [100 x i32]* %3, [100 x i32]* %4, [100 x i32]* %5) {
_0.entry.0:
  %6 = sext i32 %1 to i64                                                          ; inst 1
  %7 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %6                   ; inst 2
  %8 = load i32, i32* %7                                                           ; inst 3
  %9 = icmp sge i32 %2, %8                                                         ; inst 4
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  %10 = sext i32 %1 to i64                                                         ; inst 6
  %11 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %10                 ; inst 7
  store i32 %2, i32* %11                                                           ; inst 8
  %12 = sext i32 %1 to i64                                                         ; inst 9
  %13 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %12                 ; inst 10
  store i32 0, i32* %13                                                            ; inst 11
  %14 = sext i32 %1 to i64                                                         ; inst 12
  %15 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %14                 ; inst 13
  store i32 -1, i32* %15                                                           ; inst 14
  br label %_3.if.exit.0                                                           ; inst 15
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 16
_3.if.exit.0:
  ret void                                                                         ; inst 17
}

define void @handle_vote_response(i32 %0, i32 %1, i32 %2, i32 %3, [100 x i32]* %4, [100 x i32]* %5, i32 %6) {
_0.entry.0:
  %7 = sext i32 %1 to i64                                                          ; inst 1
  %8 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %7                   ; inst 2
  %9 = load i32, i32* %8                                                           ; inst 3
  %10 = icmp eq i32 %9, 1                                                          ; inst 4
  br i1 %10, label %_1.lazy.then.0, label %_2.lazy.else.0                          ; inst 5
_1.lazy.then.0:
  %11 = sext i32 %1 to i64                                                         ; inst 6
  %12 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %11                 ; inst 7
  %13 = load i32, i32* %12                                                         ; inst 8
  %14 = icmp eq i32 %2, %13                                                        ; inst 9
  br label %_3.lazy.exit.0                                                         ; inst 10
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 11
_3.lazy.exit.0:
  %15 = phi i1 [%14, %_1.lazy.then.0], [0, %_2.lazy.else.0]                        ; inst 12
  br i1 %15, label %_4.lazy.then.1, label %_5.lazy.else.1                          ; inst 13
_4.lazy.then.1:
  %16 = icmp eq i32 %3, 1                                                          ; inst 14
  br label %_6.lazy.exit.1                                                         ; inst 15
_5.lazy.else.1:
  br label %_6.lazy.exit.1                                                         ; inst 16
_6.lazy.exit.1:
  %17 = phi i1 [%16, %_4.lazy.then.1], [0, %_5.lazy.else.1]                        ; inst 17
  br i1 %17, label %_7.if.then.0, label %_11.if.else.0                             ; inst 18
_7.if.then.0:
  %18 = sdiv i32 %6, 2                                                             ; inst 19
  %19 = add i32 %18, 1                                                             ; inst 20
  %20 = mul i32 %1, 3                                                              ; inst 21
  %21 = srem i32 %20, %6                                                           ; inst 22
  %22 = sub i32 %19, 1                                                             ; inst 23
  %23 = icmp sge i32 %21, %22                                                      ; inst 24
  br i1 %23, label %_8.if.then.1, label %_9.if.else.1                              ; inst 25
_8.if.then.1:
  %24 = sext i32 %1 to i64                                                         ; inst 26
  %25 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %24                 ; inst 27
  store i32 2, i32* %25                                                            ; inst 28
  br label %_10.if.exit.1                                                          ; inst 29
_9.if.else.1:
  br label %_10.if.exit.1                                                          ; inst 30
_10.if.exit.1:
  br label %_12.if.exit.0                                                          ; inst 31
_11.if.else.0:
  br label %_12.if.exit.0                                                          ; inst 32
_12.if.exit.0:
  ret void                                                                         ; inst 33
}

define void @handle_append_entries(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, [100 x i32]* %6, [100 x i32]* %7, [100 x [50 x i32]]* %8, [100 x i32]* %9, [100 x i32]* %10) {
_0.entry.0:
  %11 = sext i32 %1 to i64                                                         ; inst 1
  %12 = getelementptr [100 x i32], [100 x i32]* %7, i32 0, i64 %11                 ; inst 2
  %13 = load i32, i32* %12                                                         ; inst 3
  %14 = icmp slt i32 %2, %13                                                       ; inst 4
  br i1 %14, label %_1.if.then.0, label %_2.if.else.0                              ; inst 5
_1.if.then.0:
  ret void                                                                         ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %15 = sext i32 %1 to i64                                                         ; inst 8
  %16 = getelementptr [100 x i32], [100 x i32]* %7, i32 0, i64 %15                 ; inst 9
  %17 = load i32, i32* %16                                                         ; inst 10
  %18 = icmp sgt i32 %2, %17                                                       ; inst 11
  br i1 %18, label %_4.if.then.1, label %_5.if.else.1                              ; inst 12
_4.if.then.1:
  %19 = sext i32 %1 to i64                                                         ; inst 13
  %20 = getelementptr [100 x i32], [100 x i32]* %7, i32 0, i64 %19                 ; inst 14
  store i32 %2, i32* %20                                                           ; inst 15
  %21 = sext i32 %1 to i64                                                         ; inst 16
  %22 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %21                 ; inst 17
  store i32 0, i32* %22                                                            ; inst 18
  br label %_6.if.exit.1                                                           ; inst 19
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 20
_6.if.exit.1:
  %23 = icmp sge i32 %3, 0                                                         ; inst 21
  br i1 %23, label %_7.lazy.then.0, label %_8.lazy.else.0                          ; inst 22
_7.lazy.then.0:
  %24 = sext i32 %1 to i64                                                         ; inst 23
  %25 = getelementptr [100 x i32], [100 x i32]* %9, i32 0, i64 %24                 ; inst 24
  %26 = load i32, i32* %25                                                         ; inst 25
  %27 = icmp slt i32 %3, %26                                                       ; inst 26
  br label %_9.lazy.exit.0                                                         ; inst 27
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 28
_9.lazy.exit.0:
  %28 = phi i1 [%27, %_7.lazy.then.0], [0, %_8.lazy.else.0]                        ; inst 29
  br i1 %28, label %_10.if.then.2, label %_20.if.else.2                            ; inst 30
_10.if.then.2:
  %29 = sext i32 %1 to i64                                                         ; inst 31
  %30 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %8, i32 0, i64 %29   ; inst 32
  %31 = sext i32 %3 to i64                                                         ; inst 33
  %32 = getelementptr [50 x i32], [50 x i32]* %30, i32 0, i64 %31                  ; inst 34
  %33 = load i32, i32* %32                                                         ; inst 35
  %34 = icmp eq i32 %33, %4                                                        ; inst 36
  br i1 %34, label %_11.if.then.3, label %_18.if.else.3                            ; inst 37
_11.if.then.3:
  %35 = icmp sgt i32 %5, 0                                                         ; inst 38
  br i1 %35, label %_12.lazy.then.1, label %_13.lazy.else.1                        ; inst 39
_12.lazy.then.1:
  %36 = sext i32 %1 to i64                                                         ; inst 40
  %37 = getelementptr [100 x i32], [100 x i32]* %9, i32 0, i64 %36                 ; inst 41
  %38 = load i32, i32* %37                                                         ; inst 42
  %39 = icmp slt i32 %38, 50                                                       ; inst 43
  br label %_14.lazy.exit.1                                                        ; inst 44
_13.lazy.else.1:
  br label %_14.lazy.exit.1                                                        ; inst 45
_14.lazy.exit.1:
  %40 = phi i1 [%39, %_12.lazy.then.1], [0, %_13.lazy.else.1]                      ; inst 46
  br i1 %40, label %_15.if.then.4, label %_16.if.else.4                            ; inst 47
_15.if.then.4:
  %41 = sext i32 %1 to i64                                                         ; inst 48
  %42 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %8, i32 0, i64 %41   ; inst 49
  %43 = sext i32 %1 to i64                                                         ; inst 50
  %44 = getelementptr [100 x i32], [100 x i32]* %9, i32 0, i64 %43                 ; inst 51
  %45 = load i32, i32* %44                                                         ; inst 52
  %46 = sext i32 %45 to i64                                                        ; inst 53
  %47 = getelementptr [50 x i32], [50 x i32]* %42, i32 0, i64 %46                  ; inst 54
  store i32 %5, i32* %47                                                           ; inst 55
  %48 = sext i32 %1 to i64                                                         ; inst 56
  %49 = getelementptr [100 x i32], [100 x i32]* %9, i32 0, i64 %48                 ; inst 57
  %50 = sext i32 %1 to i64                                                         ; inst 58
  %51 = getelementptr [100 x i32], [100 x i32]* %9, i32 0, i64 %50                 ; inst 59
  %52 = load i32, i32* %51                                                         ; inst 60
  %53 = add i32 %52, 1                                                             ; inst 61
  store i32 %53, i32* %49                                                          ; inst 62
  br label %_17.if.exit.4                                                          ; inst 63
_16.if.else.4:
  br label %_17.if.exit.4                                                          ; inst 64
_17.if.exit.4:
  br label %_19.if.exit.3                                                          ; inst 65
_18.if.else.3:
  br label %_19.if.exit.3                                                          ; inst 66
_19.if.exit.3:
  br label %_21.if.exit.2                                                          ; inst 67
_20.if.else.2:
  br label %_21.if.exit.2                                                          ; inst 68
_21.if.exit.2:
  ret void                                                                         ; inst 69
}

define void @handle_append_response(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, [100 x i32]* %5, [100 x [100 x i32]]* %6, [100 x [100 x i32]]* %7) {
_0.entry.0:
  %8 = sext i32 %1 to i64                                                          ; inst 1
  %9 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %8                   ; inst 2
  %10 = load i32, i32* %9                                                          ; inst 3
  %11 = icmp eq i32 %10, 2                                                         ; inst 4
  br i1 %11, label %_1.lazy.then.0, label %_2.lazy.else.0                          ; inst 5
_1.lazy.then.0:
  %12 = sext i32 %1 to i64                                                         ; inst 6
  %13 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %12                 ; inst 7
  %14 = load i32, i32* %13                                                         ; inst 8
  %15 = icmp eq i32 %2, %14                                                        ; inst 9
  br label %_3.lazy.exit.0                                                         ; inst 10
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 11
_3.lazy.exit.0:
  %16 = phi i1 [%15, %_1.lazy.then.0], [0, %_2.lazy.else.0]                        ; inst 12
  br i1 %16, label %_4.if.then.0, label %_11.if.else.0                             ; inst 13
_4.if.then.0:
  %17 = icmp eq i32 %3, 1                                                          ; inst 14
  br i1 %17, label %_5.if.then.1, label %_6.if.else.1                              ; inst 15
_5.if.then.1:
  %18 = sext i32 %1 to i64                                                         ; inst 16
  %19 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %6, i32 0, i64 %18 ; inst 17
  %20 = sext i32 %0 to i64                                                         ; inst 18
  %21 = getelementptr [100 x i32], [100 x i32]* %19, i32 0, i64 %20                ; inst 19
  %22 = add i32 %4, 1                                                              ; inst 20
  store i32 %22, i32* %21                                                          ; inst 21
  %23 = sext i32 %1 to i64                                                         ; inst 22
  %24 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %7, i32 0, i64 %23 ; inst 23
  %25 = sext i32 %0 to i64                                                         ; inst 24
  %26 = getelementptr [100 x i32], [100 x i32]* %24, i32 0, i64 %25                ; inst 25
  store i32 %4, i32* %26                                                           ; inst 26
  br label %_10.if.exit.1                                                          ; inst 27
_6.if.else.1:
  %27 = sext i32 %1 to i64                                                         ; inst 28
  %28 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %6, i32 0, i64 %27 ; inst 29
  %29 = sext i32 %0 to i64                                                         ; inst 30
  %30 = getelementptr [100 x i32], [100 x i32]* %28, i32 0, i64 %29                ; inst 31
  %31 = load i32, i32* %30                                                         ; inst 32
  %32 = icmp sgt i32 %31, 0                                                        ; inst 33
  br i1 %32, label %_7.if.then.2, label %_8.if.else.2                              ; inst 34
_7.if.then.2:
  %33 = sext i32 %1 to i64                                                         ; inst 35
  %34 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %6, i32 0, i64 %33 ; inst 36
  %35 = sext i32 %0 to i64                                                         ; inst 37
  %36 = getelementptr [100 x i32], [100 x i32]* %34, i32 0, i64 %35                ; inst 38
  %37 = sext i32 %1 to i64                                                         ; inst 39
  %38 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %6, i32 0, i64 %37 ; inst 40
  %39 = sext i32 %0 to i64                                                         ; inst 41
  %40 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %39                ; inst 42
  %41 = load i32, i32* %40                                                         ; inst 43
  %42 = sub i32 %41, 1                                                             ; inst 44
  store i32 %42, i32* %36                                                          ; inst 45
  br label %_9.if.exit.2                                                           ; inst 46
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 47
_9.if.exit.2:
  br label %_10.if.exit.1                                                          ; inst 48
_10.if.exit.1:
  br label %_12.if.exit.0                                                          ; inst 49
_11.if.else.0:
  br label %_12.if.exit.0                                                          ; inst 50
_12.if.exit.0:
  ret void                                                                         ; inst 51
}

define i32 @check_leader_election([100 x i32]* %0, [100 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%14, %_5.if.exit.0]                              ; inst 2
  %4 = phi i32 [-1, %_0.entry.0], [%13, %_5.if.exit.0]                             ; inst 3
  %5 = icmp slt i32 %3, %2                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = sext i32 %3 to i64                                                          ; inst 6
  %7 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %6                   ; inst 7
  %8 = load i32, i32* %7                                                           ; inst 8
  %9 = icmp sgt i32 %8, %4                                                         ; inst 9
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 10
_3.if.then.0:
  %10 = sext i32 %3 to i64                                                         ; inst 11
  %11 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %10                 ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  br label %_5.if.exit.0                                                           ; inst 14
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %13 = phi i32 [%12, %_3.if.then.0], [%4, %_4.if.else.0]                          ; inst 16
  %14 = add i32 %3, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 19
_7.while.cond.1:
  %15 = phi i32 [0, %_6.while.exit.0], [%31, %_14.if.exit.1]                       ; inst 20
  %16 = phi i32 [-1, %_6.while.exit.0], [%29, %_14.if.exit.1]                      ; inst 21
  %17 = phi i32 [0, %_6.while.exit.0], [%30, %_14.if.exit.1]                       ; inst 22
  %18 = icmp slt i32 %15, %2                                                       ; inst 23
  br i1 %18, label %_8.while.body.1, label %_15.while.exit.1                       ; inst 24
_8.while.body.1:
  %19 = sext i32 %15 to i64                                                        ; inst 25
  %20 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %19                 ; inst 26
  %21 = load i32, i32* %20                                                         ; inst 27
  %22 = icmp eq i32 %21, 2                                                         ; inst 28
  br i1 %22, label %_9.lazy.then.0, label %_10.lazy.else.0                         ; inst 29
_9.lazy.then.0:
  %23 = sext i32 %15 to i64                                                        ; inst 30
  %24 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %23                 ; inst 31
  %25 = load i32, i32* %24                                                         ; inst 32
  %26 = icmp eq i32 %25, %4                                                        ; inst 33
  br label %_11.lazy.exit.0                                                        ; inst 34
_10.lazy.else.0:
  br label %_11.lazy.exit.0                                                        ; inst 35
_11.lazy.exit.0:
  %27 = phi i1 [%26, %_9.lazy.then.0], [0, %_10.lazy.else.0]                       ; inst 36
  br i1 %27, label %_12.if.then.1, label %_13.if.else.1                            ; inst 37
_12.if.then.1:
  %28 = add i32 %17, 1                                                             ; inst 38
  br label %_14.if.exit.1                                                          ; inst 39
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 40
_14.if.exit.1:
  %29 = phi i32 [%15, %_12.if.then.1], [%16, %_13.if.else.1]                       ; inst 41
  %30 = phi i32 [%28, %_12.if.then.1], [%17, %_13.if.else.1]                       ; inst 42
  %31 = add i32 %15, 1                                                             ; inst 43
  br label %_7.while.cond.1                                                        ; inst 44
_15.while.exit.1:
  %32 = icmp eq i32 %17, 1                                                         ; inst 45
  br i1 %32, label %_16.if.then.2, label %_17.if.else.2                            ; inst 46
_16.if.then.2:
  br label %_18.if.exit.2                                                          ; inst 47
_17.if.else.2:
  br label %_18.if.exit.2                                                          ; inst 48
_18.if.exit.2:
  %33 = phi i32 [%16, %_16.if.then.2], [-1, %_17.if.else.2]                        ; inst 49
  ret i32 %33                                                                      ; inst 50
}

define void @simulate_log_replication(i32 %0, [100 x [50 x i32]]* %1, [100 x i32]* %2, [100 x i32]* %3, [100 x [100 x i32]]* %4, [100 x [100 x i32]]* %5, [1000 x [10 x i32]]* %6, i32* %7, [100 x i1]* %8, i32 %9, i32 %10) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %11 = phi i32 [0, %_0.entry.0], [%41, %_14.if.exit.0]                            ; inst 2
  %12 = icmp slt i32 %11, %9                                                       ; inst 3
  br i1 %12, label %_2.while.body.0, label %_15.while.exit.0                       ; inst 4
_2.while.body.0:
  %13 = icmp ne i32 %11, %0                                                        ; inst 5
  br i1 %13, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 6
_3.lazy.then.0:
  %14 = sext i32 %11 to i64                                                        ; inst 7
  %15 = getelementptr [100 x i1], [100 x i1]* %8, i32 0, i64 %14                   ; inst 8
  %16 = load i1, i1* %15                                                           ; inst 9
  %17 = icmp eq i1 %16, 0                                                          ; inst 10
  br label %_5.lazy.exit.0                                                         ; inst 11
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 12
_5.lazy.exit.0:
  %18 = phi i1 [%17, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 13
  br i1 %18, label %_6.if.then.0, label %_13.if.else.0                             ; inst 14
_6.if.then.0:
  %19 = sext i32 %0 to i64                                                         ; inst 15
  %20 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %4, i32 0, i64 %19 ; inst 16
  %21 = sext i32 %11 to i64                                                        ; inst 17
  %22 = getelementptr [100 x i32], [100 x i32]* %20, i32 0, i64 %21                ; inst 18
  %23 = load i32, i32* %22                                                         ; inst 19
  %24 = sext i32 %0 to i64                                                         ; inst 20
  %25 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %24                 ; inst 21
  %26 = load i32, i32* %25                                                         ; inst 22
  %27 = icmp slt i32 %23, %26                                                      ; inst 23
  br i1 %27, label %_7.if.then.1, label %_11.if.else.1                             ; inst 24
_7.if.then.1:
  %28 = sub i32 %23, 1                                                             ; inst 25
  %29 = icmp sge i32 %28, 0                                                        ; inst 26
  br i1 %29, label %_8.if.then.2, label %_9.if.else.2                              ; inst 27
_8.if.then.2:
  %30 = sext i32 %0 to i64                                                         ; inst 28
  %31 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %1, i32 0, i64 %30   ; inst 29
  %32 = sext i32 %28 to i64                                                        ; inst 30
  %33 = getelementptr [50 x i32], [50 x i32]* %31, i32 0, i64 %32                  ; inst 31
  %34 = load i32, i32* %33                                                         ; inst 32
  br label %_10.if.exit.2                                                          ; inst 33
_9.if.else.2:
  br label %_10.if.exit.2                                                          ; inst 34
_10.if.exit.2:
  %35 = phi i32 [%34, %_8.if.then.2], [0, %_9.if.else.2]                           ; inst 35
  %36 = sext i32 %0 to i64                                                         ; inst 36
  %37 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %1, i32 0, i64 %36   ; inst 37
  %38 = sext i32 %23 to i64                                                        ; inst 38
  %39 = getelementptr [50 x i32], [50 x i32]* %37, i32 0, i64 %38                  ; inst 39
  %40 = load i32, i32* %39                                                         ; inst 40
  call void @enqueue_message([1000 x [10 x i32]]* %6, i32* %7, i32 %0, i32 %11, i32 4, i32 0, i32 %28, i32 %35, i32 %40) ; inst 41
  br label %_12.if.exit.1                                                          ; inst 42
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 43
_12.if.exit.1:
  br label %_14.if.exit.0                                                          ; inst 44
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 45
_14.if.exit.0:
  %41 = add i32 %11, 1                                                             ; inst 46
  br label %_1.while.cond.0                                                        ; inst 47
_15.while.exit.0:
  %42 = sext i32 %0 to i64                                                         ; inst 48
  %43 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %42                 ; inst 49
  %44 = load i32, i32* %43                                                         ; inst 50
  %45 = sext i32 %0 to i64                                                         ; inst 51
  %46 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %45                 ; inst 52
  %47 = load i32, i32* %46                                                         ; inst 53
  %48 = add i32 %47, 1                                                             ; inst 54
  br label %_16.while.cond.1                                                       ; inst 55
_16.while.cond.1:
  %49 = phi i32 [%44, %_15.while.exit.0], [%71, %_29.if.exit.4]                    ; inst 56
  %50 = phi i32 [%48, %_15.while.exit.0], [%72, %_29.if.exit.4]                    ; inst 57
  %51 = sext i32 %0 to i64                                                         ; inst 58
  %52 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %51                 ; inst 59
  %53 = load i32, i32* %52                                                         ; inst 60
  %54 = icmp slt i32 %50, %53                                                      ; inst 61
  br i1 %54, label %_17.while.body.1, label %_30.while.exit.1                      ; inst 62
_17.while.body.1:
  br label %_18.while.cond.2                                                       ; inst 63
_18.while.cond.2:
  %55 = phi i32 [1, %_17.while.body.1], [%67, %_25.if.exit.3]                      ; inst 64
  %56 = phi i32 [0, %_17.while.body.1], [%68, %_25.if.exit.3]                      ; inst 65
  %57 = icmp slt i32 %56, %9                                                       ; inst 66
  br i1 %57, label %_19.while.body.2, label %_26.while.exit.2                      ; inst 67
_19.while.body.2:
  %58 = icmp ne i32 %56, %0                                                        ; inst 68
  br i1 %58, label %_20.lazy.then.1, label %_21.lazy.else.1                        ; inst 69
_20.lazy.then.1:
  %59 = sext i32 %0 to i64                                                         ; inst 70
  %60 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %5, i32 0, i64 %59 ; inst 71
  %61 = sext i32 %56 to i64                                                        ; inst 72
  %62 = getelementptr [100 x i32], [100 x i32]* %60, i32 0, i64 %61                ; inst 73
  %63 = load i32, i32* %62                                                         ; inst 74
  %64 = icmp sge i32 %63, %50                                                      ; inst 75
  br label %_22.lazy.exit.1                                                        ; inst 76
_21.lazy.else.1:
  br label %_22.lazy.exit.1                                                        ; inst 77
_22.lazy.exit.1:
  %65 = phi i1 [%64, %_20.lazy.then.1], [0, %_21.lazy.else.1]                      ; inst 78
  br i1 %65, label %_23.if.then.3, label %_24.if.else.3                            ; inst 79
_23.if.then.3:
  %66 = add i32 %55, 1                                                             ; inst 80
  br label %_25.if.exit.3                                                          ; inst 81
_24.if.else.3:
  br label %_25.if.exit.3                                                          ; inst 82
_25.if.exit.3:
  %67 = phi i32 [%66, %_23.if.then.3], [%55, %_24.if.else.3]                       ; inst 83
  %68 = add i32 %56, 1                                                             ; inst 84
  br label %_18.while.cond.2                                                       ; inst 85
_26.while.exit.2:
  %69 = sdiv i32 %9, 2                                                             ; inst 86
  %70 = icmp sgt i32 %55, %69                                                      ; inst 87
  br i1 %70, label %_27.if.then.4, label %_28.if.else.4                            ; inst 88
_27.if.then.4:
  br label %_29.if.exit.4                                                          ; inst 89
_28.if.else.4:
  br label %_29.if.exit.4                                                          ; inst 90
_29.if.exit.4:
  %71 = phi i32 [%50, %_27.if.then.4], [%49, %_28.if.else.4]                       ; inst 91
  %72 = add i32 %50, 1                                                             ; inst 92
  br label %_16.while.cond.1                                                       ; inst 93
_30.while.exit.1:
  %73 = sext i32 %0 to i64                                                         ; inst 94
  %74 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %73                 ; inst 95
  store i32 %49, i32* %74                                                          ; inst 96
  ret void                                                                         ; inst 97
}

define void @append_log_entry(i32 %0, i32 %1, [100 x [50 x i32]]* %2, [100 x i32]* %3) {
_0.entry.0:
  %4 = sext i32 %0 to i64                                                          ; inst 1
  %5 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %4                   ; inst 2
  %6 = load i32, i32* %5                                                           ; inst 3
  %7 = icmp slt i32 %6, 50                                                         ; inst 4
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 5
_1.if.then.0:
  %8 = sext i32 %0 to i64                                                          ; inst 6
  %9 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %2, i32 0, i64 %8     ; inst 7
  %10 = sext i32 %0 to i64                                                         ; inst 8
  %11 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %10                 ; inst 9
  %12 = load i32, i32* %11                                                         ; inst 10
  %13 = sext i32 %12 to i64                                                        ; inst 11
  %14 = getelementptr [50 x i32], [50 x i32]* %9, i32 0, i64 %13                   ; inst 12
  store i32 %1, i32* %14                                                           ; inst 13
  %15 = sext i32 %0 to i64                                                         ; inst 14
  %16 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %15                 ; inst 15
  %17 = sext i32 %0 to i64                                                         ; inst 16
  %18 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %17                 ; inst 17
  %19 = load i32, i32* %18                                                         ; inst 18
  %20 = add i32 %19, 1                                                             ; inst 19
  store i32 %20, i32* %16                                                          ; inst 20
  br label %_3.if.exit.0                                                           ; inst 21
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 22
_3.if.exit.0:
  ret void                                                                         ; inst 23
}

define i32 @verify_system_consistency([100 x i32]* %0, [100 x i32]* %1, [100 x [50 x i32]]* %2, [100 x i32]* %3, [100 x i32]* %4, i32 %5) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%17, %_5.if.exit.0]                              ; inst 2
  %7 = phi i32 [-1, %_0.entry.0], [%16, %_5.if.exit.0]                             ; inst 3
  %8 = icmp slt i32 %6, %5                                                         ; inst 4
  br i1 %8, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 5
_2.while.body.0:
  %9 = sext i32 %6 to i64                                                          ; inst 6
  %10 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %9                  ; inst 7
  %11 = load i32, i32* %10                                                         ; inst 8
  %12 = icmp sgt i32 %11, %7                                                       ; inst 9
  br i1 %12, label %_3.if.then.0, label %_4.if.else.0                              ; inst 10
_3.if.then.0:
  %13 = sext i32 %6 to i64                                                         ; inst 11
  %14 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %13                 ; inst 12
  %15 = load i32, i32* %14                                                         ; inst 13
  br label %_5.if.exit.0                                                           ; inst 14
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 15
_5.if.exit.0:
  %16 = phi i32 [%15, %_3.if.then.0], [%7, %_4.if.else.0]                          ; inst 16
  %17 = add i32 %6, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 19
_7.while.cond.1:
  %18 = phi i32 [0, %_6.while.exit.0], [%32, %_14.if.exit.1]                       ; inst 20
  %19 = phi i32 [0, %_6.while.exit.0], [%31, %_14.if.exit.1]                       ; inst 21
  %20 = icmp slt i32 %18, %5                                                       ; inst 22
  br i1 %20, label %_8.while.body.1, label %_15.while.exit.1                       ; inst 23
_8.while.body.1:
  %21 = sext i32 %18 to i64                                                        ; inst 24
  %22 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %21                 ; inst 25
  %23 = load i32, i32* %22                                                         ; inst 26
  %24 = icmp eq i32 %23, 2                                                         ; inst 27
  br i1 %24, label %_9.lazy.then.0, label %_10.lazy.else.0                         ; inst 28
_9.lazy.then.0:
  %25 = sext i32 %18 to i64                                                        ; inst 29
  %26 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %25                 ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = icmp eq i32 %27, %7                                                        ; inst 32
  br label %_11.lazy.exit.0                                                        ; inst 33
_10.lazy.else.0:
  br label %_11.lazy.exit.0                                                        ; inst 34
_11.lazy.exit.0:
  %29 = phi i1 [%28, %_9.lazy.then.0], [0, %_10.lazy.else.0]                       ; inst 35
  br i1 %29, label %_12.if.then.1, label %_13.if.else.1                            ; inst 36
_12.if.then.1:
  %30 = add i32 %19, 1                                                             ; inst 37
  br label %_14.if.exit.1                                                          ; inst 38
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 39
_14.if.exit.1:
  %31 = phi i32 [%30, %_12.if.then.1], [%19, %_13.if.else.1]                       ; inst 40
  %32 = add i32 %18, 1                                                             ; inst 41
  br label %_7.while.cond.1                                                        ; inst 42
_15.while.exit.1:
  %33 = icmp sgt i32 %19, 1                                                        ; inst 43
  br i1 %33, label %_16.if.then.2, label %_17.if.else.2                            ; inst 44
_16.if.then.2:
  br label %_21.if.exit.2                                                          ; inst 45
_17.if.else.2:
  %34 = icmp eq i32 %19, 0                                                         ; inst 46
  br i1 %34, label %_18.if.then.3, label %_19.if.else.3                            ; inst 47
_18.if.then.3:
  br label %_20.if.exit.3                                                          ; inst 48
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 49
_20.if.exit.3:
  %35 = phi i32 [80, %_18.if.then.3], [100, %_19.if.else.3]                        ; inst 50
  br label %_21.if.exit.2                                                          ; inst 51
_21.if.exit.2:
  %36 = phi i32 [70, %_16.if.then.2], [%35, %_20.if.exit.3]                        ; inst 52
  br label %_22.while.cond.2                                                       ; inst 53
_22.while.cond.2:
  %37 = phi i32 [0, %_21.if.exit.2], [%42, %_38.while.exit.3]                      ; inst 54
  %38 = phi i32 [0, %_21.if.exit.2], [%78, %_38.while.exit.3]                      ; inst 55
  %39 = icmp slt i32 %38, %5                                                       ; inst 56
  br i1 %39, label %_23.while.body.2, label %_39.while.exit.2                      ; inst 57
_23.while.body.2:
  %40 = add i32 %38, 1                                                             ; inst 58
  br label %_24.while.cond.3                                                       ; inst 59
_24.while.cond.3:
  %41 = phi i32 [%40, %_23.while.body.2], [%77, %_37.while.exit.4]                 ; inst 60
  %42 = phi i32 [%37, %_23.while.body.2], [%59, %_37.while.exit.4]                 ; inst 61
  %43 = icmp slt i32 %41, %5                                                       ; inst 62
  br i1 %43, label %_25.while.body.3, label %_38.while.exit.3                      ; inst 63
_25.while.body.3:
  %44 = sext i32 %38 to i64                                                        ; inst 64
  %45 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %44                 ; inst 65
  %46 = load i32, i32* %45                                                         ; inst 66
  %47 = sext i32 %41 to i64                                                        ; inst 67
  %48 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %47                 ; inst 68
  %49 = load i32, i32* %48                                                         ; inst 69
  %50 = icmp slt i32 %46, %49                                                      ; inst 70
  br i1 %50, label %_26.if.then.4, label %_27.if.else.4                            ; inst 71
_26.if.then.4:
  %51 = sext i32 %38 to i64                                                        ; inst 72
  %52 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %51                 ; inst 73
  %53 = load i32, i32* %52                                                         ; inst 74
  br label %_28.if.exit.4                                                          ; inst 75
_27.if.else.4:
  %54 = sext i32 %41 to i64                                                        ; inst 76
  %55 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %54                 ; inst 77
  %56 = load i32, i32* %55                                                         ; inst 78
  br label %_28.if.exit.4                                                          ; inst 79
_28.if.exit.4:
  %57 = phi i32 [%53, %_26.if.then.4], [%56, %_27.if.else.4]                       ; inst 80
  br label %_29.while.cond.4                                                       ; inst 81
_29.while.cond.4:
  %58 = phi i32 [0, %_28.if.exit.4], [%76, %_36.if.exit.5]                         ; inst 82
  %59 = phi i32 [%42, %_28.if.exit.4], [%75, %_36.if.exit.5]                       ; inst 83
  %60 = icmp sle i32 %58, %57                                                      ; inst 84
  br i1 %60, label %_30.lazy.then.1, label %_31.lazy.else.1                        ; inst 85
_30.lazy.then.1:
  %61 = icmp slt i32 %58, 50                                                       ; inst 86
  br label %_32.lazy.exit.1                                                        ; inst 87
_31.lazy.else.1:
  br label %_32.lazy.exit.1                                                        ; inst 88
_32.lazy.exit.1:
  %62 = phi i1 [%61, %_30.lazy.then.1], [0, %_31.lazy.else.1]                      ; inst 89
  br i1 %62, label %_33.while.body.4, label %_37.while.exit.4                      ; inst 90
_33.while.body.4:
  %63 = sext i32 %38 to i64                                                        ; inst 91
  %64 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %2, i32 0, i64 %63   ; inst 92
  %65 = sext i32 %58 to i64                                                        ; inst 93
  %66 = getelementptr [50 x i32], [50 x i32]* %64, i32 0, i64 %65                  ; inst 94
  %67 = load i32, i32* %66                                                         ; inst 95
  %68 = sext i32 %41 to i64                                                        ; inst 96
  %69 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %2, i32 0, i64 %68   ; inst 97
  %70 = sext i32 %58 to i64                                                        ; inst 98
  %71 = getelementptr [50 x i32], [50 x i32]* %69, i32 0, i64 %70                  ; inst 99
  %72 = load i32, i32* %71                                                         ; inst 100
  %73 = icmp ne i32 %67, %72                                                       ; inst 101
  br i1 %73, label %_34.if.then.5, label %_35.if.else.5                            ; inst 102
_34.if.then.5:
  %74 = add i32 %59, 1                                                             ; inst 103
  br label %_36.if.exit.5                                                          ; inst 104
_35.if.else.5:
  br label %_36.if.exit.5                                                          ; inst 105
_36.if.exit.5:
  %75 = phi i32 [%74, %_34.if.then.5], [%59, %_35.if.else.5]                       ; inst 106
  %76 = add i32 %58, 1                                                             ; inst 107
  br label %_29.while.cond.4                                                       ; inst 108
_37.while.exit.4:
  %77 = add i32 %41, 1                                                             ; inst 109
  br label %_24.while.cond.3                                                       ; inst 110
_38.while.exit.3:
  %78 = add i32 %38, 1                                                             ; inst 111
  br label %_22.while.cond.2                                                       ; inst 112
_39.while.exit.2:
  %79 = mul i32 %37, 2                                                             ; inst 113
  %80 = sub i32 %36, %79                                                           ; inst 114
  %81 = icmp slt i32 %80, 0                                                        ; inst 115
  br i1 %81, label %_40.if.then.6, label %_41.if.else.6                            ; inst 116
_40.if.then.6:
  br label %_42.if.exit.6                                                          ; inst 117
_41.if.else.6:
  br label %_42.if.exit.6                                                          ; inst 118
_42.if.exit.6:
  %82 = phi i32 [0, %_40.if.then.6], [%80, %_41.if.else.6]                         ; inst 119
  ret i32 %82                                                                      ; inst 120
}

define void @trigger_recovery_protocol([100 x i32]* %0, [100 x i32]* %1, [100 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %5 = icmp slt i32 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %6 = sext i32 %4 to i64                                                          ; inst 5
  %7 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %6                   ; inst 6
  store i32 0, i32* %7                                                             ; inst 7
  %8 = sext i32 %4 to i64                                                          ; inst 8
  %9 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %8                   ; inst 9
  store i32 -1, i32* %9                                                            ; inst 10
  %10 = add i32 %4, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  ret void                                                                         ; inst 13
}

define void @simulate_byzantine_failures([100 x i32]* %0, [100 x i1]* %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%15, %_5.if.exit.0]                              ; inst 2
  %5 = icmp slt i32 %4, %2                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %6 = mul i32 %4, 19                                                              ; inst 5
  %7 = mul i32 %3, 5                                                               ; inst 6
  %8 = add i32 %6, %7                                                              ; inst 7
  %9 = srem i32 %8, 97                                                             ; inst 8
  %10 = icmp eq i32 %9, 0                                                          ; inst 9
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 10
_3.if.then.0:
  %11 = sext i32 %4 to i64                                                         ; inst 11
  %12 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %11                 ; inst 12
  store i32 3, i32* %12                                                            ; inst 13
  %13 = sext i32 %4 to i64                                                         ; inst 14
  %14 = getelementptr [100 x i1], [100 x i1]* %1, i32 0, i64 %13                   ; inst 15
  store i1 1, i1* %14                                                              ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %15 = add i32 %4, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_6.while.exit.0:
  ret void                                                                         ; inst 21
}

define void @compact_logs([100 x [50 x i32]]* %0, [100 x i32]* %1, [100 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%39, %_11.if.exit.0]                             ; inst 2
  %5 = icmp slt i32 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 4
_2.while.body.0:
  %6 = sext i32 %4 to i64                                                          ; inst 5
  %7 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %6                   ; inst 6
  %8 = load i32, i32* %7                                                           ; inst 7
  %9 = sdiv i32 %8, 2                                                              ; inst 8
  %10 = icmp sgt i32 %9, 0                                                         ; inst 9
  br i1 %10, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 10
_3.lazy.then.0:
  %11 = sext i32 %4 to i64                                                         ; inst 11
  %12 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %11                 ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = icmp slt i32 %9, %13                                                       ; inst 14
  br label %_5.lazy.exit.0                                                         ; inst 15
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 16
_5.lazy.exit.0:
  %15 = phi i1 [%14, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 17
  br i1 %15, label %_6.if.then.0, label %_10.if.else.0                             ; inst 18
_6.if.then.0:
  br label %_7.while.cond.1                                                        ; inst 19
_7.while.cond.1:
  %16 = phi i32 [0, %_6.if.then.0], [%32, %_8.while.body.1]                        ; inst 20
  %17 = add i32 %16, %9                                                            ; inst 21
  %18 = sext i32 %4 to i64                                                         ; inst 22
  %19 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %18                 ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = icmp slt i32 %17, %20                                                      ; inst 25
  br i1 %21, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 26
_8.while.body.1:
  %22 = sext i32 %4 to i64                                                         ; inst 27
  %23 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %0, i32 0, i64 %22   ; inst 28
  %24 = sext i32 %16 to i64                                                        ; inst 29
  %25 = getelementptr [50 x i32], [50 x i32]* %23, i32 0, i64 %24                  ; inst 30
  %26 = sext i32 %4 to i64                                                         ; inst 31
  %27 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %0, i32 0, i64 %26   ; inst 32
  %28 = add i32 %16, %9                                                            ; inst 33
  %29 = sext i32 %28 to i64                                                        ; inst 34
  %30 = getelementptr [50 x i32], [50 x i32]* %27, i32 0, i64 %29                  ; inst 35
  %31 = load i32, i32* %30                                                         ; inst 36
  store i32 %31, i32* %25                                                          ; inst 37
  %32 = add i32 %16, 1                                                             ; inst 38
  br label %_7.while.cond.1                                                        ; inst 39
_9.while.exit.1:
  %33 = sext i32 %4 to i64                                                         ; inst 40
  %34 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %33                 ; inst 41
  %35 = sext i32 %4 to i64                                                         ; inst 42
  %36 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %35                 ; inst 43
  %37 = load i32, i32* %36                                                         ; inst 44
  %38 = sub i32 %37, %9                                                            ; inst 45
  store i32 %38, i32* %34                                                          ; inst 46
  br label %_11.if.exit.0                                                          ; inst 47
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 48
_11.if.exit.0:
  %39 = add i32 %4, 1                                                              ; inst 49
  br label %_1.while.cond.0                                                        ; inst 50
_12.while.exit.0:
  ret void                                                                         ; inst 51
}

define i32 @find_stable_leader([100 x i32]* %0, [100 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.0]                              ; inst 2
  %4 = phi i32 [-1, %_0.entry.0], [%19, %_8.if.exit.0]                             ; inst 3
  %5 = phi i32 [-1, %_0.entry.0], [%20, %_8.if.exit.0]                             ; inst 4
  %6 = icmp slt i32 %3, %2                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %7 = sext i32 %3 to i64                                                          ; inst 7
  %8 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %7                   ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = icmp eq i32 %9, 2                                                          ; inst 10
  br i1 %10, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 11
_3.lazy.then.0:
  %11 = sext i32 %3 to i64                                                         ; inst 12
  %12 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %11                 ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = icmp sgt i32 %13, %5                                                       ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %15 = phi i1 [%14, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 18
  br i1 %15, label %_6.if.then.0, label %_7.if.else.0                              ; inst 19
_6.if.then.0:
  %16 = sext i32 %3 to i64                                                         ; inst 20
  %17 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %16                 ; inst 21
  %18 = load i32, i32* %17                                                         ; inst 22
  br label %_8.if.exit.0                                                           ; inst 23
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 24
_8.if.exit.0:
  %19 = phi i32 [%3, %_6.if.then.0], [%4, %_7.if.else.0]                           ; inst 25
  %20 = phi i32 [%18, %_6.if.then.0], [%5, %_7.if.else.0]                          ; inst 26
  %21 = add i32 %3, 1                                                              ; inst 27
  br label %_1.while.cond.0                                                        ; inst 28
_9.while.exit.0:
  ret i32 %4                                                                       ; inst 29
}

define i32 @count_total_committed_entries([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 3
  %4 = icmp slt i32 %2, %1                                                         ; inst 4
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 5
_2.while.body.0:
  %5 = sext i32 %2 to i64                                                          ; inst 6
  %6 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %5                   ; inst 7
  %7 = load i32, i32* %6                                                           ; inst 8
  %8 = add i32 %3, %7                                                              ; inst 9
  %9 = add i32 %2, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 12
}

define i32 @calculate_network_efficiency(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sgt i32 %1, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = mul i32 %0, 100                                                             ; inst 3
  %4 = mul i32 %1, 100                                                             ; inst 4
  %5 = sdiv i32 %3, %4                                                             ; inst 5
  br label %_3.if.exit.0                                                           ; inst 6
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %6 = phi i32 [%5, %_1.if.then.0], [0, %_2.if.else.0]                             ; inst 8
  ret i32 %6                                                                       ; inst 9
}

define i32 @compute_system_state_hash([100 x [50 x i32]]* %0, [100 x i32]* %1, [100 x i32]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%36, %_8.while.exit.1]                           ; inst 2
  %5 = phi i32 [17, %_0.entry.0], [%20, %_8.while.exit.1]                          ; inst 3
  %6 = icmp slt i32 %4, %3                                                         ; inst 4
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %7 = mul i32 %5, 31                                                              ; inst 6
  %8 = sext i32 %4 to i64                                                          ; inst 7
  %9 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %8                   ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = add i32 %7, %10                                                            ; inst 10
  %12 = srem i32 %11, 16777219                                                     ; inst 11
  %13 = mul i32 %12, 31                                                            ; inst 12
  %14 = sext i32 %4 to i64                                                         ; inst 13
  %15 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %14                 ; inst 14
  %16 = load i32, i32* %15                                                         ; inst 15
  %17 = add i32 %13, %16                                                           ; inst 16
  %18 = srem i32 %17, 16777219                                                     ; inst 17
  br label %_3.while.cond.1                                                        ; inst 18
_3.while.cond.1:
  %19 = phi i32 [0, %_2.while.body.0], [%35, %_7.while.body.1]                     ; inst 19
  %20 = phi i32 [%18, %_2.while.body.0], [%34, %_7.while.body.1]                   ; inst 20
  %21 = sext i32 %4 to i64                                                         ; inst 21
  %22 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %21                 ; inst 22
  %23 = load i32, i32* %22                                                         ; inst 23
  %24 = icmp slt i32 %19, %23                                                      ; inst 24
  br i1 %24, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 25
_4.lazy.then.0:
  %25 = icmp slt i32 %19, 50                                                       ; inst 26
  br label %_6.lazy.exit.0                                                         ; inst 27
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 28
_6.lazy.exit.0:
  %26 = phi i1 [%25, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 29
  br i1 %26, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 30
_7.while.body.1:
  %27 = mul i32 %20, 31                                                            ; inst 31
  %28 = sext i32 %4 to i64                                                         ; inst 32
  %29 = getelementptr [100 x [50 x i32]], [100 x [50 x i32]]* %0, i32 0, i64 %28   ; inst 33
  %30 = sext i32 %19 to i64                                                        ; inst 34
  %31 = getelementptr [50 x i32], [50 x i32]* %29, i32 0, i64 %30                  ; inst 35
  %32 = load i32, i32* %31                                                         ; inst 36
  %33 = add i32 %27, %32                                                           ; inst 37
  %34 = srem i32 %33, 16777219                                                     ; inst 38
  %35 = add i32 %19, 1                                                             ; inst 39
  br label %_3.while.cond.1                                                        ; inst 40
_8.while.exit.1:
  %36 = add i32 %4, 1                                                              ; inst 41
  br label %_1.while.cond.0                                                        ; inst 42
_9.while.exit.0:
  %37 = icmp slt i32 %5, 0                                                         ; inst 43
  br i1 %37, label %_10.if.then.0, label %_11.if.else.0                            ; inst 44
_10.if.then.0:
  %38 = sub i32 0, %5                                                              ; inst 45
  br label %_12.if.exit.0                                                          ; inst 46
_11.if.else.0:
  br label %_12.if.exit.0                                                          ; inst 47
_12.if.exit.0:
  %39 = phi i32 [%38, %_10.if.then.0], [%5, %_11.if.else.0]                        ; inst 48
  %40 = srem i32 %39, 1000000                                                      ; inst 49
  ret i32 %40                                                                      ; inst 50
}

define void @enqueue_message([1000 x [10 x i32]]* %0, i32* %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8) {
_0.entry.0:
  %9 = load i32, i32* %1                                                           ; inst 1
  %10 = sext i32 %9 to i64                                                         ; inst 2
  %11 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %10 ; inst 3
  %12 = getelementptr [10 x i32], [10 x i32]* %11, i32 0, i64 0                    ; inst 4
  store i32 %2, i32* %12                                                           ; inst 5
  %13 = load i32, i32* %1                                                          ; inst 6
  %14 = sext i32 %13 to i64                                                        ; inst 7
  %15 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %14 ; inst 8
  %16 = getelementptr [10 x i32], [10 x i32]* %15, i32 0, i64 1                    ; inst 9
  store i32 %3, i32* %16                                                           ; inst 10
  %17 = load i32, i32* %1                                                          ; inst 11
  %18 = sext i32 %17 to i64                                                        ; inst 12
  %19 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %18 ; inst 13
  %20 = getelementptr [10 x i32], [10 x i32]* %19, i32 0, i64 2                    ; inst 14
  store i32 %4, i32* %20                                                           ; inst 15
  %21 = load i32, i32* %1                                                          ; inst 16
  %22 = sext i32 %21 to i64                                                        ; inst 17
  %23 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %22 ; inst 18
  %24 = getelementptr [10 x i32], [10 x i32]* %23, i32 0, i64 3                    ; inst 19
  store i32 %5, i32* %24                                                           ; inst 20
  %25 = load i32, i32* %1                                                          ; inst 21
  %26 = sext i32 %25 to i64                                                        ; inst 22
  %27 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %26 ; inst 23
  %28 = getelementptr [10 x i32], [10 x i32]* %27, i32 0, i64 4                    ; inst 24
  store i32 %6, i32* %28                                                           ; inst 25
  %29 = load i32, i32* %1                                                          ; inst 26
  %30 = sext i32 %29 to i64                                                        ; inst 27
  %31 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %30 ; inst 28
  %32 = getelementptr [10 x i32], [10 x i32]* %31, i32 0, i64 5                    ; inst 29
  store i32 %7, i32* %32                                                           ; inst 30
  %33 = load i32, i32* %1                                                          ; inst 31
  %34 = sext i32 %33 to i64                                                        ; inst 32
  %35 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %34 ; inst 33
  %36 = getelementptr [10 x i32], [10 x i32]* %35, i32 0, i64 6                    ; inst 34
  store i32 %8, i32* %36                                                           ; inst 35
  %37 = load i32, i32* %1                                                          ; inst 36
  %38 = sext i32 %37 to i64                                                        ; inst 37
  %39 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %38 ; inst 38
  %40 = getelementptr [10 x i32], [10 x i32]* %39, i32 0, i64 7                    ; inst 39
  store i32 0, i32* %40                                                            ; inst 40
  %41 = load i32, i32* %1                                                          ; inst 41
  %42 = sext i32 %41 to i64                                                        ; inst 42
  %43 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %42 ; inst 43
  %44 = getelementptr [10 x i32], [10 x i32]* %43, i32 0, i64 8                    ; inst 44
  store i32 0, i32* %44                                                            ; inst 45
  %45 = load i32, i32* %1                                                          ; inst 46
  %46 = sext i32 %45 to i64                                                        ; inst 47
  %47 = getelementptr [1000 x [10 x i32]], [1000 x [10 x i32]]* %0, i32 0, i64 %46 ; inst 48
  %48 = getelementptr [10 x i32], [10 x i32]* %47, i32 0, i64 9                    ; inst 49
  store i32 0, i32* %48                                                            ; inst 50
  %49 = load i32, i32* %1                                                          ; inst 51
  %50 = add i32 %49, 1                                                             ; inst 52
  %51 = srem i32 %50, 1000                                                         ; inst 53
  store i32 %51, i32* %1                                                           ; inst 54
  ret void                                                                         ; inst 55
}

