repeat wait() until game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")
loadstring(game:HttpGet("https://pastebin.com/raw/t0pUK9XD", true))()
local key
for i, v in pairs(_G.whitelistedbois) do
    if game.Players.LocalPlayer.UserId == v then
        print("accepted!")
        key = v
    end
end
if not key then print("RUDE"); return end

if game.CoreGui:FindFirstChild("SuperGui") then
    game.CoreGui.SuperGui:Destroy()
end
local Main = Instance.new("ScreenGui")
Main.Parent = game:GetService("CoreGui")
Main.Name = "SuperGui"
local PARENT = Instance.new("Folder")
PARENT.Parent = Main
PARENT.Name = "LocateStuff"

local Plr = game.Players.LocalPlayer
local plr = Plr
local hum = Plr.Character:FindFirstChildOfClass("Humanoid")

local TpHandstoggle = false
local locatetoggle = false
local LoopTptoggle = false
local LoopTpon = false
local moving = false
local speed = false

local Background = Instance.new("Frame")
local Combat = Instance.new("TextButton")
local World = Instance.new("TextButton")
local Buys = Instance.new("TextButton")
local Farms = Instance.new("TextButton")
--combat
local Bag = Instance.new("TextButton")
local Kill = Instance.new("TextButton")
local Locate = Instance.new("TextButton")
local Grenade = Instance.new("TextButton")
local Range = Instance.new("TextButton")
local Name_Box = Instance.new("TextBox")
--misc
local IdStealer = Instance.new("TextButton")
local Name_Box2 = Instance.new("TextBox")
local Fly = Instance.new("TextButton")
local noclip = Instance.new("TextButton")
local walkspeed = Instance.new("TextButton")
local god_morph = Instance.new("TextButton")
local god_mode = Instance.new("TextButton")
--Buys
local Sledgehammer = Instance.new("TextButton")
local Knife = Instance.new("TextButton")
local Bat = Instance.new("TextButton")
local Stopsign  = Instance.new("TextButton")
local Shotgun = Instance.new("TextButton")
local glock = Instance.new("TextButton")
local Flame = Instance.new("TextButton")
local RPG = Instance.new("TextButton")
--farms
local Gym = Instance.new("TextButton")
local Fighting = Instance.new("TextButton")
local Fistfarm = Instance.new("TextButton")
local Autofarm = Instance.new("TextButton")
local Gunfarm = Instance.new("TextButton")
local Pfarm = Instance.new("TextButton")

local Plr = game.Players.LocalPlayer
local plr = Plr

Background.Active = true
Background.Draggable = true
Background.Parent = Main
Background.Size = UDim2.new(0, 325, 0, 250)
Background.Position = UDim2.new(0, -28, 0, 335)
Background.BackgroundColor3 = Color3.fromRGB(55, 55, 55)

Combat.Parent = Background
Combat.Size = UDim2.new(0, 75, 0, 35)
Combat.Position = UDim2.new(0, 5, 0, 12)
Combat.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
Combat.BackgroundTransparency = 0
Combat.Text = "Combat"

World.Parent = Background
World.Size = UDim2.new(0, 75, 0, 35)
World.Position = UDim2.new(0, 245, 0, 12)
World.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
World.BackgroundTransparency = 0
World.Text = "Misc"

Buys.Parent = Background
Buys.Size = UDim2.new(0, 75, 0, 35)
Buys.Position = UDim2.new(0, 165, 0, 12)
Buys.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
Buys.BackgroundTransparency = 0
Buys.Text = "Buys"

Farms.Parent = Background
Farms.Size = UDim2.new(0, 75, 0, 35)
Farms.Position = UDim2.new(0, 85, 0, 12)
Farms.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
Farms.BackgroundTransparency = 0
Farms.Text = "Farms"

--combat
Bag.Parent = Background
Bag.Size = UDim2.new(0, 115, 0, 35)
Bag.Position = UDim2.new(0, 40, 0, 102)
Bag.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Bag.BackgroundTransparency = 0
Bag.Text = "LoopTp"
Bag.Active = false
Bag.Visible = false

Kill.Parent = Background
Kill.Size = UDim2.new(0, 115, 0, 35)
Kill.Position = UDim2.new(0, 40, 0, 147)
Kill.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Kill.BackgroundTransparency = 0
Kill.Text = "Kill"
Kill.Active = false
Kill.Visible = false

Locate.Parent = Background
Locate.Size = UDim2.new(0, 115, 0, 35)
Locate.Position = UDim2.new(0, 165, 0, 102)
Locate.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Locate.BackgroundTransparency = 0
Locate.Text = "Locate"
Locate.Active = false
Locate.Visible = false

Grenade.Parent = Background
Grenade.Size = UDim2.new(0, 115, 0, 35)
Grenade.Position = UDim2.new(0, 165, 0, 147)
Grenade.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Grenade.BackgroundTransparency = 0
Grenade.Text = "Grenade"
Grenade.Active = false
Grenade.Visible = false

Range.Parent = Background
Range.Size = UDim2.new(0, 110, 0, 35)
Range.Position = UDim2.new(0, 105, 0, 192)
Range.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Range.BackgroundTransparency = 0
Range.Text = "Reach"
Range.Active = false
Range.Visible = false

Name_Box.Parent = Background
Name_Box.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Name_Box.BackgroundTransparency = 0
Name_Box.Position = UDim2.new(0, 63, 0, 57)
Name_Box.Size = UDim2.new(0, 200, 0, 36)
Name_Box.PlaceholderText = "Username"
Name_Box.Text = ""
Name_Box.Visible = false
Name_Box.Active = false

IdStealer.Parent = Background
IdStealer.Size = UDim2.new(0, 115, 0, 35)
IdStealer.Position = UDim2.new(0, 165, 0, 102)
IdStealer.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
IdStealer.BackgroundTransparency = 0
IdStealer.Text = "Steal ID"
IdStealer.Active = false
IdStealer.Visible = false

Name_Box2.Parent = Background
Name_Box2.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Name_Box2.BackgroundTransparency = 0
Name_Box2.Position = UDim2.new(0, 40, 0, 102)
Name_Box2.Size = UDim2.new(0, 115, 0, 35)
Name_Box2.PlaceholderText = "Username"
Name_Box2.Text = ""
Name_Box2.Visible = false
Name_Box2.Active = false

Fly.Parent = Background
Fly.Position = UDim2.new(0, 63, 0, 57)
Fly.Size = UDim2.new(0, 200, 0, 36)
Fly.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Fly.BackgroundTransparency = 0
Fly.Text = "Fly (x)"
Fly.Active = false
Fly.Visible = false

