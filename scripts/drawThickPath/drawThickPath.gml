///drawPath(x0, y0, x1, y1, tilemap_id)

/*
var x0= argument0;
var y0= argument1;
var x1= argument2;
var y1= argument3;
var tilemap_id= argument4;

var xc=x0; //current x you are drawing
var yc=y0; //current y you are drawing
			
			
			
			//function bitmap = murphy_line_draw(bitmap, pt0, pt1, thickness)


var dx = x1-x0; 
var dy = y1 - y0;

var sd0x;      
var sd0y;
var dd0x; 
var dd0y;

var inc_x = sign(sign(dx) + 0.5);                             
var inc_y = sign(sign(dy) + 0.5);

if (dx < 0) {
	dx = -dx; 
}
if (dy < 0) {
	dy = -dy; 
}

if (dx > dy) {
    var len = dx;
    
    sd0x = 0;      
	sd0y = inc_y;
    dd0x = -inc_x; 
	dd0y = inc_y;

    var sd1x = inc_x; 
	var sd1y = 0;
    var dd1x = inc_x; 
	var dd1y = inc_y;

    var ku = 2*dx;                                                       
    var kv = 2*dy;                                                   
    var kd = kv - ku;                                             
    var kt = dx - kv;                                //threshold for error term
	
} else {
    len = dy;
    
    sd0x = inc_x; sd0y = 0;
    dd0x = inc_x; dd0y = -inc_y;

    sd1x = 0;     sd1y = inc_y;
    dd1x = inc_x; dd1y = inc_y;

    ku = 2*dy;                                                       
    kv = 2*dx;                                                       
    kd = kv - ku;                                             

    kt = dy - kv;                                //threshold for error term
}

// Initialization                                         % Figure 5A in [1]

var tk = 2*4*sqrt(dx*dx + dy*dy);             //% threshold for thickness

var d0 = 0;                                             //% outer loop error term
var d1 = 0;                                             //% inner loop error term
var dd = 0;                                             //% thickness error term

//% Murphy line draw
//% ----------------
while (dd < tk){                          ////% outer loop (perpendicular to line)

    //bitmap = bresenham_line_draw(bitmap, pt0, d1);

    if (d0 < kt){//                          % square move (d0 -> M0, dd -> M0)
        xc = xc + sd0x;
        yc = yc + sd0y;
	}
    else  {                       //      % diagonal move (d0 -> M1, dd -> M1)
        dd = dd + kv;
        d0 = d0 - ku;
	}

        if (d1 < kt ) {                    // % diagonal move (d1 needs extra M0)
            xc = xc + dd0x;
            yc = yc + dd0y;

            d1    = d1 - kv;
		} else  {                  // % (double) square move (d1 needs extra M1)
            if (dx > dy) {
                xc = xc + dd0x;
			} else {
                yc = yc + dd0y;    
			}

            d1    = d1 - kd;
            if (dd > tk){
                return ;                       // % breakout on the extra line
			}

            //bitmap = bresenham_line_draw(bitmap, pt0, d1);

            if (dx > dy)
                yc = yc + dd0y;
            else
                xc = xc + dd0x;
		}
}
    
    dd = dd + ku;
    d0 = d0 + kv;


*/