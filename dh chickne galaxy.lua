local Plr = game.Players.LocalPlayer
local lastPos = Plr.Character.HumanoidRootPart.CFrame
local e = 0
local p = 0
local a = {}
repeat
    Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Chicken] - $7"].Head.CFrame
    wait(0.5)
    fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
    for i, v in pairs(Plr.Backpack:GetChildren()) do
        if v.Name == "[Chicken]" then
            e = 0
            for i, v in pairs(a) do
                e = e + 1
            end
            table.insert(a, v)
            v.Parent = Plr.Character
        end
    end
until e >= 100

for i, v in pairs(a) do
    local p = (i*0.01)+0.50
    v.GripUp = Vector3.new(0, 1, 0)
    if i <=e/2 then
        v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
    else
        v.GripPos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
    end
end
Plr.Character.Humanoid:UnequipTools()
wait(5)
for _, burger in pairs(a) do
    burger.Parent = Plr.Character
end
Plr.Character.HumanoidRootPart.CFrame = lastPos