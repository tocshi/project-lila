/// @description Insert description here
// You can write your code in this editor
CARET_DELAY = 10;
INCORRECT_USAGE = "Incorrect usage of command \n";
WIDTH = 1000;
HEIGHT = 400;
TEXT_HEIGHT = 20;

text = "";
active = false;
lines = ds_list_create();
caret = 0; // How far the caret is from the end
surface = noone;
is_caret = false;

alarm[0] = CARET_DELAY;
x = camera_get_view_x(global.currentCamera) + camera_get_view_width(global.currentCamera)/2;
y = camera_get_view_y(global.currentCamera) + camera_get_view_height(global.currentCamera)/2;

help = ds_map_create();
help[? ""] = "help: <String> command. Prints help for the given command.";
help[? "help"] = "help: <String> command. Prints help for the given command. How'd you get here if you didn't know how to use the help command?";

help[? "give"] = "give: <Integer> itemId, <Integer> num. Gives <num> of item <itemId>.\n If <num> is not specified, default to 1";