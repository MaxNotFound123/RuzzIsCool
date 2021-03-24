local Plr = game.Players.LocalPlayer
local lastPos = Plr.Character.HumanoidRootPart.CFrame
local e = 100
local a, g = {}, {}

repeat
    Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hamburger] - $5"].Head.CFrame
    wait(0.5)
    fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Hamburger] - $5"].ClickDetector)
    for i, v in pairs(Plr.Backpack:GetChildren()) do
        if v.Name == "[Hamburger]" then
            table.insert(a, v)
            v.Parent = Plr.Character
        end
    end
until #a >= e/2

repeat
    Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Chicken] - $7"].Head.CFrame
    wait(0.5)
    fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
    for i, v in pairs(Plr.Backpack:GetChildren()) do
        if v.Name == "[Chicken]" then
            table.insert(g, v)
            v.Parent = Plr.Character
        end
    end
until #g >= e/2

for i, v in pairs(a) do
    local p = (i*0.01)+0.50
    v.GripUp = Vector3.new(0, 1, 0)
    v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
end

for i, v in pairs(g) do
    local p = (i*0.01)+0.50
    v.GripUp = Vector3.new(0, 1, 0)
    v.GripPos = Vector3.new(-((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, -((p^4)*math.sin(18.5*(math.pi*p)))*40)
end

Plr.Character.Humanoid:UnequipTools()
wait(5)
for _, burger in pairs(a) do
    burger.Parent = Plr.Character
end
for _, chicken in pairs(g) do
    chicken.Parent = Plr.Character
end
Plr.Character.HumanoidRootPart.CFrame = lastPos