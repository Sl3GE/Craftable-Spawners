scoreboard objectives remove cs.recipe
scoreboard objectives remove cs.tmp
scoreboard objectives remove cs.n
scoreboard objectives remove cs.h
scoreboard objectives remove cs.v
scoreboard objectives remove cs.a1
scoreboard objectives remove cs.a2
scoreboard objectives remove cs.b1
scoreboard objectives remove cs.b2
scoreboard objectives remove cs.mined
data remove storage craftable_spawners:tmp give
tellraw @s {text:"Craftable Spawners scoreboards removed. Disable the data pack next.",color:"gold"}
