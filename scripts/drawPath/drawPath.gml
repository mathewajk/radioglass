///drawPath(x0,y0,x1,y1,width,tilemap_id)

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


  var dx= x1 - x0;
  var dy= y1 - y0;
  var p_error= 0;
  var error= 0;
  var yc= y0;
  var xc= x0;
  var threshold = dx - 2*dy;;
  var E_diag= -2*dx;
  var E_square= 2*dy;
  var length = dx+1;


  for (var p= 1; p<length; p++) { 
    lineWidth(xc,yc, dx, dy, p_error,width,error, tilemap_id)
    if (error > threshold)  {
      yc= yc + 1;
      error = error + E_diag;
      if (p_error > threshold) {
        lineWidth(xc,yc, dx, dy, p_error+E_diag+E_square,width,error,tilemap_id);
        p_error= p_error + E_diag;
	  }
      p_error= p_error + E_square;
	}
    error = error + E_square;
    xc= xc + 1;
  }