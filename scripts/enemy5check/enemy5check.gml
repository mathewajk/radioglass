// used in an object's script
// checks if the object hits barrier in the next frame 
// if the object goes at a given speed and direction
// or if the object exceeds a given bound range

var curr_x = argument0;
var curr_y = argument1;
var spd = argument2;
var theta = argument3;
var bound_x1 = argument4; //top-left corner of bound
var bound_y1 = argument5;
var bound_x2 = argument6; //bottem-right corner of bound
var bound_y2 = argument7;
var next_x = spd * cos(theta / 180 * pi) + curr_x;
var next_y = -1 * spd * sin(theta /180 * pi) + curr_y;

var out_of_bounds = !((bound_x1 <= next_x && next_x <= bound_x2) && (bound_y1 <= next_y && next_y <= bound_y2));
return out_of_bounds || place_meeting(next_x, next_y, obj_barrier); 