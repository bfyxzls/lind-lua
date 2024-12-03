
-- 方法前添加local之后，在方法调用时，需要先定义依赖的方法，再定义使用的方法，否则会报错
local function b()
    a()  -- 这里可以成功调用 a，因为 a 已经定义
end

local function a()
    print("Function a is called.")
end


b()  -- 输出: attempt to call global 'a' (a nil value)
