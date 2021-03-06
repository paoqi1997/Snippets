-- Lua之运算符、字符串及数组

-- 主要内容还是字符串
-- 不过运算符方面的内容也用到了 string.format 接口

-- Relational Operators: ==, ~=, <, <=, >, >=
-- Logical Operators: and, or, not

-- 666
print(233 and 666)

-- pollers.linux == pollers['linux']
pollers = {
    linux = 'epoll'
}

poller = pollers.win32 or 'select'
-- select
print(poller)

-- true
print(not nil)

s = ''
s = s .. bit32.band(1, 2) .. ' '   -- 0
s = s .. bit32.bor(1, 2) .. ' '    -- 3
s = s .. bit32.bnot(1) .. ' '      -- 4294967294
s = s .. bit32.bxor(1, 2) .. ' '   -- 3
s = s .. bit32.lshift(2, 1) .. ' ' -- 4
s = s .. bit32.rshift(2, 1) .. ' ' -- 1
print(s)

s = ''
s = s .. (1 & 2) .. ' '  -- 0
s = s .. (1 | 2) .. ' '  -- 3
s = s .. ~1 .. ' '       -- -2
s = s .. (1 ~ 2) .. ' '  -- 3
s = s .. (2 << 1) .. ' ' -- 4
s = s .. (2 >> 1) .. ' ' -- 1
print(s)

x, y = 5, 2

print(string.format('%d + %d = %d', x, y, x + y))
print(string.format('%d - %d = %d', x, y, x - y))
print(string.format('%d * %d = %d', x, y, x * y))
print(string.format('%d / %d = %f', x, y, x / y))   -- 实除
print(string.format('%d // %d = %f', x, y, x // y)) -- 整除
print(string.format('%d %% %d = %f', x, y, x % y))
print(string.format('%d ^ %d = %d', x, y, x ^ y))

print(tonumber('1024'))
print(tostring(2048))

print(string.byte('A'), string.char(65))
print(string.byte('a'), string.char(97))

name = 'Lua'

s = ''
s = s .. string.lower(name) .. ' '   -- lua
s = s .. string.upper(name) .. ' '   -- LUA
s = s .. string.len(name) .. ' '     -- 3
s = s .. string.reverse(name) .. ' ' -- auL
print(s)

words = 'bear dear hear year'

-- Lua的下标索引从1开始
-- string.find: 从起始位置1开始查找第一个子串，并返回其起止下标
-- 如果子串是dear，那么其起止下标分别对应d和r的下标
print(string.find(words, 'dear', 1))

-- 将ear替换为ao，共进行3次
print(string.gsub(words, 'ear', 'ao', 3))

print(string.rep(name, 2))      -- LuaLua
print(string.sub(words, 6, 9))  -- dear

print(string.format('%e', 255)) -- 2.550000e+002
print(string.format('%E', 255)) -- 2.550000E+002
print(string.format('%x', 255)) -- ff
print(string.format('%X', 255)) -- FF

-- 2 apples
print(string.match('I have eaten 2 apples.', '%d+ %a+'))

colors = 'red|green|blue'

s = ''
for color in string.gmatch(colors, '%a+') do
    s = s .. color .. ' '
end
print(s)

m = {}

k = 3
for i = 1, k do
    m[i] = {}
    for j = 1, k do
        m[i][j] = (i - 1) * k + j
    end
end

s = ''
for i = 1, k do
    for j = 1, k do
        s = s .. m[i][j] .. ' '
    end
end
print(s)
