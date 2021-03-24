game:GetService'RunService'.Stepped:connect(function() setsimulationradius(math.huge) end)

local Run = false

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Toolbar = Instance.new("Frame", ScreenGui)
local Background = Instance.new("Frame", Toolbar)
local Name = Instance.new("TextLabel", Toolbar)
local LoopTp = Instance.new("TextButton", Toolbar)
local Name_Box = Instance.new("TextBox", LoopTp)
local Plr = game.Players.LocalPlayer

Toolbar.Name = "Toolbar"
Toolbar.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Toolbar.Position = UDim2.new(0.02541296, 0, 0.163390666, 0)
Toolbar.Size = UDim2.new(0, 269, 0, 34)
Toolbar.Active = true
Toolbar.Draggable = true

Background.Name = "Background"
Background.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Background.BackgroundTransparency = 0.500
Background.Position = UDim2.new(0, 0, 0.986920536, 0)
Background.Size = UDim2.new(0, 268, 0, 72)

Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00371747208, 0, 0, 0)
Name.Size = UDim2.new(0, 268, 0, 34)
Name.Font = Enum.Font.SourceSans
Name.Text = "god killer"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

LoopTp.Name = "tpon"
LoopTp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoopTp.BackgroundTransparency = 1.000
LoopTp.Position = UDim2.new(0, 0, 1, 0)
LoopTp.Size = UDim2.new(0, 268, 0, 36)
LoopTp.Font = Enum.Font.Gotham
LoopTp.Text = "Kill"
LoopTp.TextColor3 = Color3.fromRGB(255, 255, 255)
LoopTp.TextSize = 20.000

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
    local victm
    for i, v in next, game.Players:GetPlayers() do
        if string.find(v.Name:lower(), Name_Box.Text:lower()) then
            victm = v
        end
    end
    if not victm then print("Invalid name") return end
    local bike
    local lastpos = Plr.Character.HumanoidRootPart.CFrame
    repeat wait()
        for i, v in next, game.Workspace.Vehicles:GetChildren() do
            bike = v
        end
        if not bike then
            Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-822.521179, 21.9978294, -547.607056)
            wait(1)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SoloBike] - $25"].ClickDetector)
        end
    until bike
        
    for i, v in next, game.Workspace.Vehicles:GetChildren() do
        spawn(function()
            while v:FindFirstChild("Wheel") do wait()
                v:FindFirstChild("Wheel"):Destroy()
            end
            local Pos = Instance.new("BodyPosition", v.Root)
            Pos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            Pos.P = 1e4
            while victm.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Seated do wait()
                Plr.Character.HumanoidRootPart.CFrame = CFrame.new(Pos.Parent.Position + Vector3.new(0, -3, 0))
                Pos.Position = victm.Character.HumanoidRootPart.Position
                Plr.Character.Humanoid:ChangeState(3)
            end
            Plr.Character.HumanoidRootPart.CFrame = lastpos
            Pos.Position = Vector3.new(0, -800, 0)
        end)
    end
end)    