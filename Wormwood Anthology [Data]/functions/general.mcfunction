## Team Wormwood - 2022
## Run from [/tick.json]


## The Fury of Wormwood
execute @a[tag=!initialised] ~ ~ ~ scoreboard objectives add ammunition.CAR dummy
execute @a[tag=!initialised] ~ ~ ~ scoreboard objectives add ammunition.LaPi dummy
scoreboard players set @a[tag=!initialised] ammunition.CAR 24
scoreboard players set @a[tag=!initialised] ammunition.LaPi 20


event entity @a[ scores = { ammunition.CAR = 0 } ] modified_player:set_client_flag.chinese_assault_rifle_empty

event entity @a[ scores = { ammunition.CAR = 1..24 } ] modified_player:set_client_flag.chinese_assault_rifle_full

event entity @a[ scores = { ammunition.LaPi = 0 } ] modified_player:set_client_flag.laser_pistol_empty

event entity @a[ scores = { ammunition.LaPi = 1..20 } ] modified_player:set_client_flag.laser_pistol_full



## Howling Depths
##Intend on making all this . . . "Data-Driven", fully configurable and accessible, so that other in-game events and such can influence this without too much of a hassle.
execute @a[tag=!initialised] ~ ~ ~ scoreboard objectives add mood.timer dummy
execute @a[tag=!initialised] ~ ~ ~ scoreboard objectives add mood.overlook dummy
execute @a[tag=!initialised] ~ ~ ~ scoreboard objectives add mood.modifier dummy
scoreboard players set @a[tag=!initialised] mood.timer 2000
scoreboard players set @a[tag=!initialised] mood.overlook 200


execute @a[ scores = { mood.timer = 1.., mood.overlook = 0 } ] ~ ~ ~ scoreboard players operation @s mood.timer -= @s mood.modifier
scoreboard players set @a[ scores = { mood.timer = ..-1 } ] mood.timer 0
scoreboard players set @a[ scores = { mood.timer = 2001.. } ] mood.timer 2000

execute @a[ tag=mood.regain, scores = { mood.timer = ..1999 } ] ~ ~ ~ scoreboard players add @s mood.timer 5

execute @a[ scores = { mood.modifier = 1.., mood.overlook = 1.. } ] ~ ~ ~ scoreboard players add @s mood.overlook -1
scoreboard players set @a[ scores = { mood.modifier = ..0 } ] mood.overlook 200

tag @a[ scores = { mood.timer = ..0 } ] add despondent

tag @a[ scores = { mood.timer = 100.. } ] remove despondent

tag @a[ scores = { mood.modifier = 1.. } ] remove mood.regain


## General
tag @a add initialised