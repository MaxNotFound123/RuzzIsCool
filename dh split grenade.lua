--ok you fat ugly nerds press v when you think you've bought enough grenades and then it will automatically speww grenades from you

local plr = game.Players.LocalPlayer
local lastpos = plr.Character.HumanoidRootPart.CFrame

repeat wait()
    plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame
    fireclickdetector(game.Workspace.Ignored.Shop["[Grenade] - $700"].ClickDetector)
until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
plr.Character.HumanoidRootPart.CFrame = lastpos

for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    wait(0.05)
    spawn(function()
        if v.Name == "[Grenade]" then
            v.Parent = plr.Character; v:Activate(); wait(0.1); v:Deactivate(); wait(0.1); v:Activate()
        end
    end)
end