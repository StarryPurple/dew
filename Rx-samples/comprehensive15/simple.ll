; ModuleID = 'comprehensive15.ll'
source_filename = "comprehensive15.ll"

%StringProcessor = type { [5000 x i32], i32, [50 x [200 x i32]], [50 x i32], i32, [5000 x i32], [5000 x i32], [5000 x i32], [200 x i32], [256 x i32], [200 x i32], [50 x i32], [5000 x i32], i32, i32, [500 x [500 x i32]], [256 x i32], [256 x [20 x i32]], [256 x i32], i32, i32, i32, i32, [50 x [100 x i32]], [50 x i32], [10 x i32], i32, i32 }
%RegexMatcher = type { [100 x i32], i32, [100 x [100 x i1]], i32, i1 }

@stdout = external global ptr, align 8
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@getString.buffer = internal global [1024 x i8] zeroinitializer, align 16
@stdin = external global ptr, align 8

define dso_local void @print(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr @stdout, align 8
  %4 = call i32 @fflush(ptr noundef %3)
  %5 = load ptr, ptr %2, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %5)
  ret void
}

declare i32 @fflush(ptr noundef)

declare i32 @printf(ptr noundef, ...)

define dso_local void @println(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr @stdout, align 8
  %4 = call i32 @fflush(ptr noundef %3)
  %5 = load ptr, ptr %2, align 8
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %5)
  ret void
}

define dso_local void @printInt(i32 noundef %0) {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load ptr, ptr @stdout, align 8
  %4 = call i32 @fflush(ptr noundef %3)
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %5)
  ret void
}

define dso_local void @printlnInt(i32 noundef %0) {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load ptr, ptr @stdout, align 8
  %4 = call i32 @fflush(ptr noundef %3)
  %5 = load i32, ptr %2, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %5)
  ret void
}

define dso_local ptr @getString() {
  %1 = alloca ptr, align 8
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  %4 = load ptr, ptr @stdin, align 8
  %5 = call ptr @fgets(ptr noundef @getString.buffer, i32 noundef 1024, ptr noundef %4)
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %29

7:                                                ; preds = %0
  %8 = call i64 @strlen(ptr noundef @getString.buffer)
  store i64 %8, ptr %2, align 8
  %9 = load i64, ptr %2, align 8
  %10 = icmp ugt i64 %9, 0
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load i64, ptr %2, align 8
  %13 = sub i64 %12, 1
  %14 = getelementptr inbounds [1024 x i8], ptr @getString.buffer, i64 0, i64 %13
  %15 = load i8, ptr %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 10
  br i1 %17, label %18, label %22

18:                                               ; preds = %11
  %19 = load i64, ptr %2, align 8
  %20 = sub i64 %19, 1
  %21 = getelementptr inbounds [1024 x i8], ptr @getString.buffer, i64 0, i64 %20
  store i8 0, ptr %21, align 1
  br label %22

22:                                               ; preds = %18, %11, %7
  %23 = load i64, ptr %2, align 8
  %24 = add i64 %23, 1
  %25 = call noalias ptr @malloc(i64 noundef %24)
  store ptr %25, ptr %3, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = call ptr @strcpy(ptr noundef %26, ptr noundef @getString.buffer)
  %28 = load ptr, ptr %3, align 8
  store ptr %28, ptr %1, align 8
  br label %30

29:                                               ; preds = %0
  store ptr null, ptr %1, align 8
  br label %30

30:                                               ; preds = %29, %22
  %31 = load ptr, ptr %1, align 8
  ret ptr %31
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef)

declare i64 @strlen(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare ptr @strcpy(ptr noundef, ptr noundef)

define dso_local i32 @getInt() {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.2, ptr noundef %1)
  %3 = load i32, ptr %1, align 4
  ret i32 %3
}

declare i32 @__isoc99_scanf(ptr noundef, ...)

define dso_local i32 @readInt() {
  %1 = call i32 @getInt()
  ret i32 %1
}

define dso_local void @exit(i32 noundef %0) {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load ptr, ptr @stdout, align 8
  %4 = call i32 @fflush(ptr noundef %3)
  %5 = load i32, ptr %2, align 4
  call void @_Exit(i32 noundef %5)
  unreachable
}

declare void @_Exit(i32 noundef)

define dso_local ptr @from(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = call i64 @strlen(ptr noundef %5)
  store i64 %6, ptr %3, align 8
  %7 = load i64, ptr %3, align 8
  %8 = add i64 %7, 1
  %9 = call noalias ptr @malloc(i64 noundef %8)
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = call ptr @strcpy(ptr noundef %10, ptr noundef %11)
  %13 = load ptr, ptr %4, align 8
  ret ptr %13
}

define void @_14su0eKxQra_new(ptr sret(%StringProcessor) %0) {
entry:
  %1 = getelementptr %StringProcessor, ptr %0, i32 0, i32 0
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = alloca i32, align 4
  store i32 5000, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr [5000 x i32], ptr %1, i32 0, i32 0
  %7 = alloca i32, align 4
  store i32 0, ptr %7, align 4
  br label %new.arr.cond.0

new.arr.cond.0:                                   ; preds = %new.arr.body.0, %entry
  %8 = load i32, ptr %7, align 4
  %9 = icmp slt i32 %8, 5000
  br i1 %9, label %new.arr.body.0, label %new.arr.exit.0

new.arr.body.0:                                   ; preds = %new.arr.cond.0
  %10 = getelementptr i32, ptr %6, i32 %8
  %11 = alloca i32, align 4
  store i32 0, ptr %11, align 4
  %12 = load i32, ptr %11, align 4
  store i32 %3, ptr %10, align 4
  %13 = add i32 %8, 1
  store i32 %13, ptr %7, align 4
  br label %new.arr.cond.0

new.arr.exit.0:                                   ; preds = %new.arr.cond.0
  %14 = getelementptr %StringProcessor, ptr %0, i32 0, i32 1
  %15 = alloca i32, align 4
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %14, align 4
  %17 = getelementptr %StringProcessor, ptr %0, i32 0, i32 2
  %18 = alloca [200 x i32], align 4
  %19 = alloca i32, align 4
  store i32 0, ptr %19, align 4
  %20 = load i32, ptr %19, align 4
  %21 = alloca i32, align 4
  store i32 200, ptr %21, align 4
  %22 = load i32, ptr %21, align 4
  %23 = alloca [200 x i32], align 4
  %24 = getelementptr [200 x i32], ptr %23, i32 0, i32 0
  %25 = alloca i32, align 4
  store i32 0, ptr %25, align 4
  br label %new.arr.cond.1

new.arr.cond.1:                                   ; preds = %new.arr.body.1, %new.arr.exit.0
  %26 = load i32, ptr %25, align 4
  %27 = icmp slt i32 %26, 200
  br i1 %27, label %new.arr.body.1, label %new.arr.exit.1

new.arr.body.1:                                   ; preds = %new.arr.cond.1
  %28 = getelementptr i32, ptr %24, i32 %26
  %29 = alloca i32, align 4
  store i32 0, ptr %29, align 4
  %30 = load i32, ptr %29, align 4
  store i32 %20, ptr %28, align 4
  %31 = add i32 %26, 1
  store i32 %31, ptr %25, align 4
  br label %new.arr.cond.1

new.arr.exit.1:                                   ; preds = %new.arr.cond.1
  %32 = load [200 x i32], ptr %23, align 4
  %33 = alloca i32, align 4
  store i32 50, ptr %33, align 4
  %34 = load i32, ptr %33, align 4
  %35 = getelementptr [50 x [200 x i32]], ptr %17, i32 0, i32 0
  %36 = alloca i32, align 4
  store i32 0, ptr %36, align 4
  br label %new.arr.cond.2

new.arr.cond.2:                                   ; preds = %new.arr.exit.3, %new.arr.exit.1
  %37 = load i32, ptr %36, align 4
  %38 = icmp slt i32 %37, 50
  br i1 %38, label %new.arr.body.2, label %new.arr.exit.2

new.arr.body.2:                                   ; preds = %new.arr.cond.2
  %39 = getelementptr [200 x i32], ptr %35, i32 %37
  %40 = alloca i32, align 4
  store i32 0, ptr %40, align 4
  %41 = load i32, ptr %40, align 4
  %42 = alloca i32, align 4
  store i32 200, ptr %42, align 4
  %43 = load i32, ptr %42, align 4
  %44 = getelementptr [200 x i32], ptr %39, i32 0, i32 0
  %45 = alloca i32, align 4
  store i32 0, ptr %45, align 4
  br label %new.arr.cond.3

new.arr.cond.3:                                   ; preds = %new.arr.body.3, %new.arr.body.2
  %46 = load i32, ptr %45, align 4
  %47 = icmp slt i32 %46, 200
  br i1 %47, label %new.arr.body.3, label %new.arr.exit.3

new.arr.body.3:                                   ; preds = %new.arr.cond.3
  %48 = getelementptr i32, ptr %44, i32 %46
  %49 = alloca i32, align 4
  store i32 0, ptr %49, align 4
  %50 = load i32, ptr %49, align 4
  store i32 %20, ptr %48, align 4
  %51 = add i32 %46, 1
  store i32 %51, ptr %45, align 4
  br label %new.arr.cond.3

new.arr.exit.3:                                   ; preds = %new.arr.cond.3
  %52 = add i32 %37, 1
  store i32 %52, ptr %36, align 4
  br label %new.arr.cond.2

new.arr.exit.2:                                   ; preds = %new.arr.cond.2
  %53 = getelementptr %StringProcessor, ptr %0, i32 0, i32 3
  %54 = alloca i32, align 4
  store i32 0, ptr %54, align 4
  %55 = load i32, ptr %54, align 4
  %56 = alloca i32, align 4
  store i32 50, ptr %56, align 4
  %57 = load i32, ptr %56, align 4
  %58 = getelementptr [50 x i32], ptr %53, i32 0, i32 0
  %59 = alloca i32, align 4
  store i32 0, ptr %59, align 4
  br label %new.arr.cond.4

new.arr.cond.4:                                   ; preds = %new.arr.body.4, %new.arr.exit.2
  %60 = load i32, ptr %59, align 4
  %61 = icmp slt i32 %60, 50
  br i1 %61, label %new.arr.body.4, label %new.arr.exit.4

new.arr.body.4:                                   ; preds = %new.arr.cond.4
  %62 = getelementptr i32, ptr %58, i32 %60
  %63 = alloca i32, align 4
  store i32 0, ptr %63, align 4
  %64 = load i32, ptr %63, align 4
  store i32 %55, ptr %62, align 4
  %65 = add i32 %60, 1
  store i32 %65, ptr %59, align 4
  br label %new.arr.cond.4

new.arr.exit.4:                                   ; preds = %new.arr.cond.4
  %66 = getelementptr %StringProcessor, ptr %0, i32 0, i32 4
  %67 = alloca i32, align 4
  store i32 0, ptr %67, align 4
  %68 = load i32, ptr %67, align 4
  store i32 %68, ptr %66, align 4
  %69 = getelementptr %StringProcessor, ptr %0, i32 0, i32 5
  %70 = alloca i32, align 4
  store i32 0, ptr %70, align 4
  %71 = load i32, ptr %70, align 4
  %72 = alloca i32, align 4
  store i32 5000, ptr %72, align 4
  %73 = load i32, ptr %72, align 4
  %74 = getelementptr [5000 x i32], ptr %69, i32 0, i32 0
  %75 = alloca i32, align 4
  store i32 0, ptr %75, align 4
  br label %new.arr.cond.5

new.arr.cond.5:                                   ; preds = %new.arr.body.5, %new.arr.exit.4
  %76 = load i32, ptr %75, align 4
  %77 = icmp slt i32 %76, 5000
  br i1 %77, label %new.arr.body.5, label %new.arr.exit.5

new.arr.body.5:                                   ; preds = %new.arr.cond.5
  %78 = getelementptr i32, ptr %74, i32 %76
  %79 = alloca i32, align 4
  store i32 0, ptr %79, align 4
  %80 = load i32, ptr %79, align 4
  store i32 %71, ptr %78, align 4
  %81 = add i32 %76, 1
  store i32 %81, ptr %75, align 4
  br label %new.arr.cond.5

new.arr.exit.5:                                   ; preds = %new.arr.cond.5
  %82 = getelementptr %StringProcessor, ptr %0, i32 0, i32 6
  %83 = alloca i32, align 4
  store i32 0, ptr %83, align 4
  %84 = load i32, ptr %83, align 4
  %85 = alloca i32, align 4
  store i32 5000, ptr %85, align 4
  %86 = load i32, ptr %85, align 4
  %87 = getelementptr [5000 x i32], ptr %82, i32 0, i32 0
  %88 = alloca i32, align 4
  store i32 0, ptr %88, align 4
  br label %new.arr.cond.6

new.arr.cond.6:                                   ; preds = %new.arr.body.6, %new.arr.exit.5
  %89 = load i32, ptr %88, align 4
  %90 = icmp slt i32 %89, 5000
  br i1 %90, label %new.arr.body.6, label %new.arr.exit.6

new.arr.body.6:                                   ; preds = %new.arr.cond.6
  %91 = getelementptr i32, ptr %87, i32 %89
  %92 = alloca i32, align 4
  store i32 0, ptr %92, align 4
  %93 = load i32, ptr %92, align 4
  store i32 %84, ptr %91, align 4
  %94 = add i32 %89, 1
  store i32 %94, ptr %88, align 4
  br label %new.arr.cond.6

new.arr.exit.6:                                   ; preds = %new.arr.cond.6
  %95 = getelementptr %StringProcessor, ptr %0, i32 0, i32 7
  %96 = alloca i32, align 4
  store i32 0, ptr %96, align 4
  %97 = load i32, ptr %96, align 4
  %98 = alloca i32, align 4
  store i32 5000, ptr %98, align 4
  %99 = load i32, ptr %98, align 4
  %100 = getelementptr [5000 x i32], ptr %95, i32 0, i32 0
  %101 = alloca i32, align 4
  store i32 0, ptr %101, align 4
  br label %new.arr.cond.7

new.arr.cond.7:                                   ; preds = %new.arr.body.7, %new.arr.exit.6
  %102 = load i32, ptr %101, align 4
  %103 = icmp slt i32 %102, 5000
  br i1 %103, label %new.arr.body.7, label %new.arr.exit.7

new.arr.body.7:                                   ; preds = %new.arr.cond.7
  %104 = getelementptr i32, ptr %100, i32 %102
  %105 = alloca i32, align 4
  store i32 0, ptr %105, align 4
  %106 = load i32, ptr %105, align 4
  store i32 %97, ptr %104, align 4
  %107 = add i32 %102, 1
  store i32 %107, ptr %101, align 4
  br label %new.arr.cond.7

new.arr.exit.7:                                   ; preds = %new.arr.cond.7
  %108 = getelementptr %StringProcessor, ptr %0, i32 0, i32 8
  %109 = alloca i32, align 4
  store i32 0, ptr %109, align 4
  %110 = load i32, ptr %109, align 4
  %111 = alloca i32, align 4
  store i32 200, ptr %111, align 4
  %112 = load i32, ptr %111, align 4
  %113 = getelementptr [200 x i32], ptr %108, i32 0, i32 0
  %114 = alloca i32, align 4
  store i32 0, ptr %114, align 4
  br label %new.arr.cond.8

new.arr.cond.8:                                   ; preds = %new.arr.body.8, %new.arr.exit.7
  %115 = load i32, ptr %114, align 4
  %116 = icmp slt i32 %115, 200
  br i1 %116, label %new.arr.body.8, label %new.arr.exit.8

new.arr.body.8:                                   ; preds = %new.arr.cond.8
  %117 = getelementptr i32, ptr %113, i32 %115
  %118 = alloca i32, align 4
  store i32 0, ptr %118, align 4
  %119 = load i32, ptr %118, align 4
  store i32 %110, ptr %117, align 4
  %120 = add i32 %115, 1
  store i32 %120, ptr %114, align 4
  br label %new.arr.cond.8

new.arr.exit.8:                                   ; preds = %new.arr.cond.8
  %121 = getelementptr %StringProcessor, ptr %0, i32 0, i32 9
  %122 = alloca i32, align 4
  store i32 0, ptr %122, align 4
  %123 = load i32, ptr %122, align 4
  %124 = alloca i32, align 4
  store i32 256, ptr %124, align 4
  %125 = load i32, ptr %124, align 4
  %126 = getelementptr [256 x i32], ptr %121, i32 0, i32 0
  %127 = alloca i32, align 4
  store i32 0, ptr %127, align 4
  br label %new.arr.cond.9

new.arr.cond.9:                                   ; preds = %new.arr.body.9, %new.arr.exit.8
  %128 = load i32, ptr %127, align 4
  %129 = icmp slt i32 %128, 256
  br i1 %129, label %new.arr.body.9, label %new.arr.exit.9

new.arr.body.9:                                   ; preds = %new.arr.cond.9
  %130 = getelementptr i32, ptr %126, i32 %128
  %131 = alloca i32, align 4
  store i32 0, ptr %131, align 4
  %132 = load i32, ptr %131, align 4
  store i32 %123, ptr %130, align 4
  %133 = add i32 %128, 1
  store i32 %133, ptr %127, align 4
  br label %new.arr.cond.9

new.arr.exit.9:                                   ; preds = %new.arr.cond.9
  %134 = getelementptr %StringProcessor, ptr %0, i32 0, i32 10
  %135 = alloca i32, align 4
  store i32 0, ptr %135, align 4
  %136 = load i32, ptr %135, align 4
  %137 = alloca i32, align 4
  store i32 200, ptr %137, align 4
  %138 = load i32, ptr %137, align 4
  %139 = getelementptr [200 x i32], ptr %134, i32 0, i32 0
  %140 = alloca i32, align 4
  store i32 0, ptr %140, align 4
  br label %new.arr.cond.10

new.arr.cond.10:                                  ; preds = %new.arr.body.10, %new.arr.exit.9
  %141 = load i32, ptr %140, align 4
  %142 = icmp slt i32 %141, 200
  br i1 %142, label %new.arr.body.10, label %new.arr.exit.10

new.arr.body.10:                                  ; preds = %new.arr.cond.10
  %143 = getelementptr i32, ptr %139, i32 %141
  %144 = alloca i32, align 4
  store i32 0, ptr %144, align 4
  %145 = load i32, ptr %144, align 4
  store i32 %136, ptr %143, align 4
  %146 = add i32 %141, 1
  store i32 %146, ptr %140, align 4
  br label %new.arr.cond.10

new.arr.exit.10:                                  ; preds = %new.arr.cond.10
  %147 = getelementptr %StringProcessor, ptr %0, i32 0, i32 11
  %148 = alloca i32, align 4
  store i32 0, ptr %148, align 4
  %149 = load i32, ptr %148, align 4
  %150 = alloca i32, align 4
  store i32 50, ptr %150, align 4
  %151 = load i32, ptr %150, align 4
  %152 = getelementptr [50 x i32], ptr %147, i32 0, i32 0
  %153 = alloca i32, align 4
  store i32 0, ptr %153, align 4
  br label %new.arr.cond.11

new.arr.cond.11:                                  ; preds = %new.arr.body.11, %new.arr.exit.10
  %154 = load i32, ptr %153, align 4
  %155 = icmp slt i32 %154, 50
  br i1 %155, label %new.arr.body.11, label %new.arr.exit.11

new.arr.body.11:                                  ; preds = %new.arr.cond.11
  %156 = getelementptr i32, ptr %152, i32 %154
  %157 = alloca i32, align 4
  store i32 0, ptr %157, align 4
  %158 = load i32, ptr %157, align 4
  store i32 %149, ptr %156, align 4
  %159 = add i32 %154, 1
  store i32 %159, ptr %153, align 4
  br label %new.arr.cond.11

new.arr.exit.11:                                  ; preds = %new.arr.cond.11
  %160 = getelementptr %StringProcessor, ptr %0, i32 0, i32 12
  %161 = alloca i32, align 4
  store i32 0, ptr %161, align 4
  %162 = load i32, ptr %161, align 4
  %163 = alloca i32, align 4
  store i32 5000, ptr %163, align 4
  %164 = load i32, ptr %163, align 4
  %165 = getelementptr [5000 x i32], ptr %160, i32 0, i32 0
  %166 = alloca i32, align 4
  store i32 0, ptr %166, align 4
  br label %new.arr.cond.12

new.arr.cond.12:                                  ; preds = %new.arr.body.12, %new.arr.exit.11
  %167 = load i32, ptr %166, align 4
  %168 = icmp slt i32 %167, 5000
  br i1 %168, label %new.arr.body.12, label %new.arr.exit.12

new.arr.body.12:                                  ; preds = %new.arr.cond.12
  %169 = getelementptr i32, ptr %165, i32 %167
  %170 = alloca i32, align 4
  store i32 0, ptr %170, align 4
  %171 = load i32, ptr %170, align 4
  store i32 %162, ptr %169, align 4
  %172 = add i32 %167, 1
  store i32 %172, ptr %166, align 4
  br label %new.arr.cond.12

new.arr.exit.12:                                  ; preds = %new.arr.cond.12
  %173 = getelementptr %StringProcessor, ptr %0, i32 0, i32 13
  %174 = alloca i32, align 4
  store i32 256, ptr %174, align 4
  %175 = load i32, ptr %174, align 4
  store i32 %175, ptr %173, align 4
  %176 = getelementptr %StringProcessor, ptr %0, i32 0, i32 14
  %177 = alloca i32, align 4
  store i32 10007, ptr %177, align 4
  %178 = load i32, ptr %177, align 4
  store i32 %178, ptr %176, align 4
  %179 = getelementptr %StringProcessor, ptr %0, i32 0, i32 15
  %180 = alloca [500 x i32], align 4
  %181 = alloca i32, align 4
  store i32 0, ptr %181, align 4
  %182 = load i32, ptr %181, align 4
  %183 = alloca i32, align 4
  store i32 500, ptr %183, align 4
  %184 = load i32, ptr %183, align 4
  %185 = alloca [500 x i32], align 4
  %186 = getelementptr [500 x i32], ptr %185, i32 0, i32 0
  %187 = alloca i32, align 4
  store i32 0, ptr %187, align 4
  br label %new.arr.cond.13

new.arr.cond.13:                                  ; preds = %new.arr.body.13, %new.arr.exit.12
  %188 = load i32, ptr %187, align 4
  %189 = icmp slt i32 %188, 500
  br i1 %189, label %new.arr.body.13, label %new.arr.exit.13

new.arr.body.13:                                  ; preds = %new.arr.cond.13
  %190 = getelementptr i32, ptr %186, i32 %188
  %191 = alloca i32, align 4
  store i32 0, ptr %191, align 4
  %192 = load i32, ptr %191, align 4
  store i32 %182, ptr %190, align 4
  %193 = add i32 %188, 1
  store i32 %193, ptr %187, align 4
  br label %new.arr.cond.13

new.arr.exit.13:                                  ; preds = %new.arr.cond.13
  %194 = load [500 x i32], ptr %185, align 4
  %195 = alloca i32, align 4
  store i32 500, ptr %195, align 4
  %196 = load i32, ptr %195, align 4
  %197 = getelementptr [500 x [500 x i32]], ptr %179, i32 0, i32 0
  %198 = alloca i32, align 4
  store i32 0, ptr %198, align 4
  br label %new.arr.cond.14

new.arr.cond.14:                                  ; preds = %new.arr.exit.15, %new.arr.exit.13
  %199 = load i32, ptr %198, align 4
  %200 = icmp slt i32 %199, 500
  br i1 %200, label %new.arr.body.14, label %new.arr.exit.14

new.arr.body.14:                                  ; preds = %new.arr.cond.14
  %201 = getelementptr [500 x i32], ptr %197, i32 %199
  %202 = alloca i32, align 4
  store i32 0, ptr %202, align 4
  %203 = load i32, ptr %202, align 4
  %204 = alloca i32, align 4
  store i32 500, ptr %204, align 4
  %205 = load i32, ptr %204, align 4
  %206 = getelementptr [500 x i32], ptr %201, i32 0, i32 0
  %207 = alloca i32, align 4
  store i32 0, ptr %207, align 4
  br label %new.arr.cond.15

new.arr.cond.15:                                  ; preds = %new.arr.body.15, %new.arr.body.14
  %208 = load i32, ptr %207, align 4
  %209 = icmp slt i32 %208, 500
  br i1 %209, label %new.arr.body.15, label %new.arr.exit.15

new.arr.body.15:                                  ; preds = %new.arr.cond.15
  %210 = getelementptr i32, ptr %206, i32 %208
  %211 = alloca i32, align 4
  store i32 0, ptr %211, align 4
  %212 = load i32, ptr %211, align 4
  store i32 %182, ptr %210, align 4
  %213 = add i32 %208, 1
  store i32 %213, ptr %207, align 4
  br label %new.arr.cond.15

new.arr.exit.15:                                  ; preds = %new.arr.cond.15
  %214 = add i32 %199, 1
  store i32 %214, ptr %198, align 4
  br label %new.arr.cond.14

new.arr.exit.14:                                  ; preds = %new.arr.cond.14
  %215 = getelementptr %StringProcessor, ptr %0, i32 0, i32 16
  %216 = alloca i32, align 4
  store i32 0, ptr %216, align 4
  %217 = load i32, ptr %216, align 4
  %218 = alloca i32, align 4
  store i32 256, ptr %218, align 4
  %219 = load i32, ptr %218, align 4
  %220 = getelementptr [256 x i32], ptr %215, i32 0, i32 0
  %221 = alloca i32, align 4
  store i32 0, ptr %221, align 4
  br label %new.arr.cond.16

new.arr.cond.16:                                  ; preds = %new.arr.body.16, %new.arr.exit.14
  %222 = load i32, ptr %221, align 4
  %223 = icmp slt i32 %222, 256
  br i1 %223, label %new.arr.body.16, label %new.arr.exit.16

new.arr.body.16:                                  ; preds = %new.arr.cond.16
  %224 = getelementptr i32, ptr %220, i32 %222
  %225 = alloca i32, align 4
  store i32 0, ptr %225, align 4
  %226 = load i32, ptr %225, align 4
  store i32 %217, ptr %224, align 4
  %227 = add i32 %222, 1
  store i32 %227, ptr %221, align 4
  br label %new.arr.cond.16

new.arr.exit.16:                                  ; preds = %new.arr.cond.16
  %228 = getelementptr %StringProcessor, ptr %0, i32 0, i32 17
  %229 = alloca [20 x i32], align 4
  %230 = alloca i32, align 4
  store i32 0, ptr %230, align 4
  %231 = load i32, ptr %230, align 4
  %232 = alloca i32, align 4
  store i32 20, ptr %232, align 4
  %233 = load i32, ptr %232, align 4
  %234 = alloca [20 x i32], align 4
  %235 = getelementptr [20 x i32], ptr %234, i32 0, i32 0
  %236 = alloca i32, align 4
  store i32 0, ptr %236, align 4
  br label %new.arr.cond.17

new.arr.cond.17:                                  ; preds = %new.arr.body.17, %new.arr.exit.16
  %237 = load i32, ptr %236, align 4
  %238 = icmp slt i32 %237, 20
  br i1 %238, label %new.arr.body.17, label %new.arr.exit.17

new.arr.body.17:                                  ; preds = %new.arr.cond.17
  %239 = getelementptr i32, ptr %235, i32 %237
  %240 = alloca i32, align 4
  store i32 0, ptr %240, align 4
  %241 = load i32, ptr %240, align 4
  store i32 %231, ptr %239, align 4
  %242 = add i32 %237, 1
  store i32 %242, ptr %236, align 4
  br label %new.arr.cond.17

new.arr.exit.17:                                  ; preds = %new.arr.cond.17
  %243 = load [20 x i32], ptr %234, align 4
  %244 = alloca i32, align 4
  store i32 256, ptr %244, align 4
  %245 = load i32, ptr %244, align 4
  %246 = getelementptr [256 x [20 x i32]], ptr %228, i32 0, i32 0
  %247 = alloca i32, align 4
  store i32 0, ptr %247, align 4
  br label %new.arr.cond.18

new.arr.cond.18:                                  ; preds = %new.arr.exit.19, %new.arr.exit.17
  %248 = load i32, ptr %247, align 4
  %249 = icmp slt i32 %248, 256
  br i1 %249, label %new.arr.body.18, label %new.arr.exit.18

new.arr.body.18:                                  ; preds = %new.arr.cond.18
  %250 = getelementptr [20 x i32], ptr %246, i32 %248
  %251 = alloca i32, align 4
  store i32 0, ptr %251, align 4
  %252 = load i32, ptr %251, align 4
  %253 = alloca i32, align 4
  store i32 20, ptr %253, align 4
  %254 = load i32, ptr %253, align 4
  %255 = getelementptr [20 x i32], ptr %250, i32 0, i32 0
  %256 = alloca i32, align 4
  store i32 0, ptr %256, align 4
  br label %new.arr.cond.19

new.arr.cond.19:                                  ; preds = %new.arr.body.19, %new.arr.body.18
  %257 = load i32, ptr %256, align 4
  %258 = icmp slt i32 %257, 20
  br i1 %258, label %new.arr.body.19, label %new.arr.exit.19

new.arr.body.19:                                  ; preds = %new.arr.cond.19
  %259 = getelementptr i32, ptr %255, i32 %257
  %260 = alloca i32, align 4
  store i32 0, ptr %260, align 4
  %261 = load i32, ptr %260, align 4
  store i32 %231, ptr %259, align 4
  %262 = add i32 %257, 1
  store i32 %262, ptr %256, align 4
  br label %new.arr.cond.19

new.arr.exit.19:                                  ; preds = %new.arr.cond.19
  %263 = add i32 %248, 1
  store i32 %263, ptr %247, align 4
  br label %new.arr.cond.18

new.arr.exit.18:                                  ; preds = %new.arr.cond.18
  %264 = getelementptr %StringProcessor, ptr %0, i32 0, i32 18
  %265 = alloca i32, align 4
  store i32 0, ptr %265, align 4
  %266 = load i32, ptr %265, align 4
  %267 = alloca i32, align 4
  store i32 256, ptr %267, align 4
  %268 = load i32, ptr %267, align 4
  %269 = getelementptr [256 x i32], ptr %264, i32 0, i32 0
  %270 = alloca i32, align 4
  store i32 0, ptr %270, align 4
  br label %new.arr.cond.20

new.arr.cond.20:                                  ; preds = %new.arr.body.20, %new.arr.exit.18
  %271 = load i32, ptr %270, align 4
  %272 = icmp slt i32 %271, 256
  br i1 %272, label %new.arr.body.20, label %new.arr.exit.20

new.arr.body.20:                                  ; preds = %new.arr.cond.20
  %273 = getelementptr i32, ptr %269, i32 %271
  %274 = alloca i32, align 4
  store i32 0, ptr %274, align 4
  %275 = load i32, ptr %274, align 4
  store i32 %266, ptr %273, align 4
  %276 = add i32 %271, 1
  store i32 %276, ptr %270, align 4
  br label %new.arr.cond.20

new.arr.exit.20:                                  ; preds = %new.arr.cond.20
  %277 = getelementptr %StringProcessor, ptr %0, i32 0, i32 19
  %278 = alloca i32, align 4
  store i32 0, ptr %278, align 4
  %279 = load i32, ptr %278, align 4
  store i32 %279, ptr %277, align 4
  %280 = getelementptr %StringProcessor, ptr %0, i32 0, i32 20
  %281 = alloca i32, align 4
  store i32 0, ptr %281, align 4
  %282 = load i32, ptr %281, align 4
  store i32 %282, ptr %280, align 4
  %283 = getelementptr %StringProcessor, ptr %0, i32 0, i32 21
  %284 = alloca i32, align 4
  store i32 0, ptr %284, align 4
  %285 = load i32, ptr %284, align 4
  store i32 %285, ptr %283, align 4
  %286 = getelementptr %StringProcessor, ptr %0, i32 0, i32 22
  %287 = alloca i32, align 4
  store i32 0, ptr %287, align 4
  %288 = load i32, ptr %287, align 4
  store i32 %288, ptr %286, align 4
  %289 = getelementptr %StringProcessor, ptr %0, i32 0, i32 23
  %290 = alloca [100 x i32], align 4
  %291 = alloca i32, align 4
  store i32 0, ptr %291, align 4
  %292 = load i32, ptr %291, align 4
  %293 = alloca i32, align 4
  store i32 100, ptr %293, align 4
  %294 = load i32, ptr %293, align 4
  %295 = alloca [100 x i32], align 4
  %296 = getelementptr [100 x i32], ptr %295, i32 0, i32 0
  %297 = alloca i32, align 4
  store i32 0, ptr %297, align 4
  br label %new.arr.cond.21

new.arr.cond.21:                                  ; preds = %new.arr.body.21, %new.arr.exit.20
  %298 = load i32, ptr %297, align 4
  %299 = icmp slt i32 %298, 100
  br i1 %299, label %new.arr.body.21, label %new.arr.exit.21

new.arr.body.21:                                  ; preds = %new.arr.cond.21
  %300 = getelementptr i32, ptr %296, i32 %298
  %301 = alloca i32, align 4
  store i32 0, ptr %301, align 4
  %302 = load i32, ptr %301, align 4
  store i32 %292, ptr %300, align 4
  %303 = add i32 %298, 1
  store i32 %303, ptr %297, align 4
  br label %new.arr.cond.21

new.arr.exit.21:                                  ; preds = %new.arr.cond.21
  %304 = load [100 x i32], ptr %295, align 4
  %305 = alloca i32, align 4
  store i32 50, ptr %305, align 4
  %306 = load i32, ptr %305, align 4
  %307 = getelementptr [50 x [100 x i32]], ptr %289, i32 0, i32 0
  %308 = alloca i32, align 4
  store i32 0, ptr %308, align 4
  br label %new.arr.cond.22

new.arr.cond.22:                                  ; preds = %new.arr.exit.23, %new.arr.exit.21
  %309 = load i32, ptr %308, align 4
  %310 = icmp slt i32 %309, 50
  br i1 %310, label %new.arr.body.22, label %new.arr.exit.22

new.arr.body.22:                                  ; preds = %new.arr.cond.22
  %311 = getelementptr [100 x i32], ptr %307, i32 %309
  %312 = alloca i32, align 4
  store i32 0, ptr %312, align 4
  %313 = load i32, ptr %312, align 4
  %314 = alloca i32, align 4
  store i32 100, ptr %314, align 4
  %315 = load i32, ptr %314, align 4
  %316 = getelementptr [100 x i32], ptr %311, i32 0, i32 0
  %317 = alloca i32, align 4
  store i32 0, ptr %317, align 4
  br label %new.arr.cond.23

new.arr.cond.23:                                  ; preds = %new.arr.body.23, %new.arr.body.22
  %318 = load i32, ptr %317, align 4
  %319 = icmp slt i32 %318, 100
  br i1 %319, label %new.arr.body.23, label %new.arr.exit.23

new.arr.body.23:                                  ; preds = %new.arr.cond.23
  %320 = getelementptr i32, ptr %316, i32 %318
  %321 = alloca i32, align 4
  store i32 0, ptr %321, align 4
  %322 = load i32, ptr %321, align 4
  store i32 %292, ptr %320, align 4
  %323 = add i32 %318, 1
  store i32 %323, ptr %317, align 4
  br label %new.arr.cond.23

new.arr.exit.23:                                  ; preds = %new.arr.cond.23
  %324 = add i32 %309, 1
  store i32 %324, ptr %308, align 4
  br label %new.arr.cond.22

new.arr.exit.22:                                  ; preds = %new.arr.cond.22
  %325 = getelementptr %StringProcessor, ptr %0, i32 0, i32 24
  %326 = alloca i32, align 4
  store i32 0, ptr %326, align 4
  %327 = load i32, ptr %326, align 4
  %328 = alloca i32, align 4
  store i32 50, ptr %328, align 4
  %329 = load i32, ptr %328, align 4
  %330 = getelementptr [50 x i32], ptr %325, i32 0, i32 0
  %331 = alloca i32, align 4
  store i32 0, ptr %331, align 4
  br label %new.arr.cond.24

new.arr.cond.24:                                  ; preds = %new.arr.body.24, %new.arr.exit.22
  %332 = load i32, ptr %331, align 4
  %333 = icmp slt i32 %332, 50
  br i1 %333, label %new.arr.body.24, label %new.arr.exit.24

new.arr.body.24:                                  ; preds = %new.arr.cond.24
  %334 = getelementptr i32, ptr %330, i32 %332
  %335 = alloca i32, align 4
  store i32 0, ptr %335, align 4
  %336 = load i32, ptr %335, align 4
  store i32 %327, ptr %334, align 4
  %337 = add i32 %332, 1
  store i32 %337, ptr %331, align 4
  br label %new.arr.cond.24

new.arr.exit.24:                                  ; preds = %new.arr.cond.24
  %338 = getelementptr %StringProcessor, ptr %0, i32 0, i32 25
  %339 = alloca i32, align 4
  store i32 0, ptr %339, align 4
  %340 = load i32, ptr %339, align 4
  %341 = alloca i32, align 4
  store i32 10, ptr %341, align 4
  %342 = load i32, ptr %341, align 4
  %343 = getelementptr [10 x i32], ptr %338, i32 0, i32 0
  %344 = alloca i32, align 4
  store i32 0, ptr %344, align 4
  br label %new.arr.cond.25

new.arr.cond.25:                                  ; preds = %new.arr.body.25, %new.arr.exit.24
  %345 = load i32, ptr %344, align 4
  %346 = icmp slt i32 %345, 10
  br i1 %346, label %new.arr.body.25, label %new.arr.exit.25

new.arr.body.25:                                  ; preds = %new.arr.cond.25
  %347 = getelementptr i32, ptr %343, i32 %345
  %348 = alloca i32, align 4
  store i32 0, ptr %348, align 4
  %349 = load i32, ptr %348, align 4
  store i32 %340, ptr %347, align 4
  %350 = add i32 %345, 1
  store i32 %350, ptr %344, align 4
  br label %new.arr.cond.25

new.arr.exit.25:                                  ; preds = %new.arr.cond.25
  %351 = getelementptr %StringProcessor, ptr %0, i32 0, i32 26
  %352 = alloca i32, align 4
  store i32 0, ptr %352, align 4
  %353 = load i32, ptr %352, align 4
  store i32 %353, ptr %351, align 4
  %354 = getelementptr %StringProcessor, ptr %0, i32 0, i32 27
  %355 = alloca i32, align 4
  store i32 0, ptr %355, align 4
  %356 = load i32, ptr %355, align 4
  store i32 %356, ptr %354, align 4
  ret void
}

