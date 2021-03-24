local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local kys = Instance.new("TextButton", Toolbar)

kys.BackgroundTransparency = 1
kys.Position = UDim2.new(0.917, 0,0.6, 0)
kys.Size = UDim2.new(0, 50, 0, 50)
kys.Text = "KYS"
kys.TextColor3 = Color3.fromRGB(0, 0, 0)
kys.TextSize = 20.000

kys.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid:Destroy()
    wait(0.1)
    for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        v:Destroy()
    end
end)