advancement revoke @s only craftable_spawners:craft/uncondense_tropical_fish/end
execute unless score @s cs.recipe matches 97 run return fail
function craftable_spawners:resolve/uncondense_tropical_fish
function craftable_spawners:reset
