// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once

var feng = spr_playerStandForward;
var axel  = spr_axel;
	var ren = spr_ren;
var glodent_calm = spr_ratcalm;
show_debug_message("run conversation2")

var a = 1;//*** important make this array local 

a[0,0] = feng;
a[1,0] = glodent_calm;
a[2,0] = axel;
a[3,0] = ren;
a[4,0] = feng;
a[5,0] = ren;
a[6,0] = feng;

a[0,1] = "* ...is not large.";
a[1,1] = "* ?";
a[2,1] = "* ..." 
a[3,1] = "*  ...hey. How big is this thing exactly?";
a[4,1] = "* Uhh…about the size of a rat. If it\n stood on two legs, it might reach my knee.";
a[5,1] = "* Okay. See. That’s the kind of thing\n you gotta say first.";
a[6,1] = "* I’m gonna get closer.";

return a;
