local msg = "DEFAULT"

AddEventHandler('playerDropped', function(name)
    local src = source
    if not name or not Config.DefaultEvents["playerDropped"]["enabled"] then
        return
    end 

    Server.SendWebhook(src, 'playerDropped', msg)
end)

AddEventHandler('playerConnecting', function(reason)
    local src = source

    if not reason or not Config.DefaultEvents["playerConnecting"]["enabled"] then
        return
    end 
	
    Server.SendWebhook(src, "playerConnecting", msg)
end)


