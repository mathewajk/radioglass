/// @description Insert description here
// You can write your code in this editor



if(obj_player.deflecting)
	{
		deflectEnemy(obj_player, self, 100);
	}	
if (player_damage_cd == 0) {
	if(abs(obj_player.x-x)+abs(obj_player.y-y)<30) {
		if(not(obj_player.shield_up))
		{
		obj_player.hp-=3;
		player_damage_cd = 20;
		}
	}
} else {
	player_damage_cd -= 1;
}

/*
var layer_id = layer_get_id("tiles_path");
var tilemap_id = layer_tilemap_get_id(layer_id);
*/
var coll = instance_place(x,y,obj_slow);
if (coll) {
	//show_debug_message("Slow!! " + string(id));
	v = 2;
}
else v = 5;

hspd = random(v)-v/2;
vspd = random(v)-v/2;

if (place_meeting(x + hspd + sign(hspd), y, obj_barrier)) {
    hspd = 0;
}
if (place_meeting(x, y + vspd + sign(vspd), obj_barrier)) {
    vspd = 0;
}
if (place_meeting(x + hspd + sign(hspd), y, obj_rock)) {
	hspd = obj_rock.hspeed;
}
if (place_meeting(x, y + vspd + sign(vspd), obj_rock)) {
	vspd = obj_rock.vspeed;
}
if(place_meeting(x, y, obj_barrier) && place_meeting(x, y, obj_rock))
{
	hp = 0;
}


x += hspd;
y += vspd;
mp_potential_step(obj_player.x, obj_player.y, (v/2-0.5), false);


var coll = instance_place(x, y, obj_damage);
// -- instance_place checks if the enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5

if(coll && state = 0) {
	show_debug_message("Hit!! " + string(id));
	hp -= 1;
	
	state = 1;
	alarm[0] = 10; //10 frames of invulnerability
	
	// only deal damage to enemy if it collides with a damage object
	// and if the damage object that collides with the enemy now has a different id
	// than the previous collided object
}
					
if(hp <= 0) {
	instance_destroy(id);
}

depth = -y + 16;
