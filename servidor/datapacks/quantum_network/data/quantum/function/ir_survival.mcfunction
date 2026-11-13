execute if entity @s[tag=!qn_en,tag=!qn_pt,tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Primero habla con el Profesor en Quanta y elige tu inicial.", "color": "white"}]
execute if entity @s[tag=qn_en,tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "First talk to the Professor in Quanta and choose your starter.", "color": "white"}]
execute if entity @s[tag=qn_pt,tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Primeiro fale com o Professor em Quanta e escolha seu inicial.", "color": "white"}]
execute if entity @s[tag=!qn_inicial] run return 0
execute in minecraft:overworld run spreadplayers 0 0 0 1500 false @s
title @s times 10 50 20
execute if entity @s[tag=!qn_en,tag=!qn_pt] run title @s subtitle {"text": "Límite: 10.000 bloques desde el centro", "color": "gray"}
execute if entity @s[tag=!qn_en,tag=!qn_pt] run title @s title {"text": "MUNDO SURVIVAL", "color": "green", "bold": true}
execute if entity @s[tag=qn_en] run title @s subtitle {"text": "Border: 10,000 blocks from the center", "color": "gray"}
execute if entity @s[tag=qn_en] run title @s title {"text": "SURVIVAL WORLD", "color": "green", "bold": true}
execute if entity @s[tag=qn_pt] run title @s subtitle {"text": "Limite: 10.000 blocos a partir do centro", "color": "gray"}
execute if entity @s[tag=qn_pt] run title @s title {"text": "MUNDO SURVIVAL", "color": "green", "bold": true}
