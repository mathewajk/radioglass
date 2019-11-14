///#description cutscene_end_action


scene++;
if (scene >= array_length_1d(scene_info)){
	instance_destroy();
	exit;
}

event_perform(ev_other,ev_user0);