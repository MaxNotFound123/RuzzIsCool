local Plr = game.Players.LocalPlayer 
local sethands = false

mouse = Plr:GetMouse()
mouse.KeyDown:connect(function()
if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.N) then
    if sethands then sethands = false else sethands = true end
        if Plr.Character:FindFirstChild("part") and not sethands then Plr.Character.part:Destroy() end 
    
    local Hand = Plr.Character.RightHand
    local HRPPosition = Plr.Character.HumanoidRootPart.CFrame
    local HandPosition = Hand.Position
    local HandCFrame = Hand.CFrame
    
    if Hand:FindFirstChild("RightWrist") then
    	Hand.RightWrist:Destroy()
    end

    wait(1)
    run = false
    Plr.Character.HumanoidRootPart.CFrame = HRPPosition
    wait()
    Hand.Position = HandPosition
    Hand.CFrame = HandCFrame
    wait(0.1)
    if sethands then
        local part = Instance.new("Part")
        part.Name = "part"
        part.Size = Vector3.new(1, 1, 1)
        part.CFrame = HandCFrame
        part.Parent = Plr.Character
        part.Anchored = true
        local RightWrist = Instance.new("Weld", Hand)
        RightWrist.Part0 = Hand
        RightWrist.Part1 = Plr.Character.RightLowerArm
        RightWrist.C0 = CFrame.new(0.0682975054, -0.450790346, -0.204141855, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        RightWrist.C1 = CFrame.new(-0.0443148613, 0.233287811, 0.124126196, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        RightWrist.Name = ("RightWrist")
    end
end
end)
  
    
    
