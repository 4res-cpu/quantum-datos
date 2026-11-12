execute in quantum:quanta run tp @s 0.5 69 0.5
title @s times 10 50 20
title @s subtitle {"text": "La region donde todo empieza", "color": "gray"}
title @s title {"text": "QUANTA", "color": "#b57bff", "bold": true}
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1.2
execute if entity @s[tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Busca al ", "color": "white"}, {"text": "Profesor", "color": "yellow"}, {"text": " para elegir tu primer Pokémon.", "color": "white"}]
