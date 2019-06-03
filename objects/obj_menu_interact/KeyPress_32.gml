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
			if(color_selection == 0)
			{
				obj_player.flashp = 0;
				obj_player.glow_inst.color = glodentColor.none;
			}
			else
			{
				obj_player.flashp = 1;
				obj_player.flash_color = available_colors[color_selection];
				var glow_color;
					switch(color_selection) {
						case 0: glow_color = glodentColor.none; break;
						case 1: glow_color = glodentColor.blue; break;
						case 2: glow_color = glodentColor.cyan; break;
						case 3: glow_color = glodentColor.yellow; break;
						case 4: glow_color = glodentColor.red; break;
						case 5: glow_color = glodentColor.pink; break;
						case 6: glow_color = glodentColor.orange; break;
						case 7: glow_color = glodentColor.green; break;
						default: glow_color = glodentColor.none;
					}

				obj_player.glow_inst.color = glow_color;
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