Sledgehammer.Parent = Background
Sledgehammer.Size = UDim2.new(0, 115, 0, 35)
Sledgehammer.Position = UDim2.new(0, 40, 0, 192)
Sledgehammer.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Sledgehammer.BackgroundTransparency = 0
Sledgehammer.Text = "Sledgehammer"
Sledgehammer.Active = false
Sledgehammer.Visible = false

Stopsign.Parent = Background
Stopsign.Size = UDim2.new(0, 115, 0, 35)
Stopsign.Position = UDim2.new(0, 40, 0, 57)
Stopsign.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Stopsign.BackgroundTransparency = 0
Stopsign.Text = "Stopsign"
Stopsign.Active = false
Stopsign.Visible = false

Knife.Parent = Background
Knife.Size = UDim2.new(0, 115, 0, 35)
Knife.Position = UDim2.new(0, 40, 0, 102)
Knife.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Knife.BackgroundTransparency = 0
Knife.Text = "Knife"
Knife.Active = false
Knife.Visible = false

Bat.Parent = Background
Bat.Size = UDim2.new(0, 115, 0, 35)
Bat.Position = UDim2.new(0, 40, 0, 147)
Bat.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Bat.BackgroundTransparency = 0
Bat.Text = "Bat"
Bat.Active = false
Bat.Visible = false

Shotgun.Parent = Background
Shotgun.Size = UDim2.new(0, 115, 0, 35)
Shotgun.Position = UDim2.new(0, 165, 0, 102)
Shotgun.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Shotgun.BackgroundTransparency = 0
Shotgun.Text = "Shotgun"
Shotgun.Active = false
Shotgun.Visible = false

glock.Parent = Background
glock.Size = UDim2.new(0, 115, 0, 35)
glock.Position = UDim2.new(0, 165, 0, 147)
glock.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
glock.BackgroundTransparency = 0
glock.Text = "Glock"
glock.Active = false
glock.Visible = false

Flame.Parent = Background
Flame.Size = UDim2.new(0, 115, 0, 35)
Flame.Position = UDim2.new(0, 165, 0, 192)
Flame.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Flame.BackgroundTransparency = 0
Flame.Text = "Flame"
Flame.Active = false
Flame.Visible = false

RPG.Parent = Background
RPG.Size = UDim2.new(0, 115, 0, 35)
RPG.Position = UDim2.new(0, 165, 0, 57)
RPG.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
RPG.BackgroundTransparency = 0
RPG.Text = "RPG"
RPG.Active = false
RPG.Visible = false

Gym.Parent = Background
Gym.Size = UDim2.new(0, 115, 0, 35)
Gym.Position = UDim2.new(0, 40, 0, 102)
Gym.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Gym.BackgroundTransparency = 0
Gym.Text = "Gym"
Gym.Active = false
Gym.Visible = false

Fighting.Parent = Background
Fighting.Size = UDim2.new(0, 115, 0, 35)
Fighting.Position = UDim2.new(0, 40, 0, 147)
Fighting.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Fighting.BackgroundTransparency = 0
Fighting.Text = "Fighting"
Fighting.Active = false
Fighting.Visible = false

Fistfarm.Parent = Background
Fistfarm.Size = UDim2.new(0, 115, 0, 35)
Fistfarm.Position = UDim2.new(0, 165, 0, 102)
Fistfarm.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Fistfarm.BackgroundTransparency = 0
Fistfarm.Text = "Fistfarm"
Fistfarm.Active = false
Fistfarm.Visible = false

Autofarm.Parent = Background
Autofarm.Size = UDim2.new(0, 115, 0, 35)
Autofarm.Position = UDim2.new(0, 165, 0, 147)
Autofarm.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Autofarm.BackgroundTransparency = 0
Autofarm.Text = "FullFarm"
Autofarm.Active = false
Autofarm.Visible = false

Gunfarm.Parent = Background
Gunfarm.Size = UDim2.new(0, 115, 0, 35)
Gunfarm.Position = UDim2.new(0, 40, 0, 57)
Gunfarm.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Gunfarm.BackgroundTransparency = 0
Gunfarm.Text = "GunFarm (Semi-Auto)"
Gunfarm.Active = false
Gunfarm.Visible = false

Pfarm.Parent = Background
Pfarm.Size = UDim2.new(0, 115, 0, 35)
Pfarm.Position = UDim2.new(0, 165, 0, 57)
Pfarm.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
Pfarm.BackgroundTransparency = 0
Pfarm.Text = "GunFarm (Full-Auto)"
Pfarm.Active = false
Pfarm.Visible = false

noclip.Parent = Background
noclip.Size = UDim2.new(0, 115, 0, 35)
noclip.Position = UDim2.new(0, 40, 0, 147)
noclip.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
noclip.BackgroundTransparency = 0
noclip.Text = "NoClip(E)"
noclip.Active = false
noclip.Visible = false

walkspeed.Parent = Background
walkspeed.Size = UDim2.new(0, 115, 0, 35)
walkspeed.Position = UDim2.new(0, 165, 0, 147)
walkspeed.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
walkspeed.BackgroundTransparency = 0
walkspeed.Text = "WalkSpeed"
walkspeed.Active = false
walkspeed.Visible = false

god_mode.Parent = Background
god_mode.Size = UDim2.new(0, 115, 0, 35)
god_mode.Position = UDim2.new(0, 40, 0, 192)
god_mode.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
god_mode.BackgroundTransparency = 0
god_mode.Text = "partial gm"
god_mode.Active = false
god_mode.Visible = false

god_morph.Parent = Background
god_morph.Size = UDim2.new(0, 115, 0, 35)
god_morph.Position = UDim2.new(0, 165, 0, 192)
god_morph.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
god_morph.BackgroundTransparency = 0
god_morph.Text = "God Morph"
god_morph.Active = false
god_morph.Visible = false

Combat.MouseButton1Down:connect(function()
    --combat
    Bag.Visible = true
    Bag.Active = true
    Kill.Visible = true
    Kill.Active = true
    Locate.Visible = true
    Locate.Active = true
    Grenade.Visible = true
    Grenade.Active = true
    Range.Visible = true
    Range.Active = true
    Name_Box.Visible = true
    Name_Box.Active = true
    --world
    IdStealer.Visible = false
    IdStealer.Active = false
    Name_Box2.Visible = false
    Name_Box2.Active = false
    Fly.Active = false
    Fly.Visible = false
    noclip.Active = false
    noclip.Visible = false
    walkspeed.Active = false
    walkspeed.Visible = false
    god_mode.Active = false
    god_mode.Visible = false
    god_morph.Active = false
    god_morph.Visible = false
    --Buys
    Sledgehammer.Visible = false
    Sledgehammer.Active = false
    Knife.Visible = false
    Knife.Active = false
    Bat.Visible = false
    Bat.Active = false
    Stopsign.Visible = false
    Stopsign.Active = false
    Shotgun.Visible = false
    Shotgun.Active = false
    glock.Visible = false
    glock.Active = false
    Flame.Visible = false
    Flame.Active = false
    RPG.Visible = false
    RPG.Active = false
    --farms
    Gym.Visible = false
    Gym.Active = false
    Fighting.Visible = false
    Fighting.Active = false
    Fistfarm.Visible = false
    Fistfarm.Active = false
    Autofarm.Visible = false
    Autofarm.Active = false
    Pfarm.Visible = false
    Pfarm.Active = false
    Gunfarm.Visible = false
    Gunfarm.Active = false
end)

