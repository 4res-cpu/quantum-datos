$team join d_admin $(j)
$lp user $(j) parent set admin
$tellraw @a ["", {"text": "[Quantum] ", "color": "#ffbf3c", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": " ", "color": "white"}, {"text": "Admin", "color": "#b06cff", "bold": true}]
