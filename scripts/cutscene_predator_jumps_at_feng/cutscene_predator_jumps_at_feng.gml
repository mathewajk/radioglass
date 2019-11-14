   
t_scene_info1 = [[cutscene_move_character,inst_4F8B4CAA, obj_player.x + 10, obj_player.y - 10, false, 5]];
t_scene_info2 = [[cutscene_move_character,obj_player, obj_player.x, obj_player.y + 40, false, 3.5]];

var this1 = instance_create_layer(0,0,"Instances_trigger", obj_trigger);
var this2 = instance_create_layer(0,0,"Instances_trigger", obj_trigger);

this1.concurrent = true;
this1.t_scene_info = t_scene_info1;
this2.concurrent = true;
this2.t_scene_info = t_scene_info2;

this1.triggered = true;
this2.triggered = true;


cutscene_end_action();
