$team join c_manager $(j)
$lp user $(j) parent set manager
$tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": "MANAGER", "color": "#ff9f43", "bold": true}]