# Removes -#r mutton, from the cursor first, then from the inventory.
scoreboard players set #want cs.tmp 0
scoreboard players operation #want cs.tmp -= #r cs.tmp
execute store result score #k cs.tmp if items entity @s player.cursor minecraft:mutton[!minecraft:custom_data]
scoreboard players operation #k cs.tmp < #want cs.tmp
scoreboard players operation #want cs.tmp -= #k cs.tmp
execute if score #k cs.tmp matches 1.. run scoreboard players set #cursor cs.tmp 1
execute store result storage craftable_spawners:tmp take.k int -1 run scoreboard players get #k cs.tmp
execute if score #k cs.tmp matches 1.. run function craftable_spawners:take/cursor with storage craftable_spawners:tmp take
execute if score #want cs.tmp matches ..0 run return 0
execute store result storage craftable_spawners:tmp take.n int 1 run scoreboard players get #want cs.tmp
execute store result score #k cs.tmp run function craftable_spawners:take/clear/mutton with storage craftable_spawners:tmp take
scoreboard players operation #want cs.tmp -= #k cs.tmp
execute if score #want cs.tmp matches 1.. run scoreboard players operation @s cs.debt += #want cs.tmp
execute if score #want cs.tmp matches 1.. run scoreboard players set @s cs.debt_item 41
