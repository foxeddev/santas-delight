setblock ~ ~ ~ air destroy

summon item_display ^ ^ ^-0.49 {Tags:["santas_delight.decoration.wreath.display","new"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0.1f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/wreath"}}}
positioned ~ ~-0.45 ~ run summon interaction ^ ^ ^-0.75 {width:0.9f,height:0.9f,response:1b,Tags:["santas_delight.decoration.wreath.interaction","new"]}
tag @s add current_marker
as @e[tag=new]:
    data modify entity @s Rotation set from entity @n[tag=current_marker] Rotation

    data modify storage santas_delight:temp rotation set from entity @s Rotation[1]
    if data storage santas_delight:temp {rotation:-90f}:
        store result score #rotation temp random value 0..4
        for i in range(0, 4):
            r = i * 90
            if score #rotation temp matches i data modify entity @s Rotation[0] set value r
        scoreboard players reset #rotation temp
    data remove storage santas_delight:temp rotation

    tag @s remove new
tag @s remove current_marker
