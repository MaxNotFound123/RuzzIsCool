local plr = game.Players.LocalPlayer
local lastpos = plr.Character.HumanoidRootPart.CFrame
local playercount; local greadecount; local pp = {}
local cock = true
for I in pairs(game.Players:GetPlayers()) do
    playercount = I
end

game:GetService('RunService').Stepped:connect(function()
	setsimulationradius(math.huge)
end)

spawn(function()
    while cock do wait()
        for i, v in pairs(game.Workspace.Ignored:GetChildren()) do
            if v.Name == "Handle" then
                for index in pairs(pp) do
                    table.insert(pp, v)
                end
                v.Name = tostring(i)
            end
        end
    end
end)

repeat wait()
    plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
    fireclickdetector(game.Workspace.Ignored.Shop["[Grenade] - $700"].ClickDetector)
    for ii, vv in pairs(plr.Backpack:GetChildren()) do
        grenadecount = ii
    end
until grenadecount >= playercount
plr.Character.HumanoidRootPart.CFrame = lastpos

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    spawn(function()
        if v.Name == "[Grenade]" then
            v.Parent = plr.Character; v:Activate(); wait(0.1); v:Deactivate(); wait(0.1); v:Activate()
        end
    end)
end

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= plr then
        local mover = Instance.new("BodyPosition", pp[1])
        mover.P = 1e5
        table.remove(pp, 1)
        spawn(function()
            while wait() do
                mover.Position = v.Character.HumanoidRootPart.Position
            end
        end)
    end
end
cock = false