local regcount = 0
local debug = false

function kick(player)
    player:Kick("Something went wrong, please rejoin")
end

game:GetService("Players").PlayerAdded:Connect(function(player)
    anticheat(player)
    local reghits = 0
    for i, v in pairs(game:GetService("Workspace").Cashiers:GetChildren()) do
        regcount = i
        local Block = v.Open
        local touched = false
        spawn(function()
            while wait() do
                if debug then
                    touched = false
                    reghits = 0
                end
            end
        end)
        Block.Touched:Connect(function(part)
            if part == player.Character.RightHand then
                if touched == false then
                    touched = true
                    reghits = reghits + 1
                end
            end
        end)
    end

    while wait(100) do
        if reghits == regcount then
            player:Kick("Something went wrong, please rejoin!")
        end
        debug = true
        wait(1)
        debug = false
    end
end)

ReplicatedStorage.MainEvent.OnServerEvent:Connect(function(player, Define, Instance)
    if Define == "loaded" then
        if not Instance then
            kick(player)
        end
    end
end)

function anticheat(player)
    --flight and general partmovement stuff
    local localchecker
    spawn(function()
        while wait(240) do
            localchecker = game.ServerScriptStorage.Local:Clone(); localchecker.Parent = player
            if (player.Character.Head.Position - player.Character.HumanoidRootPart.Position).Magnitude > 50 then
                kick(player)
            end
        end
    end)
    --godmode/godblock
    player.Character.BodyEffects.ChildRemoved:Connect(function(instance)
        wait(1)
        if instance == localchecker then 
            kick(player)
        end
        if player.Character:FindFirstChild("FULLY_LOADED_CHAR") then
            if instance.Name == "Defense" then
                kick(player)
            end
            if instance.Name == "BreakingParts" then
                kick(player)
            end
        end
    end)
end