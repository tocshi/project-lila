/// @description Insert description here
// You can write your code in this editor
CARET_DELAY = 30;
INCORRECT_USAGE = "Incorrect usage of command \n";
NOT_IMPLEMENTED_YET = "Not implemented yet! We are still working on it!";
WIDTH = 1000; // Note: at 1000 WIDTH, 99 characters fit on the console. Each character is 10 units, and there are 10 units of padding.
TEXT_HEIGHT = 20;
MAX_LINE_LENGTH = 99;
MAX_LINES = 20;
HEIGHT = TEXT_HEIGHT * (MAX_LINES + 1);
LEFT_TEXT_PADDING = 10;

text = "";
active = false;
lines = ds_list_create();
history = ds_list_create();
history_cursor = 0;
caret = 0; // How far the caret is from the end
is_caret = false;
after_caret = "";
caret_text = "";

alarm[0] = CARET_DELAY;

commands = ds_list_create();
commands[| 0] = "commands\ndie\ngive\nhelp\nchangeclass\nsetcontrol\nplayerstat\n                                           page 1 of 1"; // Exactly 43 spaces to centre the "page 1 of 1" text

help = ds_map_create();
help[? ""] = "help: <String> command. Prints help for the given command.";
help[? "help"] = "help: <String> command. Prints help for the given command.\nHow'd you get here if you didn't know how to use the help command?";

help[? "give"] = "give: <Integer> itemId, <Integer> num.\nGives <num> of item <itemId>.\nIf <num> is not specified, default to 1";
help[? "commands"] = "commands: <Integer> pageNum.\nLists the available commands on page pageNum of 1.\nIf <pageNum> is not specified or is not an integer, default to 1.";
help[? "changeclass"] = "changeclass: <String> className.\nChanges the player's class to <className>";
help[? "setcontrol"] = "setcontrol: <String> controlName, <String> controlKey.\n" + NOT_IMPLEMENTED_YET;
help[? "dummystat"] = "dummystat: <String> stat, <Float> val.\nChanges the value of <stat> of the dummy to <val>."
help[? "playerstat"] = "playerstat: <String> stat, <Float> val.\nChanges the value of <stat> of the player to <val>.\nClass cannot be changed using this command, use /changeclass instead."


// Get list of player stats
PLAYER_STAT_LIST = "";
var size, key, i;
size = ds_map_size(global.player.statmap);
key = ds_map_find_first(global.player.statmap);
for (i = 0; i < size; i++;) {
	if (key != "class") {
		PLAYER_STAT_LIST += key + ", ";
	}
	key = ds_map_find_next(global.player.statmap, key);
}
PLAYER_STAT_LIST = string_delete(PLAYER_STAT_LIST, string_length(PLAYER_STAT_LIST) - 1, 2);