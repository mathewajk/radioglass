// @description: simply call this function to activate dialog
// @param An array that represents a conversation 

// see conversaton_1 script for example on how to format dialog

// There should only exist one obj_dialog instance 
var dialog_inst = instance_find(obj_dialog, 0);
show_debug_message("-----");
with (dialog_inst) {	
	if (!active) {
		active = true;
		var dialoglen = array_height_2d(argument0);
		dialogCount = 0;
		dialogIndex = 0;
		for (var i = 0; i < dialoglen; i++) {
			show_debug_message(string(i));
			dialog[dialogCount, 0] = argument0[i, 0];
			dialog[dialogCount, 1] = argument0[i, 1];
			dialogCount++;
		}
	}
}
show_debug_message("-----");
