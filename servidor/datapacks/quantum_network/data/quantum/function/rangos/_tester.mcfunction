$team join k_tester $(j)
$lp user $(j) parent set tester
$tellraw @a ["", {"text": "[Quantum] ", "color": "#ffbf3c", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": " ", "color": "white"}, {"text": "Tester", "color": "#ffd43b", "bold": true}]
