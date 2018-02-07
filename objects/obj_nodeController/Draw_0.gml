/// @description Draw lines between active nodes
// You can write your code in this editor

if (ds_list_size(activeNodes) < 2)
	return;

for(i = 0; i < ds_list_size(activeNodes) / 2; i++) {
	x1 = ds_list_find_value(activeNodes, i).x;
	y1 = ds_list_find_value(activeNodes, i).y;
	x2 = ds_list_find_value(activeNodes, i + 1).x;
	y2 = ds_list_find_value(activeNodes, i + 1).y;
	
	draw_line_width_color(x1, y1, x2, y2, 10, c_lime, c_lime);
	draw_sprite(spr_nodeActive, 0, x1, y1);
	draw_sprite(spr_nodeActive, 0, x2, y2);
}