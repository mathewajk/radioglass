/// @description Insert description here
// code taken from https://www.youtube.com/watch?v=fglRVFczf_I


//check if the surface already exists
if surface_exists(water_surface) {
	//if exists, set target surface and  initialize the surface
	surface_set_target(water_surface);
	draw_clear_alpha(0,0);
	surface_reset_target();
} else {
	//if not, create a new surface
	var w = camera_get_view_width(view_camera[0]);
	var h = camera_get_view_height(view_camera[0]);

	water_surface = surface_create(w,h);
}