///waterCheck(x0,y0):

var x0 = argument0;
var y0 = argument1;
var pixx = x0 * 4;
var pixy = y0 * 4;

var layer_id_water = layer_get_id("water_layer");
var tilemap_id_water = layer_tilemap_get_id(layer_id_water);

var water_above = ((position_meeting(pixx, pixy-1, obj_barrier) || tilemap_get(tilemap_id_water, x0, y0 - 1) == 0) ? 0 : 1);
var water_below = ((position_meeting(pixx, pixy+4, obj_barrier) || tilemap_get(tilemap_id_water, x0, y0 + 1) == 0) ? 0 : 2);
var water_left = ((position_meeting(pixx-1, pixy, obj_barrier) || tilemap_get(tilemap_id_water, x0 - 1, y0) == 0) ? 0 : 4);
var water_right= ((position_meeting(pixx+4, pixy, obj_barrier) || tilemap_get(tilemap_id_water, x0 + 1, y0) == 0) ? 0 : 8);

var new_tile = water_above | water_below | water_right | water_left;
						
return new_tile;