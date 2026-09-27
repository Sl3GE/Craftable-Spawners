$item replace entity @s player.cursor with minecraft:rotten_flesh[minecraft:item_name={text:"Condensed Rotten Flesh",color:"dark_green"},minecraft:lore=[{text:"Worth 9 Rotten Flesh",color:"gray",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={craftable_spawners:{group:"condensed",tier:"condensed",item:"rotten_flesh"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
