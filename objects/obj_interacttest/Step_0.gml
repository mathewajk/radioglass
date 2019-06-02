/// @description Insert description here
// This enemy goes around in circles and shoots bullets at the player

if(obj_player.deflecting)
	{
		deflectEnemy(obj_player, self, 70);
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

if (cd >= 1){
	cd-=1;
}


/* //creates bullet
var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);

if (dist_to_player < 200){
	path_speed = 0.5;
	if (cd == 0) {
		instance_create_layer(x,y,"instances_bullet",obj_bullet);
		cd = 25;
	}
} else {
	path_speed = 1.2;	
}

/*
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

if (place_meeting(x + hspd + sign(hspd), y, obj_rock)) {
	hspd = obj_rock.hspeed;
}
if (place_meeting(x, y + vspd + sign(vspd), obj_rock)) {
	vspd = obj_rock.vspeed;
}
*/

if(place_meeting(x, y, obj_barrier) && place_meeting(x, y, obj_rock))
{
	hp = 0;
}


/*
x += hspd;
y += vspd;
*/
var coll = instance_place(x, y, obj_damage);
// -- instance_place checks if the enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5

if(coll && state = 0) {
	show_debug_message("Hit!! " + string(id));
	hp -= 1; // increased damage from 5 to 10
	
	state = 1;
	alarm[1] = 10; //10 frames of invulnerability
	
	// only deal damage to enemy if it collides with a damage object
	// and if the damage object that collides with the enemy now has a different id
	// than the previous collided object
}	

//Code to run away from player

if(!(obj_player.flashp)) {
deltaDistance = obj_player.x - x;
	if (abs(deltaDistance)<150)  
	{
		if(!flash_cycle)
		{
			color = c_aqua;
			alarm[2] = 7;
			flash_cycle = 1;
		}
		var inst;
		inst = instance_nearest(x, y, obj_player);
		mp_potential_step(-inst.x, -inst.y, 3+random(1)*.5, false);

		sprite_index = spr_glo_cyanalarm;
    } 
	else {
		if (abs(deltaDistance)<200) 
		{
			if(!flash_cycle)
			{
				color = c_fuchsia;
				alarm[2] = 12;
				flash_cycle = 1;
			}
			sprite_index = spr_glo_pinkwarn;
		}
		else
			glow_state = 0;
		speed=0;
		sprite_index = spr_ratcalm;
		var _dir = irandom(359);
		var _spd = irandom(1);
		motion_add(_dir, _spd);
	}
} 
else { 
	speed = 0;
	sprite_index = spr_ratcalm;	
	var _dir = irandom(359);
	var _spd = irandom(1);
	motion_add(_dir, _spd);
}
   
/*
dirx = -obj_player.x;
diry = -obj_player.y;


direction = point_direction(x,y,dirx,diry);



deltaDistance = obj_player.x - x;

	if (abs(deltaDistance)<150)  
	{
		speed = 3;
	} else if (abs(deltaDistance)>200) {
		speed=0;
	}


/*

var ex, ey;
ex = instance_nearest(x, y, enemy).x;
ey = instance_nearest(x, y, enemy).y;

with (instance_create(x, y, obj_Missile))
	{
	direction = point_direction(x, y, ex, ey);
	}
if(keyboard_check(vk_backspace)) {
	vs = (obj_player.h_dir)*.3;
	hs = (obj_player.v_dir)*.3;
	
	deltaDistance = obj_player.x - x;

	if (abs(deltaDistance)<90)  
	{
		x += hs;
		y += vs;
	}
}*/


/* CODE TO FOLLOW PLAYER

if(abs(obj_player.x - x) < 100 && abs(obj_player.y - y) < 100) {
	mp_potential_step(obj_player.x, obj_player.y, 1, false);
}
else if(xx != -1 && yy != -1){
	if(point_distance(x, y, xx, yy) < 6) {
		pos++;
		if(pos = path_get_number(path)) {
			if(mp_grid_path(global.robotGrid, path, x, y, x + nextdir, y, false)) {
				pos = 1;
				path_set_kind(path, 0);
				xx = path_get_point_x(path, pos);
				yy = path_get_point_y(path, pos);
				
				if(xx > x) {
					sprite_index = spr_robotWalkRight;
				} else {
					sprite_index = spr_robotWalkLeft;
				}
				
				nextdir *= -1;
			}
			else {
				xx = -1;
				yy = -1;
			}
		}
		else {
			xx = path_get_point_x(path, pos);
			yy = path_get_point_y(path, pos);
		}
	}

	mp_potential_step(xx, yy, 1, false);
}

if(hp <= 0) {
	instance_destroy(id);
}*/
