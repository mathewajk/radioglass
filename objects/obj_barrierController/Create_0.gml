/*

/// @description Generate barriers using the tiles_solid layer

/* old code for making barriers 
// Make barriers
var tilemapId = layer_tilemap_get_id("tiles_solid");
for (i = 0; i < tilemap_get_width(tilemapId); i++) {
	for (j = 0; j < tilemap_get_height(tilemapId); j++) {
	    if (tilemap_get(tilemapId, i, j)) {
	        var inst = instance_create_layer(i * 32, j * 32, "instances_walls", obj_barrier);
		}
	}
}
*/

var tilemapId = layer_tilemap_get_id("tiles_background");
for (var i = 0; i < tilemap_get_width(tilemapId); i++) {
	for (var j = 0; j < tilemap_get_height(tilemapId); j++) {
		var curr_tile_index = tilemap_get(tilemapId, i, j);
	    if (curr_tile_index >= 45 || curr_tile_index == 10) {
	        var inst = instance_create_layer(i * 16, j * 16, "instances_walls", obj_barrier);
		}
	}
}
// create barrier wherever a stone wall tile is found

/*
// Initiate merging of barriers to reduce number of barrier instances
for (var i = 0; i < instance_number(obj_barrier); i += 1) {
    var barrier = instance_find(obj_barrier, i);
    barrier.alarm[0] = 3;
}
*/