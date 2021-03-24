for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.Name == "" then
        v.Parent = game.Players.LocalPlayer.Character
        spawn(function()
            while wait() do
                v:Deactivate()
                wait(0.1)
                v:Deactivate()
            end
        end)
    end
end