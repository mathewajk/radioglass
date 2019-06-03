/// @description Insert description here
// You can write your code in this editor
if (active)
{
	switch(menu_state)
	{
		case 0: 
			menu_selection--;
			if(menu_selection < 0)
				menu_selection = array_length_1d(available_interactions) - 1;
			break;
		case 1:
			color_selection--;
			if(color_selection < 0)
				color_selection = array_length_1d(available_colors) - 1;
			break;
		default:
			break;
	}
}