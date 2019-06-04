/// @description Insert description here
// You can write your code in this editor

imagenum = 1;
dialog_inst = activateDialog(intro_1());

with (dialog_inst) {
	key_for_new_line = vk_space;
	text_font = intro_font;
	height = 200;
}
//cutscene_create_dialogue(intro_1); 