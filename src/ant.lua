local ant = require("core.pathMatcher")

local request_uri4 = "/order-payment/"
local config_paths4 = { "/order-payment/**" }
print(ant.isPathMatched(request_uri4, config_paths4)) -- true

local request_uri5 = "/order-payment/sadfads/dudu"
local config_paths5 = { "/order-payment/**" }
print(ant.isPathMatched(request_uri5, config_paths5)) -- true

local request_uri6 = "/order?name=123"
local config_paths6 = { "/order" }
print(ant.isPathMatched(request_uri6, config_paths6)) -- false

local request_uri6 = "/order?name=123"
local config_paths6 = { "/order*" }
print(ant.isPathMatched(request_uri6, config_paths6)) -- true

local request_uri9 = "/order-payment"
local config_paths9 = { "/order-payment/**" }
print(ant.isPathMatched(request_uri9, config_paths9)) -- false

local request_uri91 = "/order-payment"
local config_paths91 = { "/order-payment**" }
print(ant.isPathMatched(request_uri91, config_paths91)) -- true

local request_uri92 = "/order-payment/callback/success"
local config_paths92 = { "/order-payment/**" }
print(ant.isPathMatched(request_uri92, config_paths92)) -- true

local request_uri93 = "/courtchat-api/v1/court/demoSelect"
local config_paths93 = { "/courtchat-api/v1/court/demoSelect" }
print(ant.isPathMatched(request_uri93, config_paths93)) -- true

-- 原始 URL
local original_url = "https://xx.xxx.com/auth/realms/xxx/protocol/openid-connect/token"

-- 使用 string.gsub 函数进行替换
local new_url = original_url:gsub("/token", "/introspect")

-- 输出新的 URL
print(new_url)
