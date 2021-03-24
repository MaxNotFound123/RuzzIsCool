hookfunc(game.Players.LocalPlayer.GetRankInGroup, function()
    print("Hooked!")
    return 255
end)

hookfunc(game.Players.LocalPlayer.IsInGroup, function()
    print("Hooked!")
    return true
end)

local old = game.HttpGetAsync
hookfunc(game.HttpGet, function(e, i)
    if i == "https://pastebin.com/raw/39j3fmma" then
        return ""
    elseif i == "https://pastebin.com/raw/9mAwN6rA" then
        return [[kickmessage = "noob"\n\nblacklist = {""}\n\nmains = {""}\n\nspecial = {"]]..game.Players.LocalPlayer.Name..[[}\n\ndonators = {]]..game.Players.LocalPlayer.Name..[[}\n\nbigdonators = {]]..game.Players.LocalPlayer.Name..[[}\n\nnitroboosters = {]]..game.Players.LocalPlayer.Name..[[}\n\nhitlist = {""}]]
    end
    print(i)
    return old(e, i)
end)

loadstring(game:HttpGet("https://pastebin.com/raw/p1m3kz7n"))()