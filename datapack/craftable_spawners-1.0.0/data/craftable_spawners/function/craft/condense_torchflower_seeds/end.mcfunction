advancement revoke @s only craftable_spawners:craft/condense_torchflower_seeds/end
execute unless score @s cs.recipe matches 38 run return fail
function craftable_spawners:resolve/condense_torchflower_seeds
function craftable_spawners:reset
