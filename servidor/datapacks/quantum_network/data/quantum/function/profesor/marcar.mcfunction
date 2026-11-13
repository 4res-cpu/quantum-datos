# Parate junto al NPC del Profesor (a menos de 4 bloques) y ejecuta esta funcion
tag @e[type=!minecraft:player,type=!minecraft:item,distance=..4,limit=1,sort=nearest] add qn_profesor
tellraw @s {"text":"[Quantum] NPC marcado como Profesor.","color":"light_purple"}