define void @_14su0eKxQra_initialize_text(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %3, align 4
  store i32 %6, ptr %5, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %7, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %8 = load i32, ptr %7, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr %StringProcessor, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %7, align 4
  %14 = getelementptr [5000 x i32], ptr %12, i32 0, i32 %13
  %15 = call i32 @getInt()
  store i32 %15, ptr %14, align 4
  %16 = load i32, ptr %7, align 4
  %17 = add i32 %16, 1
  store i32 %17, ptr %7, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %18 = load ptr, ptr %2, align 8
  call void @_14su0eKxQra_analyze_text_statistics(ptr %18)
  %19 = load ptr, ptr %2, align 8
  call void @_14su0eKxQra_build_suffix_array(ptr %19)
  %20 = load ptr, ptr %2, align 8
  call void @_14su0eKxQra_compute_lcp_array(ptr %20)
  %21 = load ptr, ptr %2, align 8
  call void @_14su0eKxQra_prepare_rabin_karp_hashes(ptr %21)
  ret void
}

define void @_14su0eKxQra_add_pattern(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 4
  %6 = load i32, ptr %5, align 4
  %7 = alloca i32, align 4
  store i32 50, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = icmp sge i32 %6, %8
  br i1 %9, label %if.then.0, label %if.else.0

if.then.0:                                        ; preds = %entry
  ret void

if.else.0:                                        ; preds = %entry
  br label %if.exit.0

if.exit.0:                                        ; preds = %if.else.0
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr %StringProcessor, ptr %10, i32 0, i32 4
  %12 = load i32, ptr %11, align 4
  %13 = alloca i32, align 4
  store i32 %12, ptr %13, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr %StringProcessor, ptr %14, i32 0, i32 3
  %16 = load i32, ptr %13, align 4
  %17 = getelementptr [50 x i32], ptr %15, i32 0, i32 %16
  %18 = load i32, ptr %3, align 4
  store i32 %18, ptr %17, align 4
  %19 = alloca i32, align 4
  store i32 0, ptr %19, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %if.exit.0
  %20 = load i32, ptr %19, align 4
  %21 = load i32, ptr %3, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr %StringProcessor, ptr %23, i32 0, i32 2
  %25 = load i32, ptr %13, align 4
  %26 = getelementptr [50 x [200 x i32]], ptr %24, i32 0, i32 %25
  %27 = load i32, ptr %19, align 4
  %28 = getelementptr [200 x i32], ptr %26, i32 0, i32 %27
  %29 = call i32 @getInt()
  store i32 %29, ptr %28, align 4
  %30 = load i32, ptr %19, align 4
  %31 = add i32 %30, 1
  store i32 %31, ptr %19, align 4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %32 = load i32, ptr %13, align 4
  %33 = load ptr, ptr %2, align 8
  call void @_14su0eKxQra_preprocess_kmp(ptr %33, i32 %32)
  %34 = load i32, ptr %13, align 4
  %35 = load ptr, ptr %2, align 8
  call void @_14su0eKxQra_preprocess_boyer_moore(ptr %35, i32 %34)
  %36 = load i32, ptr %13, align 4
  %37 = load ptr, ptr %2, align 8
  call void @_14su0eKxQra_compute_pattern_hash(ptr %37, i32 %36)
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr %StringProcessor, ptr %38, i32 0, i32 4
  %40 = load i32, ptr %39, align 4
  %41 = add i32 %40, 1
  store i32 %41, ptr %39, align 4
  ret void
}

