--by Ex
local ScreenGui = Instance.new("ScreenGui")
local Toolbar = Instance.new("Frame")
local AntiBag = Instance.new("Frame")
local Background = Instance.new("Frame")
local WayPointToolbar = Instance.new("Frame")
local WayPointBackground = Instance.new("Frame")
local BagBackground = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local BagName = Instance.new("TextLabel")
local WayPointName = Instance.new("TextLabel")
local AntiBag1 = Instance.new("TextButton")
local FreeCam = Instance.new("TextButton")
local Fly = Instance.new("TextButton")
local ClickTP = Instance.new("TextButton")
local NoClip = Instance.new("TextButton")
local HoodShark = Instance.new("TextButton")
local SuperSledge = Instance.new("TextButton")
local Mole = Instance.new("TextButton")
local SuperBag = Instance.new("TextButton")
local SuperKnife = Instance.new("TextButton")
local Evon = Instance.new("TextButton")
local GodBlock = Instance.new("TextButton")
local WayPoint = Instance.new("TextButton")
local PoliceStation = Instance.new("TextButton")
local GunShop1 = Instance.new("TextButton")
local GunShop2 = Instance.new("TextButton")
local Casino = Instance.new("TextButton")
local Bank = Instance.new("TextButton")
local NuclearBase = Instance.new("TextButton")
local Park = Instance.new("TextButton")
local PlayGround = Instance.new("TextButton")
local TacoShop = Instance.new("TextButton")
local AdminBase = Instance.new("TextButton")


--Properties:

ScreenGui.Parent = game.CoreGui

--swag antibag

local Plr = game.Players.LocalPlayer

game:GetService('RunService').Stepped:connect(function()
    if Plr.Character:FindFirstChild("Christmas_Sock") then
        Plr.Character["Christmas_Sock"]:Destroy()
    end
end)

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
Background.Size = UDim2.new(0, 268, 0, 440)

Name.Name = "Name"
Name.Parent = Toolbar
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00371747208, 0, 0, 0)
Name.Size = UDim2.new(0, 268, 0, 34)
Name.Font = Enum.Font.SourceSans
Name.Text = "peepee"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

