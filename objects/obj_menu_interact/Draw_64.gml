/// @description Insert description here
// You can write your code in this editor
if (active)
{
	var width = display_get_gui_width();
	var height = display_get_gui_height();
	var rect_width = 200;
	var rect_height = 400;
	var border_width = 5;
	var wheel_xscale = 5;
	var wheel_yscale = 5;
	var text_scale = 2
	var xcen = 150;
	var ycen = 500;
	// For demo, will only be using color menu
	if(menu_state == 0)
	{
		var num_options = array_length_1d(available_interactions);
		draw_set_colour(c_white);
		draw_rectangle(xcen - (rect_width / 2), ycen - (rect_height / 2), xcen + (rect_width / 2), ycen + (rect_height / 2), false);
		draw_set_color(c_black);
		draw_rectangle(xcen - (rect_width / 2) + border_width, ycen - (rect_height / 2) + border_width, xcen + (rect_width / 2) - border_width, ycen + (rect_height / 2) - border_width, false);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		for(var i = 0; i < num_options; i++)
		{
			draw_text_transformed_color(xcen, ycen + (((rect_height / 2) - border_width) * ((i / (num_options / 2)) - 1 + (1 / num_options))), available_interactions[i], text_scale, text_scale, 0, c_white, c_white, c_white, c_white, 1);
		}
		draw_set_color(c_yellow);
		draw_text_transformed_color(xcen, ycen + (((rect_height / 2) - border_width) * ((menu_selection / (num_options / 2)) - 1 + (1 / num_options))), available_interactions[menu_selection], text_scale, text_scale, 0, c_yellow, c_yellow, c_yellow, c_yellow, 1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
	else if(menu_state == 1)
	{
		switch(color_selection) {
			case 0: draw_sprite_ext(spr_cw_transp, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			case 1: draw_sprite_ext(spr_cw_red, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			case 2: draw_sprite_ext(spr_cw_orange, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			case 3: draw_sprite_ext(spr_cw_yellow, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			case 4: draw_sprite_ext(spr_cw_green, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			case 5: draw_sprite_ext(spr_cw_cyan, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			case 6: draw_sprite_ext(spr_cw_blue, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			case 7: draw_sprite_ext(spr_cw_pink, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
			default: draw_sprite_ext(spr_cw_transp, -1, xcen, ycen, wheel_xscale, wheel_yscale, 0, c_white, 1); break;
		}
	}
}

// OLD CODE FOR DRAWING CIRCULAR MENUS — USE AS PLACEHOLDER ONLY
/*		radius = width / 6;
		draw_set_colour(c_white);
		draw_circle(xcen, ycen, width / 4, false);
		draw_set_color(c_black);
		draw_circle(xcen, ycen, (width / 4) - 10, false);
		for(i = 0; i < 8; i++)
		{
			draw_set_color(available_colors[i]);
			draw_circle(xcen + (radius * sin(i * (pi/4))), ycen - (radius * cos(i * (pi/4))), (width / 20), false);
		}

		draw_set_color(c_white);
		angle = color_selection * pi / 4;
		draw_circle(xcen + radius * sin(angle), ycen - radius * cos(angle), (width / 40), false);
*/