define void @_14su0eKxQra_analyze_text_statistics(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr %StringProcessor, ptr %2, i32 0, i32 19
  %4 = alloca i32, align 4
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  store i32 %5, ptr %3, align 4
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr %StringProcessor, ptr %6, i32 0, i32 20
  %8 = alloca i32, align 4
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr %8, align 4
  store i32 %9, ptr %7, align 4
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr %StringProcessor, ptr %10, i32 0, i32 21
  %12 = alloca i32, align 4
  store i32 0, ptr %12, align 4
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %11, align 4
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr %StringProcessor, ptr %14, i32 0, i32 22
  %16 = alloca i32, align 4
  store i32 0, ptr %16, align 4
  %17 = load i32, ptr %16, align 4
  store i32 %17, ptr %15, align 4
  %18 = alloca i32, align 4
  store i32 0, ptr %18, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %19 = load i32, ptr %18, align 4
  %20 = alloca i32, align 4
  store i32 256, ptr %20, align 4
  %21 = load i32, ptr %20, align 4
  %22 = icmp slt i32 %19, %21
  br i1 %22, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %23 = load ptr, ptr %1, align 8
  %24 = getelementptr %StringProcessor, ptr %23, i32 0, i32 16
  %25 = load i32, ptr %18, align 4
  %26 = getelementptr [256 x i32], ptr %24, i32 0, i32 %25
  %27 = alloca i32, align 4
  store i32 0, ptr %27, align 4
  %28 = load i32, ptr %27, align 4
  store i32 %28, ptr %26, align 4
  %29 = load i32, ptr %18, align 4
  %30 = add i32 %29, 1
  store i32 %30, ptr %18, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %31 = alloca i32, align 4
  store i32 0, ptr %31, align 4
  %32 = load i32, ptr %31, align 4
  store i32 %32, ptr %18, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %if.exit.10, %while.exit.0
  %33 = load i32, ptr %18, align 4
  %34 = load ptr, ptr %1, align 8
  %35 = getelementptr %StringProcessor, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %38 = load ptr, ptr %1, align 8
  %39 = getelementptr %StringProcessor, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %18, align 4
  %41 = getelementptr [5000 x i32], ptr %39, i32 0, i32 %40
  %42 = load i32, ptr %41, align 4
  %43 = alloca i32, align 4
  store i32 %42, ptr %43, align 4
  %44 = load i32, ptr %43, align 4
  %45 = alloca i32, align 4
  store i32 0, ptr %45, align 4
  %46 = load i32, ptr %45, align 4
  %47 = icmp sge i32 %44, %46
  br i1 %47, label %laz.then.3, label %laz.else.3

laz.then.3:                                       ; preds = %while.body.1
  %48 = load i32, ptr %43, align 4
  %49 = alloca i32, align 4
  store i32 256, ptr %49, align 4
  %50 = load i32, ptr %49, align 4
  %51 = icmp slt i32 %48, %50
  br label %laz.exit.3

laz.else.3:                                       ; preds = %while.body.1
  br label %laz.exit.3

laz.exit.3:                                       ; preds = %laz.else.3, %laz.then.3
  %52 = phi i1 [ %51, %laz.then.3 ], [ false, %laz.else.3 ]
  br i1 %52, label %if.then.2, label %if.else.2

if.then.2:                                        ; preds = %laz.exit.3
  %53 = load ptr, ptr %1, align 8
  %54 = getelementptr %StringProcessor, ptr %53, i32 0, i32 16
  %55 = load i32, ptr %43, align 4
  %56 = getelementptr [256 x i32], ptr %54, i32 0, i32 %55
  %57 = load i32, ptr %56, align 4
  %58 = add i32 %57, 1
  store i32 %58, ptr %56, align 4
  br label %if.exit.2

if.else.2:                                        ; preds = %laz.exit.3
  br label %if.exit.2

if.exit.2:                                        ; preds = %if.else.2, %if.then.2
  %59 = load i32, ptr %43, align 4
  %60 = alloca i32, align 4
  store i32 32, ptr %60, align 4
  %61 = load i32, ptr %60, align 4
  %62 = icmp eq i32 %59, %61
  br i1 %62, label %laz.then.5, label %laz.else.5

laz.then.5:                                       ; preds = %if.exit.2
  %63 = load i32, ptr %18, align 4
  %64 = alloca i32, align 4
  store i32 0, ptr %64, align 4
  %65 = load i32, ptr %64, align 4
  %66 = icmp sgt i32 %63, %65
  br label %laz.exit.5

laz.else.5:                                       ; preds = %if.exit.2
  br label %laz.exit.5

laz.exit.5:                                       ; preds = %laz.else.5, %laz.then.5
  %67 = phi i1 [ %66, %laz.then.5 ], [ false, %laz.else.5 ]
  br i1 %67, label %laz.then.6, label %laz.else.6

laz.then.6:                                       ; preds = %laz.exit.5
  %68 = load ptr, ptr %1, align 8
  %69 = getelementptr %StringProcessor, ptr %68, i32 0, i32 0
  %70 = load i32, ptr %18, align 4
  %71 = sub i32 %70, 1
  %72 = getelementptr [5000 x i32], ptr %69, i32 0, i32 %71
  %73 = load i32, ptr %72, align 4
  %74 = alloca i32, align 4
  store i32 32, ptr %74, align 4
  %75 = load i32, ptr %74, align 4
  %76 = icmp ne i32 %73, %75
  br label %laz.exit.6

laz.else.6:                                       ; preds = %laz.exit.5
  br label %laz.exit.6

laz.exit.6:                                       ; preds = %laz.else.6, %laz.then.6
  %77 = phi i1 [ %76, %laz.then.6 ], [ false, %laz.else.6 ]
  br i1 %77, label %if.then.4, label %if.else.4

if.then.4:                                        ; preds = %laz.exit.6
  %78 = load ptr, ptr %1, align 8
  %79 = getelementptr %StringProcessor, ptr %78, i32 0, i32 19
  %80 = load i32, ptr %79, align 4
  %81 = add i32 %80, 1
  store i32 %81, ptr %79, align 4
  br label %if.exit.4

if.else.4:                                        ; preds = %laz.exit.6
  br label %if.exit.4

if.exit.4:                                        ; preds = %if.else.4, %if.then.4
  %82 = load i32, ptr %43, align 4
  %83 = alloca i32, align 4
  store i32 46, ptr %83, align 4
  %84 = load i32, ptr %83, align 4
  %85 = icmp eq i32 %82, %84
  br i1 %85, label %laz.then.8, label %laz.else.8

laz.then.8:                                       ; preds = %if.exit.4
  br label %laz.exit.8

laz.else.8:                                       ; preds = %if.exit.4
  %86 = load i32, ptr %43, align 4
  %87 = alloca i32, align 4
  store i32 33, ptr %87, align 4
  %88 = load i32, ptr %87, align 4
  %89 = icmp eq i32 %86, %88
  br label %laz.exit.8

laz.exit.8:                                       ; preds = %laz.else.8, %laz.then.8
  %90 = phi i1 [ true, %laz.then.8 ], [ %89, %laz.else.8 ]
  br i1 %90, label %laz.then.9, label %laz.else.9

laz.then.9:                                       ; preds = %laz.exit.8
  br label %laz.exit.9

laz.else.9:                                       ; preds = %laz.exit.8
  %91 = load i32, ptr %43, align 4
  %92 = alloca i32, align 4
  store i32 63, ptr %92, align 4
  %93 = load i32, ptr %92, align 4
  %94 = icmp eq i32 %91, %93
  br label %laz.exit.9

laz.exit.9:                                       ; preds = %laz.else.9, %laz.then.9
  %95 = phi i1 [ true, %laz.then.9 ], [ %94, %laz.else.9 ]
  br i1 %95, label %if.then.7, label %if.else.7

if.then.7:                                        ; preds = %laz.exit.9
  %96 = load ptr, ptr %1, align 8
  %97 = getelementptr %StringProcessor, ptr %96, i32 0, i32 20
  %98 = load i32, ptr %97, align 4
  %99 = add i32 %98, 1
  store i32 %99, ptr %97, align 4
  br label %if.exit.7

if.else.7:                                        ; preds = %laz.exit.9
  br label %if.exit.7

if.exit.7:                                        ; preds = %if.else.7, %if.then.7
  %100 = load i32, ptr %43, align 4
  %101 = alloca i32, align 4
  store i32 10, ptr %101, align 4
  %102 = load i32, ptr %101, align 4
  %103 = icmp eq i32 %100, %102
  br i1 %103, label %if.then.10, label %if.else.10

if.then.10:                                       ; preds = %if.exit.7
  %104 = load ptr, ptr %1, align 8
  %105 = getelementptr %StringProcessor, ptr %104, i32 0, i32 21
  %106 = load i32, ptr %105, align 4
  %107 = add i32 %106, 1
  store i32 %107, ptr %105, align 4
  br label %if.exit.10

if.else.10:                                       ; preds = %if.exit.7
  br label %if.exit.10

if.exit.10:                                       ; preds = %if.else.10, %if.then.10
  %108 = load i32, ptr %18, align 4
  %109 = add i32 %108, 1
  store i32 %109, ptr %18, align 4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %110 = alloca i32, align 4
  store i32 0, ptr %110, align 4
  %111 = load i32, ptr %110, align 4
  store i32 %111, ptr %18, align 4
  br label %while.cond.11

while.cond.11:                                    ; preds = %if.exit.12, %while.exit.1
  %112 = load i32, ptr %18, align 4
  %113 = alloca i32, align 4
  store i32 256, ptr %113, align 4
  %114 = load i32, ptr %113, align 4
  %115 = icmp slt i32 %112, %114
  br i1 %115, label %while.body.11, label %while.exit.11

while.body.11:                                    ; preds = %while.cond.11
  %116 = load ptr, ptr %1, align 8
  %117 = getelementptr %StringProcessor, ptr %116, i32 0, i32 16
  %118 = load i32, ptr %18, align 4
  %119 = getelementptr [256 x i32], ptr %117, i32 0, i32 %118
  %120 = load i32, ptr %119, align 4
  %121 = alloca i32, align 4
  store i32 0, ptr %121, align 4
  %122 = load i32, ptr %121, align 4
  %123 = icmp sgt i32 %120, %122
  br i1 %123, label %if.then.12, label %if.else.12

if.then.12:                                       ; preds = %while.body.11
  %124 = load ptr, ptr %1, align 8
  %125 = getelementptr %StringProcessor, ptr %124, i32 0, i32 22
  %126 = load i32, ptr %125, align 4
  %127 = add i32 %126, 1
  store i32 %127, ptr %125, align 4
  br label %if.exit.12

if.else.12:                                       ; preds = %while.body.11
  br label %if.exit.12

if.exit.12:                                       ; preds = %if.else.12, %if.then.12
  %128 = load i32, ptr %18, align 4
  %129 = add i32 %128, 1
  store i32 %129, ptr %18, align 4
  br label %while.cond.11

while.exit.11:                                    ; preds = %while.cond.11
  %130 = load ptr, ptr %1, align 8
  %131 = getelementptr %StringProcessor, ptr %130, i32 0, i32 1
  %132 = load i32, ptr %131, align 4
  %133 = alloca i32, align 4
  store i32 0, ptr %133, align 4
  %134 = load i32, ptr %133, align 4
  %135 = icmp sgt i32 %132, %134
  br i1 %135, label %laz.then.14, label %laz.else.14

laz.then.14:                                      ; preds = %while.exit.11
  %136 = load ptr, ptr %1, align 8
  %137 = getelementptr %StringProcessor, ptr %136, i32 0, i32 0
  %138 = load ptr, ptr %1, align 8
  %139 = getelementptr %StringProcessor, ptr %138, i32 0, i32 1
  %140 = load i32, ptr %139, align 4
  %141 = sub i32 %140, 1
  %142 = getelementptr [5000 x i32], ptr %137, i32 0, i32 %141
  %143 = load i32, ptr %142, align 4
  %144 = alloca i32, align 4
  store i32 32, ptr %144, align 4
  %145 = load i32, ptr %144, align 4
  %146 = icmp ne i32 %143, %145
  br label %laz.exit.14

laz.else.14:                                      ; preds = %while.exit.11
  br label %laz.exit.14

laz.exit.14:                                      ; preds = %laz.else.14, %laz.then.14
  %147 = phi i1 [ %146, %laz.then.14 ], [ false, %laz.else.14 ]
  br i1 %147, label %if.then.13, label %if.else.13

if.then.13:                                       ; preds = %laz.exit.14
  %148 = load ptr, ptr %1, align 8
  %149 = getelementptr %StringProcessor, ptr %148, i32 0, i32 19
  %150 = load i32, ptr %149, align 4
  %151 = add i32 %150, 1
  store i32 %151, ptr %149, align 4
  br label %if.exit.13

if.else.13:                                       ; preds = %laz.exit.14
  br label %if.exit.13

if.exit.13:                                       ; preds = %if.else.13, %if.then.13
  ret void
}

define void @_14su0eKxQra_build_suffix_array(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %3 = load i32, ptr %2, align 4
  %4 = load ptr, ptr %1, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %3, %6
  br i1 %7, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr %StringProcessor, ptr %8, i32 0, i32 5
  %10 = load i32, ptr %2, align 4
  %11 = getelementptr [5000 x i32], ptr %9, i32 0, i32 %10
  %12 = load i32, ptr %2, align 4
  store i32 %12, ptr %11, align 4
  %13 = load i32, ptr %2, align 4
  %14 = add i32 %13, 1
  store i32 %14, ptr %2, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %15 = alloca i1, align 1
  store i1 false, ptr %15, align 1
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.exit.2, %while.exit.0
  %16 = load i1, ptr %15, align 1
  %17 = icmp eq i1 %16, false
  br i1 %17, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %18 = alloca i1, align 1
  store i1 true, ptr %18, align 1
  %19 = load i1, ptr %18, align 1
  store i1 %19, ptr %15, align 1
  %20 = alloca i32, align 4
  store i32 0, ptr %20, align 4
  %21 = load i32, ptr %20, align 4
  store i32 %21, ptr %2, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %if.exit.3, %while.body.1
  %22 = load i32, ptr %2, align 4
  %23 = load ptr, ptr %1, align 8
  %24 = getelementptr %StringProcessor, ptr %23, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  %26 = sub i32 %25, 1
  %27 = icmp slt i32 %22, %26
  br i1 %27, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %while.cond.2
  %28 = load ptr, ptr %1, align 8
  %29 = getelementptr %StringProcessor, ptr %28, i32 0, i32 5
  %30 = load i32, ptr %2, align 4
  %31 = getelementptr [5000 x i32], ptr %29, i32 0, i32 %30
  %32 = load i32, ptr %31, align 4
  %33 = load ptr, ptr %1, align 8
  %34 = getelementptr %StringProcessor, ptr %33, i32 0, i32 5
  %35 = load i32, ptr %2, align 4
  %36 = add i32 %35, 1
  %37 = getelementptr [5000 x i32], ptr %34, i32 0, i32 %36
  %38 = load i32, ptr %37, align 4
  %39 = load ptr, ptr %1, align 8
  %40 = call i32 @_14su0eKxQra_compare_suffixes(ptr %39, i32 %32, i32 %38)
  %41 = alloca i32, align 4
  store i32 0, ptr %41, align 4
  %42 = load i32, ptr %41, align 4
  %43 = icmp sgt i32 %40, %42
  br i1 %43, label %if.then.3, label %if.else.3

if.then.3:                                        ; preds = %while.body.2
  %44 = load ptr, ptr %1, align 8
  %45 = getelementptr %StringProcessor, ptr %44, i32 0, i32 5
  %46 = load i32, ptr %2, align 4
  %47 = getelementptr [5000 x i32], ptr %45, i32 0, i32 %46
  %48 = load i32, ptr %47, align 4
  %49 = alloca i32, align 4
  store i32 %48, ptr %49, align 4
  %50 = load ptr, ptr %1, align 8
  %51 = getelementptr %StringProcessor, ptr %50, i32 0, i32 5
  %52 = load i32, ptr %2, align 4
  %53 = getelementptr [5000 x i32], ptr %51, i32 0, i32 %52
  %54 = load ptr, ptr %1, align 8
  %55 = getelementptr %StringProcessor, ptr %54, i32 0, i32 5
  %56 = load i32, ptr %2, align 4
  %57 = add i32 %56, 1
  %58 = getelementptr [5000 x i32], ptr %55, i32 0, i32 %57
  %59 = load i32, ptr %58, align 4
  store i32 %59, ptr %53, align 4
  %60 = load ptr, ptr %1, align 8
  %61 = getelementptr %StringProcessor, ptr %60, i32 0, i32 5
  %62 = load i32, ptr %2, align 4
  %63 = add i32 %62, 1
  %64 = getelementptr [5000 x i32], ptr %61, i32 0, i32 %63
  %65 = load i32, ptr %49, align 4
  store i32 %65, ptr %64, align 4
  %66 = alloca i1, align 1
  store i1 false, ptr %66, align 1
  %67 = load i1, ptr %66, align 1
  store i1 %67, ptr %15, align 1
  br label %if.exit.3

if.else.3:                                        ; preds = %while.body.2
  br label %if.exit.3

if.exit.3:                                        ; preds = %if.else.3, %if.then.3
  %68 = load i32, ptr %2, align 4
  %69 = add i32 %68, 1
  store i32 %69, ptr %2, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %while.cond.2
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %70 = alloca i32, align 4
  store i32 0, ptr %70, align 4
  %71 = load i32, ptr %70, align 4
  store i32 %71, ptr %2, align 4
  br label %while.cond.4

while.cond.4:                                     ; preds = %while.body.4, %while.exit.1
  %72 = load i32, ptr %2, align 4
  %73 = load ptr, ptr %1, align 8
  %74 = getelementptr %StringProcessor, ptr %73, i32 0, i32 1
  %75 = load i32, ptr %74, align 4
  %76 = icmp slt i32 %72, %75
  br i1 %76, label %while.body.4, label %while.exit.4

while.body.4:                                     ; preds = %while.cond.4
  %77 = load ptr, ptr %1, align 8
  %78 = getelementptr %StringProcessor, ptr %77, i32 0, i32 7
  %79 = load ptr, ptr %1, align 8
  %80 = getelementptr %StringProcessor, ptr %79, i32 0, i32 5
  %81 = load i32, ptr %2, align 4
  %82 = getelementptr [5000 x i32], ptr %80, i32 0, i32 %81
  %83 = load i32, ptr %82, align 4
  %84 = getelementptr [5000 x i32], ptr %78, i32 0, i32 %83
  %85 = load i32, ptr %2, align 4
  store i32 %85, ptr %84, align 4
  %86 = load i32, ptr %2, align 4
  %87 = add i32 %86, 1
  store i32 %87, ptr %2, align 4
  br label %while.cond.4

while.exit.4:                                     ; preds = %while.cond.4
  ret void
}

define i32 @_14su0eKxQra_compare_suffixes(ptr %0, i32 %1, i32 %2) {
entry:
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = alloca i32, align 4
  store i32 %1, ptr %4, align 4
  %5 = alloca i32, align 4
  store i32 %2, ptr %5, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %6, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %if.exit.2, %entry
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %6, align 4
  %9 = add i32 %7, %8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr %StringProcessor, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %laz.then.1, label %laz.else.1

laz.then.1:                                       ; preds = %while.cond.0
  %14 = load i32, ptr %5, align 4
  %15 = load i32, ptr %6, align 4
  %16 = add i32 %14, %15
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr %StringProcessor, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = icmp slt i32 %16, %19
  br label %laz.exit.1

laz.else.1:                                       ; preds = %while.cond.0
  br label %laz.exit.1

laz.exit.1:                                       ; preds = %laz.else.1, %laz.then.1
  %21 = phi i1 [ %20, %laz.then.1 ], [ false, %laz.else.1 ]
  br i1 %21, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %laz.exit.1
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr %StringProcessor, ptr %22, i32 0, i32 26
  %24 = load i32, ptr %23, align 4
  %25 = add i32 %24, 1
  store i32 %25, ptr %23, align 4
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr %StringProcessor, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %4, align 4
  %29 = load i32, ptr %6, align 4
  %30 = add i32 %28, %29
  %31 = getelementptr [5000 x i32], ptr %27, i32 0, i32 %30
  %32 = load i32, ptr %31, align 4
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr %StringProcessor, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %5, align 4
  %36 = load i32, ptr %6, align 4
  %37 = add i32 %35, %36
  %38 = getelementptr [5000 x i32], ptr %34, i32 0, i32 %37
  %39 = load i32, ptr %38, align 4
  %40 = icmp slt i32 %32, %39
  br i1 %40, label %if.then.2, label %if.else.2

if.then.2:                                        ; preds = %while.body.0
  %41 = alloca i32, align 4
  store i32 1, ptr %41, align 4
  %42 = load i32, ptr %41, align 4
  %43 = sub i32 0, %42
  ret i32 %43

if.else.2:                                        ; preds = %while.body.0
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr %StringProcessor, ptr %44, i32 0, i32 0
  %46 = load i32, ptr %4, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add i32 %46, %47
  %49 = getelementptr [5000 x i32], ptr %45, i32 0, i32 %48
  %50 = load i32, ptr %49, align 4
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr %StringProcessor, ptr %51, i32 0, i32 0
  %53 = load i32, ptr %5, align 4
  %54 = load i32, ptr %6, align 4
  %55 = add i32 %53, %54
  %56 = getelementptr [5000 x i32], ptr %52, i32 0, i32 %55
  %57 = load i32, ptr %56, align 4
  %58 = icmp sgt i32 %50, %57
  br i1 %58, label %if.then.3, label %if.else.3

if.then.3:                                        ; preds = %if.else.2
  %59 = alloca i32, align 4
  store i32 1, ptr %59, align 4
  %60 = load i32, ptr %59, align 4
  ret i32 %60

if.else.3:                                        ; preds = %if.else.2
  br label %if.exit.3

if.exit.3:                                        ; preds = %if.else.3
  br label %if.exit.2

if.exit.2:                                        ; preds = %if.exit.3
  %61 = load i32, ptr %6, align 4
  %62 = add i32 %61, 1
  store i32 %62, ptr %6, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %laz.exit.1
  %63 = load i32, ptr %4, align 4
  %64 = load i32, ptr %6, align 4
  %65 = add i32 %63, %64
  %66 = load ptr, ptr %3, align 8
  %67 = getelementptr %StringProcessor, ptr %66, i32 0, i32 1
  %68 = load i32, ptr %67, align 4
  %69 = icmp sge i32 %65, %68
  br i1 %69, label %laz.then.5, label %laz.else.5

laz.then.5:                                       ; preds = %while.exit.0
  %70 = load i32, ptr %5, align 4
  %71 = load i32, ptr %6, align 4
  %72 = add i32 %70, %71
  %73 = load ptr, ptr %3, align 8
  %74 = getelementptr %StringProcessor, ptr %73, i32 0, i32 1
  %75 = load i32, ptr %74, align 4
  %76 = icmp sge i32 %72, %75
  br label %laz.exit.5

laz.else.5:                                       ; preds = %while.exit.0
  br label %laz.exit.5

laz.exit.5:                                       ; preds = %laz.else.5, %laz.then.5
  %77 = phi i1 [ %76, %laz.then.5 ], [ false, %laz.else.5 ]
  br i1 %77, label %if.then.4, label %if.else.4

if.then.4:                                        ; preds = %laz.exit.5
  %78 = alloca i32, align 4
  store i32 0, ptr %78, align 4
  %79 = load i32, ptr %78, align 4
  ret i32 %79

if.else.4:                                        ; preds = %laz.exit.5
  %80 = load i32, ptr %4, align 4
  %81 = load i32, ptr %6, align 4
  %82 = add i32 %80, %81
  %83 = load ptr, ptr %3, align 8
  %84 = getelementptr %StringProcessor, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 4
  %86 = icmp sge i32 %82, %85
  br i1 %86, label %if.then.6, label %if.else.6

if.then.6:                                        ; preds = %if.else.4
  %87 = alloca i32, align 4
  store i32 1, ptr %87, align 4
  %88 = load i32, ptr %87, align 4
  %89 = sub i32 0, %88
  ret i32 %89

if.else.6:                                        ; preds = %if.else.4
  %90 = alloca i32, align 4
  store i32 1, ptr %90, align 4
  %91 = load i32, ptr %90, align 4
  ret i32 %91

if.exit.6:                                        ; No predecessors!
  br label %if.exit.4

if.exit.4:                                        ; preds = %if.exit.6
  unreachable
}

