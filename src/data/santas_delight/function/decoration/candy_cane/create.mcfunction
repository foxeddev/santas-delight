setblock ~ ~ ~ air

summon item_display ~ ~ ~ {Tags:["santas_delight.decoration.candy_cane.display","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.5f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/candy_cane"}}}
summon interaction ~ ~ ~ {width:1f,height:3f,response:1b,Tags:["santas_delight.decoration.candy_cane.interaction"]}
tag @s add current_marker
as @e[tag=new]:
    store result score #rotation temp random value 0..4
    for i in range(0, 16):
        r = i * 45
        if score #rotation temp matches i data modify entity @s Rotation[0] set value r
    scoreboard players reset #rotation temp
    tag @s remove new
tag @s remove current_marker
