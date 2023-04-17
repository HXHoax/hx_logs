local player
local msg = "DEFAULT"

if not Config.Settings["use_esx"] then
   return
end

for k,v in pairs(Config.ESXTriggers["server_list"]) do
   RegisterServerEvent(k)
   AddEventHandler(k, function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if not src then
       return print("xPlayer = Nil")
    end
   
    if Config.ESXTriggers['extra_data'] then
       msg = "**Extra Player Data** \n > Player Name: ``" .. xPlayer.getName() .. "``\n > Player Group ``" .. xPlayer.getGroup() .. "``\n > Money: ``" .. xPlayer.getMoney() .. "``\n > Dirty Money: ``" .. xPlayer.getAccount("black_money").money .. "``\n > Bank Money ``" .. xPlayer.getAccount("bank").money .. "`` \n \n"
       TriggerEvent("vc_logs:sendWebhook", src, k, msg, "esx")
       return
    end
   
    TriggerEvent("vc_logs:sendWebhook", src, k, msg, "esx")
    return
   end)
end