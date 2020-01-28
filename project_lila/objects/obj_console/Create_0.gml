/// @description Insert description here
// You can write your code in this editor
CARET_DELAY = 30;
INCORRECT_USAGE = "Incorrect usage of command \n";
WIDTH = 1000;
TEXT_HEIGHT = 20;
MAX_LINE_LENGTH = 99;
MAX_LINES = 20;
HEIGHT = TEXT_HEIGHT * (MAX_LINES + 1);
LEFT_TEXT_PADDING = 10;

text = "";
active = false;
lines = ds_list_create();
caret = 0; // How far the caret is from the end
is_caret = false;
after_caret = "";
caret_text = "";

alarm[0] = CARET_DELAY;
x = 0;
y = camera_get_view_height(global.currentCamera)/2 - HEIGHT/2;

help = ds_map_create();
help[? ""] = "help: <String> command. Prints help for the given command.";
help[? "help"] = "help: <String> command. Prints help for the given command.\nHow'd you get here if you didn't know how to use the help command?";

help[? "give"] = "give: <Integer> itemId, <Integer> num.\nGives <num> of item <itemId>.\nIf <num> is not specified, default to 1";