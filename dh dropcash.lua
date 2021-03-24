local Run = false

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Toolbar = Instance.new("Frame", ScreenGui)
local Background = Instance.new("Frame", Toolbar)
local Name = Instance.new("TextLabel", Toolbar)
local LoopTp = Instance.new("TextButton", Toolbar)
local Name_Box = Instance.new("TextBox", LoopTp)

Toolbar.Name = "Toolbar"
Toolbar.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Toolbar.Position = UDim2.new(0.02541296, 0, 0.163390666, 0)
Toolbar.Size = UDim2.new(0, 269, 0, 34)
Toolbar.Active = true
Toolbar.Draggable = true

Background.Name = "Background"
Background.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
Background.BackgroundTransparency = 0.500
Background.Position = UDim2.new(0, 0, 0.986920536, 0)
Background.Size = UDim2.new(0, 268, 0, 72)

Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.Position = UDim2.new(0.00371747208, 0, 0, 0)
Name.Size = UDim2.new(0, 268, 0, 34)
Name.Font = Enum.Font.SourceSans
Name.Text = "Drop Cash"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 14.000
Name.TextWrapped = true

LoopTp.Name = "tpon"
LoopTp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoopTp.BackgroundTransparency = 1.000
LoopTp.Position = UDim2.new(0, 0, 1, 0)
LoopTp.Size = UDim2.new(0, 268, 0, 36)
LoopTp.Font = Enum.Font.Gotham
LoopTp.Text = "Drop"
LoopTp.TextColor3 = Color3.fromRGB(255, 255, 255)
LoopTp.TextSize = 20.000

Name_Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_Box.BackgroundTransparency = 1.000 
Name_Box.Position = UDim2.new(0, 0, 1, 0)
Name_Box.Size = UDim2.new(0, 268, 0, 36)
Name_Box.Font = Enum.Font.Gotham
Name_Box.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
Name_Box.PlaceholderText = "Amount"
Name_Box.Text = ""
Name_Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_Box.TextSize = 20.000

local toggle = false

LoopTp.MouseButton1Click:Connect(function()
    if toggle then toggle = false return end
    toggle = true
    local Expected = math.ceil(game.Players.LocalPlayer.DataFolder.Currency.Value - tonumber(Name_Box.Text))
    repeat wait()
        if game.Players.LocalPlayer.DataFolder.Currency.Value >= 10000 and game.Players.LocalPlayer.DataFolder.Currency.Value - Expected >= 10000 then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney", "10000")
        elseif game.Players.LocalPlayer.DataFolder.Currency.Value - Expected < 10000 then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney", tostring(game.Players.LocalPlayer.DataFolder.Currency.Value - Expected))
        elseif game.Players.LocalPlayer.DataFolder.Currency.Value < 10000 then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney", tostring(game.Players.LocalPlayer.DataFolder.Currency.Value))
        end
    until game.Players.LocalPlayer.DataFolder.Currency.Value == 0 or game.Players.LocalPlayer.DataFolder.Currency.Value == Expected
end)

LoopTp.MouseButton2Click:Connect(function()
    if toggle then toggle = false return end
    toggle = true
    local Expected = math.ceil(game.Players.LocalPlayer.DataFolder.Currency.Value - (tonumber(Name_Box.Text)*1.42857142857))
    repeat wait()
        if game.Players.LocalPlayer.DataFolder.Currency.Value >= 10000 and game.Players.LocalPlayer.DataFolder.Currency.Value - Expected >= 10000 then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney", "10000")
        elseif game.Players.LocalPlayer.DataFolder.Currency.Value - Expected < 10000 then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney", tostring(game.Players.LocalPlayer.DataFolder.Currency.Value - Expected))
        elseif game.Players.LocalPlayer.DataFolder.Currency.Value < 10000 then
            game.ReplicatedStorage.MainEvent:FireServer("DropMoney", tostring(game.Players.LocalPlayer.DataFolder.Currency.Value))
        end
    until game.Players.LocalPlayer.DataFolder.Currency.Value == 0 or game.Players.LocalPlayer.DataFolder.Currency.Value == Expected
end)

