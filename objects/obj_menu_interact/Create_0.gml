/// @description Insert description here
// You can write your code in this editor
active = 1;
menu_state = 1;
menu_selection = 0;
color_selection = 0;
default_state = 1;

global.c_glo_red = make_color_rgb(255, 110, 112);
global.c_glo_orange = make_color_rgb(255, 157, 26);
global.c_glo_yellow = make_color_rgb(255, 255, 93);
global.c_glo_green = make_color_rgb(152, 255, 0);
global.c_glo_cyan = make_color_rgb(153, 255, 255);
global.c_glo_blue = make_color_rgb(134, 135, 255);
global.c_glo_pink = make_color_rgb(255, 175, 255);

available_colors = [c_black, global.c_glo_red, global.c_glo_orange, global.c_glo_yellow, global.c_glo_green, global.c_glo_cyan, global.c_glo_blue, global.c_glo_pink];
available_interactions = ["COLOR CHANGE", "LOCKED", "LOCKED", "LOCKED"];


