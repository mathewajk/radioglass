/// @description Insert description here
// You can write your code in this editor
if(gamepad_is_connected(0) && gamepad_button_check_pressed(0, gp_face1))
{
	fade = true;
	alarm[0] = fade_frames;
	audio_sound_gain(snd, 0, 2000);
}