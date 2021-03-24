-- SETTINGS --
local speed = 20
--------------

local plr = game.Players.LocalPlayer
local Mouse = plr:GetMouse()

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
            local pos = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
   return closestPlayer.Character.PrimaryPart
end

game.Workspace.Ignored.ChildAdded:connect(function(child)
    wait()
    if child.Name == "Launcher" and math.abs((child.Position-plr.Character.HumanoidRootPart.Position).Magnitude)<30 then
        child:WaitForChild("BodyVelocity"):Destroy()
        local target = getClosestPlayerToCursor()
        local e = Instance.new("BodyVelocity", child)
        wait()
        e.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        while child and child.Parent ~= nil do
            child.CFrame = CFrame.lookAt(child.CFrame.p, target.CFrame.p)*CFrame.Angles(math.rad(90), 0, 0)
            e.Velocity = ((child.CFrame * CFrame.new(0, -speed, 0)).p - child.CFrame.p)
            game.RunService.Stepped:wait()
            setsimulationradius(math.huge^math.huge, math.huge)
        end
    end
end)
