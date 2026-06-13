# 语言参考

## 语法

```
expr ::= INT | true | false | ()
       | IDENT
       | expr + expr | expr - expr | expr * expr | expr / expr
       | expr == expr | expr < expr | expr > expr
       | if expr { expr } else { expr }
       | fn ( IDENT : type ) { expr }       -- 带类型标注的参数
       | fn ( IDENT ) { expr }              -- 类型推断的参数
       | fn () { expr }                     -- unit 参数
       | fn { expr }                        -- unit 参数简写
       | expr expr                          -- 函数调用（并置）
       | expr -> expr                       -- 管道前向
       | !expr                              -- 严格性覆盖
       | def IDENT = expr ; expr
       | def IDENT = expr
       | dup IDENT = expr
       | fix IDENT : type { expr }
       | box ( expr )
       | unbox ( expr )
       | nil | cons ( expr , expr )
       | head ( expr ) | tail ( expr ) | isnil ( expr )
       | match expr { pat => expr , ... }   -- 模式匹配
       | CtorName ( expr , ... )            -- 构造器（大写字母开头）
       | include "file.dew"                 -- 预处理器
       | ( expr )

type ::= Int | Bool | Unit | Box ( type ) | List ( type ) | type -> type
```

## 内置构造

| 构造 | 签名 | 含义 |
|-----------|-----------|---------|
| `42` | `Int` | 64 位有符号整数 |
| `true`, `false` | `Bool` | 布尔值 |
| `()` | `Unit` | Unit 值 |
| `e1 + e2` | `Int -> Int -> Int` | 加法（类似 `-`, `*`, `/`） |
| `e1 == e2` | `Int -> Int -> Bool` | 相等（类似 `<`, `>`） |
| `if e1 { e2 } else { e3 }` | `Bool -> t -> t -> t` | 条件表达式 |
| `fn (x: T) { e }` | `T -> U` | Lambda，亲和性从捕获推断 |
| `fn (x) { e }` | `T -> U` | Lambda，参数类型由 HM 推断 |
| `fn { e }` | `Unit -> U` | 无参数 Lambda（`fn () { e }` 的简写） |
| `e1 e2` | `(T -> U) -> T -> U` | 函数调用 |
| `e1 -> e2` | `T -> (T -> U) -> U` | 管道前向：`e1 -> e2` = `e2(e1)` |
| `!e` | `T -> T` | 强制严格求值——覆盖隐式惰性 |
| `def x = e1; e2` | `T -> U -> U` | Let 绑定 |
| `dup y = e` | `T -> T` | 复制值到绑定中（对 Box 进行深拷贝） |
| `fix f: T { e }` | `T -> T`（T 为函数） | 递归——`f` 在 `e` 内为 Normal |
| `box(e)` | `T -> Box(T)` | 分配线性盒子——返回仿射资源 |
| `unbox(e)` | `Box(T) -> T` | 释放线性盒子——消耗该盒子 |
| `nil` | `List(T)` | 空列表 |
| `cons(e1, e2)` | `T -> List(T) -> List(T)` | 列表构造——头部严格，**尾部惰性** |
| `head(e)` | `List(T) -> T` | 获取列表头部 |
| `tail(e)` | `List(T) -> List(T)` | 获取列表尾部（强制惰性尾部） |
| `isnil(e)` | `List(T) -> Bool` | 测试列表是否为空 |
| `[e1, e2, ...]` | `List(T)` | 列表字面量简写 |
| `match e { P => b, ... }` | 模式匹配 | 穷尽模式匹配 |
| `type N = A \| B(T)` | 类型声明 | 定义代数数据类型 |
| `# 注释`, `// 注释`, `/// 文档` | — | 行注释 |
| `include "f.dew"` | — | 文件包含预处理器 |

## 入口点：`main`

每个 Dew 程序必须恰好定义一个无参数、返回 `Int` 的 `main` 函数：

```dew
def main = fn {
  42    // 退出码 42
}
```

- **缺少 `main`** → 编译错误
- **`main` 带参数** → 编译错误
- **`main` 返回非 Int** → 编译错误
- **多个 `main` 定义** → 编译错误

求值器调用 `main()` 并将返回的 `Int` 作为 Unix 进程退出码。

## 注释

行注释以 `#` 或 `//` 开头。文档注释使用 `///`。

```dew
# Shell 风格注释
// C++ 风格注释
/// 文档注释

def x = 42;  // 尾随注释
```

## 运算符优先级

从最紧到最松：

1. `!`（严格性覆盖），`*`, `/`
2. `+`, `-`
3. `<`, `>`, `==`
4. 函数调用（并置）
5. `->`（管道前向）

括号覆盖优先级。
