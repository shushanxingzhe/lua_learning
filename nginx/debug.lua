--http://notebook.kulchenko.com/zerobrane/debugging-openresty-nginx-lua-scripts-with-zerobrane-studio
require('mobdebug').start("10.33.21.49")

print("yes or no")
local a = 123
local b = a + 456
ngx.print(b)
local name = ngx.var.arg_name or "Anonymous"

ngx.say("Hello, ", name, "!")

ngx.say("Done debugging.")

require('mobdebug').done()
		
