advancement revoke @s only craftable_spawners:craft/condense_shulker_shell/end
execute unless score @s cs.recipe matches 61 run return fail
function craftable_spawners:resolve/condense_shulker_shell
function craftable_spawners:reset
