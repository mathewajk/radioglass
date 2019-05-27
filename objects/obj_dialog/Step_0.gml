/// @description Displaying text



if (currCharIndex < string_length(dialog[dialogIndex, 1]) + 1) {
	spriteToDisplay = dialog[dialogIndex, 0];
	stringToDisplay += string_char_at(dialog[dialogIndex, 1], currCharIndex);
	currCharIndex++;

} else {
	if (keyboard_check_pressed(vk_f7)) { // Press this key to display new line of text
		dialogIndex++;
		stringToDisplay = "";
		currCharIndex = 1; // STRING INDEXING STARTS AT 1 
		
		if (dialogIndex == dialogCount)
		{
			active = false;
		}
	}
}