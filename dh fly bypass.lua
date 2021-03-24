loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

local mt = getrawmetatable(game)
local old = mt.__newindex
local Plr = game.Players.LocalPlayer
local bad, otherbad = {"BodyPosition", "BodyVelocity", "BodyGyro"}, {"HumanoidRootPart", "UpperTorso"}
setreadonly(mt, false)
local oldie
oldie = hookfunc(Instance.new, newcclosure(function(e, i, ...) 
    if i and table.find(bad, e) and table.find(otherbad, tostring(i)) and i.Parent == Plr.Character then
        print("reparented")
        return oldie(e, Plr.Character.LowerTorso, ...)
    end
    return oldie(e, i, ...)
end))
mt.__newindex = newcclosure(function(t, i, v)
    if Plr.Character and table.find(bad, t.ClassName) and i == "Parent" and (table.find(otherbad, tostring(v)) and v.Parent == Plr.Character) then
        print("reparented")
        return old(t, i, Plr.Character.LowerTorso)
    end
    return old(t, i, v)
end)
setreadonly(mt, true)