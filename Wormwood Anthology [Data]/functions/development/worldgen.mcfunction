tellraw @s[tag =! dev.worldgen.warn] { "rawtext": [ { "text": "§aTest /nFuck /nWARNING /n This function will make certain blocks within a 15 block radius be replaced by air. The blocks whichget replaced are determined by a tier system, and you can use this function to cycle through them." } ] }

tag @s[tag =! dev.worldgen.warn] add dev.worldgen.warn

scoreboard players add @s[ scores = { doing_worldgen = 0..4 }, tag = dev.worldgen.warn ] doing_worldgen 1
scoreboard players set @s[ scores = { doing_worldgen = 4 }, tag = dev.worldgen.warn ] doing_worldgen 0

tellraw @s[ scores = { doing_worldgen = 0 }, tag = dev.worldgen.warn ] { "rawtext": [ { "text": "§aTier 1 /nBase Stones" } ] }
tellraw @s[ scores = { doing_worldgen = 1 }, tag = dev.worldgen.warn ] { "rawtext": [ { "text": "§aTier 2 /nBase Stones /nLiquids" } ] }
tellraw @s[ scores = { doing_worldgen = 2 }, tag = dev.worldgen.warn ] { "rawtext": [ { "text": "§aTier 3 /nBase Stone /nLiquids /nOther Stone" } ] }
tellraw @s[ scores = { doing_worldgen = 3 }, tag = dev.worldgen.warn ] { "rawtext": [ { "text": "§aTier 4 /nBase Stones /nLiquids /nOther Stone /nGround Cover" } ] }
tellraw @s[ scores = { doing_worldgen = 4 }, tag = dev.worldgen.warn ] { "rawtext": [ { "text": "Block Clearing Disabled" } ] }