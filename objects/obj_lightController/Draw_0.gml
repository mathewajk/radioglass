/// @description Draw light around player
// You can write your code in this editor


if(!surface_exists(sfc_light)) {
	sfc_light = surface_create(view_wview[0],view_hview[0]);
}

// Without this, the camera's position is always zero - WHY?
// TODO: Figure out the real issue
surface_set_target(sfc_light);
surface_reset_target();

var camera_x = camera_get_view_x(0);
var camera_y = camera_get_view_y(0);

surface_set_target(sfc_light);

draw_clear_alpha(c_black,0.20)
gpu_set_blendmode(bm_subtract);

draw_sprite_ext(spr_light, 0, obj_player.x - camera_x, obj_player.y - camera_y, 10, 10, 0, c_white, 1);

gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(sfc_light, camera_x, camera_y);