define void @_14su0eKxQra_compute_lcp_array(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %if.exit.5, %if.then.1, %entry
  %4 = load i32, ptr %3, align 4
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr %StringProcessor, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = icmp slt i32 %4, %7
  br i1 %8, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr %StringProcessor, ptr %9, i32 0, i32 7
  %11 = load i32, ptr %3, align 4
  %12 = getelementptr [5000 x i32], ptr %10, i32 0, i32 %11
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr %StringProcessor, ptr %14, i32 0, i32 1
  %16 = load i32, ptr %15, align 4
  %17 = sub i32 %16, 1
  %18 = icmp eq i32 %13, %17
  br i1 %18, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.body.0
  %19 = alloca i32, align 4
  store i32 0, ptr %19, align 4
  %20 = load i32, ptr %19, align 4
  store i32 %20, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  %22 = add i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %while.cond.0

if.else.1:                                        ; preds = %while.body.0
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.else.1
  %23 = load ptr, ptr %1, align 8
  %24 = getelementptr %StringProcessor, ptr %23, i32 0, i32 5
  %25 = load ptr, ptr %1, align 8
  %26 = getelementptr %StringProcessor, ptr %25, i32 0, i32 7
  %27 = load i32, ptr %3, align 4
  %28 = getelementptr [5000 x i32], ptr %26, i32 0, i32 %27
  %29 = load i32, ptr %28, align 4
  %30 = add i32 %29, 1
  %31 = getelementptr [5000 x i32], ptr %24, i32 0, i32 %30
  %32 = load i32, ptr %31, align 4
  %33 = alloca i32, align 4
  store i32 %32, ptr %33, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %if.exit.1
  %34 = load i32, ptr %3, align 4
  %35 = load i32, ptr %2, align 4
  %36 = add i32 %34, %35
  %37 = load ptr, ptr %1, align 8
  %38 = getelementptr %StringProcessor, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = icmp slt i32 %36, %39
  br i1 %40, label %laz.then.3, label %laz.else.3

laz.then.3:                                       ; preds = %while.cond.2
  %41 = load i32, ptr %33, align 4
  %42 = load i32, ptr %2, align 4
  %43 = add i32 %41, %42
  %44 = load ptr, ptr %1, align 8
  %45 = getelementptr %StringProcessor, ptr %44, i32 0, i32 1
  %46 = load i32, ptr %45, align 4
  %47 = icmp slt i32 %43, %46
  br label %laz.exit.3

laz.else.3:                                       ; preds = %while.cond.2
  br label %laz.exit.3

laz.exit.3:                                       ; preds = %laz.else.3, %laz.then.3
  %48 = phi i1 [ %47, %laz.then.3 ], [ false, %laz.else.3 ]
  br i1 %48, label %laz.then.4, label %laz.else.4

laz.then.4:                                       ; preds = %laz.exit.3
  %49 = load ptr, ptr %1, align 8
  %50 = getelementptr %StringProcessor, ptr %49, i32 0, i32 0
  %51 = load i32, ptr %3, align 4
  %52 = load i32, ptr %2, align 4
  %53 = add i32 %51, %52
  %54 = getelementptr [5000 x i32], ptr %50, i32 0, i32 %53
  %55 = load i32, ptr %54, align 4
  %56 = load ptr, ptr %1, align 8
  %57 = getelementptr %StringProcessor, ptr %56, i32 0, i32 0
  %58 = load i32, ptr %33, align 4
  %59 = load i32, ptr %2, align 4
  %60 = add i32 %58, %59
  %61 = getelementptr [5000 x i32], ptr %57, i32 0, i32 %60
  %62 = load i32, ptr %61, align 4
  %63 = icmp eq i32 %55, %62
  br label %laz.exit.4

laz.else.4:                                       ; preds = %laz.exit.3
  br label %laz.exit.4

laz.exit.4:                                       ; preds = %laz.else.4, %laz.then.4
  %64 = phi i1 [ %63, %laz.then.4 ], [ false, %laz.else.4 ]
  br i1 %64, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %laz.exit.4
  %65 = load i32, ptr %2, align 4
  %66 = add i32 %65, 1
  store i32 %66, ptr %2, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %laz.exit.4
  %67 = load ptr, ptr %1, align 8
  %68 = getelementptr %StringProcessor, ptr %67, i32 0, i32 6
  %69 = load ptr, ptr %1, align 8
  %70 = getelementptr %StringProcessor, ptr %69, i32 0, i32 7
  %71 = load i32, ptr %3, align 4
  %72 = getelementptr [5000 x i32], ptr %70, i32 0, i32 %71
  %73 = load i32, ptr %72, align 4
  %74 = getelementptr [5000 x i32], ptr %68, i32 0, i32 %73
  %75 = load i32, ptr %2, align 4
  store i32 %75, ptr %74, align 4
  %76 = load i32, ptr %2, align 4
  %77 = alloca i32, align 4
  store i32 0, ptr %77, align 4
  %78 = load i32, ptr %77, align 4
  %79 = icmp sgt i32 %76, %78
  br i1 %79, label %if.then.5, label %if.else.5

if.then.5:                                        ; preds = %while.exit.2
  %80 = load i32, ptr %2, align 4
  %81 = sub i32 %80, 1
  store i32 %81, ptr %2, align 4
  br label %if.exit.5

if.else.5:                                        ; preds = %while.exit.2
  br label %if.exit.5

if.exit.5:                                        ; preds = %if.else.5, %if.then.5
  %82 = load i32, ptr %3, align 4
  %83 = add i32 %82, 1
  store i32 %83, ptr %3, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  ret void
}

define void @_14su0eKxQra_preprocess_kmp(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 3
  %6 = load i32, ptr %3, align 4
  %7 = getelementptr [50 x i32], ptr %5, i32 0, i32 %6
  %8 = load i32, ptr %7, align 4
  %9 = alloca i32, align 4
  store i32 %8, ptr %9, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %10, align 4
  %11 = alloca i32, align 4
  store i32 1, ptr %11, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr %StringProcessor, ptr %12, i32 0, i32 8
  %14 = alloca i32, align 4
  store i32 0, ptr %14, align 4
  %15 = load i32, ptr %14, align 4
  %16 = getelementptr [200 x i32], ptr %13, i32 0, i32 %15
  %17 = alloca i32, align 4
  store i32 0, ptr %17, align 4
  %18 = load i32, ptr %17, align 4
  store i32 %18, ptr %16, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %if.exit.1, %entry
  %19 = load i32, ptr %11, align 4
  %20 = load i32, ptr %9, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr %StringProcessor, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %3, align 4
  %25 = getelementptr [50 x [200 x i32]], ptr %23, i32 0, i32 %24
  %26 = load i32, ptr %11, align 4
  %27 = getelementptr [200 x i32], ptr %25, i32 0, i32 %26
  %28 = load i32, ptr %27, align 4
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr %StringProcessor, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %3, align 4
  %32 = getelementptr [50 x [200 x i32]], ptr %30, i32 0, i32 %31
  %33 = load i32, ptr %10, align 4
  %34 = getelementptr [200 x i32], ptr %32, i32 0, i32 %33
  %35 = load i32, ptr %34, align 4
  %36 = icmp eq i32 %28, %35
  br i1 %36, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.body.0
  %37 = load i32, ptr %10, align 4
  %38 = add i32 %37, 1
  store i32 %38, ptr %10, align 4
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr %StringProcessor, ptr %39, i32 0, i32 8
  %41 = load i32, ptr %11, align 4
  %42 = getelementptr [200 x i32], ptr %40, i32 0, i32 %41
  %43 = load i32, ptr %10, align 4
  store i32 %43, ptr %42, align 4
  %44 = load i32, ptr %11, align 4
  %45 = add i32 %44, 1
  store i32 %45, ptr %11, align 4
  br label %if.exit.1

if.else.1:                                        ; preds = %while.body.0
  %46 = load i32, ptr %10, align 4
  %47 = alloca i32, align 4
  store i32 0, ptr %47, align 4
  %48 = load i32, ptr %47, align 4
  %49 = icmp ne i32 %46, %48
  br i1 %49, label %if.then.2, label %if.else.2

if.then.2:                                        ; preds = %if.else.1
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr %StringProcessor, ptr %50, i32 0, i32 8
  %52 = load i32, ptr %10, align 4
  %53 = sub i32 %52, 1
  %54 = getelementptr [200 x i32], ptr %51, i32 0, i32 %53
  %55 = load i32, ptr %54, align 4
  store i32 %55, ptr %10, align 4
  br label %if.exit.2

if.else.2:                                        ; preds = %if.else.1
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr %StringProcessor, ptr %56, i32 0, i32 8
  %58 = load i32, ptr %11, align 4
  %59 = getelementptr [200 x i32], ptr %57, i32 0, i32 %58
  %60 = alloca i32, align 4
  store i32 0, ptr %60, align 4
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %59, align 4
  %62 = load i32, ptr %11, align 4
  %63 = add i32 %62, 1
  store i32 %63, ptr %11, align 4
  br label %if.exit.2

if.exit.2:                                        ; preds = %if.else.2, %if.then.2
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.exit.2, %if.then.1
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  ret void
}

define void @_14su0eKxQra_preprocess_boyer_moore(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 3
  %6 = load i32, ptr %3, align 4
  %7 = getelementptr [50 x i32], ptr %5, i32 0, i32 %6
  %8 = load i32, ptr %7, align 4
  %9 = alloca i32, align 4
  store i32 %8, ptr %9, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %10, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %11 = load i32, ptr %10, align 4
  %12 = alloca i32, align 4
  store i32 256, ptr %12, align 4
  %13 = load i32, ptr %12, align 4
  %14 = icmp slt i32 %11, %13
  br i1 %14, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr %StringProcessor, ptr %15, i32 0, i32 9
  %17 = load i32, ptr %10, align 4
  %18 = getelementptr [256 x i32], ptr %16, i32 0, i32 %17
  %19 = alloca i32, align 4
  store i32 1, ptr %19, align 4
  %20 = load i32, ptr %19, align 4
  %21 = sub i32 0, %20
  store i32 %21, ptr %18, align 4
  %22 = load i32, ptr %10, align 4
  %23 = add i32 %22, 1
  store i32 %23, ptr %10, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %24 = alloca i32, align 4
  store i32 0, ptr %24, align 4
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %10, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %if.exit.2, %while.exit.0
  %26 = load i32, ptr %10, align 4
  %27 = load i32, ptr %9, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr %StringProcessor, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %3, align 4
  %32 = getelementptr [50 x [200 x i32]], ptr %30, i32 0, i32 %31
  %33 = load i32, ptr %10, align 4
  %34 = getelementptr [200 x i32], ptr %32, i32 0, i32 %33
  %35 = load i32, ptr %34, align 4
  %36 = alloca i32, align 4
  store i32 %35, ptr %36, align 4
  %37 = load i32, ptr %36, align 4
  %38 = alloca i32, align 4
  store i32 0, ptr %38, align 4
  %39 = load i32, ptr %38, align 4
  %40 = icmp sge i32 %37, %39
  br i1 %40, label %laz.then.3, label %laz.else.3

laz.then.3:                                       ; preds = %while.body.1
  %41 = load i32, ptr %36, align 4
  %42 = alloca i32, align 4
  store i32 256, ptr %42, align 4
  %43 = load i32, ptr %42, align 4
  %44 = icmp slt i32 %41, %43
  br label %laz.exit.3

laz.else.3:                                       ; preds = %while.body.1
  br label %laz.exit.3

laz.exit.3:                                       ; preds = %laz.else.3, %laz.then.3
  %45 = phi i1 [ %44, %laz.then.3 ], [ false, %laz.else.3 ]
  br i1 %45, label %if.then.2, label %if.else.2

if.then.2:                                        ; preds = %laz.exit.3
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr %StringProcessor, ptr %46, i32 0, i32 9
  %48 = load i32, ptr %36, align 4
  %49 = getelementptr [256 x i32], ptr %47, i32 0, i32 %48
  %50 = load i32, ptr %10, align 4
  store i32 %50, ptr %49, align 4
  br label %if.exit.2

if.else.2:                                        ; preds = %laz.exit.3
  br label %if.exit.2

if.exit.2:                                        ; preds = %if.else.2, %if.then.2
  %51 = load i32, ptr %10, align 4
  %52 = add i32 %51, 1
  store i32 %52, ptr %10, align 4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %53 = alloca i32, align 4
  store i32 0, ptr %53, align 4
  %54 = load i32, ptr %53, align 4
  store i32 %54, ptr %10, align 4
  br label %while.cond.4

while.cond.4:                                     ; preds = %while.body.4, %while.exit.1
  %55 = load i32, ptr %10, align 4
  %56 = load i32, ptr %9, align 4
  %57 = icmp slt i32 %55, %56
  br i1 %57, label %while.body.4, label %while.exit.4

while.body.4:                                     ; preds = %while.cond.4
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr %StringProcessor, ptr %58, i32 0, i32 10
  %60 = load i32, ptr %10, align 4
  %61 = getelementptr [200 x i32], ptr %59, i32 0, i32 %60
  %62 = load i32, ptr %9, align 4
  store i32 %62, ptr %61, align 4
  %63 = load i32, ptr %10, align 4
  %64 = add i32 %63, 1
  store i32 %64, ptr %10, align 4
  br label %while.cond.4

while.exit.4:                                     ; preds = %while.cond.4
  ret void
}

define void @_14su0eKxQra_compute_pattern_hash(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 3
  %6 = load i32, ptr %3, align 4
  %7 = getelementptr [50 x i32], ptr %5, i32 0, i32 %6
  %8 = load i32, ptr %7, align 4
  %9 = alloca i32, align 4
  store i32 %8, ptr %9, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %10, align 4
  %11 = alloca i32, align 4
  store i32 1, ptr %11, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %12, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %if.exit.1, %entry
  %13 = load i32, ptr %12, align 4
  %14 = load i32, ptr %9, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %16 = load i32, ptr %10, align 4
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr %StringProcessor, ptr %17, i32 0, i32 2
  %19 = load i32, ptr %3, align 4
  %20 = getelementptr [50 x [200 x i32]], ptr %18, i32 0, i32 %19
  %21 = load i32, ptr %12, align 4
  %22 = getelementptr [200 x i32], ptr %20, i32 0, i32 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %11, align 4
  %25 = mul i32 %23, %24
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr %StringProcessor, ptr %26, i32 0, i32 14
  %28 = load i32, ptr %27, align 4
  %29 = srem i32 %25, %28
  %30 = add i32 %16, %29
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr %StringProcessor, ptr %31, i32 0, i32 14
  %33 = load i32, ptr %32, align 4
  %34 = srem i32 %30, %33
  store i32 %34, ptr %10, align 4
  %35 = load i32, ptr %12, align 4
  %36 = load i32, ptr %9, align 4
  %37 = sub i32 %36, 1
  %38 = icmp slt i32 %35, %37
  br i1 %38, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.body.0
  %39 = load i32, ptr %11, align 4
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr %StringProcessor, ptr %40, i32 0, i32 13
  %42 = load i32, ptr %41, align 4
  %43 = mul i32 %39, %42
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr %StringProcessor, ptr %44, i32 0, i32 14
  %46 = load i32, ptr %45, align 4
  %47 = srem i32 %43, %46
  store i32 %47, ptr %11, align 4
  br label %if.exit.1

if.else.1:                                        ; preds = %while.body.0
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.else.1, %if.then.1
  %48 = load i32, ptr %12, align 4
  %49 = add i32 %48, 1
  store i32 %49, ptr %12, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr %StringProcessor, ptr %50, i32 0, i32 11
  %52 = load i32, ptr %3, align 4
  %53 = getelementptr [50 x i32], ptr %51, i32 0, i32 %52
  %54 = load i32, ptr %10, align 4
  store i32 %54, ptr %53, align 4
  ret void
}

define void @_14su0eKxQra_prepare_rabin_karp_hashes(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr %StringProcessor, ptr %2, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %5, align 4
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %4, %6
  br i1 %7, label %if.then.0, label %if.else.0

if.then.0:                                        ; preds = %entry
  ret void

if.else.0:                                        ; preds = %entry
  br label %if.exit.0

if.exit.0:                                        ; preds = %if.else.0
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr %StringProcessor, ptr %8, i32 0, i32 12
  %10 = alloca i32, align 4
  store i32 0, ptr %10, align 4
  %11 = load i32, ptr %10, align 4
  %12 = getelementptr [5000 x i32], ptr %9, i32 0, i32 %11
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr %StringProcessor, ptr %13, i32 0, i32 0
  %15 = alloca i32, align 4
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr %15, align 4
  %17 = getelementptr [5000 x i32], ptr %14, i32 0, i32 %16
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %1, align 8
  %20 = getelementptr %StringProcessor, ptr %19, i32 0, i32 14
  %21 = load i32, ptr %20, align 4
  %22 = srem i32 %18, %21
  store i32 %22, ptr %12, align 4
  %23 = alloca i32, align 4
  store i32 1, ptr %23, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %if.exit.0
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %1, align 8
  %26 = getelementptr %StringProcessor, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = icmp slt i32 %24, %27
  br i1 %28, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %29 = load ptr, ptr %1, align 8
  %30 = getelementptr %StringProcessor, ptr %29, i32 0, i32 12
  %31 = load i32, ptr %23, align 4
  %32 = getelementptr [5000 x i32], ptr %30, i32 0, i32 %31
  %33 = load ptr, ptr %1, align 8
  %34 = getelementptr %StringProcessor, ptr %33, i32 0, i32 12
  %35 = load i32, ptr %23, align 4
  %36 = sub i32 %35, 1
  %37 = getelementptr [5000 x i32], ptr %34, i32 0, i32 %36
  %38 = load i32, ptr %37, align 4
  %39 = load ptr, ptr %1, align 8
  %40 = getelementptr %StringProcessor, ptr %39, i32 0, i32 14
  %41 = load i32, ptr %40, align 4
  %42 = srem i32 %38, %41
  %43 = load ptr, ptr %1, align 8
  %44 = getelementptr %StringProcessor, ptr %43, i32 0, i32 13
  %45 = load i32, ptr %44, align 4
  %46 = mul i32 %42, %45
  %47 = load ptr, ptr %1, align 8
  %48 = getelementptr %StringProcessor, ptr %47, i32 0, i32 14
  %49 = load i32, ptr %48, align 4
  %50 = srem i32 %46, %49
  %51 = load ptr, ptr %1, align 8
  %52 = getelementptr %StringProcessor, ptr %51, i32 0, i32 0
  %53 = load i32, ptr %23, align 4
  %54 = getelementptr [5000 x i32], ptr %52, i32 0, i32 %53
  %55 = load i32, ptr %54, align 4
  %56 = load ptr, ptr %1, align 8
  %57 = getelementptr %StringProcessor, ptr %56, i32 0, i32 14
  %58 = load i32, ptr %57, align 4
  %59 = srem i32 %55, %58
  %60 = add i32 %50, %59
  %61 = load ptr, ptr %1, align 8
  %62 = getelementptr %StringProcessor, ptr %61, i32 0, i32 14
  %63 = load i32, ptr %62, align 4
  %64 = srem i32 %60, %63
  store i32 %64, ptr %32, align 4
  %65 = load i32, ptr %23, align 4
  %66 = add i32 %65, 1
  store i32 %66, ptr %23, align 4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  ret void
}

