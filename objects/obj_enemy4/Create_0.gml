/// @description Insert description here
// You can write your code in this editor


hp = 3;
hits = hp;
last_coll = -1;
player_damage_cd = 0;
state = 0;
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

