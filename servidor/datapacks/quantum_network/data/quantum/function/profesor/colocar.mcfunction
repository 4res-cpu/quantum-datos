# Ponte donde quieras al Profesor y ejecuta: /function quantum:profesor/colocar
kill @e[type=minecraft:villager,tag=qn_profesor,distance=..3]
summon minecraft:villager ~ ~ ~ {Tags:["qn_profesor"],NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,CustomNameVisible:1b,CustomName:'{"text":"Profesor Quark","color":"yellow","bold":true}',VillagerData:{profession:"minecraft:librarian",level:5,type:"minecraft:plains"},Offers:{Recipes:[]}}
summon minecraft:text_display ~ ~2.6 ~ {Tags:["qn_profesor_txt"],billboard:"center",text:'{"text":"✦ Elige tu inicial ✦\\nClic derecho","color":"#b57bff"}',background:0}
tellraw @s {"text":"[Quantum] Profesor colocado. Clic derecho sobre el para probar la mision.","color":"light_purple"}
