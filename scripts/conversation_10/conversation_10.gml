// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once
var feng = spr_playerStandForward;
var axel  = spr_axel;
	var ren = spr_ren;
var a = 1;//*** important make this array local 

a[0,0] = feng
a[1,0] = ren
a[2,0] = feng
a[3,0] = axel
a[4,0] = ren
a[5,0] = feng

a[0,1] = "* Hey, guys."
a[1,1] = "* Oh, look. Feng’s not dead. Pay up. "
a[2,1] = "* Did you guys bet on me being dead?"
a[3,1] = "* She’s joking. I would never bet\n about something so important as your well-being. "
a[4,1] = "* He owes me two dollars. "
a[5,1] = "* Well, the joke is on you two. I’m\n seeing something really cool right now. "

return a;