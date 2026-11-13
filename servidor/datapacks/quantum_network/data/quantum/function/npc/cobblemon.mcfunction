advancement revoke @s only quantum:npc_cobblemon_click
execute if score @s qn_cd matches 1.. run return 0
scoreboard players set @s qn_cd 30
execute if entity @s[tag=!qn_en,tag=!qn_pt] run blabber dialogue start quantum:cobblemon @s
execute if entity @s[tag=qn_en] run blabber dialogue start quantum:cobblemon_en @s
execute if entity @s[tag=qn_pt] run blabber dialogue start quantum:cobblemon_pt @s
