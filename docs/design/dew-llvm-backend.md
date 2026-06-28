# Dew → LLVM IR 翻译规范

> 新 LLVM 后端的完整翻译规则。用 `alloca` + `store`/`load` 体系替代旧 arena + `i64` 指针方案。每个 Dew IR 构造给出其 LLVM IR 等价物。

---

## 目录

- [§1 核心原则](#1-核心原则)
- [§2 模块结构](#2-模块结构)
  - [§2.1 顶层组织](#21-顶层组织)
  - [§2.2 运行时声明](#22-运行时声明)
- [§3 类型翻译](#3-类型翻译)
  - [§3.1 基础类型](#31-基础类型)
  - [§3.2 结构体](#32-结构体)
  - [§3.3 枚举](#33-枚举)
  - [§3.4 元组](#34-元组)
  - [§3.5 数组](#35-数组)
  - [§3.6 函数指针与闭包](#36-函数指针与闭包)
- [§4 函数（fn）的翻译](#4-函数fn的翻译)
  - [§4.1 函数签名](#41-函数签名)
  - [§4.2 寄存器分配策略](#42-寄存器分配策略)
  - [§4.3 基本块翻译](#43-基本块翻译)
  - [§4.4 终结符翻译](#44-终结符翻译)
- [§5 指令翻译——完整参考](#5-指令翻译完整参考)
  - [§5.1 字面量 `lit`](#51-字面量-lit)
  - [§5.2 算术运算 `add, sub, mul, div, rem`](#52-算术运算-add-sub-mul-div-rem)
  - [§5.3 位运算 `bit_and, bit_or, bit_xor, shl, shr`](#53-位运算-bit_and-bit_or-bit_xor-shl-shr)
  - [§5.4 比较 `lt, gt, le, ge, eq, ne`](#54-比较-lt-gt-le-ge-eq-ne)
  - [§5.5 逻辑 `and, or, not`](#55-逻辑-and-or-not)
  - [§5.6 控制流 `phi, br, jmp, ret`](#56-控制流-phi-br-jmp-ret)
  - [§5.7 结构体 `struct_cons, field, struct_update`](#57-结构体-struct_cons-field-struct_update)
  - [§5.8 枚举 `enum_cons, enum_disc, enum_proj`](#58-枚举-enum_cons-enum_disc-enum_proj)
  - [§5.9 元组 `tuple_lit, tuple_update`](#59-元组-tuple_lit-tuple_update)
  - [§5.10 数组 `array_lit, array_fill, array_access, array_update`](#510-数组-array_lit-array_fill-array_access-array_update)
  - [§5.11 函数调用 `call`](#511-函数调用-call)
  - [§5.12 闭包 `lambda`](#512-闭包-lambda)
  - [§5.13 Thunk `force, update`](#513-thunk-force-update)
  - [§5.14 I/O `stdout, stdin`](#514-io-stdout-stdin)
  - [§5.15 移动 `move`](#515-移动-move)
- [§6 惰性求值：thunk 系统](#6-惰性求值thunk-系统)
  - [§6.1 Thunk 缓存结构](#61-thunk-缓存结构)
  - [§6.2 Force 函数的 3-state FSM](#62-force-函数的-3-state-fsm)
  - [§6.3 Update 操作](#63-update-操作)
- [§7 闭包系统](#7-闭包系统)
  - [§7.1 闭包构造 `lambda`](#71-闭包构造-lambda)
  - [§7.2 静态调用](#72-静态调用)
  - [§7.3 动态调用](#73-动态调用)
- [§8 match 和 if/else](#8-match-和-ifelse)
  - [§8.1 Match 在 IR 中的形态](#81-匹配在-ir-中的形态)
  - [§8.2 布尔 match → LLVM br](#82-布尔匹配--llvm-br)
  - [§8.3 枚举 match → LLVM switch](#83-枚举匹配--llvm-switch)
- [§9 原地修改优化](#9-原地修改优化)
  - [§9.1 优化条件](#91-优化条件)
  - [§9.2 StructUpdate 原位](#92-structupdate-原位)
  - [§9.3 ArrayUpdate 原位](#93-arrayupdate-原位)
- [§10 while 循环](#10-while-循环)
  - [§10.1 while-borrow 的 IR 形态](#101-while-borrow-的-ir-形态)
  - [§10.2 LLVM 翻译策略](#102-llvm-翻译策略)
- [§11 完整示例](#11-完整示例)
  - [§11.1 简单 thunk（惰性求值）](#111-简单-thunk惰性求值)
  - [§11.2 结构体 + 枚举 + match](#112-结构体--枚举--match)
- [§附录 A：LLVM 类型映射表](#附录-allvm-类型映射表)
- [§附录 B：IR 指令 → LLVM 指令速查表](#附录-bir-指令--llvm-指令速查表)

---

## §1 核心原则

1. **所有 IR 寄存器映射为 LLVM `alloca` 槽。**每个 `Reg = usize` 对应一个 `alloca T`（`T` 取决于寄存器类型：`Int→∞ i64`，`Bool→∞ i1`，`Char→∞ i32`，聚合类型→∞ `ptr`）。通过 `store` 写入、`load` 读取，避免 SSA 重复定义问题。

2. **所有聚合类型（struct/enum/tuple/array）统一以指针形式存储。**`alloca ptr` 存放指向堆内存的指针。结构体本身在堆上（`malloc`），寄存器只存指针。这确保 `getelementptr` + `store` 即可实现原位修改。

3. **标量值（Int/Bool/Char）直接存在 `alloca T` 中。**不装箱，不指针化。

4. **惰性求值通过 thunk 实现。**每个顶层零参 `def` 映射为一个全局缓存单元 + 一个 `force_*` 函数。`force` 指令编译为调用该函数。

5. **闭包通过堆分配的 `struct` + 函数指针实现。**`lambda` 分配一个包含函数指针和捕获变量的堆结构，`call %f` 通过间接函数调用执行。

6. **内存管理：`malloc`，不 `free`，OOM 时 `llvm.trap()`。**所有堆分配（struct、enum、array、闭包）通过 `@malloc`。不主动释放——程序退出时 OS 回收。这是阶段性策略，后续可升级为 arena bump allocator 或 GC。`alloca` 分配的栈内存自动回收。每次 `malloc` 调用后检查返回值是否为 `null`，若是则 `call @llvm.trap()` + `unreachable`。

---

## §2 模块结构

### §2.1 顶层组织

```
Dew IR 模块                    LLVM IR 模块
─────────────────────────      ──────────────────────
Module {                        LLVM Module:
  types: TypeTable                ; 结构体/枚举的 LLVM 类型定义
  fns: Vec<Fn>                    define i64 @fname(...) { ... }
  thunks: Vec<Thunk>              @x.cell = global %thunk zeroinitializer
}                                 define i64 @force_x() { ... }
```

生成顺序：

1. **运行时声明**（`printf`/`scanf`/`malloc`/`llvm.trap`）
2. **类型定义**（struct + enum 的 LLVM 类型）
3. **Thunk 缓存 + force 函数**（每 thunk 一对）
4. **函数定义**（按 `fns` 顺序，`@main` 放在最后）

### §2.2 运行时声明

```llvm
; 输出
@.fmt_int  = private constant [4 x i8] c"%ld\00"
@.fmt_bool = private constant [4 x i8] c"%s\00"
@.str_true = private constant [5 x i8] c"true\00"
@.str_false= private constant [6 x i8] c"false\00"
declare i32 @printf(ptr, ...)
declare i32 @putchar(i32)

; 输入
declare i32 @scanf(ptr, ...)
declare i32 @getchar()

; 内存
declare ptr @malloc(i64)
declare void @free(ptr)

; 异常
declare void @llvm.trap()
```

---

## §3 类型翻译

### §3.1 基础类型

| Dew IR 类型 | LLVM 寄存器存储 | LLVM 内存类型 | 说明 |
|-------------|---------------|-------------|------|
| `Int` | `alloca i64` | `i64` | 64 位有符号整数 |
| `Bool` | `alloca i1` | `i1` | LLVM 原生布尔，`icmp` 直接返回 `i1`，`br` 直接消费 |
| `Char` | `alloca i32` | `i32` | Unicode 标量（LLVM 中 char 的标准宽度） |
| `Unit` | 无 | — | 对应 LLVM `void`，返回 `ret void`；作为 struct 字段时跳过 |

> **为什么不用统一的 `i64`？**
> `i1` 原生支持 LLVM 的所有操作（`icmp` → `i1`，`br i1`），且对布尔数组节省 87.5% 空间。`i32` 与 C ABI 的 `int`/`wchar_t` 对齐，简化与 `printf`/`scanf`/`putchar` 的交互。

### §3.2 结构体

```
Dew IR 类型表:                      LLVM IR:
struct Point { x: Int, y: Int }    %struct.Point = type { i64, i64 }
struct Rect { o: Point, s: Size }  %struct.Size  = type { i64, i64 }
struct Flag { flag: Bool, c: Char }%struct.Rect  = type { ptr, ptr }
                                    %struct.Flag  = type { i1, i32 }
```

- 字段的 LLVM 类型取决于其 Dew IR 类型：`Int → i64`，`Bool → i1`，`Char → i32`，`Struct/Enum/Tuple/Array → ptr`。
- **所有对齐和大小由 LLVM 类型定义自动计算。**后端不手动计算 offset / sizeof。结构体定义在 LLVM IR 中，`getelementptr` 和 `load/store` 由 LLVM 处理对齐。例如复杂的嵌套结构 `{ i1, i32, i1 }` 由 LLVM 按目标 ABI 自动填充。
- 每个结构体分配在堆上（`malloc` 或 arena），寄存器只存指针。
- LLVM struct 字段顺序与 Dew 声明顺序一致。位序从 0 开始。

**大小计算：** 按 LLVM 类型逐字段求和（归整到 8 字节对齐）。
```
sizeof(Point) = 16 (= 2 × 8)
sizeof(Size)  = 16
sizeof(Rect)  = 16 (= 2 × 8, 两个 ptr)
sizeof(Flag)  = 8  (= 1 + 4 → round up to 8)
```

### §3.3 枚举

```
Dew IR:                              LLVM IR:
enum Option { None, Some(Int) }     %enum.Option = type { i64, { 8 x i8 } }
enum Result { Ok(Int),              %enum.Result = type { i64, { 16 x i8 } }
              Err(Int, Int) }

enum Event {                         %enum.Event.KeyPress= type { i64, i64 }
  KeyPress { key: Int, mod: Int },   %enum.Event = type { i64, { 16 x i8, ptr } }
  Quit,
}
```

- 枚举用 `{ tag: i64, payload: union }` layout。
- `tag`：判别值，按声明顺序自动赋予 0, 1, 2, ...
- `payload`：所有变体中最大的 payload 的按位 union。用一个 `{ max_size x i8 }` 字节数组占位（内嵌 `ptr` 则包含 ptr）。

**⚠ 访问 payload 必须通过 `getelementptr` 字段索引（字段 0 = tag，字段 1 = payload），不可硬编码 offset = 8。** LLVM 会根据类型自动计算正确的对齐偏移。

```
访问 tag:    %tp = getelementptr %enum.T, ptr %p, i32 0, i32 0
访问 payload: %pp = getelementptr %enum.T, ptr %p, i32 0, i32 1
```

### §3.4 元组

```
Dew IR:                             LLVM IR:
Tuple([Int, Bool, Char])           { i64, i64, i64 }
```

- 元组与匿名结构体相同：堆分配，字段全部 `i64`。
- `tuple_lit` → `malloc` + 依次 `store` 字段 + 返回指针。
- `tuple_update` → 读取 base 指针 → `getelementptr` + `store` 对应字段（原位修改）。

### §3.5 数组

Dew 的数组 `Array(T, N)` 翻译为堆指针 + 长度的组合，而非 LLVM 内联 struct。这避免了对大数组产生巨型类型定义，且与 C 数组模型兼容：

```
Dew IR:                             LLVM IR:
Array(Int, N)                      { ptr, i64 }          ; 指针 → 堆上 N 个元素, i64 = 长度
Array(Point, N)                    { ptr, i64 }
```

所有数组统一表示为 `{ ptr, i64 }`——数据指针 + 元素个数。元素在堆上连续存储。

**构造（`array_lit`）：** `%size = mul i64 N, elem_size` → `%ptr = call ptr @malloc(i64 16)` → 依次 `getelementptr` → `store` 每个元素 → 存指针 + 长度。

**构造（`array_fill`）：** `malloc(N × elem_size)` → 循环 `getelementptr + store` 同一个值 N 次 → 存指针 + 长度。

**访问（`array_access`）：** 加载数组指针 → `getelementptr` 到第 `i` 个元素 → `load`。

**更新（`array_update`）：** 加载数组指针 → `getelementptr` 到第 `i` 个元素 → `store` 新值。

**元素大小（编译期查表）：**
| 元素类型 | 字节数 |
|---------|-------|
| `Int` | 8 |
| `Bool` | 1 |
| `Char` | 4 |
| 聚合类型（Struct/Enum/Tuple/Array） | 8（存 ptr） |

数组长度 `N` 是编译期常量（`Array(T, N)`），LLVM 中直接用立即数。

### §3.6 函数指针与闭包

| 类型 | LLVM | 说明 |
|------|------|------|
| `fn(Int, Int) -> Int` | `ptr` | 静态函数指针，`call i64 %fn_ptr(...)` |
| 闭包 | `ptr` 指向 `%closure.X` | 堆分配 struct，含函数指针 + 捕获值 |

详情见 [§7 闭包系统](#7-闭包系统)。

---

## §4 函数（fn）的翻译

### §4.1 函数签名

```
Dew IR:                              LLVM IR:
fn @add(%0: Int, %1: Int)           define i64 @add(i64 %arg0, i64 %arg1)
  { blocks }                          { ... }

fn @main()                          define i32 @main()
  { blocks }                          { ... }
                                      ; main 返回程序退出码
```

- 函数参数全部为 `i64`（标量值）或 `ptr`（聚合指针）。
- `@main` 是特殊函数：返回类型固定为 `i32`（程序退出码），而非 IR 中的 `Unit`。
- Thunk force 函数返回 `i64`（缓存值的标量表示，聚合类型则返回指针）。

### §4.2 寄存器分配策略

每个 IR 寄存器 `Reg(编号)` 在函数入口处分配一个 LLVM `alloca`。**alloca 的类型取决于寄存器的 Dew IR 类型**：

- `Int` → `alloca i64`
- `Bool` → `alloca i1`
- `Char` → `alloca i32`
- 聚合类型（`Struct`/`Enum`/`Tuple`/`Array`）→ `alloca ptr`

类型信息通过扫描所有基本块中的指令获取：
1. 函数参数声明（`params`）
2. 指令的类型注解（`add` → `Int`、`lt` → `Bool` 等）
3. TypeTable 中的 struct/enum 定义

示例：
```
Dew IR:  fn @f(%0: Int, %1: Bool)
          entry:
            %2: Bool = lt %0, %3
            ret %2

LLVM IR: define i1 @f(i64 %arg0, i1 %arg1) {
         entry:
           %R0 = alloca i64          ; reg 0: Int 参数
           %R1 = alloca i1           ; reg 1: Bool 参数
           %R2 = alloca i1           ; reg 2: Bool 结果
           store i64 %arg0, ptr %R0
           store i1  %arg1, ptr %R1
           %v0 = load i64, ptr %R0
           %v3 = load i64, ptr %R3
           %c  = icmp slt i64 %v0, %v3
           store i1 %c, ptr %R2      ; icmp 直接返回 i1，无需 zext
           %rv = load i1, ptr %R2
           ret i1 %rv
         }
```

### §4.3 基本块翻译

```
Dew IR:                              LLVM IR:
entry:                               entry:
  %0: Int = lit 1                      store i64 1, ptr %R0
  br %cond L_then L_else               %cond = load i64, ptr %Rcond
                                       %b = trunc i64 %cond to i1
                                       br i1 %b, label %L_then, label %L_else

L_then:                              L_then:
  %1: Int = lit 42                     store i64 42, ptr %R1
  jmp merge                            br label %merge

L_else:                              L_else:
  %2: Int = lit 0                      store i64 0, ptr %R2
  jmp merge                            br label %merge

merge:                               merge:
  %3 = phi [%1 L_then]                 %v1 = load i64, ptr %R1
    [%2 L_else]                        %v2 = load i64, ptr %R2
  ret %3                              %phi = phi i64 [%v1, %L_then], [%v2, %L_else]
                                       store i64 %phi, ptr %R3
                                       %rv = load i64, ptr %R3
                                       ret i64 %rv
```

- 每个 Dew 标签映射为同名的 LLVM 标签。
- `phi` 指令收集每个前驱块的对应寄存器值并做 LLVM `phi`。合并结果存入目标寄存器。
- LLVM `phi` 是 SSA 值，不使用 alloca。用完后如有需要 `store` 回 alloca 供后续使用。

### §4.4 终结符翻译

| Dew IR | LLVM IR |
|--------|---------|
| `ret %r`（Int） | `%v = load i64, ptr %R_r`；`ret i64 %v` |
| `ret %r`（Bool） | `%v = load i1, ptr %R_r`；`ret i1 %v` |
| `ret %r`（Char） | `%v = load i32, ptr %R_r`；`ret i32 %v` |
| `ret %r`（聚合） | `%v = load ptr, ptr %R_r`；`ret ptr %v` |
| `ret{Unit}` | `ret void` |
| `br %c L_t L_f` | `%v = load i1, ptr %R_c`；`br i1 %v, label %L_t, label %L_f` |
| `jmp L_t` | `br label %L_t` |

---

## §5 指令翻译——完整参考

以下所有指令翻译假设 `R_r` 表示寄存器 `r` 对应的 alloca 变量名（如 `%R0`, `%R1`...）。

### §5.1 字面量 `lit`

| Dew IR | LLVM IR | 说明 |
|--------|---------|------|
| `%r = lit N` (Int) | `store i64 N, ptr %R_r` | 字面量直接存入 alloca |
| `%r = lit true` | `store i1 true, ptr %R_r` | LLVM 原生 `i1` |
| `%r = lit false` | `store i1 false, ptr %R_r` | |
| `%r = lit 'X'` | `store i32 codepoint, ptr %R_r` | Unicode 码点值 |
| `%r = lit ()` (Unit) | 跳过，不生成代码 | Unit 无值 |

### §5.2 算术运算 `add, sub, mul, div, rem`

| Dew IR | LLVM IR |
|--------|---------|
| `%r = add %a %b` | `%va = load i64, ptr %R_a`；`%vb = load i64, ptr %R_b`；`%s = add i64 %va, %vb`；`store i64 %s, ptr %R_r` |
| `%r = sub %a %b` | 同上，`sub i64` |
| `%r = mul %a %b` | 同上，`mul i64` |
| `%r = div %a %b` | 同上，`sdiv i64`（有符号除） |
| `%r = rem %a %b` | 同上，`srem i64`（有符号模） |

### §5.3 位运算 `bit_and, bit_or, bit_xor, shl, shr`

| Dew IR | LLVM IR |
|--------|---------|
| `%r = bit_and %a %b` | load + `and i64` + store |
| `%r = bit_or %a %b` | load + `or i64` + store |
| `%r = bit_xor %a %b` | load + `xor i64` + store |
| `%r = shl %a %b` | load + `shl i64` + store |
| `%r = shr %a %b` | load + `ashr i64` + store（算术右移） |

### §5.4 比较 `lt, gt, le, ge, eq, ne`

| Dew IR | LLVM IR |
|--------|---------|
| `%r = lt %a %b` | `%va = load i64, ptr %R_a`；`%vb = load i64, ptr %R_b`；`%c = icmp slt i64 %va, %vb`；`store i1 %c, ptr %R_r` |
| `%r = gt %a %b` | 同上，`icmp sgt` |
| `%r = le %a %b` | 同上，`icmp sle` |
| `%r = ge %a %b` | 同上，`icmp sge` |
| `%r = eq %a %b` | 同上，`icmp eq` |
| `%r = ne %a %b` | 同上，`icmp ne` |

> `icmp` 直接返回 `i1`，无需 `zext` 到 `i64`。分支时 `br i1 %c` 直接消费。

### §5.5 逻辑 `and, or, not`

| Dew IR | LLVM IR |
|--------|---------|
| `%r = and %a %b` | `%va = load i1, ptr %R_a`；`%vb = load i1, ptr %R_b`；`%c = and i1 %va, %vb`；`store i1 %c, ptr %R_r` |
| `%r = or %a %b` | 同上，`or i1` |
| `%r = not %a` | `%v = load i1, ptr %R_a`；`%c = xor i1 %v, true`；`store i1 %c, ptr %R_r` |

### §5.6 控制流 `phi, br, jmp, ret`

参见 [§4.3](#43-基本块翻译) 和 [§4.4](#44-终结符翻译)。

关键点：
- `br %cond` 直接用 `load i1` + `br i1`，无需类型转换。
- `phi` 的类型根据合并的每个源寄存器类型确定（**IR 层保证所有源类型一致**，后端做 `assert` 验证）。`Int → phi i64`，`Bool → phi i1`，`Char → phi i32`，聚合 → `phi ptr`。如果源类型不一致，后端报编译错误。

### §5.7 结构体 `struct_cons, field, struct_update`

#### struct_cons——构造结构体

```
Dew IR:                                            LLVM IR:
; 以 struct Point { x: Int, y: Int } 为例
%r = struct_cons{Point} @Point %x %y               
                                                    %ptr = call ptr @malloc(i64 16)
                                                    ; OOM 检查（所有 malloc 都需此模式，后文省略）
                                                    %isnull = icmp eq ptr %ptr, null
                                                    br i1 %isnull, label %oom, label %ok
                                                  oom:
                                                    call void @llvm.trap()
                                                    unreachable
                                                  ok:
                                                    %fx = getelementptr i64, ptr %ptr, i32 0
                                                    %fy = getelementptr i64, ptr %ptr, i32 1
                                                    %vx = load i64, ptr %R_x
                                                    store i64 %vx, ptr %fx
                                                    %vy = load i64, ptr %R_y
                                                    store i64 %vy, ptr %fy
                                                    store ptr %ptr, ptr %R_r
```

- 分配堆内存（`@malloc`），大小由 LLVM 类型定义自动决定，Lowering 中不手动计算字段偏移和大小。**所有 `@malloc` 均需 OOM 检查（首个示例已展示完整模式，后续省略）。**
- **`getelementptr` 的类型由字段的 Dew IR 类型决定：** `Int→i64`，`Bool→i1`，`Char→i32`，聚合类型→`ptr`。
- 对于包含 `Bool` 或 `Char` 字段的结构体：
```
struct Flag { b: Bool, c: Char }    → %struct.Flag = type { i1, i32 }
                                     %fb = getelementptr i1, ptr %ptr, i32 0
                                     %fc = getelementptr i32, ptr %ptr, i32 1
```
同样，对于嵌套的聚合类型字段（如 `Rect { o: Point }`），字段槽存的是 `ptr`：
```
// %rect = call ptr @malloc(i64 16)  — 上文已分配 Rect
%fo = getelementptr ptr, ptr %rect, i32 0   ; 字段 0: o → 存 Point 指针
%point_p = load ptr, ptr %fo                 ; 取出 Point 指针
```

#### field——读取字段

```
Dew IR:                           LLVM IR:
%r = field @Point %p .x            %ptr = load ptr, ptr %R_p         ; load struct pointer
                                    %fp = getelementptr i64, ptr %ptr, i32 0  ; field index 0
                                    %v  = load i64, ptr %fp
                                    store i64 %v, ptr %R_r
```

- 对于结构体字段的类型为结构体（如 `Rect.o: Point`），`field` 返回的是指针（`ptr`），不是值。此时 alloca 用 `alloca ptr` 而非 `alloca i64`。

```
%r = field @Rect %rct .o           %ptr = load ptr, ptr %R_rct
                                    %fp = getelementptr ptr, ptr %ptr, i32 0
                                    %v  = load ptr, ptr %fp          ; 子结构体指针
                                    store ptr %v, ptr %R_r
```

#### struct_update——更新字段

```
Dew IR:                                            LLVM IR:
%r = struct_update{T} %base .x = %val               %bp = load ptr, ptr %R_base
  (原位模式 in_place=true)                           %fp = getelementptr i64, ptr %bp, i32 fidx
                                                     %v  = load i64, ptr %R_val
                                                     store i64 %v, ptr %fp        ; 直接写，零克隆
                                                     store ptr %bp, ptr %R_r
```

如果 `in_place=false`（非同一标识符 shadow），则先深拷贝整个结构体（`malloc` + `memcpy` 字段），再修改。对 LLVM 后端而言：

- `in_place=true`：如上，`getelementptr` + `store`，原位修改。
- `in_place=false`：`malloc` 新结构体 → 复制所有字段 → 修改目标字段 → 返回新指针。

### §5.8 枚举 `enum_cons, enum_disc, enum_proj`

以 `enum Option { None, Some(Int) }` 为例：

#### enum_cons——构造枚举

```
Dew IR:                              LLVM IR:
%r = enum_cons{Option}               ; None: tag=0, payload 不用
  @Option::None                      
                                     %ptr = call ptr @malloc(i64 16)
                                     ; 存 tag = 字段 0
                                     %tp = getelementptr inbounds %enum.Option, ptr %ptr, i32 0, i32 0
                                     store i64 0, ptr %tp
                                     store ptr %ptr, ptr %R_r

%r = enum_cons{Option}               ; Some(42)
  @Option::Some %val                 %ptr = call ptr @malloc(i64 16)
                                     ; 存 tag
                                     %tp = getelementptr inbounds %enum.Option, ptr %ptr, i32 0, i32 0
                                     store i64 1, ptr %tp
                                     ; 存 payload = 字段 1
                                     %pp = getelementptr inbounds %enum.Option, ptr %ptr, i32 0, i32 1
                                     %pc = bitcast ptr %pp to ptr
                                     %vv = load i64, ptr %R_val
                                     store i64 %vv, ptr %pc
                                     store ptr %ptr, ptr %R_r
```

- **所有枚举字段访问必须通过 `getelementptr inbounds %enum.T, ..., i32 0, i32 N`，禁止硬编码偏移。**

#### enum_disc——读取判别值

```
Dew IR:                           LLVM IR:
%r = enum_disc %ev                  %ptr = load ptr, ptr %R_ev
                                    ; getelementptr 到字段 0 = tag
                                    %tp = getelementptr inbounds %enum.T, ptr %ptr, i32 0, i32 0
                                    %tag = load i64, ptr %tp
                                    store i64 %tag, ptr %R_r
```

#### enum_proj——投影 payload

```
Dew IR:                              LLVM IR:
%r = enum_proj{T} @Option::Some      %ptr = load ptr, ptr %R_ev
  [0] %ev                            ; getelementptr 到字段 1 = payload
                                     %pp = getelementptr inbounds %enum.Option, ptr %ptr, i32 0, i32 1
                                     %pc = bitcast ptr %pp to ptr
                                     %val = load i64, ptr %pc         ; load 字段值
                                     store i64 %val, ptr %R_r
```

- `[0]` 是 payload union 中第 0 个字段。**使用 `getelementptr %enum.T, ptr %p, i32 0, i32 1` 通过字段索引访问 payload——永远不用硬编码偏移。**
- 如果投影的 payload 是结构体类型，用 `getelementptr` 逐字段获取。

### §5.9 元组 `tuple_lit, tuple_update`

#### tuple_lit——构造元组

```
Dew IR:                              LLVM IR:
%r = tuple_lit{(Int,Bool)} %a %b     %ptr = call ptr @malloc(i64 16)
                                     %va = load i64, ptr %R_a
                                     %vb = load i64, ptr %R_b
                                     %f0 = getelementptr i64, ptr %ptr, i32 0
                                     store i64 %va, ptr %f0
                                     %f1 = getelementptr i64, ptr %ptr, i32 1
                                     store i64 %vb, ptr %f1
                                     store ptr %ptr, ptr %R_r
```

#### tuple_update——更新元组字段

```
Dew IR:                            LLVM IR:
%r = tuple_update %t .0 = %v       %tp = load ptr, ptr %R_t
  (in_place=true)                  %fp = getelementptr i64, ptr %tp, i32 0
                                    %val = load i64, ptr %R_v
                                    store i64 %val, ptr %fp       ; 原位修改
                                    store ptr %tp, ptr %R_r
```

### §5.10 数组 `array_lit, array_fill, array_access, array_update`

**所有数组在寄存器中存储为 `ptr`（指向 `{ ptr, i64 }` 结构体的指针）。** 操作时先用 `getelementptr` 读取数据指针和长度。

#### array_lit——构造数组（显式元素列表，假设 N=3，元素类型=Int）

```
Dew IR:                              LLVM IR:
%r = array_lit{Array(Int,3)}          elem_size = 8（Int）
  %a %b %c                           %meta = call ptr @malloc(i64 16)
                                     %data = call ptr @malloc(i64 24)         ; 3 × 8

                                     %fp = getelementptr ptr, ptr %meta, i32 0
                                     store ptr %data, ptr %fp
                                     %fl = getelementptr i64, ptr %meta, i32 1
                                     store i64 3, ptr %fl

                                     ; 用字段类型对应的 GEP
                                     %v0 = load i64, ptr %R_a
                                      %e0 = getelementptr i64, ptr %data, i32 0
                                     store i64 %v0, ptr %e0
                                     ; 同上依次处理 %b → i32 1, %c → i32 2
                                     store ptr %meta, ptr %R_r
```

> **元素大小取决于数组元素类型。** `Int→∞ 8`，`Bool→∞ 1`（`getelementptr i1`），`Char→∞ 4`（`getelementptr i32`），聚合类型→∞ 8（`getelementptr ptr`）。`malloc` 时用 `N × elem_size`。`N` 是编译期常量，直接用 LLVM 立即数。

#### array_fill——构造数组（重复值，假设计 N=200, 元素类型=Int）

```
Dew IR:                              LLVM IR:
%r = array_fill{Array(Int,200)}       ; N=200 是编译期常量，直接用立即数
  %val                                elem_size = 8（Int）
                                     %meta = call ptr @malloc(i64 16)

                                     ; 存数据指针 → 字段 0
                                     %size = mul i64 200, 8                ; N × elem_size，N 是立即数
                                     %data = call ptr @malloc(i64 16)
                                     %fp = getelementptr ptr, ptr %meta, i32 0
                                     store ptr %data, ptr %fp
                                     %fl = getelementptr i64, ptr %meta, i32 1
                                     store i64 200, ptr %fl                ; N 是立即数

                                     ; 循环写入
                                     %vv = load i64, ptr %R_val
                                     %i = alloca i64
                                     store i64 0, ptr %i
                                     br label %fill_loop
                                   fill_loop:
                                     %ci = load i64, ptr %i
                                     %done = icmp eq i64 %ci, 200
                                     br i1 %done, label %fill_done, label %fill_body
                                   fill_body:
                                     %ep = getelementptr i64, ptr %data, i64 %ci   ; elem_size=8→i64
                                     store i64 %vv, ptr %ep
                                     %ni = add i64 %ci, 1
                                     store i64 %ni, ptr %i
                                     br label %fill_loop
                                   fill_done:
                                     store ptr %meta, ptr %R_r
```

#### array_access——读取数组元素

```
Dew IR:                            LLVM IR:
%r = array_access{T} %arr %idx      %mp = load ptr, ptr %R_arr            ; 加载元数据指针 { ptr, i64 }
                                    ; 取数据指针 = 字段 0
                                    %fdp = getelementptr ptr, ptr %mp, i32 0
                                    %dp = load ptr, ptr %fdp              ; 数据指针
                                    %iv = load i64, ptr %R_idx
                                    %ep = getelementptr T_llvm, ptr %dp, i64 %iv
                                    %v  = load T_llvm, ptr %ep
                                    store T_llvm %v, ptr %R_r
```

#### array_update——更新数组元素

```
Dew IR:                                      LLVM IR:
%r = array_update{Array(T,N)}                  %mp = load ptr, ptr %R_arr
  %arr %idx %val  (in_place=true)              ; 取数据指针
                                               %fdp = getelementptr ptr, ptr %mp, i32 0
                                               %dp = load ptr, ptr %fdp
                                               %iv = load i64, ptr %R_idx
                                               %ep = getelementptr T_llvm, ptr %dp, i64 %iv
                                               %vv = load T_llvm, ptr %R_val
                                               store T_llvm %vv, ptr %ep
                                               store ptr %mp, ptr %R_r    ; 同一元数据指针
```

`in_place=false` 时：`malloc` 新元数据 + 新数据空间 → 拷贝整个旧数组 → 修改目标元素 → 返回新指针。

> **`%mp` 是数组元数据结构的指针（`{ ptr, i64 }`），不可直接 `load ptr, ptr %mp` 当数据指针用。** 必须通过 `getelementptr ptr, ptr %mp, i32 0` 取字段 0 再 `load`。

### §5.11 函数调用 `call`

#### 静态调用

```
Dew IR:                              LLVM IR:
%r = call{T} @add %a %b              %va = load i64, ptr %R_a
                                     %vb = load i64, ptr %R_b
                                     %rv = call i64 @add(i64 %va, i64 %vb)
                                     store i64 %rv, ptr %R_r
```

- 被调函数已在 `module.fns` 中。函数签名映射见 [§4.1](#41-函数签名)。

#### 动态调用（闭包）——含尾部调用优化

对于尾位置的动态调用（`call %f` 是基本块最后一条指令，后跟 `jmp merge; phi; ret` 或直接 `ret`），使用 LLVM `musttail` 标记消除栈帧分配：

```
Dew IR:                              LLVM IR:
%r = call{T} %f %a %b               %fp = load ptr, ptr %R_f
  (尾位置，%r 直通 ret)              %fnp= getelementptr ptr, ptr %fp, i32 0
                                     %fn = load ptr, ptr %fnp
                                     %va = load i64, ptr %R_a
                                     %vb = load i64, ptr %R_b
                                     %rv = musttail call i64 %fn(ptr %fp, i64 %va, i64 %vb)
                                     ret i64 %rv
```

非尾位置的普通调用仍用 `call` + `store`：

```
Dew IR:                              LLVM IR:
%r = call{T} %f %a %b               %fp = load ptr, ptr %R_f
  (非尾位置，%r 后有其他指令)         %fnp= getelementptr ptr, ptr %fp, i32 0
                                     %fn = load ptr, ptr %fnp
                                     %va = load i64, ptr %R_a
                                     %vb = load i64, ptr %R_b
                                     %rv = call i64 %fn(ptr %fp, i64 %va, i64 %vb)
                                     store i64 %rv, ptr %R_r
```

- 闭包 struct 第一个字段是函数指针。
- 调用时把闭包自身指针 `%fp` 作为第一个参数（环境指针），后面是用户参数。
- `musttail` 要求 callee 返回类型与 caller 返回类型完全一致。**如果类型不匹配（例如 caller 返回 `i64` 而 callee 返回 `i1`），则降级为普通 `call`**（放弃 TCO）。
- 详情见 [§7 闭包系统](#7-闭包系统)。

### §5.12 闭包 `lambda`

```
Dew IR:                                            LLVM IR:
%r = lambda{T} @closure_0(%c0, %c1)                ; 2 个捕获
                                                    ; { ptr, i64, i64 } = 24 bytes
                                                    %ptr = call ptr @malloc(i64 24)

                                                    ; 字段 0: 函数指针
                                                    %fp = getelementptr ptr, ptr %ptr, i32 0
                                                    store ptr @closure_0, ptr %fp

                                                    ; 字段 1: 捕获值 %c0
                                                    %f1 = getelementptr i64, ptr %cp, i32 1
                                                    %v0 = load i64, ptr %R_c0
                                                    store i64 %v0, ptr %f1

                                                    ; 字段 2: 捕获值 %c1
                                                    %f2 = getelementptr i64, ptr %cp, i32 2
                                                    %v1 = load i64, ptr %R_c1
                                                    store i64 %v1, ptr %f2


                                                   store ptr %ptr, ptr %R_r
```

- 闭包 struct 内存布局：`{ ptr, i64, i64, ... }`（函数指针 + 各捕获值）。
- **捕获值统一存入 `i64` 槽。**如果捕获的类型是 `Bool`（`i1`），通过 `zext i1 to i64` 存入，闭包体内从 `env` 取出后 `trunc i64 to i1` 还原。`Char`（`i32`）同理 `zext i32 to i64`→存储→`trunc i64 to i32`→使用。
- **捕获聚合类型时只复制指针（8 字节存入 `i64` 槽）**，不深拷贝堆对象。聚合类型在寄存器中本身就是 `ptr`，`ptrtoint` 转为 `i64` 存入。
- 详情见 [§7.1](#71-闭包构造-lambda)。

### §5.13 Thunk `force, update`

#### force——强制求值 thunk

```
Dew IR:                           LLVM IR:
%r = force @x                      %rv = call i64 @force_x()
                                   store i64 %rv, ptr %R_r

%r = force{T} %reg                 ; 动态 thunk 引用
                                   %tp = load ptr, ptr %R_reg       ; %reg 的 alloca 存 thunk cell 指针
                                   %rv = call i64 @force_dyn(ptr %tp)
                                   store i64 %rv, ptr %R_r
```

静态 force 直接 call；动态 force 通过函数表分发（现阶段用统一的 `@force_dyn` 包装函数，读取 cell 的 tag 然后 eval/cached/cycle）。

#### update——更新 thunk 值

```
Dew IR:                           LLVM IR:
update @x %r                       %vp = getelementptr %thunk, ptr @x.cell, i32 0, i32 1
                                   %v  = load i64, ptr %R_r
                                   store i64 %v, ptr %vp
                                   store i64 2, ptr %state_ptr      ; → evaluated
```

- LLVM 中 update 直接写入 thunk 缓存并标记 state=2。
- 旧的 `%thunk` 类型定义从代码中获取（size = 16 字节）。

### §5.14 I/O `stdout, stdin`

#### stdout

```
Dew IR:                            LLVM IR:
stdout %r  (Int)                   %v = load i64, ptr %R_r
                                   call i32 (ptr, ...) @printf(ptr @.fmt_int, i64 %v)

stdout %r  (Bool)                  %v = load i1, ptr %R_r
                                   %s = select i1 %v, ptr @.str_true, ptr @.str_false
                                   call i32 (ptr, ...) @printf(ptr @.fmt_bool, ptr %s)

stdout %r  (Char)                  %v = load i32, ptr %R_r
                                   call i32 @putchar(i32 %v)

stdout %r  (Unit)                   ; 空操作，不生成任何 LLVM 指令
```

#### stdin

```
Dew IR:                            LLVM IR:
; Int:
%r = stdin{Int}                    call i32 (ptr, ...) @scanf(ptr @.fmt_int, ptr %R_r)

; Bool: 读整数 → 非零为 true
%r = stdin{Bool}                   %tmp = alloca i64
                                   call i32 (ptr, ...) @scanf(ptr @.fmt_int, ptr %tmp)
                                   %val = load i64, ptr %tmp
                                   %cmp = icmp ne i64 %val, 0
                                   store i1 %cmp, ptr %R_r

; Char: 用 getchar()
%r = stdin{Char}                   %c = call i32 @getchar()
                                   store i32 %c, ptr %R_r

; &x -> stdin（borrow 形式）
                                   ; R_x 是 x 的 alloca，scanf 直接写入
                                   call i32 (ptr, ...) @scanf(ptr @.fmt_int, ptr %R_x)
```

### §5.15 移动 `move`

`move` 是**浅拷贝**（所有权转移）：只复制寄存器值本身，不深拷贝堆对象。对于标量类型，复制值；对于聚合类型，复制指针（两个指针指向同一个堆对象，由仿射类型系统保证旧指针不再使用）。

```
Dew IR:                            LLVM IR:
%r = move %from  (Int)              %v = load i64, ptr %R_from
                                    store i64 %v, ptr %R_r

%r = move %from  (Bool)             %v = load i1, ptr %R_from
                                    store i1 %v, ptr %R_r

%r = move %from  (Char)             %v = load i32, ptr %R_from
                                    store i32 %v, ptr %R_r

%r = move %from  (Struct)           %v = load ptr, ptr %R_from       ; 只复制指针
                                    store ptr %v, ptr %R_r            ; 不深拷贝
```

---

## §6 惰性求值：thunk 系统

### §6.1 Thunk 缓存结构

每个 thunk 分配一个全局缓存单元。缓存值统一用 `i64` 存储，所有类型在存入/取出时转换：

```llvm
%thunk = type { i64, i64 }
; field 0: state (0=suspended, 1=evaluating, 2=evaluated)
; field 1: cached_value (统一 i64)
```

**跨类型存入/读取规则：**

| thunk 返回类型 | 存入缓存 | 从缓存读取 |
|--------------|---------|----------|
| `Int` | `store i64 %v, ptr %cache` | `%v = load i64, ptr %cache`，返回 `i64` |
| `Bool` | `%e = zext i1 %v to i64` → `store i64 %e` | `%cv = load i64` → `%v = trunc i64 %cv to i1` |
| `Char` | `%e = zext i32 %v to i64` → `store i64 %e` | `%cv = load i64` → `%v = trunc i64 %cv to i32` |
| 聚合类型（ptr） | `%e = ptrtoint ptr %v to i64` → `store i64 %e` | `%cv = load i64` → `%v = inttoptr i64 %cv to ptr` |

force 函数的返回类型不再是统一的 `i64`——**force 函数返回其 thunk 结果的实际 LLVM 类型**（`i64`/`i1`/`i32`/`ptr`）。缓存始终用 `i64`，读写时做转换。

### §6.2 Force 函数的 3-state FSM

每个 thunk `@x` 生成 `define i64 @force_x()`：

```
state = 0 (suspended) → evaluate body → write result to cell[1] → state = 2 → return
state = 1 (evaluating) → cycle detected → llvm.trap()
state = 2 (evaluated)  → load cell[1] → return
```

生成算法见 [§11.1](#111-简单-thunk惰性求值) 示例。

### §6.3 Update 操作

`update` 指令将闭包值写入 thunk，用于 `def rec __wb = fn(...) { ... }` 等递归定义模式。

更新后 thunk state 变为 2（evaluated），后续 `force` 直接返回缓存值。

---

## §7 闭包系统

### §7.1 闭包构造 `lambda`

闭包 = 堆分配 struct `{ ptr, i64, ..., i64 }`：
- **字段 0：函数指针。**指向被提升的顶层函数（如 `@closure_0`）。
- **字段 1..N：捕获值。**每个自由变量按顺序存入 `i64` 槽。

被提升的闭包函数签名：

```
; 原始闭包：fn(x: Int) -> Int  捕获 y: Int
define i64 @closure_0(ptr %env, i64 %arg0) {
  ; %env 指向闭包 struct
  %f1 = getelementptr i64, ptr %env, i32 1     ; 字段 1 = 捕获 y
  %captured_y = load i64, ptr %f1
  ; ... 函数体 ...
}
```

### §7.2 静态调用

`call @f %a %b` → `call i64 @f(i64 %a, i64 %b)`。被调函数已在 `module.fns` 中。

### §7.3 动态调用

`call %f %a %b` 其中 `%f` 是闭包指针：

1. load 闭包 struct 字段 0 = 函数指针
2. `call i64 %fn_ptr(ptr %closure, i64 %a, i64 %b)`

LLVM 尾部调用优化（`musttail`）可用于自递归闭包的 `call %f`。

---

## §8 match 和 if/else

### §8.1 匹配在 IR 中的形态

Dew 的 `match` 在 IR 中以两种形式出现：

1. **布尔匹配**：`match (cond) { true => ..., false => ... }`
   - IR: `br %cond L_true L_false`，两个分支分别求值，最后 `phi` 合并。
2. **枚举匹配**：`match e { VariantA(payload) => ..., VariantB => ... }`
   - IR: `%disc = enum_disc %e` → 与各变体的 tag 比较 → `br` 到对应分支 → `enum_proj` 提取 payload → 执行分支体 → `phi` 合并结果。

### §8.2 布尔匹配 → LLVM br

```
Dew IR:                                    LLVM IR:
%0: Int = lit <condition result>
br %0 L_true L_false                        %v = load i64, ptr %R0
L_true: ...                                  %b = trunc i64 %v to i1
jmp merge                                    br i1 %b, label %L_true, label %L_false
L_false: ...                               L_true: ...
jmp merge                                    br label %merge
merge:                                     L_false: ...
  %final = phi [%val_true L_true]             br label %merge
    [%val_false L_false]                   merge:
  ret %final                                  %phi = phi i64 [%vt, %L_true], [%vf, %L_false]
                                              store i64 %phi, ptr %R_final
                                              ret i64 %phi
```

### §8.3 枚举匹配 → LLVM switch

```
Dew IR:                                    LLVM IR:
%0: Int = enum_disc %ev                   ; enum_disc → load tag
; 现在比较 %0 与各变体 tag

br (eq %0 0) L_v00 L_chk1                 ; tag == 0?
L_v00:                                      vs. 用 switch 指令
  %p = enum_proj @Color::Red[0] %ev
  ...
```

实际实现：

```llvm
%ptr = load ptr, ptr %R_ev
%tagp = getelementptr i64, ptr %ptr, i32 0
%tag = load i64, ptr %tagp
switch i64 %tag, label %no_match [
  i64 0, label %L_v0    ; Variant 0
  i64 1, label %L_v1    ; Variant 1
  ...
]
```

每个变体分支中：
- `enum_proj` → `getelementptr` 到 payload → `load` 对应字段
- 执行分支体
- `br label %merge`（如有 phi 汇聚）

---
## §9 原地修改优化

### §9.1 优化条件

对齐 IR 生成器：**仅当 `def name = name { ... }` 或 `&name = name { ... }`**（同一标识符 shadow 模式）且只有一个 Update 操作时，`in_place=true`。

### §9.2 StructUpdate 原位

```llvm
; def p = p { .x = 42 }   in_place=true
%pp  = load ptr, ptr %R_p                        ; load 结构体指针
%fpx = getelementptr <field_llvm_ty>, ptr %pp, i32 0  ; field 0（类型取决于字段）
store <field_llvm_ty> 42, ptr %fpx               ; 原位修改！
store ptr %pp, ptr %R_p_new                       ; 结果寄存器存同一指针
```

### §9.3 ArrayUpdate 原位

```llvm
; def arr = arr { [i] = val }   in_place=true
%mp = load ptr, ptr %R_arr                        ; 加载元数据指针
%fdp = getelementptr ptr, ptr %mp, i32 0          ; 取数据指针字段
%ap = load ptr, ptr %fdp                          ; 取数据指针
%iv = load i64, ptr %R_i
%ep = getelementptr <elem_llvm_ty>, ptr %ap, i64 %iv  ; 元素类型决定 GEP 类型
%vv = load <elem_llvm_ty>, ptr %R_val
store <elem_llvm_ty> %vv, ptr %ep                 ; 原位！
store ptr %mp, ptr %R_arr_new                     ; 同一元数据指针
```

---

## §10 while 循环

### §10.1 while-borrow 的 IR 形态

Dew 的 `while (&i; i < N) { body }` 被脱糖为 `__ControlFlow` 枚举 + 递归闭包：

```
thunk @%__wb@0() { ... }              ; 缓存闭包的 thunk
fn @closure_0(%captured_N, %param_i) { ; 闭包 = while 循环体
  entry:
    %cond = lt %param_i %captured_N
    br %cond L_body L_exit
  L_body:
    ... 执行 body ...
    %next_i = add %param_i 1
    %continue = enum_cons @__Continue::__Continue (%next_i,)
    ; 匹配 __Continue → 递归调用
    %proj = enum_proj @__Continue::__Continue[0] %continue
    %recur = force @%__wb@0
    %result = call %recur %proj
    jmp merge
  L_exit:
    %done = enum_cons @__Done::__Done (%param_i,)
    jmp merge
  merge:
    %final = phi [%result L_body] [%done L_exit]
    ret %final
}
```

### §10.2 LLVM 翻译策略

在 LLVM 中可以做得更高效——直接将 while 的递归闭包展开为 **循环 + goto**：

- `closure_0` 仍作为函数，但在其内部，`__Continue` 的分支不用递归调用，而是用 `br label %entry`（循环回跳）。

```
L_continue:
  ; 提取 payload 中的新参数
  %pv = getelementptr %thunk.T, ptr %cp, i32 0, i32 1
  %nv = inttoptr i64 %pv to ptr           ; 获取 { new_i, ... }
  store i64 %new_i, ptr %R_param_i        ; 更新参数寄存器
  br label %entry                           ; 跳回入口，重新检查条件！
```

**优点：** 不需要递归调用、不压栈、天然支持任意次数的循环。

---

## §11 完整示例

### §11.1 简单 thunk（惰性求值）

Dew 源码：`def a = 40 + 2;  def main = fn { a -> stdout }`

```
                              ; ========== 类型 ==========
                              %thunk = type { i64, i64 }
                              @.fmt_int = private constant [4 x i8] c"%ld\00"
                              declare i32 @printf(ptr, ...)
                              declare void @llvm.trap()

thunk @a() {                  ; ========== thunk @a ==========
  entry:                      @a.cell = global %thunk zeroinitializer
    %0: Int = lit 40
    %1: Int = lit 2           define i64 @force_a() {
    %2: Int = add %0 %1       entry:
    ret %2                      %sp = getelementptr %thunk, ptr @a.cell, i32 0, i32 0
}                               %st = load i64, ptr %sp
                                %is_susp = icmp eq i64 %st, 0
                                br i1 %is_susp, label %eval, label %chk
                              chk:
                                %is_eval = icmp eq i64 %st, 1
                                br i1 %is_eval, label %cycle, label %cached
                              eval:
                                store i64 1, ptr %sp
                                %R0 = alloca i64
                                %R1 = alloca i64
                                %R2 = alloca i64
                                store i64 40, ptr %R0
                                store i64 2, ptr %R1
                                %v0 = load i64, ptr %R0
                                %v1 = load i64, ptr %R1
                                %s  = add i64 %v0, %v1
                                store i64 %s, ptr %R2
                                %rv = load i64, ptr %R2
                                %vp = getelementptr %thunk, ptr @a.cell, i32 0, i32 1
                                store i64 %rv, ptr %vp
                                store i64 2, ptr %sp
                                ret i64 %rv
                              cached:
                                %cp = getelementptr %thunk, ptr @a.cell, i32 0, i32 1
                                %cv = load i64, ptr %cp
                                ret i64 %cv
                              cycle:
                                call void @llvm.trap()
                                unreachable
                              }

fn @main() {                  ; ========== @main ==========
  entry:                      define i32 @main() {
    %0: Int = force @a        entry:
    stdout %0                    %R0 = alloca i64
    ret %0                      %v = call i64 @force_a()
}                               store i64 %v, ptr %R0
                                %out = load i64, ptr %R0
                                call i32 (ptr, ...) @printf(ptr @.fmt_int, i64 %out)
                                ret i32 0
                              }
```

### §11.2 结构体 + 枚举 + match

Dew 源码：
```dew
struct Point { x: Int, y: Int }
enum Shape { Circle(Int), Rect(Int, Int) }
def area = fn(s: Shape) -> Int {
  match s {
    Circle(r) => r * r,
    Rect(w, h) => w * h,
  }
}
def main = fn {
  def c = Circle(5);
  area(c) -> stdout;
}
```

```
                              ; ========== 类型 ==========
                              %struct.Point = type { i64, i64 }
                              %enum.Shape = type { i64, { 16 x i8 } }
                                ; tag + payload (max of Circle{8} vs Rect{16} = 16)

                              ; ========== @area ==========
                              define i64 @area(i64 %arg0) {
                              entry:
                                %R0 = alloca ptr            ; reg 0: s: Shape
                                %R1 = alloca i64            ; 结果的 alloca
                                store i64 %arg0, ptr %R0

                                ; match s { ... }
                                %sp = load ptr, ptr %R0     ; 加载 shape 指针
                                %tp = getelementptr i64, ptr %sp, i32 0
                                %tg = load i64, ptr %tp     ; 读 tag

                                switch i64 %tg, label %no_match [
                                  i64 0, label %L_Circle
                                  i64 1, label %L_Rect
                                ]

                              L_Circle:                     ; Circle(r)
                                ; 通过字段索引访问 payload（不用硬编码偏移）
                                %pp = getelementptr inbounds %enum.Shape, ptr %sp, i32 0, i32 1
                                %pc = bitcast ptr %pp to ptr
                                %rr = load i64, ptr %pc
                                %s1 = mul i64 %rr, %rr      ; r * r
                                store i64 %s1, ptr %R1
                                br label %merge

                              L_Rect:                       ; Rect(w, h)
                                %pp2 = getelementptr inbounds %enum.Shape, ptr %sp, i32 0, i32 1
                                ; Rect payload = { i64, i64 }，逐字段 load
                                %pc2 = bitcast ptr %pp2 to ptr
                                %f0 = getelementptr i64, ptr %pc2, i32 0
                                %pw  = load i64, ptr %f0
                                %f1 = getelementptr i64, ptr %pc2, i32 1
                                %ph  = load i64, ptr %f1
                                %s2  = mul i64 %pw, %ph     ; w * h
                                store i64 %s2, ptr %R1
                                br label %merge

                              no_match:
                                ; 不完备匹配是运行时错误
                                call void @llvm.trap()
                                unreachable

                              merge:
                                %rv = load i64, ptr %R1
                                ret i64 %rv
                              }

                              ; ========== @main ==========
                              define i32 @main() {
                              entry:
                                ; def c = Circle(5)
                                %R0 = alloca ptr            ; c: Shape
                                
                                %sc = call ptr @malloc(i64 16)
                                ; 存 tag = 字段 0
                                %tp = getelementptr inbounds %enum.Shape, ptr %sc, i32 0, i32 0
                                store i64 0, ptr %tp        ; tag=0 (Circle)
                                ; 存 payload = 字段 1
                                %pp = getelementptr inbounds %enum.Shape, ptr %sc, i32 0, i32 1
                                %pc = bitcast ptr %pp to ptr
                                store i64 5, ptr %pc        ; payload: 5
                                store ptr %sc, ptr %R0

                                ; area(c)
                                %sv = load ptr, ptr %R0
                                %si = ptrtoint ptr %sv to i64
                                %area = call i64 @area(i64 %si)

                                ; -> stdout
                                call i32 (ptr, ...) @printf(ptr @.fmt_int, i64 %area)

                                ret i32 0
                              }
```

---

## §附录 A：LLVM 类型映射表

| Dew IR 类型 | 寄存器存储 | LLVM 内存类型 | 标量宽度 | 说明 |
|------------|-----------|-------------|---------|------|
| `Int` | `alloca i64` | `i64` | 64 bit | 有符号整数 |
| `Bool` | `alloca i1` | `i1` | 1 bit | `icmp` 直出 `i1`，`br` 直入 `i1` |
| `Char` | `alloca i32` | `i32` | 32 bit | Unicode 标量，与 C `wchar_t` 对齐 |
| `Unit` | 无 | — | — | 不产生值 |
| `Struct(name)` | `alloca ptr` | `%struct.name` | — | 堆分配，字段为 `i64`/`i1`/`i32`/`ptr` |
| `Enum(name)` | `alloca ptr` | `%enum.name` | — | 堆分配 |
| `Tuple(ts)` | `alloca ptr` | 匿名 struct | — | 堆分配 |
| `Array(T, N)` | `alloca ptr` | `{ ptr, i64 }`（元数据） | — | 元数据指针 + 长度；元素在堆上连续存储 |
| `Fun(p, r)` | — | `ptr` | — | 函数指针 |
| `ThunkRef(T)` | — | `ptr` | — | Thunk cell 指针 |

## §附录 B：IR 指令 → LLVM 指令速查表

| Dew IR | LLVM 核心指令 |
|--------|-------------|
| `lit N` | `store i64 N, ptr %R_r` |
| `add/sub/mul` | load + `add`/`sub`/`mul i64` + store |
| `div/rem` | load + `sdiv`/`srem i64` + store |
| `bit_and/or/xor/shl/shr` | load + `and`/`or`/`xor`/`shl`/`ashr i64` + store |
| `lt/gt/le/ge` | load + `icmp slt`/`sgt`/`sle`/`sge i64` + `store i1` |
| `eq/ne` | load + `icmp eq`/`ne i64` + `store i1` |
| `and/or/not (logic)` | `load i1` + `and`/`or`/`xor i1` + `store i1` |
| `phi` | `phi i64` / `phi i1` / `phi ptr`（根据目标寄存器类型） + store |
| `br %c L_t L_f` | `load i1` + `br i1 %b, label %L_t, label %L_f` |
| `jmp L` | `br label %L` |
| `ret %r` (Int) | `load i64, ptr %R_r` + `ret i64 %v` |
| `ret %r` (Bool) | `load i1, ptr %R_r` + `ret i1 %v` |
| `ret %r` (Char) | `load i32, ptr %R_r` + `ret i32 %v` |
| `ret %r` (聚合) | `load ptr, ptr %R_r` + `ret ptr %v` |
| `ret{Unit}` | `ret void` |
| `ret{Unit}` | `ret void` |
| `struct_cons` | `@malloc` + `getelementptr` + `store` |
| `field` | load ptr + `getelementptr` + `load` |
| `struct_update` | load ptr + `getelementptr` + `store` |
| `enum_cons` | `@malloc` + `store i64 %tag` + `getelementptr` + `store` payload |
| `enum_disc` | load ptr + `getelementptr i64, ..., 0` + `load i64` = tag |
| `enum_proj` | load ptr + `getelementptr inbounds %enum.T, ..., 0, 1` + `bitcast` + `load` payload |
| `tuple_lit` | `@malloc` + loop `getelementptr` + `store` |
| `tuple_update` | load ptr + `getelementptr` + `store` |
| `array_lit` | `@malloc` + loop `getelementptr` + `store` |
| `array_fill` | `@malloc` + loop `getelementptr` + `store` |
| `array_access` | load ptr + `getelementptr ..., i64 %idx` + `load` |
| `array_update` | load ptr + `getelementptr ..., i64 %idx` + `store` |
| `call @f` | `call i64 @f(i64 %a, ...)` + store |
| `call %f` | load ptr + `getelementptr ptr, ..., 0` + load fn_ptr + `call i64 %fn(ptr %env, i64 %a, ...)` + store |
| `lambda` | `@malloc` struct `{ptr, i64...}` + store fn_ptr + store captures |
| `force @x` | `call i64 @force_x()` + store |
| `update @x %r` | `getelementptr` + `store i64 %v` + `store i64 2` |
| `stdout %r` | load + `call @printf` / `call @putchar` |
| `stdin → %r` | Int: `call @scanf(ptr @.fmt_int, ptr %R_r)`；Bool: `alloca i64` + `@scanf` + `icmp ne 0`；Char: `call @getchar` |
| `move %r %m` | load + store |
