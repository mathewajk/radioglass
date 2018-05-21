/// @description Set up lighting
// You can write your code in this editor

// Create a surface the size of the view
sfc_light = -100;

snd = audio_play_sound(snd_wind, 10, 1);
audio_sound_gain(snd, 0, 0);
audio_sound_gain(snd, 1, 5000);