define void @_14su0eKxQra_kmp_search(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 3
  %6 = load i32, ptr %3, align 4
  %7 = getelementptr [50 x i32], ptr %5, i32 0, i32 %6
  %8 = load i32, ptr %7, align 4
  %9 = alloca i32, align 4
  store i32 %8, ptr %9, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr %StringProcessor, ptr %10, i32 0, i32 24
  %12 = load i32, ptr %3, align 4
  %13 = getelementptr [50 x i32], ptr %11, i32 0, i32 %12
  %14 = alloca i32, align 4
  store i32 0, ptr %14, align 4
  %15 = load i32, ptr %14, align 4
  store i32 %15, ptr %13, align 4
  %16 = load i32, ptr %9, align 4
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr %StringProcessor, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = icmp sgt i32 %16, %19
  br i1 %20, label %if.then.0, label %if.else.0

if.then.0:                                        ; preds = %entry
  ret void

if.else.0:                                        ; preds = %entry
  br label %if.exit.0

if.exit.0:                                        ; preds = %if.else.0
  %21 = alloca i32, align 4
  store i32 0, ptr %21, align 4
  %22 = alloca i32, align 4
  store i32 0, ptr %22, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %if.exit.3, %if.exit.0
  %23 = load i32, ptr %21, align 4
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr %StringProcessor, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr %StringProcessor, ptr %28, i32 0, i32 26
  %30 = load i32, ptr %29, align 4
  %31 = add i32 %30, 1
  store i32 %31, ptr %29, align 4
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr %StringProcessor, ptr %32, i32 0, i32 2
  %34 = load i32, ptr %3, align 4
  %35 = getelementptr [50 x [200 x i32]], ptr %33, i32 0, i32 %34
  %36 = load i32, ptr %22, align 4
  %37 = getelementptr [200 x i32], ptr %35, i32 0, i32 %36
  %38 = load i32, ptr %37, align 4
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr %StringProcessor, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %21, align 4
  %42 = getelementptr [5000 x i32], ptr %40, i32 0, i32 %41
  %43 = load i32, ptr %42, align 4
  %44 = icmp eq i32 %38, %43
  br i1 %44, label %if.then.2, label %if.else.2

if.then.2:                                        ; preds = %while.body.1
  %45 = load i32, ptr %21, align 4
  %46 = add i32 %45, 1
  store i32 %46, ptr %21, align 4
  %47 = load i32, ptr %22, align 4
  %48 = add i32 %47, 1
  store i32 %48, ptr %22, align 4
  br label %if.exit.2

if.else.2:                                        ; preds = %while.body.1
  br label %if.exit.2

if.exit.2:                                        ; preds = %if.else.2, %if.then.2
  %49 = load i32, ptr %22, align 4
  %50 = load i32, ptr %9, align 4
  %51 = icmp eq i32 %49, %50
  br i1 %51, label %if.then.3, label %if.else.3

if.then.3:                                        ; preds = %if.exit.2
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr %StringProcessor, ptr %52, i32 0, i32 24
  %54 = load i32, ptr %3, align 4
  %55 = getelementptr [50 x i32], ptr %53, i32 0, i32 %54
  %56 = load i32, ptr %55, align 4
  %57 = alloca i32, align 4
  store i32 100, ptr %57, align 4
  %58 = load i32, ptr %57, align 4
  %59 = icmp slt i32 %56, %58
  br i1 %59, label %if.then.4, label %if.else.4

if.then.4:                                        ; preds = %if.then.3
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr %StringProcessor, ptr %60, i32 0, i32 23
  %62 = load i32, ptr %3, align 4
  %63 = getelementptr [50 x [100 x i32]], ptr %61, i32 0, i32 %62
  %64 = load ptr, ptr %2, align 8
  %65 = getelementptr %StringProcessor, ptr %64, i32 0, i32 24
  %66 = load i32, ptr %3, align 4
  %67 = getelementptr [50 x i32], ptr %65, i32 0, i32 %66
  %68 = load i32, ptr %67, align 4
  %69 = getelementptr [100 x i32], ptr %63, i32 0, i32 %68
  %70 = load i32, ptr %21, align 4
  %71 = load i32, ptr %22, align 4
  %72 = sub i32 %70, %71
  store i32 %72, ptr %69, align 4
  br label %if.exit.4

if.else.4:                                        ; preds = %if.then.3
  br label %if.exit.4

if.exit.4:                                        ; preds = %if.else.4, %if.then.4
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr %StringProcessor, ptr %73, i32 0, i32 24
  %75 = load i32, ptr %3, align 4
  %76 = getelementptr [50 x i32], ptr %74, i32 0, i32 %75
  %77 = load i32, ptr %76, align 4
  %78 = add i32 %77, 1
  store i32 %78, ptr %76, align 4
  %79 = load ptr, ptr %2, align 8
  %80 = getelementptr %StringProcessor, ptr %79, i32 0, i32 8
  %81 = load i32, ptr %22, align 4
  %82 = sub i32 %81, 1
  %83 = getelementptr [200 x i32], ptr %80, i32 0, i32 %82
  %84 = load i32, ptr %83, align 4
  store i32 %84, ptr %22, align 4
  br label %if.exit.3

if.else.3:                                        ; preds = %if.exit.2
  %85 = load i32, ptr %21, align 4
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr %StringProcessor, ptr %86, i32 0, i32 1
  %88 = load i32, ptr %87, align 4
  %89 = icmp slt i32 %85, %88
  br i1 %89, label %laz.then.6, label %laz.else.6

laz.then.6:                                       ; preds = %if.else.3
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr %StringProcessor, ptr %90, i32 0, i32 2
  %92 = load i32, ptr %3, align 4
  %93 = getelementptr [50 x [200 x i32]], ptr %91, i32 0, i32 %92
  %94 = load i32, ptr %22, align 4
  %95 = getelementptr [200 x i32], ptr %93, i32 0, i32 %94
  %96 = load i32, ptr %95, align 4
  %97 = load ptr, ptr %2, align 8
  %98 = getelementptr %StringProcessor, ptr %97, i32 0, i32 0
  %99 = load i32, ptr %21, align 4
  %100 = getelementptr [5000 x i32], ptr %98, i32 0, i32 %99
  %101 = load i32, ptr %100, align 4
  %102 = icmp ne i32 %96, %101
  br label %laz.exit.6

laz.else.6:                                       ; preds = %if.else.3
  br label %laz.exit.6

laz.exit.6:                                       ; preds = %laz.else.6, %laz.then.6
  %103 = phi i1 [ %102, %laz.then.6 ], [ false, %laz.else.6 ]
  br i1 %103, label %if.then.5, label %if.else.5

if.then.5:                                        ; preds = %laz.exit.6
  %104 = load i32, ptr %22, align 4
  %105 = alloca i32, align 4
  store i32 0, ptr %105, align 4
  %106 = load i32, ptr %105, align 4
  %107 = icmp ne i32 %104, %106
  br i1 %107, label %if.then.7, label %if.else.7

if.then.7:                                        ; preds = %if.then.5
  %108 = load ptr, ptr %2, align 8
  %109 = getelementptr %StringProcessor, ptr %108, i32 0, i32 8
  %110 = load i32, ptr %22, align 4
  %111 = sub i32 %110, 1
  %112 = getelementptr [200 x i32], ptr %109, i32 0, i32 %111
  %113 = load i32, ptr %112, align 4
  store i32 %113, ptr %22, align 4
  br label %if.exit.7

if.else.7:                                        ; preds = %if.then.5
  %114 = load i32, ptr %21, align 4
  %115 = add i32 %114, 1
  store i32 %115, ptr %21, align 4
  br label %if.exit.7

if.exit.7:                                        ; preds = %if.else.7, %if.then.7
  br label %if.exit.5

if.else.5:                                        ; preds = %laz.exit.6
  br label %if.exit.5

if.exit.5:                                        ; preds = %if.else.5, %if.exit.7
  br label %if.exit.3

if.exit.3:                                        ; preds = %if.exit.5, %if.exit.4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  ret void
}

define void @_14su0eKxQra_boyer_moore_search(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 3
  %6 = load i32, ptr %3, align 4
  %7 = getelementptr [50 x i32], ptr %5, i32 0, i32 %6
  %8 = load i32, ptr %7, align 4
  %9 = alloca i32, align 4
  store i32 %8, ptr %9, align 4
  %10 = alloca i32, align 4
  store i32 0, ptr %10, align 4
  %11 = load i32, ptr %9, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr %StringProcessor, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = icmp sgt i32 %11, %14
  br i1 %15, label %if.then.0, label %if.else.0

if.then.0:                                        ; preds = %entry
  ret void

if.else.0:                                        ; preds = %entry
  br label %if.exit.0

if.exit.0:                                        ; preds = %if.else.0
  %16 = alloca i32, align 4
  store i32 0, ptr %16, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %if.exit.4, %if.exit.0
  %17 = load i32, ptr %16, align 4
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr %StringProcessor, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = load i32, ptr %9, align 4
  %22 = sub i32 %20, %21
  %23 = icmp sle i32 %17, %22
  br i1 %23, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %24 = load i32, ptr %9, align 4
  %25 = sub i32 %24, 1
  %26 = alloca i32, align 4
  store i32 %25, ptr %26, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %while.body.1
  %27 = load i32, ptr %26, align 4
  %28 = alloca i32, align 4
  store i32 0, ptr %28, align 4
  %29 = load i32, ptr %28, align 4
  %30 = icmp sge i32 %27, %29
  br i1 %30, label %laz.then.3, label %laz.else.3

laz.then.3:                                       ; preds = %while.cond.2
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr %StringProcessor, ptr %31, i32 0, i32 2
  %33 = load i32, ptr %3, align 4
  %34 = getelementptr [50 x [200 x i32]], ptr %32, i32 0, i32 %33
  %35 = load i32, ptr %26, align 4
  %36 = getelementptr [200 x i32], ptr %34, i32 0, i32 %35
  %37 = load i32, ptr %36, align 4
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr %StringProcessor, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %16, align 4
  %41 = load i32, ptr %26, align 4
  %42 = add i32 %40, %41
  %43 = getelementptr [5000 x i32], ptr %39, i32 0, i32 %42
  %44 = load i32, ptr %43, align 4
  %45 = icmp eq i32 %37, %44
  br label %laz.exit.3

laz.else.3:                                       ; preds = %while.cond.2
  br label %laz.exit.3

laz.exit.3:                                       ; preds = %laz.else.3, %laz.then.3
  %46 = phi i1 [ %45, %laz.then.3 ], [ false, %laz.else.3 ]
  br i1 %46, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %laz.exit.3
  %47 = load i32, ptr %26, align 4
  %48 = sub i32 %47, 1
  store i32 %48, ptr %26, align 4
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr %StringProcessor, ptr %49, i32 0, i32 26
  %51 = load i32, ptr %50, align 4
  %52 = add i32 %51, 1
  store i32 %52, ptr %50, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %laz.exit.3
  %53 = load i32, ptr %26, align 4
  %54 = alloca i32, align 4
  store i32 0, ptr %54, align 4
  %55 = load i32, ptr %54, align 4
  %56 = icmp slt i32 %53, %55
  br i1 %56, label %if.then.4, label %if.else.4

if.then.4:                                        ; preds = %while.exit.2
  %57 = load i32, ptr %10, align 4
  %58 = add i32 %57, 1
  store i32 %58, ptr %10, align 4
  %59 = load i32, ptr %16, align 4
  %60 = load i32, ptr %16, align 4
  %61 = load i32, ptr %9, align 4
  %62 = add i32 %60, %61
  %63 = load ptr, ptr %2, align 8
  %64 = getelementptr %StringProcessor, ptr %63, i32 0, i32 1
  %65 = load i32, ptr %64, align 4
  %66 = icmp slt i32 %62, %65
  br i1 %66, label %if.then.5, label %if.else.5

if.then.5:                                        ; preds = %if.then.4
  %67 = load i32, ptr %9, align 4
  br label %if.exit.5

if.else.5:                                        ; preds = %if.then.4
  %68 = alloca i32, align 4
  store i32 1, ptr %68, align 4
  %69 = load i32, ptr %68, align 4
  br label %if.exit.5

if.exit.5:                                        ; preds = %if.else.5, %if.then.5
  %70 = phi i32 [ %67, %if.then.5 ], [ %69, %if.else.5 ]
  %71 = add i32 %59, %70
  store i32 %71, ptr %16, align 4
  br label %if.exit.4

if.else.4:                                        ; preds = %while.exit.2
  %72 = load i32, ptr %26, align 4
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr %StringProcessor, ptr %73, i32 0, i32 9
  %75 = load ptr, ptr %2, align 8
  %76 = getelementptr %StringProcessor, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %16, align 4
  %78 = load i32, ptr %26, align 4
  %79 = add i32 %77, %78
  %80 = getelementptr [5000 x i32], ptr %76, i32 0, i32 %79
  %81 = load i32, ptr %80, align 4
  %82 = getelementptr [256 x i32], ptr %74, i32 0, i32 %81
  %83 = load i32, ptr %82, align 4
  %84 = sub i32 %72, %83
  %85 = alloca i32, align 4
  store i32 %84, ptr %85, align 4
  %86 = load i32, ptr %16, align 4
  %87 = load i32, ptr %85, align 4
  %88 = alloca i32, align 4
  store i32 1, ptr %88, align 4
  %89 = load i32, ptr %88, align 4
  %90 = icmp sgt i32 %87, %89
  br i1 %90, label %if.then.6, label %if.else.6

if.then.6:                                        ; preds = %if.else.4
  %91 = load i32, ptr %85, align 4
  br label %if.exit.6

if.else.6:                                        ; preds = %if.else.4
  %92 = alloca i32, align 4
  store i32 1, ptr %92, align 4
  %93 = load i32, ptr %92, align 4
  br label %if.exit.6

if.exit.6:                                        ; preds = %if.else.6, %if.then.6
  %94 = phi i32 [ %91, %if.then.6 ], [ %93, %if.else.6 ]
  %95 = add i32 %86, %94
  store i32 %95, ptr %16, align 4
  %96 = load ptr, ptr %2, align 8
  %97 = getelementptr %StringProcessor, ptr %96, i32 0, i32 26
  %98 = load i32, ptr %97, align 4
  %99 = add i32 %98, 1
  store i32 %99, ptr %97, align 4
  br label %if.exit.4

if.exit.4:                                        ; preds = %if.exit.6, %if.exit.5
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %100 = load ptr, ptr %2, align 8
  %101 = getelementptr %StringProcessor, ptr %100, i32 0, i32 25
  %102 = alloca i32, align 4
  store i32 1, ptr %102, align 4
  %103 = load i32, ptr %102, align 4
  %104 = getelementptr [10 x i32], ptr %101, i32 0, i32 %103
  %105 = load i32, ptr %10, align 4
  store i32 %105, ptr %104, align 4
  ret void
}

define void @_14su0eKxQra_rabin_karp_search(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 3
  %6 = load i32, ptr %3, align 4
  %7 = getelementptr [50 x i32], ptr %5, i32 0, i32 %6
  %8 = load i32, ptr %7, align 4
  %9 = alloca i32, align 4
  store i32 %8, ptr %9, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr %StringProcessor, ptr %10, i32 0, i32 11
  %12 = load i32, ptr %3, align 4
  %13 = getelementptr [50 x i32], ptr %11, i32 0, i32 %12
  %14 = load i32, ptr %13, align 4
  %15 = alloca i32, align 4
  store i32 %14, ptr %15, align 4
  %16 = alloca i32, align 4
  store i32 0, ptr %16, align 4
  %17 = load i32, ptr %9, align 4
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr %StringProcessor, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = icmp sgt i32 %17, %20
  br i1 %21, label %if.then.0, label %if.else.0

if.then.0:                                        ; preds = %entry
  ret void

if.else.0:                                        ; preds = %entry
  br label %if.exit.0

if.exit.0:                                        ; preds = %if.else.0
  %22 = alloca i32, align 4
  store i32 0, ptr %22, align 4
  %23 = alloca i32, align 4
  store i32 1, ptr %23, align 4
  %24 = alloca i32, align 4
  store i32 0, ptr %24, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %if.exit.2, %if.exit.0
  %25 = load i32, ptr %24, align 4
  %26 = load i32, ptr %9, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %28 = load i32, ptr %22, align 4
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr %StringProcessor, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %24, align 4
  %32 = getelementptr [5000 x i32], ptr %30, i32 0, i32 %31
  %33 = load i32, ptr %32, align 4
  %34 = load i32, ptr %23, align 4
  %35 = mul i32 %33, %34
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr %StringProcessor, ptr %36, i32 0, i32 14
  %38 = load i32, ptr %37, align 4
  %39 = srem i32 %35, %38
  %40 = add i32 %28, %39
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr %StringProcessor, ptr %41, i32 0, i32 14
  %43 = load i32, ptr %42, align 4
  %44 = srem i32 %40, %43
  store i32 %44, ptr %22, align 4
  %45 = load i32, ptr %24, align 4
  %46 = load i32, ptr %9, align 4
  %47 = sub i32 %46, 1
  %48 = icmp slt i32 %45, %47
  br i1 %48, label %if.then.2, label %if.else.2

if.then.2:                                        ; preds = %while.body.1
  %49 = load i32, ptr %23, align 4
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr %StringProcessor, ptr %50, i32 0, i32 13
  %52 = load i32, ptr %51, align 4
  %53 = mul i32 %49, %52
  %54 = load ptr, ptr %2, align 8
  %55 = getelementptr %StringProcessor, ptr %54, i32 0, i32 14
  %56 = load i32, ptr %55, align 4
  %57 = srem i32 %53, %56
  store i32 %57, ptr %23, align 4
  br label %if.exit.2

if.else.2:                                        ; preds = %while.body.1
  br label %if.exit.2

if.exit.2:                                        ; preds = %if.else.2, %if.then.2
  %58 = load i32, ptr %24, align 4
  %59 = add i32 %58, 1
  store i32 %59, ptr %24, align 4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %60 = load i32, ptr %22, align 4
  %61 = load i32, ptr %15, align 4
  %62 = icmp eq i32 %60, %61
  br i1 %62, label %if.then.3, label %if.else.3

if.then.3:                                        ; preds = %while.exit.1
  %63 = alloca i32, align 4
  store i32 0, ptr %63, align 4
  %64 = load i32, ptr %63, align 4
  %65 = load i32, ptr %3, align 4
  %66 = load ptr, ptr %2, align 8
  %67 = call i1 @_14su0eKxQra_verify_match(ptr %66, i32 %64, i32 %65)
  br i1 %67, label %if.then.4, label %if.else.4

if.then.4:                                        ; preds = %if.then.3
  %68 = load i32, ptr %16, align 4
  %69 = add i32 %68, 1
  store i32 %69, ptr %16, align 4
  br label %if.exit.4

if.else.4:                                        ; preds = %if.then.3
  %70 = load ptr, ptr %2, align 8
  %71 = getelementptr %StringProcessor, ptr %70, i32 0, i32 27
  %72 = load i32, ptr %71, align 4
  %73 = add i32 %72, 1
  store i32 %73, ptr %71, align 4
  br label %if.exit.4

if.exit.4:                                        ; preds = %if.else.4, %if.then.4
  br label %if.exit.3

if.else.3:                                        ; preds = %while.exit.1
  br label %if.exit.3

if.exit.3:                                        ; preds = %if.else.3, %if.exit.4
  %74 = load i32, ptr %9, align 4
  store i32 %74, ptr %24, align 4
  br label %while.cond.5

while.cond.5:                                     ; preds = %if.exit.6, %if.exit.3
  %75 = load i32, ptr %24, align 4
  %76 = load ptr, ptr %2, align 8
  %77 = getelementptr %StringProcessor, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %77, align 4
  %79 = icmp slt i32 %75, %78
  br i1 %79, label %while.body.5, label %while.exit.5

while.body.5:                                     ; preds = %while.cond.5
  %80 = load i32, ptr %22, align 4
  %81 = load ptr, ptr %2, align 8
  %82 = getelementptr %StringProcessor, ptr %81, i32 0, i32 0
  %83 = load i32, ptr %24, align 4
  %84 = load i32, ptr %9, align 4
  %85 = sub i32 %83, %84
  %86 = getelementptr [5000 x i32], ptr %82, i32 0, i32 %85
  %87 = load i32, ptr %86, align 4
  %88 = load i32, ptr %23, align 4
  %89 = mul i32 %87, %88
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr %StringProcessor, ptr %90, i32 0, i32 14
  %92 = load i32, ptr %91, align 4
  %93 = srem i32 %89, %92
  %94 = sub i32 %80, %93
  %95 = load ptr, ptr %2, align 8
  %96 = getelementptr %StringProcessor, ptr %95, i32 0, i32 14
  %97 = load i32, ptr %96, align 4
  %98 = add i32 %94, %97
  %99 = load ptr, ptr %2, align 8
  %100 = getelementptr %StringProcessor, ptr %99, i32 0, i32 14
  %101 = load i32, ptr %100, align 4
  %102 = srem i32 %98, %101
  store i32 %102, ptr %22, align 4
  %103 = load i32, ptr %22, align 4
  %104 = load ptr, ptr %2, align 8
  %105 = getelementptr %StringProcessor, ptr %104, i32 0, i32 13
  %106 = load i32, ptr %105, align 4
  %107 = mul i32 %103, %106
  %108 = load ptr, ptr %2, align 8
  %109 = getelementptr %StringProcessor, ptr %108, i32 0, i32 0
  %110 = load i32, ptr %24, align 4
  %111 = getelementptr [5000 x i32], ptr %109, i32 0, i32 %110
  %112 = load i32, ptr %111, align 4
  %113 = add i32 %107, %112
  %114 = load ptr, ptr %2, align 8
  %115 = getelementptr %StringProcessor, ptr %114, i32 0, i32 14
  %116 = load i32, ptr %115, align 4
  %117 = srem i32 %113, %116
  store i32 %117, ptr %22, align 4
  %118 = load i32, ptr %22, align 4
  %119 = load i32, ptr %15, align 4
  %120 = icmp eq i32 %118, %119
  br i1 %120, label %if.then.6, label %if.else.6

if.then.6:                                        ; preds = %while.body.5
  %121 = load i32, ptr %24, align 4
  %122 = load i32, ptr %9, align 4
  %123 = sub i32 %121, %122
  %124 = add i32 %123, 1
  %125 = load i32, ptr %3, align 4
  %126 = load ptr, ptr %2, align 8
  %127 = call i1 @_14su0eKxQra_verify_match(ptr %126, i32 %124, i32 %125)
  br i1 %127, label %if.then.7, label %if.else.7

if.then.7:                                        ; preds = %if.then.6
  %128 = load i32, ptr %16, align 4
  %129 = add i32 %128, 1
  store i32 %129, ptr %16, align 4
  br label %if.exit.7

if.else.7:                                        ; preds = %if.then.6
  %130 = load ptr, ptr %2, align 8
  %131 = getelementptr %StringProcessor, ptr %130, i32 0, i32 27
  %132 = load i32, ptr %131, align 4
  %133 = add i32 %132, 1
  store i32 %133, ptr %131, align 4
  br label %if.exit.7

if.exit.7:                                        ; preds = %if.else.7, %if.then.7
  br label %if.exit.6

if.else.6:                                        ; preds = %while.body.5
  br label %if.exit.6

if.exit.6:                                        ; preds = %if.else.6, %if.exit.7
  %134 = load i32, ptr %24, align 4
  %135 = add i32 %134, 1
  store i32 %135, ptr %24, align 4
  br label %while.cond.5

while.exit.5:                                     ; preds = %while.cond.5
  %136 = load ptr, ptr %2, align 8
  %137 = getelementptr %StringProcessor, ptr %136, i32 0, i32 25
  %138 = alloca i32, align 4
  store i32 2, ptr %138, align 4
  %139 = load i32, ptr %138, align 4
  %140 = getelementptr [10 x i32], ptr %137, i32 0, i32 %139
  %141 = load i32, ptr %16, align 4
  store i32 %141, ptr %140, align 4
  ret void
}

