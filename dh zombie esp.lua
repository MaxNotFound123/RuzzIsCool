
    for i, v in pairs(game.Workspace.Players:GetChildren()) do
        if v.Name == "[ZOMBIE]" then
            pcall(function()
                local pp = Instance.new("BillboardGui", v.HumanoidRootPart); 
                pp.Name = "PEEPEE"; 
                pp.Adornee = v.HumanoidRootPart
                pp.Size = UDim2.new(0, 100, 0, 150)
                pp.StudsOffset = Vector3.new(0, 2, 0)
                pp.AlwaysOnTop = true
                local e = Instance.new("TextLabel", pp)
                e.BackgroundTransparency = 1
                e.Position = UDim2.new(0, 0, 0, -50)
                e.Size = UDim2.new(0, 100, 0, 100)
                e.Font = Enum.Font.SourceSansSemibold
                e.TextSize = 20
                e.TextColor3 = Color3.new(1, 1, 1)
                e.TextStrokeTransparency = 0
                e.TextYAlignment = Enum.TextYAlignment.Bottom
                e.Text = "ZOMBIE"
            end)
        end
    end