FreeCam.Name = "freecam(c)"
FreeCam.Parent = Toolbar
FreeCam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FreeCam.BackgroundTransparency = 1.000
FreeCam.Position = UDim2.new(0, 0, 1, 0)
FreeCam.Size = UDim2.new(0, 268, 0, 36)
FreeCam.Font = Enum.Font.Gotham
FreeCam.Text = "FreeCam(c)"
FreeCam.TextColor3 = Color3.fromRGB(255, 255, 255)
FreeCam.TextSize = 20.000
FreeCam.MouseButton1Down:connect(function()
ToggleKey = Enum.KeyCode.C
SprintKey = Enum.KeyCode.Tab

localPlayer = game.Players.LocalPlayer

Camera = game.Workspace.CurrentCamera
Mouse = localPlayer:GetMouse()

UserInputService = game:GetService("UserInputService")


movePosition = Vector2.new(0,0)
moveDirection = Vector3.new(0,0,0)

targetMovePosition = movePosition

Y_Sensitivity = 300;
X_Sensitivity = 300;

lastRightButtonDown = Vector2.new(0,0)
rightMouseButtonDown = false

targetFOV = 70

sprinting = false;
sprintingSpeed = 3;

keysDown = {}

moveKeys = {
[Enum.KeyCode.D] = Vector3.new(1,0,0),
[Enum.KeyCode.A] = Vector3.new(-1,0,0),
[Enum.KeyCode.S] = Vector3.new(0,0,1),
[Enum.KeyCode.W] = Vector3.new(0,0,-1),
[Enum.KeyCode.E] = Vector3.new(0,1,0),
}

Tween = function(a,b,t)
if t == 1 then
return b
else 
if tonumber(a) then
    return a * (1-t) + (b*t)
else
return a:Lerp(b,t);
end
end
end

ClampVector3 = function(x,min,max)

return 
Vector3.new(
math.clamp(x.X,min.X,max.X),
math.clamp(x.Y,min.Y,max.Y),
math.clamp(x.Z,min.Z,max.Z)
)

end


UserInputService.InputChanged:connect(function(inputObject)
if inputObject.UserInputType == Enum.UserInputType.MouseMovement then
movePosition = movePosition + Vector2.new(inputObject.Delta.x,inputObject.Delta.y)
end
end)

CalculateMovement = function()
local newMovement = Vector3.new(0,0,0)
for i,v in pairs(keysDown) do
newMovement = newMovement + (moveKeys[i] or Vector3.new(0,0,0))
end
return newMovement
end

Round = function(num, numDecimalPlaces)
  return math.floor((num/numDecimalPlaces) + .5)*numDecimalPlaces
end

Input = function(input,gameProcessed)
if moveKeys[input.KeyCode] then
if input.UserInputState == Enum.UserInputState.Begin then
keysDown[input.KeyCode] = true
elseif input.UserInputState == Enum.UserInputState.End then
keysDown[input.KeyCode] = nil
end
else
if input.UserInputState == Enum.UserInputState.Begin then
print(input.KeyCode)
if input.UserInputType == Enum.UserInputType.MouseButton2 then
rightMouseButtonDown = true
lastRightButtonDown = Vector2.new(Mouse.X,Mouse.Y)
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
elseif input.KeyCode == Enum.KeyCode.Z then
targetFOV = 20
elseif input.KeyCode == SprintKey then
sprinting = true
end
else
if input.UserInputType == Enum.UserInputType.MouseButton2 then
rightMouseButtonDown = false
UserInputService.MouseBehavior = Enum.MouseBehavior.Default
elseif input.KeyCode == Enum.KeyCode.Z then
targetFOV = 70
elseif input.KeyCode == SprintKey then
sprinting = false
end
end
end
end
 
Mouse.WheelForward:connect(function()
   Camera.CoordinateFrame = Camera.CoordinateFrame * CFrame.new(0,0,-5)
end)

Mouse.WheelBackward:connect(function()
   Camera.CoordinateFrame = Camera.CoordinateFrame * CFrame.new(-0,0,5)
end)

UserInputService.InputBegan:connect(Input)
UserInputService.InputEnded:connect(Input)

local Toggled = false
game:GetService("UserInputService").InputBegan:connect(function(inputObject)
if inputObject.KeyCode == ToggleKey then
Toggled = not Toggled
if Toggled then
Camera.CameraType = Enum.CameraType.Scriptable
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true 
else
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
game.Workspace.CurrentCamera.CameraType = "Custom"
end
end
end)
game:GetService("RunService").RenderStepped:Connect(function()
if Toggled then
local mouseTarget = Mouse.Hit

targetMovePosition = movePosition
Camera.CoordinateFrame = CFrame.new(Camera.CoordinateFrame.p) * CFrame.fromEulerAnglesYXZ(-targetMovePosition.Y/Y_Sensitivity ,-targetMovePosition.X/X_Sensitivity, 0) * CFrame.new(CalculateMovement() * ((({[true]=sprintingSpeed})[sprinting]) or .5) )
Camera.FieldOfView = Tween(Camera.FieldOfView,targetFOV,.5)
if rightMouseButtonDown then
UserInputService.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
movePosition = movePosition - (lastRightButtonDown - Vector2.new(Mouse.X,Mouse.Y))
lastRightButtonDown = Vector2.new(Mouse.X,Mouse.Y)
end
end
end)
end)
Fly.Name = "Fly"
Fly.Parent = Toolbar
Fly.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fly.BackgroundTransparency = 1.000
Fly.Position = UDim2.new(0, 0, 2.05882359, 0)
Fly.Size = UDim2.new(0, 268, 0, 36)
Fly.Font = Enum.Font.Gotham
Fly.Text = "Fly(x)"
Fly.TextColor3 = Color3.fromRGB(255, 255, 255)
Fly.TextSize = 20.000
Fly.MouseButton1Down:connect(function()

	local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

		localplayer = plr
		
		if workspace:FindFirstChild("Core") then
			workspace.Core:Destroy()
		end
		
		local Core = Instance.new("Part")
		Core.Name = "Core"
		Core.Size = Vector3.new(0.05, 0.05, 0.05)

		spawn(function()
			Core.Parent = workspace
			local Weld = Instance.new("Weld", Core)
			Weld.Part0 = Core
			Weld.Part1 = localplayer.Character.LowerTorso
			Weld.C0 = CFrame.new(0, 0, 0)
		end)
		
		workspace:WaitForChild("Core")
		
		local torso = workspace.Core
		flying = true
		local speed=10
		local keys={a=false,d=false,w=false,s=false,t=false,y=false} 
		local e1
		local e2
		local function start()
			local pos = Instance.new("BodyPosition",torso)
			local gyro = Instance.new("BodyGyro",torso)
			pos.Name="EPIXPOS"
			pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
			pos.position = torso.Position
			gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
			gyro.cframe = torso.CFrame
			repeat
				wait()
				localplayer.Character.Humanoid.PlatformStand=true
				local new=gyro.cframe - gyro.cframe.p + pos.position
                                if keys.w then 
					new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+0
				end
				if keys.s then 
					new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+0
				end
				if keys.d then 
					new = new * CFrame.new(speed,0,0)
					speed=speed+0
				end
				if keys.a then 
					new = new * CFrame.new(-speed,0,0)
					speed=speed+0
				end
				pos.position=new.p
				if keys.w then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
				elseif keys.s then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
				else
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				end
			until flying == false
			if gyro then gyro:Destroy() end
			if pos then pos:Destroy() end
			flying=false
			localplayer.Character.Humanoid.PlatformStand=false
			speed=10
		end
		e1=mouse.KeyDown:connect(function(key)
			if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
			if key=="w" then
				keys.w=true
			elseif key=="s" then
				keys.s=true
			elseif key=="a" then
				keys.a=true
			elseif key=="d" then
				keys.d=true
			elseif key=="x" then
				if flying==true then
					flying=false
				else
					flying=true
					start()
				end
			end
		end)
		e2=mouse.KeyUp:connect(function(key)
			if key=="w" then
				keys.w=false
			elseif key=="s" then
				keys.s=false
			elseif key=="a" then
				keys.a=false
			elseif key=="d" then
				keys.d=false
			end
		end)
		start()
end)