define i1 @_14su0eKxQra_verify_match(ptr %0, i32 %1, i32 %2) {
entry:
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = alloca i32, align 4
  store i32 %1, ptr %4, align 4
  %5 = alloca i32, align 4
  store i32 %2, ptr %5, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr %StringProcessor, ptr %6, i32 0, i32 3
  %8 = load i32, ptr %5, align 4
  %9 = getelementptr [50 x i32], ptr %7, i32 0, i32 %8
  %10 = load i32, ptr %9, align 4
  %11 = alloca i32, align 4
  store i32 %10, ptr %11, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %12, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %if.exit.1, %entry
  %13 = load i32, ptr %12, align 4
  %14 = load i32, ptr %11, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr %StringProcessor, ptr %16, i32 0, i32 26
  %18 = load i32, ptr %17, align 4
  %19 = add i32 %18, 1
  store i32 %19, ptr %17, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr %StringProcessor, ptr %20, i32 0, i32 0
  %22 = load i32, ptr %4, align 4
  %23 = load i32, ptr %12, align 4
  %24 = add i32 %22, %23
  %25 = getelementptr [5000 x i32], ptr %21, i32 0, i32 %24
  %26 = load i32, ptr %25, align 4
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr %StringProcessor, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %5, align 4
  %30 = getelementptr [50 x [200 x i32]], ptr %28, i32 0, i32 %29
  %31 = load i32, ptr %12, align 4
  %32 = getelementptr [200 x i32], ptr %30, i32 0, i32 %31
  %33 = load i32, ptr %32, align 4
  %34 = icmp ne i32 %26, %33
  br i1 %34, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.body.0
  %35 = alloca i1, align 1
  store i1 false, ptr %35, align 1
  %36 = load i1, ptr %35, align 1
  ret i1 %36

if.else.1:                                        ; preds = %while.body.0
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.else.1
  %37 = load i32, ptr %12, align 4
  %38 = add i32 %37, 1
  store i32 %38, ptr %12, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %39 = alloca i1, align 1
  store i1 true, ptr %39, align 1
  %40 = load i1, ptr %39, align 1
  ret i1 %40
}

define i32 @_14su0eKxQra_compute_edit_distance(ptr %0, i32 %1, i32 %2) {
entry:
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = alloca i32, align 4
  store i32 %1, ptr %4, align 4
  %5 = alloca i32, align 4
  store i32 %2, ptr %5, align 4
  %6 = alloca [500 x i32], align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = alloca i32, align 4
  store i32 500, ptr %9, align 4
  %10 = load i32, ptr %9, align 4
  %11 = alloca [500 x i32], align 4
  %12 = getelementptr [500 x i32], ptr %11, i32 0, i32 0
  %13 = alloca i32, align 4
  store i32 0, ptr %13, align 4
  br label %new.arr.cond.0

new.arr.cond.0:                                   ; preds = %new.arr.body.0, %entry
  %14 = load i32, ptr %13, align 4
  %15 = icmp slt i32 %14, 500
  br i1 %15, label %new.arr.body.0, label %new.arr.exit.0

new.arr.body.0:                                   ; preds = %new.arr.cond.0
  %16 = getelementptr i32, ptr %12, i32 %14
  %17 = alloca i32, align 4
  store i32 0, ptr %17, align 4
  %18 = load i32, ptr %17, align 4
  store i32 %8, ptr %16, align 4
  %19 = add i32 %14, 1
  store i32 %19, ptr %13, align 4
  br label %new.arr.cond.0

new.arr.exit.0:                                   ; preds = %new.arr.cond.0
  %20 = alloca [500 x i32], align 4
  %21 = alloca i32, align 4
  store i32 0, ptr %21, align 4
  %22 = load i32, ptr %21, align 4
  %23 = alloca i32, align 4
  store i32 500, ptr %23, align 4
  %24 = load i32, ptr %23, align 4
  %25 = alloca [500 x i32], align 4
  %26 = getelementptr [500 x i32], ptr %25, i32 0, i32 0
  %27 = alloca i32, align 4
  store i32 0, ptr %27, align 4
  br label %new.arr.cond.1

new.arr.cond.1:                                   ; preds = %new.arr.body.1, %new.arr.exit.0
  %28 = load i32, ptr %27, align 4
  %29 = icmp slt i32 %28, 500
  br i1 %29, label %new.arr.body.1, label %new.arr.exit.1

new.arr.body.1:                                   ; preds = %new.arr.cond.1
  %30 = getelementptr i32, ptr %26, i32 %28
  %31 = alloca i32, align 4
  store i32 0, ptr %31, align 4
  %32 = load i32, ptr %31, align 4
  store i32 %22, ptr %30, align 4
  %33 = add i32 %28, 1
  store i32 %33, ptr %27, align 4
  br label %new.arr.cond.1

new.arr.exit.1:                                   ; preds = %new.arr.cond.1
  %34 = alloca i32, align 4
  store i32 0, ptr %34, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %new.arr.exit.1
  %35 = load i32, ptr %34, align 4
  %36 = load i32, ptr %4, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %while.cond.2
  %38 = load i32, ptr %34, align 4
  %39 = getelementptr [500 x i32], ptr %11, i32 0, i32 %38
  %40 = call i32 @getInt()
  store i32 %40, ptr %39, align 4
  %41 = load i32, ptr %34, align 4
  %42 = add i32 %41, 1
  store i32 %42, ptr %34, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %while.cond.2
  %43 = alloca i32, align 4
  store i32 0, ptr %43, align 4
  %44 = load i32, ptr %43, align 4
  store i32 %44, ptr %34, align 4
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %while.exit.2
  %45 = load i32, ptr %34, align 4
  %46 = load i32, ptr %5, align 4
  %47 = icmp slt i32 %45, %46
  br i1 %47, label %while.body.3, label %while.exit.3

while.body.3:                                     ; preds = %while.cond.3
  %48 = load i32, ptr %34, align 4
  %49 = getelementptr [500 x i32], ptr %25, i32 0, i32 %48
  %50 = call i32 @getInt()
  store i32 %50, ptr %49, align 4
  %51 = load i32, ptr %34, align 4
  %52 = add i32 %51, 1
  store i32 %52, ptr %34, align 4
  br label %while.cond.3

while.exit.3:                                     ; preds = %while.cond.3
  %53 = alloca i32, align 4
  store i32 0, ptr %53, align 4
  %54 = load i32, ptr %53, align 4
  store i32 %54, ptr %34, align 4
  br label %while.cond.4

while.cond.4:                                     ; preds = %while.body.4, %while.exit.3
  %55 = load i32, ptr %34, align 4
  %56 = load i32, ptr %4, align 4
  %57 = icmp sle i32 %55, %56
  br i1 %57, label %while.body.4, label %while.exit.4

while.body.4:                                     ; preds = %while.cond.4
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr %StringProcessor, ptr %58, i32 0, i32 15
  %60 = load i32, ptr %34, align 4
  %61 = getelementptr [500 x [500 x i32]], ptr %59, i32 0, i32 %60
  %62 = alloca i32, align 4
  store i32 0, ptr %62, align 4
  %63 = load i32, ptr %62, align 4
  %64 = getelementptr [500 x i32], ptr %61, i32 0, i32 %63
  %65 = load i32, ptr %34, align 4
  store i32 %65, ptr %64, align 4
  %66 = load i32, ptr %34, align 4
  %67 = add i32 %66, 1
  store i32 %67, ptr %34, align 4
  br label %while.cond.4

while.exit.4:                                     ; preds = %while.cond.4
  %68 = alloca i32, align 4
  store i32 0, ptr %68, align 4
  br label %while.cond.5

while.cond.5:                                     ; preds = %while.body.5, %while.exit.4
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %5, align 4
  %71 = icmp sle i32 %69, %70
  br i1 %71, label %while.body.5, label %while.exit.5

while.body.5:                                     ; preds = %while.cond.5
  %72 = load ptr, ptr %3, align 8
  %73 = getelementptr %StringProcessor, ptr %72, i32 0, i32 15
  %74 = alloca i32, align 4
  store i32 0, ptr %74, align 4
  %75 = load i32, ptr %74, align 4
  %76 = getelementptr [500 x [500 x i32]], ptr %73, i32 0, i32 %75
  %77 = load i32, ptr %68, align 4
  %78 = getelementptr [500 x i32], ptr %76, i32 0, i32 %77
  %79 = load i32, ptr %68, align 4
  store i32 %79, ptr %78, align 4
  %80 = load i32, ptr %68, align 4
  %81 = add i32 %80, 1
  store i32 %81, ptr %68, align 4
  br label %while.cond.5

while.exit.5:                                     ; preds = %while.cond.5
  %82 = alloca i32, align 4
  store i32 1, ptr %82, align 4
  %83 = load i32, ptr %82, align 4
  store i32 %83, ptr %34, align 4
  br label %while.cond.6

while.cond.6:                                     ; preds = %while.exit.7, %while.exit.5
  %84 = load i32, ptr %34, align 4
  %85 = load i32, ptr %4, align 4
  %86 = icmp sle i32 %84, %85
  br i1 %86, label %while.body.6, label %while.exit.6

while.body.6:                                     ; preds = %while.cond.6
  %87 = alloca i32, align 4
  store i32 1, ptr %87, align 4
  %88 = load i32, ptr %87, align 4
  store i32 %88, ptr %68, align 4
  br label %while.cond.7

while.cond.7:                                     ; preds = %if.exit.8, %while.body.6
  %89 = load i32, ptr %68, align 4
  %90 = load i32, ptr %5, align 4
  %91 = icmp sle i32 %89, %90
  br i1 %91, label %while.body.7, label %while.exit.7

while.body.7:                                     ; preds = %while.cond.7
  %92 = load i32, ptr %34, align 4
  %93 = sub i32 %92, 1
  %94 = getelementptr [500 x i32], ptr %11, i32 0, i32 %93
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr %68, align 4
  %97 = sub i32 %96, 1
  %98 = getelementptr [500 x i32], ptr %25, i32 0, i32 %97
  %99 = load i32, ptr %98, align 4
  %100 = icmp eq i32 %95, %99
  br i1 %100, label %if.then.8, label %if.else.8

if.then.8:                                        ; preds = %while.body.7
  %101 = load ptr, ptr %3, align 8
  %102 = getelementptr %StringProcessor, ptr %101, i32 0, i32 15
  %103 = load i32, ptr %34, align 4
  %104 = getelementptr [500 x [500 x i32]], ptr %102, i32 0, i32 %103
  %105 = load i32, ptr %68, align 4
  %106 = getelementptr [500 x i32], ptr %104, i32 0, i32 %105
  %107 = load ptr, ptr %3, align 8
  %108 = getelementptr %StringProcessor, ptr %107, i32 0, i32 15
  %109 = load i32, ptr %34, align 4
  %110 = sub i32 %109, 1
  %111 = getelementptr [500 x [500 x i32]], ptr %108, i32 0, i32 %110
  %112 = load i32, ptr %68, align 4
  %113 = sub i32 %112, 1
  %114 = getelementptr [500 x i32], ptr %111, i32 0, i32 %113
  %115 = load i32, ptr %114, align 4
  store i32 %115, ptr %106, align 4
  br label %if.exit.8

if.else.8:                                        ; preds = %while.body.7
  %116 = load ptr, ptr %3, align 8
  %117 = getelementptr %StringProcessor, ptr %116, i32 0, i32 15
  %118 = load i32, ptr %34, align 4
  %119 = getelementptr [500 x [500 x i32]], ptr %117, i32 0, i32 %118
  %120 = load i32, ptr %68, align 4
  %121 = sub i32 %120, 1
  %122 = getelementptr [500 x i32], ptr %119, i32 0, i32 %121
  %123 = load i32, ptr %122, align 4
  %124 = add i32 %123, 1
  %125 = alloca i32, align 4
  store i32 %124, ptr %125, align 4
  %126 = load ptr, ptr %3, align 8
  %127 = getelementptr %StringProcessor, ptr %126, i32 0, i32 15
  %128 = load i32, ptr %34, align 4
  %129 = sub i32 %128, 1
  %130 = getelementptr [500 x [500 x i32]], ptr %127, i32 0, i32 %129
  %131 = load i32, ptr %68, align 4
  %132 = getelementptr [500 x i32], ptr %130, i32 0, i32 %131
  %133 = load i32, ptr %132, align 4
  %134 = add i32 %133, 1
  %135 = alloca i32, align 4
  store i32 %134, ptr %135, align 4
  %136 = load ptr, ptr %3, align 8
  %137 = getelementptr %StringProcessor, ptr %136, i32 0, i32 15
  %138 = load i32, ptr %34, align 4
  %139 = sub i32 %138, 1
  %140 = getelementptr [500 x [500 x i32]], ptr %137, i32 0, i32 %139
  %141 = load i32, ptr %68, align 4
  %142 = sub i32 %141, 1
  %143 = getelementptr [500 x i32], ptr %140, i32 0, i32 %142
  %144 = load i32, ptr %143, align 4
  %145 = add i32 %144, 1
  %146 = alloca i32, align 4
  store i32 %145, ptr %146, align 4
  %147 = load i32, ptr %125, align 4
  %148 = load i32, ptr %135, align 4
  %149 = icmp slt i32 %147, %148
  br i1 %149, label %if.then.9, label %if.else.9

if.then.9:                                        ; preds = %if.else.8
  %150 = load i32, ptr %125, align 4
  %151 = load i32, ptr %146, align 4
  %152 = icmp slt i32 %150, %151
  br i1 %152, label %if.then.10, label %if.else.10

if.then.10:                                       ; preds = %if.then.9
  %153 = load i32, ptr %125, align 4
  br label %if.exit.10

if.else.10:                                       ; preds = %if.then.9
  %154 = load i32, ptr %146, align 4
  br label %if.exit.10

if.exit.10:                                       ; preds = %if.else.10, %if.then.10
  %155 = phi i32 [ %153, %if.then.10 ], [ %154, %if.else.10 ]
  br label %if.exit.9

if.else.9:                                        ; preds = %if.else.8
  %156 = load i32, ptr %135, align 4
  %157 = load i32, ptr %146, align 4
  %158 = icmp slt i32 %156, %157
  br i1 %158, label %if.then.11, label %if.else.11

if.then.11:                                       ; preds = %if.else.9
  %159 = load i32, ptr %135, align 4
  br label %if.exit.11

if.else.11:                                       ; preds = %if.else.9
  %160 = load i32, ptr %146, align 4
  br label %if.exit.11

if.exit.11:                                       ; preds = %if.else.11, %if.then.11
  %161 = phi i32 [ %159, %if.then.11 ], [ %160, %if.else.11 ]
  br label %if.exit.9

if.exit.9:                                        ; preds = %if.exit.11, %if.exit.10
  %162 = phi i32 [ %155, %if.exit.10 ], [ %161, %if.exit.11 ]
  %163 = alloca i32, align 4
  store i32 %162, ptr %163, align 4
  %164 = load i32, ptr %163, align 4
  %165 = alloca i32, align 4
  store i32 %164, ptr %165, align 4
  %166 = load ptr, ptr %3, align 8
  %167 = getelementptr %StringProcessor, ptr %166, i32 0, i32 15
  %168 = load i32, ptr %34, align 4
  %169 = getelementptr [500 x [500 x i32]], ptr %167, i32 0, i32 %168
  %170 = load i32, ptr %68, align 4
  %171 = getelementptr [500 x i32], ptr %169, i32 0, i32 %170
  %172 = load i32, ptr %165, align 4
  store i32 %172, ptr %171, align 4
  br label %if.exit.8

if.exit.8:                                        ; preds = %if.exit.9, %if.then.8
  %173 = load i32, ptr %68, align 4
  %174 = add i32 %173, 1
  store i32 %174, ptr %68, align 4
  br label %while.cond.7

while.exit.7:                                     ; preds = %while.cond.7
  %175 = load i32, ptr %34, align 4
  %176 = add i32 %175, 1
  store i32 %176, ptr %34, align 4
  br label %while.cond.6

while.exit.6:                                     ; preds = %while.cond.6
  %177 = load ptr, ptr %3, align 8
  %178 = getelementptr %StringProcessor, ptr %177, i32 0, i32 15
  %179 = load i32, ptr %4, align 4
  %180 = getelementptr [500 x [500 x i32]], ptr %178, i32 0, i32 %179
  %181 = load i32, ptr %5, align 4
  %182 = getelementptr [500 x i32], ptr %180, i32 0, i32 %181
  %183 = load i32, ptr %182, align 4
  ret i32 %183
}

define i32 @_14su0eKxQra_analyze_compression_potential(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %if.exit.1, %entry
  %4 = load i32, ptr %3, align 4
  %5 = alloca i32, align 4
  store i32 256, ptr %5, align 4
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr %StringProcessor, ptr %8, i32 0, i32 16
  %10 = load i32, ptr %3, align 4
  %11 = getelementptr [256 x i32], ptr %9, i32 0, i32 %10
  %12 = load i32, ptr %11, align 4
  %13 = alloca i32, align 4
  store i32 0, ptr %13, align 4
  %14 = load i32, ptr %13, align 4
  %15 = icmp sgt i32 %12, %14
  br i1 %15, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.body.0
  %16 = load ptr, ptr %1, align 8
  %17 = getelementptr %StringProcessor, ptr %16, i32 0, i32 16
  %18 = load i32, ptr %3, align 4
  %19 = getelementptr [256 x i32], ptr %17, i32 0, i32 %18
  %20 = load i32, ptr %19, align 4
  %21 = alloca i32, align 4
  store i32 %20, ptr %21, align 4
  %22 = load i32, ptr %21, align 4
  %23 = mul i32 %22, 1000
  %24 = load ptr, ptr %1, align 8
  %25 = getelementptr %StringProcessor, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = sdiv i32 %23, %26
  %28 = alloca i32, align 4
  store i32 %27, ptr %28, align 4
  %29 = alloca i32, align 4
  store i32 0, ptr %29, align 4
  %30 = load i32, ptr %28, align 4
  %31 = alloca i32, align 4
  store i32 %30, ptr %31, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %if.then.1
  %32 = load i32, ptr %31, align 4
  %33 = alloca i32, align 4
  store i32 1, ptr %33, align 4
  %34 = load i32, ptr %33, align 4
  %35 = icmp sgt i32 %32, %34
  br i1 %35, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %while.cond.2
  %36 = load i32, ptr %29, align 4
  %37 = add i32 %36, 1
  store i32 %37, ptr %29, align 4
  %38 = load i32, ptr %31, align 4
  %39 = sdiv i32 %38, 2
  store i32 %39, ptr %31, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %while.cond.2
  %40 = load i32, ptr %2, align 4
  %41 = load i32, ptr %21, align 4
  %42 = load i32, ptr %29, align 4
  %43 = mul i32 %41, %42
  %44 = add i32 %40, %43
  store i32 %44, ptr %2, align 4
  %45 = load ptr, ptr %1, align 8
  %46 = getelementptr %StringProcessor, ptr %45, i32 0, i32 18
  %47 = load i32, ptr %3, align 4
  %48 = getelementptr [256 x i32], ptr %46, i32 0, i32 %47
  %49 = load i32, ptr %29, align 4
  %50 = alloca i32, align 4
  store i32 0, ptr %50, align 4
  %51 = load i32, ptr %50, align 4
  %52 = icmp sgt i32 %49, %51
  br i1 %52, label %if.then.3, label %if.else.3

if.then.3:                                        ; preds = %while.exit.2
  %53 = load i32, ptr %29, align 4
  br label %if.exit.3

if.else.3:                                        ; preds = %while.exit.2
  %54 = alloca i32, align 4
  store i32 1, ptr %54, align 4
  %55 = load i32, ptr %54, align 4
  br label %if.exit.3

if.exit.3:                                        ; preds = %if.else.3, %if.then.3
  %56 = phi i32 [ %53, %if.then.3 ], [ %55, %if.else.3 ]
  store i32 %56, ptr %48, align 4
  br label %if.exit.1

if.else.1:                                        ; preds = %while.body.0
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.else.1, %if.exit.3
  %57 = load i32, ptr %3, align 4
  %58 = add i32 %57, 1
  store i32 %58, ptr %3, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %59 = load ptr, ptr %1, align 8
  %60 = getelementptr %StringProcessor, ptr %59, i32 0, i32 1
  %61 = load i32, ptr %60, align 4
  %62 = mul i32 %61, 8
  %63 = load i32, ptr %2, align 4
  %64 = sub i32 %62, %63
  ret i32 %64
}

define i32 @_14su0eKxQra_find_longest_repeated_substring(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %if.exit.1, %entry
  %4 = load i32, ptr %3, align 4
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr %StringProcessor, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 4
  %8 = sub i32 %7, 1
  %9 = icmp slt i32 %4, %8
  br i1 %9, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr %StringProcessor, ptr %10, i32 0, i32 6
  %12 = load i32, ptr %3, align 4
  %13 = getelementptr [5000 x i32], ptr %11, i32 0, i32 %12
  %14 = load i32, ptr %13, align 4
  %15 = load i32, ptr %2, align 4
  %16 = icmp sgt i32 %14, %15
  br i1 %16, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.body.0
  %17 = load ptr, ptr %1, align 8
  %18 = getelementptr %StringProcessor, ptr %17, i32 0, i32 6
  %19 = load i32, ptr %3, align 4
  %20 = getelementptr [5000 x i32], ptr %18, i32 0, i32 %19
  %21 = load i32, ptr %20, align 4
  store i32 %21, ptr %2, align 4
  br label %if.exit.1

if.else.1:                                        ; preds = %while.body.0
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.else.1, %if.then.1
  %22 = load i32, ptr %3, align 4
  %23 = add i32 %22, 1
  store i32 %23, ptr %3, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %24 = load i32, ptr %2, align 4
  ret i32 %24
}

