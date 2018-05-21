/// @description Insert description here
// You can write your code in this editor
global.robotGrid = mp_grid_create(0, 0, room_width / 16, room_height / 16, 16, 16);
mp_grid_add_instances(global.robotGrid, obj_barrier, false);