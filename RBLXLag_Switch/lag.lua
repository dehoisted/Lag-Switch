-- lag.lua: code for lagging player
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
