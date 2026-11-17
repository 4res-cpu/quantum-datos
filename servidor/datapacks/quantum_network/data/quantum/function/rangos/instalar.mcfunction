# Ejecutar UNA vez como admin: /function quantum:rangos/instalar
lp creategroup owner
lp group owner setweight 1000
lp group owner setdisplayname Owner
lp group owner meta setprefix 1000 " "
lp group owner parent set co-owner
lp group owner permission set * true
lp creategroup co-owner
lp group co-owner setweight 950
lp group co-owner setdisplayname Co-Owner
lp group co-owner meta setprefix 950 " "
lp group co-owner parent set manager
lp group co-owner permission set * true
lp creategroup manager
lp group manager setweight 900
lp group manager setdisplayname Manager
lp group manager meta setprefix 900 " "
lp group manager parent set admin
lp group manager permission set * true
lp creategroup admin
lp group admin setweight 850
lp group admin setdisplayname Admin
lp group admin meta setprefix 850 " "
lp group admin parent set developer
lp group admin permission set minecraft.command.* true
lp group admin permission set cobblemon.command.* true
lp group admin permission set worldedit.* true
lp group admin permission set luckperms.user.* true
lp group admin permission set essentialcommands.* true
lp group admin permission set ledger.* true
lp group admin permission set open_parties_and_claims.* true
lp group admin permission set cobblespawnregions.* true
lp group admin permission set nomonsinmyworld.* true
lp group admin permission set spark true
lp creategroup developer
lp group developer setweight 800
lp group developer setdisplayname Developer
lp group developer meta setprefix 800 " "
lp group developer parent set moderador
lp group developer permission set minecraft.command.gamemode true
lp group developer permission set minecraft.command.tp true
lp group developer permission set minecraft.command.teleport true
lp group developer permission set spark true
lp group developer permission set worldedit.* true
lp group developer permission set luckperms.user.info true
lp creategroup moderador
lp group moderador setweight 700
lp group moderador setdisplayname Moderador
lp group moderador meta setprefix 700 " "
lp group moderador parent set soporte
lp group moderador permission set minecraft.command.kick true
lp group moderador permission set minecraft.command.ban true
lp group moderador permission set minecraft.command.ban-ip true
lp group moderador permission set minecraft.command.pardon true
lp group moderador permission set minecraft.command.tp true
lp group moderador permission set minecraft.command.teleport true
lp group moderador permission set minecraft.command.gamemode true
lp group moderador permission set minecraft.command.spectate true
lp group moderador permission set ledger.* true
lp group moderador permission set essentialcommands.* true
lp creategroup soporte
lp group soporte setweight 600
lp group soporte setdisplayname Soporte
lp group soporte meta setprefix 600 " "
lp group soporte parent set helper
lp group soporte permission set minecraft.command.kick true
lp group soporte permission set minecraft.command.tp true
lp group soporte permission set minecraft.command.teleport true
lp group soporte permission set ledger.commands.inspect true
lp group soporte permission set ledger.commands.search true
lp creategroup helper
lp group helper setweight 500
lp group helper setdisplayname Helper
lp group helper meta setprefix 500 " "
lp group helper parent set default
lp group helper permission set minecraft.command.list true
lp group helper permission set ledger.commands.inspect true
lp creategroup builder
lp group builder setweight 400
lp group builder setdisplayname Builder
lp group builder meta setprefix 400 " "
lp group builder parent set default
lp group builder permission set worldedit.* true
lp group builder permission set minecraft.command.gamemode true
lp group builder permission set axiom.* true
lp creategroup artista
lp group artista setweight 350
lp group artista setdisplayname Artista
lp group artista meta setprefix 350 " "
lp group artista parent set default
lp creategroup tester
lp group tester setweight 300
lp group tester setdisplayname Tester
lp group tester meta setprefix 300 " "
lp group tester parent set default
lp creategroup partner
lp group partner setweight 260
lp group partner setdisplayname Partner
lp group partner meta setprefix 260 " "
lp group partner parent set mvp-plus
lp creategroup booster
lp group booster setweight 250
lp group booster setdisplayname Booster
lp group booster meta setprefix 250 " "
lp group booster parent set vip-plus
lp creategroup campeon
lp group campeon setweight 240
lp group campeon setdisplayname Campeón
lp group campeon meta setprefix 240 " "
lp group campeon parent set mvp
lp creategroup elite-4
lp group elite-4 setweight 230
lp group elite-4 setdisplayname Élite 4
lp group elite-4 meta setprefix 230 " "
lp group elite-4 parent set vip-plus
lp creategroup lider
lp group lider setweight 220
lp group lider setdisplayname Líder
lp group lider meta setprefix 220 " "
lp group lider parent set vip
lp creategroup mvp-plus
lp group mvp-plus setweight 150
lp group mvp-plus setdisplayname MVP+
lp group mvp-plus meta setprefix 150 " "
lp group mvp-plus parent set mvp
lp group mvp-plus permission set essentialcommands.fly true
lp group mvp-plus permission set essentialcommands.home.limit.10 true
lp creategroup mvp
lp group mvp setweight 140
lp group mvp setdisplayname MVP
lp group mvp meta setprefix 140 " "
lp group mvp parent set vip-plus
lp group mvp permission set essentialcommands.nickname.* true
lp group mvp permission set essentialcommands.home.limit.6 true
lp group mvp permission set essentialcommands.enderchest true
lp group mvp permission set essentialcommands.feed true
lp creategroup vip-plus
lp group vip-plus setweight 130
lp group vip-plus setdisplayname VIP+
lp group vip-plus meta setprefix 130 " "
lp group vip-plus parent set vip
lp group vip-plus permission set essentialcommands.home.limit.4 true
lp group vip-plus permission set essentialcommands.hat true
lp group vip-plus permission set essentialcommands.workbench true
lp creategroup vip
lp group vip setweight 120
lp group vip setdisplayname VIP
lp group vip meta setprefix 120 " "
lp group vip parent set default
lp group vip permission set essentialcommands.home.limit.2 true
lp group vip permission set cobblemon.command.pokeheal true
lp group vip permission set cobblemon.command.pc true
lp group default setweight 1
lp group default setdisplayname Usuario
lp group default meta setprefix 1 " "
lp group default permission set essentialcommands.home.limit.1 true
lp group default permission set essentialcommands.home.* true
lp group default permission set essentialcommands.tpa true
lp group default permission set essentialcommands.tpaccept true
lp group default permission set essentialcommands.tpdeny true
lp group default permission set essentialcommands.spawn true
lp group default permission set essentialcommands.back true
tellraw @s {"text":"[Quantum] Rangos creados en LuckPerms.","color":"gold"}
