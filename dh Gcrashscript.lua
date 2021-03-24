local Plr = game.Players.LocalPlayer
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
until #a >= 1
Plr.Character.HumanoidRootPart.CFrame = lastpos
repeat wait() until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
for i, v in pairs(a) do
    game.RunService.Stepped:wait()
    spawn(function()
        if v.Name == "[Grenade]" then
            v:Activate(); wait(0.01); v:Deactivate(); wait(0.01); v:Activate()
        end
    end)
end
for i = 1, 750 do
    game.Players:Chat(("fuck skids /"):rep(10000))
end