ClickTP.Name = "ClickTP"
ClickTP.Parent = Toolbar
ClickTP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickTP.BackgroundTransparency = 1.000
ClickTP.Position = UDim2.new(0, 0, 3.11764717, 0)
ClickTP.Size = UDim2.new(0, 268, 0, 36)
ClickTP.Font = Enum.Font.Gotham
ClickTP.Text = "Click TP (q)"
ClickTP.TextColor3 = Color3.fromRGB(255, 255, 255)
ClickTP.TextSize = 20.000
ClickTP.MouseButton1Down:connect(function()
				plr = game.Players.LocalPlayer

hum = plr.Character.HumanoidRootPart

mouse = plr:GetMouse()



mouse.KeyDown:connect(function(key)

if key == "q" then

if mouse.Target then

hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)

end

end
end)
end)

NoClip.Name = "NoClip(E)"
NoClip.Parent = Toolbar
NoClip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NoClip.BackgroundTransparency = 1.000
NoClip.Position = UDim2.new(0, 0, 4.17647076, 0)
NoClip.Size = UDim2.new(0, 268, 0, 36)
NoClip.Font = Enum.Font.Gotham
NoClip.Text = "NoClip(e)"
NoClip.TextColor3 = Color3.fromRGB(255, 255, 255)
NoClip.TextSize = 20.000
--[[ Press "E" to toggle noclip]]
noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)

if key == "e" then
noclip = not noclip
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
end
end)
print('Loaded')
print('Press "E" to noclip')
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
k = k:lower()
if k == "f" then
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
end)

HoodShark.Name = "HoodShark"
HoodShark.Parent = Toolbar
HoodShark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HoodShark.BackgroundTransparency = 1.000
HoodShark.Position = UDim2.new(2.56113708e-09, 0, 10.5294123, 0)
HoodShark.Size = UDim2.new(0, 268, 0, 36)
HoodShark.Font = Enum.Font.Gotham
HoodShark.Text = "HoodShrek"
HoodShark.TextColor3 = Color3.fromRGB(255, 255, 255)
HoodShark.TextSize = 20.000
HoodShark.MouseButton1Down:connect(function()

loadstring(game:HttpGet("https://pastebin.com/raw/nh1fsqbh"))(true);
end)

