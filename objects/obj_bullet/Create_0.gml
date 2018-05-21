/// @description Insert description here
// You can write your code in this editor

dirx = obj_player.x;
diry = obj_player.y;

friendly_fire = 0;

direction = point_direction(x,y,dirx,diry);
direction += random(16)-8;

time = 0;

cnt_damage=0;

speed = 5;
