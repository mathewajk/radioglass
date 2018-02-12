/// @description Move the player

hspd = (-keyboard_check(vk_left) + keyboard_check(vk_right)) * 4;
vspd = (-keyboard_check(vk_up) + keyboard_check(vk_down)) * 4;

if(hspd == 0 && vspd == 0) {
	if(x % 16 > 0 || y % 16 > 0) {
		state = snap;
	}
}
else {
	last_x_dir = sign(hspd);
	last_y_dir = sign(vspd);
	state = 0;
}

if(state == snap) {
	if(x % 16 == 0 && y % 16 == 0) {
		state = 0;
	}
	else {
		if(x % 16 != 0) {
			hspd = 4 * last_x_dir;
		}
		if(y % 16 != 0) {
			vspd = 4 * last_y_dir;
		}
	}
}

if (place_meeting(x + hspd, y, obj_barrier)) {
    while (!place_meeting(x + sign(hspd), y, obj_barrier)) {
        x += sign(hspd);
	}
    hspd = 0;
}
if (place_meeting(x, y + vspd, obj_barrier)) {
    while (!place_meeting(x, y + sign(vspd), obj_barrier)) {
        y += sign(vspd);
	}
    vspd = 0;
}
	
x += hspd;
y += vspd;

var atk_chosen = -1;
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

if((atk_chosen != -1) && attacks[atk_chosen] != -1) {
	curr_attack = attacks[atk_chosen];
	show_debug_message(string(curr_attack));
}