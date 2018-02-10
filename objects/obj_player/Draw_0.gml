/// @description Insert description here
// You can write your code in this editor

draw_sprite(object_get_sprite(obj_player), obj_player.sprite_index, x, y);

var shift_down = keyboard_check(vk_shift);
var mouse_down = mouse_check_button(mb_left);

var tile_x = floor(x / 16);
var tile_y = floor(y / 16);
	
if(shift_down) {
	
	var layer_id = layer_get_id("tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);	
	tilemap_set(tilemap_id, 1, tile_x, tile_y);
	
	var y_dist = floor((mouse_y - y) / 16);
	var y_sign = sign(y_dist);
	y_dist = abs(y_dist);
	
	var x_dist = floor((mouse_x - x) / 16);
	var x_sign = sign(x_dist);
		
	x_dist = abs(x_dist);
	
	if(last_valid_y_dist * last_valid_y_sign != y_dist * y_sign || last_valid_x_dist * last_valid_x_sign != x_dist * x_sign) {
		tilemap_clear(tilemap_id, 0);
	}
	
	if(floor(mouse_x / 16)  == tile_x){	
		for(var i = 0; i < y_dist + 1; i++) {
			if(tilemap_get(tilemap_id, floor(x / 16), floor(y / 16) + i * y_sign) != 1) {
				tilemap_set(tilemap_id, 1, tile_x, tile_y + i * y_sign);
			}
		}
		last_valid_y_dist = y_dist;
		last_valid_y_sign = y_sign;
		
	}
	else if(floor(mouse_y / 16) == tile_y) {
		for(var i = 0; i < x_dist + 1; i++) {
			if(tilemap_get(tilemap_id, floor(x / 16) + i * x_sign, floor(y / 16)) != 1) {
				tilemap_set(tilemap_id, 1, tile_x + i * x_sign, tile_y);
			}
		}
		last_valid_x_dist = x_dist;
		last_valid_x_sign = x_sign;
		
	}
	
	if(mouse_check_button_pressed(mb_left) {
		var layerid_terra = layer_get_id("tiles_terraformed") {
			
		}
	}
}

if(keyboard_check_released(vk_shift)) {
	var layer_id = layer_get_id("tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);
	
	show_debug_message("Clear.");
	tilemap_clear(tilemap_id, 0);
}