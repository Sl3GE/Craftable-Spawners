advancement revoke @s only craftable_spawners:craft/uncondense_shulker_shell/end
execute unless score @s cs.recipe matches 122 run return fail
function craftable_spawners:resolve/uncondense_shulker_shell
function craftable_spawners:reset
