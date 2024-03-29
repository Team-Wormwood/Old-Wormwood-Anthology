## Team Wormwood - 2022
## Run from [ */tick.json ]

##

## The Fury of Wormwood
execute @a[tag =! initialised.FoW] ~ ~ ~ scoreboard objectives add ammunition.CAR dummy
execute @a[tag =! initialised.FoW] ~ ~ ~ scoreboard objectives add ammunition.LaPi dummy
execute @a[tag =! initialised.FoW] ~ ~ ~ scoreboard objectives add ammunition.OZT dummy
execute @a[tag =! initialised.FoW] ~ ~ ~ scoreboard objectives add ammunition.LVA dummy
execute @a[tag =! initialised.FoW] ~ ~ ~ scoreboard objectives add ammunition.COL dummy
execute @a[tag =! initialised.FoW] ~ ~ ~ scoreboard objectives add ammunition.T51C dummy

tag @a add initialised.FoW

scoreboard players set @a[tag =! initialised.FoW] ammunition.CAR 24
scoreboard players set @a[tag =! initialised.FoW] ammunition.LaPi 20
scoreboard players set @a[tag =! initialised.FoW] ammunition.OZT 3
scoreboard players set @a[tag =! initialised.FoW] ammunition.LVA 8
scoreboard players set @a[tag =! initialised.FoW] ammunition.COL 6
scoreboard players set @a[tag =! initialised.FoW] ammunition.T51C 18

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

    ## Colt ##
event entity @a[ scores = { ammunition.COL = 0 } ] modified_player:set_client_flag.colt_empty

event entity @a[ scores = { ammunition.COL = 1..6 } ] modified_player:set_client_flag.colt_full

    ## T-51 Carbine ##
event entity @a[ scores = { ammunition.T51C = 0 } ] modified_player:set_client_flag.type_51_carbine_empty

event entity @a[ scores = { ammunition.T51C = 1..18 } ] modified_player:set_client_flag.type_51_carbine_full


## Howling Depths
execute @a[tag=!initialised.HD] ~ ~ ~ scoreboard objectives add mood.timer dummy
execute @a[tag=!initialised.HD] ~ ~ ~ scoreboard objectives add mood.overlook dummy
execute @a[tag=!initialised.HD] ~ ~ ~ scoreboard objectives add mood.modifier dummy

tag @a add initialised.HD

    ## "Mood" ##
    ## Intend on making all this . . . "Data-Driven", fully configurable and accessible, so that other in-game events and such can influence this without too much of a hassle.
scoreboard players set @a[tag=!initialised.HD] mood.timer 2000
scoreboard players set @a[tag=!initialised.HD] mood.overlook 200

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
execute @a[tag=!initialised.general] ~ ~ ~ scoreboard objectives add cassette.num dummy
execute @a[tag=!initialised.general] ~ ~ ~ scoreboard objectives add hasitem dummy

tag @a[tag=!initialised.general] add initialised.general

    ## Tape Player ##
    ## `hasitem=!{...}` throws up errors, so have to use this mess as a workaround. Scoreboards.
scoreboard players set @a[hasitem={item=wormwood:tape_player,location=slot.weapon.offhand}] hasitem 2

scoreboard players add @a[ scores = { hasitem = 1.. } ] hasitem -1

execute @a[ scores = { hasitem = 0 }, tag=cassette.playing ] ~ ~ ~ function cassettes.return

tag @a[ scores = { hasitem = 0 }, tag=cassette.playing ] remove cassette.playing


## World Beyond
## This broke after updating at one point. 
##execute @a[tag =! initialised.WB] ~ ~ ~ scoreboard objectives add boots.charges dummy
##execute @a[tag =! initialised.WB] ~ ~ ~ scoreboard objectives add boots.recharge dummy
##execute @a[tag =! initialised.WB] ~ ~ ~ scoreboard objectives add boots.can_charge dummy
##
##tag @a[tag =! initialised.WB] add initialised.WB
##
##scoreboard players set @a[tag =! initialised.WB] boots.charges 8
##scoreboard players set @a[tag =! initialised.WB] boots.recharge 20
##scoreboard players set @a[tag =! initialised.WB] boots.can_charge 2
##
##execute @a ~ ~ ~ detect ~ ~-1 ~ air -1 scoreboard players set @s boots.can_charge 0
##execute @a ~ ~ ~ detect ~ ~-1 ~ dirt -1 scoreboard players set @s boots.can_charge 0
##execute @a ~ ~ ~ detect ~ ~-1 ~ air -1 scoreboard players set @s boots.recharge 20
##execute @a ~ ~ ~ detect ~ ~-1 ~ dirt -1 scoreboard players set @s boots.recharge 20
##
##scoreboard players add @a boots.can_charge 1
##
##scoreboard players add @a[ scores = { boots.can_charge = 2, boots.recharge = 1..  } ] boots.recharge -1
##scoreboard players add @a[ scores = { boots.recharge = 0, boots.charges = ..7  } ] boots.charges 1
##scoreboard players set @a[ scores = { boots.recharge = 0  } ] boots.recharge 20
##
##execute @a[ scores = { boots.charges = 1.. }, tag = is_sneaking, hasitem = { item = wormwood:cool_end_boots, location = slot.armor.feet } ] ~ ~ ~ detect ~ ~-1 ~ air -1 scoreboard players add @s boots.charges -1
##execute @a[ scores = { boots.charges = 1.. }, tag = is_sneaking, hasitem = { item = wormwood:cool_end_boots, location = slot.armor.feet } ] ~ ~ ~ detect ~ ~-1 ~ air -1 setblock ~ ~-1 ~ dirt 0


## Development
## Really cannot remember if this works. Will re-visit soon
##execute @a[tag =! initialised.dev] ~ ~ ~ scoreboard objectives add doing_worldgen dummy
##
##tag @a[tag =! initialised.dev] add initialised.dev
##
##scoreboard players set @a[tag =! initialised.dev] doing_worldgen 0
##
##execute @a[ scores = { doing_worldgen = 1.. } ] ~ ~ ~ function development/worldgen/clear1
##execute @a[ scores = { doing_worldgen = 2.. } ] ~ ~ ~ function development/worldgen/clear2
##execute @a[ scores = { doing_worldgen = 3.. } ] ~ ~ ~ function development/worldgen/clear3
##execute @a[ scores = { doing_worldgen = 4.. } ] ~ ~ ~ function development/worldgen/clear4