World.MouseButton1Down:connect(function()
    --combat
    Bag.Visible = false
    Bag.Active = false
    Kill.Visible = false
    Kill.Active = false
    Locate.Visible = false
    Locate.Active = false
    Grenade.Visible = false
    Grenade.Active = false
    Range.Visible = false
    Range.Active = false
    Name_Box.Visible = false
    Name_Box.Active = false
    --world
    IdStealer.Visible = true
    IdStealer.Active = true
    Name_Box2.Visible = true
    Name_Box2.Active = true
    Fly.Active = true
    Fly.Visible = true
    noclip.Active = true
    noclip.Visible = true
    walkspeed.Active = true
    walkspeed.Visible = true
    god_mode.Active = true
    god_mode.Visible = true
    god_morph.Active = true
    god_morph.Visible = true
    --Buys
    Sledgehammer.Visible = false
    Sledgehammer.Active = false
    Knife.Visible = false
    Knife.Active = false
    Bat.Visible = false
    Bat.Active = false
    Stopsign.Visible = false
    Stopsign.Active = false
    Shotgun.Visible = false
    Shotgun.Active = false
    glock.Visible = false
    glock.Active = false
    Flame.Visible = false
    Flame.Active = false
    RPG.Visible = false
    RPG.Active = false
    --farms
    Gym.Visible = false
    Gym.Active = false
    Fighting.Visible = false
    Fighting.Active = false
    Fistfarm.Visible = false
    Fistfarm.Active = false
    Autofarm.Visible = false
    Autofarm.Active = false
    Pfarm.Visible = false
    Pfarm.Active = false
    Gunfarm.Visible = false
    Gunfarm.Active = false
end)

Buys.MouseButton1Down:connect(function()
    --combat
    Bag.Visible = false
    Bag.Active = false
    Kill.Visible = false
    Kill.Active = false
    Locate.Visible = false
    Locate.Active = false
    Grenade.Visible = false
    Grenade.Active = false
    Range.Visible = false
    Range.Active = false
    Name_Box.Visible = false
    Name_Box.Active = false
    --world
    IdStealer.Visible = false
    IdStealer.Active = false
    Name_Box2.Visible = false
    Name_Box2.Active = false
    Fly.Active = false
    Fly.Visible = false
    noclip.Active = false
    noclip.Visible = false
    walkspeed.Active = false
    walkspeed.Visible = false
    god_mode.Active = false
    god_mode.Visible = false
    god_morph.Active = false
    god_morph.Visible = false
    --Buys
    Sledgehammer.Visible = true
    Sledgehammer.Active = true
    Knife.Visible = true
    Knife.Active = true
    Bat.Visible = true
    Bat.Active = true
    Stopsign.Visible = true
    Stopsign.Active = true
    Shotgun.Visible = true
    Shotgun.Active = true
    glock.Visible = true
    glock.Active = true
    Flame.Visible = true
    Flame.Active = true
    RPG.Visible = true
    RPG.Active = true
    --farms
    Gym.Visible = false
    Gym.Active = false
    Fighting.Visible = false
    Fighting.Active = false
    Fistfarm.Visible = false
    Fistfarm.Active = false
    Autofarm.Visible = false
    Autofarm.Active = false
    Pfarm.Visible = false
    Pfarm.Active = false
    Gunfarm.Visible = false
    Gunfarm.Active = false
end)

Farms.MouseButton1Down:connect(function()
    --combat
    Bag.Visible = false
    Bag.Active = false
    Kill.Visible = false
    Kill.Active = false
    Locate.Visible = false
    Locate.Active = false
    Grenade.Visible = false
    Grenade.Active = false
    Range.Visible = false
    Range.Active = false
    Name_Box.Visible = false
    Name_Box.Active = false
    --world
    IdStealer.Visible = false
    IdStealer.Active = false
    Name_Box2.Visible = false
    Name_Box2.Active = false
    Fly.Active = false
    Fly.Visible = false
    noclip.Active = false
    noclip.Visible = false
    walkspeed.Active = false
    walkspeed.Visible = false
    god_mode.Active = false
    god_mode.Visible = false
    god_morph.Active = false
    god_morph.Visible = false
    --Buys
    Sledgehammer.Visible = false
    Sledgehammer.Active = false
    Knife.Visible = false
    Knife.Active = false
    Bat.Visible = false
    Bat.Active = false
    Stopsign.Visible = false
    Stopsign.Active = false
    Shotgun.Visible = false
    Shotgun.Active = false
    glock.Visible = false
    glock.Active = false
    Flame.Visible = false
    Flame.Active = false
    RPG.Visible = false
    RPG.Active = false
    --farms
    Gym.Visible = true
    Gym.Active = true
    Fighting.Visible = true
    Fighting.Active = true
    Fistfarm.Visible = true
    Fistfarm.Active = true
    Autofarm.Visible = true
    Autofarm.Active = true
    Pfarm.Visible = true
    Pfarm.Active = true
    Gunfarm.Visible = true
    Gunfarm.Active = true
end)

function DeleteAntiCheat()
    for i,v in pairs(Plr.Character:GetChildren()) do
        if v.ClassName == "Script" and v.Name ~= "Health" then
            v:Destroy()
        end
    end
end

Plr.CharacterAdded:Connect(function(character)
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
    DeleteAntiCheat()
end)
DeleteAntiCheat()

game:GetService('RunService').Stepped:connect(function()
    if Plr.Character:FindFirstChild("Christmas_Sock") then
        Plr.Character["Christmas_Sock"]:Destroy()
    end
end)

function Name()
    local TargetIns
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
    	if string.find(v.Name,Name_Box.Text) then
			TargetIns = v
			print("Target set to "..v.name)
		end
	end
    if not TargetIns then print("Target not found");return end
    return TargetIns
end

