-- Full Script -- made by orlando

-- def.lua -- early
keybind1 = 'p'
keybind2 = 'u'

--[[
Amount of Replicated Lag
Increase it and more lag
Vice Versa
--]]

args = 15
game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Info";
        Text = "Check your dev console for information (F9)";
      })
  
-- check.lua: code for checking user before anything else
if NA_LOADED and not _G.NA_DEBUG == true then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ERROR";
        Text = "Script has already been executed!";
      })
    error("Script has already been executed!")
    return
end

pcall(function() getgenv().NA_LOADED  = true end)
if not game:IsLoaded() then
    local notLoaded = Instance.new("Message",workspace)
    notLoaded.Text = 'Script is waiting for the game to load...'
    game.Loaded:Wait()
    notLoaded:Destroy()
end

local fake = function() return 'asd' end
if not is_synapse_function(fake) then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ERROR";
        Text = "Synapse Only";
      })
    error("Use Synapse u skid")
    return
end

-- gui.lua
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(33, 158, 207)
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.293040276, 0, 0.491666675, 0)
Frame.Size = UDim2.new(0.106227107, 0, 0.0833333284, 0)
Frame.Active = true
Frame.Draggable = true
TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(33, 195, 207)
TextButton.BackgroundTransparency = 0.80000001192095
TextButton.Position = UDim2.new(0.103524067, 0, 0.200333327, 0)
TextButton.Size = UDim2.new(0.793684483, 0, 0.601000011, 0)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "On/Off"
TextButton.TextScaled = true
TextButton.TextSize = 14
TextButton.TextWrapped = true

-- lag.lua
TextButton.MouseButton1Click:Connect(function()
    if run then
        run = false
        args = 0.1
        settings():GetService("NetworkSettings").IncomingReplicationLag = args
        gcinfo()
        collectgarbage("count")
        wait(2)
        print("Stopped Lag!")
        print("Replication Lag = "..args)
    else
        args = 15
        run = true
        print("started");
        print("rep lag = "..args)
        settings():GetService("NetworkSettings").IncomingReplicationLag = args
    end
end)

-- keybinds.lua
print("** Keybinds **")
binds_num = 4
keybinds =  
{"Rejoin", "Rejoins the current lobby you are in",
"Server Hop", "Joins a random local server"} 
              
for i = 1, binds_num do
    print(keybinds[i])
end

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
    if (key==keybind1) then
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
	if (key==keybind2) then
		local x = {}
		for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
				x[#x + 1] = v.id
			end
		end
		if #x > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
		else
		return warn("Couldn't find a server")
		end
	end
end)
