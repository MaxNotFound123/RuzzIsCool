local Plr = game.Players.LocalPlayer
local Hand = Plr.Character.RightHand

if Hand:FindFirstChild("RightWrist") then
    Hand.RightWrist:Destroy()
end

Plr.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

game:GetService('RunService').Stepped:connect(function()
	pcall(function()Plr.Character.Humanoid:ChangeState(11)end)
	setsimulationradius(math.huge^math.huge, math.huge)
end)

spawn(function()
    while wait() do
        Plr.Character.HumanoidRootPart.CFrame = CFrame.new(0,1000,0)
        for _, v in pairs(game.Workspace.Ignored:GetChildren()) do
            if v.Name == "MoneyDrop" and (v.Position - Plr.Character.HumanoidRootPart.Position).magnitude <= 5 then
                fireclickdetector(v.ClickDetector)
            end
        end
    end
end)

while wait(0.5) do
    for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
        if v.Humanoid.Health > 0 then
            local dbounce = false
            while v.Humanoid.Health > 0 do wait()
                pcall(function()
                    if not Hand:FindFirstChild("PENIS") then
                        local move = Instance.new("BodyPosition", Hand)
                        move.Name = "PENIS"
                        move.P = 1e5
                        move.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    end
                    Hand.PENIS.Position = (v.Open.CFrame *CFrame.new(0, 0, -1)).p
                    game.Workspace.CurrentCamera.CameraSubject = Hand
                end)
                if not dbounce then
                    spawn(function()
                        dbounce = true
                        wait(3)
                        dbounce = false
                        pcall(function()Plr.Character.Humanoid:EquipTool(Plr.Backpack.Combat)end)
                        pcall(function()
                            print(v.Humanoid.Health)
                            Plr.Character.Combat:Activate()
                            wait(2)
                            Plr.Character.Combat:Deactivate()
                            wait(1)
                        end)
                    end)
                end
            end
            for _, vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                if vv.Name == "MoneyDrop" and not vv:FindFirstChild("BodyPosition") then
                    vv.CanCollide = false
                    local Mover = Instance.new("BodyPosition", vv)
                    Mover.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    Mover.Position = Vector3.new(0, 1000, 0)
                end
            end
        end
        wait(0.1)
    end
end