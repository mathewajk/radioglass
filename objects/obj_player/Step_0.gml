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