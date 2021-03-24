local encoded = ""
numbs = encoded:split('-')
local decoded = ""
for i, v in pairs(numbs) do 
    local Chars = v:split('')
    local Char = ''
    for ii, vv in pairs(Chars) do
        Char = vv
    end
    decoded = decoded..Char
end
setclipboard(decoded)