/// @description Draw player and paths
// You can write your code in this editor

var cx=camera_get_view_x(view_camera[0]), cy=camera_get_view_y(view_camera[0]);

draw_healthbar(cx, cy, cx+100, cy+10, hp, make_color_rgb(51, 51, 153), make_color_rgb(255, 0, 102), make_color_rgb(204, 255, 102), 0, true, false);
draw_healthbar(cx, cy+15, cx+100, cy+25, nrg, c_black, c_orange, c_yellow, 0, true, false);


// draw staff sprite
var img_i = curr_attack;
if (!preview_on) {
	img_i = 0;
}
if (img_i == 3) {
	draw_healthbar(cx+36, cy+236, cx+82, cy+254, (bomb_cd/bomb_maxcd)*100, c_black, c_orange, c_red, 0, false, false);
}
draw_sprite_stretched(spr_staff, img_i, cx+15, cy+200, 56, 56);

var bomb_n_x_offset = cx+64;
if (img_i != 3) {
	draw_sprite_stretched(spr_bomb, 0, cx+80, cy+240, 16, 16);
	bomb_n_x_offset = cx+100;
}
draw_set_font(font_bomb_count);
draw_text(bomb_n_x_offset, cy+244, "x"+string(bomb_n));



//show a symbol if dash possible 
/*if (dodge_cool)
	draw_text(cx, cy+15, "Dash");*/
var mouse_pressed = mouse_check_button_pressed(mb_left);

if (!attacking){
	if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
		sprite_index = spr_playerWalkLeft; //animate sprite
	 	last_dir = 1; // set last direction
	}
	else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
		sprite_index = spr_playerWalkRight;
		last_dir = 2;
	}
	else if (keyboard_check(vk_up)|| keyboard_check(ord("W"))) {
		sprite_index = spr_playerWalkBack;
		last_dir = 3;
	}
	else if(keyboard_check(vk_down || keyboard_check(ord("S")))) {
		sprite_index = spr_playerWalkForward;
		last_dir = 4;
	}
	else {
		switch(last_dir) {
			case 1: sprite_index = spr_playerStandLeft; break;
			case 2: sprite_index = spr_playerStandRight; break;
			case 3: sprite_index = spr_playerStandBack; break;
			case 4: sprite_index = spr_playerStandForward; break;
		}
	}
} else {
	last_dir = last_attack_dir;
	switch(last_dir) {
		case 1: sprite_index = spr_playerAttackLeft; break;
		case 2: sprite_index = spr_playerAttackRight; break;
		case 3: sprite_index = spr_playerAttackUp; break;
		case 4: sprite_index = spr_playerAttackDown; break;
	}
	attacking = false;
	alarm[3] =15;
}
	


draw_self(); // this function draws instance sprite same as default draw.

var shift_down = keyboard_check(vk_shift);


var tile_x = floor(x / 4); // get coordinates of current tile
var tile_y = floor(y / 4);

if(keyboard_check(ord("1"))){ //attack toggling
	curr_attack = 1;
	preview_on = true;
}
if(keyboard_check(ord("2"))){// fan
	curr_attack = 2;
	preview_on = true;
}
if(keyboard_check(ord("3"))){// bomb
	curr_attack = 3;
	preview_on = true;
}
	
//bullet toggling
if mouse_wheel_up() 
	curr_bullet += 1;
else if mouse_wheel_down()
	curr_bullet -= 1;
if (curr_bullet < 1) curr_bullet = num_bullets;
else if (curr_bullet > num_bullets) curr_bullet = 1;
draw_text(cx, cy+40, "attack: " + string(curr_bullet));

if (mouse_check_button(mb_right) && preview_on)
	preview_on = false;

