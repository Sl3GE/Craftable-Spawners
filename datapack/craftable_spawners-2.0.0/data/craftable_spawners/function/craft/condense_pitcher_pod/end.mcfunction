advancement revoke @s only craftable_spawners:craft/condense_pitcher_pod/end
execute unless score @s cs.recipe matches 39 run return fail
function craftable_spawners:resolve/condense_pitcher_pod
function craftable_spawners:reset
