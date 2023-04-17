local PlayerData = {}
local msg = "DEFAULT"

if not Config.Settings["use_esx"] then
    return
end

Citizen.CreateThread(function()
    while true do
        Wait(10)
        PlayerData = ESX.GetPlayerData()
    end
end)

for k,v in pairs(Config.ESXTriggers["client_list"]) do
    RegisterNetEvent(k)
    AddEventHandler(k, function(source)
    
    if Config.ESXTriggers['extra_data'] then
        msg = "**Extra Player Data** \n > Player Name: ``" .. PlayerData.name .. "`` \n > Money: ``" .. PlayerData.money .. "``\n > Dirty Money: ``" .. PlayerData.accounts[1].money .. "``\n > Bank Money: ``" .. PlayerData.accounts[3].money .. "`` \n \n"
        return TriggerServerEvent("vc_logs:sendWebhook", source, k, msg, "esx")
    end 
    
    return TriggerServerEvent("vc_logs:sendWebhook", source, k, msg, "esx")
    end)
end