getgenv().Burger = {
    Stack=(function()
        local tab = {}
        for i = 1, 10 do
            tab[i] = {
                Pos=Vector3.new(1, i, 1),
                Orientation = Vector3.new(0, 1, 0)
            }
        end
        return tab
    end)(),
    Galaxy = (function()
        local tab = {}
        for i = 1, 100 do
            tab[i] = {}
            local p = (i*0.01)+0.50
            tab[i].Orientation = Vector3.new(0, 1, 0)
            if i <=50 then
                tab[i].Pos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
            else
                tab[i].Pos = Vector3.new(((p^4)*math.cos(18.5*(math.pi*p)))*40, 0, ((p^4)*math.sin(18.5*(math.pi*p)))*40)
            end
        end
        return tab
    end)(),
    Execute = function(tab)
        local Plr = game.Players.LocalPlayer
        local a = {}
        repeat
            Plr.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Hamburger] - $5"].Head.CFrame
            wait(0.5)
            fireclickdetector(game:GetService("Workspace").Ignored.Shop["[Hamburger] - $5"].ClickDetector)
            for i, v in pairs(Plr.Backpack:GetChildren()) do
                if v.Name == "[Hamburger]" then
                    table.insert(a, v)
                    v.Parent = Plr.Character
                    v.GripPos = tab[#a].Pos
                    v.GripUp = tab[#a].Orientation
                end
            end
        until #a >= #tab
    end
}