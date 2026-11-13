$spawnpokemon $(id) level=60
$tellraw @a ["", {"text": "                                                            ", "color": "dark_purple", "strikethrough": true}, "\n", {"text": "   ✦ FRACTURA LEGENDARIA ✦", "color": "#ff7ad9", "bold": true}, "\n\n", {"text": "   ¡", "color": "white"}, {"text": "$(n)", "color": "yellow", "bold": true}, {"text": " ha cruzado la Fractura!", "color": "white"}, "\n", {"text": "   Entrenador más cercano: ", "color": "gray"}, {"selector": "@a[tag=qn_obj,limit=1]", "color": "light_purple", "bold": true}, "\n", {"text": "   Próximo legendario en ", "color": "gray"}, {"text": "1h 30m", "color": "green"}, "\n", {"text": "                                                            ", "color": "dark_purple", "strikethrough": true}]
$title @a subtitle {"text": "$(n) apareció en el Mundo Survival", "color": "yellow"}
title @a times 10 70 20
title @a title {"text": "✦ FRACTURA ✦", "color": "#ff7ad9", "bold": true}
execute as @a at @s run playsound minecraft:entity.ender_dragon.growl master @s ~ ~ ~ 0.7 0.8
particle minecraft:reverse_portal ~ ~1 ~ 1.5 2 1.5 0.2 400 force
particle minecraft:end_rod ~ ~2 ~ 1 3 1 0.05 120 force
