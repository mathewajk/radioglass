/// @description Insert description here
// You can write your code in this editor
dialogue = 0;
hp = 3;
hits = hp;
cd = 30;
player_damage_cd = 0;
mood = random_range(1, 1000);
flash_cycle = 0; // 
glow_state = 0; // 1 if the glowing sprite is showed
color = c_yellow;

/*
facing = 1;
*/
/*
alarm[0] = 80;
*/
last_coll = -1;
coll_state = 0;

behavior_state = 0;
// states:
// 0: idle;
// 1: alarmed;
// 2: escaping;
observe_radius = 220;
alarm_radius = 150;
escape_radius = 80;
escape_cooldown = 0;


// add light object
glow_inst = glodentGlow_create(glodentColor.none);


//path_start(path_enemy4, 1.2, path_action_continue, true);
path = path_add();

startx = x;
starty = y;
nextdir = 128;

pos = 1;
if(mp_grid_path(global.robotGrid, path, x, y, x + nextdir, y, false)) {
	path_set_kind(path, 0);
	xx = path_get_point_x(path, pos);
	yy = path_get_point_y(path, pos);
	nextdir *= -1;
}
else {
	xx = -1;
	yy = -1;
}


in_cutscene = false;
spr_walk = spr_ratalarmed;
spr_idle = spr_ratcalm;