if(preview_on) {

	//set variables for layer and tilemap IDs
	var layer_id = layer_get_id("small_tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);

	var layer_id_terra = layer_get_id("small_tiles_terraformed");
	var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra);

	/* old code from the old mechanic
	if(curr_attack == 1) {
		var y_dist = floor((mouse_y - y) / 4);
		var y_sign = sign(y_dist);

		var x_dist = floor((mouse_x - x) / 4);
		var x_sign = sign(x_dist);

		x_dist = abs(x_dist);
		y_dist = abs(y_dist);

	}
		if(last_valid_y_dist * last_valid_y_sign != y_dist * y_sign || last_valid_x_dist * last_valid_x_sign != x_dist * x_sign) {
			tilemap_clear(tilemap_id, 0);
	*/

		//make current player's tile blue
		for(var i = 0 ; i<4;i++){
			for(var j = 0 ; j<4;j++){
				tilemap_set(tilemap_id, 12, tile_x+i, tile_y+j)
			}
		}

		var tile_x = floor(x / 4); // get coordinates of current tile
		var tile_y = floor(y / 4);

		//DRAW PATHS
		var length_limit;
		if (curr_attack == 1)
			length_limit = 50;
		else if (curr_attack == 2)
			length_limit = 40;
		
		var x0 = tile_x; //current tile x coordinate
		var y0 = tile_y; //current tile y coordinate
		var x1 = floor(mouse_x / 4); //where you want to end the path x coordinate
		var y1 = floor(mouse_y / 4); //where you want to end the path y coordinate
		var width = 3;

		if (curr_attack != 3) {
			var path_length = floor(sqrt((x1 - x0) * (x1 - x0) + (y1 - y0) * (y1 - y0)));
				//check if path is blocked by barrier, if so, shorten the length.
			var curr_path = PathBlock(x0*4+2,y0*4+2,mouse_x,mouse_y,path_length);
			if(x1 != x0)
				x1 = x0 + floor(curr_path / path_length *(x1 - x0));
			if(y1 != y0)
				y1 = y0 + floor(curr_path / path_length * (y1 - y0));
			path_length = curr_path;
		
			if (path_length > length_limit) {
				x1 = x0 + floor(length_limit / path_length * (x1 - x0));
				y1 = y0 + floor(length_limit / path_length * (y1 - y0));
			}
		} else {
			x1 = x0 + 15;
			y1 = y0 + 15;
		}
			

		var layer_id = layer_get_id("small_tiles_path");
		var tilemap_id = layer_tilemap_get_id(layer_id);
		tilemap_clear(tilemap_id, 0);
		
		if(mouse_check_button(mb_left)) {
			if (curr_attack == 1 || curr_attack = 2) {
				attacking = 1;
				alarm[4] = 10;
			}
			
			if(curr_attack == 1)
			{
				drawPath(x0,y0,x1,y1,width,tilemap_id_terra,true,curr_bullet);
				drawEdgeRadius((x0+x1)/2,(y0+y1)/2,x1,y1,tilemap_id_terra, curr_attack);
			}
			else if(curr_attack == 2)
			{
				drawFan(x0,y0,x1,y1, pi/2, tilemap_id_terra,true,curr_bullet);
				drawEdgeRadius((x0+x1)/2,(y0+y1)/2,x1+((x1-x0)/5),y1+((y1-y0)/5),tilemap_id_terra, curr_attack);
			}
			else if(curr_attack == 3) // bomb
				if (bomb_cd == 0 && bomb_n > 0) {
					instance_create_layer(x, y, "instances_bullet", obj_bomb);
					bomb_cd = bomb_maxcd;
					bomb_n--;
				}	
			
		}
		else {
			if(curr_attack == 1)
			drawPath(x0,y0,x1,y1,width,tilemap_id,false,curr_bullet);
			else if(curr_attack == 2)
			{
			drawFan(x0, y0, x1, y1, pi/2, tilemap_id, false, curr_bullet);
			}
			else if(curr_attack == 3)
			{
			drawCircle(x0,y0,x1,y1, tilemap_id,false,curr_bullet);
			}
		}
}

