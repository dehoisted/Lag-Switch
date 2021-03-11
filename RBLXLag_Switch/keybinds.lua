-- keybinds.lua
game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
    if (key=="p") then
      game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
      gcinfo()
      collectgarbage("count")
    end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
	if (key=="u") then
		local x = {}
		for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
			if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
				x[#x + 1] = v.id
			end
		end
		if #x > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
		else
			return notify("Serverhop","Couldn't find a server.")
		end
	end
end)
