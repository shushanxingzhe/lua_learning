mysql = require "luasql.mysql"

local env  = mysql.mysql()
local conn = env:connect('lua_test','root','123456','192.168.117.128','3306')
print(env,conn)

status,errorString = conn:execute([[CREATE TABLE sample3 (id INTEGER, name TEXT)]])
print(status,errorString )

status,errorString = conn:execute([[INSERT INTO sample3 values('12','Raj')]])
print(status,errorString )

cursor,errorString = conn:execute([[select * from sample3]])
print(cursor,errorString)

row = cursor:fetch ({}, "a")
while row do
  print(string.format("Id: %s, Name: %s", row.id, row.name))
  row = cursor:fetch (row, "a")
end
-- close everything
cursor:close()
conn:close()