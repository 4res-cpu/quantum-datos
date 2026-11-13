execute in quantum:lobby run tp @s 3.5 102 2.5
title @s times 10 50 20
execute if entity @s[tag=!qn_en,tag=!qn_pt] run title @s subtitle {"text": "Quantum Network", "color": "gray"}
execute if entity @s[tag=!qn_en,tag=!qn_pt] run title @s title {"text": "LOBBY", "color": "#b57bff", "bold": true}
execute if entity @s[tag=qn_en] run title @s subtitle {"text": "Quantum Network", "color": "gray"}
execute if entity @s[tag=qn_en] run title @s title {"text": "LOBBY", "color": "#b57bff", "bold": true}
execute if entity @s[tag=qn_pt] run title @s subtitle {"text": "Quantum Network", "color": "gray"}
execute if entity @s[tag=qn_pt] run title @s title {"text": "LOBBY", "color": "#b57bff", "bold": true}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 0.6 1.3
