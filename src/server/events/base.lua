if not Config.BaseTriggers['enabled'] then
    return
end

for k,v in pairs(Config.BaseTriggers["server_list"]) do
    AddEventHandler(k, function()
        local src = source
        TriggerEvent("vc_logs:sendWebhook", src, k, "DEFAULT", "base")
        
        Wait(1000)
        return
    end)
end