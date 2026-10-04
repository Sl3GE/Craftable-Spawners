advancement revoke @s only craftable_spawners:craft/condense_amethyst_shard/end
execute unless score @s cs.recipe matches 37 run return fail
function craftable_spawners:resolve/condense_amethyst_shard
function craftable_spawners:reset
