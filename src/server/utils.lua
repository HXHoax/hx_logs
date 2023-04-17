Utils = {}

function Utils.GetLogWebhook(event, eventType)
   if eventType == "default" then
      return Config.DefaultEvents[event]['url']
   end

   if eventType == "esx" then
      if Config['Settings']['seperated_channels'] then
         -- Loop through Client Event list and Returns if true
         for k, v in pairs(Config.ESXTriggers['client_list']) do
            if k == event then
               return Config.ESXTriggers['client_list'][k]['url']
            end
         end

         -- Loop through Server Event list and Returns if true
         for k, v in pairs(Config.ESXTriggers['server_list']) do
            if k == event then
               return Config.ESXTriggers['server_list'][k]['url']
            end
         end
         
         if Config.ESXTriggers['url'] == "" then
            return print("The're has been an error while getting webhook information.")            
         end

         return Config.ESXTriggers['url']
      end
   end

   if eventType == "base" then
      if Config['Settings']['seperated_channels'] then
         for k, v in pairs(Config.BaseTriggers['client_list']) do
            if k == event then
               return Config.BaseTriggers['client_list'][k]['url']
            end
         end

         -- Loop through Server Event list and Returns if true
         for k, v in pairs(Config.BaseTriggers['server_list']) do
            if k == event then
               return Config.BaseTriggers['server_list'][k]['url']
            end
         end

         if Config.BaseTriggers['url'] == "" then
            return print("The're has been an error while getting webhook information.")            
         end

         return Config.BaseTriggers['url']
      end
   end

   return Config['Settings']['default_webhook']
end


function Utils.IdentifierList(source)
   local identifiers = {}

   if Config.Identifiers['discord'] then
      identifiers.discord = Utils.PlayerIdentifier("discord", source) or "NOT FOUND"
   else
      identifiers.discord = "Disabled"
   end

   if Config.Identifiers['steam'] then
      identifiers.steam = Utils.PlayerIdentifier("steam", source) or "NOT FOUND"
   else
      identifiers.steam = "Disabled"
   end

   if Config.Identifiers['license'] then
      identifiers.license = Utils.PlayerIdentifier("license", source) or "NOT FOUND"
   else
      identifiers.license = "Disabled"
   end

   if Config.Identifiers['endpoint'] then
      identifiers.endpoint = GetPlayerEndpoint(source) or "NOT FOUND"
   else
      identifiers.endpoint = "Disabled"
   end

   if Config.Identifiers['player_token'] then
      identifiers.token = GetPlayerToken(source, 0) or "NOT FOUND"
   else
      identifiers.token = "Disabled"
   end

   Wait(10)
   return identifiers
end

function Utils.PlayerIdentifier(type, id)
   local identifiers = {}
   local numIdentifiers = GetNumPlayerIdentifiers(id)

   for a = 0, numIdentifiers do
      table.insert(identifiers, GetPlayerIdentifier(id, a))
   end

   for b = 1, #identifiers do
      if string.find(identifiers[b], type, 1) then
         return identifiers[b]
      end
   end
   return nil
end