Grenade.MouseButton1Click:Connect(function()
    local TargetIns = Name()
    if TargetIns == nil then print("pp");return end
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
    local handpos = Plr.Character.RightHand.CFrame
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
	Plr.Character.RightHand.CFrame = handpos
    if Plr.Character.RightHand:FindFirstChild("RightWrist") then
    Plr.Character.RightHand.RightWrist:Destroy()
    end
    wait(0.1)
    Plr.Character["[Grenade]"]:Activate()
	local RightWrist = Instance.new("Weld", Plr.Character.RightHand)
	RightWrist.Part0 = Plr.Character.RightHand
	RightWrist.Part1 = Plr.Character.RightLowerArm
	RightWrist.C0 = CFrame.new(0.0682975054, -0.450790346, -0.204141855, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	RightWrist.C1 = CFrame.new(-0.0443148613, 0.233287811, 0.124126196, 1, 0, 0, 0, 1, 0, 0, 0, 1)
	RightWrist.Name = ("RightWrist")
    wait(1.8)
    local players = game.Players:GetPlayers()
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local unanchoredparts = {}
    local movers = {}
        
    for index, part in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
    	if part:IsA("Part") and part.Name == "Handle" then
      		table.insert(unanchoredparts, part)
   	    end
    end
        
    for index, part in pairs(unanchoredparts) do
      	part.CanCollide = false
	local mover = Instance.new("BodyPosition", part)
       	table.insert(movers, mover)
       	mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    end
    repeat
       	for i,plr in pairs(players)do
       		for index, mover in pairs(movers) do
       		    
			mover.Position = TargetIns.Character.HumanoidRootPart.CFrame:PointToWorldSpace()
       	    end
        end
        wait(0.5)
    until moving == false
end
end)

Locate.MouseButton1Click:Connect(function()
    local TargetIns = Name()
    if locatetoggle then 
        print("unlocating...")
        locatetoggle = false
        UnLocate()
    else
        print("locating...")
        locatetoggle = true
        locate(TargetIns)
	end
end)

Kill.MouseButton1Click:Connect(function()
    local TargetIns = Name()
    if locatetoggle then 
        print("unlocking hands...")
        TpHandstoggle = false

    else
        print("locking hands...")
        TpHandstoggle = true
    local Run = true

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
    TpHandstoggle = false
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

    end
end)

Bag.MouseButton1Click:Connect(function()
    local Target1ns = Name()
    if LoopTptoggle then 
        print("stopping...")
        LoopTptoggle = false
        looptpon = false
    else
        print("tping...")
        LoopTptoggle = true
        looptpon = true
        while wait() do
		    local success, error = pcall(function()
			    if looptpon then
    				if not Target1ns.Character.BodyEffects["K.O"].Value then 
    					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target1ns.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
					else looptpon = false end
    			else
    			    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Target1ns.Character.UpperTorso.CFrame * CFrame.new(0,2,0)
        			wait()
        			Target1ns = nil
        		end
			end)
		end
	end
end)

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end
function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

function UnLocate()
    for i,c in pairs(PARENT:GetChildren()) do
    	if string.find(c.Name, "_LC") then
		    c:Destroy()
	    end
    end
end

    local plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)
        if key == "b" then
            local lastpos = Plr.character.HumanoidRootPart.CFrame
            local success, error = pcall(function()
                repeat
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("[BrownBag]") == nil then
                        repeat wait()
                            Plr.character.HumanoidRootPart.CFrame = CFrame.new(-316.034454, 48.2788467, -723.860474, 0.983254969, -0.000297372608, -0.182234928, 0.000218386791, 0.999999881, -0.000453495246, 0.182235047, 0.000406103791, 0.98325491)
                            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[BrownBag] - $25"].ClickDetector)
                        until game.Players.LocalPlayer.Backpack:FindFirstChild("[BrownBag]") ~= nil
                    end
                    wait()
                    game.Players.LocalPlayer.Backpack["[BrownBag]"].Handle.Size = Vector3.new(10, 10, 10)
                    wait(0.1)
                    Plr.Character.Humanoid:EquipTool(Plr.Backpack["[BrownBag]"])
                    Plr.Character["[BrownBag]"]:Activate()
                    wait(2)
                    if Target1ns then
                        loopLoopTpon()
                    else Plr.Character.HumanoidRootPart.CFrame = lastpos end
                until Target1ns.Character:FindFirstChild("Christmas_Sock") ~= nil
            end)
        end
    end)

function locate(plr)
	spawn(function()
		wait()
		print(plr)
		if plr.Character and plr.Name ~= game.Players.LocalPlayer.Name and not PARENT:FindFirstChild(plr.Name..'_LC') then
			local ESPholder = Instance.new("Folder", PARENT)
			ESPholder.Name = plr.Name..'_LC'
			print(plr)
			repeat wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid')
			for b,n in pairs (plr.Character:GetChildren()) do
				if (n:IsA("BasePart")) then
					local a = Instance.new("BoxHandleAdornment", ESPholder)
					a.Name = plr.Name
					a.Adornee = n
					a.AlwaysOnTop = true
					a.ZIndex = 10
					a.Size = n.Size
					a.Transparency = 0.3
					a.Color = plr.TeamColor
				end
			end
			if plr.Character and plr.Character:FindFirstChild('Head') then
				local BillboardGui = Instance.new("BillboardGui", ESPholder)
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = plr.Character.Head
				BillboardGui.Name = plr.Name
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 20
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = 'Name: '..plr.Name
				local lcLoopFunc
				local addedFunc
				local teamChange
				addedFunc = plr.CharacterAdded:Connect(function()
					if ESPholder ~= nil and ESPholder.Parent ~= nil then
						lcLoopFunc:Disconnect()
						teamChange:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid')
						Locate(plr)
						addedFunc:Disconnect()
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
					end
				end)
				teamChange = plr:GetPropertyChangedSignal("TeamColor"):connect(function()
					if ESPholder ~= nil and ESPholder.Parent ~= nil then
						lcLoopFunc:Disconnect()
						addedFunc:Disconnect()
						ESPholder:Destroy()
						repeat wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid')
						Locate(plr)
						teamChange:Disconnect()
					else
						teamChange:Disconnect()
					end
				end)
				local function lcLoop()
					if PARENT:FindFirstChild(plr.Name..'_LC') then
						if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid') and game.Players.LocalPlayer.Character and getRoot(game.Players.LocalPlayer.Character) and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid') then
							local pos = math.floor((getRoot(game.Players.LocalPlayer.Character).Position - getRoot(plr.Character).Position).magnitude)
							TextLabel.Text = 'Name: '..plr.Name..' | Health: '..round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1)..' | Studs: '..pos
						end
					else
						teamChange:Disconnect()
						addedFunc:Disconnect()
						lcLoopFunc:Disconnect()
					end
				end
				lcLoopFunc = game:GetService("RunService").RenderStepped:Connect(lcLoop)
			end
		end
	end)
