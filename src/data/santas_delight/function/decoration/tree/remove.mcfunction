function ./spawn

if entity @s[tag=has_decorations]:
    function santas_delight:item/tree_decorations/spawn

kill @e[type=item_display,tag=santas_delight.decoration.tree.display,distance=..0.01]
kill @s
