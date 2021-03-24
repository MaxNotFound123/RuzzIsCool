local c = game:GetObjects("rbxassetid://465019379")[1]
local Plr = game:GetService("Players").LocalPlayer
local OLDPOS = Plr.Character.HumanoidRootPart.CFrame
c.Parent = game:GetService("Workspace")
c.CanCollide = false
c.Size = Vector3.new(10, 10, 10)
local b = Instance.new("BodyVelocity", c)
local fire = Instance.new("Fire", c)
fire.Size = 20
b.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
c.CFrame = CFrame.lookAt(Vector3.new(-742, 69, -857), Vector3.new(-727.896057, -39.5578842, -887.724976))
b.Velocity = (c.CFrame * CFrame.new(0, 0, -10)).p - c.CFrame.p
local campart = Instance.new("Part", game:GetService("Workspace"))
campart.Transparency = 1
campart.Anchored = true
campart.Position = Vector3.new(-727.896057, -39.5578842, -887.724976)
campart.CanCollide = false
local m = 0
local cc = game:GetService("Workspace").CurrentCamera
local old = cc.CameraSubject
cc.CameraSubject = campart
cc.Focus = CFrame.new(-727.896057, -39.5578842, -887.724976)
repeat game:GetService("RunService").Stepped:wait()
    m = m + 1
    cc.CFrame = CFrame.lookAt(Vector3.new(-727.896057, -39.5578842, -887.724976)+Vector3.new(math.sin(math.rad(m)), (m/1000), math.cos(math.rad(m))), Vector3.new(-727.896057, -39.5578842, -887.724976))
until c.CFrame.p.Y < -39.5578842
c.Anchored = true
Plr.Character.HumanoidRootPart.CFrame = c.CFrame
local Exp = Instance.new("Explosion", game:GetService("Workspace"))
Exp.Position = Vector3.new(-727.896057, -39.5578842, -887.724976)
Exp.DestroyJointRadiusPercent = 0
Exp.BlastPressure = 1e5
for i = -39, 50, 5 do
    wait()
    Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-727.896057, i, -887.724976)
    Plr.Character.Humanoid:ChangeState(11)
end
b:Destroy()
wait(2)
fire:Destroy()
game:GetService("Debris"):AddItem(c, 5)
game:GetService("Debris"):AddItem(campart, 5)
cc.CameraSubject = old
for i = 50, 200, 10 do
    game:GetService("RunService").Stepped:wait()
    Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-727.896057, i, -887.724976)
    Plr.Character.Humanoid:ChangeState(11)
end
local distance = OLDPOS.p - Plr.Character.HumanoidRootPart.CFrame.p
for i = 1, 100 do
    game:GetService("RunService").Stepped:wait()
    Plr.Character.HumanoidRootPart.CFrame = CFrame.lookAt(Plr.Character.HumanoidRootPart.CFrame.p + (distance/100), OLDPOS.p)*CFrame.Angles(math.rad(-90), 0, 0)
    Plr.Character.Humanoid:ChangeState(11)
end
