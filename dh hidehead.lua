local HeadPos = game.Players.LocalPlayer.Character.Head.Position.Y - game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y
local Plr = game.Players.LocalPlayer
mouse = Plr:GetMouse()
mouse.KeyDown:connect(function(key)
    if key == "t" then
        if cock then cock = false 
            Plr.Character.Head.Position = Plr.Character.Head.Position + Vector3.new(0, math.huge, 0)
        else cock = true 
            Plr.Character.Head.Position = Plr.Character.HumanoidRootPart.Position.Y + HeadPos
        end
    end
end)