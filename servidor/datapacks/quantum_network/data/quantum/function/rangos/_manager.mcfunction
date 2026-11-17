$team join c_manager $(j)
$lp user $(j) parent set manager
$tellraw @a ["", {"text": "[Quantum] ", "color": "#ffbf3c", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": " ", "color": "white"}, {"text": "Manager", "color": "#4fd06b", "bold": true}]
