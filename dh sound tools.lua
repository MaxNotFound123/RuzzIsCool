local Plr = game.Players.LocalPlayer
local e = Instance.new("Sound", Plr.Character:FindFirstChildOfClass("Tool").Handle)
e.Looped = true
e.SoundId = "rbxassetid://2699357918"
e:Play()

e.Parent.Anchored = true
e.Parent.Parent = game:GetService("Workspace")