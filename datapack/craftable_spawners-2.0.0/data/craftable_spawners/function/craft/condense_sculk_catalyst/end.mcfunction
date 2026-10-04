advancement revoke @s only craftable_spawners:craft/condense_sculk_catalyst/end
execute unless score @s cs.recipe matches 58 run return fail
function craftable_spawners:resolve/condense_sculk_catalyst
function craftable_spawners:reset
