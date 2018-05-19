///drawFan(x0,y0,x1,y1, angle, tilemap_id,terraform)

var x0= argument0;
var y0= argument1;
var x1= argument2;
var y1= argument3;
var angle = argument4;
var tilemap_id= argument5;
var terraform_on = argument6;
var bullet = argument7;
var water_layer = layer_get_id("water_layer");
var water_id = layer_tilemap_get_id(water_layer);


var dx = x1 - x0;
var dy = y1 - y0;
var radius = round(sqrt(abs(power(dx, 2) + power(dy, 2))));

for(var xc = (x0-radius)+1; xc < (x0+radius); xc++)
{
	for(var yc = (y0-radius)+1; yc < (y0+radius); yc++)
	{
		var cen_to_curr = sqrt(power((xc - x0), 2) + power((yc - y0), 2));
		var curr_to_curs = sqrt(power((xc - x1), 2) + power((yc - y1), 2));
		var cur_angle = (power(radius, 2) + power(cen_to_curr, 2) - power(curr_to_curs, 2)) / (2*radius*cen_to_curr);
		if(cur_angle > 1)
		{
		cur_angle = 1;
		}
		if(cur_angle < -1)
		{
		cur_angle = -1;
		}
		if(cur_angle >= cos(angle/2))
		{
			if(cen_to_curr <= radius)
			{
				if(tilemap_get(tilemap_id, xc, yc) == 0 && tilemap_get(water_id, xc, yc) == 0) {
					if(terraform_on) {
					  var coinflip = floor(random(4));
			
					  if(coinflip != 0)
						tilemap_set(water_id, 35, xc, yc);
					  else
						tilemap_set(water_id, 37, xc, yc);
			
					  switch (bullet){
						case 1: instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_damage); break;
						case 2: instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_slow); break;
					  }
					}
					else {
						tilemap_set(tilemap_id, 36, xc,yc);
					}
				}
			}
		}
	}
}
