/// @description Initialize player
// You can write your code in this editor

xspeed = 4;
yspeed = 4;

hdir = 0; //horizontal direction
vdir = 0; //vertical direction 

last_valid_x_dist = 0;
last_valid_y_dist = 0;

last_valid_x_sign = 0;
last_valid_y_sign = 0;

last_x_dir = 0;
last_y_dir = 0;

curr_attack = 1; //toggle between path and radius attack
curr_bullet = 2; //toggle between different bullets
num_bullets = 2;
attacks = [1, 2, -1, -1, -1, -1, -1, -1, -1]; //what is this array? 


state = 0;
snap = 1;

hp = 100;
nrg = 100;

dodge_cost = 75;
//dodge_cool = true;
dodge_length = 16;

last_dir = 0;