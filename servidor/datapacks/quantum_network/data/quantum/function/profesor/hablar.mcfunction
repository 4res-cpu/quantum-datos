advancement revoke @s only quantum:profesor_click
execute if entity @s[tag=!qn_inicial] run blabber dialogue start quantum:profesor_inicial @s
execute if entity @s[tag=qn_inicial] run blabber dialogue start quantum:profesor_despues @s
