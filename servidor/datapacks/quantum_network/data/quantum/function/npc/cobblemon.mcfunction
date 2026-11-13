advancement revoke @s only quantum:npc_cobblemon_click
execute if score @s qn_cd matches 1.. run return 0
scoreboard players set @s qn_cd 30
blabber dialogue start quantum:cobblemon @s
