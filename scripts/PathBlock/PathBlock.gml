var x0 = argument0;
var y0 = argument1;
var x1 = argument2;
var y1 = argument3;
var len =argument4;

var dx= x1 - x0,dy= y1 - y0;
var curr_len = 0;
var update = 2;
var len1 = len*4;
if (dx==0 && dy==0) return len;

var dir = pi*point_direction(x0,y0,x1,y1)/180;
dx = cos(dir)*update;
dy = -sin(dir)*update;

while(true)	{
	x0 += dx;
	y0 += dy;
	curr_len += update;
	if (curr_len >= len1) return len;
	if (position_meeting(x0,y0,obj_barrier) || position_meeting(x0,y0,obj_rock)) {
		return round(curr_len/4);}
	
}
