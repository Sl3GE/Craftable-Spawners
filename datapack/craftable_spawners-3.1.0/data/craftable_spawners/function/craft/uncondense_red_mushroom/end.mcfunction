advancement revoke @s only craftable_spawners:craft/uncondense_red_mushroom/end
execute unless score @s cs.recipe matches 107 run return fail
function craftable_spawners:resolve/uncondense_red_mushroom
function craftable_spawners:reset
