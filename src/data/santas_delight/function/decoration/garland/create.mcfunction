summon item_display ^ ^ ^0.01 {Tags:["santas_delight.decoration.garland.display","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0.1f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/garland"}}}
summon interaction ^ ^ ^-0.39 {width:0.9f,height:0.9f,response:1b,Tags:["santas_delight.decoration.garland.interaction","new"]}
tag @s add current_marker
as @e[tag=new]:
    data modify entity @s Rotation set from entity @n[tag=current_marker] Rotation
    tag @s remove new
tag @s remove current_marker
