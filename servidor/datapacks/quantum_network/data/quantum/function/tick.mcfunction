# primera vez y cada reconexion: al lobby
execute as @a[tag=!qn_visto] in quantum:lobby run tp @s 3.5 102 2.5
tag @a[tag=!qn_visto] add qn_visto
execute as @a[scores={qn_salio=1..}] in quantum:lobby run tp @s 3.5 102 2.5
scoreboard players set @a[scores={qn_salio=1..}] qn_salio 0
scoreboard players enable @a lobby
scoreboard players enable @a quanta
scoreboard players enable @a survival
scoreboard players enable @a salvaje
execute as @a[scores={lobby=1..}] in quantum:lobby run tp @s 3.5 102 2.5
scoreboard players set @a[scores={lobby=1..}] lobby 0
execute as @a[scores={quanta=1..}] run function quantum:ir_quanta
scoreboard players set @a[scores={quanta=1..}] quanta 0
execute as @a[scores={survival=1..}] run function quantum:ir_survival
scoreboard players set @a[scores={survival=1..}] survival 0
execute as @a[scores={salvaje=1..}] run function quantum:ir_survival
scoreboard players set @a[scores={salvaje=1..}] salvaje 0
# modos de juego por zona (los admins en creativo no se tocan)
execute as @a[gamemode=survival] at @s if dimension quantum:lobby run gamemode adventure @s
execute as @a[gamemode=survival] at @s if dimension quantum:quanta run gamemode adventure @s
execute as @a[gamemode=adventure] at @s if dimension minecraft:overworld run gamemode survival @s
# caidas al vacio en el lobby
execute as @a at @s if dimension quantum:lobby unless entity @s[y=10,dy=600] run tp @s 3.5 102 2.5
# el profesor mira al jugador cercano
execute as @e[type=minecraft:villager,tag=qn_profesor] at @s run tp @s ~ ~ ~ facing entity @p[distance=..8] eyes
team join l_usuario @a[team=]
