/// @description Handle node interactions
// You can write your code in this editor

if(keyboard_check_pressed(vk_space)) {
	if(!other.active) {
		ds_list_add(object_nodeHandler.activeNodes, other);
	}
	else {
		other.sprite_index = sprite_nodeInactive;
		nodeId = ds_list_find_index(object_nodeHandler.activeNodes, other);
		ds_list_delete(object_nodeHandler.activeNodes, nodeId);
	}
}