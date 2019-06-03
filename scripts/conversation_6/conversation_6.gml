// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once
var feng = spr_playerStandForward;
var axel  = spr_robotWalkRight;
var ren = spr_tree;
var a = 1;//*** important make this array local 


a[0,0] = feng
a[1,0] = ren


a[0,1] = "* ..."
a[1,1] = "* Hey, Feng! You got any ideas?"

return a;