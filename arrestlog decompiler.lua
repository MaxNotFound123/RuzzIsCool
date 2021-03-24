local e = readfile("arrestlog.txt")
local c = 0
e = e:split('\n')
for i, v in next, e do 
    if i>1 then
        local _, b = string.find(v, "| Bounty: ")
        local m = v:sub(b, b+10)
        c = c + tonumber(m)
    end
end
print("total amount:",c)