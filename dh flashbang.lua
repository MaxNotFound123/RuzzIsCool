local Plr = game.Players.LocalPlayer 
Plr.Character.Humanoid:UnequipTools()
wait(0.1)
Plr.Character.Humanoid:EquipTool(Plr.Backpack.Combat)
wait(0.1)

local Hand = Plr.Character.RightHand
local HRPPosition = Plr.Character.HumanoidRootPart.CFrame
local HandPosition = Hand.Position
local HandCFrame = Hand.CFrame
local Run = true

if Hand:FindFirstChild("RightWrist") then
	Hand.RightWrist:Destroy()
end
	
spawn(function()
	while Run do
		wait()
		Plr.Character.Combat:Activate()
		wait(3)
		Plr.Character.Combat:Deactivate()
    end
end)
wait(1)
repeat wait()
Hand.CFrame = CFrame.new(math.random(-5000,5000), math.random(-400, 600), math.random(-5000, 5000))
until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
run = false
 Plr.Character.HumanoidRootPart.CFrame = HRPPosition
wait()
Hand.Position = HandPosition
Hand.CFrame = HandCFrame
wait(0.1)

local RightWrist = Instance.new("Weld", Hand)
RightWrist.Part0 = Hand
RightWrist.Part1 = Plr.Character.RightLowerArm
RightWrist.C0 = CFrame.new(0.0682975054, -0.450790346, -0.204141855, 1, 0, 0, 0, 1, 0, 0, 0, 1)
RightWrist.C1 = CFrame.new(-0.0443148613, 0.233287811, 0.124126196, 1, 0, 0, 0, 1, 0, 0, 0, 1)
RightWrist.Name = ("RightWrist")
  
    
    
