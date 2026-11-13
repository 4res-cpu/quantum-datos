execute in quantum:quanta2 run tp @s 0.5 69 0.5
title @s times 10 50 20
execute if entity @s[tag=!qn_en,tag=!qn_pt] run title @s subtitle {"text": "La región donde todo empieza", "color": "gray"}
execute if entity @s[tag=!qn_en,tag=!qn_pt] run title @s title {"text": "QUANTA", "color": "#b57bff", "bold": true}
execute if entity @s[tag=qn_en] run title @s subtitle {"text": "The region where it all begins", "color": "gray"}
execute if entity @s[tag=qn_en] run title @s title {"text": "QUANTA", "color": "#b57bff", "bold": true}
execute if entity @s[tag=qn_pt] run title @s subtitle {"text": "A região onde tudo começa", "color": "gray"}
execute if entity @s[tag=qn_pt] run title @s title {"text": "QUANTA", "color": "#b57bff", "bold": true}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1.2
execute if entity @s[tag=!qn_en,tag=!qn_pt,tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Busca al ", "color": "white"}, {"text": "Profesor", "color": "yellow"}, {"text": " para elegir tu primer Pokémon.", "color": "white"}]
execute if entity @s[tag=qn_en,tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Find the ", "color": "white"}, {"text": "Professor", "color": "yellow"}, {"text": " to choose your first Pokémon.", "color": "white"}]
execute if entity @s[tag=qn_pt,tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Procure o ", "color": "white"}, {"text": "Professor", "color": "yellow"}, {"text": " para escolher seu primeiro Pokémon.", "color": "white"}]
