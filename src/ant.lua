local function antPathMatch(request_uri, pattern)
    -- 将 Ant 风格的模式转换为 Lua 的模式
    request_uri = string.gsub(request_uri, "%-", "")      -- 解决路径中-引起的问题
    local lua_pattern = string.gsub(pattern, "%-", "")  -- 解决路径中-引起的问题
    print("lua_pattern: ", lua_pattern, " request_uri: ", request_uri)
    lua_pattern = string.gsub(pattern, "%*", ".*")  -- * 替换为 .*
    lua_pattern = string.gsub(lua_pattern, "%?", ".")      -- ? 替换为 .
    -- 处理 ** 的情况
    lua_pattern = string.gsub(lua_pattern, "/%.%*", "/(.*)")  -- 将 ** 转换为 /(.*)

    -- 添加开头和结尾的锚点
    lua_pattern = "^" .. lua_pattern .. "$"

    -- 进行匹配
    return string.match(request_uri, lua_pattern) ~= nil
end

local function isPathMatched(request_uri, config_paths)
    for _, path in ipairs(config_paths) do
        if antPathMatch(request_uri, path) then
            return true
        end
    end
    return false
end

-- 测试用例

local request_uri4 = "/order-payment/"
local config_paths4 = { "/order-payment/**" }
print(isPathMatched(request_uri4, config_paths4)) -- true

local request_uri5 = "/order-payment/sadfads"
local config_paths5 = { "/order-payment/**" }
print(isPathMatched(request_uri5, config_paths5)) -- true

local request_uri6 = "/order"
local config_paths6 = { "/order/**" }
print(isPathMatched(request_uri6, config_paths6)) -- false

local request_uri9 = "/order-payment"
local config_paths9 = { "/order-payment/**" }
print(isPathMatched(request_uri9, config_paths9)) -- false

local request_uri91 = "/order-payment"
local config_paths91 = { "/order-payment**" }
print(isPathMatched(request_uri91, config_paths91)) -- true

local request_uri92 = "/order-payment/callback/success"
local config_paths92 = { "/order-payment/**" }
print(isPathMatched(request_uri92, config_paths92)) -- true

local request_uri93 = "/courtchat-api/v1/court/demoSelect"
local config_paths93 = { "/courtchat-api/v1/court/demoSelect" }
print(isPathMatched(request_uri93, config_paths93)) -- true

-- 原始 URL
local original_url = "https://testcas.pkulaw.com/auth/realms/fabao/protocol/openid-connect/token"

-- 使用 string.gsub 函数进行替换
local new_url = original_url:gsub("/token", "/introspect")

-- 输出新的 URL
print(new_url)
