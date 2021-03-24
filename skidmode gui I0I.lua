local checks = {
	friends = false,
	group = false,
	crew = false
}

function corn(Par)
	local e = Instance.new("UICorner", Par)
end

function shadow(object)
    local e = object:Clone()
    e.Parent = object.Parent
    object.Parent = e
    object.Position = UDim2.new(-0.05, 0, -0.05, 0)
    corn(e)
    e.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
end

function butt(Pos, Par, Txt)
	local but = Instance.new("TextButton", Par)
	but.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
	but.TextColor3 = Color3.fromRGB(0, 0, 0)
	but.TextSize = 8
	but.Position = Pos
	but.Size = UDim2.new(0, 56, 0, 28)
	but.Text = Txt
	local enabled = false
	but.MouseButton1Click:connect(function()
		if enabled then 
			enabled = false
			but.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
		else 
			enabled = true
			but.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
		end
		checks[Txt] = enabled
	end)
	shadow(but)
	corn(but)
	return but
end

local Screen = Instance.new("ScreenGui", game.CoreGui)
local main = Instance.new("Frame", Screen)
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
main.Size = UDim2.new(0, 192, 0, 54)
main.Draggable = true
corn(main)
butt(UDim2.new(0, 6, 0, 18), main, "friends")
butt(UDim2.new(0, 68, 0, 18), main, "group")
butt(UDim2.new(0, 130, 0, 18), main, "crew")
local lab = Instance.new("TextLabel", main)
lab.BackgroundTransparency = 1
lab.Position = UDim2.new(0.208, 0, 0.111, 0)
lab.Size = UDim2.new(0, 108, 0, 6)
lab.Text = "viability check"
lab.TextColor3 = Color3.fromRGB(0, 0, 0)
lab.TextSize = 8
local Plrs = game:GetService("Players")
local Plr = Plrs.LocalPlayer
function doshit(e, a)
	local plr = a or e
	--if plr ~= Plr then 
	plr.Chatted:connect(function(msg)
		if string.sub(msg,1,3) == "/e " then
			request(plr, string.sub(msg,4,#msg):split(' '))
		end
	end)
	--end
end
table.foreach(Plrs:GetPlayers(), doshit)
Plrs.PlayerAdded:connect(doshit)
function request(plr, args)
	local passed = true
	if checks.friends and not Plr:IsFriendsWith(plr.UserId) then
		passed = false
	end
	if checks.group and not plr:IsInGroup(tonumber(Plr.DataFolder.Information.Crew.Value)) then
		passed = false
	end    
	if checks.crew and not (Plr.DataFolder.Information.Crew.Value == plr.DataFolder.Information.Crew.Value) then
		passed = false
	end
	if not passed then return end
	if args[1] then
		if args[1]:lower() == "bring" and args[2] and string.find(Plr.Name:lower(), args[2]:lower()) then
			Plr.Character:MoveTo(plr.Character.HumanoidRootPart.Position)
		elseif args[1]:lower() == "kill" and args[2] then
			local Target
			for i, v in next, Plrs:GetPlayers() do
				if string.find(v.Name:lower(), args[2]:lower()) then
					Target = v
				end
			end
			if not Target then return end
			local hand = Plr.Character.RightHand
			hand.Anchored = true
			local old = hand.Size
			hand.Size = Vector3.new(2, 2, 2)
			local wrist = hand:FindFirstChild("RightWrist")
			local vals = {C0 = wrist.C0, C1 = wrist.C1, Part0 = wrist.Part0, Part1 = wrist.Part1, CurrentAngle = wrist.CurrentAngle, DesiredAngle = wrist.DesiredAngle}
			pcall(function()
			    --Plr.Character.RagdollConstraints.HRL:Destroy()
		    end)
			pcall(function()
				wrist:Destroy()
			end)
			repeat wait()
				hand.CFrame = Target.Character.UpperTorso.CFrame
				hand.Position = Target.Character.UpperTorso.Position
			until Target.Character.BodyEffects["K.O"].Value
			print("hi")
			hand.Size = old
			hand.Anchored = false
			wrist = Instance.new("Motor6D", hand)
			for i in next, vals do
				print(vals[i])
				wrist[i]=vals[i]
			end
			wrist.Name = ("RightWrist")
		end
	end
end