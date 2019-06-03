///@description cutscene_move_camera
///@arg conversation

var in = in_dialog;
var dialog_inst = instance_find(obj_dialog, 0);

with (dialog_inst){
	if (!active && in == -1){
		activateDialog(argument0);
		with (other){
			in_dialog = 1;
		}
	}
	else if (!active && dialogIndex > 0){
		with (other){
			in_dialog = -1;
			cutscene_end_action();
		}
	}
}

