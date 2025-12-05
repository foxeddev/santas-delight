as @e[type=item_frame,tag=santas_delight.decoration.wreath.create] at @s:
    data modify storage santas_delight:temp rotation set from entity @s Rotation[1]
    if data storage santas_delight:temp {rotation:90f} run return run function ./remove_only_self
    data remove storage santas_delight:temp rotation
    summon marker ~ ~ ~ {Tags:["santas_delight.decoration.wreath.temp"]}
    data modify entity @n[type=marker,tag=santas_delight.decoration.wreath.temp] Rotation set from entity @s Rotation
    as @e[type=marker,tag=santas_delight.decoration.wreath.temp] at @s:
        function santas_delight:move_to_center
        at @s:
            positioned ~ ~-0.45 ~ positioned ^ ^ ^-0.75 if entity @e[type=interaction,tag=santas_delight.decoration.wreath.interaction,distance=..0.01] run return run function ./remove_only_self
            function ./create
        kill @s
    kill @s

as @e[type=interaction,tag=santas_delight.decoration.wreath.interaction] at @s:
    if data entity @s interaction:
        data modify storage santas_delight:temp rotation set from entity @s Rotation[1]
        if data storage santas_delight:temp {rotation:-90f}:
            positioned ~ ~0.45 ~ positioned ^ ^ ^0.26 as @e[type=item_display,tag=santas_delight.decoration.wreath.display,distance=..0.01] at @s rotate @s ~90 ~
        data remove storage santas_delight:temp rotation
        data remove entity @s interaction

    if data entity @s attack:
        on attacker if entity @s[gamemode=adventure] run return fail
        function ./remove
    data remove entity @s attack

    if block ~ ~0.45 ~ #minecraft:replaceable run function ./remove
    positioned ~ ~0.45 ~ unless block ^ ^ ^1 #minecraft:replaceable positioned ~ ~-0.45 ~ run function ./remove
