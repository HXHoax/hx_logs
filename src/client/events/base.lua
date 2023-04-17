if not Config.BaseTriggers['enabled'] then
    return
end

for k,v in pairs(Config.BaseTriggers["client_list"]) do
    RegisterNetEvent(k)
    AddEventHandler(k, function(source)
        TriggerServerEvent("vc_logs:sendWebhook", GetPlayerServerId(PlayerId()), k, "DEFAULT", "base")

        Wait(1000)
        return
    end)
end