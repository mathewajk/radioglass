///deflectEnemy(x0, y0, object, range)

var player = argument0;
var object = argument1;
var range = argument2;

var dx = object.x-player.x;
var dy = object.y-player.y;
var distance = sqrt(power(dx, 2) + power(dy, 2));
dx /= distance;
dy /= distance;

/*if(power(dx, 2) + power(dy, 2) >= range && power(dx, 2) + power(dy, 2) <= range + 5)
{
	object.hspeed = 0;
	object.vspeed = 0;
}
else*/
{
	object.x += 2*dx;
	object.y += 2*dy;
}