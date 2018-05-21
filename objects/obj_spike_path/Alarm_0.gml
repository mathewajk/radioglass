/// @description Insert description here
// You can write your code in this editor
var horizontal = abs(dest_y - start_y) < abs(dest_x - start_x);


if (horizontal) {
	curr_x += dest_x > start_x? 14 : -14;
	curr_y += abs(tan(spike_dir / 180 * pi)) * 14 * (dest_y > start_y? 1 : -1);
	if (position_meeting(curr_x, curr_y, obj_barrier)) {
		instance_destroy(id);
	} else {
		instance_create_layer(curr_x, curr_y, "instances_player", obj_spike);
	}
} else {
	curr_y += dest_y > start_y? 14 : -14;
	curr_x += 14 / abs(tan(spike_dir / 180 * pi)) * (dest_x > start_x? 1 : -1);
	if (position_meeting(curr_x, curr_y, obj_barrier)) {
		instance_destroy(id);
	} else {
		instance_create_layer(curr_x, curr_y, "instances_player", obj_spike);
	}
}

spike_count -= 1;
if (spike_count > 0) {
	alarm[0] = time_between_spikes;	
} else {
	instance_destroy(id);	
}