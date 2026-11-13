advancement revoke @s only quantum:profesor_click
execute if score @s qn_cd matches 1.. run return 0
scoreboard players set @s qn_cd 30
execute if entity @s[tag=qn_inicial] run blabber dialogue start quantum:profesor_despues @s
execute if entity @s[tag=qn_inicial] run return 0
execute store success score #ok qn_tmp run blabber dialogue start quantum:profesor_inicial @s
execute if score #ok qn_tmp matches 0 run blabber dialogue start quantum:profesor_simple @s
