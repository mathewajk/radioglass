///@description glodentFlash_create
///@arg x
///@arg y
///@arg color
var glow_color = argument0;

var flash_inst = instance_create_layer(x, y, "instances_bullet", obj_glodentGlow);
// set the flasher, determined by which object is calling this function
flash_inst.flasher = self; 

with (flash_inst) {
	color = glow_color;
}

return flash_inst;