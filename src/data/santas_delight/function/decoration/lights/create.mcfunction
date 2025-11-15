setblock ~ ~ ~ air

summon item_display ^ ^ ^-0.9 {Tags:["santas_delight.decoration.lights.display","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.4f,-0.09f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/lights"}}}
summon interaction ^ ^ ^-0.9 {width:0.9f,height:0.9f,response:1b,Tags:["santas_delight.decoration.lights.interaction"]}
data modify entity @n[type=item_display,tag=santas_delight.decoration.lights.display,tag=new] Rotation set from entity @s Rotation
tag @e[type=item_display,tag=santas_delight.decoration.lights.display,tag=new] remove new