SuperSledge.Name = "SuperSledge"
SuperSledge.Parent = Toolbar
SuperSledge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SuperSledge.BackgroundTransparency = 1.000
SuperSledge.Position = UDim2.new(0, 0, 6.29411793, 0)
SuperSledge.Size = UDim2.new(0, 268, 0, 36)
SuperSledge.Font = Enum.Font.Gotham
SuperSledge.Text = "Super Sledge"
SuperSledge.TextColor3 = Color3.fromRGB(255, 255, 255)
SuperSledge.TextSize = 20.000
SuperSledge.MouseButton1Down:connect(function()
						game.Players.LocalPlayer.Backpack["[SledgeHammer]"].Handle.Size = Vector3.new(50, 50, 50)
end)

Mole.Name = "Mole"
Mole.Parent = Toolbar
Mole.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mole.BackgroundTransparency = 1.000
Mole.Position = UDim2.new(0, 0, 5.23529434, 0)
Mole.Size = UDim2.new(0, 268, 0, 36)
Mole.Font = Enum.Font.Gotham
Mole.Text = "Mole(M)"
Mole.TextColor3 = Color3.fromRGB(255, 255, 255)
Mole.TextSize = 20.000
--epic molescript
mole = "up"
										plr = game.Players.LocalPlayer

hum = plr.Character.HumanoidRootPart




mouse.KeyDown:connect(function(key)

if key == "m" then
if status then
mole = "up"
else
mole = "down"
end
elseif key == "n" then
if probestatus then
mole = "probeup"
else
mole = "probedown"
end
end
if mole == "down" then
noclip = true
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y - 5.42, hum.CFrame.z)
mole = "off"
status = true

elseif mole == "up" then
noclip = false
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y + 5.42, hum.CFrame.z)
mole = "off"
status = false

elseif mole == "probeup" then
noclip = false
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y + 35, hum.CFrame.z)
mole = "off"
probestatus = false

elseif mole == "probedown" then
noclip = true
wait()
hum.CFrame = CFrame.new(hum.CFrame.x, hum.CFrame.y - 35, hum.CFrame.z)
mole = "off"
probestatus = true
end
end)

SuperBag.Name = "SuperBag"
SuperBag.Parent = Toolbar
SuperBag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SuperBag.BackgroundTransparency = 1.000
SuperBag.Position = UDim2.new(0, 0, 7.35294151, 0)
SuperBag.Size = UDim2.new(0, 268, 0, 36)
SuperBag.Font = Enum.Font.Gotham
SuperBag.Text = "Super Bag"
SuperBag.TextColor3 = Color3.fromRGB(255, 255, 255)
SuperBag.TextSize = 20.000
SuperBag.MouseButton1Down:connect(function()
						game.Players.LocalPlayer.Backpack["[BrownBag]"].Handle.Size = Vector3.new(50, 50, 50)
end)

SuperKnife.Name = "SuperKnife"
SuperKnife.Parent = Toolbar
SuperKnife.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SuperKnife.BackgroundTransparency = 1.000
SuperKnife.Position = UDim2.new(0, 0, 8.4117651, 0)
SuperKnife.Size = UDim2.new(0, 268, 0, 36)
SuperKnife.Font = Enum.Font.Gotham
SuperKnife.Text = "Super Knife"
SuperKnife.TextColor3 = Color3.fromRGB(255, 255, 255)
SuperKnife.TextSize = 20.000
SuperKnife.MouseButton1Down:connect(function()
						game.Players.LocalPlayer.Backpack["[Knife]"].Handle.Size = Vector3.new(50, 50, 50)
end)

Evon.Name = "Evon's Gui"
Evon.Parent = Toolbar
Evon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Evon.BackgroundTransparency = 1.000
Evon.Position = UDim2.new(0, 0, 9.47058868, 0)
Evon.Size = UDim2.new(0, 268, 0, 36)
Evon.Font = Enum.Font.Gotham
Evon.Text = "Evon's Gui"
Evon.TextColor3 = Color3.fromRGB(255, 255, 255)
Evon.TextSize = 20.000
Evon.MouseButton1Down:connect(function()

loadstring(game:HttpGet("https://pastebin.com/raw/ahsgPaUG"))(true);
end)

