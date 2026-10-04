advancement revoke @s only craftable_spawners:craft/uncondense_seagrass/end
execute unless score @s cs.recipe matches 104 run return fail
function craftable_spawners:resolve/uncondense_seagrass
function craftable_spawners:reset
