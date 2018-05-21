/// @description Insert description here
// You can write your code in this editor

if(fade) {
	if (alpha < 1) {
		alpha += 1/fade_frames
	}
	draw_set_alpha(alpha)
	draw_set_color(c_black)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_alpha(1)
}