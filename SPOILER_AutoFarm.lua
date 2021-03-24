-- // Settings
local lagSensitivity = 10

-- // Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

-- // Vars
local LocalPlayer = Players.LocalPlayer
local MainEvent = ReplicatedStorage.MainEvent
local Target = nil

-- // Metatable vars
local mt = getrawmetatable(game)
local backupindex = mt.__index
setreadonly(mt, false)

RunService.Stepped:connect(function()
    pcall(function()
        LocalPlayer.Character.Humanoid:ChangeState(11)
    end)
end)

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

repeat wait() until game:IsLoaded()
local benchmark = 0
local enabled = true
spawn(function()
    wait(10)
    enabled = false
end)
while enabled do RunService.Stepped:wait()
    local c = stats.PhysicsReceiveKbps
    if c>benchmark then
        benchmark = c
        print("current benchmark (recived kbps)", benchmark)
    end
end

local allWeapons = {
    ["[Glock]"] = true,
    ["[Silencer]"] = true,
    ["[Shotgun]"] = true,
    ["[SMG]"] = true,
    ["[AR]"] = true,
    ["[P90]"] = true,
    ["[SilencerAR]"] = true,
    ["[Revolver]"] = true,
    ["[AK47]"] = true,
    ["[TacticalShotgun]"] = true,
    ["[DrumGun]"] = true,
    ["[AUG]"] = true,
    ["[LMG]"] = true,
    ["[Double-Barrel SG]"] = true
}

-- // Equip Tool
equipTool = function(Name)
    if (LocalPlayer.Character:FindFirstChild(Name)) then
        return LocalPlayer.Character[Name]
    end

    if (LocalPlayer.Backpack:FindFirstChild(Name)) then
        local tool = LocalPlayer.Backpack[Name]
        LocalPlayer.Character.Humanoid:EquipTool(tool)
        return LocalPlayer.Character:WaitForChild(Name)
    end
end

-- // Automation: Get Nearby Cash
getNearbyCash = function(customWait)
    -- // Vars
    local drops = Workspace.Ignored.Drop:GetChildren()

    -- // Loop
    for i = 1, #drops do
        local v = drops[i]
        if (v.Name == "MoneyDrop" and (LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 20) then
            wait(customWait or 0.7)
            fireclickdetector(v.ClickDetector, 0)
        end
    end
end

-- // MT Hook
mt.__index = newcclosure(function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target")) then
        if (Target) then
            return (k == "Hit" and Target.CFrame or Target)
        end
    end
    return backupindex(t, k)
end)

-- // Automation: Get Cashiers
local yes = false
while wait() do
    pcall(function()
    local WeaponName
    LocalPlayer.Character.Humanoid:UnequipTools()
    for i, v in next, LocalPlayer.Backpack:GetChildren() do
        if allWeapons[v.Name] then
            WeaponName = v.Name
        end
    end
    -- // Handling
    if (not WeaponName) then
        WeaponName = "Combat"
    end

    -- // Vars
    local saved = LocalPlayer.Character.HumanoidRootPart.CFrame
    local cashiers = Workspace.Cashiers:GetChildren()

    -- // Loop
    local debug = true
    for i = 1, #cashiers do
        local cashier = cashiers[i]
        if game:GetService("Stats").PhysicsReceiveKbps < benchmark - lagSensitivity then
            print("you-are-too-laggy-young-one")
            local oldpos = LocalPlayer.Character.HumanoidRootPart.CFrame
            repeat wait()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,1e4,0)
                
            until game:GetService("Stats").PhysicsReceiveKbps > benchmark - lagSensitivity
            LocalPlayer.Character.HumanoidRootPart.CFrame = oldpos
        end
        if (cashier.Humanoid.Health > 0) then
            debug = false
            -- // Vars
            local cashierCFrame = cashier.Open.CFrame
            local destinationCFrame = cashierCFrame + (cashierCFrame.lookVector * Vector3.new(0, 0, -2))
            Target = cashier.Open

            -- // Punch + Teleport
            while (cashier.Humanoid.Health > 0) do
                wait()
                -- // Equip melee weapon
                local tool = equipTool(WeaponName)
                
                -- // Auto Reload
                if (tool:FindFirstChild("Ammo") and tool.Ammo.Value == 0) then
                    if LocalPlayer.DataFolder.Inventory[tool.Name].Value == "0" then
                        local tobuy = tool.Name:gsub(".", function(chr) if chr == "[" or chr == "]" then return "" else return chr:lower() end end).." ammo"
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
                                	elseif (not Start) or (End and count>End) then
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
                        repeat wait()
                            LocalPlayer.Character.HumanoidRootPart.CFrame = loc.Head.CFrame
                            fireclickdetector(loc.ClickDetector)
                            LocalPlayer.Character.Humanoid:UnequipTools()
                        until tonumber(LocalPlayer.DataFolder.Inventory[tool.Name].Value) >= 400
                    else 
                        MainEvent:FireServer("Reload", tool, true)
                        repeat wait() until LocalPlayer.Character.BodyEffects.Reload.Value == false
                    end
                end

                -- //
                LocalPlayer.Character.HumanoidRootPart.CFrame = destinationCFrame
                
                tool:Activate()
            end
            -- // Get cash
            getNearbyCash(math.abs(benchmark-game:GetService("Stats").PhysicsReceiveKbps)/6)
            wait(math.abs(benchmark-game:GetService("Stats").PhysicsReceiveKbps)/4)
        end
    end
    
    if debug then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,1e4,0)
        if yes then
            yes = false
            print("no-more-cashiers-available")
        end
    else
        yes = true
    end

    -- // Reset Mouse
    Target = nil
    end)
end