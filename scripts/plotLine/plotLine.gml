///plotLine(x0,y0, x1,y1)

var x0 = argument0;
var y0 = argument1;
var x1 = argument2;
var y1 = argument3;
var tilemap_id = argument4; 

  if (abs(y1 - y0) < abs(x1 - x0)) { //if x change is bigger than y change
    if (x0 > x1) {
      plotLineLow(x1, y1, x0, y0, tilemap_id);
	}
    else { 
      plotLineLow(x0, y0, x1, y1, tilemap_id);
	} 
  }
  else { // if y change is bigger than x change 
    if (y0 > y1) {
      plotLineHigh(x1, y1, x0, y0, tilemap_id);
	}
    else {
      plotLineHigh(x0, y0, x1, y1, tilemap_id);
	}
  }