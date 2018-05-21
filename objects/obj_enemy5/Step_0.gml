/// @description Insert description here
// You can write your code in this editor

// deal damage to player if player gets too close
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

// check for collision with damage object
var coll = instance_place(x, y, obj_damage);
if(coll) {
	hp -= 1;
}	
// destroy if hp is less than 0
if(hp <= 0) {
	instance_destroy(id);
}

// If hit wall, wait for 1s and change to state 1 again
if (state == 1) {
	if (enemy5check(x, y, speed, direction, home_x1, home_y1, home_x2, home_y2)) {
		state = 0;
		speed = 0;
		alarm[0] = 15 + irandom(10);	
	}
}

// enter attack mode if detected player within range
var dist_to_player = point_distance(x, y, obj_player.x, obj_player.y);
var follow_range = 150; //might need to be changed
var attack_range = 120;
if (dist_to_player <= follow_range){
	state = 2;
	mp_potential_step(obj_player.x, obj_player.y, max_speed, false);
	if (dist_to_player <= attack_range){
		if (trap_cd == 0) {
			var trap_id = instance_create_layer(x, y, "instances_bullet", obj_spike_path);
			var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y);
			var enemy_curr_x = x;
			var enemy_curr_y = y;
			last_dir_to_player = dir_to_player;
			with (trap_id) {
				dest_x = obj_player.x;
				dest_y = obj_player.y;
				start_x = enemy_curr_x;
				start_y = enemy_curr_y;
				curr_x = enemy_curr_x;
				curr_y = enemy_curr_y;
				spike_dir = dir_to_player;
			}
			trap_cd = max_trap_cd;
		}
	}
}
if (state == 2 && dist_to_player > attack_range) {
	state = 0;
	home_x1 = x - 200;
	home_y1 = y - 200;
	home_x2 = x + 200;
	home_y2 = y + 200;
	speed = 0;
	alarm[0] = 5 + irandom(10);
}

if (trap_cd > 0)
	trap_cd--;