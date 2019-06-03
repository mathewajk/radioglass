///@description cutscene_move_camera
///@arg obj 
///@arg x 
///@arg y
///@arg relative? 
///@arg smoothly?
///@arg spd 



var obj = argument0,relative =argument3, smooth = argument4,spd = argument5;
var view = 0


if (obj.x == -1){
	obj.x = camera_get_view_x(view_camera[view]);
	obj.y = camera_get_view_y(view_camera[view]);
}



if(x_dest == -1){
	if (relative){
		x_dest = obj.x + argument1;
		y_dest = obj.y + argument2;
	} else {
		x_dest = argument1;
		y_dest = argument2;		
	}
}




var xx = x_dest;
var yy = y_dest;

with(obj){
	if(point_distance(x,y,xx,yy) >= spd){
		var dir = point_direction(x,y,xx,yy);
		var ldirx = lengthdir_x(spd, dir);
		var ldiry = lengthdir_y(spd, dir);
		x += ldirx;
		y += ldiry;
		camera_set_view_pos(view_camera[view], x, y);
	} else { 
		x = xx;
		y = yy;
		camera_set_view_pos(view_camera[view], x, y);
		x = -1;
		y = -1;		
		with(other){
			x_dest = -1;
			y_dest = -1;
			cutscene_end_action();
		}
	}
}

