local ScreenGui = Instance.new("ScreenGui")
local Toolbar = Instance.new("Frame")
local Background = Instance.new("Frame")
local Name = Instance.new("TextLabel")
local Mole = Instance.new("TextButton")
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
Background.Size = UDim2.new(0, 268, 0, 36)

Name.Name = "Name"
Name.Parent = Toolbar
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00371747208, 0, 0, 0)
Name.Size = UDim2.new(0, 268, 0, 34)
Name.Font = Enum.Font.SourceSans
Name.Text = "Mole"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

Mole.Name = "Mole"
Mole.Parent = Toolbar
Mole.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mole.BackgroundTransparency = 1.000
Mole.Position = UDim2.new(0, 0, 1, 0)
Mole.Size = UDim2.new(0, 268, 0, 36)
Mole.Font = Enum.Font.Gotham
Mole.Text = "Mole(m)"
Mole.TextColor3 = Color3.fromRGB(255, 255, 255)
Mole.TextSize = 20.000
Mole.MouseButton1Down:connect(function()
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
end)
