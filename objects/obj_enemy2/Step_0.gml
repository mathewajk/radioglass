/// @description Insert description here
// You can write your code in this editor

var layer_id = layer_get_id("tiles_path");
var tilemap_id = layer_tilemap_get_id(layer_id);

x+=random(8)-4;
y+=random(8)-4;
mp_potential_step(obj_player.x, obj_player.y, 3, false);

if(abs(obj_player.x-x)+abs(obj_player.y-y)<30) obj_player.hp-=3;

var coll = instance_place(x, y, obj_damage);
// -- instance_place checks if there enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5

if(coll && coll != last_coll) {
	show_debug_message("Hit!! " + string(id));
	show_debug_message("This coll: " + string(coll));
	show_debug_message("Last coll: " + string(last_coll));
	hp -= 5;
	last_coll = coll;
	// only deal damage to enemy if it collides with a damage object
	// and if the damage object that collides with the enemy now has a different id
	// than the previous collided object
}
					
if(hp == 0) {
	instance_destroy(id);
}

depth = -y + 16;
