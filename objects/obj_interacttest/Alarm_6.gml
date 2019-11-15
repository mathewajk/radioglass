/// @description Movement cycler
// You can write your code in this editor
var _dir = random(2 * pi);
var spd = 2;
hspeed = spd * cos(_dir);
vspeed = spd * sin(_dir);
forage_timer = forage_timer - 1;
if(forage_timer = 0)
{
	hspeed = 0;
	vspeed = 0;
	forage_timer = 5;
}
alarm[6] = 30;