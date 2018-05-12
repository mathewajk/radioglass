/// @description Insert description here
// You can write your code in this editor

/*The new enemy starts with speed 6; 
every 5 seconds, it will disappear and then appear after 5 seconds;
when visible it acts like other enemies;
when invisible it doesn't attack the player but if the player doesn't 
find out where it is, it will attack player once it becomes visible;
but when attacked by path when invisible, it will turn visible(so the point is
player should try to use path to find out where he enemy is.)
*/


var v = 6;
var coll;
if (alarm[1] >= room_speed*5) 
	visible = true;
else 
{
	visible = false;
	v = 3;
}

coll = instance_place(x,y,obj_slow);
if (coll) {
	if (visible)
		v = 2;
	else 
	{
		show_debug_message("Visible!! " + string(id));
		alarm[1] = room_speed*10;
	}
}

hspd = random(v)-v/2;
vspd = random(v)-v/2;

if (place_meeting(x + hspd + sign(hspd), y, obj_barrier)) {
    hspd = 0;
}
if (place_meeting(x, y + vspd + sign(vspd), obj_barrier)) {
    vspd = 0;
}

if (visible){
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
}

/*
var layer_id = layer_get_id("tiles_path");
var tilemap_id = layer_tilemap_get_id(layer_id);
*/

x += hspd;
y += vspd;

mp_potential_step(obj_player.x, obj_player.y, (v/2-0.5), false);


coll = instance_place(x, y, obj_damage);
// -- instance_place checks if the enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5
if(coll && state = 0) {
	if (visible){
		show_debug_message("Hit!! " + string(id));
		hp -= 10;
	
		state = 1;
		alarm[0] = 10; //10 frames of invulnerability
	
		// only deal damage to enemy if it collides with a damage object
		// and if the damage object that collides with the enemy now has a different id
		// than the previous collided object
	}	
	else 
	{
		show_debug_message("Visible!! " + string(id));
		alarm[1] = room_speed*10;
	}
}

if(hp == 0) {
	instance_destroy(id);
}

depth = -y + 16;
