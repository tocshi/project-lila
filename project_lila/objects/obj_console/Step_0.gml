/// @Description input text/execute line
if (keyboard_check_pressed(vk_enter)) {
	arg_list = split(keyboard_string, " ");
	command = arg_list[| 0];
	arg1 = arg_list[| 1];
	arg2 = arg_list[| 2];
	arg3 = arg_list[| 3];
	switch (command) {
		case "/commands":
			ds_list_add(lines, "die give commands help");
			break;
		case "/die":
			global.player.statmap[? "hp"] = 0;
			ds_list_add(lines, command + ": Player killed");
			break;
		case "/give":
			if (ds_list_size(arg_list) < 3) {
				arg2 = 1;
				show_debug_message("Setting arg2");
			}
			if (!string_is_uint(arg1) || !string_is_uint(arg2)) {
				ds_list_add(lines, INCORRECT_USAGE + help[? "give"]);
				break;
			}
			show_debug_message(array_length_1d(global.itemData));
			if (array_length_1d(global.itemData) < arg1 - 1 || !is_real(global.itemData[| arg1])) {
				ds_list_add(lines, "Invalid item id: " + arg1);
				break;
			}
			global.playerItems[arg1] += arg2;
			
			ds_list_add(lines, string(command) +": " + string(arg2) + " of Item Id " + string(arg1) + " given");
			break;
		case "/help":
			if (!is_string(help[? arg1])) {
				ds_list_add(lines, command + ": " + help[? ""]);
				break;
			}
			ds_list_add(lines, command + ": " + help[? arg1]);
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
	 if (caret > string_length(keyboard_string) ){
		 caret = string_length(keyboard_string);
	 }
}

if (keyboard_check_pressed(vk_right)) {
	 caret--;
	 if (caret < 0) {
		 caret = 0;
	 }
}
