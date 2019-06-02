/// @description Insert description here
// You can write your code in this editor
width = display_get_gui_width();
height = display_get_gui_height();
draw_set_colour(c_white);
draw_circle(width / 2, height / 2, width / 4, false);
draw_set_color(c_black);
draw_circle(width / 2, height / 2, (width / 4) - 10, false);
draw_set_color(c_aqua);
draw_circle(width / 2 + width / 5, height / 2, (width / 20), false);
draw_set_color(c_yellow);
draw_circle(width / 2 - width / 5, height / 2, (width / 20), false);
draw_set_color(c_blue);
draw_circle(width / 2 + width / 10, height / 2 + width / 7, (width / 20), false);
draw_set_color(c_red);
draw_circle(width / 2 - width / 10, height / 2 + width / 7, (width / 20), false);
draw_set_color(c_orange);
draw_circle(width / 2 + width / 10, height / 2 - width / 7, (width / 20), false);
draw_set_color(c_fuchsia);
draw_circle(width / 2 - width / 10, height / 2 - width / 7, (width / 20), false);
draw_set_color(c_white);