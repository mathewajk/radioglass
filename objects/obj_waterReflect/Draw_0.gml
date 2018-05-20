/// @description Insert description here
// code taken from https://www.youtube.com/watch?v=fglRVFczf_I
var layer_id = layer_tilemap_get_id("water_layer");

surface_set_target(water_surface);

//-----------------------------
//Drawing the tilemap
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);

draw_tilemap(layer_id, - cx, -cy);

//-----------------------------------
//Drawing the reflection 

with (obj_player){
	var yoff = (sprite_height - sprite_yoffset-2) * 2;

	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

	draw_sprite_ext(sprite_index, image_index, x - cx, (y+yoff) - cy, image_xscale, -image_yscale,0,-1,0.6);
}


with (obj_parentReflect){
	var yoff = (sprite_height - sprite_yoffset) * 2;

	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);

	draw_sprite_ext(sprite_index, image_index, x - cx, (y+yoff) - cy, image_xscale, -image_yscale,0,-1,0.6);
}

gpu_set_blendmode(bm_normal);//Resetting blendemode
surface_reset_target();


//Finally drawing the surface
draw_surface(water_surface,cx, cy);
