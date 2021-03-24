if game.PlaceId == 2788229376 then repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") else return end
local enabled = false
local Plr = game.Players.LocalPlayer
mouse = Plr:GetMouse()
mouse.KeyDown:connect(function(key)
    if key == "l" then
		if enabled == false then
		    enabled = true
			game:GetService("RunService").Stepped:connect(function()
			    game.ReplicatedStorage.MainEvent:FireServer("Block",true)
			end)
			game.Players.LocalPlayer.PlayerGui.Framework:Destroy()
			function GodMode()
				game.Players.LocalPlayer.Character.BodyEffects.Defense:Destroy()
				game.Players.LocalPlayer.Character.BodyEffects.Armor:Destroy()
			end
			GodMode()	
			game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
			    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
			    GodMode()
			end)
		end
	end
end)