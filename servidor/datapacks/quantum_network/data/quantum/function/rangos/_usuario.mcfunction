$team join l_usuario $(j)
$lp user $(j) parent set default
$tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": "USUARIO", "color": "#9aa0a6", "bold": true}]