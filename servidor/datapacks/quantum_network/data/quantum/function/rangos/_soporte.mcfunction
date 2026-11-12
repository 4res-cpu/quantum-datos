$team join g_soporte $(j)
$lp user $(j) parent set soporte
$tellraw @a ["", {"text": "[Quantum] ", "color": "#b57bff", "bold": true}, {"text": "$(j)", "color": "yellow"}, {"text": " ahora es ", "color": "white"}, {"text": "SOPORTE", "color": "#74c0fc", "bold": true}]