end

Range.MouseButton1Click:Connect(function()
        for i,v in pairs(Plr.Character:GetChildren()) do
        if v:IsA("Tool") then
            v.TextureId = 0
            if v.Name ~= "Combat" then
                local pp = v.Handle
                if v.Name ~= "[SledgeHammer]" and v.Name ~= "[StopSign]" then
                    pp.MeshId = 0
                    pp.Transparency = 1
                elseif v.Name == "[SledgeHammer]" then v.Part:Destroy() wait(0.1) v.Part:Destroy()
                elseif v.Name == "[StopSign]" then v.Sign:Destroy() end
        
                pp.Size = Vector3.new(50, 50, 50)
                print(v)
                Plr.Character.Humanoid:UnequipTools()
                local tooloutline = Instance.new("SelectionBox",v.Handle)
                tooloutline.Adornee = pp
            else 
                for i,v in ipairs(Plr.Character:GetDescendants()) do
                     if v:IsA("MeshPart") then v.Massless = true
                        v.CanCollide = false
                        v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                    end
               end
               for i,v in ipairs(game.Workspace:GetDescendants()) do
                    if v:IsA("Seat") then 
                        v:Destroy()
                    end
                end
                local oldsize = Plr.Character.RightHand.Size
                game:GetService('RunService').Stepped:connect(function()
                    if Plr.Character:FindFirstChild("Combat") and not Plr.Character.RightHand:FindFirstChild("ppsuc") then
                        local HandHitBox = Instance.new("SelectionBox",Plr.Character.RightHand)
                        HandHitBox.Adornee = Plr.Character.RightHand
                        HandHitBox.Name = "ppsuc"
                        Plr.Character.RightHand.Size = Vector3.new(35, 35, 35)
                        Plr.Character.RightHand.Transparency = 1
                    elseif not Plr.Character:FindFirstChild("Combat") and Plr.Character.RightHand:FindFirstChild("ppsuc") then
                        Plr.Character.RightHand.ppsuc:Destroy()
                        Plr.Character.RightHand.Size = oldsize
                        Plr.Character.RightHand.Transparency = 0
                    end
                end)
            end
        end
    end
end)

IdStealer.MouseButton1Click:Connect(function()
	local TargetIns
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if string.find(v.Name,Name_Box2.Text) then
			TargetIns = v
		end
	end
    local audioid = Instance.new("Frame")
    audioid.Name = "audioid"
	print(Main)
	audioid.Parent = Main
	audioid.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	audioid.BackgroundTransparency = 0.500
	audioid.Position = UDim2.new(0, 50, 0, 50)
	audioid.Size = UDim2.new(0, 268, 0, 36)

	local minimize = Instance.new("TextButton")    
    minimize.Name = "minimize"
	minimize.Parent = audioid
	minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	minimize.BackgroundTransparency = 1.000
	minimize.Position = UDim2.new(0, 0, 0, 0)
	minimize.Size = UDim2.new(0, 268, 0, 36)
	minimize.Font = Enum.Font.Gotham
	minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
	minimize.TextSize = 20.000
	minimize.Text = "Nothing Lmao"
	minimize.MouseButton1Click:Connect(function()
		audioid:Destroy()
	end)
	local plr2 = TargetIns
    local ID = plr2.Character.LowerTorso.BOOMBOXSOUND.SoundId
    ID = ID:sub(string.find(ID,"%d+"))
    minimize.Text = 'The ID is: '..ID
end)

Fly.MouseButton1Click:Connect(function()
    local flight
local plr = game.Players.LocalPlayer
IYMouse = plr:GetMouse()
IYMouse.KeyDown:connect(function(key)
        if key == "x" then
            if flight then
                flight = false
                fly()
            else
                flight = true
                NOFLY()
            end
        end
    end)

    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    	if v:IsA("BasePart") and v.CanCollide == true then
    		v.CanCollide = false
    	end
    end
    
    FLYING = false
    QEfly = true
    iyflyspeed = 3
    vehicleflyspeed = 3
    function sFLY(vfly)
    	repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and hum
    	repeat wait() until IYMouse
    	
    	local T = game.Players.LocalPlayer.Character.LowerTorso
    	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    	local SPEED = 5
	
    	local function FLY()
    		FLYING = true
    		local BG = Instance.new('BodyGyro', T)
    		local BV = Instance.new('BodyVelocity', T)
    		BG.P = 9e4
    		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    		BG.cframe = T.CFrame
    		BV.velocity = Vector3.new(0, 0, 0)
    		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
    		spawn(function()
    			repeat wait()
    				if not vfly and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
    					game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
    				end
    				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
    					SPEED = 50
    				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
    					SPEED = 0
    				end
    				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
    					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
    					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
    				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
    					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
    				else
    					BV.velocity = Vector3.new(0, 0, 0)
    				end
    				BG.cframe = workspace.CurrentCamera.CoordinateFrame
    			until not FLYING
    			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    			SPEED = 0
    			BG:destroy()
    			BV:destroy()
    			if hum then
    				hum.PlatformStand = false
    			end
    		end)
    	end
    	IYMouse.KeyDown:connect(function(KEY)
    		if KEY:lower() == 'w' then
    			if vfly then
    				CONTROL.F = vehicleflyspeed
    			else
    				CONTROL.F = iyflyspeed  
    			end
    		elseif KEY:lower() == 's' then
    			if vfly then
				CONTROL.B = - vehicleflyspeed
    			else
    				CONTROL.B = - iyflyspeed
    			end
    		elseif KEY:lower() == 'a' then
    			if vfly then
    				CONTROL.L = - vehicleflyspeed
    			else
    				CONTROL.L = - iyflyspeed
    			end
    		elseif KEY:lower() == 'd' then 
    			if vfly then
    				CONTROL.R = vehicleflyspeed
    			else
    				CONTROL.R = iyflyspeed
    			end
    		elseif QEfly and KEY:lower() == 'e' then
    			if vfly then
    				CONTROL.Q = vehicleflyspeed*2
    			else
    				CONTROL.Q = iyflyspeed*2
    			end
    		elseif QEfly and KEY:lower() == 'q' then
    			if vfly then
    				CONTROL.E = -vehicleflyspeed*2
    			else
    				CONTROL.E = -iyflyspeed*2
    			end
    		end
    	end)
    	IYMouse.KeyUp:connect(function(KEY)
    		if KEY:lower() == 'w' then
    			CONTROL.F = 0
    		elseif KEY:lower() == 's' then
    			CONTROL.B = 0
    		elseif KEY:lower() == 'a' then
    			CONTROL.L = 0
    		elseif KEY:lower() == 'd' then
    			CONTROL.R = 0
    		elseif KEY:lower() == 'e' then
    			CONTROL.Q = 0
    		elseif KEY:lower() == 'q' then
    			CONTROL.E = 0
    		end
    	end)
    	FLY()
    end

    function NOFLY()
    	FLYING = false
    	hum.PlatformStand = false
    end

    function fly()
        NOFLY()
        wait()
        sFLY()
    end
end)

