if game.PlaceId == 2788229376 then repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR") else return end
repeat wait() until false

pcall(function() 
	local corepackages = game:GetService"CorePackages" 
	local localplayer = game:GetService"Players".LocalPlayer 
	local run = game:GetService"RunService" run:BindToRenderStep("rrrrrrrrrrr",2000,function() 
		pcall(function() 
			if localplayer.Character.BodyEffects["K.O"].Value then 
				localplayer.Character.Humanoid:UnequipTools() 
				localplayer.Character.Humanoid:Destroy() workspace.CurrentCamera.CameraSubject = localplayer.Character 
				wait() 
				local prt = Instance.new("Model", corepackages); Instance.new("Part", prt).Name="Torso"; Instance.new("Part", prt).Name="Head"; Instance.new("Humanoid", prt).Name="Humanoid"; localplayer.Character=prt
			end 
		end)
	end)
end)