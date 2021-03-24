repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character
local plr = game.Players.LocalPlayer
local BodyEffects = Instance.new("Folder", plr.Character); BodyEffects.Name = "BodyEffects"
local Movement = Instance.new("Folder", BodyEffects); Movement.Name = "Movement"
local SpecialParts = Instance.new("Folder", BodyEffects); SpecialParts.Name = "SpecialParts"
local Attacking = Instance.new("BoolValue", BodyEffects); Attacking.Name = "Attacking"; Attacking.Value = false
local Defense = Instance.new("NumberValue", BodyEffects); Defense.Value = 100; Defense.Name = "Defense"
local CurrentBlockTime = Defense:Clone(); CurrentBlockTime.Value = 0; CurrentBlockTime.Name = "CurrentTimeBlock"
local Dead = Attacking:Clone(); Dead.Name = "Dead"
local GunFiring = Attacking:Clone(); GunFiring.Name = "GunFiring"
local Grabbed = Instance.new("ObjectValue", BodyEffects); Grabbed.Name = "Grabbed"; Grabbed.Value = nil
local Reload = Attacking:Clone(); Reload.Name = "Reload"
local Shop = Attacking:Clone(); Shop.Name = "Shop"
local Calling = Attacking:Clone(); Calling.Name = "Calling"
local CallFrom = Grabbed:Clone(); CallFrom.Name = "CallFrom"
local Anonymous = Attacking:Clone(); Anonymous.Name = "Anonymous"
local ShoesCollect = Instance.new("IntValue", BodyEffects); ShoesCollect.Name = "ShoesCollect"; ShoesCollect.Value = 50
local Cuff = Attacking:Clone(); Cuff.Name = "Cuff"
local HospitalJob = Intance.new("StringValue", BodyEffects); HospitalJob.Name = "HospitalJob"
local MousePos = Instance.new("Vector3Value", BodyEffects); MousePos.Name = "MousePos"; MousePos.Value = Vector3.new(0, 0, 0)
local GunShotChanges = ShoesCollect:Clone(); GunShotChanges.Name = "GunShotChanges"; GunShotChanges.Value = 0
local Armor = ShoesCollect:Clone(); Armor.Name = "Armor"; Armor.Value = 0; Armor.Name = "Armor"
local Mask = HospitalJob:Clone(); Mask.Name = "Mask"
local CANBATTLE = Attacking:Clone(); CANBATTLE.Name = "CANBATTLE"