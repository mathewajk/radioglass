/// @description Move the player

//WASD momvent and making sure diagonal movement isn't faster
//definitely a better way to do this...

var hspd = 0;
var vspd = 0;

if keyboard_check(ord("D")) && keyboard_check(ord("W")) //upper right
{
	hspd = sqrt(8);
	vspd = -sqrt(8);
}

else if keyboard_check(ord("A")) && keyboard_check(ord("W")) //upper left
{
	hspd = -sqrt(8);
	vspd = -sqrt(8);
}

else if keyboard_check(ord("D")) && keyboard_check(ord("S")) //lower right
{
	hspd = sqrt(8);
	vspd = sqrt(8);
}

else if keyboard_check(ord("A")) && keyboard_check(ord("S"))//lower left
{
	hspd = -sqrt(8);
	vspd = sqrt(8);
}

else {
	hspd = (-keyboard_check(ord("A")) + keyboard_check(ord("D"))) * 4;
	vspd = (-keyboard_check(ord("W")) + keyboard_check(ord("S"))) * 4;
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
	show_debug_message(string(coll));
	var xx = coll.x;
	var yy = coll.y;
	var mx = (coll.x - x)
	var my = (coll.y - y);
	var l = sqrt(mx * mx + my * my);
	
	hspd = -floor(16 * (mx / l));
	vspd = -floor(16 * (my / l));
	
	show_debug_message(string(hspd) + " " + string(vspd));
	
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


//character moves too fast currently unless these lines are commented out - how to resolve? 
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

depth = -y + 16;

