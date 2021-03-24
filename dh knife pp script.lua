local Plr = game.Players.LocalPlayer
local LastPos = Plr.Character.HumanoidRootPart.CFrame
wait(0.1)
Plr.Character.HumanoidRootPart.CFrame = CFrame.new(803.5, 48, -547, 0, 0, -1, 0, 1, 0, 1, 0, 0)
Plr.Character["[Knife]"].Handle.Orientation = Vector3.new(0, 180, 0)
wait(0.2)
Plr.Character["[Knife]"].Handle.Position = Vector3.new(804.3, 47, -547)
Plr.Character.HumanoidRootPart.CFrame = LastPos
