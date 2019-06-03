t_scene_info = [
	[cutscene_change_variable,obj_player,"in_cutscene",true],
	[cutscene_change_variable,obj_interacttest,"behavior_state",-1],
	[cutscene_move_camera,obj_camera,300,400,true,true,6],
	
	[cutscene_move_character,inst_362BE25E,-100,-70,true,4],	
	[cutscene_change_variable,inst_362BE25E,"behavior_state",1],
	[cutscene_create_dialogue,conversation_4()],
	[cutscene_change_variable,obj_interacttest,"behavior_state",0],
	[cutscene_change_variable,obj_interacttest,"in_cutscene",false],
	[cutscene_change_variable,obj_player,"in_cutscene",false],	
];

