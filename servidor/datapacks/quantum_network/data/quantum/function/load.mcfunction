scoreboard objectives add lobby trigger
scoreboard objectives add quanta trigger
scoreboard objectives add survival trigger
scoreboard objectives add salvaje trigger
scoreboard objectives add qn_salio minecraft.custom:minecraft.leave_game
scoreboard objectives remove qn_info
scoreboard objectives add qn_info dummy {"text": "QUANTUM NETWORK", "color": "#b57bff", "bold": true}
scoreboard objectives modify qn_info numberformat blank
scoreboard objectives setdisplay sidebar qn_info
scoreboard players set #l0 qn_info 13
scoreboard players display name #l0 qn_info {"text": "", "color": "white", "bold": false}
scoreboard players set #l1 qn_info 12
scoreboard players display name #l1 qn_info {"text": "▸ Modalidad", "color": "light_purple", "bold": false}
scoreboard players set #l2 qn_info 11
scoreboard players display name #l2 qn_info {"text": "  Cobblemon", "color": "white", "bold": false}
scoreboard players set #l3 qn_info 10
scoreboard players display name #l3 qn_info {"text": " ", "color": "white", "bold": false}
scoreboard players set #l4 qn_info 9
scoreboard players display name #l4 qn_info {"text": "▸ Moverte", "color": "light_purple", "bold": false}
scoreboard players set #l5 qn_info 8
scoreboard players display name #l5 qn_info {"text": "  /trigger lobby", "color": "gray", "bold": false}
scoreboard players set #l6 qn_info 7
scoreboard players display name #l6 qn_info {"text": "  /trigger quanta", "color": "gray", "bold": false}
scoreboard players set #l7 qn_info 6
scoreboard players display name #l7 qn_info {"text": "  /trigger survival", "color": "gray", "bold": false}
scoreboard players set #l8 qn_info 5
scoreboard players display name #l8 qn_info {"text": "  ", "color": "white", "bold": false}
scoreboard players set #l9 qn_info 4
scoreboard players display name #l9 qn_info {"text": "▸ Legendarios", "color": "light_purple", "bold": false}
scoreboard players set #l10 qn_info 3
scoreboard players display name #l10 qn_info {"text": "  cada 1h 30m", "color": "white", "bold": false}
scoreboard players set #l11 qn_info 2
scoreboard players display name #l11 qn_info {"text": "   ", "color": "white", "bold": false}
scoreboard players set #l12 qn_info 1
scoreboard players display name #l12 qn_info {"text": "quantum network", "color": "dark_purple", "bold": false}
team add a_owner
team modify a_owner prefix {"text": "OWNER ", "color": "#ff3b3b", "bold": true}
team modify a_owner color dark_red
team add b_coowner
team modify b_coowner prefix {"text": "CO-OWNER ", "color": "#ff6b4a", "bold": true}
team modify b_coowner color red
team add c_manager
team modify c_manager prefix {"text": "MANAGER ", "color": "#ff9f43", "bold": true}
team modify c_manager color gold
team add d_admin
team modify d_admin prefix {"text": "ADMIN ", "color": "#ff5e7a", "bold": true}
team modify d_admin color red
team add e_mod
team modify e_mod prefix {"text": "MOD ", "color": "#3ddc97", "bold": true}
team modify e_mod color green
team add f_helper
team modify f_helper prefix {"text": "HELPER ", "color": "#4cc9f0", "bold": true}
team modify f_helper color aqua
team add g_soporte
team modify g_soporte prefix {"text": "SOPORTE ", "color": "#74c0fc", "bold": true}
team modify g_soporte color blue
team add h_mvpplus
team modify h_mvpplus prefix {"text": "MVP+ ", "color": "#ffd43b", "bold": true}
team modify h_mvpplus color yellow
team add i_mvp
team modify i_mvp prefix {"text": "MVP ", "color": "#f5c518", "bold": true}
team modify i_mvp color yellow
team add j_vipplus
team modify j_vipplus prefix {"text": "VIP+ ", "color": "#c77dff", "bold": true}
team modify j_vipplus color light_purple
team add k_vip
team modify k_vip prefix {"text": "VIP ", "color": "#9d4edd", "bold": true}
team modify k_vip color dark_purple
team add l_usuario
team modify l_usuario prefix {"text": "USUARIO ", "color": "#9aa0a6", "bold": true}
team modify l_usuario color white