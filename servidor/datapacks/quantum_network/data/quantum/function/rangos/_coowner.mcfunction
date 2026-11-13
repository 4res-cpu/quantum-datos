$team join b_coowner $(j)
$lp user $(j) parent set coowner
$tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": "", "color": "white"}]