$item replace entity @s player.cursor with minecraft:chicken[minecraft:item_name={text:"Condensed Chicken",color:"dark_green"},minecraft:lore=[{text:"Worth 9 Chicken",color:"gray",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={craftable_spawners:{group:"condensed",tier:"condensed",item:"chicken"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
