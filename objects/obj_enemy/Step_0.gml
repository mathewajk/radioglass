/// @description Insert description here
// You can write your code in this editor


var layer_id = layer_get_id("tiles_path");
var tilemap_id = layer_tilemap_get_id(layer_id);

var coll = instance_place(x, y, obj_damage)
if(coll) {
	hp -= 5;
	instance_destroy(coll);
	show_debug_message("Hit!!");
}
					
if(hp == 0) {
	instance_destroy(id);
}