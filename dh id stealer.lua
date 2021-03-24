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

LoopTp.MouseButton1Click:Connect(function()
	local TargetIns
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if string.find(v.Name,Name_Box.Text) then
			TargetIns = v
		end
	end
    local audioid = Instance.new("Frame")
    audioid.Name = "audioid"
	audioid.Parent = ScreenGui
	audioid.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	audioid.BackgroundTransparency = 0.500
	audioid.Position = UDim2.new(3, 0, 4, 0)
	audioid.Size = UDim2.new(0, 268, 0, 36)

	local minimize = Instance.new("TextButton")    
    minimize.Name = "tpon"
	minimize.Parent = audioid
	minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	minimize.BackgroundTransparency = 1.000
	minimize.Position = UDim2.new(0, 0, 1, 0)
	minimize.Size = UDim2.new(0, 268, 0, 36)
	minimize.Font = Enum.Font.Gotham
	minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
	minimize.TextSize = 20.000
    local Username = TargetIns
	local plr2 = game.Players:FindFirstChild(Username)
    local ID = plr2.Character.LowerTorso.BOOMBOXSOUND.SoundId
    ID = ID:sub(string.find(ID,"%d+"))
    minimize.Text = 'The ID is: '..ID
	minimize.MouseButton1Click:Connect(function()
		audioid.Visible = false
		minimize.Visible = false
		minimize.Text = ""
	end)
end)
