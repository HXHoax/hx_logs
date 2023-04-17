
# Valac's FiveM Logs

I have developed a script that logs things to the discord. This script is easy to use once you have read the documentation. You can add triggers in the config and they are automatically added to the log system. 

# Exports

```lua
exports["vc_logs"]:sendWebhook(source, event, description, eventType)
    PARAMS: 
    1. source = Player Network ID
    2. event = Target eventType
    3. description = Set to "DEFAULT"
    4. eventType = types: "base" "esx" "default"
```

## Deployment

Clone or download this github project.

```bash
  Drag "vc_logs-main" to youre resources folder.
  Put "ensure vc_logs-main" in youre server.cfg
```




## For Support Add Discord

- Valaccc#8793


## Usage/Examples

```lua
-- Add Trigger To Logs in the Config.lua
 ["esx_ambulancejob:revive"] = {
     ['url'] = "WEBHOOK HERE"
 },
```


## Contributing

Contributions are always welcome!

