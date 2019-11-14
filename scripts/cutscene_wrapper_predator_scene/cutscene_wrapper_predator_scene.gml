t_scene_info = [
	[cutscene_change_variable,obj_player,"in_cutscene",true],	
	[cutscene_escape_burrow],
	[cutscene_create_dialogue, conversation_12()],
	[cutscene_instance_destroy,inst_FDC2AF],
    [cutscene_move_character,inst_4F8B4CAA, obj_player.x, obj_player.y - 50, false, 2],
	[cutscene_pause,0.5],
	[cutscene_move_character,inst_4F8B4CAA, obj_player.x - 100, obj_player.y - 10, false, 2],
	[cutscene_create_dialogue, conversation_13()],
	[cutscene_move_character,inst_4F8B4CAA, obj_player.x - 50, obj_player.y - 10, false, 2],
	[cutscene_create_dialogue, conversation_14()],
	[cutscene_predator_jumps_at_feng],
	[cutscene_pause,1],
	[cutscene_create_dialogue, conversation_15()],
	
	[cutscene_move_character,inst_4F8B4CAA, 0, 5, true, 2],
	[cutscene_move_character,obj_player, 0, 30, true, 3.5],
	[cutscene_move_character,inst_4F8B4CAA, 0, 20, true, 4],
	[cutscene_move_character,inst_4F8B4CAA, -40, 0, true, 2],
	[cutscene_move_character,inst_4F8B4CAA, -20, -20, true, 2],
	[cutscene_move_character,inst_4F8B4CAA, 20, -20, true, 2],
	[cutscene_move_character,inst_4F8B4CAA, 20, 20, true, 2],
	[cutscene_move_character,inst_4F8B4CAA, -40, 0, true, 2],
	[cutscene_move_character,inst_4F8B4CAA, 653, 931, false, 2],
	[cutscene_move_character,inst_4F8B4CAA, 0, 0, false, 100000],
	
	[cutscene_glodents_come_out],
	[cutscene_create_dialogue, conversation_16()],
	[cutscene_glodents_out_cutscene],
	[cutscene_change_variable,obj_player,"in_cutscene",false],		
];

var this = instance_create_layer(0,0,"Instances_trigger", obj_trigger);
this.concurrent = true;
this.t_scene_info = t_scene_info;
this.triggered = true;

cutscene_end_action();
