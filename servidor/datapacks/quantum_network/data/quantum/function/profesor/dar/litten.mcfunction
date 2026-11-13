execute if entity @s[tag=qn_inicial] run return 0
tag @s add qn_inicial
tag @s add qn_dar_litten
schedule function quantum:profesor/entregar 2t append
give @s cobblemon:poke_ball 10
give @s cobblemon:potion 5
title @s times 10 60 20
title @s subtitle {"text": "Tu aventura en Quanta comienza", "color": "gray"}
title @s title {"text": "¡Litten!", "color": "red", "bold": true}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.8 0.5 0.3 80
tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"selector": "@s", "color": "yellow"}, {"text": " eligió a ", "color": "white"}, {"text": "Litten", "color": "red", "bold": true}, {"text": " como su inicial.", "color": "white"}]
tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Misión completada. Abre tu ", "color": "white"}, {"text": "brújula", "color": "aqua"}, {"text": " para salir al Mundo Survival.", "color": "white"}]
