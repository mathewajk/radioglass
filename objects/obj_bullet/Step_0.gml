/// @description Insert description here
// You can write your code in this editor



time+=1;

if(abs(x-obj_player.x)+abs(y-obj_player.y)<30){
	obj_player.hp -= 5;
	cnt_damage = 1;
}
if(time==60||cnt_damage==1||place_meeting(x, y, obj_barrier)||place_meeting(x, y, obj_barrierSmall)){
	instance_destroy(id);
}
