Server = {}
local token,steam,discord,license,endpoint, desc

AddEventHandler('onResourceStart', function(resourceName)
   if (GetCurrentResourceName() ~= resourceName) then
      return
   end

   Wait(5000)
   print("^7[^4VC_LOGS^7] Has been started succesfully.")
end)

function Server.SendWebhook(source, event, description, eventType)
   local webhook = Utils.GetLogWebhook(event, eventType)

   if not webhook or webhook == nil then
      return print("The're has been an error while getting webhook data. (src/server/server.lua)")
   end
   
   local ids = Utils.IdentifierList(source)

   local name = GetPlayerName(-1)

   if not type(ids) == "table" then
      return print("The're has been an error while getting player identifiers. (src/server/server.lua)")
   end

   if not webhook or not event then
      return print("[VC_LOGS] There has been a error while trying to send the embed. Empty fields found. (src/server/server.lua) and (src/server/config.lua)")
   end

   if description == "DEFAULT" or not description then
      desc = "``Event [" .. event .. "]``\n\n > Valacc has triggerd the **" .. event .. "** event\n\n**IDENTIFIERS**\n> Steam: ``" .. ids.steam .. "`` \n> Discord: ``" .. ids.discord .. "`` \n> License: ``" ..  ids.license .. "``\n> Endpoint: ``"  .. ids.endpoint.. "``\n> Token: ``" .. ids.token .. "``"
   else
      desc = description .. " " .. "``Event [" .. event .. "]``\n\n > Valacc has triggerd the **" .. event .. "** event\n\n**IDENTIFIERS**\n> Steam: ``" .. ids.steam .. "`` \n> Discord: ``" .. ids.discord .. "`` \n> License: ``" ..  ids.license .. "``\n> Endpoint: ``"  .. ids.endpoint.. "``\n> Token: ``" .. ids.token .. "``"
   end

   local embed = {
      {
         ["color"] = Config.DiscordEmbed['color'],
         ["title"] = Config.DiscordEmbed['title'],
         ["description"] = desc,
         ["footer"] = {
            ["text"] = Config.DiscordEmbed['footer']['text'],
         },
      }
   }

   if(Config.Settings['embed']) then
      PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = embed.title, embeds = embed}), { ['Content-Type'] = 'application/json' })
   end
end

RegisterNetEvent('vc_logs:sendWebhook')
AddEventHandler('vc_logs:sendWebhook', function(source, event, description, eventType)
   return Server.SendWebhook(source, event, description, eventType)
end)

exports('sendWebhook', function(source, event, description, eventType) 
   return Server.SendWebhook(source, event, description, eventType)
end)