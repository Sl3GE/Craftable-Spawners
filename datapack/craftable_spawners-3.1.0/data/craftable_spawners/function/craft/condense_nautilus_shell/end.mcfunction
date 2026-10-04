advancement revoke @s only craftable_spawners:craft/condense_nautilus_shell/end
execute unless score @s cs.recipe matches 53 run return fail
function craftable_spawners:resolve/condense_nautilus_shell
function craftable_spawners:reset
