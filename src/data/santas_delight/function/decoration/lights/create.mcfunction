setblock ~ ~ ~ light

summon item_display ^ ^ ^-0.9 {Tags:["santas_delight.decoration.lights.display","new"],brightness:{sky:0,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.4f,-0.09f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/lights"}}}
summon interaction ^ ^ ^-0.9 {width:0.9f,height:0.9f,response:1b,Tags:["santas_delight.decoration.lights.interaction","new"]}
tag @s add current_marker
as @e[tag=new]:
    data modify entity @s Rotation set from entity @n[tag=current_marker] Rotation
    tag @s remove new
tag @s remove current_marker
