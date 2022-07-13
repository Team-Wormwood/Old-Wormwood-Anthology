## Team Wormwood - 2022
## Function to trigger when using a Cassette Item while the Tape Player is equipped in the Offhand, and whenever the Tape Player is removed from the Offahnd.

## Return Item
execute @s[ scores = { cassette.num = 0 } ] ~ ~ ~ function cassettes/test
execute @s[ scores = { cassette.num = 1 } ] ~ ~ ~ function cassettes/test_1

## Stop Music
stopsound @s cassette.test.0
stopsound @s cassette.test.1