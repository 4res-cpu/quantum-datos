$team join f_helper $(j)
$lp user $(j) parent set helper
$tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": "HELPER", "color": "#4cc9f0", "bold": true}]