function gettool(tool)
    local lastpos = Plr.Character.HumanoidRootPart.CFrame
    Plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop[tool].Head.CFrame
    wait(0.2)
    fireclickdetector(game:GetService("Workspace").Ignored.Shop[tool].ClickDetector)
    Plr.Character.HumanoidRootPart.CFrame = lastpos
end

Sledgehammer.MouseButton1Click:Connect(function()
    gettool("[SledgeHammer] - $350")
end)
Knife.MouseButton1Click:Connect(function()
    for index, ppsuc in pairs(game:GetService("Workspace").Ignored.ItemsDrop) do
        if ppsuc:FindFirstChild("[Knife]") then
            local ghgh = ppsuc
            Plr.Character.HumanoidRootPart.CFrame = ghgh.CFrame
        end
    end
    if not ghgh then
        gettool("[Knife] - $150")
    end
end)
Bat.MouseButton1Click:Connect(function()
    gettool("[Bat] - $250")
end)
Stopsign.MouseButton1Click:Connect(function()
    gettool("[StopSign] - $300")
end)
Shotgun.MouseButton1Click:Connect(function()
    gettool("[Shotgun] - $1250")
end)
glock.MouseButton1Click:Connect(function()
    gettool("[Glock] - $300")
end)
Flame.MouseButton1Click:Connect(function()
    gettool("[Flamethrower] - $7500")
end)
RPG.MouseButton1Click:Connect(function()
    gettool("[RPG] - $6000")
end)

Autofarm.MouseButton1Click:Connect(function()
    local plr = game.Players.LocalPlayer

    local ATMEnabled,HospitalEnabled,ShoeEnabled = false,false,false
    
    if messagebox("Enable ATM Farm?","Settings",4) == 6 then ATMEnabled = true end
    if messagebox("Enable Hospital Farm?","Settings",4) == 6 then HospitalEnabled = true end
    if messagebox("Enable Shoe Farm?","Settings",4) == 6 then ShoeEnabled = true end

    repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")

    for i,v in pairs(game.Workspace:GetDescendants()) do
    	if v:IsA("Seat") then
    		v:Destroy()
    	end
    end

    function DeleteAntiCheat()
        for i,v in pairs(plr.Character:GetChildren()) do
            if v.ClassName == "Script" and v.Name ~= "Health" then
                v:Destroy()
            end
        end
    end
    
    plr.CharacterAdded:Connect(function(character)
        repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
        DeleteAntiCheat()
    	wait(1)
    	reset = false
    end)
    DeleteAntiCheat()

    local reset = false
    spawn(function()
    	while wait() do
    		pcall(function()if plr.Character.Humanoid.Health <= 0 then reset = true end end)
    	end
    end)
    
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)

    game:GetService('RunService').Stepped:connect(function()
    	pcall(function()plr.Character.Humanoid:ChangeState(11)end)
    	setsimulationradius(math.huge)
    end)
    
    local function CompleteHospitalJob(Colour,Patient)
    	repeat
    		fireclickdetector(game.Workspace.Ignored.HospitalJob[Colour].ClickDetector)
    		wait(0.1)
    		if Patient:FindFirstChild("ClickDetector") then
    			fireclickdetector(Patient.ClickDetector)
    		end
    	until Patient.Name == "Thank you!" or Patient.Name == "Wrong bottle!"
    end

    local function OtherJobs()
    	if HospitalEnabled then
    		for i,v in pairs(game.Workspace.Ignored.HospitalJob:GetChildren()) do
    			if v.ClassName == "Model" then
    				plr.Character.HumanoidRootPart.CFrame = CFrame.new(113.1,22.79,-478.97)
    				if string.find(v.Name, "Red") then CompleteHospitalJob("Red",v)
    				elseif string.find(v.Name, "Blue") then CompleteHospitalJob("Blue",v)
    				elseif string.find(v.Name, "Green") then CompleteHospitalJob("Green",v) end
    			end
    		end
    	end
    	if ShoeEnabled then
    		for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
    			if v.Name == "MeshPart" then
    				v.Name = "ShoeGrabbing"
    				repeat
    					wait()
    					pcall(function()
    						plr.Character.HumanoidRootPart.CFrame = v.CFrame
    						fireclickdetector(v.ClickDetector)
    					end)
    				until not game.Workspace.Ignored.Drop:FindFirstChild("ShoeGrabbing")
    			end
    		end
    		if plr.Character.BodyEffects.ShoesCollect.Value > 9 then
    			fireclickdetector(game.Workspace.Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector)
    		end
    	end
    end
    
    while wait(0.5) do
    	OtherJobs()
    	if ATMEnabled then
    		for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
    			if v.Humanoid.Health > 0 then
    				spawn(function()
    					while v.Humanoid.Health > 0 do
    						wait()
    						pcall(function()plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0, -2, 1.5)end)
    					end
    				end)
    				repeat
    					pcall(function()plr.Character.Humanoid:EquipTool(plr.Backpack.Combat)end)
    					wait(0.1)
    					pcall(function()
    						plr.Character.Combat:Activate()
    						wait(2)
    						plr.Character.Combat:Deactivate()
    						wait(1)
    					end)
    				until v.Humanoid.Health <= 0
    				wait(0.1)
    				for ii,vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
    					if vv.Name ~= "MoneyDrop" then continue end
    					if (plr.Character.HumanoidRootPart.Position - vv.Position).Magnitude > 25 then continue end
    					vv.Name = "Grabbing"
    					vv.Anchored = true
    					while game.Workspace.Ignored.Drop:FindFirstChild("Grabbing") do
    						wait()
    						pcall(function()
    							plr.character.HumanoidRootPart.CFrame = vv.CFrame
    							if not reset then fireclickdetector(vv.ClickDetector) end
    						end)
    					end
    				end
    				OtherJobs()
    			end
    		end
    	end
    end

end)

