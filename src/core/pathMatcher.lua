local _M = {
}

-- 单个路由匹配
function _M.antPathMatch(request_uri, pattern)
    -- 将 Ant 风格的模式转换为 Lua 的模式
    request_uri = string.gsub(request_uri, "%-", "")      -- 解决路径中-引起的问题
    local lua_pattern = string.gsub(pattern, "%-", "")  -- 解决路径中-引起的问题
    lua_pattern = string.gsub(pattern, "%*", ".*")  -- * 替换为 .*
    lua_pattern = string.gsub(lua_pattern, "%?", ".")      -- ? 替换为 .
    -- 处理 ** 的情况
    lua_pattern = string.gsub(lua_pattern, "/%.%*", "/(.*)")  -- 将 ** 转换为 /(.*)

    -- 添加开头和结尾的锚点
    lua_pattern = "^" .. lua_pattern .. "$"

    -- 进行匹配
    return string.match(request_uri, lua_pattern) ~= nil
end

 -- 批量匹配路径
 function _M.isPathMatched(request_uri, patterns)
    for _, path in ipairs(patterns) do
        if _M.antPathMatch(request_uri, path) then
            return true
        end
    end
    return false
end

return _M
