repeat wait() until game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")
local Plr = game.Players.LocalPlayer
local Screen
loadstring(game:HttpGet("https://pastebin.com/raw/t0pUK9XD", true))()
local key
for i, v in pairs(_G.whitelistedbois) do
    if Plr.UserId == v then
        print("accepted!")
        key = v
        Screen = Instance.new("ScreenGui", game.CoreGui)
    end
end

if not key then
    function c()
        return tostring(math.ceil(math.random(-20000000000, 0)))
    end
    local ID = tostring(game.Players.LocalPlayer.UserId)
    local numbs = ID:split('')
    local tab = {}
    local encoded = ""
    for i, v in pairs(numbs) do
        table.insert(tab, c()..v)
    end
    for i, v in pairs(tab) do
        encoded = encoded..v
    end
    
    setclipboard(encoded)
    game.StarterGui:SetCore("SendNotification", {
        Title = "RZGUI";
        Text = "Key copied to clipboard - Send to Ruzzell78#4635";
        Duration = 5;
    })
    return
end

local Background = Instance.new("Frame", Screen)
Background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.5, 0, 0.505, 0)
Background.Size = UDim2.new(0, 333, 0, 222)
Background.Active = true
Background.Draggable = true

local top = Instance.new("ImageLabel", Background)
top.BackgroundTransparency = 1
top.BorderColor3 = Color3.fromRGB(27, 42, 53)
top.Position = UDim2.new(0, 0, 0, -11)
top.Size = UDim2.new(1, 0, 0, 22)
top.Image = "rbxassetid://3570695787"
top.ImageColor3 = Color3.fromRGB(48, 48, 48)
top.ScaleType = "Slice"
top.SliceCenter = Rect.new(100,100,100,100)
top.SliceScale = 0.11

local left = Instance.new("ImageLabel", Background)
left.BackgroundTransparency = 1
left.BorderColor3 = Color3.fromRGB(27, 42, 53)
left.Position = UDim2.new(0, 0, -0.028, 0)
left.Size = UDim2.new(0, 13, 1.05, 0)
left.Image = "rbxassetid://3570695787"
left.ImageColor3 = Color3.fromRGB(48, 48, 48)
left.ScaleType = "Slice"
left.SliceCenter = Rect.new(100,100,100,100)
left.SliceScale = 0.11

local bottom = Instance.new("ImageLabel", Background)
bottom.BackgroundTransparency = 1
bottom.BorderColor3 = Color3.fromRGB(27, 42, 53)
bottom.Position = UDim2.new(0, 0, 0.95, 0)
bottom.Size = UDim2.new(1, 0, 0, 22)
bottom.Image = "rbxassetid://3570695787"
bottom.ImageColor3 = Color3.fromRGB(48, 48, 48)
bottom.ScaleType = "Slice"
bottom.SliceCenter = Rect.new(100,100,100,100)
bottom.SliceScale = 0.11

local right = Instance.new("ImageLabel", Background)
right.BackgroundTransparency = 1
right.BorderColor3 = Color3.fromRGB(27, 42, 53)
right.Position = UDim2.new(1, -13, -0.028, 0)
right.Size = UDim2.new(0, 13, 1.05, 0)
right.Image = "rbxassetid://3570695787"
right.ImageColor3 = Color3.fromRGB(48, 48, 48)
right.ScaleType = "Slice"
right.SliceCenter = Rect.new(100,100,100,100)
right.SliceScale = 0.11

local xincrease = 334
local yincreast = 222
wait(1)
repeat wait(1/100)
	if xincrease < 510 then
		xincrease = xincrease + 2
	end
	if yincreast < 250 then
		yincreast = yincreast + 1
	end
	Background.Size = UDim2.new(0, xincrease, 0, yincreast)
until Background.Size == UDim2.new(0, 510, 0, 250)
local Frames = {}
function framemeupboi(instance, Place)
	local E = Instance.new("Frame", instance)
	E.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	E.BorderSizePixel = 0
	E.Size = UDim2.new(0, 463, 0, 185)
	E.Position = Place
	E.Visible = false
	table.insert(Frames, E)
	instance.MouseButton1Down:connect(function()
		for _,v in pairs(Frames) do
			v.Visible = false
		end
		E.Visible = true
	end)
	return E
end

local PARENT = Instance.new("Folder", Screen); PARENT.Name = "LocateStuff"

