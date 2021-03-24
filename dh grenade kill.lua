local ScreenGui = Instance.new("ScreenGui")
local Toolbar = Instance.new("Frame")
local Background = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local LoopTp = Instance.new("TextButton")
local Name_Box = Instance.new("TextBox")
local moving = false
local Plr = game.Players.LocalPlayer

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
Name.Text = "GRENADE KILL"
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
LoopTp.Text = "fucking destroy"
LoopTp.TextColor3 = Color3.fromRGB(255, 255, 255)
LoopTp.TextSize = 20.000
spawn(function()
	while true do
		game.Players.LocalPlayer.MaximumSimulationRadius = math.pow(math.huge,math.huge)*math.huge
		game.Players.LocalPlayer.SimulationRadius = math.pow(math.huge,math.huge)*math.huge
		game:GetService("RunService").Stepped:wait()
	end
end)
        
LoopTp.MouseButton1Click:Connect(function()
	local TargetIns
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if string.find(v.Name,Name_Box.Text) then
			TargetIns = v.Name
			print("Target set to "..v.name)
		end
    end
    if not TargetIns then print("Target not found");return end
    if moving then 
        moving = false 
        for i,mov in pairs(game:GetService("Workspace"):GetChildren())do
	        if mov:IsA("BodyPosition") then
    			mov:Destroy()
    		end
    	end
    else
        moving = true
        
        local lastpos = Plr.character.HumanoidRootPart.CFrame
        local success, error = pcall(function()
            if game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]") == nil then
                repeat wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(103.859718, -29.6502476, -272.42981, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Grenade] - $700"].ClickDetector)
                until game.Players.LocalPlayer.Backpack:FindFirstChild("[Grenade]") ~= nil
            end
            wait()
            game.Players.LocalPlayer.Backpack["[Grenade]"].Handle.Mesh:Destroy()
            wait(0.1)
            Plr.Character.Humanoid:EquipTool(Plr.Backpack["[Grenade]"])
            Plr.Character["[Grenade]"]:Activate()
            wait(0.1)
            Plr.Character.HumanoidRootPart.CFrame = lastpos
            wait(0.1)
            Plr.Character["[Grenade]"]:Activate()
        end)
        wait(2)
        local players = game.Players:GetPlayers()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local unanchoredparts = {}
        local movers = {}
         
        for index, part in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
        	if part:IsA("Part") and part.Name == "Handle" then
        		table.insert(unanchoredparts, part)
        		if part:FindFirstChildOfClass("BodyPosition") ~= nil then
    	    		part:FindFirstChildOfClass("BodyPosition"):Destroy()
        		end
    	    end
        end
        
        for index, part in pairs(unanchoredparts) do
        	local mover = Instance.new("BodyPosition", part)
        	table.insert(movers, mover)
        	mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        end
        repeat
        	for i,plr in pairs(players)do
        		for index, mover in pairs(movers) do
        		    mover.Position = game:GetService("Players")[TargetIns].Character.HumanoidRootPart.CFrame:PointToWorldSpace()
        	    end
            end
            wait(0.5)
        until moving == false
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