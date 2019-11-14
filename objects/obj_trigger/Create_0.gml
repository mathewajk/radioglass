/// @description Start a predefined cutscene when touched by player

// You can write your code in this editor

t_scene_info = -1; 
/* Define the cutscene as a list of events 
e.g.
t_scene_info = [
	[create_box_at_mouse],
	[cutscene_change_variable,obj_player,"control",false],
	[cutscene_move_character,obj_player,200,200,true,4],
	[cutscene_change_variable,obj_player,"control",true],	
	[create_box_at_mouse],
	[cutscene_move_character,obj_player,10,10,true,4],
	[create_box_at_mouse],
];
*/

triggered = false; //use to trigger the cutscene by cutscene_activate_trigger, without player's touching it

concurrent = false; //whether this cutscene can run concurrently with another cutscene


