--LOCALCHECKER(make it under game.ServerScriptStorage and name it "Local", also make it a localscript)
local Loaded = game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")
if Loaded then
    game.ReplicatedStorage.MainEvent:FireServer("loaded", Loaded)
end
for i, v in pairs(game.Workspace:GetDescendants()) do 
    if v:isa("BodyGyro") or v:isa("BodyPosition") then 
        game.Players.LocalPlayer:Kick("Something went wrong, please rejoin")
    end
end