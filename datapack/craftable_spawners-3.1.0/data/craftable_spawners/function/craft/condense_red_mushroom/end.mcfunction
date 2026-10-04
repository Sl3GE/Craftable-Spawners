advancement revoke @s only craftable_spawners:craft/condense_red_mushroom/end
execute unless score @s cs.recipe matches 46 run return fail
function craftable_spawners:resolve/condense_red_mushroom
function craftable_spawners:reset
