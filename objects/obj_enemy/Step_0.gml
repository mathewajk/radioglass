/// @description Insert description here
// You can write your code in this editor


mp_potential_step(obj_player.x, obj_player.y, 1.5, false);

if (player_damage_cd == 0) {
	if(abs(obj_player.x-x)+abs(obj_player.y-y)<30) {
		obj_player.hp-=6;
		player_damage_cd = 20;
	}
} else {
	player_damage_cd -= 1;
}


coll = instance_place(x, y, obj_damage);
// -- instance_place checks if the enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5

if(coll && state = 0) {
	show_debug_message("Hit!! " + string(id));
	hp -= 5;
	
	state = 1;
	alarm[0] = 10; //10 frames of invulnerability
	
	// only deal damage to enemy if it collides with a damage object
	// and if the damage object that collides with the enemy now has a different id
	// than the previous collided object
}
					
if(hp == 0) {
	instance_destroy(id);
}

depth = -y + 16;