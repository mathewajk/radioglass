/// @description Insert description here
// You can write your code in this editor
width = display_get_gui_width();
height = display_get_gui_height();
xcen = width / 2;
ycen = height / 2;
if(menu_state == 0)
{
	radius = width / 8;
	draw_set_colour(c_white);
	draw_circle(xcen, ycen, width / 4, false);
	draw_set_color(c_black);
	draw_circle(xcen, ycen, (width / 4) - 10, false);
	for(i = 0; i < 4; i++)
	{
		draw_set_color(c_white);
		draw_circle(xcen + (radius * sin(i * (pi/2))), ycen - (radius * cos(i * (pi/2))), (width / 15), false);
		draw_set_color(c_black);
		draw_text(xcen + (radius * sin(i * (pi/2))), ycen - (radius * cos(i * (pi/2))), available_interactions[i]);
	}
	draw_set_color(c_yellow);
	angle = menu_selection * pi / 2;
	draw_text(xcen + radius * sin(angle), ycen - radius * cos(angle), available_interactions[menu_selection]);
}
else if(menu_state == 1)
{
	radius = width / 6;
	draw_set_colour(c_white);
	draw_circle(xcen, ycen, width / 4, false);
	draw_set_color(c_black);
	draw_circle(xcen, ycen, (width / 4) - 10, false);
	for(i = 0; i < 6; i++)
	{
		draw_set_color(available_colors[i]);
		draw_circle(xcen + (radius * sin(i * (pi/3))), ycen - (radius * cos(i * (pi/3))), (width / 20), false);
	}

	draw_set_color(c_white);
	angle = color_selection * pi / 3;
	draw_circle(xcen + radius * sin(angle), ycen + radius * cos(angle), (width / 40), false);
}