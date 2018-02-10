/// @description Draw light around player
// You can write your code in this editor

//view_set_camera(view_current, 0);
if(!surface_exists(sfc_light)) {
	sfc_light = surface_create(view_wview[0],view_hview[0]);
}

var camera = camera_get_active();
var camera_x = camera_get_view_x(camera);
var camera_y = camera_get_view_y(camera);

surface_set_target(sfc_light);

draw_clear_alpha(c_black,0.20)
gpu_set_blendmode(bm_subtract);

draw_sprite_ext(spr_light, 0, obj_player.x - camera_x, obj_player.y - camera_y, 10, 10, 0, c_white, 1);

gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(sfc_light, camera_x, camera_y);