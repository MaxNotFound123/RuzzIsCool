function TAZE(TARGET)
    local Plr = game.Players.LocalPlayer
    local a = {}
    repeat
        Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Taser] - $1000"].Head.CFrame
        wait(0.5)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Taser] - $1000"].ClickDetector)
        for i, v in pairs(Plr.Backpack:GetChildren()) do
            if v.Name == "[Taser]" then
                table.insert(a, v)
                v.Parent = Plr.Character
            end
        end
    until #a >= 12
    local moooovr = Instance.new("BodyPosition", Plr.Character.LowerTorso)
    local gyro = Instance.new("BodyGyro", Plr.Character.LowerTorso)
    gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    moooovr.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    moooovr.P = 1e5
    moooovr.Position = (TARGET.Character.UpperTorso.CFrame*CFrame.new(0, -3, -2)).p
    gyro.cframe = TARGET.Character.UpperTorso.CFrame
    local enabled = true
    wait(1)
    for i, v in next, a do
        v.GripPos = Vector3.new(2*math.cos(math.rad(i*30)), 0, 2*math.sin(math.rad(i*30)))
        v.Handle.ChildAdded:connect(function(c)
            if not enabled then return end
            local moov = Instance.new("BodyPosition", c)
            moov.P = 1e5
            moov.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            while c.Parent ~= nil do
                moov.Position = TARGET.Character.Head.CFrame.p
                game.RunService.Stepped:wait()
                setsimulationradius(math.huge^math.huge, math.huge)
            end
            moov:Destroy()
            v:Deactivate()
        end)
        v:Activate()
    end
    pcall(function()
        repeat wait() 
            moooovr.Position = (TARGET.Character.UpperTorso.CFrame*CFrame.new(0, 0, 2)).p
            gyro.cframe = TARGET.Character.UpperTorso.CFrame
        until game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.V)
    end)
    gyro:Destroy()
    moooovr:Destroy()
    enabled = false
end

local Screen = Instance.new("ScreenGui", game.CoreGui)
local main = Instance.new("Frame", Screen)
main.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
main.Size = UDim2.new(0, 141, 0, 32)
main.Position = UDim2.new(0.43, 0, 0.438, 0)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)
local box = Instance.new("TextBox", main)
box.Text = ''
box.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
box.BorderSizePixel = 0
box.Size = UDim2.new(0, 102, 0, 14)
box.Position = UDim2.new(0.135, 0, 0.281, 0)
box.PlaceholderText = "Username"
local scroll = Instance.new("ScrollingFrame", box)
scroll.BorderSizePixel = 0
scroll.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
scroll.Size = UDim2.new(1, 0, 0, 90)
scroll.Position = UDim2.new(0, 0, 1, 0)
scroll.Visible = false

local players = game:GetService("Players")
box.Focused:Connect(function()
	scroll.Visible = true
	local text = box.Text
	local sorted = {}
	spawn(function()
		while scroll.Visible do wait()
			if text ~= box.Text then
				for i, v in next, scroll:GetChildren() do
					v:Destroy()
				end
				text = box.Text
				sorted = {}
				local enabled
				repeat
					local current = #sorted + 1
					enabled = false
					local best = math.huge
					for i, v in next, players:GetPlayers() do
						if string.find(v.Name:lower(), text:lower()) then
							local c, h = string.find(v.Name:lower(), text:lower())
							local m = #v.Name -(h-c)						
							if m<=best and not table.find(sorted, v) then
								enabled = true
								best = m
								sorted[current] = v
							end
						end
					end
				until not enabled
				for ii, vv in next, sorted do
					local b = Instance.new("TextButton", scroll)
					b.BackgroundTransparency = 1
					b.Text = vv.Name
					b.Size = UDim2.new(0.8, 0, 0, 20)
					b.Position = UDim2.new(0.1, 0, 0, (20*ii)-15)
					b.MouseButton1Click:connect(function()
						print("GHGHGHGHGHG", vv)
						sorted[1] = vv
					end)
				end
			end
		end
	end)
	box.FocusLost:wait()
	wait()
	scroll.Visible = false
	if sorted[1] then
	    TAZE(sorted[1])
	end
end)