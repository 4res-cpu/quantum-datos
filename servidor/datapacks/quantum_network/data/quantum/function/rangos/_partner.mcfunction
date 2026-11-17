$team join l_partner $(j)
$lp user $(j) parent set partner
$tellraw @a ["", {"text": "[Quantum] ", "color": "#ffbf3c", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": " ", "color": "white"}, {"text": "Partner", "color": "#ffa94d", "bold": true}]
