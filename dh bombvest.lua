local Plr = game.Players.LocalPlayer
local i = 1
local Mouse = Plr:GetMouse()

game.Workspace.Ignored.ChildAdded:connect(function(child)
    if child.Name == "Handle" then
        child.CanCollide = false
        local move = Instance.new("BodyPosition", child)
        move.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        move.P = 1e5
        i = i + 1
        if i>=20 then
            i=1
        end
        local b = i 
        local c = true
        spawn(function()
            wait(1.5)
            c = false
        end)
        while c do
            game.RunService.Stepped:wait()
            move.Position = (Plr.Character.UpperTorso.CFrame*CFrame.new(-0.6+(0.3*math.floor((b%10)/3)), -0.75+(0.5*(b%3)), -0.8+(1.6*math.floor(b/10)))).p + (Plr.Character.UpperTorso.Velocity*0.04)
            setsimulationradius(math.huge^math.huge, math.huge)
        end
        move.P = 1e4
        move.Position = Plr.Character.UpperTorso.CFrame.p+(((Plr.Character.UpperTorso.CFrame*CFrame.new(-0.6+(0.3*math.floor((b%10)/3)), -0.75+(0.5*(b%3)), -0.8+(1.6*math.floor(b/10)))).p - Plr.Character.UpperTorso.CFrame.p)*20)
        child.CanCollide = true
    end
end)
while true do
    repeat until Mouse.KeyDown:wait():lower() == "v"
    local a = {}
    local lastpos = Plr.Character.HumanoidRootPart.CFrame
    repeat
        Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
        wait(1)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Grenade] - $700"].ClickDetector)
        for i, v in pairs(Plr.Backpack:GetChildren()) do
            if v.Name == "[Grenade]" then
                table.insert(a, v)
                v.Parent = Plr.Character
            end
        end
    until #a >= 20
    Plr.Character.HumanoidRootPart.CFrame = lastpos
    repeat until Mouse.KeyDown:wait():lower() == "v"
    for i, v in pairs(a) do
        game.RunService.Stepped:wait()
        spawn(function()
            if v.Name == "[Grenade]" then
                v:Activate(); wait(0.01); v:Deactivate(); wait(0.01); v:Activate()
            end
        end)
    end
end