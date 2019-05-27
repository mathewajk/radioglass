/// @description Insert description here
// You can write your code in this editor

var cx=camera_get_view_x(view_camera[0]), cy=camera_get_view_y(view_camera[0]);

if (active) {
	draw_set_color(c_white);
	draw_rectangle(cx + xOrigin, cy + yOrigin, cx + xOrigin + width, cy + yOrigin + height, false);

	draw_set_color(c_black);
	draw_rectangle(cx + inBox_xOrigin, cy + inBox_yOrigin, cx + inBox_xOrigin + inBoxW, cy + inBox_yOrigin + inBoxH, false);
	
	draw_set_color(c_white);
	draw_text(cx + text_xOrigin, cy + text_yOrigin, stringToDisplay);
	
	if (spriteToDisplay == spr_playerStandForward) {
		draw_sprite_ext(spriteToDisplay, -1, cx + avatar_xOrigin, cy+ avatar_yOrigin + 12, avatarScale, avatarScale, 0, c_white, 1);
	} else {
		draw_sprite_ext(spriteToDisplay, -1, cx + avatar_xOrigin, cy+ avatar_yOrigin, avatarScale, avatarScale, 0, c_white, 1);
	}
	
}