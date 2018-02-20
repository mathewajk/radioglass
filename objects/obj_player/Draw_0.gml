/// @description Draw player and paths
// You can write your code in this editor

if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
	sprite_index = spr_playerWalkLeft; //animate sprite
	last_dir = 1; // set last direction
}
else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
	sprite_index = spr_playerWalkRight;
	last_dir = 2;
}
else if (keyboard_check(vk_up)|| keyboard_check(ord("W"))) {
	sprite_index = spr_playerWalkRight;
	last_dir = 3;
}
else if(keyboard_check(vk_down || keyboard_check(ord("S")))) {
	sprite_index = spr_playerWalkLeft;
	last_dir = 4;
}
/*
else {
	if(state != snap) { //if player character not snapped to grid
		switch(last_dir) { //set sprite for direction
			case 1: sprite_index = spr_playerStandLeft; break;
			case 2: sprite_index = spr_playerStandRight; break;
			case 3: sprite_index = spr_playerStandRight; break;
			case 4: sprite_index = spr_playerStandLeft; break;
		}
	}
}*/

draw_self(); // this function draws instance sprite same as default draw. 

var shift_down = keyboard_check(vk_shift);
var mouse_pressed = mouse_check_button_pressed(mb_left);

var tile_x = floor(x / 4); // get coordinates of current tile
var tile_y = floor(y / 4);

if(shift_down) {
	
	var layer_id = layer_get_id("small_tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);	
	
	var layer_id_terra = layer_get_id("small_tiles_terraformed");
	var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra); //tilemap id of terraformed area
	
	if(curr_attack == 1) {
		var y_dist = floor((mouse_y - y) / 4);
		var y_sign = sign(y_dist);
	
		var x_dist = floor((mouse_x - x) / 4);
		var x_sign = sign(x_dist);
		
		x_dist = abs(x_dist);
		y_dist = abs(y_dist);
	
		//if(last_valid_y_dist * last_valid_y_sign != y_dist * y_sign || last_valid_x_dist * last_valid_x_sign != x_dist * x_sign) {
		//	tilemap_clear(tilemap_id, 0);
		}
	
		//MAKE PLAYER'S CURRENT TILE BLUE
		for(var i = 0 ; i<4;i++){
			for(var j = 0 ; j<4;j++){
				tilemap_set(tilemap_id_terra, 12, tile_x+i, tile_y+j)
			}
		}
		
		var tile_x = floor(x / 4); // get coordinates of current tile
		var tile_y = floor(y / 4);
		
		//DRAW PATHS
		
		var x0 = floor(x / 4);; //current tile x coordinate
		var y0 = floor(y / 4);; 
		var x2 = floor(mouse_x / 4)
		var y2 = floor(mouse_y / 4)
		
		var dx; 
		var dy;
		var p; //midpoint
		var xc; //current x
		var yc; //current y 
  
	var xc=x0;
	var yc=y0;
		
	var w = x2 - xc ;
    var h = y2 - yc ;
    var dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0 ;
    if (w<0) dx1 = -1 ; else if (w>0) dx1 = 1 ;
    if (h<0) dy1 = -1 ; else if (h>0) dy1 = 1 ;
    if (w<0) dx2 = -1 ; else if (w>0) dx2 = 1 ;

    var longest = abs(w) ;
    var shortest = abs(h) ;

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
        tilemap_set(tilemap_id, 13, xc,yc);
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
}
 
 /*
		dx=x1-x0; 
		dy=y1-y0;
 
		
 
		p=2*dy-dx;//*/
 
 //if(mouse_pressed) {
	 //plotLine(x0,y0, x1, y1, tilemap_id);
 //}
	 
