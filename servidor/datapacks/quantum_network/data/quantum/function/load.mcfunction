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
scoreboard objectives add qn_info dummy {"text": "", "color": "white"}
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
team modify a_owner prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify a_owner color white
team add b_coowner
team modify b_coowner prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify b_coowner color white
team add c_manager
team modify c_manager prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify c_manager color white
team add d_admin
team modify d_admin prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify d_admin color white
team add e_developer
team modify e_developer prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify e_developer color white
team add f_moderador
team modify f_moderador prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify f_moderador color white
team add g_soporte
team modify g_soporte prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify g_soporte color white
team add h_helper
team modify h_helper prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify h_helper color white
team add i_builder
team modify i_builder prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify i_builder color white
team add j_artista
team modify j_artista prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify j_artista color white
team add k_tester
team modify k_tester prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify k_tester color white
team add l_partner
team modify l_partner prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify l_partner color white
team add m_booster
team modify m_booster prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify m_booster color white
team add n_campeon
team modify n_campeon prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify n_campeon color white
team add o_elite4
team modify o_elite4 prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify o_elite4 color white
team add p_lider
team modify p_lider prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify p_lider color white
team add q_mvpplus
team modify q_mvpplus prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify q_mvpplus color white
team add r_mvp
team modify r_mvp prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify r_mvp color white
team add s_vipplus
team modify s_vipplus prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify s_vipplus color white
team add t_vip
team modify t_vip prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify t_vip color white
team add u_usuario
team modify u_usuario prefix [{"text": "", "color": "white"}, {"text": " "}]
team modify u_usuario color white
