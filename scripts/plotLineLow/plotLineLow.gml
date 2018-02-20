///plotLineLow(x0,y0, x1,y1, tilemap_id)

var x0 = argument0;
var y0 = argument1;
var x1 = argument2;
var y1 = argument3;
var tilemap_id = argument4;

var d;
var dx;
var dy;
var yc;
var yi;

  dx = x1 - x0;
  dy = y1 - y0;
  yi = 1;
  if (dy < 0) { 
    yi = -1;
    dy = -dy;
  }
 
  d = 2*dy - dx;
  yc = y0

  for (var xc = 0; xc < x1; xc++) {
    tilemap_set(tilemap_id, 13, xc,yc);
    if (d > 0) {
       yc = yc + yi;
       d = d - 2*dx;
	}
    d = d + 2*dy;
  }