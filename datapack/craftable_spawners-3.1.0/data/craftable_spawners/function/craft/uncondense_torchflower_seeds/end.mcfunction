advancement revoke @s only craftable_spawners:craft/uncondense_torchflower_seeds/end
execute unless score @s cs.recipe matches 99 run return fail
function craftable_spawners:resolve/uncondense_torchflower_seeds
function craftable_spawners:reset