Fistfarm.MouseButton1Click:Connect(function()
    local plr = game.Players.LocalPlayer
    local Plr = plr
    local daPlr = plr
    local Hand = Plr.Character.RightHand
    repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")
    --SEAT DESTRUCTIONNNNN
    for i,v in pairs(game.Workspace:GetDescendants()) do
    	if v:IsA("Seat") then
    		v:Destroy()
    	end
    end
    --anti tp anticheat
    function DeleteAntiCheat()
        for i,v in pairs(plr.Character:GetChildren()) do
            if v.ClassName == "Script" and v.Name ~= "Health" then
                v:Destroy()
            end
        end
    end
    --rightwristbreaker
    if Hand:FindFirstChild("RightWrist") then
        Hand.RightWrist:Destroy()
    end
    plr.CharacterAdded:Connect(function(character)
        repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
        DeleteAntiCheat()
    	wait(1)
    	reset = false
    end)
    DeleteAntiCheat()
    --respawn
    local reset = false
    spawn(function()
    	while wait() do
    		pcall(function()if plr.Character.Humanoid.Health <= 0 then reset = true end end)
    	end
    end)
    --antiafk
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    --network ownership
    game:GetService('RunService').Stepped:connect(function()
    	pcall(function()plr.Character.Humanoid:ChangeState(11)end)
    	setsimulationradius(math.huge)
    end)

    spawn(function()
        while wait(0.5) do
            for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
                if v.Humanoid.Health > 0 then
                    spawn(function()
                        while v.Humanoid.Health > 0 do
                            wait()
                            pcall(function()
                                Hand.Position = Vector3.new(v.Head.CFrame)
        		                Hand.CFrame = v.Head.CFrame
        		            end)
                        end
                    end)
                        repeat
                            pcall(function()plr.Character.Humanoid:EquipTool(plr.Backpack.Combat)end)
                            wait(0.1)
                            pcall(function()
                                plr.Character.Combat:Activate()
                                wait(2)
                                plr.Character.Combat:Deactivate()
                                wait(1)
                            end)
                        until v.Humanoid.Health <= 0
                        wait(0.1)
                    end
                end
            end
        end)
        local moneyfarmrunonce = false
        _G.moneyfarmon = true
        function moneyfarm()
        	if moneyfarmrunonce then return end
        	moneyfarmrunonce = true
        	local vu = game:GetService("VirtualUser")
    
        	game:GetService("Players").LocalPlayer.Idled:connect(function()
        		if _G.moneyfarmon then
        			vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        			wait(1)
        			vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        		end
        	end)

        	daPlr.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-380,572,-578))
    
        	game:GetService('RunService').Stepped:connect(function()
        		if _G.moneyfarmon then
        			daPlr.Character.Humanoid:ChangeState(11)
        		end
        	end)
    
        	wait(0.1)
        
        	spawn(function()
        		while true do
        			wait(0.5)
        			if _G.moneyfarmon then
        				daPlr.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-380,572,-578))
        			end
        		end
        	end)
        	local function a(b)
        		if b:FindFirstChild("BodyPosition") then
        			return
        		end
        		b.CanCollide = false
        		local bodypos = Instance.new("BodyPosition", b)
        		bodypos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        		bodypos.P = 1e6
        		if b:WaitForChild("BillboardGui",0.25):WaitForChild("TextLabel",0.25).Text == "$100" then
        			bodypos.Position = Vector3.new(0,-100000,0)
        			return
        		end
        		bodypos.Position = Vector3.new(-380,572,-578)
        		spawn(function()
        			wait(3)
        			if (b.Position - daPlr.Character:FindFirstChild("HumanoidRootPart").CFrame.p).magnitude < 8 then
        				wait(0.5)
        				while b do
        					wait(1)
        					fireclickdetector(b.ClickDetector)
        				end
        			end
        		end)
        	end
        	for d, e in ipairs(workspace.Ignored:GetDescendants()) do
        		if e:IsA("Part") and e.Anchored == false and e.Name == "MoneyDrop" then
        			if not e:IsDescendantOf(game.Players.LocalPlayer.Character) then
        				a(e)
        			end
        		end
        	end
        	workspace.Ignored.DescendantAdded:Connect(
        		function(b)
        			if _G.moneyfarmon and b:IsA("Part") and b.Anchored == false and b.Name == "MoneyDrop" then
        				if not b:IsDescendantOf(game.Players.LocalPlayer.Character) then
        					a(b)
        				end
        			end
        		end
        	)
        end
    moneyfarm()
end)

Fighting.MouseButton1Click:Connect(function()
    repeat
        pcall(function()plr.Character.Humanoid:EquipTool(plr.Backpack.Combat)end)
        wait(0.1)
        pcall(function()
        	plr.Character.Combat:Activate()
        	wait(0.1)
        	plr.Character.Combat:Deactivate()
        	wait(1)
        end)
        Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-278.735565, 23.0311375, -1141.04272, 0, 0, -1, 0, 1, 0, 1, 0, -0.102449909)
    until false 
end)

Gym.MouseButton1Click:Connect(function()
    spawn(function()
        repeat wait() until Plr.Character:FindFirstChild("[HeavyWeights]")
        game.RunService.stepped:connect(function()
            Plr.Character.Humanoid:ChangeState(11)
        end)
        while wait(0.8) do
            Plr.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-1000, 1000), math.random(-450, 1000), math.random(-1000, 1000))
        end
    end)
    repeat wait()
        if plr.Backpack:FindFirstChild("[HeavyWeights]") or Plr.Character:FindFirstChild("[HeavyWeights]") then
            pcall(function()plr.Character.Humanoid:EquipTool(plr.Backpack["[HeavyWeights]"])end)
            wait(0.1)
            pcall(function()
            	plr.Character["[HeavyWeights]"]:Activate()
            	wait(0.2)
            	plr.Character["[HeavyWeights]"]:Deactivate()
            	wait(4)
            end)
        else
            Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[HeavyWeights] - $250"].Head.CFrame wait(0.2)
            fireclickdetector(game.Workspace.Ignored.Shop["[HeavyWeights] - $250"].ClickDetector)
        end
    until false
end)

walkspeed.MouseButton1Down:connect(function()
    if speed then speed = false else speed = true
        while speed do wait()
    	    if hum.Name ~= "speed bypassed bitttttch" then
        	    hum.Name = "speed bypassed bitttttch"
            end
            hum.WalkSpeed = 70
        end
    end 
    if not speed then hum.WalkSpeed = 16;hum.Name = "Humanoid" end
end)

god_morph.MouseButton1Down:connect(function()
    game.ReplicatedStorage.ClientAnimations.Block.AnimationId = "rbxassetid://1940060061"
    game.Players.LocalPlayer.Character.Humanoid:Destroy()
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")

    game:GetService("RunService").stepped:connect(function()
        pcall(function()
            game.ReplicatedStorage.MainEvent:FireServer("Block", true)
            game.Players.LocalPlayer.Character.BodyEffects.Defense:Destroy()
        end)
    end)
end)
god_mode.MouseButton1Down:connect(function()
    game.Players.LocalPlayer.Character.BodyEffects.Armor:Destroy()
end)
noclip.MouseButton1Down:connect(function()
    noclip = false
    game:GetService('RunService').Stepped:connect(function()
    	if noclip then
    		hum:ChangeState(11)
    	end
    end)
    plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)
    	if key == "e" then
    		noclip = not noclip
    		hum:ChangeState(11)
    	end
    end)
