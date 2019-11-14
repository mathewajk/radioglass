/// @description Automoatically created by trigger object to execute cutscene; 
/// @description also prevent racing of cutscenes, i.e. undesired concurrency
// You can write your code in this editor

scene_info = -1;
scene = 0;

timer = 0;

in_dialog = -1;

x_dest = -1;
y_dest = -1;


pause = false; //used by cutscene_pause script
