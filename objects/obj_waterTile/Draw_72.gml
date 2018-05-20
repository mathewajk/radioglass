/// @description Insert description here
// You can write your code in this editor
if surface_exists(water_surface){
	//If our surface exists, set the surface target to our water surface
	surface_set_target(water_surface);
	draw_clear_alpha(0,0);
	surface_reset_target();
	
} else {
	//If it does not exist, we create a surface
	var w = camera_get_view_width(view_camera[0]);
	var h = camera_get_view_height(view_camera[0]);
	water_surface = surface_create(w,h);
	show_debug_message("reflect");
}