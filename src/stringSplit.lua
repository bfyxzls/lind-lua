-- 字符串分割
local ipAddr = "192.168.0.1_192.168.0.255_123"
local result = {}

for part in string.gmatch(ipAddr, "[^%_]+") do
    table.insert(result, part)
end

-- 输出结果
for i, v in ipairs(result) do
    print(v)
end
print(result[1], result[2], result[3])

local range = "192.168.0.1_192.168.0.255_123-456"

-- 使用 pattern 匹配并拆分字符串
local startIp, endIp,aid =range:match("([^%-]+)%_(.+)%_(.+)")

-- 输出结果
print("Start IP: ", startIp)
print("End IP: ", endIp)
print("AID: ", aid)
