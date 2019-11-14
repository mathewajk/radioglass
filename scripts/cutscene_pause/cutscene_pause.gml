///@description custscene_pause
///@arg pause_time

pause_time = argument0*room_speed;
if (!pause){
	alarm[0] = pause_time;
	pause = true
}

