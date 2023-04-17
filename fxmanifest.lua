fx_version "cerulean"
game "gta5"
version "1.0.0"
author 'Valaccc#8793'
description "VC Logs - Extended Log System"

server_scripts {
    'src/server/server.lua',
    'src/server/events/player.lua',
    'src/server/events/game.lua',
    'src/server/events/esx.lua',
    'src/server/events/base.lua',
    'src/server/utils.lua'
}

shared_script 'src/server/config.lua'
shared_script '@es_extended/imports.lua' -- Delete when not using ESX Final

client_scripts {
    "src/client/*.lua",
    'src/client/events/game.lua',
    'src/client/events/esx.lua',
    'src/client/events/base.lua',
    'src/client/events/resource.lua',
}