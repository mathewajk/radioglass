/// @description Insert description here
// You can write your code in this editor
if (active)
{
	switch(menu_state)
	{
		case 0: 
			menu_selection++;
			if(menu_selection > 3)
				menu_selection = 0;
			break;
		case 1:
			color_selection++;
			if(color_selection > 5)
				color_selection = 0;
			break;
		default:
			break;
	}
}