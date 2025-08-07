# teal

Teal 为 Lua 添加类型注解，可以指定 array、map、record，还可以标注 interface、union 和 generic（泛型）。Teal 提供了一个编译器，可以将 .tl 文件编译成 .lua 文件。Teal 之于 Lua 的作用相当于 TypeScript 之于 JavaScript。

[GitHub](https://github.com/teal-language/tl)
[官方文档](https://teal-language.org/book/introduction.html)

## 加载器

我们可以加载 Teal package loader（包加载器），这样就可以直接调用 `require` 来加载 .tl 文件了，不用先运行 `tl gen`。
注意：从 Lua 中直接加载和运行 Teal 模块是没有类型检查的。只有在你运行 `tl check` 或使用 `tl run` 加载一个程序时才会执行类型检查。

## 类型

基础类型：

* `any`
* `nil`
* `boolean`
* `integer`
* `number`
* `string`
* `thread` (coroutine)

使用类型构造器（type constructors）可以声明更多复杂的类型：
* arrays - `{number}`，`{{number}}`
* tuples - `{number, integer, string}`
* maps - `{string:boolean}`
* functions - `function(number, string): {number}, string`

有一些类型必须提前声明，并且通过名字来引用它们：
* enums: an enum is a set of accepted strings
* records: a record is a table with a known set of fields
* interfaces: an interface is an abstract record type
