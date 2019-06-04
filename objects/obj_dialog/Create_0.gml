/// @description Dialog Box
// See Key Press event for example on how to set text and activate a dialog box

// Todo: press key to skip running of text (in step)


frames_per_char = 1;
key_for_new_line = ord("T");

// Basic settings for box
max_lines_of_dialog = 100;
leftPadding = 140;
rightPadding = 10;
bottomPadding = 10;

screen_width = camera_get_view_width(view_camera[0]);
screen_height = camera_get_view_height(view_camera[0]);

width = screen_width - leftPadding - rightPadding;
height = 50;

xOrigin = leftPadding;
yOrigin = screen_height - height - bottomPadding;

// Probably don't need the following if we have a sprite for box
borderSize = 6;
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

// Other initialization settings
frames_waited = frames_per_char; // for coordinating with frames_per_char
avatarScale = 1;
active = false; // set to true to make visible
dialogCount = 0; // total number of dialog lines
dialogIndex = 0; // current dialog index in conversation, increments one by one
currCharIndex = 1; // current char index, increments one by one
spriteToDisplay = -1; // initial value
stringToDisplay = ""; // initial value
text_font = -1