WayPoint.Name = "Waypoints"
WayPoint.Parent = Toolbar
WayPoint.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WayPoint.BackgroundTransparency = 1.000
WayPoint.Position = UDim2.new(0, 0, 11.58823588, 0)
WayPoint.Size = UDim2.new(0, 268, 0, 36)
WayPoint.Font = Enum.Font.Gotham
WayPoint.Text = "WayPoints"
WayPoint.TextColor3 = Color3.fromRGB(255, 255, 255)
WayPoint.TextSize = 20.000
WayPoint.MouseButton1Down:connect(function()

WayPointToolbar.Name = "WayPoints"
WayPointToolbar.Parent = Toolbar
WayPointToolbar.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
WayPointToolbar.Position = UDim2.new(1, 0, 0.163390666, 0)
WayPointToolbar.Size = UDim2.new(0, 538, 0, 34)
WayPointToolbar.Active = true
WayPointToolbar.Draggable = true

WayPointBackground.Name = "Background"
WayPointBackground.Parent = WayPointToolbar
WayPointBackground.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
WayPointBackground.BackgroundTransparency = 0.500
WayPointBackground.Position = UDim2.new(0, 0, 0.986920536, 0)
WayPointBackground.Size = UDim2.new(0, 536, 0, 202)

WayPointName.Name = "Name"
WayPointName.Parent = WayPointToolbar
WayPointName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WayPointName.BackgroundTransparency = 1.000
WayPointName.Position = UDim2.new(0.00371747208, 0, 0, 0)
WayPointName.Size = UDim2.new(0, 536, 0, 34)
WayPointName.Font = Enum.Font.SourceSans
WayPointName.Text = "WayPoints"
WayPointName.TextColor3 = Color3.fromRGB(255, 255, 255)
WayPointName.TextScaled = true
WayPointName.TextSize = 14.000
WayPointName.TextWrapped = true

AdminBase.Name = "AdminBase"
AdminBase.Parent = WayPointToolbar
AdminBase.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AdminBase.BackgroundTransparency = 1.000
AdminBase.Position = UDim2.new(0, 0, 1, 0)
AdminBase.Size = UDim2.new(0, 268, 0, 36)
AdminBase.Font = Enum.Font.Gotham
AdminBase.Text = "AdminBase"
AdminBase.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminBase.TextSize = 20.000
AdminBase.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(-729.9, -37.6, -885)
end)

Bank.Name = "Bank"
Bank.Parent = WayPointToolbar
Bank.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bank.BackgroundTransparency = 1.000
Bank.Position = UDim2.new(0, 0, 2.05882359, 0)
Bank.Size = UDim2.new(0, 268, 0, 36)
Bank.Font = Enum.Font.Gotham
Bank.Text = "Bank"
Bank.TextColor3 = Color3.fromRGB(255, 255, 255)
Bank.TextSize = 20.000
Bank.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(-485.7, 23.6, -285.2)
end)

GunShop1.Name = "GunShop1"
GunShop1.Parent = WayPointToolbar
GunShop1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GunShop1.BackgroundTransparency = 1.000
GunShop1.Position = UDim2.new(0, 0, 3.11764717, 0)
GunShop1.Size = UDim2.new(0, 268, 0, 36)
GunShop1.Font = Enum.Font.Gotham
GunShop1.Text = "GunShop1"
GunShop1.TextColor3 = Color3.fromRGB(255, 255, 255)
GunShop1.TextSize = 20.000
GunShop1.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(-582, 7.1, -739)
end)

GunShop2.Name = "GunShop2"
GunShop2.Parent = WayPointToolbar
GunShop2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GunShop2.BackgroundTransparency = 1.000
GunShop2.Position = UDim2.new(0, 0, 4.17647076, 0)
GunShop2.Size = UDim2.new(0, 268, 0, 36)
GunShop2.Font = Enum.Font.Gotham
GunShop2.Text = "GunShop2"
GunShop2.TextColor3 = Color3.fromRGB(255, 255, 255)
GunShop2.TextSize = 20.000
GunShop2.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(481.5, 48, -621.5)
end)

PoliceStation.Name = "PoliceStation"
PoliceStation.Parent = WayPointToolbar
PoliceStation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PoliceStation.BackgroundTransparency = 1.000
PoliceStation.Position = UDim2.new(0, 0, 5.23529434, 0)
PoliceStation.Size = UDim2.new(0, 268, 0, 36)
PoliceStation.Font = Enum.Font.Gotham
PoliceStation.Text = "PoliceStation"
PoliceStation.TextColor3 = Color3.fromRGB(255, 255, 255)
PoliceStation.TextSize = 20.000
PoliceStation.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(-266.45813, 21.7999573, -117.489723)
end)

