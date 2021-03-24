-- SETTINGS --
local speed = 200 -- noob
--------------

local plr = game.Players.LocalPlayer

game.Workspace.Ignored.ChildAdded:connect(function(child)
    wait()
    if child.Name == "Launcher" and math.abs((child.Position-plr.Character.HumanoidRootPart.Position).Magnitude)<30 then
        child:WaitForChild("BodyVelocity"):Destroy()
        Instance.new("BodyVelocity", child).Velocity = (child.CFrame * CFrame.new(0, -speed, 0)).p - child.CFrame.p
        while child and child.Parent ~= nil do
            game.RunService.Stepped:wait()
            setsimulationradius(math.huge^math.huge, math.huge)
        end
    end
end)
