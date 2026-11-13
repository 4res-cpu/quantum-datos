advancement revoke @s only quantum:menu_uso
execute if score @s qn_cd matches 1.. run return 0
scoreboard players set @s qn_cd 30
execute if entity @s[tag=!qn_en,tag=!qn_pt] run blabber dialogue start quantum:menu @s
execute if entity @s[tag=qn_en] run blabber dialogue start quantum:menu_en @s
execute if entity @s[tag=qn_pt] run blabber dialogue start quantum:menu_pt @s
