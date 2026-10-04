advancement revoke @s only craftable_spawners:craft/spawner_tropical_fish/end
execute unless score @s cs.recipe matches 192 run return fail
function craftable_spawners:resolve/spawner_tropical_fish
function craftable_spawners:reset
