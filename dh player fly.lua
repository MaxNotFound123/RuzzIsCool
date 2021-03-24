-- SETTINGS --
local speed = 20
local turnSpeed = 3
--------------

local plr = game.Players.LocalPlayer
local Mouse = plr:GetMouse()
local peniscock
local movers
local control = {q=false,e=false,w=false,a=false,s=false,d=false}

game:GetService("RunService").Stepped:connect(function()
    if plr.PlayerGui:FindFirstChild("MainScreenGui") and plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
        plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
    else
        local c = plr.PlayerGui.MainScreenGui.Bar.HP
        local g = c:Clone()
        g.Name = "Speed"
        g.Position = UDim2.new(0.5, 0, 1, -120)
        g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
        g.Picture.Image.Image = "rbxassetid://181035717"
        g.TextLabel.Text = "Speed"
        g.Parent = c.Parent
    end
    if peniscock and peniscock.Parent ~= nil then
        setsimulationradius(math.huge^math.huge, math.huge)
        if plr.Character.Humanoid.Sit ~= true then
            peniscock = nil
        end
        peniscock.BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
        local vel = CFrame.new(0, 0, 0)
        if control.w then
            vel = vel * CFrame.new(0, 0, -speed)
        end
        if control.s then
            vel = vel * CFrame.new(0, 0, speed)
        end
        if control.a then
            vel = vel * CFrame.new(-speed,0, 0)
        end
        if control.d then
            vel = vel * CFrame.new(speed, 0, 0)
        end
        peniscock.BodyVelocity.Velocity = ((peniscock.CFrame * vel).p - peniscock.CFrame.p)
    else
        setsimulationradius(0, 0)
    end
    if control.q and speed > 0 then
        speed = speed - 1
    end
    if control.e and speed < 100 then
        speed = speed + 1
    end
end)

Mouse.KeyDown:connect(function(KEY)
    local key = KEY:lower()
    if control[key] ~= nil then
        control[key]=true
    end
end)

Mouse.KeyUp:connect(function(KEY)
    local key = KEY:lower()
    if control[key] ~= nil then
        control[key]=false
    end
end)

local screen = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame" , screen)
frame.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
frame.Size = UDim2.new(0, 141, 0, 32)
frame.Position = UDim2.new(0.143, 0, 0.438, 0)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
local button = Instance.new("TextButton", frame)
button.Text = "HOE"
button.Size = UDim2.new(0, 102, 0, 14)
button.Position = UDim2.new(0.135, 0, 0.281, 0)
button.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
button.BorderSizePixel = 0
local scroll = Instance.new("ScrollingFrame", button)
scroll.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
scroll.BorderSizePixel = 0
scroll.Position = UDim2.new(0, 0, 1, 0)
scroll.Size = UDim2.new(1, 0, 0, 90)
scroll.Visible = false

button.MouseButton1Click:Connect(function()
	if scroll.Visible then scroll.Visible = false return end
	scroll.Visible = true
	for ii, vv in next, game.Players:GetPlayers() do
	    scroll.CanvasSize = UDim2.new(0, 0, 0, (20*ii)-15)
		local b = Instance.new("TextButton", scroll)
		b.BackgroundTransparency = 0.7
		b.BorderSizePixel = 0
		b.Text = vv.Name
		b.Size = UDim2.new(0.8, 0, 0, 18)
		b.Position = UDim2.new(0.1, 0, 0, (20*ii)-15)
		local candoshit = false
		b.MouseButton1Click:connect(function()
            if not candoshit then return end
                local Char = vv.Character
                local child = Char:WaitForChild("Head")
                plr.Character:WaitForChild("Humanoid").Sit = true
                game.Workspace.CurrentCamera.CameraSubject = child
                peniscock = child
                local m = {Instance.new("BodyVelocity", child), Instance.new("BodyGyro", child)}
                m[1].MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                m[1].P = 1e5
                m[2].MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                while Char.BodyEffects["K.O"].Value and peniscock == child do
                    game.RunService.Stepped:wait()
                end
                wait(0.5)
                peniscock = nil
                game.Workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
                plr.Character.Humanoid.Sit = false
                m[1]:Destroy()
                m[2]:Destroy()
		end)
		spawn(function()
		    button.MouseButton1Click:wait()
		    b:Destroy()
		end)
        spawn(function()
            while b do wait()
                if (vv.Character or vv.CharacterAdded:wait()):WaitForChild("BodyEffects"):WaitForChild("K.O").Value then
                    candoshit = true
                    b.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                else
                    candoshit = false
                    b.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                end
            end
        end)
	end
end)

