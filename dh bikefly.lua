local speed = 20
local old
local Plr = game.Players.LocalPlayer
local wheels = {}
local control = {q=false,e=false,w=false,a=false,s=false,d=false}
local Mouse = Plr:GetMouse()

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

while game.RunService.Stepped:wait() do
    local seat = (Plr.Character or Plr.CharacterAdded:wait()):WaitForChild("Humanoid").SeatPart
    if Plr.PlayerGui:FindFirstChild("MainScreenGui") and Plr.PlayerGui.MainScreenGui:FindFirstChild("Bar") and Plr.PlayerGui.MainScreenGui.Bar:FindFirstChild("Speed") then
        Plr.PlayerGui.MainScreenGui.Bar.Speed.bar.Size = UDim2.new(speed / 100 * 0.95, 0, 0.83, 0)
    else
        local c = Plr.PlayerGui.MainScreenGui.Bar.HP
        local g = c:Clone()
        g.Name = "Speed"
        g.Position = UDim2.new(0.5, 0, 1, -120)
        g.bar.BackgroundColor3 = Color3.fromRGB(255, 155, 0)
        g.Picture.Image.Image = "rbxassetid://181035717"
        g.TextLabel.Text = "Speed"
        g.Parent = c.Parent
    end
    if seat ~= nil and seat:IsDescendantOf(game.Workspace.Vehicles) then
        if seat ~= old then
            if old then
                old.Vel:Destroy()
                old.Gyro:Destroy()
            end
            old = seat
            for i = 1, 2 do
                if wheels[i] then
                    wheels[i][2].Parent = wheels[i][1]
                end
                local wheel = seat.Parent.Wheel
                wheels[i] = {seat.Parent, wheel}
                wheel:remove()
            end
            local gyro = Instance.new("BodyGyro", seat)
            gyro.Name = "Gyro"
            local pos = Instance.new("BodyVelocity", seat)
            pos.Name = "Vel"
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            pos.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        else 
            seat.Gyro.cframe = workspace.CurrentCamera.CoordinateFrame
            local vel = CFrame.new(0, 0, 0)
            if control.w then
                vel = vel * CFrame.new(0, 0, -speed)
            end
            if control.s then
                vel = vel * CFrame.new(0, 0, speed)
            end
            if control.a then
                vel = vel * CFrame.new(-speed, 0, 0)
            end
            if control.d then
                vel = vel * CFrame.new(speed, 0, 0)
            end
            seat.Vel.Velocity = (seat.CFrame*vel).p - seat.CFrame.p
        end
    end
    if control.e and speed<100 then
        speed = speed + 1
    end
    if control.q and speed > 0 then
        speed = speed - 1
    end
end