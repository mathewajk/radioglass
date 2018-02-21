///drawPath(x0, y0, x1, y1, tilemap_id)
//Special thanks to Emma Dasgupta for doing the perpendicular math for me <3 


var x0= argument0;
var y0= argument1;
var x1= argument2;
var y1= argument3;
var tilemap_id= argument4;

var xc=x0; //current x you are drawing
var yc=y0; //current y you are drawing
			
		
	
		var w = x1 - xc ; //how much x needs to change remaining
		var h = y1 - yc ; //how much y needs to change remaining 
		var dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0 ;
		if (w<0) dx1 = -1 ; else if (w>0) dx1 = 1 ;
		if (h<0) dy1 = -1 ; else if (h>0) dy1 = 1 ;
		if (w<0) dx2 = -1 ; else if (w>0) dx2 = 1 ;

		var longest = abs(w) ;//x change
		var shortest = abs(h) ;//y change

	
		
	    if (!(longest>shortest)) 
	    {
	        longest = abs(h) ;
	        shortest = abs(w) ;
	        if (h<0) dy2 = -1 ; 
	        else if (h>0) dy2 = 1 ;
	        dx2 = 0 ;            
	    }
	    var numerator = longest >> 1 ;
	    for (var i=0;i<=longest;i++) 
	    {
				var xp1;
				var yp1;
				
				var xp2;
				var yp2;
				
				var dx = x1-x0;
				var dy = y1-y0;
				var dist = sqrt(dx*dx + dy*dy)
				dx /= dist
				dy /= dist
				xp1 = xc + 2*dy;
				yp1 = yc - 2*dx;
				xp2 = xc - 2*dy;
				yp2 = yc + 2*dx;
				
				 
				//tilemap_set(tilemap_id, 13, xc,yc); //OLD KEEP
				//drawPathPerp(xp1, yp1, xp2, yp2, tilemap_id); //CHANGE
				tilemap_set(tilemap_id, 13, xc,yc);
				tilemap_set(tilemap_id, 13, xc + 1,yc);
				tilemap_set(tilemap_id, 13, xc + 2,yc);
				tilemap_set(tilemap_id, 13, xc + 3,yc);
						
			
	        numerator += shortest ;
	        if (!(numerator<longest)) 
	        {
	            numerator -= longest ;
	            xc += dx1 ;
	            yc += dy1 ;
	        } else {
	            xc += dx2 ;
	            yc += dy2 ;
	        }
			
		}
		