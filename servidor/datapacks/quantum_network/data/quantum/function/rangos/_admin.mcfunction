$team join d_admin $(j)
$lp user $(j) parent set admin
$tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": "", "color": "white"}]