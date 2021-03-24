local Plr = game.Players.LocalPlayer
local e = 0
local p = 0
local burgercount = 3
local a = {}
local radian = math.pi/burgercount
repeat
    Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hamburger] - $5"].Head.CFrame
    wait(0.5)
    fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Hamburger] - $5"].ClickDetector)
    for i, v in pairs(Plr.Backpack:GetChildren()) do
        if v.Name == "[Hamburger]" then
            e = 0
            for i, v in pairs(a) do
                e = e + 1
            end
            table.insert(a, v)
            v.Parent = Plr.Character
        end
    end
until e >= burgercount*9
spawn(function()
    while wait() do
        e = e + 0.01
        if e >= 1 then
            e = -1
        end
    end
end)
for i, v in pairs(a) do
    spawn(function()
        while wait() do
            p = 2*(e*math.pi-(radian*i))
            if i <=math.floor(1*burgercount) then
                v.GripPos = Vector3.new(math.sin(p)*5, 0, math.cos(p)*5)
            elseif i <=2*burgercount then
                v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, 0)
            elseif i <=3*burgercount then
                v.GripPos = Vector3.new(0, math.cos(p)*5, math.sin(p)*5)
            elseif i <=4*burgercount then
                v.GripPos = Vector3.new(math.cos(p)*5, math.sin(p)*5, math.cos(p)*5)
            elseif i <=5*burgercount then
                v.GripPos = Vector3.new(math.cos(p)*5, math.sin(p)*5, -math.cos(p)*5)
            elseif i <=6*burgercount then
                v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, math.cos(p)*5)
            elseif i <=7*burgercount then
                v.GripPos = Vector3.new(math.sin(p)*5, math.cos(p)*5, -math.cos(p)*5)
            elseif i <=8*burgercount then
                v.GripPos = Vector3.new(math.cos(p)*5, math.cos(p)*5, math.sin(p)*5)
            elseif i <=9*burgercount then
                v.GripPos = Vector3.new(math.cos(p)*5, math.cos(p)*5, math.sin(p)*5)
            end
        end
    end)
end
Plr.Character.Humanoid:UnequipTools()
wait(5)
for _, burger in pairs(a) do
    burger.Parent = Plr.Character
end