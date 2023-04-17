local msg = "DEFAULT"

AddEventHandler('onClientResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
        if Config.DefaultEvents['resource_start']['enabled'] then
            TriggerServerEvent("vc_logs:sendWebhook", GetPlayerServerId(PlayerId()), "resource_start", msg, "default")
        end
    end

    return
end)

AddEventHandler('onClientResourceStop', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
        if Config.DefaultEvents['resource_stop']['enabled'] then
            TriggerServerEvent("vc_logs:sendWebhook", GetPlayerServerId(PlayerId()), "resource_stop", msg, "default")
        end
    end

    return
end)