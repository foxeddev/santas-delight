if data entity @s data.santas_delight.item:
    summon item ~ ~ ~ {Motion:[0d,0.3d,0d],Tags:["current_item"],Item:{id:"minecraft:stone"}}
    data modify entity @n[type=item,tag=current_item] Item set from entity @s data.santas_delight.item
    tag @e[type=item,tag=current_item] remove current_item
