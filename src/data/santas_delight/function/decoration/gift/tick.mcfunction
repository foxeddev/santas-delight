as @e[type=item_frame,tag=santas_delight.decoration.gift.create] at @s:
    summon marker ~ ~ ~ {Tags:["santas_delight.decoration.gift.temp"]}
    as @e[type=marker,tag=santas_delight.decoration.gift.temp]:
        function santas_delight:move_to_center
        at @s positioned ~ ~-0.5 ~:
            if entity @e[type=interaction,tag=santas_delight.decoration.gift.interaction,distance=..0.01] run return run function ./remove_only_self
            function ./create
        kill @s
    kill @s

as @e[type=interaction,tag=santas_delight.decoration.gift.interaction] at @s:
    tag @s add current_interaction
    on target if data entity @s SelectedItem:
        tag @s add current_player
        as @e[type=interaction,tag=current_interaction]:
            unless data entity @s data.santas_delight.item:
                data modify entity @s data.santas_delight.item set from entity @n[type=player,tag=current_player] SelectedItem
                as @n[type=item_display,tag=santas_delight.decoration.gift.display,distance=..0.01]:
                    for i in range(0, 5):
                        if data entity @s {data:{santas_delight:{gift:{variant:i}}}} data modify entity @s item.components."minecraft:item_model" set value f"santas_delight:decoration/gift_{i}"
                item replace entity @a[tag=current_player] weapon.mainhand with air 1
                data remove entity @s interaction
        tag @s remove current_player

    on target:
        tag @s add current_player
        as @e[type=interaction,tag=current_interaction]:
            if data entity @s data.santas_delight.item:
                function ./spawn_content
                as @n[type=item_display,tag=santas_delight.decoration.gift.display,distance=..0.01]:
                    for i in range(0, 5):
                        if data entity @s {data:{santas_delight:{gift:{variant:i}}}} data modify entity @s item.components."minecraft:item_model" set value f"santas_delight:decoration/gift_{i}_open"
                data remove entity @n[type=interaction,tag=current_interaction] data.santas_delight.item
                data remove entity @s interaction
        tag @s remove current_player

    data remove entity @s interaction
    tag @s remove current_interaction

    if data entity @s attack run function ./remove
    if block ~ ~-1 ~ #minecraft:replaceable run function ./remove
    unless block ~ ~ ~ #minecraft:replaceable run function ./remove
