as @e[type=item_frame,tag=santas_delight.decoration.stocking_green.create] at @s:
    data modify storage santas_delight:temp rotation set from entity @s Rotation[1]
    if data storage santas_delight:temp {rotation:-90f} run return run function ./remove_only_self
    if data storage santas_delight:temp {rotation:90f} run return run function ./remove_only_self
    data remove storage santas_delight:temp rotation
    summon marker ~ ~ ~ {Tags:["santas_delight.decoration.stocking_green.temp"]}
    data modify entity @n[type=marker,tag=santas_delight.decoration.stocking_green.temp] Rotation set from entity @s Rotation
    as @e[type=marker,tag=santas_delight.decoration.stocking_green.temp]:
        function santas_delight:move_to_center
        at @s positioned ^ ^-0.5 ^-0.5:
            positioned ^ ^ ^-0.39 if entity @e[type=interaction,tag=santas_delight.decoration.stocking_green.interaction,distance=..0.01] run return run function ./remove_only_self
            function ./create
        kill @s
    kill @s

as @e[type=interaction,tag=santas_delight.decoration.stocking_green.interaction] at @s:
    tag @s add current_interaction
    on target:
        tag @s add current_player
        as @e[type=interaction,tag=current_interaction]:
            unless data entity @s data.santas_delight.item:
                data modify entity @s data.santas_delight.item set from entity @n[type=player,tag=current_player] SelectedItem
                item replace entity @a[tag=current_player] weapon.mainhand with air 1
                data remove entity @s interaction
        tag @s remove current_player

    on target:
        tag @s add current_player
        as @e[type=interaction,tag=current_interaction]:
            if data entity @s data.santas_delight.item:
                function ./spawn_content
                data remove entity @n[type=interaction,tag=current_interaction] data.santas_delight.item
                data remove entity @s interaction
        tag @s remove current_player

    tag @s remove current_interaction

    if data entity @s attack run function ./remove
    if block ~ ~ ~ #minecraft:replaceable run function ./remove
    unless block ^ ^ ^1 #minecraft:replaceable run function ./remove
