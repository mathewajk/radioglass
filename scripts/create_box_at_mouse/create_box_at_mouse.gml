///@description cutscene_box_at_mouse

if(mouse_check_button_pressed(mb_left)){
	instance_create_layer(mouse_x,mouse_y,"Instances_trigger",obj_box);
	cutscene_end_action();
}
