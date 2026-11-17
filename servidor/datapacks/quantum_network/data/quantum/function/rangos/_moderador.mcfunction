$team join f_moderador $(j)
$lp user $(j) parent set moderador
$tellraw @a ["", {"text": "[Quantum] ", "color": "#ffbf3c", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": " ", "color": "white"}, {"text": "Moderador", "color": "#ff5a7a", "bold": true}]
