
/*
/// @description Expand collision object if possible

//first check for neighbor (horizontal)
var inst = instance_place(x + (image_xscale * 32), y, object_barrier);

show_debug_message("Got instance. " + string(inst));

// If next neighboring collision object is the last exit:

if (instance_position( x + (image_xscale * 32), y, object_barrier) == noone) {
   inst = noone;
}

// Repeat until done
while (inst != noone) {
    image_xscale += 1; // Scale current object
	
    with (inst) instance_destroy(); // Destroy neighbor

    // Check if our neighbor is last
    if (instance_position(x + (image_xscale * 32) + 32, y, object_barrier) == noone) {
        inst = noone; // If last than break
        break;
    }
    else {
        inst = instance_position(x + (image_xscale * 32), y, object_barrier); // Find new neighbor
    }
}
   

// Vertical checking occurs only if the x scale didn't change

if (image_xscale==1) { 
	
// First check for vertical neighbor
var inst = instance_place(x, y + (image_yscale * 32), object_barrier);

// Repeat until done
while (inst != noone) {
    image_yscale += 1; // Set our y-scale +1
    if (inst.image_xscale==1) { // If our neighbor xscale is 1 then destroy it; otherwise leave.
        with (inst) instance_destroy();
    }
   
    inst = instance_position(x, y + (image_yscale * 32), object_barrier) //check for another neighbor
    }
}
*/