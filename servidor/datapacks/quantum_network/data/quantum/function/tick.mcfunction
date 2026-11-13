# entrada: siempre al lobby
execute as @a[tag=!qn_visto] in quantum:lobby run tp @s 3.5 102 2.5
tag @a[tag=!qn_visto] add qn_visto
execute as @a[scores={qn_salio=1..}] in quantum:lobby run tp @s 3.5 102 2.5
scoreboard players set @a[scores={qn_salio=1..}] qn_salio 0
team join l_usuario @a[team=]
# brujula de viaje
execute as @a unless items entity @s container.* minecraft:compass[minecraft:custom_data~{qn_menu:1b}] unless items entity @s weapon.offhand minecraft:compass[minecraft:custom_data~{qn_menu:1b}] unless items entity @s player.cursor minecraft:compass[minecraft:custom_data~{qn_menu:1b}] run function quantum:menu/dar
scoreboard players remove @a[scores={qn_cd=1..}] qn_cd 1
# modos de juego por zona (creativo y espectador no se tocan)
execute as @a[gamemode=survival] at @s if dimension quantum:lobby run gamemode adventure @s
execute as @a[gamemode=survival] at @s if dimension quantum:quanta2 run gamemode adventure @s
execute as @a[gamemode=adventure] at @s if dimension minecraft:overworld run gamemode survival @s
# limites del lobby y de Quanta
execute as @a at @s if dimension quantum:lobby unless entity @s[x=-220,y=10,z=-220,dx=460,dy=600,dz=460] run tp @s 3.5 102 2.5
execute as @a[gamemode=!creative,gamemode=!spectator] at @s if dimension quantum:quanta2 unless entity @s[x=-560,y=-70,z=-560,dx=1120,dy=600,dz=1120] run function quantum:ir_quanta
# los NPC miran al jugador cercano
execute as @e[tag=qn_mira] at @s run tp @s ~ ~ ~ facing entity @p[distance=..8] eyes
# legendarios
scoreboard players remove #leg qn_timer 1
execute if score #leg qn_timer matches ..0 run function quantum:leg/lanzar
scoreboard players add #s qn_tmp 1
execute if score #s qn_tmp matches 20.. run function quantum:segundo
# grietas del cielo de Quanta
execute in quantum:quanta2 positioned 0 69 0 if entity @a[distance=..48] unless entity @e[type=minecraft:block_display,tag=qn_grieta,distance=..400] run function quantum:grietas/crear
