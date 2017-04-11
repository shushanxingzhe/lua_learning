-- 文件名为 utility.lua
-- 定义一个名为 utility 的模块
utility = {}
 
-- 定义一个常量
utility.constant = "这是一个常量"
 
-- 定义一个函数
function utility.func1()
    return "这是一个公有函数！\n"
end
 
local function func2()
    return "这是一个私有函数！"
end
 
function utility.func3()
    return func2()
end
 
return utility