setblock ~ ~ ~ air

summon item_display ~ ~ ~ {Tags:["santas_delight.decoration.candy_cane.display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.5f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:stick",count:1,components:{"minecraft:item_model":"santas_delight:decoration/candy_cane"}}}
summon interaction ~ ~ ~ {width:1f,height:3f,response:1b,Tags:["santas_delight.decoration.candy_cane.interaction"]}
