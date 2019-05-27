/// @description Dialog Box
// See Key Press event for example on how to set text and activate a dialog box

// Todo: press key to skip running of text (in step)
// Todo: display multiple lines of text at the same time

// Basic settings for box
max_lines_of_dialog = 100
leftPadding = 140;
rightPadding = 10;
bottomPadding = 10;

width = camera_get_view_width(view_camera[0]) - leftPadding - rightPadding;
height = 50;

xOrigin = leftPadding;
yOrigin = camera_get_view_height(view_camera[0]) - height - bottomPadding;

// Probably don't need the following if we have a sprite for box
borderSize = 10;
inBoxW = width - borderSize;
inBoxH = height - borderSize;
inBox_xOrigin = xOrigin + (borderSize / 2);
inBox_yOrigin = yOrigin + (borderSize / 2);

// dialog display properties
avatar_xOrigin = inBox_xOrigin + 20;
avatar_yOrigin = inBox_yOrigin + 20;

text_xOrigin = avatar_xOrigin + 30;
text_yOrigin = inBox_yOrigin + 8;


// initialize text info
for (var i = 0; i < max_lines_of_dialog; i++) {
	dialog[i, 0] = -1; //sprite index
	dialog[i, 1] = ""; //dialog
}

active = false; // set to true to make visible
dialogCount = 0; // total number of dialog lines
dialogIndex = 0; // current dialog index in conversation, increments one by one
currCharIndex = 1; // current char index, increments one by one
spriteToDisplay = -1; // initial value
stringToDisplay = ""; // initial value

avatarScale = sprite_get_height(currCharIndex) / inBoxH;