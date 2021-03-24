local ghghghhghg = Instance.new("Folder", game.CoreGui);ghghghhghg.Name = "ghghghhghg"
while wait(0.1) do
    	for i, v in pairs(game.Players:GetPlayers()) do
        if v:FindFirstChild("DataFolder") and not ghghghhghg:FindFirstChild(v.Name) then
            print(v.Name.." has "..v.DataFolder.Currency.Value)
            local CurrencyCheck = Instance.new("Folder", ghghghhghg);CurrencyCheck.Name = v.Name
        end
        if v.Character and v.Character:FindFirstChild("BodyEffects") and v.Character.BodyEffects:FindFirstChild("Defense") == nil and v ~= game.Players.LocalPlayer then
            print(v.Name.." is in godblock")
            local Defense = Instance.new("IntValue",v.Character.BodyEffects);Defense.Name = "Defense"
        end
    end
end

