local Plr = game.Players.LocalPlayer
local Mouse = Plr:GetMouse()
local HRPPosition = Plr.Character.HumanoidRootPart.CFrame
local Hand = Plr.Character.RightHand
local HandPosition = Hand.Position
local HandCFrame = Hand.CFrame
if Hand:FindFirstChild("RightWrist") then
	Hand.RightWrist:Destroy()
end
repeat
	wait()
	Hand.Position = Vector3.new(Mouse.Hit.x, Mouse.Hit.Y, Mouse.Hit.z)
	--Hand.CFrame = Mouse.Hit
until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)

Plr.Character.HumanoidRootPart.CFrame = HRPPosition

Hand.Position = HandPosition
Hand.CFrame = HandCFrame
