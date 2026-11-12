execute if entity @s[tag=qn_inicial] run return 0
tag @s add qn_inicial
pokegive scorbunny level=5
give @s cobblemon:poke_ball 10
give @s cobblemon:potion 5
title @s times 10 60 20
title @s subtitle {"text": "Tu aventura en Quanta comienza", "color": "gray"}
title @s title {"text": "¡Scorbunny!", "color": "red", "bold": true}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.8 0.5 0.3 80
tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"selector": "@s", "color": "yellow"}, {"text": " eligio a ", "color": "white"}, {"text": "Scorbunny", "color": "red", "bold": true}, {"text": " como su inicial.", "color": "white"}]
tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Mision completada. Usa ", "color": "white"}, {"text": "/trigger survival", "color": "yellow"}, {"text": " para salir al mundo.", "color": "white"}]
