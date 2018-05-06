/// @description Insert description here
// You can write your code in this editor

var x0 = floor(x/4);
var y0 = floor(y/4);
var x1 = x0 + radius;
var y1 = y0 + radius;

for(var xc = (x0-radius)+1; xc < (x0+radius); xc++)
{
	for(var yc = (y0-radius)+1; yc < (y0+radius); yc++){
		var cen_to_curr = sqrt(power((xc - x0), 2) + power((yc - y0), 2));
		if(cen_to_curr <= radius){
			instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_damage);
		}
	}
}
