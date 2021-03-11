-- main.lua
-- the full script
local keybinds = 
                  {["Rejoin"] = "Rejoins the game",
                  ["Server Hop"] = "Teleports to random local server"}
              
--Press 'P' to rejoin the game
discord1 = "orlando#1337"
-- check.lua
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
    error("Use Synapse u skid")
    return
end


-- Main
args = 15 -- (lower = less lag)
print("-----     -----")
print("Lag Switch 1.2")
print("Made by "..discord1.." on discord")
print("Press 'P' to rejoin the game")
print("Current Replication Lag = "..args)
print("-----     -----");

-- gui.lua
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 0.388235, 0.368627)
Frame.BorderColor3 = Color3.new(0.67451, 0.211765, 0.152941)
Frame.Position = UDim2.new(0.293040276, 0, 0.491666675, 0)
Frame.Size = UDim2.new(0.106227107, 0, 0.0833333284, 0)
Frame.Active = true
Frame.Draggable = true
TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundTransparency = 0.80000001192093
TextButton.Position = UDim2.new(0.103524067, 0, 0.200333327, 0)
TextButton.Size = UDim2.new(0.793684483, 0, 0.601000011, 0)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "On/Off"
TextButton.TextScaled = true
TextButton.TextSize = 14
TextButton.TextWrapped = true

TextButton.MouseButton1Click:Connect(function()
    --main.lua
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
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
    if (key=="p") then
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
      gcinfo()
      collectgarbage("count")
    end
end)
