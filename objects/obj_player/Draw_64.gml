/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("K")))
{
	if(menu_open == 0)
	{
		interact_menu = instance_create_layer(0, 0, "instances_menu", obj_menu_interact);
		menu_open = 1;
	}
	else
	{	
		instance_destroy(obj_menu_interact);
		menu_open = 0;
	}
}