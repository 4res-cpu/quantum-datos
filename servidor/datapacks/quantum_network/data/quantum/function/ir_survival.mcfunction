execute if entity @s[tag=!qn_inicial] run tellraw @s ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "Primero habla con el Profesor en Quanta y elige tu inicial. Usa ", "color": "white"}, {"text": "/trigger quanta", "color": "yellow"}]
execute if entity @s[tag=qn_inicial] in minecraft:overworld run spreadplayers 0 0 0 800 false @s
execute if entity @s[tag=qn_inicial] run title @s title {"text": "MUNDO SURVIVAL", "color": "green", "bold": true}
