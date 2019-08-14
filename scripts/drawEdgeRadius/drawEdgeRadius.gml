///drawCircle(x0,y0,x1,y1,tilemap_id,terraform)

var x0= argument0;
var y0= argument1;
var x1= argument2;
var y1= argument3;
//var tilemap_id= argument4;
//var attack = argument5;

var dx = x1 - x0;
var dy = y1 - y0;

var radius = round(sqrt(abs(power(dx, 2) + power(dy, 2)))) + 3;

for(var xc = (x0-radius)+1; xc < (x0+radius); xc++)
{
	for(var yc = (y0-radius)+1; yc < (y0+radius); yc++)
	{
		var cen_to_curr = sqrt(power((xc - x0), 2) + power((yc - y0), 2));
		if (cen_to_curr <= radius)
		{
			drawEdge(xc, yc);
		}
	}
}
