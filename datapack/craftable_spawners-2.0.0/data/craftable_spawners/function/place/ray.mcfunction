$execute if block ~ ~ ~ minecraft:spawner run return run function craftable_spawners:place/set {id:"$(id)",path:"$(path)"}
scoreboard players add #steps cs.tmp 1
execute if score #steps cs.tmp matches ..80 positioned ^ ^ ^0.1 run function craftable_spawners:place/ray with storage craftable_spawners:tmp place
