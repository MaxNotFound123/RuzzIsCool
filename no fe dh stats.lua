local Plr = game.Players.LocalPlayer
for i, v in pairs(Plr.PlayerGui.MainScreenGui.Leaderboard.PlayerScroll:GetChildren()) do
    if i == 2 then
        v.Text = "999,999,999"
    end
end
Plr.Character.Humanoid:UnequipTools()
Plr.Backpack.Wallet.Handle.BillboardGui.TextLabel.Text = "$999,999,999,999,999,999"
Plr.PlayerGui.MainScreenGui.MoneyText.Text = "$999,999,999,999,999,999"
Plr.Character.Humanoid:EquipTool(Plr.Backpack.Wallet)