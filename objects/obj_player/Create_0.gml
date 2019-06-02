/// @description Initialize player
// You can write your code in this editor

//controls
key_move_up = ord("W");
key_move_left = ord("A");
key_move_right = ord("D");
key_move_down = ord("S");
key_dodge = vk_space;
key_deflect = ord("R");
key_shield = vk_shift;
key_path = ord("1");
key_fan = ord("2");
key_bomb = ord("3");
key_flashp = ord("P");

controller_dodge = gp_face1;
controller_deflect = gp_face2;
controller_shield = gp_face3;
controller_path = gp_padd;
controller_fan = gp_padu;
controller_bomb = gp_padl;
controller_bullet = gp_stickr;
controller_cancel = gp_shoulderr;
controller_draw = gp_shoulderrb;


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

attacking = false;
attack_slow = false;
last_attack_dir = 1;
deflect_dir = 1;

curr_attack = 1; //toggle between path and radius attack
curr_bullet = 1; //toggle between different bullets
num_bullets = 2;
attacks = [1, 2, -1, -1, -1, -1, -1, -1, -1]; //what is this array? 

menu_open = 0;

state = 0;
snap = 1;

shield_up = false;
shield_timer = 0;
flashp= false; 

hp = 100;
nrg = 100;
nrg_cooldown = false;
nrg_timer = 1;

deflecting = false;
deflect_cost = 75;

dodge_cost = 75;
//dodge_cool = true;
dodge_length = 16;

last_dir = 0;

bomb_n = 10;
bomb_maxcd = 90;
bomb_cd = 0;

deflected = false;
deflect_x = 0; 
deflect_y = 0;
preview_on = false;

