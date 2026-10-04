advancement revoke @s only craftable_spawners:craft/condense_cactus/end
execute unless score @s cs.recipe matches 45 run return fail
function craftable_spawners:resolve/condense_cactus
function craftable_spawners:reset
