// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once

var feng = spr_playerStandForward;
var axel  = spr_robotWalkRight;
var ren = spr_tree;
var a = 1;//*** important make this array local 

a[0,0] = feng;
a[1,0] = ren;
a[2,0] = axel;
a[3,0] = axel;
a[4,0] = feng;
a[5,0] = ren;
a[6,0] = axel;
a[7,0] = feng
a[8,0] = axel;
a[9,0] = feng;
a[10,0] = axel;
a[11,0] = feng;
a[12,0] = ren;
a[13,0] = feng;

a[0,1] = "* Guys, there’s another weird animal running\n around.";
a[1,1] = "* Excellent! Get closer and take a picture.";
a[2,1] = "* Absolutely not. We have no idea what any\n of these creatures are capable of." 
a[3,1] = "* The safest thing to do would be to hide and\n observe—";
a[4,1] = "* Ah, wait. It saw me.";
a[5,1] = "* Crap, really?";
a[6,1] = "* Alright, stay calm. What is it doing?";
a[7,1] = "* It’s...staring?  ";
a[8,1] = "* Just back away slowly. Don’t turn and run.";
a[9,1] = "* What?";
a[10,1] = "* Listen, Feng! Back away.";
a[11,1] = "* Uh... I think I may have left out\n some important information.";
a[12,1] = "* Like what?";
a[13,1] = "* This creature...";

return a;