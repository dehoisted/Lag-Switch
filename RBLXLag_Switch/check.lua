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
    error("Use Synapse u skid")
    return
end
