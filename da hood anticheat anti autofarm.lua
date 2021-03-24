local regcount = 0
local debug = false
game:GetService("Players").PlayerAdded:Connect(function(player)
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