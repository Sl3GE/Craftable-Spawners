scoreboard players set @s cs.mined 0
execute if entity @s[gamemode=creative] run return fail
execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"minecraft:silk_touch"}]] run return run tellraw @s {text:"Spawner Dropped!",color:"gold"}
tellraw @s {text:"Spawner Broke!",color:"gold"}
