execute if entity @s[tag=qn_inicial] run return 0
tag @s add qn_inicial
tag @s add qn_dar_quaxly
schedule function quantum:profesor/entregar 2t append
give @s cobblemon:poke_ball 10
give @s cobblemon:potion 5
title @s times 10 60 20
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.8 0.5 0.3 80
tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"selector": "@s", "color": "yellow"}, {"text": " eligió a ", "color": "white"}, {"text": "Quaxly", "color": "aqua", "bold": true}, {"text": " como su inicial.", "color": "white"}]
execute if entity @s[tag=!qn_en,tag=!qn_pt] run title @s subtitle {"text": "Tu aventura en Quanta comienza", "color": "gray"}
execute if entity @s[tag=qn_en] run title @s subtitle {"text": "Your adventure in Quanta begins", "color": "gray"}
execute if entity @s[tag=qn_pt] run title @s subtitle {"text": "Sua aventura em Quanta começa", "color": "gray"}
execute if entity @s[tag=!qn_en,tag=!qn_pt] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Misión completada. Abre tu ", "color": "white"}, {"text": "brújula", "color": "aqua"}, {"text": " para salir al Mundo Survival.", "color": "white"}]
execute if entity @s[tag=qn_en] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Mission complete. Open your ", "color": "white"}, {"text": "compass", "color": "aqua"}, {"text": " to head to the Survival World.", "color": "white"}]
execute if entity @s[tag=qn_pt] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Missão concluída. Abra sua ", "color": "white"}, {"text": "bússola", "color": "aqua"}, {"text": " para ir ao Mundo Survival.", "color": "white"}]
title @s title {"text": "¡Quaxly!", "color": "aqua", "bold": true}
