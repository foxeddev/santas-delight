as @e[type=item_frame,tag=santas_delight.decoration.candy_cane.create] at @s:
    summon marker ~ ~ ~ {Tags:["santas_delight.decoration.candy_cane.temp"]}
    as @e[type=marker,tag=santas_delight.decoration.candy_cane.temp]:
        function santas_delight:move_to_center
        at @s positioned ~ ~-0.5 ~ run function ./create
        kill @s
    kill @s

as @e[type=interaction,tag=santas_delight.decoration.candy_cane.interaction] at @s:
    if data entity @s interaction:
        as @e[type=item_display,tag=santas_delight.decoration.candy_cane.display,distance=..0.01] at @s rotate @s ~45 ~
        data remove entity @s interaction

    if data entity @s attack:
        on attacker if entity @s[gamemode=adventure] run return fail
        function ./remove
    data remove entity @s attack

    if block ~ ~-1 ~ #minecraft:replaceable run function ./remove
    for i in range(0, 3):
        unless block ~ ~i ~ #minecraft:replaceable run function ./remove
