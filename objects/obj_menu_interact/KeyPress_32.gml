/// @description Insert description here
// You can write your code in this editor
switch(menu_state)
{
	case 0:
		menu_state = menu_selection + 1;
		break;
	case 1:
		obj_player.flash_color = available_colors[color_selection];
		
		break;
	default:
		break;
}