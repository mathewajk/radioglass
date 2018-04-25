///waterCheck(x0,y0):

var x0 = argument0;
var y0 = argument1;

var layer_id_terra = layer_get_id("small_tiles_terraformed");
var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra);

						var no_water_above = ((tilemap_get(tilemap_id_terra, x0, y0 - 1) < 20 || (tilemap_get(tilemap_id_terra, x0, y0 - 1) >= 40 && tilemap_get(tilemap_id_terra, x0, y0 - 1) < 60))? 1 : 0);
						var no_water_below = ((tilemap_get(tilemap_id_terra, x0, y0 + 1) < 20 || (tilemap_get(tilemap_id_terra, x0, y0 + 1) >= 40 && tilemap_get(tilemap_id_terra, x0, y0 + 1) < 60))? 2 : 0);
						var no_water_left = ((tilemap_get(tilemap_id_terra, x0 - 1, y0) < 20 || (tilemap_get(tilemap_id_terra, x0 - 1, y0) >= 40 && tilemap_get(tilemap_id_terra, x0 - 1, y0) < 60))? 4 : 0);
						var no_water_right= ((tilemap_get(tilemap_id_terra, x0 + 1, y0) < 20 || (tilemap_get(tilemap_id_terra, x0 + 1, y0) >= 40 && tilemap_get(tilemap_id_terra, x0 + 1, y0) < 60))? 8 : 0);

						var new_tile = no_water_above | no_water_below | no_water_right | no_water_left;
						
						return new_tile;