# CF Wrapper — ControlFlow 模式包裹函数体

> 碎片文档。对应统一文档 §3.4.4。
> 独立维护，定期与 index.md 同步。

## 问题

Rx 的 `return` 需要提前退出函数。Dew 没有 `return` 语句，需要用 `ControlFlow(Return/Normal)` enum + `fix` + `match` 模式包裹整个函数体。

## 核心模式

```dew
def foo = fn(x: Int) -> Int {
  match (fix __cf_body {
    fn(x: Int) -> ControlFlow(Int) {
      if (x > 0) { Return(x * 2) }    // ← 提前退出
      else        { Normal(x + 1) }    // ← 正常执行到底
    }
  }(x)) {
    Return(v) => v,                    // ← 外层 match 解包 CF
    Normal(v) => v,
  }
}
```

### 要素

| 要素 | 说明 |
|------|------|
| `fix __cf_body { fn(params) -> CF(T) { body } }` | 自包含的 fix 函数，body 内 `Return(expr)` 提前退出 |
| `match (fix(...)(args)) { Return(v) => v, Normal(v) => v }` | 外层 match 解包 CF，抹掉 ControlFlow，返回 `T` |
| 函数标注 `-> T` | 对外保持原类型，调用方不受影响 |

## 有 borrow 参数时

当函数有 `&` 参数时，fix 函数**取 borrow 变量的值**（不加 `&`），body 内部通过 borrow call block 消费/阴影它们。

```dew
def build = fn(&seg_pool: [SegT; 2000], &seg_cnt: Int, l: Int, r: Int) -> Int {
  match (fix __cf_body {
    fn(seg_pool: [SegT; 2000], seg_cnt: Int, l: Int, r: Int) -> ControlFlow(Int) {
      if (l > r) { Return(0) }
      else {
        if (l == r) {
          // new_segt(&seg_pool, &seg_cnt, ...)  →  desugarer 展开为 block
          // block 内 def seg_pool = %_btmp.0; def seg_cnt = %_btmp.1; %_btmp.2
          // Return 取 block 的值（Int）
          Return({ def __brw0 = new_segt(&seg_pool, &seg_cnt, l, r, Food { cnt: 0, ty: l });
                   def seg_pool = __brw0.0;
                   def seg_cnt = __brw0.1;
                   __brw0.2 })
        } else {
          Normal({ def __brw1 = new_segt(&seg_pool, &seg_cnt, l, r, Food { cnt: 0, ty: 0 });
                    def seg_pool = __brw1.0;
                    def seg_cnt = __brw1.1;
                    __brw1.2 })
        }
      }
    }
  }(seg_pool, seg_cnt, l, r)) {          // ← 按值传 borrow 变量，不加 &
    Return(v) => v,
    Normal(v) => v,
  }
}
```

### 关键规则

1. **fix 函数参数不带 `&`**：desugarer 不会做元组包装，fix 返回纯 `ControlFlow(T)`
2. **borrow call block 内部阴影**：`new_segt(&seg_pool, ...)` 展开为 block，内部 `def seg_pool = %_btmp.0` 只阴影 block 内变量
3. **`Return(expr)` / `Normal(expr)` 的值是 `T`**：borrow call block 的最终值就是 `T`（Int），`Return` 包裹它
4. **外层 match 解出 `T`**：match 的 scrutinee 是 `ControlFlow(T)`，arm 返回 `T`

## borrow call block 的脱糖细节

发射器当前对 borrow call 生成：

```
{ def __brwN = func(&arg1, &arg2); def arg1 = __brwN.0; def arg2 = __brwN.1; __brwN.M }
```

Dew desugarer 对 `def __brwN = func(&...)` 做 flatten：

```
def %_btmp = func(arg1, arg2);     // 去掉 &，参数按值传入
def arg1 = %_btmp.0;               // 正确的修改值
def arg2 = %_btmp.1;               // 正确的修改值
def __brwN = %_btmp.M;            // T 类型的正常返回值
```

剩余的 `def arg1 = __brwN.0; def arg2 = __brwN.1; __brwN.M` 在后续语句中**对 Int 上的 `.0`/`.1` 访问得到 `0`**，覆盖正确值。

**结论**：borrow call block 的 `.0`/`.1`/`.2` 部分在下一版本中应移除，依靠 desugarer 的 flatten 自动处理变量阴影。

## 与 while 循环 CF 的关系

| 场景 | 内层 CF 主体 | 外层 CF 解包 |
|------|-------------|-------------|
| 函数级 return | `fix __cf_body { fn() -> CF(T) { ... } }` | `match (...) { Return(v) => v, Normal(v) => v }` |
| While 循环 | `fix __while_loop { fn() -> CF(T) { if cond { match {...} { Return(v)=>(...,Return(v)), Normal(_)=>__while_loop() } } else { Normal(0) } } }` | `match (...) { Return(v) => v, Normal(v) => v }` |
| 嵌套：while + return | While 内部 `Return(v)` 通过 while 的 match 传播到元组，外层 fix 的 `Return(v)` 直达外层 match | 两层 match 各司其职 |

两个模式正交且可嵌套。while 的 CF 处理循环控制流；函数的 CF 处理提前退出。嵌套时 while 的 `Return(v)` 向上传播到函数级 fix 的返回值。

## 改动历史

| 日期 | 改动 |
|------|------|
| 2026-06-22 | 初稿。修正此前将 fix 函数也用 `&` 参数的错误设计 |