define void @_14su0eKxQra_perform_comprehensive_analysis(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %3 = load i32, ptr %2, align 4
  %4 = load ptr, ptr %1, align 8
  %5 = getelementptr %StringProcessor, ptr %4, i32 0, i32 4
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %3, %6
  br i1 %7, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %8 = load i32, ptr %2, align 4
  %9 = load ptr, ptr %1, align 8
  call void @_14su0eKxQra_kmp_search(ptr %9, i32 %8)
  %10 = load i32, ptr %2, align 4
  %11 = load ptr, ptr %1, align 8
  call void @_14su0eKxQra_boyer_moore_search(ptr %11, i32 %10)
  %12 = load i32, ptr %2, align 4
  %13 = load ptr, ptr %1, align 8
  call void @_14su0eKxQra_rabin_karp_search(ptr %13, i32 %12)
  %14 = load i32, ptr %2, align 4
  %15 = add i32 %14, 1
  store i32 %15, ptr %2, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %16 = load ptr, ptr %1, align 8
  %17 = call i32 @_14su0eKxQra_analyze_compression_potential(ptr %16)
  %18 = alloca i32, align 4
  store i32 %17, ptr %18, align 4
  %19 = load i32, ptr %18, align 4
  %20 = alloca i32, align 4
  store i32 %19, ptr %20, align 4
  %21 = load ptr, ptr %1, align 8
  %22 = getelementptr %StringProcessor, ptr %21, i32 0, i32 25
  %23 = alloca i32, align 4
  store i32 3, ptr %23, align 4
  %24 = load i32, ptr %23, align 4
  %25 = getelementptr [10 x i32], ptr %22, i32 0, i32 %24
  %26 = load i32, ptr %20, align 4
  store i32 %26, ptr %25, align 4
  %27 = load ptr, ptr %1, align 8
  %28 = call i32 @_14su0eKxQra_find_longest_repeated_substring(ptr %27)
  %29 = alloca i32, align 4
  store i32 %28, ptr %29, align 4
  %30 = load i32, ptr %29, align 4
  %31 = alloca i32, align 4
  store i32 %30, ptr %31, align 4
  %32 = load ptr, ptr %1, align 8
  %33 = getelementptr %StringProcessor, ptr %32, i32 0, i32 25
  %34 = alloca i32, align 4
  store i32 4, ptr %34, align 4
  %35 = load i32, ptr %34, align 4
  %36 = getelementptr [10 x i32], ptr %33, i32 0, i32 %35
  %37 = load i32, ptr %31, align 4
  store i32 %37, ptr %36, align 4
  %38 = load ptr, ptr %1, align 8
  %39 = getelementptr %StringProcessor, ptr %38, i32 0, i32 19
  %40 = load i32, ptr %39, align 4
  %41 = alloca i32, align 4
  store i32 0, ptr %41, align 4
  %42 = load i32, ptr %41, align 4
  %43 = icmp sgt i32 %40, %42
  br i1 %43, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.exit.0
  %44 = load ptr, ptr %1, align 8
  %45 = getelementptr %StringProcessor, ptr %44, i32 0, i32 1
  %46 = load i32, ptr %45, align 4
  %47 = load ptr, ptr %1, align 8
  %48 = getelementptr %StringProcessor, ptr %47, i32 0, i32 19
  %49 = load i32, ptr %48, align 4
  %50 = sdiv i32 %46, %49
  br label %if.exit.1

if.else.1:                                        ; preds = %while.exit.0
  %51 = alloca i32, align 4
  store i32 0, ptr %51, align 4
  %52 = load i32, ptr %51, align 4
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.else.1, %if.then.1
  %53 = phi i32 [ %50, %if.then.1 ], [ %52, %if.else.1 ]
  %54 = alloca i32, align 4
  store i32 %53, ptr %54, align 4
  %55 = load i32, ptr %54, align 4
  %56 = alloca i32, align 4
  store i32 %55, ptr %56, align 4
  %57 = load ptr, ptr %1, align 8
  %58 = getelementptr %StringProcessor, ptr %57, i32 0, i32 22
  %59 = load i32, ptr %58, align 4
  %60 = mul i32 %59, 100
  %61 = sdiv i32 %60, 256
  %62 = alloca i32, align 4
  store i32 %61, ptr %62, align 4
  %63 = load ptr, ptr %1, align 8
  %64 = getelementptr %StringProcessor, ptr %63, i32 0, i32 25
  %65 = alloca i32, align 4
  store i32 5, ptr %65, align 4
  %66 = load i32, ptr %65, align 4
  %67 = getelementptr [10 x i32], ptr %64, i32 0, i32 %66
  %68 = load i32, ptr %56, align 4
  store i32 %68, ptr %67, align 4
  %69 = load ptr, ptr %1, align 8
  %70 = getelementptr %StringProcessor, ptr %69, i32 0, i32 25
  %71 = alloca i32, align 4
  store i32 6, ptr %71, align 4
  %72 = load i32, ptr %71, align 4
  %73 = getelementptr [10 x i32], ptr %70, i32 0, i32 %72
  %74 = load i32, ptr %62, align 4
  store i32 %74, ptr %73, align 4
  ret void
}

define void @_14su0eKxQra_output_results(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr %StringProcessor, ptr %2, i32 0, i32 1
  %4 = load i32, ptr %3, align 4
  call void @printlnInt(i32 %4)
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr %StringProcessor, ptr %5, i32 0, i32 19
  %7 = load i32, ptr %6, align 4
  call void @printlnInt(i32 %7)
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr %StringProcessor, ptr %8, i32 0, i32 20
  %10 = load i32, ptr %9, align 4
  call void @printlnInt(i32 %10)
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr %StringProcessor, ptr %11, i32 0, i32 21
  %13 = load i32, ptr %12, align 4
  call void @printlnInt(i32 %13)
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr %StringProcessor, ptr %14, i32 0, i32 22
  %16 = load i32, ptr %15, align 4
  call void @printlnInt(i32 %16)
  %17 = alloca i32, align 4
  store i32 0, ptr %17, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %1, align 8
  %20 = getelementptr %StringProcessor, ptr %19, i32 0, i32 4
  %21 = load i32, ptr %20, align 4
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %23 = load ptr, ptr %1, align 8
  %24 = getelementptr %StringProcessor, ptr %23, i32 0, i32 24
  %25 = load i32, ptr %17, align 4
  %26 = getelementptr [50 x i32], ptr %24, i32 0, i32 %25
  %27 = load i32, ptr %26, align 4
  call void @printlnInt(i32 %27)
  %28 = load i32, ptr %17, align 4
  %29 = add i32 %28, 1
  store i32 %29, ptr %17, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %30 = load ptr, ptr %1, align 8
  %31 = getelementptr %StringProcessor, ptr %30, i32 0, i32 26
  %32 = load i32, ptr %31, align 4
  call void @printlnInt(i32 %32)
  %33 = load ptr, ptr %1, align 8
  %34 = getelementptr %StringProcessor, ptr %33, i32 0, i32 27
  %35 = load i32, ptr %34, align 4
  call void @printlnInt(i32 %35)
  %36 = alloca i32, align 4
  store i32 0, ptr %36, align 4
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %17, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.exit.0
  %38 = load i32, ptr %17, align 4
  %39 = alloca i32, align 4
  store i32 7, ptr %39, align 4
  %40 = load i32, ptr %39, align 4
  %41 = icmp slt i32 %38, %40
  br i1 %41, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %42 = load ptr, ptr %1, align 8
  %43 = getelementptr %StringProcessor, ptr %42, i32 0, i32 25
  %44 = load i32, ptr %17, align 4
  %45 = getelementptr [10 x i32], ptr %43, i32 0, i32 %44
  %46 = load i32, ptr %45, align 4
  call void @printlnInt(i32 %46)
  %47 = load i32, ptr %17, align 4
  %48 = add i32 %47, 1
  store i32 %48, ptr %17, align 4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %49 = alloca i32, align 4
  store i32 0, ptr %49, align 4
  %50 = load i32, ptr %49, align 4
  store i32 %50, ptr %17, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %while.exit.1
  %51 = load i32, ptr %17, align 4
  %52 = alloca i32, align 4
  store i32 10, ptr %52, align 4
  %53 = load i32, ptr %52, align 4
  %54 = icmp slt i32 %51, %53
  br i1 %54, label %laz.then.3, label %laz.else.3

laz.then.3:                                       ; preds = %while.cond.2
  %55 = load i32, ptr %17, align 4
  %56 = load ptr, ptr %1, align 8
  %57 = getelementptr %StringProcessor, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %57, align 4
  %59 = icmp slt i32 %55, %58
  br label %laz.exit.3

laz.else.3:                                       ; preds = %while.cond.2
  br label %laz.exit.3

laz.exit.3:                                       ; preds = %laz.else.3, %laz.then.3
  %60 = phi i1 [ %59, %laz.then.3 ], [ false, %laz.else.3 ]
  br i1 %60, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %laz.exit.3
  %61 = load ptr, ptr %1, align 8
  %62 = getelementptr %StringProcessor, ptr %61, i32 0, i32 5
  %63 = load i32, ptr %17, align 4
  %64 = getelementptr [5000 x i32], ptr %62, i32 0, i32 %63
  %65 = load i32, ptr %64, align 4
  call void @printlnInt(i32 %65)
  %66 = load i32, ptr %17, align 4
  %67 = add i32 %66, 1
  store i32 %67, ptr %17, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %laz.exit.3
  %68 = load ptr, ptr %1, align 8
  %69 = getelementptr %StringProcessor, ptr %68, i32 0, i32 26
  %70 = load i32, ptr %69, align 4
  %71 = load ptr, ptr %1, align 8
  %72 = getelementptr %StringProcessor, ptr %71, i32 0, i32 4
  %73 = load i32, ptr %72, align 4
  %74 = add i32 %73, 1
  %75 = sdiv i32 %70, %74
  %76 = alloca i32, align 4
  store i32 %75, ptr %76, align 4
  %77 = load ptr, ptr %1, align 8
  %78 = getelementptr %StringProcessor, ptr %77, i32 0, i32 22
  %79 = load i32, ptr %78, align 4
  %80 = load ptr, ptr %1, align 8
  %81 = getelementptr %StringProcessor, ptr %80, i32 0, i32 19
  %82 = load i32, ptr %81, align 4
  %83 = mul i32 %79, %82
  %84 = sdiv i32 %83, 100
  %85 = alloca i32, align 4
  store i32 %84, ptr %85, align 4
  %86 = load i32, ptr %76, align 4
  %87 = load i32, ptr %85, align 4
  %88 = add i32 %86, %87
  %89 = load ptr, ptr %1, align 8
  %90 = getelementptr %StringProcessor, ptr %89, i32 0, i32 25
  %91 = alloca i32, align 4
  store i32 3, ptr %91, align 4
  %92 = load i32, ptr %91, align 4
  %93 = getelementptr [10 x i32], ptr %90, i32 0, i32 %92
  %94 = load i32, ptr %93, align 4
  %95 = add i32 %88, %94
  %96 = alloca i32, align 4
  store i32 %95, ptr %96, align 4
  %97 = load i32, ptr %96, align 4
  call void @printlnInt(i32 %97)
  ret void
}

define void @_jssiMt4YUJe_new(ptr sret(%RegexMatcher) %0) {
entry:
  %1 = getelementptr %RegexMatcher, ptr %0, i32 0, i32 0
  %2 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = alloca i32, align 4
  store i32 100, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = getelementptr [100 x i32], ptr %1, i32 0, i32 0
  %7 = alloca i32, align 4
  store i32 0, ptr %7, align 4
  br label %new.arr.cond.0

new.arr.cond.0:                                   ; preds = %new.arr.body.0, %entry
  %8 = load i32, ptr %7, align 4
  %9 = icmp slt i32 %8, 100
  br i1 %9, label %new.arr.body.0, label %new.arr.exit.0

new.arr.body.0:                                   ; preds = %new.arr.cond.0
  %10 = getelementptr i32, ptr %6, i32 %8
  %11 = alloca i32, align 4
  store i32 0, ptr %11, align 4
  %12 = load i32, ptr %11, align 4
  store i32 %3, ptr %10, align 4
  %13 = add i32 %8, 1
  store i32 %13, ptr %7, align 4
  br label %new.arr.cond.0

new.arr.exit.0:                                   ; preds = %new.arr.cond.0
  %14 = getelementptr %RegexMatcher, ptr %0, i32 0, i32 1
  %15 = alloca i32, align 4
  store i32 0, ptr %15, align 4
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %14, align 4
  %17 = getelementptr %RegexMatcher, ptr %0, i32 0, i32 2
  %18 = alloca [100 x i1], align 1
  %19 = alloca i1, align 1
  store i1 false, ptr %19, align 1
  %20 = load i1, ptr %19, align 1
  %21 = alloca i32, align 4
  store i32 100, ptr %21, align 4
  %22 = load i32, ptr %21, align 4
  %23 = alloca [100 x i1], align 1
  %24 = getelementptr [100 x i1], ptr %23, i32 0, i32 0
  %25 = alloca i32, align 4
  store i32 0, ptr %25, align 4
  br label %new.arr.cond.1

new.arr.cond.1:                                   ; preds = %new.arr.body.1, %new.arr.exit.0
  %26 = load i32, ptr %25, align 4
  %27 = icmp slt i32 %26, 100
  br i1 %27, label %new.arr.body.1, label %new.arr.exit.1

new.arr.body.1:                                   ; preds = %new.arr.cond.1
  %28 = getelementptr i1, ptr %24, i32 %26
  %29 = alloca i1, align 1
  store i1 false, ptr %29, align 1
  %30 = load i1, ptr %29, align 1
  store i1 %20, ptr %28, align 1
  %31 = add i32 %26, 1
  store i32 %31, ptr %25, align 4
  br label %new.arr.cond.1

new.arr.exit.1:                                   ; preds = %new.arr.cond.1
  %32 = load [100 x i1], ptr %23, align 1
  %33 = alloca i32, align 4
  store i32 100, ptr %33, align 4
  %34 = load i32, ptr %33, align 4
  %35 = getelementptr [100 x [100 x i1]], ptr %17, i32 0, i32 0
  %36 = alloca i32, align 4
  store i32 0, ptr %36, align 4
  br label %new.arr.cond.2

new.arr.cond.2:                                   ; preds = %new.arr.exit.3, %new.arr.exit.1
  %37 = load i32, ptr %36, align 4
  %38 = icmp slt i32 %37, 100
  br i1 %38, label %new.arr.body.2, label %new.arr.exit.2

new.arr.body.2:                                   ; preds = %new.arr.cond.2
  %39 = getelementptr [100 x i1], ptr %35, i32 %37
  %40 = alloca i1, align 1
  store i1 false, ptr %40, align 1
  %41 = load i1, ptr %40, align 1
  %42 = alloca i32, align 4
  store i32 100, ptr %42, align 4
  %43 = load i32, ptr %42, align 4
  %44 = getelementptr [100 x i1], ptr %39, i32 0, i32 0
  %45 = alloca i32, align 4
  store i32 0, ptr %45, align 4
  br label %new.arr.cond.3

new.arr.cond.3:                                   ; preds = %new.arr.body.3, %new.arr.body.2
  %46 = load i32, ptr %45, align 4
  %47 = icmp slt i32 %46, 100
  br i1 %47, label %new.arr.body.3, label %new.arr.exit.3

new.arr.body.3:                                   ; preds = %new.arr.cond.3
  %48 = getelementptr i1, ptr %44, i32 %46
  %49 = alloca i1, align 1
  store i1 false, ptr %49, align 1
  %50 = load i1, ptr %49, align 1
  store i1 %20, ptr %48, align 1
  %51 = add i32 %46, 1
  store i32 %51, ptr %45, align 4
  br label %new.arr.cond.3

new.arr.exit.3:                                   ; preds = %new.arr.cond.3
  %52 = add i32 %37, 1
  store i32 %52, ptr %36, align 4
  br label %new.arr.cond.2

new.arr.exit.2:                                   ; preds = %new.arr.cond.2
  %53 = getelementptr %RegexMatcher, ptr %0, i32 0, i32 3
  %54 = alloca i32, align 4
  store i32 0, ptr %54, align 4
  %55 = load i32, ptr %54, align 4
  store i32 %55, ptr %53, align 4
  %56 = getelementptr %RegexMatcher, ptr %0, i32 0, i32 4
  %57 = alloca i1, align 1
  store i1 false, ptr %57, align 1
  %58 = load i1, ptr %57, align 1
  store i1 %58, ptr %56, align 1
  ret void
}

define void @_jssiMt4YUJe_compile_pattern(ptr %0, i32 %1) {
entry:
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr %RegexMatcher, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %3, align 4
  store i32 %6, ptr %5, align 4
  %7 = alloca i32, align 4
  store i32 0, ptr %7, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %8 = load i32, ptr %7, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr %RegexMatcher, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %7, align 4
  %14 = getelementptr [100 x i32], ptr %12, i32 0, i32 %13
  %15 = call i32 @getInt()
  store i32 %15, ptr %14, align 4
  %16 = load i32, ptr %7, align 4
  %17 = add i32 %16, 1
  store i32 %17, ptr %7, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %18 = load ptr, ptr %2, align 8
  call void @_jssiMt4YUJe_build_nfa(ptr %18)
  ret void
}

define void @_jssiMt4YUJe_build_nfa(ptr %0) {
entry:
  %1 = alloca ptr, align 8
  store ptr %0, ptr %1, align 8
  %2 = load ptr, ptr %1, align 8
  %3 = getelementptr %RegexMatcher, ptr %2, i32 0, i32 3
  %4 = load ptr, ptr %1, align 8
  %5 = getelementptr %RegexMatcher, ptr %4, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = add i32 %6, 1
  store i32 %7, ptr %3, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %8, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.exit.1, %entry
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr %RegexMatcher, ptr %10, i32 0, i32 3
  %12 = load i32, ptr %11, align 4
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %14 = alloca i32, align 4
  store i32 0, ptr %14, align 4
  br label %while.cond.1

while.cond.1:                                     ; preds = %while.body.1, %while.body.0
  %15 = load i32, ptr %14, align 4
  %16 = alloca i32, align 4
  store i32 100, ptr %16, align 4
  %17 = load i32, ptr %16, align 4
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %while.body.1, label %while.exit.1

while.body.1:                                     ; preds = %while.cond.1
  %19 = load ptr, ptr %1, align 8
  %20 = getelementptr %RegexMatcher, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %8, align 4
  %22 = getelementptr [100 x [100 x i1]], ptr %20, i32 0, i32 %21
  %23 = load i32, ptr %14, align 4
  %24 = getelementptr [100 x i1], ptr %22, i32 0, i32 %23
  %25 = alloca i1, align 1
  store i1 false, ptr %25, align 1
  %26 = load i1, ptr %25, align 1
  store i1 %26, ptr %24, align 1
  %27 = load i32, ptr %14, align 4
  %28 = add i32 %27, 1
  store i32 %28, ptr %14, align 4
  br label %while.cond.1

while.exit.1:                                     ; preds = %while.cond.1
  %29 = load i32, ptr %8, align 4
  %30 = add i32 %29, 1
  store i32 %30, ptr %8, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  %31 = alloca i32, align 4
  store i32 0, ptr %31, align 4
  %32 = load i32, ptr %31, align 4
  store i32 %32, ptr %8, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %if.exit.3, %while.exit.0
  %33 = load i32, ptr %8, align 4
  %34 = load ptr, ptr %1, align 8
  %35 = getelementptr %RegexMatcher, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %while.cond.2
  %38 = load ptr, ptr %1, align 8
  %39 = getelementptr %RegexMatcher, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %8, align 4
  %41 = getelementptr [100 x i32], ptr %39, i32 0, i32 %40
  %42 = load i32, ptr %41, align 4
  %43 = alloca i32, align 4
  store i32 %42, ptr %43, align 4
  %44 = load i32, ptr %43, align 4
  %45 = alloca i32, align 4
  store i32 0, ptr %45, align 4
  %46 = load i32, ptr %45, align 4
  %47 = icmp sge i32 %44, %46
  br i1 %47, label %laz.then.4, label %laz.else.4

laz.then.4:                                       ; preds = %while.body.2
  %48 = load i32, ptr %43, align 4
  %49 = alloca i32, align 4
  store i32 100, ptr %49, align 4
  %50 = load i32, ptr %49, align 4
  %51 = icmp slt i32 %48, %50
  br label %laz.exit.4

laz.else.4:                                       ; preds = %while.body.2
  br label %laz.exit.4

laz.exit.4:                                       ; preds = %laz.else.4, %laz.then.4
  %52 = phi i1 [ %51, %laz.then.4 ], [ false, %laz.else.4 ]
  br i1 %52, label %if.then.3, label %if.else.3

if.then.3:                                        ; preds = %laz.exit.4
  %53 = load ptr, ptr %1, align 8
  %54 = getelementptr %RegexMatcher, ptr %53, i32 0, i32 2
  %55 = load i32, ptr %8, align 4
  %56 = getelementptr [100 x [100 x i1]], ptr %54, i32 0, i32 %55
  %57 = load i32, ptr %43, align 4
  %58 = getelementptr [100 x i1], ptr %56, i32 0, i32 %57
  %59 = alloca i1, align 1
  store i1 true, ptr %59, align 1
  %60 = load i1, ptr %59, align 1
  store i1 %60, ptr %58, align 1
  br label %if.exit.3

if.else.3:                                        ; preds = %laz.exit.4
  br label %if.exit.3

if.exit.3:                                        ; preds = %if.else.3, %if.then.3
  %61 = load i32, ptr %8, align 4
  %62 = add i32 %61, 1
  store i32 %62, ptr %8, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %while.cond.2
  ret void
}

