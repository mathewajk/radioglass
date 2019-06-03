/// @description Insert description here
// You can write your code in this editor


if (!instance_exists(obj_cutscene) || concurrent){	
	if(place_meeting(x,y,obj_player)|| triggered){
		create_cutscene(t_scene_info);
		instance_destroy();
	}
}


