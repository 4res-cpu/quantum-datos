# Parate junto al NPC (a menos de 4 bloques) y ejecuta esta funcion
tag @e[type=!minecraft:player,type=!minecraft:item,distance=..4,limit=1,sort=nearest] add qn_npc_cobblemon
tellraw @s {"text":"[Quantum] NPC marcado: ahora abre el menu de Cobblemon al hacerle clic.","color":"light_purple"}
