///grassCheck(x0,y0):

var x0 = argument0;
var y0 = argument1;
var pixx = x0 * 4;
var pixy = y0 * 4;

var layer_id_grass = layer_get_id("small_tiles_terraformed");
var tilemap_id_grass = layer_tilemap_get_id(layer_id_grass);

var grass_above = ((position_meeting(pixx, pixy-1, obj_barrier) || tilemap_get(tilemap_id_grass, x0, y0 - 1) == 0) ? 0 : 1);
var grass_below = ((position_meeting(pixx, pixy+4, obj_barrier) || tilemap_get(tilemap_id_grass, x0, y0 + 1) == 0) ? 0 : 2);
var grass_left = ((position_meeting(pixx-1, pixy, obj_barrier) || tilemap_get(tilemap_id_grass, x0 - 1, y0) == 0) ? 0 : 4);
var grass_right= ((position_meeting(pixx+4, pixy, obj_barrier) || tilemap_get(tilemap_id_grass, x0 + 1, y0) == 0) ? 0 : 8);

var new_tile = grass_above | grass_below | grass_right | grass_left;
						
return new_tile;