--http://www.runoob.com/lua/lua-tutorial.html

print("yes or no new".."subfix")

a = {}
a["key"] = "value"
key = 10
a[key] = 22
a[key] = a[key] + 11
for k, v in pairs(a) do
  print(k .. " : " .. v) 
end


function factorial1(n)
	if n == 0 then
		return 1
	else
		return n*factorial1(n-1)
	end
end
print(factorial1(5))
factorial2 = factorial1
print(factorial2(6))


function test()
	return 123,'hello'
end

a,b = test()
print(b)
print(a)


newarr = {'hello','world',['a']='b','c'}
newarr[4] = 'yes'
for key,val in pairs(newarr) do
	print(key..':'..val)
end
print(#newarr)


mytable = setmetatable({key1 = "value1"}, {
  __index = function(mytable, key)
    if key == "key2" then
      return "metatablevalue"
    else
      return nil
    end
  end
})

print(mytable.key1,mytable.key2,mytable.key3)


mymetatable = {}
mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey,mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1,mymetatable.key1)



mytable = setmetatable({key1 = "value1"}, {
  __newindex = function(mytable1, key, value)
		rawset(mytable1, key, "\""..value.."\"")

  end
})

mytable.key1 = "new value"
mytable.key2 = 4

print(mytable.key1,mytable.key2)