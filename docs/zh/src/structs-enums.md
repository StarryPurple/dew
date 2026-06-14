# 结构体和枚举

Dew 通过 `struct` 和 `enum` 声明支持代数数据类型。

## 结构体

结构体是带有位置字段的命名记录类型：

```
struct Name { field1: Type1, field2: Type2, ... }
```

### 声明

```dew
struct Point { x: Int, y: Int }
```

每个字段必须有显式类型标注。

### 构造

通过将结构体名作为函数调用并传入位置参数来构造结构体值：

```dew
def p = Point(3, 4);
```

内部机制：结构体构造被编译为函数应用。求值器识别首字母大写的名称并构造 `Value::Struct`。

### 字段访问

使用点号按名称访问字段：

```dew
p.x      // 3
p.y      // 4
```

### 字段更新

结构体不可变，但可以使用更新语法创建修改后的副本：

```
expr { field1 = value1, field2 = value2 }
```

```dew
def q = p { x = 10 };  // Point { x: 10, y: 4 }
```

### 完整示例

```dew
{{#include ../../../examples/structs/point_dist.dew}}
```

## `#[Affine]` 属性

结构体和枚举可以使用属性标记：

```dew
#[Affine]
struct Token { value: Int }

#[Affine]
enum Option { Some(Int), None }
```

`#[Affine]` 属性使类型具有 affine 亲和性。对于结构体，如果任何字段标记了 `#[Affine]`，整个结构体也变为 affine（传染性规则）。

## 枚举

枚举是标签联合——每个变体可选地带一个负载类型：

```dew
enum Option { Some(Int), None }
enum Result { Ok(Int), Err(String) }
```

### 枚举的模式匹配

```dew
match opt {
  Some(val) => val,
  None => default,
}
```

## 下一步

- [**元组和数组**](tuples-arrays.md) —— 无名义类型的复合数据
