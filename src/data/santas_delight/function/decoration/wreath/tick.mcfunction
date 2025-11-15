as @e[type=item_frame,tag=santas_delight.decoration.wreath.create] at @s:
    if data entity @s {Rotation:[0f,-90f]} run return run function ./remove_only_self
    if data entity @s {Rotation:[0f,90f]} run return run function ./remove_only_self
    summon marker ~ ~ ~ {Tags:["santas_delight.decoration.wreath.temp"]}
    data modify entity @n[type=marker,tag=santas_delight.decoration.wreath.temp] Rotation set from entity @s Rotation
    as @e[type=marker,tag=santas_delight.decoration.wreath.temp]:
        function santas_delight:move_to_center
        at @s positioned ~ ~-0.5 ~:
            positioned ^ ^ ^-0.7 if entity @e[type=interaction,tag=santas_delight.decoration.wreath.interaction,distance=..0.01] run return run function ./remove_only_self
            function ./create
        kill @s
    kill @s

as @e[type=interaction,tag=santas_delight.decoration.wreath.interaction] at @s:
    if data entity @s attack run function ./remove
    if block ~ ~ ~ #minecraft:replaceable run function ./remove
