local Plr = game.Players.LocalPlayer
local LastPos = Plr.Character.HumanoidRootPart.CFrame
wait(0.1)
if Plr.Character:FindFirstChild("[Knife]") or Plr.Backpack:FindFirstChild("[Knife]") then
	Plr.Character.Humanoid:UnequipTools()
	wait(0.1)
	Plr.Character.Humanoid:EquipTool(Plr.Backpack["[Knife]"])
	Plr.Character.HumanoidRootPart.CFrame = CFrame.new(803.5, 48, -547, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	Plr.Character["[Knife]"].Handle.Orientation = Vector3.new(0, 180, 0)
	wait(0.2)
	Plr.Character["[Knife]"].Handle.Position = Vector3.new(804.3, 47, -547)
	Plr.Character.HumanoidRootPart.CFrame = LastPos
elseif Plr.Character:FindFirstChild("[StopSign]") or Plr.Backpack:FindFirstChild("[StopSign]") then
	Plr.Character.Humanoid:UnequipTools()
	wait(0.1)
	Plr.Character.Humanoid:EquipTool(Plr.Backpack["[StopSign]"])
	Plr.Character["[StopSign]"].Sign:Destroy()
	Plr.Character.HumanoidRootPart.CFrame = CFrame.new(803.5, 48, -547, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	Plr.Character["[StopSign]"].Handle.Orientation = Vector3.new(0, 180, 0)
	wait(0.2)
	Plr.Character["[StopSign]"].Handle.Position = Vector3.new(806.5, 47, -547)
	Plr.Character.HumanoidRootPart.CFrame = LastPos
elseif Plr.Character:FindFirstChild("[Bat]") or Plr.Backpack:FindFirstChild("[Bat]") then
	Plr.Character.Humanoid:UnequipTools()
	wait(0.1)
	Plr.Character.Humanoid:EquipTool(Plr.Backpack["[Bat]"])
	Plr.Character.HumanoidRootPart.CFrame = CFrame.new(803.5, 48, -547, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	Plr.Character["[Bat]"].Handle.Orientation = Vector3.new(0, 0, 90)
	Plr.Character["[Bat]"].Handle.Position = Vector3.new(806, 47, -547)
	Plr.Character.HumanoidRootPart.CFrame = LastPos
elseif Plr.Character:FindFirstChild("[SledgeHammer]") or Plr.Backpack:FindFirstChild("[SledgeHammer]") then
	Plr.Character.Humanoid:UnequipTools()
	wait(0.1)
	Plr.Character.Humanoid:EquipTool(Plr.Backpack["[SledgeHammer]"])
	Plr.Character.HumanoidRootPart.CFrame = CFrame.new(803.5, 48, -547, 0, 0, -1, 0, 1, 0, 1, 0, 0)
	Plr.Character["[SledgeHammer]"].Part.Orientation = Vector3.new(0, 180, 0)
	Plr.Character["[SledgeHammer]"].Part.Position = Vector3.new(804, 47, -547)
	Plr.Character["[SledgeHammer]"].Part.Name = "BALLS"
	wait(0.1)
	Plr.Character["[SledgeHammer]"].Part.Orientation = Vector3.new(-90, 90, 180)
	Plr.Character["[SledgeHammer]"].Part.Position = Vector3.new(806, 47, -547)
	Plr.Character["[SledgeHammer]"].Part.Name = "SHAFT"
	Plr.Character.HumanoidRootPart.CFrame = LastPos
end
