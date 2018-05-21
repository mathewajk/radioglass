/// @description Insert description here
// You can write your code in this editor
if (state == 0) {
	state = 1;
	speed = max_speed;
	direction = (360/diff_directions) * irandom(diff_directions-1);
	while (enemy5check(x, y, speed, direction, home_x1, home_y1, home_x2, home_y2)) {
		direction = (360/diff_directions) * irandom(diff_directions-1);	
	}
	alarm[0] = 120 + irandom(60);
} else if (state == 1) {
	state = 0;
	alarm[0] = 60 + irandom(90);
	speed = 0;
}