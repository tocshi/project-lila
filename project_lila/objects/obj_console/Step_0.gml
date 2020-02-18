/// @Description input text/execute line
// TODO: add to lines normally, as wrapping will be done in draw anyway (can remove script after)

if (keyboard_check_pressed(vk_enter)) {
	ds_list_add(history, keyboard_string + after_caret);
	history_cursor = ds_list_size(history);
	arg_list = split(keyboard_string + after_caret, " ");
	command = get_or_default(arg_list[| 0], "");
	arg1 = get_or_default(arg_list[| 1], "");
	arg2 = get_or_default(arg_list[| 2], "");
	arg3 = get_or_default(arg_list[| 3], "");
	switch (command) {
		case "/commands":
			if (!string_is_uint(arg1)) {
				arg1 = 1;				
			}
			if (arg1 >= 2) {
				ds_list_add(lines, command + ": pageNum too large. There is only 1 page.");	
			}
			ds_list_add(lines, commands[| arg1 - 1]);
			break;
		case "/die":
			global.pause = false;
			global.player.statmap[? "hp"] = 0;
			ds_list_add(lines, command + ": Player killed");
			break;
		case "/give":
			if (arg2 = "") {
				arg2 = 1;
			}
			if (!string_is_uint(arg1) || !string_is_uint(arg2)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "give"]);
				break;
			}
			show_debug_message(ds_list_size(global.itemData));
			if (ds_list_size(global.itemData) < (arg1 - 1) || !is_real(global.itemData[| arg1])) {
				ds_list_add(lines, "Invalid item id: " + arg1);
				break;
			}
			global.playerItems[arg1] += arg2;
			if (findArrayIndex(global.playerInv, arg1) == -1) {
				for (var i=0; i < array_length_1d(global.playerInv); i++) {
					if (global.playerInv[i] == 0) {
						global.playerInv[i] = arg1;
						break;
					}
				}
			}
			
			ds_list_add(lines, string(command) +": " + string(arg2) + " of Item Id " + string(arg1) + " given");
			break;
		case "/help":
			if (!is_string(arg1)) {
				ds_list_add(lines, "help : " + help[? ""]);
				break;
			}
			if (!is_string(help[? arg1])) {
				ds_list_add(lines, command + ": is not a valid command. Use /commands to list commands");
				break;
			}
			ds_list_add(lines, command + ": " + help[? arg1]);
			break;
		default: ds_list_add(lines, command + " is not a valid command. Use /commands to list commands");	
	}
	keyboard_string = "";
	after_caret = "";
	caret = 0;
	exit;
}

// Caret movement logic

if (keyboard_check_pressed(vk_left)) {
	// Caret is the distance from the end of the text input. This is done since typing updates keyboard_string internally and wont update caret
	 caret++;
	 if (caret > string_length(keyboard_string) + string_length(after_caret)){
		 caret = string_length(keyboard_string) + string_length(after_caret);
	 } else {
		 char = string_char_at(keyboard_string, string_length(keyboard_string));	 
		 after_caret = char + after_caret;
		 keyboard_string = string_delete(keyboard_string, string_length(keyboard_string), 1);
	 }
}

if (keyboard_check_pressed(vk_right)) {
	 caret--;
	 if (caret < 0) {
		 caret = 0;
	 } else {
		char = string_char_at(after_caret, 0);
		keyboard_string += char;
		after_caret = string_delete(after_caret, 1, 1);
	 }
}


// History logic

if (keyboard_check_pressed(vk_up)) {
	history_cursor--;
	if (history_cursor < 0) {
		history_cursor = 0;
	}
	caret = 0;
	keyboard_string = history[| history_cursor];
}

if (keyboard_check_pressed(vk_down)) {
	history_cursor++;
	if (history_cursor > ds_list_size(history)) {
		history_cursor = ds_list_size(history);
		keyboard_string = "";
		caret = 0;
	}
	caret = 0;
	keyboard_string = history[| history_cursor];
}