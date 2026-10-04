advancement revoke @s only craftable_spawners:craft/condense_tropical_fish/end
execute unless score @s cs.recipe matches 36 run return fail
function craftable_spawners:resolve/condense_tropical_fish
function craftable_spawners:reset
