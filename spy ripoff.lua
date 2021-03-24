repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local Run = false

local ScreenGui = Instance.new("ScreenGui")
local Toolbar = Instance.new("Frame")
local Background = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local LoopTp = Instance.new("TextButton")
local Name_Box = Instance.new("TextBox")

ScreenGui.Parent = game.CoreGui

Toolbar.Name = "Toolbar"
Toolbar.Parent = ScreenGui
Toolbar.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Toolbar.Position = UDim2.new(0.02541296, 0, 0.163390666, 0)
Toolbar.Size = UDim2.new(0, 269, 0, 34)
Toolbar.Active = true
Toolbar.Draggable = true

Background.Name = "Background"
Background.Parent = Toolbar
Background.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Background.BackgroundTransparency = 0.500
Background.Position = UDim2.new(0, 0, 0.986920536, 0)
Background.Size = UDim2.new(0, 268, 0, 72)

Name.Name = "Name"
Name.Parent = Toolbar
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00371747208, 0, 0, 0)
Name.Size = UDim2.new(0, 268, 0, 34)
Name.Font = Enum.Font.SourceSans
Name.Text = "Remote Kill"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

LoopTp.Name = "tpon"
LoopTp.Parent = Toolbar
LoopTp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoopTp.BackgroundTransparency = 1.000
LoopTp.Position = UDim2.new(0, 0, 1, 0)
LoopTp.Size = UDim2.new(0, 268, 0, 36)
LoopTp.Font = Enum.Font.Gotham
LoopTp.Text = "Execute"
LoopTp.TextColor3 = Color3.fromRGB(255, 255, 255)
LoopTp.TextSize = 20.000
LoopTp.MouseButton1Click:Connect(function()
	local TargetIns
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if string.find(v.Name,Name_Box.Text) then
			TargetIns = v
			print("Target set to "..v.name)
		end
	end

	if not TargetIns then print("Target not found");return end
	
	Run = true

	local Plr = game.Players.LocalPlayer
	local HRPPosition = Plr.Character.HumanoidRootPart.CFrame
	local Hand = Plr.Character.RightHand
	local HandPosition = Hand.Position
	local HandCFrame = Hand.CFrame

	Plr.Character.Humanoid:UnequipTools()
	wait(0.1)
	Plr.Character.Humanoid:EquipTool(Plr.Backpack.Combat)
	wait(0.1)

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
	repeat
		wait()
		if not TargetIns then break end
		local Pos = Vector3.new(math.random(-1,1),0,math.random(-1,1))
		Hand.Position = TargetIns.Character.HumanoidRootPart.Position + Pos
		Hand.CFrame = TargetIns.Character.HumanoidRootPart.CFrame + Pos
	until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V) or (TargetIns and TargetIns.Character and TargetIns.Character:FindFirstChild("BodyEffects") and ((TargetIns.Character.BodyEffects:FindFirstChild("K.O") and TargetIns.Character.BodyEffects["K.O"].Value) or (TargetIns.Character.BodyEffects:FindFirstChild("Dead") and TargetIns.Character.BodyEffects["Dead"].Value)))

	Run = false

	Plr.Character.HumanoidRootPart.CFrame = HRPPosition

	Hand.Position = HandPosition
	Hand.CFrame = HandCFrame
    wait(0.1)
	local RightWrist = Instance.new("Weld", Hand)
	RightWrist.Part0 = Hand
	RightWrist.Part1 = Plr.Character.RightLowerArm
	RightWrist.C0 = CFrame.new(0.0682975054, -0.450790346, -0.204141855, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	RightWrist.C1 = CFrame.new(-0.0443148613, 0.233287811, 0.124126196, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	RightWrist.Name = ("RightWrist")
    wait(1)
	Plr.Character.HumanoidRootPart.CFrame = TargetIns.Character.HumanoidRootPart.CFrame
end)

Name_Box.Name = "LoopTp"
Name_Box.Parent = LoopTp
Name_Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_Box.BackgroundTransparency = 1.000 
Name_Box.Position = UDim2.new(0, 0, 1, 0)
Name_Box.Size = UDim2.new(0, 268, 0, 36)
Name_Box.Font = Enum.Font.Gotham
Name_Box.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
Name_Box.PlaceholderText = "Username"
Name_Box.Text = ""
Name_Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_Box.TextSize = 20.000
