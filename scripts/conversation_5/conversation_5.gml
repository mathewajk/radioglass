// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once
var feng = spr_playerStandForward;
var axel  = spr_axel;
	var ren = spr_ren;
var a = 1;//*** important make this array local 

a[0,0] = ren
a[1,0] = feng
a[2,0] = axel
a[3,0] = feng
a[4,0] = axel
a[5,0] = ren
a[6,0] = feng

a[0,1] = "* Any luck?"
a[1,1] = "* Uh, they all just ran away again. "
a[2,1] = "* Maybe you should try moving slower?"
a[3,1] = "* No, I was doing okay this\n time! They just all left!"
a[4,1] = "* Hmm. "
a[5,1] = "* Maybe you accidentally offended them."
a[6,1] = "* Yeah, or maybe they thought I\n would eat them, or…"



return a;