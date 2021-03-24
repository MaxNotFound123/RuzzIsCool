local Plr = game:GetService'Players'.LocalPlayer
local guimain = Instance.new("Folder", game.CoreGui)
local CC = game:GetService'Workspace'.CurrentCamera
local buycount = 1
local bring = true
local esp = false
local aim = false
local enabled = false
local tazing = false
local accomidationfactor = 0.165
local mouse = game.Players.LocalPlayer:GetMouse()
local hitpart = "Head"
local Target

Plr.Chatted:connect(function(msg)
    local spt = msg:split(' ')
    if spt[1] == '.buy' then
        local lastpos = Plr.Character.HumanoidRootPart.CFrame
        local tobuy = msg:sub(6, 999)
        local loc
        local best, bestprice = math.huge, math.huge
        local sorted = {}
        for ii = 1, 2 do
            for i, v in next, game.Workspace.Ignored.Shop:GetChildren() do
                local Start, End, TrueEnd, count, str, price = nil, nil, nil, 0, v.Name, ""
                str = str:gsub(".", function(Char)
                	count = count + 1
                	if Char == '[' then
                		Start = count
                		return '' 
                	elseif Char == ']' then
                        End = count
                        return '' 
                	elseif Char == "$" then
                        TrueEnd = count
                        return ''
                    elseif TrueEnd and count>TrueEnd then
                        price = price..Char
                        return ''
                	elseif not Start then
                        return ''
                	elseif End and count>End then
                        return ''
                    else
                        return Char:lower()
                    end
                end)
                price = tonumber(price)
                if string.find(str, tobuy:lower()) then
                    local a, e = string.find(str, tobuy:lower())
                    local g = #str-(e-a)
                    if g<=best then
                        if ii == 2 and price<bestprice then
                            bestprice = price
                            loc = v
                        else
                            best = g
                        end
                    end
                end
            end
        end
        if not loc then print("object not found") return end
        local ammo, armor = false, false
        if string.find(loc.Name:lower(), "ammo") then ammo = true end
        if string.find(msg:lower(), "armor") then ammo = true armor = true end
        repeat
            wait()
            if ammo then
                local buyct = buycount
                if armor then
                    buyct = 1
                end
                disabled = true
                for i= 1, buyct do
                    Plr.Character.HumanoidRootPart.CFrame = loc.Head.CFrame
                    wait(0.5)
                    fireclickdetector(loc.ClickDetector)
                end
            else
                Plr.Character.HumanoidRootPart.CFrame = loc.Head.CFrame
                wait(0.5)
                fireclickdetector(loc.ClickDetector)
                for i, v in next, Plr.Backpack:GetChildren() do
                    if string.find(v.Name:lower(), msg:sub(6, 999):lower()) then disabled = true end
                end
            end
        until disabled
        wait(1)
        Plr.Character.HumanoidRootPart.CFrame = lastpos
    elseif spt[1] == ".god" then
        local Plr = game.Players.LocalPlayer; Plr.Character.Humanoid:Destroy(); repeat wait() until Plr.Character and Plr.Character:FindFirstChild("BodyEffects") and Plr.Character:FindFirstChild("Humanoid"); Plr.Character.BodyEffects.BreakingParts:Destroy(); wait(1); local pp = Instance.new("Folder", Plr.Character); pp.Name = "FULLY_LOADED_CHAR"
    elseif spt[1] == ".buycount" and spt[2] then
        buycount = tonumber(spt[2])
    elseif spt[1] == ".goto" and spt[2] then
        local target
        for i, v in next, game.Players:GetPlayers() do
            if string.find(v.Name:lower(), spt[2]:lower()) then
                target = v 
            end
        end
        if target then
            Plr.Character.HumanoidRootPart.CFrame = target.Character.UpperTorso.CFrame * CFrame.new(0, 0, -2)
        else print("invalid name") end
    elseif spt[1] == ".bringon" then
        bring = true
    elseif spt[1] == ".bringoff" then
        bring = false
    elseif spt[1] == ".esp" then
        if esp then esp = false else esp = true end
        for i, v in next, guimain:GetChildren() do
            v.Enabled = esp
        end
    elseif spt[1] == ".aim" then
        if aim then aim = false else aim = true end
        enabled = false
    elseif spt[1] == ".hitpart" and spt[2] then
        local abbeviated = {
            chest = "UpperTorso",
            rhand = "RightHand",
            lhand = "LeftHand",
            head = "Head"
        }
        if abbeviated[spt[2]:lower()] then 
            hitpart = abbeviated[spt[2]] 
        else
            hitpart = spt[2]
        end
        for i, v in next, guimain:GetChildren() do
            pcall(function()
                v.Adornee = game.Players[v.Name].Character:WaitForChild(hitpart)
            end)
        end
    elseif spt[1] == ".r" then
        Plr.Character:Destroy()
    end
end)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(1, 0, 1, 0)
    a.BackgroundTransparency = 0.4
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(50, 50)
    return(e)
