/// @description Insert description here
// You can write your code in this editor
if(active)
{
	switch(menu_state)
	{
		case 0:
			if(menu_selection == 0)
				menu_state = menu_selection + 1;
			break;
		case 1:
			if(color_selection == 5)
				obj_player.flashp = 0;
			else
			{
				obj_player.flashp = 1;
				obj_player.flash_color = available_colors[color_selection];
			}
			active = 0;
			menu_state = 0;
			break;
		case 2:
			active = 0;
			menu_state = 0;
			break;
		case 3:
			active = 0;
			menu_state = 0;
			break;
		case 4:
			active = 0;
			menu_state = 0;
			break;
		default:
			break;
	}
}