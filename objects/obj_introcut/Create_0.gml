/// @description Insert description here
// You can write your code in this editor

imagenum = 1;
dialog_inst = activateDialog(intro_1());

with (dialog_inst) {
	key_for_new_line = vk_space;
	text_font = intro_font;
	height = 120;
	bottomPadding = 80;
	leftPadding = 50;
	rightPadding = 50;
	screen_width = room_width;
	screen_height = room_height;
	
	width = screen_width - leftPadding - rightPadding;
	xOrigin = leftPadding;
	yOrigin = screen_height - height - bottomPadding;
	
	borderSize = 10;
	inBoxW = width - borderSize;
	inBoxH = height - borderSize;
	inBox_xOrigin = xOrigin + (borderSize / 2);
	inBox_yOrigin = yOrigin + (borderSize / 2);

	// dialog display properties
	avatar_xOrigin = inBox_xOrigin + 20;
	avatar_yOrigin = inBox_yOrigin + 20;

	text_xOrigin = avatar_xOrigin + 30;
	text_yOrigin = inBox_yOrigin + 8;
}

//cutscene_create_dialogue(intro_1); 