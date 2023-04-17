local msg = "DEFAULT"

Citizen.CreateThread(function()
    while true do
       Wait(0)
       local found, currentWeapon = GetCurrentPedWeapon(GetPlayerPed(-1), false)
       local ped = PlayerPedId()
    
       if Config.DefaultEvents['shooting'] then
          if IsPedShooting(ped) then
             msg = "**Weapon Data** \n > Current Weapon ``" .. currentWeapon .. "`` \n > Ammo in Weapon: ``" .. GetAmmoInPedWeapon(ped, currentWeapon) .. "`` \n\n"
             TriggerServerEvent("vc_logs:sendWebhook", GetPlayerServerId(PlayerId()), "shooting", msg, "default")
          end
       end

       if Config.DefaultEvents['spectate'] then
         if NetworkIsInSpectatorMode() then
            TriggerServerEvent("vc_logs:sendWebhook", GetPlayerServerId(PlayerId()), "spectate", msg, "default")
         end
       end

       if Config.DefaultEvents['godmode'] then
         if not GetEntityCanBeDamaged(ped) then
            TriggerServerEvent("vc_logs:sendWebhook", GetPlayerServerId(PlayerId()), "godmode", msg, "default")
         end
       end
         Wait(1000)
    end
end)