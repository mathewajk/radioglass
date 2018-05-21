///deflectEnemy(x0, y0, object, range)

var player = argument0;
var object = argument1;
var range = argument2;

var dx = object.x-player.x;
var dy = object.y-player.y;
var potential_dx = dx + object.hspeed - player.hspeed;
var potential_dy = dy + object.vspeed - player.vspeed;
var distance = sqrt(power(dx, 2) + power(dy, 2));
var potential_distance = sqrt(power(potential_dx, 2) + power(potential_dy, 2));
dx /= distance;
dy /= distance;

var force = 5;
if((distance >= range) && (potential_distance <= range))
{
	object.hspeed = 0;
	object.vspeed = 0;
}
else if(distance < range)
{
	if(!place_meeting((object.x + force*dx), (object.y), obj_barrier))
		object.x += force*dx;
	if(!place_meeting(object.x, (object.y + force*dy), obj_barrier))
		object.y += force*dy;
}