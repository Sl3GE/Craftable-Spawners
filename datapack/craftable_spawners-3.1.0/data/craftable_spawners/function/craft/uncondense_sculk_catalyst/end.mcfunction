advancement revoke @s only craftable_spawners:craft/uncondense_sculk_catalyst/end
execute unless score @s cs.recipe matches 119 run return fail
function craftable_spawners:resolve/uncondense_sculk_catalyst
function craftable_spawners:reset
