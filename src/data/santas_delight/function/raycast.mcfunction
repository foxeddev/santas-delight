store result score .limit santas_delight.rc run attribute @s minecraft:block_interaction_range get 10
execute at @s anchored eyes positioned ^ ^ ^0.1 run function ./raycast/loop

function ./raycast/loop:
    scoreboard players remove .limit santas_delight.rc 1
    execute unless block ~ ~ ~ #minecraft:replaceable run return run summon marker ~ ~ ~ {Tags:["santas_delight.rc.target"]}
    execute if block ~ ~ ~ #minecraft:replaceable if score .limit santas_delight.rc matches 1.. positioned ^ ^ ^0.1 run function ./raycast/loop
