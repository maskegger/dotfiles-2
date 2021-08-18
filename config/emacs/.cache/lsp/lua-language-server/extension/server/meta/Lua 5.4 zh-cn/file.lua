---@meta

---
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
---@class file*
local file = {}

---@alias readmode number
---| '"n"'  # 读取一个数字，根据 Lua 的转换文法返回浮点数或整数。
---| '"a"'  # 从当前位置开始读取整个文件。
---|>'"l"'  # 读取一行并忽略行结束标记。
---| '"L"'  # 读取一行并保留行结束标记。

---@alias exitcode '"exit"'|'"signal"'

---
---关闭 `file`。
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
---@return boolean?  suc
---@return exitcode? exitcode
---@return integer?  code
function file:close() end

---
---将写入的数据保存到 `file` 中。
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
function file:flush() end

---
---------
---```lua
---for c in file:lines(...) do
---    body
---end
---```
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
---@vararg readmode
---@return fun():string|number
function file:lines(...) end

---
---读文件 `file`， 指定的格式决定了要读什么。
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
---@vararg readmode
---@return string|number
function file:read(...) end

---@alias seekwhence
---| '"set"' # 基点为 0 （文件开头）。
---|>'"cur"' # 基点为当前位置。
---| '"end"' # 基点为文件尾。

---
---设置及获取基于文件开头处计算出的位置。
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
---@param whence? seekwhence
---@param offset? integer
---@return integer offset
---@return string? errmsg
function file:seek(whence, offset) end

---@alias vbuf
---| '"no"'   # 不缓冲；输出操作立刻生效。
---| '"full"' # 完全缓冲；只有在缓存满或调用 flush 时才做输出操作。
---| '"line"' # 行缓冲；输出将缓冲到每次换行前。

---
---设置输出文件的缓冲模式。
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
---@param mode vbuf
---@param size integer
function file:setvbuf(mode, size) end

---
---将参数的值逐个写入 `file`。
---
---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-file"])
---
---@vararg string|number
---@return file*?
---@return string? errmsg
function file:write(...) end
