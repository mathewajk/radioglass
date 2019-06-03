t_scene_info = [
	[cutscene_change_variable,obj_player,"in_cutscene",true],	
	[cutscene_activate_trigger,inst_7BAABCFC],
	[cutscene_change_variable,inst_19DAF2CB,"behavior_state",2],
	[cutscene_move_character,inst_19DAF2CB,70,0,true,8],
	[cutscene_move_character,inst_19DAF2CB,0,50,true,8],		
	[cutscene_move_character,inst_19DAF2CB,300,0,true,8],
	[cutscene_create_dialogue,conversation_3()],
	[cutscene_move_camera,obj_camera,-100,0,true,true,2],
	[cutscene_change_variable,obj_player,"in_cutscene",false],	
	[cutscene_change_variable,inst_19DAF2CB,"behavior_state",1],
];

