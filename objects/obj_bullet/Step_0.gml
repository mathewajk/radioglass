/// @description Insert description here
// You can write your code in this editor



time+=1;

if(abs(x-obj_player.x)+abs(y-obj_player.y)<30){
	if(obj_player.deflecting)
	{
		direction = point_direction(x,y,mouse_x,mouse_y);
		friendly_fire = 1;
	}
	else if(not(obj_player.shield_up))
	{
	obj_player.hp -= 5;
	cnt_damage = 1;
	}
}
if(place_meeting(x, y, obj_enemy2) && friendly_fire == 1){
	obj_enemy2.hp -= 1;
	cnt_damage = 1;
}
if(place_meeting(x, y, obj_enemy3) && friendly_fire == 1){
	obj_enemy3.hp -= 1;
	cnt_damage = 1;
}
if(place_meeting(x, y, obj_enemy4) && friendly_fire == 1){
	obj_enemy4.hp -= 1;
	cnt_damage = 1;
}
if(time==60||cnt_damage==1){
	instance_destroy(id);
}
