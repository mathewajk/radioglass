/// @description Insert description here
// You can write your code in this editor
if(speed > 0)
{
	speed = speed - (accel)
}
if(speed < 0)
{
	speed = 0
}
if(position_meeting(x + 16*sign(hspeed), y + 16*sign(vspeed), obj_barrier))
{
	speed = 0;
}
