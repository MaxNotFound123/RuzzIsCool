local Plr = game.Players.LocalPlayer
for i,v in pairs(Plr.Character:GetChildren()) do
    if v:IsA("Tool") then
        if v.Name ~= "Combat" then
            local pp = v.Handle
            v.TextureId = 0
            if v.Name ~= "[SledgeHammer]" and v.Name ~= "[StopSign]" then
                pp.MeshId = 0
                pp.Transparency = 1
            elseif v.Name == "[SledgeHammer]" then v.Part:Destroy() wait(0.1) v.Part:Destroy()
            elseif v.Name == "[StopSign]" then v.Sign:Destroy() end
            
            pp.Size = Vector3.new(50, 50, 50)
            print(v)
            Plr.Character.Humanoid:UnequipTools()
            local tooloutline = Instance.new("SelectionBox",v.Handle)
            tooloutline.Adornee = pp
        else 
            for i,v in ipairs(Plr.Character:GetDescendants()) do
                 if v:IsA("MeshPart") then v.Massless = true
                    v.CanCollide = false
                    v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                end
            end

            for i,v in ipairs(game.workspace:GetDescendants()) do
                if v:IsA("Seat") then 
                    v:Destroy()
                end
            end

            Plr.Character.RightHand.Size = Vector3.new(35, 35, 35)
            Plr.Character.RightHand.Transparency = 1

            game:GetService('RunService').Stepped:connect(function()
                if Plr.Character:FindFirstChild("Combat") and not Plr.Character.RightHand:FindFirstChild("ppsuc") then
                    local HandHitBox = Instance.new("SelectionBox",Plr.Character.RightHand)
                    HandHitBox.Adornee = Plr.Character.RightHand
                    HandHitBox.Name = "ppsuc"
                elseif not Plr.Character:FindFirstChild("Combat") and Plr.Character.RightHand:FindFirstChild("ppsuc") then
                    Plr.Character.RightHand.ppsuc:Destroy()
                end
            end)
        end
    end
end

    