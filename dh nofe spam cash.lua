local fakecash = Instance.new("Part")
local shit = require(game.ReplicatedStorage.MainModule).AddComma
local Plr = game.Players.LocalPlayer
do
    fakecash.Name = "MoneyDrop"
    fakecash.Size = Vector3.new(2, 0.4, 1.2)
    fakecash.BrickColor = BrickColor.new("Bright green")
    local stank = Instance.new("BillboardGui", fakecash)
    stank.Size = UDim2.new(2, 0, 1, 0)
    stank.ExtentsOffset = Vector3.new(0,3,0)
    stank.LightInfluence = 1
    local lab = Instance.new("TextLabel", stank)
    lab.Size = UDim2.new(1, 0, 1, 0)
    lab.TextColor3 = Color3.fromRGB(53, 173, 44)
    lab.TextSize = 50
    lab.Text = "$0"
    lab.Font = Enum.Font.Highway
    lab.BackgroundTransparency = 1
    lab.TextStrokeTransparency = 0
    lab.TextStrokeColor3 = Color3.fromRGB(66, 49, 35)
    lab.BorderSizePixel = 1
    lab.TextWrapped = true
    lab.TextScaled = true
    
    local faces = {Enum.NormalId.Top, Enum.NormalId.Bottom}
    for i= 1, 2 do
        local g = Instance.new("Decal", fakecash)
        g.Texture = "http://www.roblox.com/asset/?id=47682803"
        g.Face = faces[i]
    end
end
local cur = Plr.DataFolder.Currency
cur.Changed:connect(function()
    (Plr.Character:FindFirstChild("Wallet") or Plr.Backpack:FindFirstChild("Wallet")).Handle.BillboardGui.TextLabel.Text = shit(cur.Value)
end)

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = function(remote, call, amount, ...)
    if remote == game.ReplicatedStorage.MainEvent and call == "DropMoney" then
        cur.Value = cur.Value - tonumber(amount)
        local c = fakecash:Clone()
        c.Parent = game.Workspace.Ignored.Drop
        c.BillboardGui.Adornee = c
        c.BillboardGui.TextLabel.Text = "$"..shit(math.floor(tonumber(amount)*0.7))
        c.Position = Plr.Character.Head.CFrame.p + Vector3.new(0, 1, 0)
        spawn(function()
            Instance.new("ClickDetector", c).MouseClick:wait()
            c:Destroy()
            cur.Value = cur.Value + math.floor(tonumber(amount)*0.7)
        end)
        return print("dropped")
    end
    return old(remote, call, amount, ...)
end
setreadonly(mt, true)