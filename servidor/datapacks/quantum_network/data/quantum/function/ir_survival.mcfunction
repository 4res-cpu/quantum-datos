execute if entity @s[tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Primero habla con el Profesor en Quanta y elige tu inicial.", "color": "white"}]
execute if entity @s[tag=!qn_inicial] run return 0
execute in minecraft:overworld run spreadplayers 0 0 0 1500 false @s
title @s times 10 50 20
title @s subtitle {"text": "Límite: 10.000 bloques desde el centro", "color": "gray"}
title @s title {"text": "MUNDO SURVIVAL", "color": "green", "bold": true}
