local plr = game.Players.LocalPlayer
plr.Character.Humanoid:UnequipTools()
if not plr.Backpack:FindFirstChild("[P90]") then repeat  wait() plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[P90] - $1000"].Head.CFrame fireclickdetector(Workspace.Ignored.Shop["[P90] - $1000"].ClickDetector) until plr.Backpack:FindFirstChild("[P90]") end
plr.Character.Humanoid:EquipTool(plr.Backpack["[P90]"])
local gun = plr.Character:FindFirstChildOfClass("Tool")
gun.Name = "poggers"

repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")
--SEAT DESTRUCTIONNNNN
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("Seat") then
		v:Destroy()
	end
end
--anti tp anticheat
function DeleteAntiCheat()
    for i,v in pairs(plr.Character:GetChildren()) do
        if v.ClassName == "Script" and v.Name ~= "Health" then
            v:Destroy()
        end
    end
end

plr.CharacterAdded:Connect(function(character)
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
    DeleteAntiCheat()
	wait(1)
	reset = false
end)
DeleteAntiCheat()
--respawn
local reset = false
spawn(function()
	while wait() do
		pcall(function()if plr.Character.Humanoid.Health <= 0 then reset = true end end)
	end
end)
--antiafk
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
--network ownership
game:GetService('RunService').Stepped:connect(function()
	pcall(function()plr.Character.Humanoid:ChangeState(11)end)
	setsimulationradius(math.huge)
end)

while wait(0.5) do
    for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
        if v.Humanoid.Health > 0 then
            spawn(function()
                while v.Humanoid.Health > 0 do
                    wait()
                    pcall(function()plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0.3, -3.7, 3.4)end)
                end
            end)
            repeat
                pcall(function()plr.Character.Humanoid:EquipTool(plr.Backpack.poggers)end)
                wait(0.5)
                if gun.Ammo.Value == 0 then 
                    if plr.DataFolder.Inventory["[P90]"].Value == "0" then
                        repeat wait()
                            plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["120 [P90 Ammo] - $60"].Head.CFrame
                            fireclickdetector(Workspace.Ignored.Shop["120 [P90 Ammo] - $60"].ClickDetector)
                            plr.Character.Humanoid:UnequipTools()
                        until tonumber(plr.DataFolder.Inventory["[P90]"].Value) >= 1000
                    else
                        game.ReplicatedStorage.MainEvent:FireServer("Reload", gun)
                        repeat wait() until gun.Ammo ~= 0
                    end
                else
                    pcall(function()
                        game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePos", v.Head.Position)
                        wait()
                        gun:Activate()
                        repeat wait() until v.Humanoid.Health <= 0 or gun.Ammo.Value == 0
                        gun:Deactivate()
                        wait(0.1)
                    end)
                end
            wait(0.1)
            until v.Humanoid.Health <= 0

            for ii,vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                wait(0.2)
                if vv.Name ~= "MoneyDrop" then continue end
                if (plr.Character.HumanoidRootPart.Position - vv.Position).Magnitude > 25 then continue end
                vv.Name = "Grabbing"
                vv.Anchored = true
                while game.Workspace.Ignored.Drop:FindFirstChild("Grabbing") do
                    wait()
                    pcall(function()
                        plr.character.HumanoidRootPart.CFrame = vv.CFrame
                        if not reset then fireclickdetector(vv.ClickDetector) end
                    end)
                end
            end
        end
    end
end