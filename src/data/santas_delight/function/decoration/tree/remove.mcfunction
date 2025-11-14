kill @e[type=item_display,tag=santas_delight.decoration.tree.display,distance=..0.01]
kill @s

summon item ~ ~ ~ {Motion:[0.0,0.2,0.0],Item:{id:"minecraft:item_frame",count:1,components:{"minecraft:item_model":"santas_delight:item/tree","minecraft:custom_name":{"color":"white","italic":false,"text":"Christmas Tree"},"minecraft:entity_data":{id:"minecraft:item_frame",Tags:["santas_delight.decoration.tree.create"]}}}}
