///drawCircle(x0,y0,x1,y1,tilemap_id,terraform)

var x0= argument0;
var y0= argument1;
var x1= argument2;
var y1= argument3;
var tilemap_id= argument4;
var terraform_on = argument5;

var dx = x1 - x0;
var dy = y1 - y0;

var radius = round(sqrt(power(dx, 2) + power(dy, 2)));

for(var xc = (x0-radius)+1; xc < (x0+radius); xc++)
{
	for(var yc = (y0-radius)+1; yc < (y0+radius); yc++)
	{

	if(sqrt(power((xc - x0), 2) + power((yc - y0), 2)) <= radius)
	{
	if(tilemap_get(tilemap_id, xc, yc) == 0) {
		if(terraform_on) {
		  var coinflip = floor(random(4));
			
		  if(coinflip != 0)
			tilemap_set(tilemap_id, 35, xc, yc);
		  else
			tilemap_set(tilemap_id, 37, xc, yc);
			
		  instance_create_layer(floor(xc) * 4, floor(yc) * 4, "instances_paths", obj_damage);
		}
		else {
			tilemap_set(tilemap_id, 36, xc,yc);
		}
	}
	}
	}
}
