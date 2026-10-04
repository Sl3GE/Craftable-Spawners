advancement revoke @s only craftable_spawners:craft/uncondense_cactus/end
execute unless score @s cs.recipe matches 106 run return fail
function craftable_spawners:resolve/uncondense_cactus
function craftable_spawners:reset
