/// @description Move the player

hspd = (-keyboard_check(vk_left) + keyboard_check(vk_right)) * 4;
if(!hspd) {
	vspd = (-keyboard_check(vk_up) + keyboard_check(vk_down)) * 4;
}

if(place_meeting(x + hspd, y, obj_barrier) && place_meeting(x, y + vspd, obj_barrier)) {
	while (!place_meeting(x, y + sign(vspd), obj_barrier) && !place_meeting(x + sign(hspd), y, obj_barrier)) {
        y += sign(vspd);
		x += sign(hspd);
	}
    vspd = 0;
	hspd = 0;
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

if (place_meeting(x, y, obj_enemy)) {
    vspd = 20 * -sign(vspd);
}
if (place_meeting(x + hspd, y + vspd, obj_enemy)) {
    hspd = 20 * -sign(hspd);
}

x += hspd;
y += vspd;

var atk_chosen = 0;
switch(keyboard_key) {
	case ord("1"):
		atk_chosen = 0; break;
	case ord("2"):
		atk_chosen = 1; break;
	case ord("3"):
		atk_chosen = 2; break;
	case ord("4"):
		atk_chosen = 3; break;
	case ord("5"):
		atk_chosen = 4; break;
}

if(attacks[atk_chosen] != 0) {
	curr_attack = attacks[atk_chosen];
}