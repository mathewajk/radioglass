/// @description Insert description here
// You can write your code in this editor
draw_self();
healthHelper(x, y - 30, hp, hits, c_black, c_red, c_green, 0, true, true);
if(coll_state == 1)
image_blend = c_red;
else
image_blend = c_white;

//draw_text(x - 30, y, string(mood));
//draw_text(x + 30, y, string(behavior_state));
	var player_angle = arctan2(y - obj_player.y, x - obj_player.x);
	var player_facing = 0;
	if(((obj_player.last_dir == 1) && (abs(player_angle) >= ((3 * pi) / 4))) ||
	   ((obj_player.last_dir == 2) && (abs(player_angle) < (pi / 4))) ||
	   ((obj_player.last_dir == 3) && (player_angle > ((-3 * pi) / 4)) && (player_angle <= ((-1 * pi) / 4))) ||
	   ((obj_player.last_dir == 4) && (player_angle >= (pi / 4)) && (player_angle < ((3 * pi) / 4))))
	{
		player_facing = 1;
	}
//draw_text(x, y - 40, string(player_facing));

if(glow_state == 1)
{
	draw_sprite_ext(spr_light, 0, x, y, 1, 1, 1, color, 0.5);
}

if(emote)
{
	var emo_offset_y = -20;
	var emo_offset_x = 0;
	switch(emote)
	{
		case glodentEmote.dots:
		{
			draw_sprite(spr_emo_dots, image_index, x + emo_offset_x, y + emo_offset_y);
			break;
		}
		case glodentEmote.exclaim:
		{
			draw_sprite(spr_emo_exclaim, image_index, x + emo_offset_x, y + emo_offset_y);
			break;
		}
		case glodentEmote.mad:
		{
			draw_sprite(spr_emo_mad, image_index, x + emo_offset_x, y + emo_offset_y);
			break;
		}
		case glodentEmote.question:
		{
			draw_sprite(spr_emo_question, image_index, x + emo_offset_x, y + emo_offset_y);
			break;
		}
		case glodentEmote.sad:
		{
			draw_sprite(spr_emo_sad, image_index, x + emo_offset_x, y + emo_offset_y);
			break;
		}
		case glodentEmote.smile:
		{
			draw_sprite(spr_emo_smile, image_index, x + emo_offset_x, y + emo_offset_y);
			break;
		}
		default:
		{
			break;
		}
	}
}