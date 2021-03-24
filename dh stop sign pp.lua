local Plr = game.Players.LocalPlayer
local LastPos = Plr.Character.HumanoidRootPart.CFrame
local pp = Plr.Character["[StopSign]"]
wait(0.1)
pp.Sign:Destroy()
--pp.GripRight = Vector3.new(0, 0, 1)
--pp.GripForward = Vector3.new(1, 0, 0)
--pp.GripUp = Vector3.new(0, 1, 0)
--pp.GripPos = Vector3.new(-1, 2, 1.45)

pp.Grip = CFrame.new(-1, 2, 1.45000005, 0, -0, -1, -0, 1, -0, 1, 0, -0)