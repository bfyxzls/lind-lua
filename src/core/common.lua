---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by PC170.
--- DateTime: 2024/5/11 11:10
---
local _M = {
}

function _M:new(name)
   _M.name=name
    return _M
end

function _M.divide(a, b)
   print("name=".._M.name)
    if b == 0 then
        error("除数不能为0")
    end
    return a / b
end

function _M.hello()
    print("hello world!")
end


--local status, result = pcall(divide, 10, 0)
--
--if status then
--    print("结果：", result)
--else
--    print("发生错误：", result)
--end

return _M
