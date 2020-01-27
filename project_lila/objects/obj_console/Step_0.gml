/// @Description input text/execute line
if (keyboard_check_pressed(vk_enter)) {
	arg_list = split(keyboard_string + after_caret, " ");
	after_caret = "";
	command = arg_list[| 0];
	arg1 = arg_list[| 1];
	arg2 = arg_list[| 2];
	arg3 = arg_list[| 3];
	switch (command) {
		case "/commands":
			append_lines(lines, "die give commands help");
			break;
		case "/die":
			global.player.statmap[? "hp"] = 0;
			append_lines(lines, command + ": Player killed");
			break;
		case "/give":
			if (ds_list_size(arg_list) < 3) {
				arg2 = 1;
				show_debug_message("Setting arg2");
			}
			if (!string_is_uint(arg1) || !string_is_uint(arg2)) {
				append_lines(lines, INCORRECT_USAGE + help[? "give"]);
				break;
			}
			show_debug_message(ds_list_size(global.itemData));
			if (ds_list_size(global.itemData) < (arg1 - 1) || !is_real(global.itemData[| arg1])) {
				append_lines(lines, "Invalid item id: " + arg1);
				break;
			}
			global.playerItems[arg1] += arg2;
			
			append_lines(lines, string(command) +": " + string(arg2) + " of Item Id " + string(arg1) + " given");
			break;
		case "/help":
			if (!is_string(arg1)) {
				append_lines(lines, "help : " + help[? ""]);
				break;
			}
			if (!is_string(help[? arg1])) {
				append_lines(lines, command + ": is not a valid command. Use /commands to list commands");
				break;
			}
			append_lines(lines, command + ": " + help[? arg1]);
			break;
		default: ds_list_add(lines, command + " is not a valid command. Use /commands to list commands");	
	}
	if (ds_list_size(lines) > 20) {
		ds_list_delete(lines, 0);
	}
	keyboard_string = "";
	caret = 0;
	exit;
}

if (keyboard_check_pressed(vk_left)) {
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
