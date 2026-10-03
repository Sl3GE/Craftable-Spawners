execute if score #debt cs.tmp matches ..0 run return fail
execute unless data entity @s Thrower run return fail
execute store result score #k cs.tmp run data get entity @s Age
execute if score #k cs.tmp matches 3.. run return fail
data modify storage craftable_spawners:tmp debt.cmp set from storage craftable_spawners:tmp debt.uuid
execute store success score #k cs.tmp run data modify storage craftable_spawners:tmp debt.cmp set from entity @s Thrower
execute if score #k cs.tmp matches 1 run return fail
execute store result score #k cs.tmp run data get entity @s Item.count
execute if score #k cs.tmp <= #debt cs.tmp run return run function craftable_spawners:debt/kill
scoreboard players operation #k cs.tmp -= #debt cs.tmp
execute store result entity @s Item.count int 1 run scoreboard players get #k cs.tmp
scoreboard players set #debt cs.tmp 0
