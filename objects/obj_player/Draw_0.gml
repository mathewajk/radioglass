/// @description Draw player and paths
// You can write your code in this editor

var cx=camera_get_view_x(view_camera[0]), cy=camera_get_view_y(view_camera[0])

draw_healthbar(cx, cy, cx+100, cy+10, hp, c_black, c_red, c_green, 0, true, true);

//show a symbol if dash possible 
if (dodge_cool)
	draw_text(cx, cy+15, "Dash");

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


draw_self(); // this function draws instance sprite same as default draw.

var shift_down = keyboard_check(vk_shift);
var mouse_pressed = mouse_check_button_pressed(mb_left);

var tile_x = floor(x / 4); // get coordinates of current tile
var tile_y = floor(y / 4);

if(keyboard_check(ord("1"))) //attack toggling
	curr_attack = 1;
if(keyboard_check(ord("2")))
	curr_attack = 2;

if(shift_down) { //if shift down, show preview for paths

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
		var length_limit = 30;
		if (curr_attack == 1)
			length_limit = 30;
		else if (curr_attack == 2)
			length_limit = 20;
		
		var x0 = tile_x; //current tile x coordinate
		var y0 = tile_y; //current tile y coordinate
		var x1 = floor(mouse_x / 4); //where you want to end the path x coordinate
		var y1 = floor(mouse_y / 4); //where you want to end the path y coordinate
		var width = 3;
		var path_length = floor(sqrt((x1 - x0) * (x1 - x0) + (y1 - y0) * (y1 - y0)));
		if (path_length > length_limit) {
			x1 = x0 + floor(length_limit / path_length * (x1 - x0));
			y1 = y0 + floor(length_limit / path_length * (y1 - y0));
		}

		var layer_id = layer_get_id("small_tiles_path");
		var tilemap_id = layer_tilemap_get_id(layer_id);
		tilemap_clear(tilemap_id, 0);

		if(mouse_check_button(mb_left)) {
			if(curr_attack == 1)
				drawPath(x0,y0,x1,y1,width,tilemap_id_terra,true);
			else if(curr_attack == 2)
				drawCircle(x0,y0,x1,y1,tilemap_id_terra,true);


			for(var i = 0; i < tilemap_get_width(tilemap_id_terra); i++) { //loop through columns
				for(var j = 0; j < tilemap_get_height(tilemap_id_terra); j++) { //loop through rows
					var cur_tile = tilemap_get(tilemap_id_terra, i, j); //sets current tile at i, j
					if(cur_tile != 0) { //if current tile already contains a path

						var grass_tile = grassCheck(i, j); //check for adjacent grass tiles
						var water_tile = waterCheck(i, j); //check for adjacent water tiles
						/*if((cur_tile == 15 || cur_tile == 35) && (grass_tile + water_tile == 15) && (grass_tile != 15) && (water_tile != 15))
						{
							tilemap_set(tilemap_id_terra, grass_tile + 40, i, j);
						}
						*/ // creates some weird pattern that might be useful later
						if(cur_tile == 38)
						{
						}
						else if(cur_tile == 18) { //dealing with single grass tiles in the middle of water
							if(grass_tile == 15 && water_tile == 0)
							tilemap_set(tilemap_id_terra, 38, i, j);
							else if(grass_tile != 15 && water_tile != 0)
							tilemap_set(tilemap_id_terra, grass_tile + 40, i, j);
						}
						else if(grass_tile == 15 && water_tile != 15 && (cur_tile == 15 || cur_tile == 17)) { //dealing with single grass tiles in the middle of water
							tilemap_set(tilemap_id_terra, 18, i, j);
						}
						else if((grass_tile != 0 || water_tile != 0) && (grass_tile + water_tile != 15) ) { // if the new tile is an edge tile

							if(grass_tile != 15 && water_tile == 15 && curr_attack == 1) {
								tilemap_set(tilemap_id_terra, grass_tile, i, j);
							}
							else if(grass_tile == 15 && water_tile != 15 && curr_attack == 2)
							{
								tilemap_set(tilemap_id_terra, water_tile + 20, i, j);
							}
							else if(grass_tile != 15 && water_tile != 15)
							{
								if(cur_tile > 0 && cur_tile < 20)
									tilemap_set(tilemap_id_terra, grass_tile, i, j);
								else if(cur_tile > 20 && cur_tile < 40)
									tilemap_set(tilemap_id_terra, water_tile + 20, i, j);
							}
							}
						else if (cur_tile == 40)
						{
							//show_debug_message(40);
							tilemap_set(tilemap_id_terra, 15, i, j);
						}
						else if (cur_tile > 40) // if the current tile is a hybrid tile
						{
							tilemap_set(tilemap_id_terra, grass_tile + 40, i, j);
						}
						else if(cur_tile != 17 && cur_tile != 15 && cur_tile != 37 && cur_tile != 35 && cur_tile != 39) { //replaces existing edge tiles with center tiles or hybrid tiles
								switch(curr_attack){
									case 1:
									if(cur_tile > 20 && cur_tile < 35 && grass_tile!= 0) //if current tile is a water edge tile and land is being drawn
									{
										tilemap_set(tilemap_id_terra, 35, i, j);
									}
									else {
										tilemap_set(tilemap_id_terra, 15, i, j)
									}
									break;
									case 2:
									if(cur_tile > 0 && cur_tile < 15)  //if current tile is a land edge tile and water is being drawn
									{
										tilemap_set(tilemap_id_terra, grass_tile + 40, i, j);
									}
									else {
										tilemap_set(tilemap_id_terra, 35, i, j)
									}
									break;
									case 3:
									{
									tilemap_set(tilemap_id_terra, 39, i, j)
									}
									break;
								}
						}
						else if ((cur_tile == 15 || cur_tile == 17) && water_tile != 15)
						{
							tilemap_set(tilemap_id_terra, grass_tile + 40, i, j);
						}
					}
				}
			}
		}
		else {
			if(curr_attack == 1)
			drawPath(x0,y0,x1,y1,width,tilemap_id,false);
			else if(curr_attack == 2)
			drawCircle(x0,y0,x1,y1,tilemap_id,false);
		}
}

//clear preview tiles
if (keyboard_check_released(vk_shift)) {
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
