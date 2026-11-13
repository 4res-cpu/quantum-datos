advancement revoke @s only quantum:profesor_click
execute if score @s qn_cd matches 1.. run return 0
scoreboard players set @s qn_cd 30
execute if entity @s[tag=qn_inicial] run function quantum:profesor/hablar_despues
execute if entity @s[tag=qn_inicial] run return 0
execute if entity @s[tag=!qn_en,tag=!qn_pt] run function quantum:profesor/hablar_es
execute if entity @s[tag=qn_en] run function quantum:profesor/hablar_en
execute if entity @s[tag=qn_pt] run function quantum:profesor/hablar_pt
