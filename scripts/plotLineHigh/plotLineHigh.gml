///plotLineHigh(x0,y0, x1,y1, tilemap_id)

var x0 = argument0;
var y0 = argument1;
var x1 = argument2;
var y1 = argument3;
var tilemap_id = argument4;

var d;
var dx;
var dy;
var xc;
var xi;

  dx = x1 - x0;
  dy = y1 - y0;
  xi = 1;
  if (dx < 0) { 
    xi = -1;
    dx = -dx;
  }
 
  d = 2*dx - dy;
  xc = x0;

  for (var yc = 0; yc < y1; yc++) {
	tilemap_set(tilemap_id, 13, xc,yc);
    if (d > 0) {
       xc = xc + xi;
       d = d - 2*dy;
	}
    d = d + 2*dx;
  }