data remove storage craftable_spawners:tmp drop
data modify storage craftable_spawners:tmp drop.id set from entity @s Item.components."minecraft:custom_data".craftable_spawners.dropped
execute unless data storage craftable_spawners:tmp drop.id run return run data remove entity @s Item.components."minecraft:custom_data"
data modify storage craftable_spawners:tmp drop.path set string storage craftable_spawners:tmp drop.id 10
function craftable_spawners:drop/apply with storage craftable_spawners:tmp drop
