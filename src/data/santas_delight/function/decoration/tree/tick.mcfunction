as @e[type=interaction,tag=santas_delight.decoration.tree.create] at @s:
    if data entity @s interaction:
        particle happy_villager ~ ~ ~ 0.2 0.2 0.2 0 32 normal
        playsound minecraft:item.bone_meal.use block @a ~ ~ ~
        function ./create
    kill @s

as @e[type=item_frame,tag=santas_delight.decoration.tree.create] at @s:
    function ./create
    kill @s

as @a[nbt={SelectedItem:{id:"minecraft:bone_meal"}}] at @s:
    function santas_delight:raycast

    as @n[type=marker,tag=santas_delight.rc.target] at @s:
        function santas_delight:move_to_center
        at @s if block ~ ~ ~ minecraft:potted_spruce_sapling:
            summon interaction ~ ~-0.5 ~ {width:0.4f,height:0.4f,response:1b,Tags:["santas_delight.decoration.tree.create"]}

kill @e[type=marker,tag=santas_delight.rc.target]


as @e[type=interaction,tag=santas_delight.decoration.tree.interaction] at @s:
    if data entity @s attack run function ./remove
