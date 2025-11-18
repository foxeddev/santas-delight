setblock ~ ~ ~ air

summon item_display ~ ~ ~ {Tags:["santas_delight.decoration.gift.display","new"],brightness:{sky:0,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.5f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1}}
summon interaction ~ ~ ~ {width:0.65f,height:0.65f,response:1b,Tags:["santas_delight.decoration.gift.interaction","new"]}

store result score #variant temp run random value 1..4
for i in range(1, 5):
    if score #variant temp matches i run data modify entity @n[type=item_display,tag=new] item.components."minecraft:item_model" set value f"santas_delight:decoration/gift_{i}"