//clear preview tiles
if (!preview_on) {
	var layer_id = layer_get_id("small_tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);
	tilemap_clear(tilemap_id, 0);
}



	//------------BELOW is old code for the old path and pond drawing mechanic---------//




/*
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
else {
	if(state != snap) { //if player character not snapped to grid
		switch(last_dir) { //set sprite for direction
			case 1: sprite_index = spr_playerStandLeft; break;
			case 2: sprite_index = spr_playerStandRight; break;
			case 3: sprite_index = spr_playerStandRight; break;
			case 4: sprite_index = spr_playerStandLeft; break;
		}
	}
}

draw_self(); // this function draws instance sprite same as default draw.

var shift_down = keyboard_check(vk_shift);
var mouse_pressed = mouse_check_button_pressed(mb_left);

var tile_x = floor(x / 16); // get coordinates of current tile the player is standing on
var tile_y = floor(y / 16);

if(shift_down) {

	var layer_id = layer_get_id("tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);

	var layer_id_terra = layer_get_id("tiles_terraformed");
	var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra);

	if(curr_attack == 1) {
		var y_dist = floor((mouse_y - y) / 16);
		var y_sign = sign(y_dist);

		var x_dist = floor((mouse_x - x) / 16);
		var x_sign = sign(x_dist);

		x_dist = abs(x_dist);
		y_dist = abs(y_dist);

		if(last_valid_y_dist * last_valid_y_sign != y_dist * y_sign || last_valid_x_dist * last_valid_x_sign != x_dist * x_sign) {
			tilemap_clear(tilemap_id, 0);
		}
		// -- clear map if the path created at last moment is different from the path at the current moment
		// -- determined by comparing the numerical difference between x and y coordinates of mouse and player position


		tilemap_set(tilemap_id, 2, tile_x, tile_y);

		if(floor(mouse_x / 16)  == tile_x) {
		// -- drawing vertically, i.e. x value of player's position is same as mouse position

			for(var i = 1; i < y_dist + 1; i++) {
			// -- iterate vertically
				var tile_data;
				var rev_y_dist = y_dist * -1;

				// -- set the id of tiles according to iteration index, i.e. position of tile in path
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
						// -- perform terraform when mouse is pressed down, by setting tile on "tilemap_id_terra"
						instance_create_layer(tile_x * 16, (tile_y + i * y_sign) * 16, "instances_paths", obj_damage);

						// -- on the "instances_path" layer,
						// -- place at the corresponding coordinate of the tile that is just terraformed
						// -- an object that does damage to an enemy
					}
					else {
						break;

						// -- break out of the iteration if the tile at position (tile_x, tile_y + i * y_sign)
						// -- is not empty, i.e. is already terraformed
						// -- path stops when intersects with other path
					}
					continue;
				}

				if(tilemap_get(tilemap_id_terra, tile_x, tile_y + i * y_sign) != 0) {
					break;

					// -- break condition same as above
				}
				if(tilemap_get(tilemap_id, tile_x, tile_y + i * y_sign) == 0) {
					tilemap_set(tilemap_id, 1, tile_x, tile_y + i * y_sign);

					// -- displaying tile as a part of the preview path on layer "tilemap_id"

				}
			}
			last_valid_y_dist = y_dist;
			last_valid_y_sign = y_sign;
			// -- storing data about the preview path at the current moment
		}

		// -- draw path horizontally

		else if(floor(mouse_y / 16) == tile_y) {

			for(var i = 1; i < x_dist + 1; i++) {

				// -- set the id of tiles according to iteration index, i.e. position of tile in path

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
						// -- perform terraform and place damage objects, similar to above
						tilemap_set(tilemap_id_terra, tile_data, tile_x + i * x_sign, tile_y);
						instance_create_layer((tile_x + i * x_sign) * 16, tile_y * 16, "instances_paths", obj_damage);

					}
					else {
						break;
						// -- break out of iteration if terraformed tile is met
					}
					continue;
				}

				if(tilemap_get(tilemap_id_terra, tile_x + i * x_sign, tile_y) != 0) {
					break;
					// -- break out of iteration of terraformed tile is met
				}
				if(tilemap_get(tilemap_id, tile_x + i * x_sign, tile_y) == 0) {
					tilemap_set(tilemap_id, 1, tile_x + i * x_sign, tile_y);
					// -- displaying tile as a part of the preview path on layer "tilemap_id"
				}
			}
			// -- storing data about the preview path at the current moment
			last_valid_x_dist = x_dist;
			last_valid_x_sign = x_sign;
		}

		// -- draw path 45deg diagonally
		// --- (same structure of code as above)

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

	// -- draw pond around player
	// -- similar structure to above parts
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
	}
}

// clear all preview paths when shift is released
if(keyboard_check_released(vk_shift)) {
	var layer_id = layer_get_id("tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);
	tilemap_clear(tilemap_id, 0);
}
*/
