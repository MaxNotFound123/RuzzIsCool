local Run = false
local ScreenGui = Instance.new("ScreenGui")
local Toolbar = Instance.new("Frame")
local Background = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local LoopTp = Instance.new("TextButton")
local Name_Box = Instance.new("TextBox")
local Zombs = {}

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
			print("Target set to "..v.name)
		end
	end

	if not TargetIns then print("Target not found");return end
	
	Run = true
    repeat wait()
        for i, v in pairs(Zombs) do
            v.HumanoidRootPart.pp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            spawn(function()
                while Run do wait()
                    v.HumanoidRootPart.pp.Position = TargetIns.Character.HumanoidRootPart.Position
                end
            end)
        end
    until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
    Run = false
    for i, v in pairs(Zombs) do 
        v.HumanoidRootPart.pp.MaxForce = Vector3.new(0, 0, 0)
    end
end)
while wait(10) do
    for i, v in pairs(game.Workspace.Players:GetChildren()) do
        if v.Name == "[ZOMBIE]" and v:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                local gay = false
                for ii, vv in pairs(Zombs) do
                    if v == vv then 
                        gay = true
                    end
                end
                if gay == false then
                    table.insert(Zombs, v)
                    pp = Instance.new("BodyPosition", v.HumanoidRootPart); pp.Name = "pp"; pp.MaxForce = Vector3.new(0, 0, 0)
                end
            end)
        end
    end
end