end

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("Head") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
   return closestPlayer
end

local data = game.Players:GetPlayers()
function noob(player)
    pcall(function()
        player.Chatted:connect(function(msg)
            local spt = msg:split(' ')
            if spt[1] == ".bring" and string.find(Plr.Name:lower(), spt[2]:lower()) and bring then
                Plr.Character:MoveTo(player.Character.HumanoidRootPart.Position)
            end
        end)
        local character
        repeat wait() until player.Character
        local handler = Instance.new("BillboardGui", player)
        handler.Adornee = player.Character
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char end)
            local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(hitpart), Color3.fromRGB(255, 255, 255), 0.3, 3)
        handler.Name = player.Name
        handler.Enabled = esp
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(hitpart) end)
        
	    local TextLabel = Instance.new("TextLabel", handler)
	    TextLabel.BackgroundTransparency = 1
	    TextLabel.Position = UDim2.new(0, 0, 0, -50)
	    TextLabel.Size = UDim2.new(0, 100, 0, 100)
	    TextLabel.Font = Enum.Font.SourceSansSemibold
	    TextLabel.TextSize = 14
	    TextLabel.TextColor3 = Color3.new(1, 1, 1)
	    TextLabel.TextStrokeTransparency = 0
	    TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	    TextLabel.Text = 'Name: '..player.Name
	    TextLabel.ZIndex = 10
	
	    spawn(function()
            while wait() do
                if player.Character then
                    if not player.Character:FindFirstChild("FULLY_LOADED_CHAR") or not player.Character:WaitForChild("BodyEffects"):FindFirstChild("Armor") or not player.Character:WaitForChild("BodyEffects"):FindFirstChild("Defense") then
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                    elseif player:WaitForChild("leaderstats").Wanted.Value > 0 then
                        TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    elseif player:WaitForChild("leaderstats").Wanted.Value < 0 then
                        TextLabel.TextColor3 = Color3.fromRGB(0, 0, 255)
                    else 
                        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    end
                    TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
                end
            end
	    end)
	end)
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(function(Player)
    noob(Player)
end)

game.Players.PlayerRemoving:Connect(function(player)
    pcall(function()
        guimain[player.Name]:Destroy()
    end)
end)

mouse.KeyDown:Connect(function(k)
    if k ~= "x" or aim == false then return end
    if enabled then
        enabled = false
        guimain[Target.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        hitpoint:Remove()
    else
        enabled = true 
        Target = getClosestPlayerToCursor()
        guimain[Target.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        spawn(function()
            while enabled do wait()
                pcall(function()
                    local e = Plr.Character["[Taser]"].Handle.ChildAdded:wait()
                    repeat wait()
                        e.CFrame = Target.Character[hitpart].CFrame
                    until e.Parent == nil
                end)
            end
        end)
        spawn(function()
            while enabled do wait()
                print(pcall(function()
                    local e = game.Workspace.Ignored.ChildAdded:wait()
                    if e.Name == "Launcher" and math.abs((e.Position-Plr.Character.HumanoidRootPart.Position).Magnitude)<30 then
                        local m = Instance.new("BodyVelocity", e)
                        wait()
                        m.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        while e and e.Parent ~= nil do
                            e.CFrame = CFrame.lookAt(e.CFrame.p, Target.Character[hitpart].CFrame.p)*CFrame.Angles(math.rad(90), 0, 0)
                            m.Velocity = ((e.CFrame * CFrame.new(0, -30, 0)).p - e.CFrame.p)
                            game.RunService.Stepped:wait()
                            setsimulationradius(math.huge^math.huge, math.huge)
                        end
                    end
                end))
            end
        end)
    end    
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = Target.Character[hitpart].Position+(Target.Character.Head.Velocity*accomidationfactor)
        return old(unpack(args))
    end
    return old(...)
end)