Casino.Name = "Casino"
Casino.Parent = WayPointToolbar
Casino.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Casino.BackgroundTransparency = 1.000
Casino.Position = UDim2.new(0.4, 0, 1, 0)
Casino.Size = UDim2.new(0, 268, 0, 36)
Casino.Font = Enum.Font.Gotham
Casino.Text = "Casino"
Casino.TextColor3 = Color3.fromRGB(255, 255, 255)
Casino.TextSize = 20.000
Casino.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(-865.784241, 21.75, -147.854492)
end)

NuclearBase.Name = "NuclearBase"
NuclearBase.Parent = WayPointToolbar
NuclearBase.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NuclearBase.BackgroundTransparency = 1.000
NuclearBase.Position = UDim2.new(0.4, 0, 2.05882359, 0)
NuclearBase.Size = UDim2.new(0, 268, 0, 36)
NuclearBase.Font = Enum.Font.Gotham
NuclearBase.Text = "NuclearBase"
NuclearBase.TextColor3 = Color3.fromRGB(255, 255, 255)
NuclearBase.TextSize = 20.000
NuclearBase.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(-113.660812, -58.7000618, 146.850311)
end)

Park.Name = "Park"
Park.Parent = WayPointToolbar
Park.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Park.BackgroundTransparency = 1.000
Park.Position = UDim2.new(0.4, 0, 3.11764717, 0)
Park.Size = UDim2.new(0, 268, 0, 36)
Park.Font = Enum.Font.Gotham
Park.Text = "Park"
Park.TextColor3 = Color3.fromRGB(255, 255, 255)
Park.TextSize = 20.000
Park.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(368.255981, 50.5612793, -402.824951)
end)

PlayGround.Name = "PlayGround"
PlayGround.Parent = WayPointToolbar
PlayGround.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayGround.BackgroundTransparency = 1.000
PlayGround.Position = UDim2.new(0.4, 0, 4.17647076, 0)
PlayGround.Size = UDim2.new(0, 268, 0, 36)
PlayGround.Font = Enum.Font.Gotham
PlayGround.Text = "PlayGround"
PlayGround.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayGround.TextSize = 20.000
PlayGround.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(-217.894958, 29.3668556, -742.85022)
end)

TacoShop.Name = "TacoShop"
TacoShop.Parent = WayPointToolbar
TacoShop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TacoShop.BackgroundTransparency = 1.000
TacoShop.Position = UDim2.new(0.4, 0, 5.23529434, 0)
TacoShop.Size = UDim2.new(0, 268, 0, 36)
TacoShop.Font = Enum.Font.Gotham
TacoShop.Text = "TacoShop"
TacoShop.TextColor3 = Color3.fromRGB(255, 255, 255)
TacoShop.TextSize = 20.000
TacoShop.MouseButton1Down:connect(function()
plr = game.Players.LocalPlayer
hum = plr.Character.HumanoidRootPart
hum.CFrame = CFrame.new(584.5401, 51.061409, -479.443848)
end)

--GunShop2: 481.71875, 48.0705032, -621.564209
--PoliceStation: -266.45813, 21.7999573, -117.489723
--Casino:-865.784241, 21.75, -147.854492
--NuclearBase: -113.660812, -58.7000618, 146.850311
--Park: 368.255981, 50.5612793, -402.824951
--PlayGround: -217.894958, 29.3668556, -742.85022
--TacoShop: 584.5401, 51.061409, -479.443848

end)

GodBlock.Name = "GodBlock"
GodBlock.Parent = Toolbar
GodBlock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GodBlock.BackgroundTransparency = 1.000
GodBlock.Position = UDim2.new(0, 0, 12.64705946, 0)
GodBlock.Size = UDim2.new(0, 268, 0, 36)
GodBlock.Font = Enum.Font.Gotham
GodBlock.Text = "GodBlock(f)"
GodBlock.TextColor3 = Color3.fromRGB(255, 255, 255)
GodBlock.TextSize = 20.000
GodBlock.MouseButton1Down:connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/878gD6XV"))(true);
end)