# Ejecutar UNA vez como admin: /function quantum:rangos/instalar
lp creategroup owner
lp group owner setweight 120
lp group owner meta setprefix 120 "&lOWNER &r"
lp group owner parent set default
lp group owner permission set * true
lp creategroup coowner
lp group coowner setweight 110
lp group coowner meta setprefix 110 "&lCO-OWNER &r"
lp group coowner parent set default
lp group coowner permission set * true
lp creategroup manager
lp group manager setweight 100
lp group manager meta setprefix 100 "&lMANAGER &r"
lp group manager parent set default
lp group manager permission set * true
lp creategroup admin
lp group admin setweight 90
lp group admin meta setprefix 90 "&lADMIN &r"
lp group admin parent set default
lp group admin permission set minecraft.command.* true
lp group admin permission set cobblemon.command.* true
lp group admin permission set worldedit.* true
lp group admin permission set axiom.* true
lp group admin permission set luckperms.user.info true
lp creategroup mod
lp group mod setweight 80
lp group mod meta setprefix 80 "&lMOD &r"
lp group mod parent set default
lp group mod permission set minecraft.command.kick true
lp group mod permission set minecraft.command.ban true
lp group mod permission set minecraft.command.pardon true
lp group mod permission set minecraft.command.tp true
lp group mod permission set minecraft.command.teleport true
lp group mod permission set minecraft.command.gamemode true
lp creategroup helper
lp group helper setweight 70
lp group helper meta setprefix 70 "&lHELPER &r"
lp group helper parent set default
lp group helper permission set minecraft.command.kick true
lp group helper permission set minecraft.command.tp true
lp creategroup soporte
lp group soporte setweight 60
lp group soporte meta setprefix 60 "&lSOPORTE &r"
lp group soporte parent set default
lp group soporte permission set minecraft.command.tp true
lp creategroup mvpplus
lp group mvpplus setweight 50
lp group mvpplus meta setprefix 50 "&lMVP+ &r"
lp group mvpplus parent set default
lp creategroup mvp
lp group mvp setweight 40
lp group mvp meta setprefix 40 "&lMVP &r"
lp group mvp parent set default
lp creategroup vipplus
lp group vipplus setweight 30
lp group vipplus meta setprefix 30 "&lVIP+ &r"
lp group vipplus parent set default
lp creategroup vip
lp group vip setweight 20
lp group vip meta setprefix 20 "&lVIP &r"
lp group vip parent set default
lp group default setweight 10
lp group default meta setprefix 10 "&lUSUARIO &r"
tellraw @s {"text":"[Quantum] Rangos creados en LuckPerms.","color":"light_purple"}