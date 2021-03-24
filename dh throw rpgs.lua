-- SETTINGS --
local speed = 20
--------------

local plr = game.Players.LocalPlayer
local Mouse = plr:GetMouse()

game.Workspace.Ignored.ChildAdded:connect(function(child)
    wait()
    if child.Name == "Launcher" and math.abs((child.Position-plr.Character.HumanoidRootPart.Position).Magnitude)<30 then
        child:WaitForChild("BodyVelocity"):Destroy()
        local tool = Instance.new("Tool")
        local handle = Instance.new("Part", tool)
        handle.Name = "Handle"
        handle.Transparency = 1
        for i=1,2 do wait()
            plr.Character.Humanoid:EquipTool(tool)
        end
        local m = Instance.new("BodyPosition")
        m.Position = handle.Position
        m.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        m.P = 1e5
        m.Parent = child
        spawn(function()
            while m and m.Parent ~= nil do wait()
                child.CFrame = handle.CFrame*CFrame.new(0, 0, -2)*CFrame.Angles(math.rad(90), 0, 0)
                m.Position = (handle.CFrame*CFrame.new(0, 0, -2)).p
            end
        end)
        tool.Activated:wait()
        local target = Mouse.Target
        tool:Destroy()
        m:Destroy()
        local e = Instance.new("BodyVelocity", child)
        wait()
        e.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        print(target)
        while child and child.Parent ~= nil do
            child.CFrame = CFrame.lookAt(child.CFrame.p, target.CFrame.p)*CFrame.Angles(math.rad(90), 0, 0)
            e.Velocity = ((child.CFrame * CFrame.new(0, -speed, 0)).p - child.CFrame.p)
            game.RunService.Stepped:wait()
            setsimulationradius(math.huge^math.huge, math.huge)
        end
    end
end)
