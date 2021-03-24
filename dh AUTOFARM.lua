local plr = game.Players.LocalPlayer

local ATMEnabled,HospitalEnabled,ShoeEnabled = false,false,false

if messagebox("Enable ATM Farm?","Settings",4) == 6 then ATMEnabled = true end
if messagebox("Enable Hospital Farm?","Settings",4) == 6 then HospitalEnabled = true end
if messagebox("Enable Shoe Farm?","Settings",4) == 6 then ShoeEnabled = true end

repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")

for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("Seat") then
		v:Destroy()
	end
end

function DeleteAntiCheat()
    for i,v in pairs(plr.Character:GetChildren()) do
        if v.ClassName == "Script" and v.Name ~= "Health" then
            v:Destroy()
        end
    end
end

plr.CharacterAdded:Connect(function(character)
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
    DeleteAntiCheat()
	wait(1)
	reset = false
end)
DeleteAntiCheat()

local reset = false
spawn(function()
	while wait() do
		pcall(function()if plr.Character.Humanoid.Health <= 0 then reset = true end end)
	end
end)

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

game:GetService('RunService').Stepped:connect(function()
	pcall(function()plr.Character.Humanoid:ChangeState(11)end)
	setsimulationradius(math.huge)
end)

local function CompleteHospitalJob(Colour,Patient)
	repeat
		fireclickdetector(game.Workspace.Ignored.HospitalJob[Colour].ClickDetector)
		wait(0.1)
		if Patient:FindFirstChild("ClickDetector") then
			fireclickdetector(Patient.ClickDetector)
		end
	until Patient.Name == "Thank you!" or Patient.Name == "Wrong bottle!"
end

local function OtherJobs()
	if HospitalEnabled then
		for i,v in pairs(game.Workspace.Ignored.HospitalJob:GetChildren()) do
			if v.ClassName == "Model" then
				plr.Character.HumanoidRootPart.CFrame = CFrame.new(113.1,22.79,-478.97)
				if string.find(v.Name, "Red") then CompleteHospitalJob("Red",v)
				elseif string.find(v.Name, "Blue") then CompleteHospitalJob("Blue",v)
				elseif string.find(v.Name, "Green") then CompleteHospitalJob("Green",v) end
			end
		end
	end
	if ShoeEnabled then
		for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
			if v.Name == "MeshPart" then
				v.Name = "ShoeGrabbing"
				repeat
					wait()
					pcall(function()
						plr.Character.HumanoidRootPart.CFrame = v.CFrame
						fireclickdetector(v.ClickDetector)
					end)
				until not game.Workspace.Ignored.Drop:FindFirstChild("ShoeGrabbing")
			end
		end
		if plr.Character.BodyEffects.ShoesCollect.Value > 9 then
			fireclickdetector(game.Workspace.Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector)
		end
	end
end

while wait(0.5) do
	OtherJobs()
	if ATMEnabled then
		for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
			if v.Humanoid.Health > 0 then
			    wait(5)
				spawn(function()
					while v.Humanoid.Health > 0 do
						wait()
						pcall(function()plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0, -2, 1.5)end)
					end
				end)
				repeat
					pcall(function()plr.Character.Humanoid:EquipTool(plr.Backpack.Combat)end)
					wait(0.1)
					pcall(function()
						plr.Character.Combat:Activate()
						wait(2)
						plr.Character.Combat:Deactivate()
						wait(1)
					end)
				until v.Humanoid.Health <= 0
				wait(0.1)
				for ii,vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
					if vv.Name ~= "MoneyDrop" then continue end
					if (plr.Character.HumanoidRootPart.Position - vv.Position).Magnitude > 25 then continue end
					vv.Name = "Grabbing"
					vv.Anchored = true
					while game.Workspace.Ignored.Drop:FindFirstChild("Grabbing") do
						wait()
						pcall(function()
							plr.character.HumanoidRootPart.CFrame = vv.CFrame
							if not reset then fireclickdetector(vv.ClickDetector) end
						end)
					end
				end
				OtherJobs()
			end
		end
	end
end
