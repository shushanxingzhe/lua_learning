local h = ngx.req.get_headers()
for k, v in pairs(h) do
  ngx.print(k," : ",v,"<br/>")
end
ngx.say("<p>hello, world</p>")
local cookie_name = "XDEBUG_SESSION";
local var_name = "cookie_" .. cookie_name
ngx.print(ngx.var[var_name])
ngx.print(ngx.var.http_cookie)

local ck = require "resty.cookie"
local cookie, err = ck:new()
local fields, err = cookie:get_all()
for k, v in pairs(fields) do
  ngx.print(k," : ",v,"<br/>")
end
