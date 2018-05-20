/// @description Insert description here
// You can write your code in this editor

v = 6;
var coll = instance_place(x,y,obj_slow);
if (coll) {
	if (visible)
		v = 2;
	else 
	{
		show_debug_message("Visible!! " + string(id));
		alarm[1] = room_speed*10;
	}
}

if(abs(obj_player.x - x) < 100 && abs(obj_player.y - y) < 100) {
	mp_potential_step(obj_player.x, obj_player.y, 2, false);
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
					sprite_index = spr_robotStandRight;
				} else {
					sprite_index = spr_robotStandLeft;
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

	mp_potential_step(xx, yy, 2, false);
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

coll = instance_place(x, y, obj_damage);
// -- instance_place checks if the enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5
if(coll && state = 0) {
	if (visible){
		show_debug_message("Hit!! " + string(id));
		hp -= 1;
	
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

if(hp <= 0) {
	instance_destroy(id);
}

depth = -y + 16;
