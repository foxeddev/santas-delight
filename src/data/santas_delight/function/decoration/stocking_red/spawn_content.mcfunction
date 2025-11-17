if data entity @s data.santas_delight.item:
    summon item ^ ^0.6 ^0.1 {Tags:["current_item"],Item:{id:"minecraft:stone"}}
    data modify entity @n[type=item,tag=current_item] Item set from entity @s data.santas_delight.item
    tag @e[type=item,tag=current_item] remove current_item
