// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once

var feng = spr_playerStandForward;
var axel  = spr_robotWalkRight;
var ren = spr_tree;
var a = 1;//*** important make this array local 

a[0,0] = feng;
a[1,0] = axel;
a[2,0] = ren;
a[3,0] = feng;
a[4,0] = ren;
a[5,0] = axel;
a[6,0] = ren;
a[7,0] = feng;
a[8,0] = axel;


a[0,1] = "* Never mind. It ran off.";
a[1,1] = "* That’s very fortunate. Just because it’s small\n doesn’t mean it can’t be dangerous.";
a[2,1] = "* Yeah, stuff’s weird up here. Right?" 
a[3,1] = "* I guess... well, it changed color?\n Or it flashed some colors at me. ";
a[4,1] = "* Wait, that’s super cool. Go check it out!";
a[5,1] = "* No.";
a[6,1] = "* Yes.";
a[7,1] = "* I’m going!";
a[8,1] = "* ...";

return a;
