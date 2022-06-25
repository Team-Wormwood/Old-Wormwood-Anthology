## Team Wormwood - 2022

## The Fury of Wormwood
execute @a[tag=!initialised] ~ ~ ~ scoreboard objectives add ammunition.CAR dummy
execute @a[tag=!initialised] ~ ~ ~ scoreboard objectives add ammunition.LaPi dummy
scoreboard players set @a[tag=!initialised] ammunition.CAR 24
scoreboard players set @a[tag=!initialised] ammunition.LaPi 20


tag @a add initialised

event entity @a[ scores = { ammunition.CAR = 0 } ] modified_player:set_client_flag.chinese_assault_rifle_empty

event entity @a[ scores = { ammunition.CAR = 1..24 } ] modified_player:set_client_flag.chinese_assault_rifle_full


event entity @a[ scores = { ammunition.LaPi = 0 } ] modified_player:set_client_flag.laser_pistol_empty

event entity @a[ scores = { ammunition.LaPi = 1..20 } ] modified_player:set_client_flag.laser_pistol_full