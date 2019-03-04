/// @description Insert description here
// You can write your code in this editor
width = display_get_gui_width();
height = display_get_gui_height();
//draw_sprite(spr_textbox, 0, xtext, ytext);
draw_set_colour(c_white);
draw_rectangle(width/16, height*11/16, width*15/16, height*15/16, false);
draw_set_colour(c_black);
draw_rectangle((width/16) + 5, (height*11/16) + 5, (width*15/16)-5, (height*15/16)-5, false);
draw_text_ext_colour((width/16) + 20, (height*11/16) + 20, text, 10, 350, c_white, c_white, c_white, c_white, 100);
