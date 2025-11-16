setblock ~ ~ ~ air

summon item_display ~ ~ ~ {Tags:["santas_delight.decoration.tree.display"],brightness:{sky:0,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.5f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/tree"}}}
summon interaction ~ ~ ~ {width:1f,height:2.5f,response:1b,Tags:["santas_delight.decoration.tree.interaction"]}
