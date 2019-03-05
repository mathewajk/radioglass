/// @description Insert description here
// You can write your code in this editor
state = 0;
dialogue = 0; 
alarm[0] = 5;
home_x1 = x - 200;
home_y1 = y - 200;
home_x2 = x + 200;
home_y2 = y + 200;
// 0 - standing still
// 1 - moving aimlessly
// 2 - moves towards player
diff_directions = 16;
last_dir_to_player = 0;
taking_damage = false;

max_speed = 1.1;
max_trap_cd = 150;
trap_cd = 0;
player_damage_cd = 0;
hp = 3;
hits = hp;
