-- /// Credits:
--[[ Gelatekussy (Owner of GelatekHub)
]]

local Global = (getgenv and getgenv()) or shared
Global.GelatekHubConfig = {
	["Permanent Death"] = true,
	["Torso Fling"] = false,
	["Bullet Enabled"] = false,
	["Enable Collisions"] = false,
	["Keep Hats On Head"] = true,
	["Headless On Perma"] = false,
	["Anti Void"] = false,
	["Anti Void Offset"] = 75
}

local function Send(message)
	game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/packages/FunctionPack.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekHub/main/src/lib/Reanimate.lua"))()

task.delay(6.25, function()
	Send("-net
end)