advancement revoke @s only craftable_spawners:craft/uncondense_pitcher_pod/end
execute unless score @s cs.recipe matches 100 run return fail
function craftable_spawners:resolve/uncondense_pitcher_pod
function craftable_spawners:reset
