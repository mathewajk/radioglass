t_scene_info = [
	[create_box_at_mouse],
	[cutscene_change_variable,obj_player,"control",false],
	[cutscene_move_character,obj_player,200,200,true,4],
	[cutscene_change_variable,obj_player,"control",true],	
	[create_box_at_mouse],
	[cutscene_move_character,obj_player,10,10,true,4],
	[create_box_at_mouse],
];