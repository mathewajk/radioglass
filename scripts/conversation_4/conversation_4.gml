// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once
var feng = spr_playerStandForward;
var axel  = spr_robotWalkRight;
var ren = spr_tree;
var a = 1;//*** important make this array local 

a[0,0] = feng
a[1,0] = ren
a[2,0] = feng
a[3,0] = axel
a[4,0] = axel
a[5,0] = ren
a[6,0] = feng
a[7,0] = ren
a[8,0] = feng
a[9,0] = ren
a[10,0] = feng

a[0,1] = "* There’s more!"
a[1,1] = "* How many? Go check them out!"
a[2,1] = "* Tons! And another one just flashed a\n different color!"
a[3,1] = "* Hmm. Color flashing. Isn’t that similar to what\n those ooze-like organisms did?"
a[4,1] = "* The ones near the garbage heaps?"
a[5,1] = "* Go check them out!"
a[6,1] = "* Yeah. Well, maybe? I don’t know. Those\n just kinda changed colors all the time. "
a[7,1] = "* Feng can you please go check these things\n out I’m dying over here. "
a[8,1] = "* Uh, okay. I think they’re a little scared\n of me, still."
a[9,1] = "* Well, then figure out how to make them\n not-scared of you!"
a[10,1] = "* Really? How?"

return a;