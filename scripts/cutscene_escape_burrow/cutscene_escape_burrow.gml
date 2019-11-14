///@description cutscene_escape_burrow

with(obj_interacttest){
		
	if (x >632 && y > 780 && x < 1139 && y < 1344){
		in_cutscene = true;
		behavior_state = 2;
		
		var t_scene_info;
		var escape_spd = 7;
		if (x <850)
			t_scene_info = [[cutscene_move_character, id, 746,1457, false, escape_spd],
							[cutscene_move_character, id, 1,1, false, 1000000]];
		else 
			t_scene_info = [[cutscene_move_character, id, 985,1407, false, escape_spd],
							[cutscene_move_character, id, 1, 1, false, 1000000]];
		var this = instance_create_layer(0, 0,  "Instances_trigger", obj_trigger);
		this.t_scene_info = t_scene_info;
		this.concurrent = true;
		behavior_state = 2;
		this.triggered = true;
	}
	show_debug_message(behavior_state);
}
cutscene_end_action();
