t_scene_info = [
	[cutscene_change_variable,obj_player,"in_cutscene",true],
	[cutscene_create_dialogue,conversation_1()],
	[cutscene_move_camera,obj_camera,inst_19DAF2CB.x + 100 - x,0,true,true,4],
	[cutscene_create_dialogue,conversation_2()],	
	[cutscene_change_variable,obj_player,"in_cutscene",false],	
]