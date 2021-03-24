local ESPholder = Instance.new("Folder", game.CoreGui)
function cham(object)
    if object.Name == "MoneyDrop" then
        local a = Instance.new("BoxHandleAdornment", ESPholder)
        a.Adornee = object
        a.AlwaysOnTop = true
        a.ZIndex = 10
        a.Size = object.Size
        a.Transparency = 0.3
        a.Color = object.BrickColor
        local bill = object:WaitForChild("BillboardGui")
        bill.AlwaysOnTop = true
        bill.Size = UDim2.new(2, 10, 1, 5)
        spawn(function()
            while true do
                if object.Parent.ChildRemoving:wait() == object then
                    a:Destroy()
                    break
                end
            end
        end)
    end
end
for i, v in next, game.Workspace.Ignored.Drop:GetChildren() do
    cham(v)
end
game.Workspace.Ignored.Drop.ChildAdded:connect(cham)
