/// @description Move the player

if (keyboard_check(vk_left)) {
	sprite_index = spr_playerWalkLeft;
}
else if (keyboard_check(vk_right)) {
	sprite_index = spr_playerWalkRight;
}
else if (keyboard_check(vk_up)) {
	//sprite_index = sprite_playerWalkBack;
}
else if(keyboard_check(vk_down)) {
	//sprite_index = sprite_playerWalkForward;
}
else {
	if (keyboard_check_released(vk_left)) {
		sprite_index = spr_playerStandLeft;
	} 
	if (keyboard_check_released(vk_right)) {
		sprite_index = spr_playerStandRight;
	}
	if (keyboard_check_released(vk_up)) {
		//sprite_index = sprite_playerStandBack;
	}
	if (keyboard_check_released(vk_down)) {
		//sprite_index = sprite_playerStandForward;
	}
}

hspd = (-keyboard_check(vk_left) + keyboard_check(vk_right)) * 4;
vspd = (-keyboard_check(vk_up) + keyboard_check(vk_down)) * 4;

if (place_meeting(x + hspd, y, obj_barrier)) {
    while (!place_meeting(x + sign(hspd), y, obj_barrier)) {
        x += sign(hspd);
	}
    hspd = 0;
}

x += hspd;

if (place_meeting(x, y + vspd, obj_barrier)) {
    while (!place_meeting(x, y + sign(vspd), obj_barrier)) {
        y += sign(vspd);
	}
    vspd = 0;
}

y += vspd;