local Combat = Instance.new("TextButton", Background)
Combat.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Combat.BorderSizePixel = 0
Combat.Position = UDim2.new(0.035, 0, 0.068, 0)
Combat.Size = UDim2.new(0, 71, 0, 20)
Combat.TextColor3 = Color3.fromRGB(155, 155, 155)
Combat.Text = "Combat"
local CombatFrame = framemeupboi(Combat, UDim2.new(0, 0, 1.35, 0))

local Local = Instance.new("TextButton", Background)
Local.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Local.BorderSizePixel = 0
Local.Position = UDim2.new(0.19, 0, 0.068, 0)
Local.Size = UDim2.new(0, 71, 0, 20)
Local.TextColor3 = Color3.fromRGB(155, 155, 155)
Local.Text = "Local"
local LocalFrame = framemeupboi(Local, UDim2.new(-1.118, 0, 1.35, 0))

local Buys = Instance.new("TextButton", Background)
Buys.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Buys.BorderSizePixel = 0
Buys.Position = UDim2.new(0.655, 0, 0.068, 0)
Buys.Size = UDim2.new(0, 71, 0, 20)
Buys.TextColor3 = Color3.fromRGB(155, 155, 155)
Buys.Text = "Buys"
local BuysFrame = framemeupboi(Buys, UDim2.new(-4.457, 0, 1.35, 0))

local World = Instance.new("TextButton", Background)
World.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
World.BorderSizePixel = 0
World.Position = UDim2.new(0.345, 0, 0.068, 0)
World.Size = UDim2.new(0, 71, 0, 20)
World.TextColor3 = Color3.fromRGB(155, 155, 155)
World.Text = "World"
local WorldFrame = framemeupboi(World, UDim2.new(-2.23, 0, 1.35, 0))

local Teleports = Instance.new("TextButton", Background)
Teleports.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Teleports.BorderSizePixel = 0
Teleports.Position = UDim2.new(0.5, 0, 0.068, 0)
Teleports.Size = UDim2.new(0, 71, 0, 20)
Teleports.TextColor3 = Color3.fromRGB(155, 155, 155)
Teleports.Text = "Teleports"
local TPFrame = framemeupboi(Teleports, UDim2.new(-3.343, 0, 1.35, 0))

function UISetup(Frame, Location, Type, Text)
	local E = Instance.new(Type, Frame)
	E.Position = Location
	E.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
	E.BackgroundTransparency = 0.8
	E.BorderColor3 = Color3.fromRGB(0, 0, 0)
	E.Size = UDim2.new(0, 129, 0, 37)
	E.TextColor3 = Color3.fromRGB(155, 155, 155)
	E.Font = Enum.Font.GothamBold
	E.TextScaled = false
	E.TextSize = 22
	if Type == "TextBox" then
		E.Text = ""
		E.PlaceholderText = Text
	else
		E.Text = Text
	end
	return E
end

--[[
admin: CFrame.new(-729.9, -37.6, -885)
bank: CFrame.new(-485.7, 23.6, -285.2)
gunshop1: CFrame.new(-582, 7.1, -739)
gunshop2: CFrame.new(481.5, 48, -621.5)
police: CFrame.new(-266.45813, 21.7999573, -117.489723)
casino: CFrame.new(-865.784241, 21.75, -147.854492)
nuke base: CFrame.new(-113.660812, -58.7000618, 146.850311)
Park: CFrame.new(368.255981, 50.5612793, -402.824951)
playground: CFrame.new(-217.894958, 29.3668556, -742.85022)
tacoshop: CFrame.new(584.5401, 51.061409, -479.443848)
]]

local Name_Box = UISetup(CombatFrame, UDim2.new(0.358, 0,0.043, 0), "TextBox", "Username")
local Kill = UISetup(CombatFrame, UDim2.new(0.063, 0,0.324, 0), "TextButton", "Lock Hands")
local Locate = UISetup(CombatFrame, UDim2.new(0.356, 0,0.324, 0), "TextButton", "Locate")
local Grenade = UISetup(CombatFrame, UDim2.new(0.653, 0,0.319, 0), "TextButton", "Grenade")
local LoopTp = UISetup(CombatFrame, UDim2.new(0.063, 0,0.578, 0), "TextButton", "LoopTP")
local NUKE = UISetup(CombatFrame, UDim2.new(0.356, 0,0.578, 0), "TextButton", "N.U.K.E.")
local Range = UISetup(CombatFrame, UDim2.new(0.653, 0,0.578, 0), "TextButton", "Reach")
--0.254