/*if (abs(y1 - y0) < abs(x1 - x0)) {//if x change is greater than y change - PLOTLINE LOW **********************
	if (x0<x1){	
		while(xc<x1)//plotLine Low: xchange greater than y change, both change in positive direction
		{
			 if (dy < 0) { 
				yi = -1;
				dy = -dy;
			}
        if(p>=0)
        {
            tilemap_set(tilemap_id, 13, xc,yc);
            yc=yc+1;
            p=p+2*dy-2*dx;
        }
        else
        {
            tilemap_set(tilemap_id, 13, xc,yc);
            p=p+2*dy;
        }
        xc=xc+1;
		}
	} else {		
		while(xc<x1)//plotLine Low: xchange greater than y change, but y needs to decrease
		{
        if(p>=0)
        {
            tilemap_set(tilemap_id, 13, xc,yc);
            yc=yc-1;
            p=p-2*dy-2*dx;
        }
        else
        {
            tilemap_set(tilemap_id, 13, xc,yc);
            p=p-2*dy;
        }
        xc=xc+1;
		}
	}
}  // y change is bigger than x change PLOTLINE HIGH ****************************
 
	*/	
		



	
	
		/*if(floor(mouse_x / 16)  == tile_x){	
		
			for(var i = 1; i < y_dist + 1; i++) {
			
				var tile_data;	
				var rev_y_dist = y_dist * -1;
				switch(i * y_sign) {
					case 1: tile_data = 7; break;
					case -1: tile_data = 5; break;
					case y_dist: tile_data = 5; break;
					case rev_y_dist: tile_data = 7; break;
					default: tile_data = 9;
				}
			
				if(mouse_pressed) {
					if(tilemap_get(tilemap_id_terra, tile_x, tile_y + i * y_sign) == 0) {
						tilemap_set(tilemap_id_terra, tile_data, tile_x, tile_y + i * y_sign);
						instance_create_layer(tile_x * 16, (tile_y + i * y_sign) * 16, "instances_paths", obj_damage);
					}
					else {
						break;
					}
					continue;
				}
			
				if(tilemap_get(tilemap_id_terra, tile_x, tile_y + i * y_sign) != 0) {
					break;
				}
				if(tilemap_get(tilemap_id, tile_x, tile_y + i * y_sign) == 0) {
					tilemap_set(tilemap_id, 1, tile_x, tile_y + i * y_sign);
				}
			}
			last_valid_y_dist = y_dist;
			last_valid_y_sign = y_sign;
		}
		else if(floor(mouse_y / 16) == tile_y) {
		
			for(var i = 1; i < x_dist + 1; i++) {
			
				var tile_data;	
				var rev_x_dist = x_dist * -1;
				switch(i * x_sign) {
					case 1: tile_data = 4; break;
					case -1: tile_data = 6; break;
					case x_dist: tile_data = 6; break;
					case rev_x_dist: tile_data = 4; break;
					default: tile_data = 8;
				}
		
		
				if(mouse_pressed) {
					if(tilemap_get(tilemap_id_terra, tile_x + i * x_sign, tile_y) == 0) {
						tilemap_set(tilemap_id_terra, tile_data, tile_x + i * x_sign, tile_y);
						instance_create_layer((tile_x + i * x_sign) * 16, tile_y * 16, "instances_paths", obj_damage);
					}
					else {
						break;
					}
					continue;
				}
			
				if(tilemap_get(tilemap_id_terra, tile_x + i * x_sign, tile_y) != 0) {
					break;
				}
				if(tilemap_get(tilemap_id, tile_x + i * x_sign, tile_y) == 0) {
					tilemap_set(tilemap_id, 1, tile_x + i * x_sign, tile_y);
				}
			}
			last_valid_x_dist = x_dist;
			last_valid_x_sign = x_sign;
		}
		else if(x_dist == y_dist) {
			for(var i = 1; i < x_dist + 1; i++) {
				if(mouse_pressed) {
					if(tilemap_get(tilemap_id_terra, tile_x + i * x_sign, tile_y + i * y_sign) == 0) {
						tilemap_set(tilemap_id_terra, 6, tile_x + i * x_sign, tile_y + i * y_sign);
						instance_create_layer((tile_x + i * x_sign) * 16, (tile_y + i * y_sign) * 16, "instances_paths", obj_damage);
					}
					else {
						break;
					}
					continue;
				}
			
				if(tilemap_get(tilemap_id_terra, tile_x + i * x_sign, tile_y + i * y_sign) != 0) {
					break;
				}
				if(tilemap_get(tilemap_id, tile_x + i * x_sign, tile_y + i * y_sign) == 0) {
					tilemap_set(tilemap_id, 1, tile_x + i * x_sign, tile_y + i * y_sign);
				}
			}
			last_valid_x_dist = x_dist;
			last_valid_x_sign = x_sign;
			last_valid_y_dist = y_dist;
			last_valid_y_sign = y_sign;
		}
	}

	/*
	if(curr_attack == 2) {
		for(var i = -1; i <= 1; i++) {
			for(var j =  -1; j <= 1; j++) {
				if(mouse_pressed) {
					if(tilemap_get(tilemap_id_terra, tile_x + i, tile_y + j) == 0) {
						tilemap_set(tilemap_id_terra, 24 + (j * 11) + i, tile_x + i, tile_y + j);
						instance_create_layer((tile_x + i) * 16, (tile_y + j) * 16, "instances_paths", obj_damage);
					}
					else {
						break;
					}
					continue;
				}
				
				if(tilemap_get(tilemap_id_terra, tile_x + i, tile_y + j) != 0) {
					tilemap_clear(tilemap_id, 0);
					break;
				}
				if(tilemap_get(tilemap_id, tile_x + i, tile_y + j) == 0) {
					tilemap_set(tilemap_id, 1, tile_x + i, tile_y + j);
				}
			}
			tilemap_set(tilemap_id, 2, tile_x, tile_y);
		}
	}*/



if(keyboard_check_released(vk_shift)) {
	var layer_id = layer_get_id("small_tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);
	tilemap_clear(tilemap_id, 0);
}