advancement revoke @s only craftable_spawners:craft/uncondense_amethyst_shard/end
execute unless score @s cs.recipe matches 98 run return fail
function craftable_spawners:resolve/uncondense_amethyst_shard
function craftable_spawners:reset
