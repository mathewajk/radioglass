/// @description Generate barriers using the tiles_solid layer

// Make barriers
var tilemapId = layer_tilemap_get_id("tiles_solid");
for (i = 0; i < tilemap_get_width(tilemapId); i++) {
	for (j = 0; j < tilemap_get_height(tilemapId); j++) {
	    if (tilemap_get(tilemapId, i, j)) {
	        var inst = instance_create_layer(i * 32, j * 32, "instances_walls", object_barrier);
		}
	}
}

// Merge barriers
for (var i = 0; i < instance_number(object_barrier); i += 1) {
    var barrier = instance_find(object_barrier, i);
    barrier.alarm[0] = 1;
}