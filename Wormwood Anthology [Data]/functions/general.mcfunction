## Team Wormwood - 2022
## Run from [ */tick.json ]

#

## The Fury of Wormwood
execute @a[tag =! initialised] ~ ~ ~ scoreboard objectives add ammunition.CAR dummy
execute @a[tag =! initialised] ~ ~ ~ scoreboard objectives add ammunition.LaPi dummy
execute @a[tag =! initialised] ~ ~ ~ scoreboard objectives add ammunition.OZT dummy
execute @a[tag =! initialised] ~ ~ ~ scoreboard objectives add ammunition.LVA dummy

tag @a add initialised

scoreboard players set @a[tag =! initialised] ammunition.CAR 24
scoreboard players set @a[tag =! initialised] ammunition.LaPi 20
scoreboard players set @a[tag =! initialised] ammunition.OZT 3
scoreboard players set @a[tag =! initialised] ammunition.LVA 8

#

    ## Chinese Assault Rifle ##
event entity @a[ scores = { ammunition.CAR = 0 } ] modified_player:set_client_flag.chinese_assault_rifle_empty

event entity @a[ scores = { ammunition.CAR = 1..24 } ] modified_player:set_client_flag.chinese_assault_rifle_full

    ## Laser Pistol ##
event entity @a[ scores = { ammunition.LaPi = 0 } ] modified_player:set_client_flag.laser_pistol_empty

event entity @a[ scores = { ammunition.LaPi = 1..20 } ] modified_player:set_client_flag.laser_pistol_full

    ## Ozutsu ##
event entity @a[ scores = { ammunition.OZT = 0 } ] modified_player:set_client_flag.ozutsu_empty

event entity @a[ scores = { ammunition.OZT = 1..3 } ] modified_player:set_client_flag.ozutsu_full

    ## Lever-Action Rifle ##
event entity @a[ scores = { ammunition.LVA = 0 } ] modified_player:set_client_flag.lever_action_rifle_empty

event entity @a[ scores = { ammunition.LVA = 1..8 } ] modified_player:set_client_flag.lever_action_rifle_full