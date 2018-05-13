/// @description Insert description here
// You can write your code in this editor
if(position_meeting(x, y, obj_explosion))
{
	direction = point_direction(obj_explosion.x, obj_explosion.y,x,y);
	speed = blast/sqrt(power(x-obj_explosion.x, 2) + power(y-obj_explosion.y, 2));
}
