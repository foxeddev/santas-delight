setblock ~ ~ ~ air

summon item_display ~ ~ ~ {Tags:["santas_delight.decoration.candy_cane.display","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.5f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/candy_cane"}}}
summon interaction ~ ~ ~ {width:1f,height:3f,response:1b,Tags:["santas_delight.decoration.candy_cane.interaction","new"]}
tag @s add current_marker
as @e[tag=new]:
    store result score #rotation temp random value 0..4
    for i in range(0, 5):
        r = i * 90
        if score #rotation temp matches i data modify entity @s Rotation set value [r,0f]
    scoreboard players reset #rotation temp
    tag @s remove new
tag @s remove current_marker
