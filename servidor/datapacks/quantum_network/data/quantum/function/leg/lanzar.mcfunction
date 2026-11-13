# Prueba manual: /function quantum:leg/lanzar
scoreboard players set #leg qn_timer 108000
tag @a remove qn_obj
execute as @a at @s if dimension minecraft:overworld run tag @s add qn_cand
tag @r[tag=qn_cand] add qn_obj
tag @a remove qn_cand
execute unless entity @a[tag=qn_obj] run scoreboard players set #leg qn_timer 6000
execute if entity @a[tag=qn_obj] run function quantum:leg/elegir
