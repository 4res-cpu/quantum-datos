scoreboard objectives remove lobby
scoreboard objectives remove quanta
scoreboard objectives remove survival
scoreboard objectives remove salvaje
scoreboard objectives add qn_salio minecraft.custom:minecraft.leave_game
scoreboard objectives add qn_tmp dummy
scoreboard objectives add qn_timer dummy
scoreboard objectives add qn_leg dummy
scoreboard objectives add qn_cd dummy
scoreboard players set #1200 qn_tmp 1200
execute unless score #leg qn_timer matches 1.. run scoreboard players set #leg qn_timer 108000
worldborder center 0 0
worldborder set 20000
scoreboard objectives remove qn_info
scoreboard objectives add qn_info dummy {"text": "✦ QUANTUM ✦", "color": "#b57bff", "bold": true}
scoreboard objectives modify qn_info numberformat blank
scoreboard objectives setdisplay sidebar qn_info
scoreboard players set #l0 qn_info 10
scoreboard players display name #l0 qn_info {"text": "", "color": "white"}
scoreboard players set #l_modo qn_info 9
scoreboard players display name #l_modo qn_info {"text": "Modalidad", "color": "light_purple"}
scoreboard players display numberformat #l_modo qn_info fixed {"text": "Cobblemon", "color": "white"}
scoreboard players set #l_on qn_info 8
scoreboard players display name #l_on qn_info {"text": "Jugadores", "color": "light_purple"}
scoreboard players display numberformat #l_on qn_info fixed {"text": "0", "color": "green"}
scoreboard players set #l1 qn_info 7
scoreboard players display name #l1 qn_info {"text": " ", "color": "white"}
scoreboard players set #l_leg qn_info 6
scoreboard players display name #l_leg qn_info {"text": "Legendario en", "color": "light_purple"}
scoreboard players display numberformat #l_leg qn_info fixed {"text": "90 min", "color": "yellow"}
scoreboard players set #l_brd qn_info 5
scoreboard players display name #l_brd qn_info {"text": "Límite survival", "color": "light_purple"}
scoreboard players display numberformat #l_brd qn_info fixed {"text": "±10.000", "color": "white"}
scoreboard players set #l2 qn_info 4
scoreboard players display name #l2 qn_info {"text": "  ", "color": "white"}
scoreboard players set #l_menu qn_info 3
scoreboard players display name #l_menu qn_info {"text": "Viajar", "color": "light_purple"}
scoreboard players display numberformat #l_menu qn_info fixed {"text": "Brújula", "color": "aqua"}
scoreboard players set #l3 qn_info 2
scoreboard players display name #l3 qn_info {"text": "   ", "color": "white"}
scoreboard players set #l_ip qn_info 1
scoreboard players display name #l_ip qn_info {"text": "quantum network", "color": "dark_purple"}
team add a_owner
team modify a_owner prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify a_owner color white
team add b_coowner
team modify b_coowner prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify b_coowner color white
team add c_manager
team modify c_manager prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify c_manager color white
team add d_admin
team modify d_admin prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify d_admin color white
team add e_mod
team modify e_mod prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify e_mod color white
team add f_helper
team modify f_helper prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify f_helper color white
team add g_soporte
team modify g_soporte prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify g_soporte color white
team add h_mvpplus
team modify h_mvpplus prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify h_mvpplus color white
team add i_mvp
team modify i_mvp prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify i_mvp color white
team add j_vipplus
team modify j_vipplus prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify j_vipplus color white
team add k_vip
team modify k_vip prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify k_vip color white
team add l_usuario
team modify l_usuario prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify l_usuario color white