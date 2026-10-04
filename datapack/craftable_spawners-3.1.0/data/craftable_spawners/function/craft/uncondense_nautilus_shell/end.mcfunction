advancement revoke @s only craftable_spawners:craft/uncondense_nautilus_shell/end
execute unless score @s cs.recipe matches 114 run return fail
function craftable_spawners:resolve/uncondense_nautilus_shell
function craftable_spawners:reset
