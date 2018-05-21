/// @description Insert description here
// You can write your code in this editor
draw_self();
healthHelper(x, y - 30, hp, hits, c_black, c_red, c_green, 0, true, true);

if (taking_damage) 
	image_blend = c_red;
else
	image_blend = c_white;