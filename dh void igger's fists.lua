for i, v in next, game.Players:GetPlayers() do
    if v.Character and v.Character:FindFirstChild("RightHand") and not v.Character:FindFirstChild("RightWrist") then
        local bm = Instance.new("BodyPosition", v.Character.RightHand)
        bm.MaxForce = Vector3.new(9e9,9e9,9e9)
        bm.P = 1e5
        bm.Position = Vector3.new(0, -1e5, 0)
        spawn(function()
            while v and v.Character and v.Character:FindFirstChild("RightHand") do
                wait()
                setsimulationradius(9e9, 9e9)
            end
        end)
    end
end