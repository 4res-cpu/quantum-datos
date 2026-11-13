# Profesor provisional (aldeano). Para skin propia: crea un NPC con Easy NPC y usa /function quantum:profesor/marcar
kill @e[type=minecraft:villager,tag=qn_profesor,distance=..3]
summon minecraft:villager ~ ~ ~ {Tags:["qn_profesor","qn_mira"],NoAI:1b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,CustomNameVisible:1b,CustomName:'{"text":"Profesor Quark","color":"yellow","bold":true}',VillagerData:{profession:"minecraft:librarian",level:5,type:"minecraft:plains"},Offers:{Recipes:[]}}