local Admin = UISetup(TPFrame, UDim2.new(0.063, 0,0.063, 0), "TextButton", "Admin Base")
local Bank = UISetup(TPFrame, UDim2.new(0.356, 0,0.063, 0), "TextButton", "Bank")
local Shop1 = UISetup(TPFrame, UDim2.new(0.653, 0,0.063, 0), "TextButton", "Gun Shop")
local Shop2 = UISetup(TPFrame, UDim2.new(0.063, 0,0.317, 0), "TextButton", "Gun Shop 2")
local Police = UISetup(TPFrame, UDim2.new(0.356, 0,0.317, 0), "TextButton", "Police")
local Casino = UISetup(TPFrame, UDim2.new(0.653, 0,0.317, 0), "TextButton", "Casino")
local NukeBase = UISetup(TPFrame, UDim2.new(0.063, 0,0.571, 0), "TextButton", "Nuke Base")
local Park = UISetup(TPFrame, UDim2.new(0.356, 0,0.571, 0), "TextButton", "Park")
local PlayGround = UISetup(TPFrame, UDim2.new(0.653, 0,0.571, 0), "TextButton", "PlayGround")
local Taco = UISetup(TPFrame, UDim2.new(0.356, 0,0.825, 0), "TextButton", "Taco")
Taco.Size = UDim2.new(0, 129, 0, 28)
function TP(cframe)
    Plr.Character.HumanoidRootPart.CFrame = cframe
end

Admin.MouseButton1Click:connect(function()
    TP(CFrame.new(-729.9, -37.6, -885))
end)
Bank.MouseButton1Click:connect(function()
    TP(CFrame.new(-485.7, 23.6, -285.2))
end)
Shop1.MouseButton1Click:connect(function()
    TP(CFrame.new(-582, 7.1, -739))
end)
Shop2.MouseButton1Click:connect(function()
    TP(CFrame.new(481.5, 48, -621.5))
end)
Police.MouseButton1Click:connect(function()
    TP(CFrame.new(-266.45813, 21.7999573, -117.489723))
end)
Casino.MouseButton1Click:connect(function()
    TP(CFrame.new(-865.784241, 21.75, -147.854492))
end)
NukeBase.MouseButton1Click:connect(function()
    TP(CFrame.new(-113.660812, -58.7000618, 146.850311))
end)
Park.MouseButton1Click:connect(function()
    TP(CFrame.new(368.255981, 50.5612793, -402.824951))
end)
PlayGround.MouseButton1Click:connect(function()
    TP(CFrame.new(-217.894958, 29.3668556, -742.85022))
end)
Taco.MouseButton1Click:connect(function()
    TP(CFrame.new(584.5401, 51.061409, -479.443848))
end)

