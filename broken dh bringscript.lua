repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")

local ScreenGui = Instance.new("ScreenGui")
local Toolbar = Instance.new("Frame")
local Background = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local LoopTp = Instance.new("TextButton")
local Name_Box = Instance.new("TextBox")
local daPlr = game.Players.LocalPlayer

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

local function a(b)
	if b:FindFirstChild("BodyPosition") then
		return
	end
	b.CanCollide = false
	local bodypos = Instance.new("BodyPosition", b)
	bodypos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodypos.P = 1e6
	bodypos.Position = Vector3.new(daPlr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0 , 5))
end

LoopTp.MouseButton1Click:Connect(function()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if string.find(v.Name,Name_Box.Text) then
			local targetsetter = v
			print("Target set to "..v.name)
			if targetsetter.Character and targetsetter.Character:FindFirstChild("BodyEffects") and targetsetter.Character.BodyEffects:FindFirstChild("SpecialParts") and targetsetter.Character.BodyEffects.SpecialParts:FindFirstChild("Head") then
                a(targetsetter.Character.BodyEffects.SpecialParts.Head)
            else print("target has an incomplete character... returning") end
		end
	end
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