/// @description Interact cooldown timer
// You can write your code in this editor
// used to trigger interact cooldown
if ((!obj_player.in_cutscene) && (!in_cutscene)){
	behavior_state = 0;
	obj_player.in_interaction = false;
	interact_potential = 1;
}