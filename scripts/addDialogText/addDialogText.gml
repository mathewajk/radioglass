// @description Add dialog text
// @param An array that represents the dialog

var dialoglen = array_height_2d(argument0);

dialogCount = 0;
dialogIndex = 0;

for (var i = 0; i < dialoglen; i++) {
	show_debug_message("Added convo string ")
	show_debug_message(argument0[i, 1]);
	dialog[dialogCount, 0] = argument0[i, 0];
	dialog[dialogCount, 1] = argument0[i, 1];
	dialogCount++;
}

