///perp_octant1(x0,y0,dx, x7, einit,width,winit, tilemap_id):

var x0= argument0;
var y0= argument1;
var dx= argument2;
var dy= argument3;
var einit = argument4;
var width = argument5
var winit= argument6; 
var tilemap_id= argument7;

var xc=x0; //current x you are drawing
var yc=y0; //current y you are drawing
		
  var threshold = dx - 2*dy;
  var E_diag= -2*dx;
  var E_square= 2*dy;
  var wthr= 2*width*sqrt(dx*dx+dy*dy);

  
  var error= einit;
  var tk= dx+dy-winit;

  while (tk<=wthr){
     tilemap_set(tilemap_id, 13, xc,yc);
     if (error > threshold) { 
       xc= xc - 1;
       error = error + E_diag;
       tk= tk + 2*dy;
	 }
     error = error + E_square;
     yc= yc + 1;
     tk= tk + 2*dx;
  }

  
  xc=x0; //current x you are drawing
yc=y0; //current y you are drawing
  error= -einit;
  tk= dx+dy+winit;

  while (tk<=wthr) { 
      tilemap_set(tilemap_id, 13, xc,yc);
     if (error > threshold) { 
       xc= xc + 1;
       error = error + E_diag;
       tk= tk + 2*dy;
	 }
     error = error + E_square;
     yc= yc - 1;
     tk= tk + 2*dx;
  }

