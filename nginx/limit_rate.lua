local resty_redis = require "resty.redis"
local redis = resty_redis:new()

redis:set_timeout(1000) -- 1 sec


local ok, err = redis:connect("127.0.0.1", 6379)
if not ok then
    ngx.say("failed to connect: ", err)
    return
end
redis:auth("jameslouis")

local uid = ngx.var.uid_got
uid = string.sub(uid,5)

local key = "limitrate:"..uid

local oldest_time = redis:rpop(key)


if(oldest_time == ngx.null or oldest_time == '0' or oldest_time == nil) then
  oldest_time = 0
else
  oldest_time = oldest_time + 0 --将字符串转化成数字
  redis:rpush(key,oldest_time)
end

local now = os.time()
local limit_lenght = 10

redis:lpush(key,now)
redis:ltrim(key,0,limit_lenght-1)
redis:expire(key,10)

local diff = now - oldest_time
local list_length = redis:llen(key)
ngx.print("<br/>"..now.."<br/>"..oldest_time.."<br/>"..diff.."<br/>"..list_length.."<br/>")
local limit_rate = 3  --限制访问的测量间隔
if(oldest_time > 0) then
  if(diff < limit_rate) then
    
    if(list_length == limit_lenght) then  --如果用户3秒内请求次数大于等于10则返回告警
      ngx.print('you are request too frequently!')
      return 0
    end
  end
end

ngx.print('welcome to website')