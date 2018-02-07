/// @description Draw light around player
// You can write your code in this editor

surface_set_target(global.light);

draw_clear_alpha(c_black,0.20)
gpu_set_blendmode(bm_subtract);

draw_sprite_ext(spr_light, 0, obj_player.x, obj_player.y, 10, 10, 0, c_white, 1);

gpu_set_blendmode(bm_normal);
surface_reset_target()

if(surface_exists(global.light)) {
	draw_surface(global.light,0,0)
}
else {
	global.light = surface_create(view_wview[0],view_hview[0]);
}