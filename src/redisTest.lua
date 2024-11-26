local redis = require("resty.redis")

local function delete_keys_by_pattern(redis_host, redis_port, redis_password, pattern)
    local red = redis:new()
    red:set_timeout(1000) -- 1 second timeout

    local ok, err = red:connect(redis_host, redis_port)
    if not ok then
        ngx.log(ngx.ERR, "Failed to connect to Redis: ", err)
        return nil, err
    end

    if redis_password and redis_password ~= '' then
        local ok, err = red:auth(redis_password)
        if not ok then
            ngx.log(ngx.ERR, "Failed to authenticate to Redis: ", err)
            return nil, err
        end
    end

    local keys, err = red:keys(pattern)
    if not keys then
        ngx.log(ngx.ERR, "Failed to get keys: ", err)
        return nil, err
    end

    for _, key in ipairs(keys) do
        local res, err = red:del(key)
        if not res then
            ngx.log(ngx.ERR, "Failed to delete key: ", key, " error: ", err)
        else
            ngx.log(ngx.INFO, "Successfully deleted key: ", key)
        end
    end

    return true
end

-- Example usage
local redis_host = "bdyh-all-test-vpc.redis.rds.aliyuncs.com"
local redis_port = 6379
local redis_password = "v6_mobile_test:Test#MobileRedis_20230817"
local pattern = "apisix-limit-count*x01234xa01"


delete_keys_by_pattern(redis_host, redis_port, redis_password, pattern)
