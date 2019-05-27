/// @description Displaying text
// Displays one more character per frame to produce typewriter effect

if (currCharIndex < string_length(dialog[dialogIndex, 1]) + 1) {
	spriteToDisplay = dialog[dialogIndex, 0];
	if (frames_waited == frames_per_char) {
		stringToDisplay += string_char_at(dialog[dialogIndex, 1], currCharIndex);
		currCharIndex++;
		if (frames_waited > 1) {
			frames_waited = 1;
		}
	}
	else {
		frames_waited++;
	}
} else {
	// Press this key to display new line of text
	if (keyboard_check_pressed(vk_f7)) { 
		dialogIndex++;
		stringToDisplay = "";
		currCharIndex = 1; // STRING INDEXING STARTS AT 1 
		
		// hide dialog window when all dialog lines are run
		if (dialogIndex == dialogCount)
		{
			active = false;
		}
	}
}