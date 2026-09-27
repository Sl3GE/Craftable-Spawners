advancement revoke @s only craftable_spawners:place_spawner
data remove storage craftable_spawners:tmp place
execute if items entity @s weapon.mainhand minecraft:spawner[minecraft:custom_data~{craftable_spawners:{}}] run data modify storage craftable_spawners:tmp place.id set from entity @s SelectedItem.components."minecraft:custom_data".craftable_spawners.spawner
execute unless data storage craftable_spawners:tmp place.id if items entity @s weapon.offhand minecraft:spawner[minecraft:custom_data~{craftable_spawners:{}}] run data modify storage craftable_spawners:tmp place.id set from entity @s equipment.offhand.components."minecraft:custom_data".craftable_spawners.spawner
execute unless data storage craftable_spawners:tmp place.id run return fail
data modify storage craftable_spawners:tmp place.path set string storage craftable_spawners:tmp place.id 10
scoreboard players set #steps cs.tmp 0
execute anchored eyes positioned ^ ^ ^ run function craftable_spawners:place/ray with storage craftable_spawners:tmp place
