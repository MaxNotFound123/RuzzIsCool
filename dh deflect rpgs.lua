game:GetService("RunService").Stepped:connect(function()
    setsimulationradius(9e9,9e9)
    for _, child in next, game.Workspace.Ignored:GetChildren() do
        if child.Name == "Launcher" and 10>(child.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude then
            child.Name = "reflected"
            local bv = child:FindFirstChild("BodyVelocity")
            local oldveloc = bv.Velocity
            local oldp  = bv.P
            bv:Destroy()
            local e = Instance.new("BodyVelocity", child)
            e.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            e.P = oldp
            e.Velocity = -oldveloc
        end
    end
end)