end)

Gunfarm.MouseButton1Down:connect(function()
local plr = game.Players.LocalPlayer
local gun = plr.Character:FindFirstChildOfClass("Tool")
local lastgun = gun.Name
if plr.Character.BodyEffects:FindFirstChild("Armor") then
    plr.Character.BodyEffects.Armor:Destroy()
end

repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")
--SEAT DESTRUCTIONNNNN
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("Seat") then
		v:Destroy()
	end
end
--anti tp anticheat
function DeleteAntiCheat()
    for i,v in pairs(plr.Character:GetChildren()) do
        if v.ClassName == "Script" and v.Name ~= "Health" then
            v:Destroy()
        end
    end
end

plr.CharacterAdded:Connect(function(character)
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
    DeleteAntiCheat()
	wait(1)
	reset = false
end)
DeleteAntiCheat()
--respawn
local reset = false
spawn(function()
	while wait() do
		pcall(function()if plr.Character.Humanoid.Health <= 0 then reset = true end end)
	end
end)
--antiafk
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
--network ownership
game:GetService('RunService').Stepped:connect(function()
	pcall(function()plr.Character.Humanoid:ChangeState(11)end)
	setsimulationradius(math.huge)
end)

while wait(0.5) do
    for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
        if v.Humanoid.Health > 0 then
            spawn(function()
                while v.Humanoid.Health > 0 do
                    wait()
                    pcall(function()plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0.3, 0, 5)end)
                end
            end)
            repeat
                wait(0.5)
                if gun.Ammo.Value == 0 then 
                    if plr.DataFolder.Inventory[gun.Name].Value == "0" then
                        for i, v in pairs(game.Workspace.Ignored.Shop:GetChildren()) do
                            if string.find(v.Name, string.sub(string.gsub(gun.Name, "]", " Ammo"), 2, 15)) then
                                plr.Character.Humanoid:UnequipTools()
                                repeat wait()
                                    plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame
                                    fireclickdetector(v.ClickDetector)
                                until tonumber(plr.DataFolder.Inventory[gun.Name].Value) >= 400
                                plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(lastgun))
                            end
                        end
                    else
                        game.ReplicatedStorage.MainEvent:FireServer("Reload", gun)
                        repeat wait() until gun.Ammo ~= 0
                    end
                else
                    pcall(function()
                        game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePos", v.Head.Position)
                        wait()
                        repeat wait()
                            gun:Activate()
                            wait()
                            gun:Deactivate()
                        until v.Humanoid.Health <= 0 or gun.Ammo.Value == 0
                    end)
                end
            wait(0.1)
            until v.Humanoid.Health <= 0

            for ii,vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                if vv.Name ~= "MoneyDrop" then continue end
                if (plr.Character.HumanoidRootPart.Position - vv.Position).Magnitude > 25 then continue end
                vv.Name = "Grabbing"
                vv.Anchored = true
                while game.Workspace.Ignored.Drop:FindFirstChild("Grabbing") do
                    wait(0.5)
                    wait()
                    pcall(function()
                        plr.character.HumanoidRootPart.CFrame = vv.CFrame
                        if not reset then fireclickdetector(vv.ClickDetector) end
                    end)
                end
            end
        end
    end
end
end)
Pfarm.MouseButton1Down:connect(function()
local plr = game.Players.LocalPlayer
local gun = plr.Character:FindFirstChildOfClass("Tool")
local lastgun = gun.Name
if plr.Character.BodyEffects:FindFirstChild("Armor") then
    plr.Character.BodyEffects.Armor:Destroy()
end

repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")
--SEAT DESTRUCTIONNNNN
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("Seat") then
		v:Destroy()
	end
end
--anti tp anticheat
function DeleteAntiCheat()
    for i,v in pairs(plr.Character:GetChildren()) do
        if v.ClassName == "Script" and v.Name ~= "Health" then
            v:Destroy()
        end
    end
end

plr.CharacterAdded:Connect(function(character)
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
    DeleteAntiCheat()
	wait(1)
	reset = false
end)
DeleteAntiCheat()
--respawn
local reset = false
spawn(function()
	while wait() do
		pcall(function()if plr.Character.Humanoid.Health <= 0 then reset = true end end)
	end
end)
--antiafk
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
--network ownership
game:GetService('RunService').Stepped:connect(function()
	pcall(function()plr.Character.Humanoid:ChangeState(11)end)
	setsimulationradius(math.huge)
end)

while wait(0.5) do
    for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
        if v.Humanoid.Health > 0 then
            spawn(function()
                while v.Humanoid.Health > 0 do
                    wait()
                    pcall(function()plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0.3, 0, 5)end)
                end
            end)
            repeat
                wait(0.5)
                if gun.Ammo.Value == 0 then 
                    if plr.DataFolder.Inventory[gun.Name].Value == "0" then
                        for i, v in pairs(game.Workspace.Ignored.Shop:GetChildren()) do
                            if string.find(v.Name, string.sub(string.gsub(gun.Name, "]", " Ammo"), 2, 15)) then
                                plr.Character.Humanoid:UnequipTools()
                                repeat wait()
                                    plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame
                                    fireclickdetector(v.ClickDetector)
                                until tonumber(plr.DataFolder.Inventory[gun.Name].Value) >= 400
                                plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(lastgun))
                            end
                        end
                    else
                        game.ReplicatedStorage.MainEvent:FireServer("Reload", gun)
                        repeat wait() until gun.Ammo ~= 0
                    end
                else
                    pcall(function()
                        game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePos", v.Head.Position)
                        wait()
                        gun:Activate()
                        repeat wait() until v.Humanoid.Health <= 0 or gun.Ammo.Value == 0
                        gun:Deactivate()
                    end)
                end
            wait(0.1)
            until v.Humanoid.Health <= 0

            for ii,vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                if vv.Name ~= "MoneyDrop" then continue end
                if (plr.Character.HumanoidRootPart.Position - vv.Position).Magnitude > 25 then continue end
                vv.Name = "Grabbing"
                vv.Anchored = true
                while game.Workspace.Ignored.Drop:FindFirstChild("Grabbing") do
                    wait(0.5)
                    wait()
                    pcall(function()
                        plr.character.HumanoidRootPart.CFrame = vv.CFrame
                        if not reset then fireclickdetector(vv.ClickDetector) end
                    end)
                end
            end
        end
    end
end
end)