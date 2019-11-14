///@description cutscene_escape_burrow
 
with(obj_interacttest){
	if (x  == 1 && y == 1){
		in_cutscene = true;
		behavior_state =  0;
		var tempx = 779 + random(200);
		var tempy = 1056 + random(200);
		
		while(!place_empty(tempx,tempy)){ 
		  tempx = 779 + random(200);
		  tempy = 1056 + random(200);
		};
		
		var t_scene_info;
		t_scene_info = [[cutscene_move_character, id, 755 + random(50),1422 + random(50), false, 100000],
						[cutscene_move_character, id, tempx,tempy, false, 5]];
		var this = instance_create_layer(0, 0,  "Instances_trigger", obj_trigger);
		this.t_scene_info = t_scene_info;
		this.concurrent = true;
		behavior_state =  0;
		this.triggered = true;
	}
}
cutscene_end_action();
