/// @description Insert description here
// You can write your code in this editor

switch (facing) {
	case 1: //right
		facing = 2;
		alarm[0] = 16;
		break;  
	case 2: //down
		facing = 3;
		alarm[0] = 64;
		break; 
	case 3: //left
		facing = 4;
		alarm[0] = 16;
		break;
	case 4: //up
		facing = 1;
		alarm[0] = 64;
}
