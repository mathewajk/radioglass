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
a[4,0] = feng
a[5,0] = axel
a[6,0] = feng
a[7,0] = ren
a[8,0] = feng
a[9,0] = ren
a[10,0] = feng

a[0,1] = "* I think I made a few friends today."
a[1,1] = "* Wow, are you replacing us already?"
a[2,1] = "* Ha, ha. No, the glowdents let me into their home.\n It’s...actually really nice in here."
a[3,1] = "* That’s impressive. Hopefully it didn’t take too long. "
a[4,1] = "* Oh, wait. From the other side of the lair!\n There’s light coming in! I think I can see a path! "
a[5,1] = "* What’s on the other side?"
a[6,1] = "* No idea—I don’t think I’ve been this way before."
a[7,1] = "* What are you waiting for? Go see what’s out there!"
a[8,1] = "* Yeah!...Well, I’m gonna spend a few more minutes\n in this place. I want to sketch it, so I don’t forget it. "
a[9,1] = "* And then?"
a[10,1] = "* Onwards!"

return a;