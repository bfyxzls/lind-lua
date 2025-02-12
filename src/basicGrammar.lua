-- 基础语法
-- 作者：lind.zhang

local bit = require("bit")
local rshift = bit.rshift
local band = bit.band
local char = string.char
local tostring = tostring
local a="lind.zhang"
print("hello world "..#a)

local num=1
if num==1 then
    print("num is 1")
end

local welcome = [[
 hello world
 ou are good.
  ]]
print(welcome)

local arr = { 1, "dev4mobile", 'cn.dev4mobile@gamil.com', 12.3}
print(arr[2])

local person = { name = 'lind' }
print(person["name"])

-- 一般定义
function add(a, b)
    return a + b
end
print(add(1,3))

-- 传递多个参数
function dd(...)
    local args = {...}
    print("args size:", #args) -- #args 获取参数的个数,数组长度
    for i, v in ipairs(args) do
        print("参数", i, ":", v)
    end
end
dd("ok","yes","good")

-- 返回多个参数
function res()
    return "abc", 12, function() end
end
local value1, value2, value3 = res()
print(value2)

-- for 循环
arr = { 1, 2, 3, 4, 5 }
for i=1, #arr do -- 索引从1开始
    print(arr[i])
end

-- while 循环
arr = { 1, 2, 3, 4, 5 }
i = 1
while i <= #arr do
    print(arr[i])
    i = i + 1
end

arr = { 1, 2, 3, 4, 5 }
i = 1
repeat
    print(arr[i])
    i = i + 1
until i >= #arr

--分支
name = "dev4mobile"
if #name > 10 then
    print("name length = ".. #name)
elseif #name >5 then
    print("name length > 5, real length = "..#name) -- 两个点..代表字符串
else
    print("name length < "..#name)
end

local header= "abc=1"
print(header:byte(1))
print(header:byte(2))
print(header:byte(3))

-- 通过一系列的位运算操作，将输入的 32 位整数按照高位到低位的顺序分别取出，并转换为对应的字节值，最终拼接成一个包含 4 个字节的字符串返回,这种转换通常在网络编程或者数据处理中会用到，用于处理整数和字节之间的相互转换.
local function str_int32(int)
    return char(band(rshift(int, 24), 0xff),
            band(rshift(int, 16), 0xff),
            band(rshift(int, 8), 0xff),
            band(int, 0xff))
end

local int_value = 16909060
local result_str = str_int32(int_value)
print(result_str)

local flagBook=false
if not flagBook then -- 假，或者不存在
    print("flagBook is false")
else
    print("flagBook is true")
end

local a=0
if a then --真，或者存在
    print("a is true")
else
    print("a is false")
end
