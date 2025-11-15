as @e[type=interaction,tag=santas_delight.decoration.tree.create] at @s:
    if data entity @s interaction:
        on target run clear @s minecraft:bone_meal 1
        particle happy_villager ~ ~ ~ 0.2 0.2 0.2 0 32 normal
        playsound minecraft:item.bone_meal.use block @a ~ ~ ~
        function ./create
    kill @s

as @e[type=item_frame,tag=santas_delight.decoration.tree.create] at @s:
    summon marker ~ ~ ~ {Tags:["santas_delight.decoration.tree.temp"]}
    as @e[type=marker,tag=santas_delight.decoration.tree.temp]:
        function santas_delight:move_to_center
        at @s positioned ~ ~-0.5 ~ run function ./create
        kill @s
    kill @s

as @a[nbt={SelectedItem:{id:"minecraft:bone_meal"}}] at @s:
    function santas_delight:raycast

    as @n[type=marker,tag=santas_delight.rc.target] at @s:
        function santas_delight:move_to_center
        at @s if block ~ ~ ~ minecraft:potted_spruce_sapling:
            summon interaction ~ ~-0.5 ~ {width:0.4f,height:0.4f,response:1b,Tags:["santas_delight.decoration.tree.create"]}

kill @e[type=marker,tag=santas_delight.rc.target]


as @e[type=interaction,tag=santas_delight.decoration.tree.interaction] at @s:
    tag @s add current_interaction
    tag @n[type=item_display,tag=santas_delight.decoration.tree.display] add current_display
    on target:
        if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{"santas_delight":{"item":"tree_decorations"}}}}}:
            tag @s add current_player

    if entity @a[tag=current_player] if entity @s[tag=!has_decorations]:
        data modify entity @n[type=item_display,tag=current_display] item.components."minecraft:item_model" set value "santas_delight:decoration/tree_decorated"
        tag @s add has_decorations
        clear @a[tag=current_player] *[minecraft:custom_data={"santas_delight":{"item":"tree_decorations"}}] 1
        data remove entity @s interaction

    tag @a remove current_player

    on target:
        tag @s add current_player

    if entity @a[tag=current_player] if entity @s[tag=has_decorations]:
        data modify entity @n[type=item_display,tag=current_display] item.components."minecraft:item_model" set value "santas_delight:decoration/tree"
        tag @s remove has_decorations
        function santas_delight:item/tree_decorations/spawn

    data remove entity @s interaction
    tag @a remove current_player

    tag @e[type=interaction,tag=current_interaction] remove current_interaction
    tag @e[type=item_display,tag=current_display] remove current_display

    if data entity @s attack run function ./remove
    if block ~ ~-1 ~ #minecraft:replaceable run function ./remove
