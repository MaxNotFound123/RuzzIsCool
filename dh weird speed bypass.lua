local d = {}
local e = {}
local g = {}
local h = {}
local j = {}
local k = {}
local function l()
    local m = 3
    local n = checkcaller
    local o = getrawmetatable(game)
    setreadonly(o, false)
    local p = o.__index
    local q = o.__newindex
    local r = o.__namecall
    o.__index =
        newcclosure(
        function(s, t)
            if n() then
                return p(s, t)
            end
            if d[s] and d[s][t] then
                local u = d[s][t]
                if u["IsCallback"] == true then
                    return u["Value"](s)
                else
                    return u["Value"]
                end
            end
            if g[t] then
                local v = g[t]
                if v["IsCallback"] == true then
                    return v["Value"](s)
                else
                    return v["Value"]
                end
            end
            if j[s] and j[s][t] then
                return k[s][t]
            end
            return p(s, t)
        end
    )
    o.__newindex =
        newcclosure(
        function(w, x, y)
            if n() then
                return q(w, x, y)
            end
            if e[w] and e[w][x] then
                local z = e[w][x]
                if z["Callback"] == nil then
                    return
                else
                    z["Callback"](w, y)
                    return
                end
            end
            if h[x] then
                local A = h[x]
                if A["Callback"] == nil then
                    return
                else
                    A["Callback"](w, y)
                    return
                end
            end
            if j[w] and j[w][x] then
                local B = j[w][x]
                if type(y) ~= B["Type"] then
                    error("bad argument #3 to '" .. x .. "' (" .. B["Type"] .. " expected, got " .. type(x) .. ")")
                end
                k[w][x] = y
                return
            end
            return q(w, x, y)
        end
    )
    local D = game.Players.LocalPlayer.Character.Humanoid
    local function A(_)
        local a0 = p(D, _)
        local a1 = type(a0)
        if not j[D] then
            j[D] = {}
        end
        if not k[D] then
            k[D] = {}
        end
        j[D][_] = {Type = a1}
        k[D][_] = p(D, _)
        local a2 = function()
            j[D][_] = nil
            k[D][_] = nil
        end
        return {remove = a2, Remove = a2}
    end
    A("WalkSpeed")
    A("JumpPower")
end
l()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50