
	/// @description Move the player

	//WASD momvent and making sure diagonal movement isn't faster
	//definitely a better way to do this...

	//if(hp <= 0) {
	//	room_goto(room_title);
	//}

if (!in_cutscene){
	var hspd = 0;
	var vspd = 0;

	var v_dir = 0;
	var h_dir = 0;
	var dodge = 0;
	var deflect = 0;
	var shield = 0;

	if(gamepad_is_connected(0))
	{
		if(abs(gamepad_axis_value(0, gp_axislv)) > 0.1) 
			v_dir = gamepad_axis_value(0, gp_axislv);
		if(abs(gamepad_axis_value(0, gp_axislh)) > 0.1) 
			h_dir = gamepad_axis_value(0, gp_axislh);
		dodge = gamepad_button_check_pressed(0, controller_dodge);
		deflect = gamepad_button_check_pressed(0, controller_deflect);
		shield = gamepad_button_check(0, controller_shield);
	}
	else
	{
		v_dir = -(keyboard_check(key_move_up) | keyboard_check(vk_up)) + keyboard_check(key_move_down) | keyboard_check(vk_down);
		h_dir = -(keyboard_check(key_move_left) | keyboard_check(vk_left)) +  keyboard_check(key_move_right) | keyboard_check(vk_right);
		dodge = keyboard_check_pressed(key_dodge);
		deflect = keyboard_check_pressed(key_deflect);
		shield = keyboard_check(key_shield);
	}




	//deflect code
	if(deflect && deflect_cost <= nrg && !deflecting)
	{
		deflecting = true;
		nrg -= deflect_cost;
		nrg_cooldown = true;
		alarm[2] = 60;
	}


	//shield code
	if(shield && nrg > 0)
	{
		shield_up = true;
	}
	else
	{
		shield_up = false;
	}

	if(shield_up)
	{
		shield_timer += 0.05;
		nrg -= shield_timer;
		nrg_cooldown = true;
	}
	else
	{
		if(shield_timer > 0 && nrg_timer == 0)
		shield_timer -= 0.01;
	}
	//show_debug_message(shield_timer);

	if(h_dir !=0 && v_dir != 0) { // Moving diagonally
	    hspd = h_dir * sqrt(8);
		vspd = v_dir * sqrt(8);
	
	}
	else {
		hspd = h_dir * 4;
		vspd = v_dir * 4;
	}

	if (deflected){
		hspd = deflect_x*4/sqrt((deflect_x*deflect_x)+(deflect_y*deflect_y));
		vspd = deflect_y*4/sqrt((deflect_x*deflect_x)+(deflect_y*deflect_y));
	}
	if (place_meeting(x,y,obj_explosion) && (!deflected)){
		deflect_x = x - obj_explosion.x;
		deflect_y = y - obj_explosion.y;
		if (deflect_x != 0 || deflect_y != 0){
			deflected = true; 
			alarm[5] = room_speed*3;
		}
	}



	//add dodge mechanics--tony
	if (dodge) {
	
		if (dodge_cost <= nrg){
			hspd = dodge_length*hspd;
		    vspd = dodge_length*vspd;
			if(!place_meeting(x + hspd, y + vspd, obj_barrier))
			{
			nrg = nrg - dodge_cost;
			nrg_cooldown = true;
			}
			//alarm[0] = room_speed*7;
		}
	}	


	/* Old snapping code in case we need it
	if(hspd == 0 && vspd == 0) {
		if(x % 16 > 0 || y % 16 > 0) {
			state = snap;
			show_debug_message("Snapping.");
		}
	}
	else {
		// default to positive snap until I think of something better
		last_x_dir = (sign(hspd) != 0) ? sign(hspd) : 1;
		last_y_dir = (sign(vspd) != 0) ? sign(vspd) : 1;
		state = 0;
	}
	*/

	//check position for collision w/ instance or all instances of obj
	var coll = instance_place(x, y, obj_enemy); 
	if(coll) {	
		//show_debug_message(string(coll));
		var xx = coll.x;
		var yy = coll.y;
		var mx = abs(coll.x - x)
		var my = abs(coll.y - y);
		var l = sqrt(mx * mx + my * my);
	
		hspd = -floor(16 * (mx / l));
		vspd = -floor(16 * (my / l));
	
		//show_debug_message(string(hspd) + " " + string(vspd));
	
		last_x_dir = (sign(hspd) != 0) ? sign(hspd) : 1;
		last_y_dir = (sign(vspd) != 0) ? sign(vspd) : 1;
	}

	/* Old snapping code in case we need it
	if(state == snap) {
		if(x % 16 == 0 && y % 16 == 0) {
			state = 0;
			show_debug_message("End snap.");
		}
		else {
			if(x % 16 != 0) {
				show_debug_message("X pre-snap:" + string(x));
				if(x % 16 < 4) {
					hspd = (x % 16) * last_x_dir;
				}
				else {
					hspd = 4 * last_x_dir;
				}
			}
			if(y % 16 != 0) {
				show_debug_message("Y pre-snap:" + string(y));
				if(y % 16 < 4) {
					vspd = (y % 16) * last_y_dir;
				}
				else {
					vspd = 4 * last_y_dir;
				}
			}
		}
	}
	*/

	if (attack_slow) { // slows speed down to 1 when attacking
		if(h_dir !=0 && v_dir != 0) { // Moving diagonally
		    hspd = h_dir * sqrt(0.5);
			vspd = v_dir * sqrt(0.5);
	
		}
		else {
			hspd = h_dir;
			vspd = v_dir;
		}
	}


	if (place_meeting(x + hspd + sign(hspd), y, obj_barrier) || place_meeting(x + hspd + sign(hspd), y, obj_spike)) {
	    hspd = 0;
		deflected = false;
	}
	if (place_meeting(x, y + vspd + sign(vspd), obj_barrier) || place_meeting(x, y + vspd + sign(vspd), obj_spike)) {
	    vspd = 0;
		deflected = false;
	}
	if (place_meeting(x + hspd + sign(hspd), y, obj_rock)) {
		hspd = obj_rock.hspeed;
		deflected = false;
	}
	if (place_meeting(x, y + vspd + sign(vspd), obj_rock)) {
		vspd = obj_rock.vspeed;
		deflected = false;
	}
	if(place_meeting(x, y, obj_barrier) && place_meeting(x, y, obj_rock))
	{
		hp = 0;
	}



	// not sure about this code

	//character moves too fast currently unless these lines are commented out - how to resolve? 


	x += hspd;
	y += vspd;


	var atk_chosen = -1;
	/*
	switch(keyboard_lastkey) {
		case ord("1"):
			atk_chosen = 0; show_debug_message(string(atk_chosen)); break;
		case ord("2"):
			atk_chosen = 1; show_debug_message(string(atk_chosen)); break;
		case ord("3"):
			atk_chosen = 2; show_debug_message(string(atk_chosen)); break;
		case ord("4"):
			atk_chosen = 3; show_debug_message(string(atk_chosen)); break;
		case ord("5"):
			atk_chosen = 4; show_debug_message(string(atk_chosen)); break;
	}
	*/
	if((atk_chosen != -1) && attacks[atk_chosen] != -1) {
		curr_attack = attacks[atk_chosen];
		show_debug_message(string(curr_attack));
	}




	depth = -y + 16;

	//energy bar
	var nrg_regen_rate = 0.5;
	if(nrg_cooldown)
	{
	nrg_timer = 1;
	alarm[1] = 40;
	nrg_cooldown = false;
	}
	else if(nrg < 100 && nrg_timer == 0)
	{
	nrg += nrg_regen_rate;
	}
	else if(nrg > 100)
	{
	nrg = 100;
	}

	//bomb count
	if (bomb_cd != 0) 
		bomb_cd--;
} else {

}


//set player to camera center
/*
view_xview = obj_player.x - view_wview[view_current]/2;
view_yview = obj_player.y - 15  - view_hview[view_current]/2;
camera_set_view_pos(view_camera[view_current], view_xview, view_yview);
*/