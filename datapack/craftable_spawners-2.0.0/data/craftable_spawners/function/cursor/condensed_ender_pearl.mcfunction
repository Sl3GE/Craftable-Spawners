$item replace entity @s player.cursor with minecraft:ender_pearl[minecraft:item_name={text:"Condensed Ender Pearl",color:"dark_green"},minecraft:lore=[{text:"Worth 9 Ender Pearl",color:"gray",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={craftable_spawners:{group:"condensed",tier:"condensed",item:"ender_pearl"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