function Name()
    local TargetIns
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
    	if string.find(v.Name,Name_Box.Text) and not TargetIns then
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
	        if mov:IsA("BodyVelocity") then
    			mov:Destroy()
    		end
    	end
    else
	    moving = true
        local lastpos = Plr.Character.HumanoidRootPart.CFrame
        if Plr.Backpack:FindFirstChild("[Grenade]") == nil then
            repeat wait()
                TP(CFrame.new(103.859718, -29.6502476, -272.42981, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Grenade] - $700"].ClickDetector)
            until Plr.Backpack:FindFirstChild("[Grenade]") ~= nil
        end
        wait()
        Plr.Backpack["[Grenade]"].Handle.Mesh:Destroy()
        wait(0.1)
        Plr.Character.Humanoid:EquipTool(Plr.Backpack["[Grenade]"])
        Plr.Character["[Grenade]"]:Activate()
        wait(0.1)
        TP(lastpos)

        while moving do
            wait()
            for index, part in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
                if part:IsA("Part") and part.Name == "Handle" and not part:FindFirstChildOfClass("BodyPosition") then
                    part.CanCollide = false
                    local mover = Instance.new("BodyVelocity", part)
                    mover.Velocity = -(part.Position - TargetIns.Character.HumanoidRootPart.Position)
                    mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    mover.P = math.huge
                    pcall(function()
                        spawn(function()
                            while wait() do
                                if (part.Position - TargetIns.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                                    mover.Velocity = -((part.Position - TargetIns.Character.HumanoidRootPart.Position)*10)
                                elseif (part.Position - TargetIns.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                                    mover.Velocity = -((part.Position - TargetIns.Character.HumanoidRootPart.Position)*5)
                                else 
                                    mover.Velocity = -((part.Position - TargetIns.Character.HumanoidRootPart.Position)*1.5)
                                end
                            end
                        end)
                    end)
                end
            end
        end
    end
end)


Locate.MouseButton1Click:Connect(function()
    local TargetIns = Name()
    if locatetoggle then 
        print("unlocationg...")
        locatetoggle = false
        UnLocate()
    else
        print("locating...")
        locatetoggle = true
        Locate(TargetIns)
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
    Run = true

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

	TP(HRPPosition)

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
    	TP(TargetIns.Character.HumanoidRootPart.CFrame)

    end
end)

LoopTp.MouseButton1Click:Connect(function()
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
    					TP(Target1ns.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2))
					else looptpon = false end
    			else
    			    TP(Target1ns.Character.UpperTorso.CFrame * CFrame.new(0,2,0))
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

function Locate(plr)
	spawn(function()
		wait()
		print(plr)
		if plr.Character and plr.Name ~= Plr.Name and not PARENT:FindFirstChild(plr.Name..'_LC') then
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
						if plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChild('Humanoid') and Plr.Character and getRoot(Plr.Character) and Plr.Character:FindFirstChild('Humanoid') then
							local pos = math.floor((getRoot(Plr.Character).Position - getRoot(plr.Character).Position).magnitude)
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

NUKE.MouseButton1Click:Connect(function()
    if Nuke then Nuke = false return end
    local lastpos = Plr.Character.HumanoidRootPart.CFrame
    repeat wait()
        TP(game.Workspace.Ignored.Shop["[Grenade] - $700"].Head.CFrame)
        fireclickdetector(game.Workspace.Ignored.Shop["[Grenade] - $700"].ClickDetector)
    until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
    TP(lastpos)
    
    for i, v in pairs(Plr.Backpack:GetChildren()) do
        spawn(function()
            if v.Name == "[Grenade]" then
                v.Parent = Plr.Character; v:Activate(); wait(0.1); v:Deactivate(); wait(0.1); v:Activate()
            end
        end)
    end
    if not Name_Box.Text then return end
    local TargetIns = Name()
    if TargetIns == nil then return end
    Nuke = true
    while Nuke do
        wait()
        for index, part in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
            if part:IsA("Part") and part.Name == "Handle" and not part:FindFirstChildOfClass("BodyPosition") then
                XSpread = XSpread + 25
                if XSpread >= 75 then
                    XSpread = -75
                    ZSpread = ZSpread + 25
                    if ZSpread >= 75 then
                        ZSpread = -75
                    end
                end
                part.CanCollide = false
                local mover = Instance.new("BodyPosition", part)
                mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                local spread = Vector3.new(XSpread, 0, ZSpread)
                spawn(function()
                    while part do wait()
                        mover.Position = TargetIns.Character.HumanoidRootPart.Position+spread
                    end
                end)
            end
        end
    end
end)

Range.MouseButton1Click:connect(function()
    Reach()
end)

function buyhammer()
	if Plr.Character:FindFirstChild("[SledgeHammer]") and Plr:FindFirstChild("sledgehammerbought") then return end
        local sledgehammerbought = Instance.new("Folder", Plr.Character);sledgehammerbought.Name = "sledgehammerbought"
        local lastpos = Plr.Character.HumanoidRootPart.CFrame
        if not Plr.Backpack:FindFirstChild("[SledgeHammer]") then
        	repeat wait()
        		TP(game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].Head.CFrame)
        		wait(0.1)
        		fireclickdetector(game:GetService("Workspace").Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        	until Plr.Backpack:FindFirstChild("[SledgeHammer]")
		Plr.Character.Humanoid:EquipTool(Plr.Backpack["[SledgeHammer]"])
		TP(lastpos)
	end
end

function Reach()
    if Plr.Character:FindFirstChildOfClass("Tool") then
        local v =  Plr.Character:FindFirstChildOfClass("Tool")
        v.TextureId = 0
        if v.Name ~= "Combat" then
            pp = v.Handle
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
                    
            Plr.Character.RightHand.Size = Vector3.new(35, 35, 35)
            Plr.Character.RightHand.Transparency = 1
            game:GetService('RunService').Stepped:connect(function()
                if Plr.Character:FindFirstChild("Combat") and not Plr.Character.RightHand:FindFirstChild("ppsuc") then
                    local HandHitBox = Instance.new("SelectionBox",Plr.Character.RightHand)
                    HandHitBox.Adornee = Plr.Character.RightHand
                    HandHitBox.Name = "ppsuc"
                elseif not Plr.Character:FindFirstChild("Combat") and Plr.Character.RightHand:FindFirstChild("ppsuc") then
                    Plr.Character.RightHand.ppsuc:Destroy()
                end
            end)
        end
    else buyhammer() end
end