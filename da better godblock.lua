game:GetService("RunService").stepped:connect(function()
    game.ReplicatedStorage.MainEvent:FireServer("Block",true)
    game.Players.LocalPlayer.Character.BodyEffects.Block:Destroy()
end)
