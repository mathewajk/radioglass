/// @description Insert description here
// You can write your code in this editor

var cx=camera_get_view_x(view_camera[0]), cy=camera_get_view_y(view_camera[0]);

if (active) {
	draw_set_color(c_white);
		draw_rectangle(cx + xOrigin, cy + yOrigin, cx + xOrigin + width, cy + yOrigin + height, false);

		draw_set_color(c_black);
		draw_rectangle(cx + inBox_xOrigin, cy + inBox_yOrigin, cx + inBox_xOrigin + inBoxW, cy + inBox_yOrigin + inBoxH, false);
	
		draw_set_color(c_white);
		if (text_font != -1) {
			draw_set_font(text_font);	
		}
	if (spriteToDisplay == 0) {
		// no sprite to show, draw text at a different position
		
		draw_text(cx + inBox_xOrigin + 15, cy + inBox_yOrigin + 15, stringToDisplay);
		
	} else if (spriteToDisplay != -1) {
		draw_text(cx + text_xOrigin, cy + text_yOrigin, stringToDisplay);
		
		avatarScale = sprite_get_height(spriteToDisplay) / inBoxH;
		if (spriteToDisplay == spr_playerStandForward) {
			draw_sprite_ext(spriteToDisplay, -1, cx + avatar_xOrigin, cy+ avatar_yOrigin + 12, avatarScale, avatarScale, 0, c_white, 1);
		} else {
			draw_sprite_ext(spriteToDisplay, -1, cx + avatar_xOrigin, cy+ avatar_yOrigin, avatarScale, avatarScale, 0, c_white, 1);
		}
	}
		
}