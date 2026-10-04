advancement revoke @s only craftable_spawners:craft/condense_seagrass/end
execute unless score @s cs.recipe matches 43 run return fail
function craftable_spawners:resolve/condense_seagrass
function craftable_spawners:reset
