setblock ~ ~ ~ air

summon item_display ^ ^ ^-0.7 {Tags:["santas_delight.decoration.garland.display","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.4f,0.3f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/garland"}}}
summon interaction ^ ^ ^-0.7 {width:0.9f,height:0.9f,response:1b,Tags:["santas_delight.decoration.garland.interaction"]}
data modify entity @n[type=item_display,tag=santas_delight.decoration.garland.display,tag=new] Rotation set from entity @s Rotation
tag @e[type=item_display,tag=santas_delight.decoration.garland.display,tag=new] remove new
