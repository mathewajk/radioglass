///drawPath(x0,y0,x1,y1,width,tilemap_id,terraform)

//code taken from http://kt8216.unixcab.org/murphy/index.html

//function that draws paths
//currently only works properly in the octant 45 degrees 
//under the positive x axis on a normal graph


var x0= argument0;
var y0= argument1;
var x1= argument2;
var y1= argument3;
var width = argument4; 
var tilemap_id= argument5;
var terraform_on = argument6;

var dx= x1 - x0;
var dy= y1 - y0;
  
var xstep = 1;
var ystep = 1;
if (dx < 0)
	xstep = -1; //test to see if path lies in negative x quadrant
if (dy < 0)
	ystep = -1; //test to see if path lies in negative y quadrant
  
var p_error= 0;
var error= 0;
var yc= y0;
var xc= x0;
  
var vOctant = (abs(dy) > abs(dx)); //test to see if path lies in vertical octant
  
if (vOctant)
{
	var threshold = abs(dy) - 2*abs(dx);
	var E_diag= -2*abs(dy);
	var E_square= 2*abs(dx);
	var length = abs(dy)+1;
}
else
{
	var threshold = abs(dx) - 2*abs(dy);
	var E_diag= -2*abs(dx);
	var E_square= 2*abs(dy);
	var length = abs(dx)+1;
}


for (var p= 1; p<length; p++) { 
	lineWidth(xc, yc, dx, dy, p_error, width, error, tilemap_id, terraform_on);
	if (error > threshold)  {
		if (vOctant)
			xc = xc + xstep;
		else
			yc= yc + ystep;
	    error = error + E_diag;
	    if (p_error > threshold) {
			lineWidth(xc, yc, dx, dy, p_error + E_diag + E_square, width, error, tilemap_id, terraform_on);
	    p_error= p_error + E_diag;
	}
    p_error= p_error + E_square;
}

error = error + E_square;

if (vOctant)
		yc= yc + ystep;
	else
		xc = xc + xstep;
}