scoreboard players set #s qn_tmp 0
scoreboard players operation #min qn_tmp = #leg qn_timer
scoreboard players operation #min qn_tmp /= #1200 qn_tmp
scoreboard players add #min qn_tmp 1
scoreboard players operation @a qn_leg = #min qn_tmp
execute store result storage quantum:ui min int 1 run scoreboard players get #min qn_tmp
execute store result storage quantum:ui on int 1 if entity @a
function quantum:ui with storage quantum:ui
execute in quantum:quanta2 positioned 0 69 0 if entity @a[distance=..400] run function quantum:grietas/particulas
execute at @e[type=minecraft:text_display,tag=qn_holo_abierto] run particle minecraft:end_rod ~ ~-1.2 ~ 0.7 0.15 0.7 0.01 3
execute at @e[type=minecraft:text_display,tag=qn_holo_abierto] run particle minecraft:witch ~ ~-2.4 ~ 0.6 0.05 0.6 0 4
