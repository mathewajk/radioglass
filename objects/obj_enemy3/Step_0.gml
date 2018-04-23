/// @description Insert description here
// You can write your code in this editor

if (player_damage_cd == 0) {
	if(abs(obj_player.x-x)+abs(obj_player.y-y)<30) {
		obj_player.hp-=3;
		player_damage_cd = 20;
	}
} else {
	player_damage_cd -= 1;
}

cd-=1;

if(cd==0){
	instance_create_layer(x,y,"instances_bullet",obj_bullet);
	cd = 25;
}

var hspd;
var vspd;

switch (facing) {
	case 1: hspd = 1.2; vspd = 0; break;
	case 2: hspd = 0; vspd = 1.2; break;
	case 3: hspd = -1.2; vspd = 0; break;
	case 4: hspd = 0; vspd = -1.2;
}

if (place_meeting(x + hspd + sign(hspd), y, obj_barrier)) {
    hspd = 0;
}
if (place_meeting(x, y + vspd + sign(vspd), obj_barrier)) {
    vspd = 0;
}

x += hspd;
y += vspd;

var coll = instance_place(x, y, obj_damage);
// -- instance_place checks if the enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5

if(coll && state = 0) {
	show_debug_message("Hit!! " + string(id));
	hp -= 5;
	
	state = 1;
	alarm[1] = 10; //10 frames of invulnerability
	
	// only deal damage to enemy if it collides with a damage object
	// and if the damage object that collides with the enemy now has a different id
	// than the previous collided object
}	

if(hp == 0) {
	instance_destroy(id);
}
