-- // Services
local Players = game:GetService("Players")

-- // Vars
local LocalPlayer = Players.LocalPlayer

-- // Disable Jump Limit
function rJumpLimit(Character)
    local connections = getconnections(Character.Humanoid.Jumping)

    for i = 1, #connections do
        local connection = connections[i]
        if (getfenv(connection.Function).script.Name == "Framework") then
            connection:Disable()
        end
    end
end

-- //
rJumpLimit(LocalPlayer.Character)
LocalPlayer.CharacterAdded:Connect(function(Character)
    LocalPlayer.PlayerGui:WaitForChild("Framework")
    rJumpLimit(Character)
end)