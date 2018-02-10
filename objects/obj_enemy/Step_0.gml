/// @description Insert description here
// You can write your code in this editor


var layer_id = layer_get_id("tiles_path");
var tilemap_id = layer_tilemap_get_id(layer_id);

mp_potential_step(obj_player.x, obj_player.y, 2, true);

var coll = instance_place(x, y, obj_damage)
if(coll && coll != last_coll) {
	show_debug_message("Hit!! " + string(id));
	show_debug_message("This coll: " + string(coll));
	show_debug_message("Last coll: " + string(last_coll));
	hp -= 5;
	last_coll = coll;
}
					
if(hp == 0) {
	instance_destroy(id);
}