define i1 @_jssiMt4YUJe_match_text(ptr %0, ptr %1, i32 %2) {
entry:
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = alloca ptr, align 8
  store ptr %1, ptr %4, align 8
  %5 = alloca i32, align 4
  store i32 %2, ptr %5, align 4
  %6 = alloca [100 x i1], align 1
  %7 = alloca i1, align 1
  store i1 false, ptr %7, align 1
  %8 = load i1, ptr %7, align 1
  %9 = alloca i32, align 4
  store i32 100, ptr %9, align 4
  %10 = load i32, ptr %9, align 4
  %11 = alloca [100 x i1], align 1
  %12 = getelementptr [100 x i1], ptr %11, i32 0, i32 0
  %13 = alloca i32, align 4
  store i32 0, ptr %13, align 4
  br label %new.arr.cond.0

new.arr.cond.0:                                   ; preds = %new.arr.body.0, %entry
  %14 = load i32, ptr %13, align 4
  %15 = icmp slt i32 %14, 100
  br i1 %15, label %new.arr.body.0, label %new.arr.exit.0

new.arr.body.0:                                   ; preds = %new.arr.cond.0
  %16 = getelementptr i1, ptr %12, i32 %14
  %17 = alloca i1, align 1
  store i1 false, ptr %17, align 1
  %18 = load i1, ptr %17, align 1
  store i1 %8, ptr %16, align 1
  %19 = add i32 %14, 1
  store i32 %19, ptr %13, align 4
  br label %new.arr.cond.0

new.arr.exit.0:                                   ; preds = %new.arr.cond.0
  %20 = alloca [100 x i1], align 1
  %21 = alloca i1, align 1
  store i1 false, ptr %21, align 1
  %22 = load i1, ptr %21, align 1
  %23 = alloca i32, align 4
  store i32 100, ptr %23, align 4
  %24 = load i32, ptr %23, align 4
  %25 = alloca [100 x i1], align 1
  %26 = getelementptr [100 x i1], ptr %25, i32 0, i32 0
  %27 = alloca i32, align 4
  store i32 0, ptr %27, align 4
  br label %new.arr.cond.1

new.arr.cond.1:                                   ; preds = %new.arr.body.1, %new.arr.exit.0
  %28 = load i32, ptr %27, align 4
  %29 = icmp slt i32 %28, 100
  br i1 %29, label %new.arr.body.1, label %new.arr.exit.1

new.arr.body.1:                                   ; preds = %new.arr.cond.1
  %30 = getelementptr i1, ptr %26, i32 %28
  %31 = alloca i1, align 1
  store i1 false, ptr %31, align 1
  %32 = load i1, ptr %31, align 1
  store i1 %22, ptr %30, align 1
  %33 = add i32 %28, 1
  store i32 %33, ptr %27, align 4
  br label %new.arr.cond.1

new.arr.exit.1:                                   ; preds = %new.arr.cond.1
  %34 = alloca i32, align 4
  store i32 0, ptr %34, align 4
  %35 = load i32, ptr %34, align 4
  %36 = getelementptr [100 x i1], ptr %11, i32 0, i32 %35
  %37 = alloca i1, align 1
  store i1 true, ptr %37, align 1
  %38 = load i1, ptr %37, align 1
  store i1 %38, ptr %36, align 1
  %39 = alloca i32, align 4
  store i32 0, ptr %39, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.exit.10, %new.arr.exit.1
  %40 = load i32, ptr %39, align 4
  %41 = load i32, ptr %5, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %while.cond.2
  %43 = load i32, ptr %39, align 4
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr [5000 x i32], ptr %44, i32 0, i32 %43
  %46 = load i32, ptr %45, align 4
  %47 = alloca i32, align 4
  store i32 %46, ptr %47, align 4
  %48 = alloca i32, align 4
  store i32 0, ptr %48, align 4
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %while.body.2
  %49 = load i32, ptr %48, align 4
  %50 = alloca i32, align 4
  store i32 100, ptr %50, align 4
  %51 = load i32, ptr %50, align 4
  %52 = icmp slt i32 %49, %51
  br i1 %52, label %while.body.3, label %while.exit.3

while.body.3:                                     ; preds = %while.cond.3
  %53 = load i32, ptr %48, align 4
  %54 = getelementptr [100 x i1], ptr %25, i32 0, i32 %53
  %55 = alloca i1, align 1
  store i1 false, ptr %55, align 1
  %56 = load i1, ptr %55, align 1
  store i1 %56, ptr %54, align 1
  %57 = load i32, ptr %48, align 4
  %58 = add i32 %57, 1
  store i32 %58, ptr %48, align 4
  br label %while.cond.3

while.exit.3:                                     ; preds = %while.cond.3
  %59 = alloca i32, align 4
  store i32 0, ptr %59, align 4
  %60 = load i32, ptr %59, align 4
  store i32 %60, ptr %48, align 4
  br label %while.cond.4

while.cond.4:                                     ; preds = %if.exit.5, %while.exit.3
  %61 = load i32, ptr %48, align 4
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr %RegexMatcher, ptr %62, i32 0, i32 3
  %64 = load i32, ptr %63, align 4
  %65 = icmp slt i32 %61, %64
  br i1 %65, label %while.body.4, label %while.exit.4

while.body.4:                                     ; preds = %while.cond.4
  %66 = load i32, ptr %48, align 4
  %67 = getelementptr [100 x i1], ptr %11, i32 0, i32 %66
  %68 = load i1, ptr %67, align 1
  br i1 %68, label %if.then.5, label %if.else.5

if.then.5:                                        ; preds = %while.body.4
  %69 = load i32, ptr %48, align 4
  %70 = load ptr, ptr %3, align 8
  %71 = getelementptr %RegexMatcher, ptr %70, i32 0, i32 1
  %72 = load i32, ptr %71, align 4
  %73 = icmp slt i32 %69, %72
  br i1 %73, label %laz.then.7, label %laz.else.7

laz.then.7:                                       ; preds = %if.then.5
  %74 = load i32, ptr %47, align 4
  %75 = alloca i32, align 4
  store i32 0, ptr %75, align 4
  %76 = load i32, ptr %75, align 4
  %77 = icmp sge i32 %74, %76
  br label %laz.exit.7

laz.else.7:                                       ; preds = %if.then.5
  br label %laz.exit.7

laz.exit.7:                                       ; preds = %laz.else.7, %laz.then.7
  %78 = phi i1 [ %77, %laz.then.7 ], [ false, %laz.else.7 ]
  br i1 %78, label %laz.then.8, label %laz.else.8

laz.then.8:                                       ; preds = %laz.exit.7
  %79 = load i32, ptr %47, align 4
  %80 = alloca i32, align 4
  store i32 100, ptr %80, align 4
  %81 = load i32, ptr %80, align 4
  %82 = icmp slt i32 %79, %81
  br label %laz.exit.8

laz.else.8:                                       ; preds = %laz.exit.7
  br label %laz.exit.8

laz.exit.8:                                       ; preds = %laz.else.8, %laz.then.8
  %83 = phi i1 [ %82, %laz.then.8 ], [ false, %laz.else.8 ]
  br i1 %83, label %laz.then.9, label %laz.else.9

laz.then.9:                                       ; preds = %laz.exit.8
  %84 = load ptr, ptr %3, align 8
  %85 = getelementptr %RegexMatcher, ptr %84, i32 0, i32 2
  %86 = load i32, ptr %48, align 4
  %87 = getelementptr [100 x [100 x i1]], ptr %85, i32 0, i32 %86
  %88 = load i32, ptr %47, align 4
  %89 = getelementptr [100 x i1], ptr %87, i32 0, i32 %88
  %90 = load i1, ptr %89, align 1
  br label %laz.exit.9

laz.else.9:                                       ; preds = %laz.exit.8
  br label %laz.exit.9

laz.exit.9:                                       ; preds = %laz.else.9, %laz.then.9
  %91 = phi i1 [ %90, %laz.then.9 ], [ false, %laz.else.9 ]
  br i1 %91, label %if.then.6, label %if.else.6

if.then.6:                                        ; preds = %laz.exit.9
  %92 = load i32, ptr %48, align 4
  %93 = add i32 %92, 1
  %94 = getelementptr [100 x i1], ptr %25, i32 0, i32 %93
  %95 = alloca i1, align 1
  store i1 true, ptr %95, align 1
  %96 = load i1, ptr %95, align 1
  store i1 %96, ptr %94, align 1
  br label %if.exit.6

if.else.6:                                        ; preds = %laz.exit.9
  br label %if.exit.6

if.exit.6:                                        ; preds = %if.else.6, %if.then.6
  br label %if.exit.5

if.else.5:                                        ; preds = %while.body.4
  br label %if.exit.5

if.exit.5:                                        ; preds = %if.else.5, %if.exit.6
  %97 = load i32, ptr %48, align 4
  %98 = add i32 %97, 1
  store i32 %98, ptr %48, align 4
  br label %while.cond.4

while.exit.4:                                     ; preds = %while.cond.4
  %99 = alloca i32, align 4
  store i32 0, ptr %99, align 4
  %100 = load i32, ptr %99, align 4
  store i32 %100, ptr %48, align 4
  br label %while.cond.10

while.cond.10:                                    ; preds = %while.body.10, %while.exit.4
  %101 = load i32, ptr %48, align 4
  %102 = alloca i32, align 4
  store i32 100, ptr %102, align 4
  %103 = load i32, ptr %102, align 4
  %104 = icmp slt i32 %101, %103
  br i1 %104, label %while.body.10, label %while.exit.10

while.body.10:                                    ; preds = %while.cond.10
  %105 = load i32, ptr %48, align 4
  %106 = getelementptr [100 x i1], ptr %11, i32 0, i32 %105
  %107 = load i32, ptr %48, align 4
  %108 = getelementptr [100 x i1], ptr %25, i32 0, i32 %107
  %109 = load i1, ptr %108, align 1
  store i1 %109, ptr %106, align 1
  %110 = load i32, ptr %48, align 4
  %111 = add i32 %110, 1
  store i32 %111, ptr %48, align 4
  br label %while.cond.10

while.exit.10:                                    ; preds = %while.cond.10
  %112 = load i32, ptr %39, align 4
  %113 = add i32 %112, 1
  store i32 %113, ptr %39, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %while.cond.2
  %114 = load ptr, ptr %3, align 8
  %115 = getelementptr %RegexMatcher, ptr %114, i32 0, i32 1
  %116 = load i32, ptr %115, align 4
  %117 = getelementptr [100 x i1], ptr %11, i32 0, i32 %116
  %118 = load i1, ptr %117, align 1
  ret i1 %118
}

define void @main() {
entry:
  %0 = alloca %StringProcessor, align 8
  call void @_14su0eKxQra_new(ptr %0)
  %1 = load %StringProcessor, ptr %0, align 4
  %2 = alloca %StringProcessor, align 8
  store %StringProcessor %1, ptr %2, align 4
  %3 = call i32 @getInt()
  %4 = alloca i32, align 4
  store i32 %3, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = alloca i32, align 4
  store i32 %5, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  call void @_14su0eKxQra_initialize_text(ptr %2, i32 %7)
  %8 = call i32 @getInt()
  %9 = alloca i32, align 4
  store i32 %8, ptr %9, align 4
  %10 = load i32, ptr %9, align 4
  %11 = alloca i32, align 4
  store i32 %10, ptr %11, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %12, align 4
  br label %while.cond.0

while.cond.0:                                     ; preds = %while.body.0, %entry
  %13 = load i32, ptr %12, align 4
  %14 = load i32, ptr %11, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %while.body.0, label %while.exit.0

while.body.0:                                     ; preds = %while.cond.0
  %16 = call i32 @getInt()
  %17 = alloca i32, align 4
  store i32 %16, ptr %17, align 4
  %18 = load i32, ptr %17, align 4
  %19 = alloca i32, align 4
  store i32 %18, ptr %19, align 4
  %20 = load i32, ptr %19, align 4
  call void @_14su0eKxQra_add_pattern(ptr %2, i32 %20)
  %21 = load i32, ptr %12, align 4
  %22 = add i32 %21, 1
  store i32 %22, ptr %12, align 4
  br label %while.cond.0

while.exit.0:                                     ; preds = %while.cond.0
  call void @_14su0eKxQra_perform_comprehensive_analysis(ptr %2)
  %23 = call i32 @getInt()
  %24 = alloca i32, align 4
  store i32 %23, ptr %24, align 4
  %25 = load i32, ptr %24, align 4
  %26 = alloca i32, align 4
  store i32 %25, ptr %26, align 4
  %27 = call i32 @getInt()
  %28 = alloca i32, align 4
  store i32 %27, ptr %28, align 4
  %29 = load i32, ptr %28, align 4
  %30 = alloca i32, align 4
  store i32 %29, ptr %30, align 4
  %31 = load i32, ptr %26, align 4
  %32 = load i32, ptr %30, align 4
  %33 = call i32 @_14su0eKxQra_compute_edit_distance(ptr %2, i32 %31, i32 %32)
  %34 = alloca i32, align 4
  store i32 %33, ptr %34, align 4
  %35 = load i32, ptr %34, align 4
  %36 = alloca i32, align 4
  store i32 %35, ptr %36, align 4
  %37 = load i32, ptr %36, align 4
  call void @printlnInt(i32 %37)
  %38 = alloca %RegexMatcher, align 8
  call void @_jssiMt4YUJe_new(ptr %38)
  %39 = load %RegexMatcher, ptr %38, align 4
  %40 = alloca %RegexMatcher, align 8
  store %RegexMatcher %39, ptr %40, align 4
  %41 = call i32 @getInt()
  %42 = alloca i32, align 4
  store i32 %41, ptr %42, align 4
  %43 = load i32, ptr %42, align 4
  %44 = alloca i32, align 4
  store i32 %43, ptr %44, align 4
  %45 = load i32, ptr %44, align 4
  call void @_jssiMt4YUJe_compile_pattern(ptr %40, i32 %45)
  %46 = getelementptr %StringProcessor, ptr %2, i32 0, i32 0
  %47 = getelementptr %StringProcessor, ptr %2, i32 0, i32 1
  %48 = load i32, ptr %47, align 4
  %49 = call i1 @_jssiMt4YUJe_match_text(ptr %40, ptr %46, i32 %48)
  %50 = alloca i1, align 1
  store i1 %49, ptr %50, align 1
  %51 = load i1, ptr %50, align 1
  %52 = alloca i1, align 1
  store i1 %51, ptr %52, align 1
  %53 = load i1, ptr %52, align 1
  br i1 %53, label %if.then.1, label %if.else.1

if.then.1:                                        ; preds = %while.exit.0
  %54 = alloca i32, align 4
  store i32 1, ptr %54, align 4
  %55 = load i32, ptr %54, align 4
  br label %if.exit.1

if.else.1:                                        ; preds = %while.exit.0
  %56 = alloca i32, align 4
  store i32 0, ptr %56, align 4
  %57 = load i32, ptr %56, align 4
  br label %if.exit.1

if.exit.1:                                        ; preds = %if.else.1, %if.then.1
  %58 = phi i32 [ %55, %if.then.1 ], [ %57, %if.else.1 ]
  call void @printlnInt(i32 %58)
  call void @_14su0eKxQra_output_results(ptr %2)
  %59 = call i32 @getInt()
  %60 = alloca i32, align 4
  store i32 %59, ptr %60, align 4
  %61 = load i32, ptr %60, align 4
  %62 = alloca i32, align 4
  store i32 %61, ptr %62, align 4
  %63 = alloca i32, align 4
  store i32 0, ptr %63, align 4
  %64 = alloca i32, align 4
  store i32 0, ptr %64, align 4
  %65 = load i32, ptr %64, align 4
  store i32 %65, ptr %12, align 4
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.exit.3, %if.exit.1
  %66 = load i32, ptr %12, align 4
  %67 = load i32, ptr %62, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %while.body.2, label %while.exit.2

while.body.2:                                     ; preds = %while.cond.2
  %69 = load i32, ptr %12, align 4
  %70 = mul i32 %69, 7
  %71 = add i32 %70, 3
  %72 = srem i32 %71, 26
  %73 = alloca i32, align 4
  store i32 %72, ptr %73, align 4
  %74 = alloca i32, align 4
  store i32 0, ptr %74, align 4
  br label %while.cond.3

while.cond.3:                                     ; preds = %if.exit.4, %while.body.2
  %75 = load i32, ptr %74, align 4
  %76 = getelementptr %StringProcessor, ptr %2, i32 0, i32 1
  %77 = load i32, ptr %76, align 4
  %78 = icmp slt i32 %75, %77
  br i1 %78, label %while.body.3, label %while.exit.3

while.body.3:                                     ; preds = %while.cond.3
  %79 = getelementptr %StringProcessor, ptr %2, i32 0, i32 0
  %80 = load i32, ptr %74, align 4
  %81 = getelementptr [5000 x i32], ptr %79, i32 0, i32 %80
  %82 = load i32, ptr %81, align 4
  %83 = alloca i32, align 4
  store i32 %82, ptr %83, align 4
  %84 = load i32, ptr %83, align 4
  %85 = alloca i32, align 4
  store i32 65, ptr %85, align 4
  %86 = load i32, ptr %85, align 4
  %87 = icmp sge i32 %84, %86
  br i1 %87, label %laz.then.5, label %laz.else.5

laz.then.5:                                       ; preds = %while.body.3
  %88 = load i32, ptr %83, align 4
  %89 = alloca i32, align 4
  store i32 90, ptr %89, align 4
  %90 = load i32, ptr %89, align 4
  %91 = icmp sle i32 %88, %90
  br label %laz.exit.5

laz.else.5:                                       ; preds = %while.body.3
  br label %laz.exit.5

laz.exit.5:                                       ; preds = %laz.else.5, %laz.then.5
  %92 = phi i1 [ %91, %laz.then.5 ], [ false, %laz.else.5 ]
  br i1 %92, label %if.then.4, label %if.else.4

if.then.4:                                        ; preds = %laz.exit.5
  %93 = getelementptr %StringProcessor, ptr %2, i32 0, i32 0
  %94 = load i32, ptr %74, align 4
  %95 = getelementptr [5000 x i32], ptr %93, i32 0, i32 %94
  %96 = load i32, ptr %83, align 4
  %97 = sub i32 %96, 65
  %98 = load i32, ptr %73, align 4
  %99 = add i32 %97, %98
  %100 = srem i32 %99, 26
  %101 = add i32 %100, 65
  store i32 %101, ptr %95, align 4
  br label %if.exit.4

if.else.4:                                        ; preds = %laz.exit.5
  %102 = load i32, ptr %83, align 4
  %103 = alloca i32, align 4
  store i32 97, ptr %103, align 4
  %104 = load i32, ptr %103, align 4
  %105 = icmp sge i32 %102, %104
  br i1 %105, label %laz.then.7, label %laz.else.7

laz.then.7:                                       ; preds = %if.else.4
  %106 = load i32, ptr %83, align 4
  %107 = alloca i32, align 4
  store i32 122, ptr %107, align 4
  %108 = load i32, ptr %107, align 4
  %109 = icmp sle i32 %106, %108
  br label %laz.exit.7

laz.else.7:                                       ; preds = %if.else.4
  br label %laz.exit.7

laz.exit.7:                                       ; preds = %laz.else.7, %laz.then.7
  %110 = phi i1 [ %109, %laz.then.7 ], [ false, %laz.else.7 ]
  br i1 %110, label %if.then.6, label %if.else.6

if.then.6:                                        ; preds = %laz.exit.7
  %111 = getelementptr %StringProcessor, ptr %2, i32 0, i32 0
  %112 = load i32, ptr %74, align 4
  %113 = getelementptr [5000 x i32], ptr %111, i32 0, i32 %112
  %114 = load i32, ptr %83, align 4
  %115 = sub i32 %114, 97
  %116 = load i32, ptr %73, align 4
  %117 = add i32 %115, %116
  %118 = srem i32 %117, 26
  %119 = add i32 %118, 97
  store i32 %119, ptr %113, align 4
  br label %if.exit.6

if.else.6:                                        ; preds = %laz.exit.7
  br label %if.exit.6

if.exit.6:                                        ; preds = %if.else.6, %if.then.6
  br label %if.exit.4

if.exit.4:                                        ; preds = %if.exit.6, %if.then.4
  %120 = load i32, ptr %74, align 4
  %121 = add i32 %120, 1
  store i32 %121, ptr %74, align 4
  br label %while.cond.3

while.exit.3:                                     ; preds = %while.cond.3
  call void @_14su0eKxQra_analyze_text_statistics(ptr %2)
  %122 = load i32, ptr %63, align 4
  %123 = getelementptr %StringProcessor, ptr %2, i32 0, i32 22
  %124 = load i32, ptr %123, align 4
  %125 = add i32 %122, %124
  store i32 %125, ptr %63, align 4
  %126 = load i32, ptr %12, align 4
  %127 = add i32 %126, 1
  store i32 %127, ptr %12, align 4
  br label %while.cond.2

while.exit.2:                                     ; preds = %while.cond.2
  %128 = load i32, ptr %63, align 4
  call void @printlnInt(i32 %128)
  %129 = getelementptr %StringProcessor, ptr %2, i32 0, i32 26
  %130 = load i32, ptr %129, align 4
  %131 = load i32, ptr %63, align 4
  %132 = add i32 %130, %131
  %133 = getelementptr %StringProcessor, ptr %2, i32 0, i32 22
  %134 = load i32, ptr %133, align 4
  %135 = mul i32 %132, %134
  %136 = sdiv i32 %135, 100
  %137 = alloca i32, align 4
  store i32 %136, ptr %137, align 4
  %138 = load i32, ptr %137, align 4
  call void @printlnInt(i32 %138)
  %139 = alloca i32, align 4
  store i32 0, ptr %139, align 4
  %140 = load i32, ptr %139, align 4
  call void @exit(i32 %140)
  ret void
}
