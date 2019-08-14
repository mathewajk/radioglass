///drawCircle(x0,y0,x1,y1,tilemap_id,terraform)

var x0= argument0;
var y0= argument1;
var x1= argument2;
var y1= argument3;
var tilemap_id= argument4;
var terraform_on = argument5;
var bullet = argument6;
var layer_id_grass = layer_get_id("small_tiles_terraformed");
var tilemap_id_grass = layer_tilemap_get_id(layer_id_grass);
var layer_id_water = layer_get_id("water_layer");
var tilemap_id_water = layer_tilemap_get_id(layer_id_water);
var layer_id_path = layer_get_id("small_tiles_path");
var tilemap_id_path = layer_tilemap_get_id(layer_id_path);

var dx = x1 - x0;
var dy = y1 - y0;


var radius = 10;//round(sqrt(abs(power(dx, 2) + power(dy, 2))));


for(var xc = (x0-radius)+1; xc < (x0+radius); xc++)
{
	for(var yc = (y0-radius)+1; yc < (y0+radius); yc++)
	{
		var cen_to_curr = sqrt(power((xc - x0), 2) + power((yc - y0), 2));
		if (cen_to_curr <= radius)
		{
			if(tilemap_get(tilemap_id_grass, xc, yc) == 0 && tilemap_get(tilemap_id_water, xc, yc) == 0 && !instance_position(floor(xc) * 4, floor(yc) * 4, obj_barrier)) {
				if(true) {
				  var coinflip = floor(random(4));
			
				  if(coinflip != 0)
					tilemap_set(tilemap_id, 15, xc, yc);
				  else
					tilemap_set(tilemap_id, 17, xc, yc);
				  switch (bullet){
					case 1: instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_damage); break;
					case 2: instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_slow); break;
				  }
				}
				else {
					tilemap_set(tilemap_id_path, 2, xc,yc);
				}
			}
		}
	}
}
