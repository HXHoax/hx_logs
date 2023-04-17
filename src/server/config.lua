Config = {}

Config.Settings = {
    ['embed'] = true, -- Dont turn this off
    ['use_esx'] = true, -- True if you're using ESX else on false
    ['seperated_channels'] = true, -- Turn this on if you want a different channel for each log.
    ['default_webhook'] = "", -- Set a default webhook for when an error accurs
}

Config.Identifiers = {
    -- Log identifiers | true is on | false is off
    ['discord'] = true,
    ['steam'] = true,
    ['license'] = true,
    ['endpoint'] = false, -- Not recommended
    ['player_token'] = true
}

Config.DefaultEvents = {
    ['shooting'] = {
        ['enabled'] = true,
        ['url'] = "" -- When player is shooting
    },

    ['resource_start'] = {
        ['enabled'] = true,
        ['url'] = "" -- When player is shooting
    },

    ['resource_stop'] = {
        ['enabled'] = true,
        ['url'] = "" -- When player is shooting
    },
    
    ['spectate'] = {
        ['enabled'] = true,
        ['url'] = "" -- When player is in spectate mode
    },

    ['godmode'] = {
        ['enabled'] = true,
        ['url'] = "" -- When player has godmode
    },


    ['playerDropped'] = { -- When player is disconnected
        ['enabled'] = true,
        ['url'] = ""
    },
    
    ['playerConnecting'] = { -- When player is connecting
        ['enabled'] = true,
        ['url'] = ""
    },
}

Config.BaseTriggers = {
    ['enabled'] = true,  -- Set this to false to disable the base events
    ['url'] = "", -- If ['seperated_channels'] is disabled

    ['client_list'] = {
            ["baseevents:onPlayerDied"] = { -- When player is dead
                ['url'] = ""
            },
            ["baseevents:onPlayerKilled"] = { -- When player is killed
                ['url'] = ""
            },
            ["baseevents:onPlayerWasted"] = { -- When player is wasted
                ['url'] = ""
            },
        },

    ['server_list'] = {
        ["baseevents:enteringVehicle"] = { -- When player is entering a vehicle
            ['url'] = ""
        },

        ["baseevents:enteredVehicle"] = { -- When player is entered a vehicle
            ['url'] = ""
        },

        ["baseevents:leftVehicle"] = { -- When player is left a vehicle
            ['url'] = ""
        },
    }
}

Config.ESXTriggers = { -- You can also sit a non esx trigger down here if ESX is enabled in the config. This will allow you to get more data.
    ['enabled'] = true, -- Set this to false to disable the esx events
    ['extra_data'] = true, -- Set this to false to disable extra data in logs
    
    ['url'] = "", -- If ['seperated_channels'] is disabled
    ['client_list'] = {
        -- Job Triggers, NoClip Triggers, Shoot Triggers, Triggers that are used from the client side.

        -- @ EXAMPLE
        ["esx_ambulancejob:revive"] = {
            ['url'] = "WEBHOOK HERE"
        },
    },

    ['server_list'] = {
        -- Money Triggers, Pay Triggers, Trigger that are used from the server side.
        -- @ EXAMPLE
        ["esx_shops:buyItem"] = {
            ['url'] = "WEBHOOK HERE"
        },
    }
}

Config.DiscordEmbed = {
    ['color'] = '16753920',
    ["title"] = "Valac's Logs",
    ["footer"] = {
        ["text"] = "Valac's Logs System",
    },
}