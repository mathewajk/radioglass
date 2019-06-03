// a[i, 0]: the sprite displayed in the text box for line i of the dialog
// a[i, 1]: dialog text
// feel free to use \n to print multiple lines at once
var feng = spr_playerStandForward;
var axel  = spr_axel;
	var ren = spr_ren;
var a = 1;//*** important make this array local 

a[0,0] = axel
a[1,0] = feng
a[2,0] = axel
a[3,0] = feng
a[4,0] = axel
a[5,0] = feng
a[6,0] = axel
a[7,0] = ren
a[8,0] = axel
a[9,0] = feng
a[10,0] = ren
a[11,0] = axel
a[12,0] = ren
a[13,0] = ren
a[14,0] = axel
a[15,0] = feng
a[16,0] = ren
a[17,0] = feng
a[18,0] = ren

a[0,1] = "* ...did you hang up on us?"
a[1,1] = "* Yeah. Uh, I was getting chased by something. "
a[2,1] = "* What now?"
a[3,1] = "* Yeah, it was freaky. Sharp teeth and everything.\n I don’t think it could see, though. I can’t\n tell if it had eyes. "
a[4,1] = "* Interesting, if terrifying. Are you alright?"
a[5,1] = "* Yeah. It couldn’t tell where I was, so it left."
a[6,1] = "* Well, at least we——Ren’s giving me a look."
a[7,1] = "* Yeah."
a[8,1] = "* You’re smiling. Why are you smiling? "
a[9,1] = "* Yeah, why are you smiling? I just almost got\nt eaten!?"
a[10,1] = "* Because I figured something out and Axel didn’t. "
a[11,1] = "* Oh, really? Enlighten us. "
a[12,1] = "* Blind predator? That’s why these rodent things\n are flashing colors at each other."
a[13,1] = "* So they don’t tip off the thing\n that’s coming to eat them!"
a[14,1] = "* That...makes sense."
a[15,1] = "* And that’s why they’re so quiet!"
a[16,1] = "* See? We learned something new today. Maybe it’s\n a good thing that other creature tried to eat Feng. "
a[17,1] = "* Excuse you."
a[18,1] = "* ‘Twas a joke. A joke. "

return a;