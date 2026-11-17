$team join h_helper $(j)
$lp user $(j) parent set helper
$tellraw @a ["", {"text": "[Quantum] ", "color": "#ffbf3c", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": " ", "color": "white"}, {"text": "Helper", "color": "#3fd6c6", "bold": true}]
